<?php 
require('connection.php');

$mealtype = $_POST['mealtype'] ;
$makeQuery =" SELECT * FROM meals WHERE Mealtype  = ? AND carbohydrate = 0 ";
$stamement =$connection->prepare($makeQuery);
$stamement->execute(array($mealtype));

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
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