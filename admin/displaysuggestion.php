<?php
include "dbconnect.php";
$sql = "select * from suggestion";
$res = $con->query($sql);
if ($res->num_rows > 0) {
    echo "<table class='w-full text-center'>";
    echo "<tr class='w-full bg-gray-300 h-14 text-xl'>
                <th class='w-1/3'>Hotel Name</th>
                <th class='w-1/3'>Suggested Hotel Details</th>
                <th class='w-1/3'>Action</th>
                </tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='h-14 odd:bg-gray-300'><td class='w-2/4'>$row[uname]</td>";
        echo "<td class='w-1/4'>$row[hotel_name]<br>$row[hotel_loc]<br>$row[ratings]<br>$row[links]<br>$row[desc]</td>";
        echo "<td><a href='admin/add_hotel.php?uname=$row[uname]&hotel_name=$row[hotel_name]&hotel_loc=$row[hotel_loc]&loc_name=$row[loc_name]&ratings=$row[ratings]&links=$row[links]&desc=$row[desc]&'>Approve</td>";
        echo "</tr>";
    }
    echo "</table>";
}
