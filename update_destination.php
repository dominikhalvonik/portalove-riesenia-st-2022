<?php
include_once "db.php";

use portalove\DB;

$db = new DB("localhost", "portalove", "root", "", 3308);

if(isset($_POST['submit'])) {
    $update = $db->updateDestination(
        $_POST['id'],
        $_POST['destination_name'],
        $_POST['destination_area'],
        $_POST['destination_description']
    );

    if($update) {
        header('Location: admin.php');
    } else {
        echo "FATAL ERROR!!";
    }
} else {
    header('Location: admin.php');
}