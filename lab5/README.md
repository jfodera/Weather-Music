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
   page 122 -> login system as IAM is very important, This allows for only people at RPI to Acsess the weather informatio
   page 123 -> MFA, on RPI weather website for rpi email 
   page 123 -> add documentation of security measures 
   page 146 -> canary and honey tokens 
   page 160 -> prevent Cross-site scripting, 
   page 171 -> mabye put time limited credentials on finder
   page 189 -> scan vm website and fix any errors shown 
   page 199 -> add encryption to user associated keys (like password on finder)  


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

   Added MFA so users can only acsess by adding email 
      plan: 
         sends verification email as soon as you enter email 
         split click to fetch apis and other page into o2 pages
         Will be vital: 
            <?php 
               session_start();
               include 'header.php';

               // Check if user is logged in
               if (!isset($_SESSION['user_id'])) {
                  header("Location: login.php");
                  exit();
               }
            ?>

   Prevented Path traversal 
      Prevents from going to webpage 1 to 2 
      page 118, scanning for vunerabilitiies

Citations: 
   .envs: https://medium.com/chingu/an-introduction-to-environment-variables-and-how-to-use-them-f602f66d15fa