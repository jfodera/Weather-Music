<?php
   // retrieves JSON data at the given ID from the database 
   require '../vendor/autoload.php';

   // Concatenation because it's not in this directory
   $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
   $dotenv->load();


   if(isset($_POST)){
      //the php:// makes it so that it reads raw data from the post requests body 
      $id = file_get_contents("php://input");

      $db_host = $_ENV['DB_HOST'];
      $db_user = $_ENV['DB_USER'];
      $db_pass = $_ENV['DB_PASS'];
      $db_name = $_ENV['DB_NAME'];


      $db = new mysqli($db_host, $db_user, $db_pass, $db_name);
      // $db = new mysqli('localhost', 'phpmyadmin', '!fodAdmin!', 'apiDat');

      //error handling 
      if ($db->connect_error) {
         //can echo back in json as well using json_encode
         echo "connection failed:" . $db->connect_error;
      }

      $query = "SELECT * FROM jsonObjs WHERE callId=" . $id;
      $result = $db->query($query);
      $record = $result->fetch_assoc();
      //sending back JSON data with given ID 
      echo $record['jdoc'];

      $db->close();
   }
?>