<?php 

require('connection.php');

$Id = $_POST['Id'] ;
$FirstName = $_POST['FirstName'] ;
$LastName = $_POST['LastName'] ;
$UserName = $_POST['UserName'] ;
$ClinicAddress = $_POST['ClinicAddress'] ;
$PhoneNumber = $_POST['PhoneNumber'] ;
$Password = $_POST['Password'] ;


 $sql = "INSERT INTO `doctor` (`Id`, `FirstName`, `LastName`, `UserName`, `ClinicAddress` ,`PhoneNumber`,`Password` ) VALUES (:Id , :FirstName , :LastName , :UserName , :ClinicAddress , :PhoneNumber , :Password  )";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (
  ":Id" => $Id,  
  ":FirstName" => $FirstName,
  ":LastName" => $LastName,
  ":UserName" => $UserName,
  ":ClinicAddress" => $ClinicAddress,
  ":PhoneNumber" => $PhoneNumber,
  ":Password" => $Password,


 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>