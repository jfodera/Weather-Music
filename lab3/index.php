
<?php
session_start(); //resumes sesh
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
            '<p><a href="' . $verificationLink . '">Verify AccountHere!</a></p>' .
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
       $_SESSION['mess']= "Verification Email Sent. Must verify to log in!";
       return true;
   } catch (Exception $e) {
      //adds to error log in php
      $_SESSION['error'] = "Failed to send verification email: " . $e->getMessage();
      header("Location: index.php");
       return false;
   }
}

//form always calls using post
//inserting data to db 
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
   //sanitize email removes any chars not alowed in email adress
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];
    
   
    
    if (empty($email) || empty($password) ) {
      // Post returns with error, doesn't even let you do that because it's built into form html
        $_SESSION['error'] = "All fields are required";
        header("Location: index.php");
        exit();
    }

    //error catching on the submission to database
    try {
        $stmt = $pdo->prepare("SELECT user_id FROM users WHERE email = ?");
        //subs email in for ? 
        $stmt->execute([$email]);
        //checks if actually returned anything (email is in DB) 
        if ($stmt->fetch()) {
            $_SESSION['error'] = "Email Already Exists";
            //reloads and displays error
            header("Location: index.php");
            exit();
        }
        
        //for mailer 
        $verification_token = bin2hex(random_bytes(32));
        
        //encrypts so cannot be seen in database, uses default type
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        
        
        $stmt = $pdo->prepare("INSERT INTO users (email, password, verification_token) VALUES (?, ?, ?)");
        $stmt->execute([$email, $hashed_password, $verification_token]);
        
        sendVerificationEmail($email, $verification_token);
        

      //change to login 
        header("Location: resources/iam/login.php");
        exit();
        
    } catch (PDOException $e) {
      //why post won't work, something wrong with DB (like it's table or something )
      $_SESSION['error'] = "Database error: " . $e->getMessage();
      header("Location: index.php");
      exit();
    }
}

?>


<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href= "resources/lab3.css">
    <!-- //icon in URL -->
    <link rel="icon" href="resources/back.jpg" >
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

      <!-- Technically lies, API stuff not fetched until next page -->
      <div id="firstSec">
      

         <div class="form">
            <h2> Enter your Email here! </h2> 
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
            <p>Already signed up? <a href="resources/iam/login.php">login here</a> </p>
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
