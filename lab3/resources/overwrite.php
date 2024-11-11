<?php
// Overwrites Existing Entry in the database given an entry-specific ID, and JSON Data to overwrite with 
   require 'vendor/autoload.php';

   // Concatenation because it's not in this directory
   $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
   $dotenv->load();

   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $data = file_get_contents("php://input");

      //parse data and edit escape chars
      //must put escape chars around the single quotes quotes 
      $id = "";
      $wEsc = "";
      $flag = 0;
      for($i = (strlen($data)-1); $i >= 0; $i--){

         if($flag == 0){
            //indicating start of the json
            if($data[$i] == '}'){
               $flag = 1; 
               $wEsc = $data[$i] . $wEsc ;
            }else{
               //adds to front 
                $id = $data[$i] . $id;
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

      $db_host = $_ENV['DB_HOST'];
      $db_user = $_ENV['DB_USER'];
      $db_pass = $_ENV['DB_PASS'];
      $db_name = $_ENV['DB_NAME'];


      $db = new mysqli($db_host, $db_user, $db_pass, $db_name);

      //error handling 
      if ($db->connect_error) {
         //can echo back in json as well using json_encode
         echo "connection failed:" . $db->connect_error;
      }

      //Update JSON at ID using mySQL call
      $upQuery = "UPDATE `jsonObjs` SET `jdoc`='$wEsc' WHERE callId=$id";
      echo $db->query($upQuery);

      $db->close();
   }
?>