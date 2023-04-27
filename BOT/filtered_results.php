<?php
include "../dbconnect.php";
// Retrieve the selected price range from the query parameter
$priceRange = $_GET['price'];
if ($priceRange == 'low') {
    $minPrice = 0;
    $maxPrice = 10;
  } elseif ($priceRange == 'medium') {
    $minPrice = 11;
    $maxPrice = 50;
  } elseif ($priceRange == 'high') {
    $minPrice = 51;
    $maxPrice = 100;
  }
// Perform the database query to retrieve items based on the price range
// Modify the query according to your database structure
$sql= "SELECT * FROM item WHERE item_price >= $minPrice AND item_price <= $maxPrice";
$run_query = mysqli_query($con, $sql) or die("error in finding");
if (mysqli_num_rows($run_query) > 0) {
    
    while ($fetch_data = mysqli_fetch_assoc($run_query)) {
    
        $reply = $fetch_data['item_name'];
        echo "          <button class='option-btn' data-value=" . $reply . ">$reply</button>";
    }
} else {
    echo "          INPUT NOT PROPER";
}
?>
