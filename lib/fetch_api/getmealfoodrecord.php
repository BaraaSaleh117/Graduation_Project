<?php 
require('connection.php');
$makeQuery =" SELECT * FROM mealfoodrecord";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "mealID" => $resultsForm['mealID'],
            "foodID" => $resultsForm['foodID'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>