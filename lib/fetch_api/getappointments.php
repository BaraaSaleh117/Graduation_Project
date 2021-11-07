<?php 
require('connection.php');
$makeQuery =" SELECT * FROM appointments";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "DoctorId" => $resultsForm['DoctorId'],
            "PatientId" => $resultsForm['PatientId'],
            "Reservation" => $resultsForm['Reservation'],
        
        )
        
        );
    }


        echo json_encode($myarray);







?>