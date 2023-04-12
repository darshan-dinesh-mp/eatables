<?php

// Connect to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "eatables";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Select all rows from the item table
$sql = "SELECT * FROM item";
$result = $conn->query($sql);

// Loop through each row and update the item_img column with a random food image
while($row = $result->fetch_assoc()) {
    $food_images = array(
        'https://images.unsplash.com/photo-1606674727310-6d55b6960d8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        'https://images.unsplash.com/photo-1573821663912-569905455b1c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=481&q=80',
        'https://images.unsplash.com/photo-1525518392674-39ba1fca2ec2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1558138838-76294be30005?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fGNoZWVzZSUyMG4lMjBjaGVlc2UlMjBwaXp6YXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        'https://images.unsplash.com/photo-1600628421055-4d30de868b8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
        'https://images.unsplash.com/photo-1571066811602-716837d681de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=268&q=80',
        'https://images.unsplash.com/photo-1590947132387-155cc02f3212?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', 
        'https://images.unsplash.com/photo-1615719413546-198b25453f85?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80'
    );
    $random_image = $food_images[array_rand($food_images)];
    $item_id = $row['item_id'];
    $sql_update = "UPDATE item SET item_img='$random_image' WHERE item_id=$item_id";
    $conn->query($sql_update);
}

// Close the database connection
$conn->close();

?>
