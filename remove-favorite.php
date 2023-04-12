<?php
include "dbconnect.php";
session_start();
$user_id = $_SESSION['id'];

$item_id = $_GET['item_id'];
$sql = "DELETE FROM favourite WHERE item_id = $item_id AND uid = $user_id";
$res = $con->query($sql);

if ($res) {
    echo "Item removed from favourites.";
} else {
    echo "An error occurred while trying to remove the item from your favourites.";
}
?>
