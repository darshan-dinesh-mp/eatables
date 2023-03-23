<?php
$con=new mysqli("localhost","root","","eatables");
if(mysqli_connect_error())
{
	die("Not connected");
}
echo "<br>";
$lname=$_GET['lname'];
echo "<h3><b><u>Must try items in $lname</u></b><br><br></h3>";
$sql="select * from item where lname='$lname'";
$res=$con->query($sql);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc())
	{
		echo "<a href='hotels.php?iname=$row[iname]'>$row[iname]";
		echo "<br>";
	}
}
?>