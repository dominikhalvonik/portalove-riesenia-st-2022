<?php
include_once "db.php";

use portalove\DB;

$db = new DB("localhost", "portalove", "root", "", 3308);

if(isset($_GET['id'])) {
    $delete = $db->deleteDestination($_GET['id']);

    if($delete) {
        header('Location: admin.php');
    } else {
        echo "FATAL ERROR!!";
    }
} else {
    header('Location: admin.php');
}