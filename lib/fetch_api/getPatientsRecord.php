<?php 
require('connection.php');
$makeQuery =" SELECT * FROM patientrecords";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "PatientId" => $resultsForm['PatientId'],
            "DoctorId" => $resultsForm['DoctorId'],
            "resolutionId" => $resultsForm['resolutionId'],
            "FullName" => $resultsForm['FullName'],
            "HealthStatus" => $resultsForm['HealthStatus'],
            "SugerLevelInBlood" => $resultsForm['SugerLevelInBlood'],
           

        )
        
        );
    }


        echo json_encode($myarray);







?>