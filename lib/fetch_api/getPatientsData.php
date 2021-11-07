<?php 
require('connection.php');
$makeQuery =" SELECT * FROM patients";
$stamement =$connection->prepare($makeQuery);
$stamement->execute();

$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "id" => $resultsForm['id'],
            "firstName" => $resultsForm['firstName'],
            "lastName" => $resultsForm['lastName'],
            "email" => $resultsForm['email'],
            "password" => $resultsForm['password'],
            "phoneNumber" => $resultsForm['phoneNumber'],
            "rPhoneNumber" => $resultsForm['rPhoneNumber'],
            "Gender" => $resultsForm['Gender'],

        )
        
        );
    }


        echo json_encode($myarray);







?>