<?php 
require('connection.php');
$makeQuery =" SELECT * FROM resolution";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "ResId" => $resultsForm['ResId'],
            "height" => $resultsForm['height'],
            "weight" => $resultsForm['weight'],
            "age" => $resultsForm['age'],
            "Drugs" => $resultsForm['Drugs'],
            "ChronicDiseases" => $resultsForm['ChronicDiseases'],
            "PatientRID" => $resultsForm['PatientRID'],
        )
        
        );
    }


        echo json_encode($myarray);







?>