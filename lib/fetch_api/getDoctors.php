<?php 
require('connection.php');
$makeQuery =" SELECT * FROM doctor";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'],
            "FirstName" => $resultsForm['FirstName'],
            "LastName" => $resultsForm['LastName'],
            "ClinicAddress" => $resultsForm['ClinicAddress'],
            "Notes" => $resultsForm['Notes'],
            "PhoneNumber" => $resultsForm['PhoneNumber'],
            "Email" => $resultsForm['Email'],
            "Password" => $resultsForm['Password'],
            "AppointmentID" => $resultsForm['AppointmentID'],
            "PatientId" => $resultsForm['PatientId'],

        )
        
        );
    }


        echo json_encode($myarray);







?>