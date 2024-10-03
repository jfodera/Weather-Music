<?php

// If the server has recieved a post request (it has if getting called from lab3.js)
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");

   //    $dbOk = false;

   //    /* Create a new database connection object, passing in the host, username,
   //   password, and database to use. The "@" suppresses errors. */
   //    @$db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'jsonObjs');

   //    //connect_error is a property of a mysqli object that has any error message if it false
   //    if ($db->connect_error) {
   //       echo 'Could not connect to the database. Error: ';
   //       //errno gives the error code 
   //       echo $db->connect_errno . ' - ' . $db->connect_error . '</div>';
   //    } else {
   //       $dbOk = true;
   //    }
      

   }

?>