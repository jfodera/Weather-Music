<?php

   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $id = file_get_contents("php://input");
      //getting weather data
      $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');


      $query = "SELECT * FROM jsonObjs WHERE callId=" . $id;
      echo $query;
      // $result = $db->query($query);
      // $record = $result->fetch_assoc();
      // $inter = json_decode($record['jdoc']);
      // //at this point, inter is still a string because the data is double JSON encoded, so have to do it one more
      // $weath = json_decode($inter, true);

      // $db->close();
   }
?>