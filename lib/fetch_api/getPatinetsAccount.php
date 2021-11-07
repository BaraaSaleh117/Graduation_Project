<?php 
require('connection.php');
$makeQuery =" SELECT * FROM account";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "patientId" => $resultsForm['patientId'],
            "UserName" => $resultsForm['UserName'],
            "Email" => $resultsForm['Email'],
            "Password" => $resultsForm['Password'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>