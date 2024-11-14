<?php

//Information is transffered via url, when its entered into browser, its basically like a special call to this funciton 
//The opening of this page will take you to the log in

session_start(); 
require_once '../../vendor/autoload.php';

//Getting DB connnect
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../../');
$dotenv->load();

$host = $_ENV['DB_HOST'];
$dbname = $_ENV['DB_NAME'];
$username = $_ENV['DB_USER'];
$password = $_ENV['DB_PASS'];

//try catch so that php script doesn't end 
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    //so that I can acutually see da arrors 
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch(PDOException $e) {
   //shows database connection error
    die("Connection failed: " . $e->getMessage());
}

//get checks parameter in current URL 
if (isset($_GET['email']) && isset($_GET['token'])) {
   //moving it back to reg with sanitize
    $email = filter_var($_GET['email'], FILTER_SANITIZE_EMAIL);
    $token = filter_var($_GET['token'], FILTER_SANITIZE_STRING);
    
    try {
      //makes sure it is currently unverified 
        $stmt = $pdo->prepare("SELECT user_id FROM users WHERE email = ? AND verification_token = ? AND is_verified = 0");
        $stmt->execute([$email, $token]);
        
        //if returns something, changes var token to 1
        if ($user = $stmt->fetch()) {
            $updateStmt = $pdo->prepare("UPDATE users SET is_verified = 1, verification_token = NULL WHERE user_id = ?");
            $updateStmt->execute([$user['user_id']]);
        }
    } catch (PDOException $e) {
        $_SESSION['error'] = "Database error occurred.";
        error_log($e->getMessage());
    }
    $_SESSION['mess']= "Email has been verified! Can now log in";
    header("Location: login.php");
    exit();
} else {
   $_SESSION['mess']= "Invalid verification link.";
    header("Location: login.php");
    exit();
}

?>