<?php
$con=new mysqli("localhost","root","","eatables");
if(mysqli_connect_error())
{
	die("Not connected");
}
echo "<br>";
$iname=$_GET['iname'];
echo "<h3><b><u>Top hotels serving $iname</u></b><br><br></h3>";
$sql="select * from hotel where iname='$iname'";
$res=$con->query($sql);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc())
	{
		echo "$row[hname]";
		echo "<br>";
	}
}
?>