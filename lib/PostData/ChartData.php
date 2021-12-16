<?php 

require('connection.php');

$Days = $_POST['Days'] ;
$SugerLevel  = $_POST['SugerLevel'] ; 

 

 $sql = "INSERT INTO `chartdata` (`Days`, `SugerLevel`) VALUES (:Days , :SugerLevel)";


 $stmt = $connection->prepare($sql);
 $stmt->execute(array (
    
  ":Days" => $Days,
  ":SugerLevel" => $SugerLevel,
 

 ));
 $count = $stmt->rowCount() ;

 if ($count > 0){
     echo json_encode(array("status" => "success add"));
 }

?>