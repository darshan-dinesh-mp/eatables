<?php
// Get the latitude and longitude from the AJAX request
$latitude = $_POST['latitude'];
$longitude = $_POST['longitude'];

// Save the location to the database
// You can use any database library you prefer, such as PDO or mysqli
echo "<h1>'$latitude'</h1>";
echo $longitude;
// Redirect the user to another page
header("Location: /signup.php");
//exit();
?>