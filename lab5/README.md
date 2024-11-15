Lab 5 Notes  

live site: https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab5

Link to my annotations of the book: https://drive.google.com/file/d/1i_00apE6WbRuG9NAQAKIfg13fG0OMvpt/view?usp=sharing

Before Submitting:  
   general testing in final state



Possible things I can do: 
   data security 
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

   All work viewable at link at top of page, most new additions in lab3 directory folder as thats where I primarily built off of. 

   Added .env file for database connection to my lab3
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
      First thing I did was create a another table in my database called users

      Note: php in page because of how form submission works

      get logged out automatically when browser is closed
      Specified on page 122

   Added MFA so users can only acsess by Verifying Email: 
      
      This was a very lengthy process that involved a lot of learning but good (all citations below). First, I added a token and boolean to my database for each user. 
      the boolean represented weather or not they had been verified and the token was for the email verification link (the structure of DB can be seen in IAM section 
      above). Then, when the user submit their signup form 
      
      plan: 
         sends verification email as soon as you enter email, must verify to get past, once you do that login is good 
         On signup, send verification when account created, notify user account created, verification email send, click here to log 
            in once verified 

         on Login: error if account not verified, auto sends email 

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
         
      Cites: page 209 


   Use an Automated VM Scanner: 
      While reading, I had a nice relatabililty moment when it told us to use automated tools to scan VM's for vunerabilities as I was planning to do this with ZAP 
      anyways to find some specific ones. Luckily I had no reds! I included the ZAP response right here: https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab5/zaplab5.png

      Cites: page 189

   Encrypted Passwords: 

      One Example of encryption used (line 118): https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/index.php
      Also used it in tls swiftmailer smtp calls (line 42): https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/resources/iam/login.php


      When making the IAM, I obviously had to store user information in the mySQL database. In the book, it put a lot of ephasis on data security, especailly on page 199, 
      so when storing the users passwords I looked up a way to hash them (cited below). THis way, I or nobody else (that can't crack a hash) has no idea what there 
      password is. This helps the lazy users stay a bit more safe as they may use the same password for everything. Also manages the user encryption keys in a good fashion
      as suggested on page 199. I also used ecryption for some of the smtp calls by using tls. 

      Cites: page 199, 26

   Prevented Path traversal:
      
      Prevents from going to webpage 1 to 2 in URL when you shouldn't be able to. The first thing I did was disabling directory listing, 
      this ensures no directories without an index.php can be seen unless travled to by links I put there. I did this by following 
      my citation below and editing the directory section of my configuration file. It now says forbidden when trying to acsess: https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab3/resources/
       Another thing I did to prevent path traversal is 
      to put headers similar to this: 
            <?php 
               session_start();

               // Check if user is logged in
               if (!isset($_SESSION['user_id'])) {
                  header("Location: login.php");
                  exit();
               }
            ?>
      at the top of files that should not be able to be acsess unless you are a user thats been authenticated by the IAM. Main edit was to file: https://github.com/RPI-ITWS/ITWS-2110-F24-foderj/blob/main/lab3/resources/weathMus.php 
      as that was my "protected page" so to speak. For example, if someone
      had not created an account and verified their email, they would not be able to view: https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab3/resources/weathMus.php . This fallows the governance policy mentioned on page 87 of the book stating "ensure that only authorized users have access to sensitive resouces 
      and can perform actions within their remit. 
      
      Cites: page 87 


   Proper Data management: 
      Do not allow for incorrect emails to be stored
      along with the same email used for 2 different accounts not allowes
      Page 284 

Citations:
    password verify unhashes: https://www.tutorialspoint.com/php/php_function_password_verify.htm#:~:text=The%20PHP%20Hashing%20password_verify(),output%20based%20on%20that%20input.
    password hashing: https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://www.php.net/manual/en/function.password-hash.php%23:~:text%3Dpassword_hash()%2520creates%2520a%2520new,algorithms%2520are%2520added%2520to%2520PHP.&ved=2ahUKEwjXpeukqN2JAxWNKVkFHX4_DI8QFnoECA4QAw&usg=AOvVaw2NTe7HNpHJZz9t9XRsTYOi
   .envs: https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa
   changing the page url in js: https://www.tabnine.com/academy/javascript/how-to-redirect-url-javascript/
   Intro To ITWS labs 
   SQL insertion: 
      https://security.stackexchange.com/questions/90040/how-to-secure-mysql-database-usernames-and-passwords-within-a-php-file
   Sanitizing email: https://www.w3schools.com/php/filter_sanitize_email.asp#:~:text=Definition%20and%20Usage,characters%20from%20an%20email%20address.
   Finder project
   pdo: https://www.simplilearn.com/tutorials/php-tutorial/pdo-in-php#:~:text=PDO%20in%20PHP%20(PHP%20Data,for%20accessing%20databases%20in%20PHP.
   sessions: https://www.w3schools.com/php/php_sessions.asp
   swiftmailer: https://mailtrap.io/blog/swiftmailer-sendmail/#Sending-a-message-with-Swift-Mailer
   smtp understanding: https://mailmeteor.com/blog/gmail-smtp-settings
   Path traversal remover: https://blog.qualys.com/vulnerabilities-threat-research/2021/10/27/apache-http-server-path-traversal-remote-code-execution-cve-2021-41773-cve-2021-42013
Things I leaned: 
   Gap is really helpful for DIVS
   do not have to close pdo database connections
   stmt just means SQL statement
   must use execute and fetch togehter with PDO statements in order to actually retrieve things
   try and catch makes debugging a lot easier
   session start resumes session 
   session is reset when tab is closed or cache reset 
   Swiftmailer: 
      must install on Webserver 
   if gets past try, skips catch and carrys on 

   require_once 'vendor/autoload.php'; -> swiftmailer and .envs 
   ERROR CATCHING IN PHP IS AMAZING 
   cannot use GMAIL as won't work with 'less secure' 
   Must use an app password on gmail to connect swiftmailer 
   if statements must exit after all conditions 
   Whenever resetting session var, must reload page
   do not need to predefine session vars 

Current: 
   



questions: 
   how are .env's not acsessible from the browser 

Future additons: 
   put send verification email in its own script
   nice messages specifying if password was wrong
   make login with verification email a tad nicer  
                    $_SESSION['resend_verification'] = 'set'; 
                    //once page reloaded verification email will be sent
                    $_SESSION['mess'] = 'The email you entered is not verified, <a href="login.php"> click here </a> to send a verification email.';    
   