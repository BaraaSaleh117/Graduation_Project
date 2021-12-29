<?php 
require('connection.php');
$Calories = $_POST['Calories'] ;
$lessCalories = $_POST['lessCalories'] ;
$mealtype = $_POST['mealtype'] ;
$carbohydrate = $_POST['carbohydrate'] ;
$lesscarbohydrate = $_POST['lesscarbohydrate'] ;
$makeQuery =" SELECT * FROM meals WHERE Calories  < ? AND Calories > ? AND  mealtype = ? AND carbohydrate < ?  AND carbohydrate > ?";
$stamement =$connection->prepare($makeQuery);
$stamement->execute(array($Calories,$lessCalories,$mealtype , $carbohydrate ,$lesscarbohydrate));
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