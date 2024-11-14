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
         <a class="mainBut" id="startB" href="resources/weathMus.php">Click to Fetch From APIs!</a>
      </div>

      <!-- If database connection not made -->
      <?php if (isset($error)): ?>
            <div class="error"><?php echo $error; ?></div>
      <?php endif; ?>
      <!-- Action calls the php above it to run  -->
      <form action="index.php" method="post">
            <input type="email" name="email" placeholder="Email" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="button button-account">Submit </button>
      </form>

     <!-- Footer -->
      <footer> 
         <div id="helpLogos" class="flex-container">
         <a id="discLink" href="https://discord.gg/xBJHqEsM"><img id="discLogo" alt="Discord Logo" src="resources/discordlogo.svg"></a>
         <a id="gitLink" href="https://github.com/RPI-ITWS/ITWS-2110-F24-foderj"><img id="gitLogo" alt="Github Logo" src="resources/github-mark.png"></a>
         </div>
         <p id="cpright">©2024 Fodera Sites</p>
      </footer>


    <script  src="resources/jquery-3.6.1.min.js"></script>
    <script src="resources/lab3.js"></script>
  </body>
</html>
