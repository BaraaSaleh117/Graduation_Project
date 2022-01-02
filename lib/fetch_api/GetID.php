<?php 
require('connection.php');
$UserName = $_POST['UserName'] ;
$makeQuery =" SELECT account.Id FROM account WHERE UserName  = ?";
$stamement =$connection->prepare($makeQuery);
$stamement->execute(array($UserName));


$myarray=array();

while($resultsForm = $stamement ->fetch()){

    array_push(
        $myarray,array(
            "Id" => $resultsForm['Id'] 
        )
        
        );
    }


        echo json_encode($myarray);







?>