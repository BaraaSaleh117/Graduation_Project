<?php 
require('connection.php');
$makeQuery =" SELECT * FROM allergicfood";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "resId" => $resultsForm['resId'],
            "foodID" => $resultsForm['foodID'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>