<?php
include_once "db.php";

use portalove\DB;

$db = new DB("localhost", "portalove", "root", "", 3308);

if(isset($_POST['submitttttt'])) {
    $insert = $db->insertDestination(
        $_POST['destination_name'],
        $_POST['destination_area'],
        $_POST['destination_description'],
        $_POST['attribute'],
        $_POST['attribute_value']
    );

    if($insert) {
        header('Location: admin.php');
    } else {
        echo "FATAL ERROR!!";
    }
} else {
    header('Location: admin.php');
}