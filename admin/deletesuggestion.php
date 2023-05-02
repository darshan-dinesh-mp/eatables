<?php
include "dbconnect.php";
$hotel_id=$_GET["hid"];
$sql="delete from suggestion where hotel_id=$hotel_id";
$result=$con->query($sql);
if($result){
     echo "<script>window.location.href='../admin.php'</script>";
}
?>