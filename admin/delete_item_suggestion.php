<?php
include "dbconnect.php";
$sid=$_GET["sid"];
$sql="delete from item_suggestion where s_id=$sid";
$result=$con->query($sql);
if($result){
     echo "<script>window.location.href='../admin.php'</script>";
}
?>