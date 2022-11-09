<?php
include_once "db_connect.php";

$db = $GLOBALS['db'];

if(isset($_SESSION['is_admin']) && $_SESSION['is_admin'] === true) {
    $destinations = $db->getDestinations();

    echo '<a href="insert_form.php">Insert destination</a><br>';
    echo '<a href="index.php">Web page</a><br>';
    echo '<a href="logout.php">Logout</a><br>';

    echo "<ul>";

    foreach ($destinations as $destination => $destinationData) {
        echo '<li>'
            .$destination.
            '<br><a href="delete.php?id='.$destinationData['id'].'">Delete</a> 
         <br><a href="update.php?id='.$destinationData['id'].'">Update</a> 
        </li>';
    }
    echo "</ul>";
} else {
    ?>
    <form method="post" action="login.php">
        Username: <br>
        <input name="username" type="text" placeholder="Username"><br>
        Password: <br>
        <input name="password" type="password"><br>
        <input type="submit" name="submit" value="Login">
    </form>
    <?php
}
?>
