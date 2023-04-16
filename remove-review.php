<?php
include "dbconnect.php";
session_start();
$user_id = $_SESSION['id'];
$review_id = $_GET['review_id'];
$sql = "DELETE FROM review WHERE review_id = $review_id AND uid = $user_id";
$res = $con->query($sql);

if ($res) {
     header("Location: user-profile.php?review=1");
} else {
     header("Location: user-profile.php?review=1");
}
