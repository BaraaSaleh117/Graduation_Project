<?php 
require('connection.php');
$makeQuery =" SELECT * FROM unfavoritefood";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "resId" => $resultsForm['resId'],
            "FoodId" => $resultsForm['FoodId'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>