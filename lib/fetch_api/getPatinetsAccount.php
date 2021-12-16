<?php 
require('connection.php');
$makeQuery =" SELECT account.Id ,account.ResId, account.UserName ,resolution.height,resolution.weight,resolution.age,resolution.Drugs,resolution.ChronicDiseases, resolution.BloodSugerLevel  FROM account INNER JOIN resolution ON account.ResId =resolution.ResId ORDER BY resolution.BloodSugerLevel DESC  ";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "ResId" => $resultsForm['ResId'],
            "UserName" => $resultsForm['UserName'],
            "height" => $resultsForm['height'],
            "weight" => $resultsForm['weight'],
            "age" => $resultsForm['age'],
            "Drugs" => $resultsForm['Drugs'],
            "ChronicDiseases" => $resultsForm['ChronicDiseases'],
            "BloodSugerLevel" => $resultsForm['BloodSugerLevel'],
            
        
        )
        
        );
    }


        echo json_encode($myarray);







?>