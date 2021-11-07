<?php 
require('connection.php');
$makeQuery =" SELECT * FROM doctoraccount";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "DoctorId" => $resultsForm['DoctorId'],
            "UserName" => $resultsForm['UserName'],
            "Email" => $resultsForm['Email'],
            "Password" => $resultsForm['Password'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>