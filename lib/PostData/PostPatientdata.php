<?php 

require('connection.php');

$ResId = $_POST['ResId'] ;
$height = $_POST['height'] ;
$weight = $_POST['weight'] ;
$age = $_POST['age'] ;
$gender = $_POST['gender'] ;
$Drugs = $_POST['Drugs'] ;
$ChronicDiseases    = $_POST['ChronicDiseases'] ; 
$BloodSugerLevel  = $_POST['BloodSugerLevel'] ; 
$Active  = $_POST['Active'] ; 
$parpase  = $_POST['parpase'] ; 
$HValue  = $_POST['HValue'] ; 
$HDate  = $_POST['HDate'] ; 

 

 $sql = "INSERT INTO `resolution` (`ResId`, `height`, `weight`, `age` ,`gender`,`Drugs` ,`ChronicDiseases` ,`BloodSugerLevel`,`Active`,`parpase`,`HValue`,`HDate` ) VALUES (:ResId , :height , :weight , :age , :gender , :Drugs , :ChronicDiseases ,:BloodSugerLevel,:Active,:parpase,:HValue,:HDate )";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (
  ":ResId" => $ResId,  
  ":height" => $height,
  ":weight" => $weight,
  ":age" => $age,
  ":gender" => $gender,
  ":Drugs" => $Drugs,
  ":ChronicDiseases" => $ChronicDiseases,
  ":BloodSugerLevel" => $BloodSugerLevel,
  ":Active" => $Active,
  ":parpase" => $parpase,
  ":HValue" => $HValue,
  ":HDate" => $HDate


 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>