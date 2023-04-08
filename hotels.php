<?php
$con=new mysqli("localhost","root","","eatables");
if(mysqli_connect_error())
{
	die("Not connected");
}
echo "<br>";
$loc_name=$_GET['loc_name'];
echo "<h3><b><u>Top hotels in $loc_name</u></b><br><br></h3>";
$sql="select * from hotel where loc_name='$loc_name'";
$res=$con->query($sql);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc())
	{
		echo "";
		echo "<br>";
		echo "<a href='items.php?hotel_name=$row[hotel_name]&hotel_id=$row[hotel_id]'>$row[hotel_name]";
		echo "<br>";
	}
}
?>