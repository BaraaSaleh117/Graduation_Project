<?php 
require('connection.php');

$mealtype =  $_POST['searchmeal'] ;
$where = " WHERE Mealname Like '$mealtype%' "   ;
$makeQuery =" SELECT * FROM meals $where  ";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();
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
            "carbohydrate" => $resultsForm['carbohydrate'],
            "Description" => $resultsForm['Description'],
            "Nutrients" => $resultsForm['Nutrients'],
            "Howtoprepare" => $resultsForm['Howtoprepare'],
            
            

            
        )
        
        );
    }


        echo json_encode($myarray);







?>