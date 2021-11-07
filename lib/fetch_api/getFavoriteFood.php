<?php 
require('connection.php');
$makeQuery =" SELECT * FROM favoritefood";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "resid" => $resultsForm['resid'],
            "foodID" => $resultsForm['foodID'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>