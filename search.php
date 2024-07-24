<?php
// Connect to database
include "dbconnect.php";

// Get search query
$query = $_POST['query'];

// Query database for hotels with matching location name
$sql = "SELECT * FROM hotel WHERE hotel_name LIKE '%$query%'";
$result = mysqli_query($con, $sql);
// Display search results as HTML
if (mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    // <!-- <a href="<?php echo $row['hotel_name'];"><?php //echo $row['hotel_name'];</a>   
    echo "<a class='py-2 md:my-4 my-1 mx-2 px-2 bg-black/75 capitalize font-poppy text-center text-white rounded-md hover:bg-black duration-300' href='hotels.php?hotel_id=$row[hotel_id]&hotel_name=$row[hotel_name]&rating=$row[ratings]&page=1'>$row[hotel_name]</a>";
  }
} else {
  echo "<h1 class='font-poppy text-2xl md:text-2xl font-medium text-center'>No restaurants found</h1>";
}
// Close database connection
mysqli_close($con);
?>