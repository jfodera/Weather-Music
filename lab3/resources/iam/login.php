
<?php 
//resumes sesh
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


//verification email 


//sending verificaiton email, returns true if worked, false if didn't and reloads page
function sendVerificationEmail($email, $token) {
   //last arg is encryption protocol, 
   //sets email configs, creating new email 

   try{
      $transport = (new Swift_SmtpTransport($_ENV['SMTP_HOST'], $_ENV['SMTP_PORT'], 'tls'))
         ->setUsername($_ENV['SMTP_USER'])
         ->setPassword($_ENV['SMTP_PASS']); 

      $mailer = new Swift_Mailer($transport);

      //yourfomain for testing, if not running in server 
      $domain = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'yourdomain.com';
      //so it gets protol right (https, http)
      $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://';
      
      // makes the link to send to our emails, url encode so it works 
      $verificationLink = $protocol . $domain . "/" . $_ENV['URL'] . "/resources/iam/verify.php?email=" . urlencode($email) . "&token=" . $token;

      //arg is subject line, text/html renders as webpage
      $message = (new Swift_Message('Verify your Weather & Music Account!'))
         //=> allows putting name 
         ->setFrom([$_ENV['SMTP_USER'] => 'Weather & Music'])
         ->setTo([$email])
         ->setBody(
            '<html>' .
            '<body>' .
            '<h1>Welcome to Weather & Music!</h1>' .
            '<p>Please click the link below to verify your account:</p>' .
            '<p><a href="' . $verificationLink . '">Verify Account Here!</a></p>' .
            '</body>' .
            '</html>',
            'text/html'
         );
   } catch (Exception $e){
      $_SESSION['error'] = "Failed to send email:" . $e->getMessage();
      header("Location: index.php");
         return false;
   }

   try {
       $result = $mailer->send($message);
       $_SESSION['mess']= "Verification Email Sent! Must verify to log in!";
       return true;
   } catch (Exception $e) {
      //adds to error log in php
      $_SESSION['error'] = "Failed to send verification email: " . $e->getMessage();
      header("Location: index.php");
       return false;
   }
}


//actually getting in 
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST"){
   //defining var
   $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
   $password = $_POST['password'];
   
   //cant happen because already setup 
   if (empty($email) || empty($password)) {
       $error = "All fields are required";
       exit();
    }else {
      //makes a query to db 
       try {
        
           $stmt = $pdo->prepare("SELECT user_id, email, is_verified, password FROM users WHERE email = ?");
           $stmt->execute([$email]);
           $user = $stmt->fetch();

           //if something is fetched (in db) (actually returned), and the password entered matches the password from the fetch 
           if ($user && password_verify($password, $user['password'])) {
               // Check if user is recorder (they don't need verification)

               //check verification, value is a boolean
                if ($user['is_verified']) {
                   $_SESSION['user_id'] = $user['user_id'];
                   $_SESSION['email'] = $user['email'];
                   
                   header("Location: ../weathMus.php");
                   exit();
                } else{
                    //User is not verified 
                    // Resend verification email if requested, uses session 
                    $_SESSION['resend_verification'] = 'init';
                    if ($_SESSION['resend_verification'] == 'set') {
                        // Generate new verification token
                        unset($_SESSION['error']); //clears var
                        $new_verification_token = bin2hex(random_bytes(32));
                        
                        // Update the token in database
                        $update_stmt = $pdo->prepare("UPDATE users SET verification_token = ? WHERE email = ?");
                        $update_stmt->execute([$new_verification_token, $email]);
                        
                        sendVerificationEmail($email, $verification_token);
                        header("Location: login.php");
                        exit();
                    } else {
                        $_SESSION['resend_verification'] = 'set'; 
                        //once page reloaded verification email will be sent
                        $_SESSION['mess'] = 'The email you entered is not verified, <a href"login.php"> click here </a> to send a verification email.';    
                        header("Location: login.php");
                        exit();
                    }
                    exit(); 
                } 
            }else{
                $_SESSION['error'] = "Account does not exist.";
                header("Location: login.php");
                exit(); 
            }
        } catch (PDOException $e) {
            //user not in db 
            $_SESSION['error'] = "Account does not exist.";
            header("Location: login.php");
            exit(); 
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
               //so they can see verif message
               if (isset($_SESSION['mess'])) {
                echo '<div class="error">' . $_SESSION['mess'] . '</div>';
                unset($_SESSION['mess']);
                }
            ?>
            <!-- Action calls the php above it to run  -->
            <form action="login.php" method="post">
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
         <a id="discLink" href="https://discord.gg/xBJHqEsM"><img id="discLogo" alt="Discord Logo" src="../discordlogo.svg"></a>
         <a id="gitLink" href="https://github.com/RPI-ITWS/ITWS-2110-F24-foderj"><img id="gitLogo" alt="Github Logo" src="../github-mark.png"></a>
         </div>
         <p id="cpright">©2024 Fodera Sites</p>
      </footer>

  </body>
</html>
