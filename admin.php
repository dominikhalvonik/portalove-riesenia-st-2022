<?php
include_once "db.php";

use portalove\DB;

$db = new DB("localhost", "portalove", "root", "", 3308);
$destinations = $db->getDestinations();

echo '<a href="insert_form.php">Insert destination</a><br><br>';

echo "<ul>";

foreach ($destinations as $destination => $destinationData) {
    echo '<li>'
        .$destination.
        '<br><a href="delete.php?id='.$destinationData['id'].'">Delete</a> 
         <br><a href="update.php?id='.$destinationData['id'].'">Update</a> 
        </li>';
}
echo "</ul>";
?>
