<?php 

require('connection.php');

$UserName = $_POST['UserName'] ;
$Email    = $_POST['Email'] ; 
$Password  = $_POST['Password'] ; 
 

 $sql = "INSERT INTO `doctoraccount` (`UserName`, `Email`, `Password`) VALUES (:UserName , :Email , :Password )";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (
    
  ":UserName" => $UserName,
  ":Email" => $Email,
  ":Password" => $Password

 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>