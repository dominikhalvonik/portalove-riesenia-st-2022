<form method="post" action="insert.php">
    Name: <br>
    <input type="text" name="destination_name" value=""><br>
    Area: <br>
    <input type="text" name="destination_area" value=""><br>
    Description: <br>
    <textarea name="destination_description"></textarea><br>
    Attribute: <br>
    <select name="attribute">
        <option value="1">people</option>
        <option value="2">size</option>
        <option value="3">money</option>
        <option value="4">image</option>
    </select>
    <br>
    <input type="text" name="attribute_value" placeholder="Attribute value" value="">
    <br><br>
    <input type="submit" name="submitttttt" value="Insert">
</form>
