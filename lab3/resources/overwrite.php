<?php
// Overwrites Existing Entry
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");

      // echo $data; 
      //parse data and edit escape chars
      //error: must put escape chars around the single quotes quotes 
      //accounts for any single quote escape chars
      $id = ""
      $wEsc = "";
      $flag = 0;
      for($i = strlen($data)-1; $i < 0; $i--){

         if($flag == 0){
            //indicating start of the json
            if($data[$i] == '}'){
               $flag = 1; 
            }else{
               //adds to front 
                $id = $data[$i] + $id;
            }
         }else{
            if($data[$i] == "'"){
               // Need double escape here
               $wEsc = "\\'" . $wEsc;
            }else{
               $wEsc = $data[$i] . $wEsc ;
            }
         }

      }

      echo $id; 
      echo "the data: " . $wEsc;
   
   //    /* Create a new database connection object, passing in the host, username, 
   //   password, and database to use. */
   //    $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

   //    //connect_error is a property of a mysqli object that has any error message if it false
   //    if ($db->connect_error) {
   //       //can echo back in json as well using json_encode
   //       echo "connection failed:" . $db->connect_error;
   //    }
   //    //Prepare and insert API's val to database

   //    UPDATE `jsonObjs` SET `jdoc`='3782273' WHERE callId=50

   //    $type = "misc";
   //    $insQuery = "insert into jsonObjs (`jdoc`,`apiType`) values(?,?)";
   //    $statement = $db->prepare($insQuery);
   //    $statement->bind_param("ss", $wEsc, $type);
   //    $statement->execute();




      // $query = "SELECT * FROM jsonObjs WHERE jdoc='$wEsc'";
      // $result = $db->query($query);
      // $record = $result->fetch_assoc();
      // $id = $record['callId'];

      // echo $id; 
      
      // $db->close();

   }

?>