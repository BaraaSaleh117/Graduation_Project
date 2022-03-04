<?php
require('connection.php');
$UserName = $_POST['UserName'] ;
$makeQuery =" SELECT account.Id , account.UserName ,resolution.HValue,resolution.HDate,resolution.height,resolution.Active,resolution.parpase,resolution.weight,resolution.gender,resolution.age,resolution.Drugs,resolution.ChronicDiseases, resolution.BloodSugerLevel   FROM account INNER JOIN resolution ON account.Id =resolution.ResId  WHERE account.UserName = ? ORDER BY resolution.BloodSugerLevel DESC  ";
$stamement =$connection->prepare($makeQuery);
$stamement->execute(array($UserName));
$myarray=array();
while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "UserName" => $resultsForm['UserName'],
            "height" => $resultsForm['height'],
            "weight" => $resultsForm['weight'],
            "gender" => $resultsForm['gender'],
            "age" => $resultsForm['age'],
            "Drugs" => $resultsForm['Drugs'],
            "ChronicDiseases" => $resultsForm['ChronicDiseases'],
            "BloodSugerLevel" => $resultsForm['BloodSugerLevel'],
            "Active" => $resultsForm['Active'],
            "parpase" => $resultsForm['parpase'],
            "HValue" => $resultsForm['HValue'],
            "HDate" => $resultsForm['HDate'],
            
        
        )
        
        );
    }


        echo json_encode($myarray);







?>