<?php 

require('connection.php');

$height = $_POST['height'] ;
$weight = $_POST['weight'] ;
$age = $_POST['age'] ;
$Drugs = $_POST['Drugs'] ;
$ChronicDiseases    = $_POST['ChronicDiseases'] ; 
$BloodSugerLevel  = $_POST['BloodSugerLevel'] ; 
 

 $sql = "INSERT INTO `resolution` (`height`, `weight`, `age` ,`Drugs` ,`ChronicDiseases` ,`BloodSugerLevel` ) VALUES (:height , :weight , :age , :Drugs , :ChronicDiseases ,:BloodSugerLevel )";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (
    
  ":height" => $height,
  ":weight" => $weight,
  ":age" => $age,
  ":Drugs" => $Drugs,
  ":ChronicDiseases" => $ChronicDiseases,
  ":BloodSugerLevel" => $BloodSugerLevel

 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>