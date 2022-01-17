
<?php 
require('connection.php');

$ResId = $_POST['ResId'] ;
$age  = $_POST['age'] ; 
$weight  = $_POST['weight'] ; 
 $Drugs  = $_POST['Drugs'] ; 
 $ChronicDiseases  = $_POST['ChronicDiseases'] ; 

 
$sql ="UPDATE `resolution` SET `weight` = '$weight', `age` = '$age',`Drugs` = '$Drugs' ,`ChronicDiseases` = '$ChronicDiseases' WHERE `resolution`.`ResId` = '$ResId' " ;


 $stmt = $connection->prepare($sql);
 $stmt->execute();
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }


?>