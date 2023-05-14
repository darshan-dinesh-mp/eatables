<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    include "dbconnect.php";
    $already_displayed=false;
    $sql = "select * from suggestion";
    $res = $con->query($sql);
    if ($res->num_rows > 0) {
        ?>
        <h1 class="font-poppy text-2xl font-bold pb-4">New hotel suggestions.</h1>
        <?php
        echo "<table class='w-full text-center'>";
        echo "<tr class='w-full bg-gray-300 h-14 text-xl'>
                <th class=''>Username</th>
                <th class=''>Hotel Name</th>
                <th class=''>Location</th>
                <th class=''>Rating</th>
                <th class=''>Links</th>
                <th class=''>Description</th>
                <th class=''>Action</th>
                </tr>";
        while ($row = $res->fetch_assoc()) {
            echo "<tr class='h-14 odd:bg-gray-300'><td class=''>$row[uname]";
            echo "<td class=''>$row[hotel_name]</td>";
            echo "<td class=''>$row[hotel_loc]</td>";
            echo "<td class=''>$row[ratings]</td>";
            echo "<td class=''>$row[links]</td>";
            echo "<td class=''>$row[desc]</td>";
            echo "<td class=''>
        <div id='links-container'>
        <a href='admin/add_hotel.php?uname=$row[uname]&hotel_name=$row[hotel_name]&hotel_loc=$row[hotel_loc]&loc_name=$row[loc_name]&ratings=$row[ratings]&links=$row[links]&desc=$row[desc]&contact=$row[contact]'><i class='fa-solid fa-circle-check text-3xl text-green-500'></i></a>
        <a href='admin/deletesuggestion.php?hid=$row[hotel_id]'><i class='fa-sharp fa-solid fa-circle-xmark text-3xl text-red-500'></i></a>
        </div
        </td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        $already_displayed = true;
        ?>
        <h1 class="font-poppy text-2xl font-bold pb-4">No suggestions yet.</h1>
        <?php
    }


    $sql = "select * from item_suggestion";
    $res = $con->query($sql);
    if ($res->num_rows > 0) {
        ?>
        <h1 class="font-poppy text-2xl font-bold pb-4">New item suggestions.</h1>
        <?php
        echo "<table class='w-full text-center'>";
        echo "<tr class='w-full bg-gray-300 h-14 text-xl'>
                <th class=''>Username</th>
                <th class=''>Hotel Name</th>
                <th class=''>Item name</th>
                <th class=''>Price</th>
                <th class=''>Action</th>
                </tr>";
        while ($row = $res->fetch_assoc()) {
            $sql1 = "select * from hotel where hotel_id=$row[hotel_id]";
            $res1 = $con->query($sql1);
            $row1 = $res1->fetch_assoc();
            echo "<tr class='h-14 odd:bg-gray-300'><td class=''>$row[uname]";
            echo "<td class=''>$row1[hotel_name]</td>";
            echo "<td class=''>$row[item_name]</td>";
            echo "<td class=''>$row[item_price]</td>";
            echo "<td class=''>
        <div id='links-container'>
        <a href='admin/add_item.php?sid=$row[s_id]&hid=$row[hotel_id]&uname=$row[uname]&hotel_name=$row1[hotel_name]&item_name=$row[item_name]&price=$row[item_price]'><i class='fa-solid fa-circle-check text-3xl text-green-500'></i></a>
        <a href='admin/delete_item_suggestion.php?sid=$row[s_id]'><i class='fa-sharp fa-solid fa-circle-xmark text-3xl text-red-500'></i></a>
        </div
        </td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        if($already_displayed==false){
        ?>
        <h1 class="font-poppy text-2xl font-bold pb-4">No suggestions yet.</h1>
        <?php
        }
    }
    ?>


    <script>
        var linksContainer = document.getElementById('links-container');
        var contentContainer = document.getElementById('content-container');
        linksContainer.addEventListener('click', function (event) {
            event.preventDefault();
            var link = event.target;
            var href = link.getAttribute('href');
            var xhr = new XMLHttpRequest();
            xhr.open('GET', href);
            xhr.onload = function () {
                contentContainer.innerHTML = xhr.responseText;
            };
            xhr.send();
        });
    </script>

</body>

</html>