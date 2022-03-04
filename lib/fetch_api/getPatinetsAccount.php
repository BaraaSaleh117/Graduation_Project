<?php 
require('connection.php');
$makeQuery =" SELECT account.Id , account.UserName ,resolution.HValue,resolution.HDate,resolution.height,resolution.gender,resolution.weight,resolution.age,resolution.Drugs,resolution.ChronicDiseases, resolution.BloodSugerLevel  FROM account INNER JOIN resolution ON account.Id =resolution.ResId ORDER BY resolution.BloodSugerLevel DESC  ";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "UserName" => $resultsForm['UserName'],
            "height" => $resultsForm['height'],
            "age" => $resultsForm['age'],
            "gender" => $resultsForm['gender'],
            "weight" => $resultsForm['weight'],
            "Drugs" => $resultsForm['Drugs'],
            "ChronicDiseases" => $resultsForm['ChronicDiseases'],
            "BloodSugerLevel" => $resultsForm['BloodSugerLevel'],
            "HValue" => $resultsForm['HValue'],
            "HDate" => $resultsForm['HDate'],
            
        
        )
        
        );
    }


        echo json_encode($myarray);







?>