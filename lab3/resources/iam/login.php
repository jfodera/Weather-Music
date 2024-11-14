
<?php 
//still new session, not in yet 
session_start();
require_once 'vendor/autoload.php';

//Getting DB connnect
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
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

//actually getting in 

// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
   //defining var
   $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
   $password = $_POST['password'];
   
   //cant happen because already setup 
   if (empty($email) || empty($password)) {
       $error = "All fields are required";
   } else {
      //makes a query to db 
       try {
         //add is verified when doing MFA
           $stmt = $pdo->prepare("SELECT user_id, email, password FROM users WHERE email = ?");
           $stmt->execute([$email]);
           $user = $stmt->fetch();

           //if something is fetched (in db) (actually returned), and the password entered matches the password from the fetch 
           if ($user && password_verify($password, $user['password'])) {
               // Check if user is recorder (they don't need verification)

               /*
               // For regular users, check verification
               else if ($user['is_verified']) {
                   $_SESSION['user_id'] = $user['user_id'];
                   $_SESSION['email'] = $user['email'];
                   $_SESSION['is_recorder'] = $user['is_recorder'];
                   
                   header("Location: dashboard.php");
                   exit();
               } if {
                   //User is not verified 
                   // Resend verification email if requested
                   if (isset($_POST['resend_verification'])) {
                       // Generate new verification token
                       $new_verification_token = bin2hex(random_bytes(32));
                       
                       // Update the token in database
                       $update_stmt = $pdo->prepare("UPDATE users SET verification_token = ? WHERE email = ?");
                       $update_stmt->execute([$new_verification_token, $email]);
                       
                       sendVerificationEmail($email, $verification_token);
                   } else {
                       
                       $error = "Please verify your email before logging in. 
                               <form method='post' style='display:inline;'>
                                   <input type='hidden' name='email' value='" . htmlspecialchars($email) . "'>
                                   <input type='hidden' name='password' value='" . htmlspecialchars($password) . "'>
                                   <input type='hidden' name='resend_verification' value='1'>
                                   <button type='submit' style='background:none;border:none;color:white;text-decoration:underline;cursor:pointer;'>
                                       Resend verification email
                                   </button>
                               </form>";
                   }
               }

               */
              header("Location: ../weathMus.php");
           } else {
               $error = "Invalid email or password";
           }
       } catch (PDOException $e) {
         //db didn't connect 
           $error = "Database error: " . $e->getMessage();
       }
   }
}
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href= "../lab3.css">
    <!-- //icon in URL -->
    <link rel="icon" href="../back.jpg" >
    <title>RPI Weather & Music</title>
  </head>
  <body>

       <!-- Header -->
      <div id="header">
         <h1>
            <span id="univTitle">
               <span class="red">R.</span><span class="white">P.</span><span class="red">I.</span>
            </span>
            Weather & Music!
         </h1>
      </div>

      <div id="firstSec">
      

         <div class="form">
            <h2>Log in with your Account</h2> 
            <!-- If database connection not made, or any errors thown on submission  -->
            <?php
               if (isset($_SESSION['error'])) {
                  echo '<div class="error">' . $_SESSION['error'] . '</div>';
                  unset($_SESSION['error']);
               }
            ?>
            <!-- Action calls the php above it to run  -->
            <form action="index.php" method="post">
                  <input type="email" name="email" placeholder="Email" required>
                  <input type="password" name="password" placeholder="Password" required>
                  <button type="submit" class="button button-account">Submit </button>
            </form>
            <p>Need to sign up? <a href="../../index.php">signup here!</a> </p>
         </div>
      </div>

     <!-- Footer -->
      <footer> 
         <div id="helpLogos" class="flex-container">
         <a id="discLink" href="https://discord.gg/xBJHqEsM"><img id="discLogo" alt="Discord Logo" src="resources/discordlogo.svg"></a>
         <a id="gitLink" href="https://github.com/RPI-ITWS/ITWS-2110-F24-foderj"><img id="gitLogo" alt="Github Logo" src="resources/github-mark.png"></a>
         </div>
         <p id="cpright">©2024 Fodera Sites</p>
      </footer>

  </body>
</html>
