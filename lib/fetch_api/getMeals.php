<?php 
require('connection.php');
$makeQuery =" SELECT * FROM meals";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "Mealname" => $resultsForm['Mealname'],
            "Mealtype" => $resultsForm['Mealtype'],
            "Mealtime" => $resultsForm['Mealtime'],
            "Description" => $resultsForm['Description'],
            
        )
        
        );
    }


        echo json_encode($myarray);







?>