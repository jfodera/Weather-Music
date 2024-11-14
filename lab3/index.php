
<?php
session_start();
require_once '../vendor/autoload.php';

//Getting DB connnect
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '../../');
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


//form always calls using post
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
   //sanitize email removes any chars not alowed in email adress
    $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
    $password = $_POST['password'];
    
   
    
    if (empty($email) || empty($password) ) {
      // Post returns with error, doesn't even let you do that because it's built into form html
        $_SESSION['error'] = "All fields are required";
        header("Location: user_register.php");
        exit();
    }

    //error catching on the submission to database
    try {
        $stmt = $pdo->prepare("SELECT user_id FROM users WHERE email = ?");
        //subs email in for ? 
        $stmt->execute([$email]);
        //checks if actually returned anything (email is in DB) 
        if ($stmt->fetch()) {
            $_SESSION['error'] = "Email already exists";
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
        
      //   sendVerificationEmail($email, $verification_token);
        
      //change to login 
        header("Location: index.php");
        exit();
        
    } catch (PDOException $e) {
      //why post won't work, something wrong with DB (like it's table or something )
      $_SESSION['error'] = "Database error: " . $e->getMessage();
      header("Location: user_register.php");
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
            <?php if (isset($error)): ?>
                  <div class="error"><?php echo $error; ?></div>
            <?php endif; ?>
            <!-- Action calls the php above it to run  -->
            <form action="index.php" method="post">
                  <input type="email" name="email" placeholder="Email" required>
                  <input type="password" name="password" placeholder="Password" required>
                  <button type="submit" class="button button-account">Submit </button>
            </form>
            <p>Already signed up? <a href="index.php">login here</a> </p>
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
