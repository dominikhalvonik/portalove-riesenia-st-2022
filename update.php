<?php
include_once "db.php";

use portalove\DB;

$db = new DB("localhost", "portalove", "root", "", 3308);

$destination = $db->getDestination($_GET['id'])[0];
?>

<form method="post" action="update_destination.php">
    Name: <br>
    <input type="text" name="destination_name" value="<?php echo $destination['display_name']; ?>"><br>
    Area: <br>
    <input type="text" name="destination_area" value="<?php echo $destination['area']; ?>"><br>
    Description: <br>
    <textarea name="destination_description"><?php echo $destination['description']; ?></textarea><br>
    <input type="hidden" name="id" value="<?php echo $destination['id']; ?>">
    <br><br>
    <input type="submit" name="submit" value="Update">
</form>
