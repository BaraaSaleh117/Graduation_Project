<?php 
require('connection.php');

$mealtype = $_POST['Mealtype'] ;
$makeQuery =" SELECT * FROM meals WHERE Mealtype  = ?";
$stamement =$connection->prepare($makeQuery);
$stamement->execute(array($mealtype));

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "url" => $resultsForm['url'],
            "Mealname" => $resultsForm['Mealname'],
            "Mealtype" => $resultsForm['Mealtype'],
            "Mealtime" => $resultsForm['Mealtime'],
            "Calories" => $resultsForm['Calories'],
            "Description" => $resultsForm['Description'],
            
            

            
        )
        
        );
    }


        echo json_encode($myarray);







?>