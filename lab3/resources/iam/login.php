
<?php 
//still new session, not in yet 
session_start();
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
            <h2>Log in With Your Account</h2> 
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
            <p>Already signed up? <a href="login.php">login here</a> </p>
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
