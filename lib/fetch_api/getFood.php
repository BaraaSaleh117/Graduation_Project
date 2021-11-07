<?php 
require('connection.php');
$makeQuery =" SELECT * FROM food";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "Foodname" => $resultsForm['Foodname'],
            "Calories" => $resultsForm['Calories'],
            "Fats" => $resultsForm['Fats'],
            "SaturatedFat" => $resultsForm['SaturatedFat'],
            "carbohydrates" => $resultsForm['carbohydrates'],
            "fiber" => $resultsForm['fiber'],
            "Proteins" => $resultsForm['Proteins'],
            "cholesterol" => $resultsForm['cholesterol'],
            "Quantity" => $resultsForm['Quantity'],

        )
        
        );
    }


        echo json_encode($myarray);







?>