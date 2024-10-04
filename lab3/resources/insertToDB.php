<?php

// If the server has recieved a post request (it has if getting called from lab3.js)
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");

      $data = json_encode($data); 

      

      /* Create a new database connection object, passing in the host, username, 
     password, and database to use. */
      $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

      //connect_error is a property of a mysqli object that has any error message if it false
      if ($db->connect_error) {
         //can echo back in json as well using json_encode
         echo "connection failed:" . $db->connect_error;
      }
      //Prepare and insert API's val to database
      $type = "weather";
      $insQuery = "insert into jsonObjs (`jdoc`,`apiType`) values(?,?)";
      $statement = $db->prepare($insQuery);
      $statement->bind_param("ss", $data, $type);
      $statement->execute();
   
      
   }

   $db->close();

?>