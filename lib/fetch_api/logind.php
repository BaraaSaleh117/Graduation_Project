<?php 
require('connection.php');

if($_SERVER['REQUEST_METHOD']=="POST"){
    $UserName  = $_POST['UserName'];
    $Password = $_POST['Password'];

    $stmt = $connection->prepare(" SELECT * FROM doctoraccount WHERE UserName  = ? AND Password = ?");
    $stmt->execute(array($UserName,$Password));

    $user = $stmt->fetch() ;

     $row = $stmt->rowcount() ;
   if($row > 0) {
       $Id          =$user['Id'];
       $UserName    =$user['UserName'];
       $Password    =$user['Password'];
       echo json_encode(array('Id' => $Id,'UserName' => $UserName,'Password' => $Password, 'status'=>"yes" ));

   }else {
      echo json_encode (array('status'=>"No"));
   }

}

?>