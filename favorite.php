<?php
include "dbconnect.php";
session_start();
$user = $_SESSION['id'];

$sql = "SELECT i.item_name,i.item_id ,i.item_price, h.hotel_name
FROM favourite f
INNER JOIN item i ON f.item_id = i.item_id
INNER JOIN hotel h ON i.hotel_id = h.hotel_id
WHERE f.uid = '$user'";
$result = $con->query($sql);

if ($result->num_rows > 0) {
    if($row = $result->fetch_assoc()) {
        echo "Item Name: " . $row["item_name"] . "<br>";
        echo "Item Price: " . $row["item_price"] . "<br>";
        echo "Hotel Name: " . $row["hotel_name"] . "<br><br>";
        echo "$row[item_id]";
    }
} else {
    echo "No favourites found.";
}
?>