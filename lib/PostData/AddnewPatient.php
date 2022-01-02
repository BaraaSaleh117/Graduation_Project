<?php 

require('connection.php');

$UserName = $_POST['UserName'] ;
$Password  = $_POST['Password'] ; 
 

 $sql = "INSERT INTO `account` ( `UserName`, `Password`) VALUES ( :UserName , :Password )";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (


  ":UserName" => $UserName,
  ":Password" => $Password

 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>