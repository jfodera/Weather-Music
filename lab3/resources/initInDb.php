<?php
// <!-- Makes initial Entry to the Database when the Website Starts up  -->
// If the server has recieved a post request (it has if getting called from lab3.js)
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");

      //don't need to encode here, it's already encoded

      

      /* Create a new database connection object, passing in the host, username, 
     password, and database to use. */
      $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

      //connect_error is a property of a mysqli object that has any error message if it false
      if ($db->connect_error) {
         //can echo back in json as well using json_encode
         echo "connection failed:" . $db->connect_error;
      }
      //Prepare and insert API's val to database
      $type = "misc";
      $insQuery = "insert into jsonObjs (`jdoc`,`apiType`) values(?,?)";
      $statement = $db->prepare($insQuery);
      $statement->bind_param("ss", $data, $type);
      $statement->execute();

      //Get ID
      
      $query = "SELECT * FROM jsonObjs WHERE jdoc='$data'";
      $result = $db->query($query);
      $record = $result->fetch_assoc();
      $id = $record['callId'];

      echo $id; 
      
   
      
   }

   $db->close();

?>