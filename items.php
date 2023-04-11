<?php
session_start();
$con=new mysqli("localhost","root","","eatables");
if(mysqli_connect_error())
{
	die("Not connected");
}
$hotel_name=$_GET['hotel_name'];
$hotel_id=$_GET['hotel_id'];
echo "<h3>Must try items in $hotel_name</h3>";
$sql="select * from item where hotel_id='$hotel_id'";

$res=$con->query($sql);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc())
	{
		echo "<a href='itempage.php?item_id=$row[item_id]'>$row[item_name]";
		echo "<br>";
	}
}
