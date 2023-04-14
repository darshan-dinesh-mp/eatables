<?php
include "dbconnect.php";
session_start();
$user_id = $_SESSION['id'];
$item_id = $_GET['item_id'];
$sql = "DELETE FROM favourite WHERE item_id = $item_id AND uid = $user_id";
$res = $con->query($sql);

if ($res) {
    header("Location: user-profile.php");
} else {
    header("Location: user-profile.php");
}
