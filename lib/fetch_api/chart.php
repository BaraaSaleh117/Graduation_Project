<?php 
require('connection.php');
$makeQuery =" SELECT * FROM chartdata";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "Days" => $resultsForm['Days'],
            "SugerLevel" => $resultsForm['SugerLevel'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>