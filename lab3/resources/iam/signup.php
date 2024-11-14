<?php
//form always calls using post
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
   //sanitize email removes any chars not alowed in email adress
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];
    
   //HERE
    
    if (empty($full_name) || empty($email) || empty($password) || empty($confirm_password)) {
        $_SESSION['error'] = "All fields are required";
        header("Location: user_register.php");
        exit();
    }

    // Only RPI users with a @rpi.edu email can register
    if (!preg_match('/^[a-zA-Z0-9._%+-]+@rpi\.edu$/', $email)) {
        $_SESSION['error'] = "Email must be an @rpi.edu address";
        header("Location: user_register.php");
        exit();
    }
        

    if ($password !== $confirm_password) {
        $_SESSION['error'] = "Passwords do not match";
        header("Location: user_register.php");
        exit();
    }
    
    try {
        $stmt = $pdo->prepare("SELECT user_id FROM users WHERE email = ?");
        $stmt->execute([$email]);
        if ($stmt->fetch()) {
            $_SESSION['error'] = "Email already exists";
            header("Location: user_register.php");
            exit();
        }
        
        $verification_token = bin2hex(random_bytes(32));
        
        //encrypts so cannot be seen in database 
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        
        $name_parts = explode(" ", $full_name, 2);
        $first_name = $name_parts[0];
        $last_name = isset($name_parts[1]) ? $name_parts[1] : "";
        
        $stmt = $pdo->prepare("INSERT INTO users (email, password, first_name, last_name, is_recorder, verification_token) VALUES (?, ?, ?, ?, FALSE, ?)");
        $stmt->execute([$email, $hashed_password, $first_name, $last_name, $verification_token]);
        
        sendVerificationEmail($email, $verification_token);
        
        header("Location: login.php");
        exit();
        
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database error: " . $e->getMessage();
        header("Location: user_register.php");
        exit();
    }
}
?>