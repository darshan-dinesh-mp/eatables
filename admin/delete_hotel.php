<?php
include "dbconnect.php";
$hname = $_GET["hname"];
$sql = "delete from hotel where hname='$hname'";
$res = $con->query($sql);
if ($res) {
    echo "<script>alert('Hotel deleted successfully.')</script>";
    echo "<script>window.location.href='manage_restaurant.php'</script>";
}
?>