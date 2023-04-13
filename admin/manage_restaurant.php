<?php
include "dbconnect.php";
$sql="select * from hotel";
$res=$con->query($sql);
if($res->num_rows>0)
{
    echo "<table border=1>";
	while($row=$res->fetch_assoc())
	{
		echo "<tr><th>$row[hotel_name]</th>";
        echo "<td><a href='admin/edit.php?hname=$row[hotel_name]'>EDIT</a></td>";
        echo "<td><a href='admin/delete_hotel.php?hname=$row[hotel_name]'>DELETE</a></td>";
        echo "</tr>";
		echo "<br>";
	}
    echo "</table>";
}
?>