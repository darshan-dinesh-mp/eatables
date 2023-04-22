<?php
include "dbconnect.php";
$sql = "select * from suggestion";
$res = $con->query($sql);
if ($res->num_rows > 0) {
    echo "<table class='w-full text-center'>";
    echo "<tr class='w-full bg-gray-300 h-14 text-xl'><th class='w-1/3'>Hotel Name</th><th class='w-1/3'>Suggested Hotel Details</th></tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='h-14 odd:bg-gray-300'><td class='w-2/4'>$row[uname]</td>";
        echo "<td class='w-1/4'>$row[hotel_name]$row[hotel_loc]</td>";
        echo "</tr>";
    }
    echo "</table>";
}
?>