<?php
include "dbconnect.php";
$sql="select * from hotel";
$res=$con->query($sql);
if($res->num_rows>0)
{
    echo "<table border=1>";
	while($row=$res->fetch_assoc())
	{
		echo "<tr><th>$row[hname]</th>";
        echo "<td><a href='edit.php?hname=$row[hname]'>EDIT</a></td>";
        echo "<td><a href='delete_hotel.php?hname=$row[hname]'>DELETE</a></td>";
        echo "</tr>";
		echo "<br>";
	}
    echo "</table>";
}
?>