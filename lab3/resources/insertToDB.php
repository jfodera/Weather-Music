<?php

   if(isset($_POST)){
      $data = file_get_contents("php://input");
      echo $data; 

   }

?>