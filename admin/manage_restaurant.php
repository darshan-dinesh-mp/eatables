<?php
include "dbconnect.php";
$sql = "select * from hotel";
$res = $con->query($sql);
if ($res->num_rows > 0) {
    echo "<table class='w-full text-center'>";
    echo "<tr class='w-full bg-gray-300 h-14 text-xl'><th class='w-1/3'>Hotel Name</th><th class='w-1/3'>Edit</th><th>Delete</th></tr>";
    while ($row = $res->fetch_assoc()) {
        echo "<tr class='h-14 odd:bg-gray-300'><td class='w-2/4'>$row[hotel_name]</td>";
        echo "<td class='w-1/4'><a href='admin/edit.php?hname=$row[hotel_name]'><i class='fa-solid fa-pen-to-square text-lg hover:text-[#f9bb21]'></i></a></td>";
        echo "<td class='w-1/4'><a href='admin/delete_hotel.php?hname=$row[hotel_name]'><i class='fa-solid fa-trash text-lg hover:text-[#f9bb21]'></i></a></td>";
        echo "</tr>";
    }
    echo "</table>";
}
