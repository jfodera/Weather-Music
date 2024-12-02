<?php
// Makes initial Entry to the Database when the Website Starts up 

// If the server has recieved a post request (it has gotten called from lab3.js)
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");


      //must put escape chars around the single quotes quotes 
      $wEsc = "";
      for($i = 0; $i < strlen($data); $i++){
         if($data[$i] == "'"){
            // Need double escape here
            $wEsc = $wEsc . "\\'";
         }else{
            $wEsc = $wEsc . $data[$i];
         }
      }
   

      $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

      //error handling
      if ($db->connect_error) {
         //can echo back in json as well using json_encode
         echo "connection failed:" . $db->connect_error;
      }

      //Prepare and insert API response to database
      $type = "misc";
      $insQuery = "insert into jsonObjs (`jdoc`,`apiType`) values(?,?)";
      $statement = $db->prepare($insQuery);
      $statement->bind_param("ss", $wEsc, $type);
      $statement->execute();

      //returns ID so that exact entry can be acsessed multiple times by the js 
      $query = "SELECT * FROM jsonObjs WHERE jdoc='$wEsc'";
      $result = $db->query($query);
      $record = $result->fetch_assoc();
      $id = $record['callId'];

      echo $id; 
      
      $db->close();
   }
?>