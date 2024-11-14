Cloud Computing security guidlines 


Link to my annotations of the book: https://drive.google.com/file/d/1i_00apE6WbRuG9NAQAKIfg13fG0OMvpt/view?usp=sharing

Before Submitting:  
   put in ZAP report
   make .env on actual server


Overall Notes on book related to my server:
   No need SSRM because users cannot log in or anything like that 

   GO here if can't find anything in the book: ● The CAIQ is a standard template for CSPs to document their security and compliance controls.
   ● The CCM lists cloud security controls and maps them to multiple security and compliance
   standards. The CCM can also be used to document security responsibilities.

Possible things I can do: 
   Make registry for website; see bullets
   make a policy 
   control objs 
   add .env files for database connection 
   make cloud risk profile 
   cloud register 
   See if I voilate any compliance links 
   risk register 
   make SBOM 
   cpsm tool run it 
   add oauth 
   http required sign in 
   add sso auth, no password 
   implement alert for specific actions that locks the user out of the application.  
      like cooldown timer on finder 
   login system as IAM is very important, This allows for only people at RPI to Acsess the weather informatio
   MFA, on RPI weather website for rpi email 
   add documentation of security measures 
   canary and honey tokens 
   prevent Cross-site scripting, 
   mabye put time limited credentials on finder
   scan vm website and fix any errors shown 
   add encryption to user associated keys (like password on finder)  
      

Pick 5 Things: 
key: 
   page 41 -> Make registry for website; see bullets
   page 45 -> make a policy 
   page 46 -> control objs 
   page 57 -> add .env files for database connection √
   page 58 -> make cloud risk profile 
   page 66 -> cloud register 
   page 74 -> See if I voilate any compliance links 
   page 79 -> risk register 
   page 81 -> make SBOM 
      184
   page 94 -> cpsm tool run it 
   page 109-> add oauth 
   page 110 -> http required sign in 
   page 113 -> add sso auth, no password 
   page 121 -> implement alert for specific actions that locks the user out of the application.  
      like cooldown timer on finder 
   page 122 -> login system as IAM is very important, This allows for only people with an account to acsess site
   
   page 123 -> add documentation of security measures 
   page 146 -> canary and honey tokens 
   page 160 -> prevent Cross-site scripting, SQL injection
   page 171 -> mabye put time limited credentials on finder
   page 189 -> scan vm website and fix any errors shown 
   page 199 -> add encryption to user associated keys (like password on finder) 
   page 207 -> vunerability assesments  
   page 209 -> MFA, on RPI weather website verify Email 
   page 284 -> proper data management 


What I did: 
   Added .env file for database connection to my lab3: https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab3/
      Main files edited: 
         https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/resources/retrieveDb.php
         https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/resources/overwrite.php
         https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/resources/initInDb.php

      . Made sure to not commit to github and edited it manually within my server. I put this within my lab 3 folder. First I had to 
      install phpdotenv on the server. An issue I ran into was that it was that I was supposed to install from my main folder, and then add the composer.json and composer. 
      lock into my project directory, which I did not do initially but eventually figured out. I also had to mess with the require statments and dotenv statements (to load
      the actual .env file) because the path returned by __DIR__ was the same as the one in the require statement and I got those confused initially. This makes my VM safer as the passwords are no longer visible by just viewing the source code. 
      I learned about this on page 57 of the book. 

   Added an baseline IAM (Identity and Access Management) 
      Created username and password conventions so that only people with an account can acsess the site.
      plan: 
         connect to db 
         build register page (index)
         then login page 

      Specified on page 122

   Added MFA so users can only acsess by adding email 
      plan: 
         sends verification email as soon as you enter email, must verify to get past, once3 you do that login is good 

         enter your email: 
         *Must verify email to get past* 

         Will be vital top of any pages that sound not have acsess: 
            <?php 
               session_start();

               // Check if user is logged in
               if (!isset($_SESSION['user_id'])) {
                  header("Location: login.php");
                  exit();
               }
            ?>
         page 209 


   SCAN -> remove reds page 189 

   Prevented Path traversal 
      Prevents from going to webpage 1 to 2 in URL 

      87 -> aspect of IAM, only accounts with credentials can get to certain pointer 


   Proper Data management: 
      Do not allow for incorrect emails to be stored
      along with the same email used for 2 different accounts not allowes
      Page 284 

Citations:
    password verify unhashes: https://www.tutorialspoint.com/php/php_function_password_verify.htm#:~:text=The%20PHP%20Hashing%20password_verify(),output%20based%20on%20that%20input.
   .envs: https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa
   changing the page url in js: https://www.tabnine.com/academy/javascript/how-to-redirect-url-javascript/
   Intro To ITWS labs 
   SQL insertion: 
      https://security.stackexchange.com/questions/90040/how-to-secure-mysql-database-usernames-and-passwords-within-a-php-file
   Sanitizing email: https://www.w3schools.com/php/filter_sanitize_email.asp#:~:text=Definition%20and%20Usage,characters%20from%20an%20email%20address.
   pdo: https://www.simplilearn.com/tutorials/php-tutorial/pdo-in-php#:~:text=PDO%20in%20PHP%20(PHP%20Data,for%20accessing%20databases%20in%20PHP.
   sessions: https://www.w3schools.com/php/php_sessions.asp
Things I leaned: 
   Gap is really helpful for DIVS
   do not have to close pdo database connections
   stmt just means SQL statement
   must use execute and fetch togehter with PDO statements in order to actually retrieve things
   try and catch makes debugging a lot easier
   session start resumes session 
   session is reset when tab is closed 

