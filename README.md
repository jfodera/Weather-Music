Current Link: https://foderj.eastus.cloudapp.azure.com/weather-music/

Summary: 

   This lab was a lot of shaking the rust off/learning new as we didn't do a whole bunch of php/mySQL in Intro last year. All in all I'd say I learned a lot so it was good. 
   Below is basically all of my thought processes for the entire lab. A couple places I ran into errors was in sending the JSON data in a fetch request from 
   js to my php scripts. There was defintley a learning curve there but I eventually got the hang of it. Once I figured out echos from the script can be caught by the 
   JS console, everything got a lot easier in terms of error handling. Tough project but cool for sure.


   note: in future hope to my use of apiType row

Plan: 

install mariaDB and mySQL  and phpmyadmin 

Make a database format so that the website can store the JSON objects in the database √


Make a version of the website that requires you to click a button to start, only once you click, then it fetches √
   and puts JSON obj in database
   Only use PHP fetch obj in/out of database 
   Use js for dynamically calling 
   make a js API call, call a php script to fetch API data and store it

Then after the use hits that button, and the php insert function has echod "done",√
 call a retrive/populate JavaScript function that calls a php script which recieves the current DB entry (by ID), gives it to JS, then JS inserts it into the page.
   A set of 2 database entries are made every time there are new users


Then every time a new drop down menu item in selected, a corresponsing JS function to that place is called, makes the API call (long and lat hardcoded) then calls √
   a PHP script to overwrite the database entry, just as with insert, waits till php script responds and then calls the retrive php scripts which gets the 
   current DB entry, gives it to JS, and then JS inserts it into the page 

Reasoning I took this approach was because I had dynamic updates set up in JS already adn don't really know how I would dynamically update page using inline PHP 
without refreshing 

They have a dropdown menu of other available (pre-inserted locations) that the user can select, 
   index.php:96 is where you can insert
   selecting a new location will overwrite the existing database entry 
   then a page reload should reset the data 



Before submit checklist: 
   Validation


Questions: 
how to run mysql package so I can connect to DB from js? 



Outline: 


 Regarding "putting that JSON object into a MySQL database," 
 I checked with Dr. Callahan, and he mentioned that it is up 
 to you and your fellow students to decide how you want to store 
 your data and in what format within the database

 You all installed PHPMyAdmin on your VMs during the Intro class. It was not pre-installed on the VMs—I confirmed this with him as well.

Debug: 
   sqli is not even throwing an error 
   Error handling in php and js was set up correct, issue was I was using a table name, not a database name


Things I learned: 

. is concatenation
//$_Server, returns the name of the path of the file path currrently executing 
Without Phpmyadin, mySQl is interacted with most commonly through the command line 
Only can insert into DB if valid JSON
int(10) -> 10 is the display width, not the storage size 
Don't forget to include API ID when inserting 
Node.js is a tool that basically allows js to connect to databases
Need Node.js for use of mysql package
Must have type='module' in script in order to import 
   and then must have mysql2 installed in project directory which you can only use with node.js installed 
   will see in directory that node_modules is installed 
php://input allows you to acses raw POST data -> the JSON
Send Javascript object to php, very cool 
CANNOT use console with scripts inserted as type='module'   
JSON.stringify converts JavaScript Objects into strings 
if you misstype something in the initial mysqli statement it will not throw an error that you can read 
can error handle in php by using echo  
   If JS called it, it will just return it to the JS file it called it from  
   $dbok is a way of checking if the database connection is good without stopping the rest of the HTML from working, not really neccesarry in a script where the main function is to connect to a database; no ins and outs
When make table of JSON objects, content type will say longtext, but it's JSON  
Error handling for php set up perfectly 
Always use this series of binding statements to insert into a table: 
       $insQuery = "insert into jsonObjs (`jdoc`) values(?)";
      $statement = $db->prepare($insQuery);
      $statement->bind_param("s", $data);
      $statement->execute();
      fetch_assoc() increments every call
Must decode json and convers to php array in order to modify 
Don't forget to close database
if json_encode too much, escape "'s will start to show up
If echos mult times in php script, it is just concatenated into the log 
JavaScript global variables are reset when the page is reloaded


