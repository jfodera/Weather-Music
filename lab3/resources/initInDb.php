<?php
// <!-- Makes initial Entry to the Database when the Website Starts up  -->
// If the server has recieved a post request (it has if getting called from lab3.js)
   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      // $data = file_get\contents("php://input");
      $data = '{"mascot": "Our mascot is a dolphin named \'Sakila\'."}';
      //single quote escape chars: 
      //Get ID
      //error: must put escape chars around the single quotes quotes 
      $wEsc = "";
      $echo $data
      for($i = 0; $i < strlen($data); $i++){
         if($data[$i] == "'"){
            // Need double escape here
            $wEsc = $wEsc . "\\'";
         }else{
            $wEsc = $wEsc . $data[$i];
         }
      }

      // echo $wEsc;
   }

//       /* Create a new database connection object, passing in the host, username, 
//      password, and database to use. */
//       $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

//       //connect_error is a property of a mysqli object that has any error message if it false
//       if ($db->connect_error) {
//          //can echo back in json as well using json_encode
//          echo "connection failed:" . $db->connect_error;
//       }
//       //Prepare and insert API's val to database
//       $type = "misc";
//       $insQuery = "insert into jsonObjs (`jdoc`,`apiType`) values(?,?)";
//       $statement = $db->prepare($insQuery);
//       $statement->bind_param("ss", $data, $type);
//       $statement->execute();




//       $query = "SELECT * FROM jsonObjs WHERE jdoc='$data'";
//       echo $query;
//       // $result = $db->query($query);
//       // $record = $result->fetch_assoc();
//       // $id = $record['callId'];

//       // echo $id; 
      
   
      
//    }

//    $db->close();

?>