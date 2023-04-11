<?php
// Connect to database
include "dbconnect.php";

// Get search query
$query = $_POST['query'];

// Query database for hotels with matching location name
$sql = "SELECT loc_name FROM location WHERE loc_name LIKE '%$query%'";
$result = mysqli_query($con,$sql);
// Display search results as HTML
if (mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    echo '<p>' . $row['loc_name'] . '</p>';
  }
} else {
}

// Close database connection
mysqli_close($con);
?>