Future improvements (Things I would have done if I had more time.): 
Use XAMPP instead of pushing to main 
   make more universal functions in js


   learn how to dymically update php inline
   
   learn how to read server logs
   Is a chance id of other entry is retrived but doesn't really matter because, same content
   Error catching for inserting into DB
   Make use of apiType row 
   learn how to use xampp for php debugging
   Delete things when the tab closes or opens in order to not overload the database, leaving it for now because it's a cool way to count users as I won't have a lot of traffic. 
      https://www.zyxware.com/articles/5732/solved-how-to-run-a-javascript-code-at-browser-closing-time#:~:text=In%20JS%20there%20is%20a,of%20callback%20function%20of%20onbeforeunload%20.
   Could put location or type for the apiType column but didn't here because was not neccesary for the functionallity.


Any challenges I came across: 

Citations:
Send Javascript object to php: 
   https://www.youtube.com/watch?v=Ctz1Fsgt9OE

json Decoding docs: 
   https://www.php.net/manual/en/function.json-decode.php

   JSON into mySQL    :
      https://dev.mysql.com/doc/refman/8.4/en/json.html

   stringify: https://www.w3schools.com/jsref/jsref_stringify.asp#:~:text=The%20JSON.,has%20to%20be%20a%20string.

Intro to ITWS lab docs (can provide them if needed, just didn't really know how to cite without including actual files)

Didn't actually use: 


   JS database connection: 
      https://www.w3schools.com/nodejs/nodejs_mysql.asp
      Also taught me how to install node.js and npm (the package manager )

   Getting the mySQL Package in JS file:
      https://www.sitepoint.com/using-node-mysql-javascript-client/


Decided to not use anything above 


Current:
   Done√


Helpful Code Chunks: 

            //Catches echo response for testing, returns as a string so must be converted to JSON 
            .then(function(response){
               return(response.json()) 
            })
            .then(function(js){
               console.log(js); 
            }); 





<?php
      //so can check every time we write in PhP 
      $dbOk = false; 

      //getting weather data
      $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

      if ($db->connect_error) {
         echo '<div class="messages">Could not connect to the database. Error: ';
         echo $db->connect_errno . ' - ' . $db->connect_error . '</div>';
      } else {
         $dbOk = true;
      }

      $query = 'SELECT * FROM jsonObjs WHERE apiType="weather"';
      $result = $db->query($query);
      $record = $result->fetch_assoc();
      $inter = json_decode($record['jdoc']);
      //at this point, inter is still a string because the data is double JSON encoded, so have to do it one more
      $weath = json_decode($inter, true);
      //Now it is a php array acsessable by 
      /*lat: 
      echo $weath['coord']['lat'];
      */
?>

                           <?php
                           if
                              echo "<span id='windSpeed'>" . $weath['wind']['speed'] .  "</span> mph";
                           ?>




SELECT * FROM jsonObjs WHERE jdoc="{\"coord\":{\"lon\":-73.6918,\"lat\":42.7284},\"weather\":[{\"id\":741,\"main\":\"Fog\",\"description\":\"fog\",\"icon\":\"50d\"}],\"base\":\"stations\",\"main\":{\"temp\":57.34,\"feels_like\":57.2,\"temp_min\":55.15,\"temp_max\":60.49,\"pressure\":1023,\"humidity\":94,\"sea_level\":1023,\"grnd_level\":1009},\"visibility\":10000,\"wind\":{\"speed\":0,\"deg\":0},\"clouds\":{\"all\":100},\"dt\":1728049196,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039341,\"sunset\":1728081044},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}"
                                   "{\"coord\":{\"lon\":-73.6918,\"lat\":42.7284},\"weather\":[{\"id\":741,\"main\":\"Fog\",\"description\":\"fog\",\"icon\":\"50d\"}],\"base\":\"stations\",\"main\":{\"temp\":57.34,\"feels_like\":57.2,\"temp_min\":55.15,\"temp_max\":60.49,\"pressure\":1023,\"humidity\":94,\"sea_level\":1023,\"grnd_level\":1009},\"visibility\":10000,\"wind\":{\"speed\":0,\"deg\":0},\"clouds\":{\"all\":100},\"dt\":1728049196,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039341,\"sunset\":1728081044},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}"

                                   "{\"coord\":{\"lon\":-73.6918,\"lat\":42.7284},\"weather\":[{\"id\":741,\"main\":\"Fog\",\"description\":\"fog\",\"icon\":\"50d\"}],\"base\":\"stations\",\"main\":{\"temp\":57.34,\"feels_like\":57.2,\"temp_min\":55.15,\"temp_max\":60.49,\"pressure\":1023,\"humidity\":94,\"sea_level\":1023,\"grnd_level\":1009},\"visibility\":10000,\"wind\":{\"speed\":0,\"deg\":0},\"clouds\":{\"all\":100},\"dt\":1728049196,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039341,\"sunset\":1728081044},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}"
