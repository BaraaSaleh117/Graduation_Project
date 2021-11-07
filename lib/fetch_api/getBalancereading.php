<?php 
require('connection.php');
$makeQuery =" SELECT * FROM balancereading";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "resId" => $resultsForm['resId'],
            "BMI" => $resultsForm['BMI'],
            "Weight" => $resultsForm['Weight'],
            "Protein" => $resultsForm['Protein'],
            "TotalBodyWater" => $resultsForm['TotalBodyWater'],
            "visceralFat" => $resultsForm['visceralFat'],
            "Calories" => $resultsForm['Calories'],
            "muscleWeight" => $resultsForm['muscleWeight'],

        )
        
        );
    }


        echo json_encode($myarray);







?>