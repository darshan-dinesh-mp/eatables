<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eatables</title>
    <link rel="stylesheet" href="../styles/input.css">
    <link rel="stylesheet" href="../styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>
<?php if (isset($_GET["hid"]) || isset($_GET["hotel_name"]) || isset($_GET["item_name"]) || isset($_GET["price"])) { ?>

    <body class="min-h-screen w-full bg-slate-200">
        <div class="flex flex-col items-center md:py-4 md:px-16">
            <div class="flex items-center w-full justify-between">
                <a href="index.php" class="text-2xl md:text-4xl font-colvet flex flex-row items-center justify-center space-x-2 ">
                    <img src="../media/images/admin.png" class="w-10 h-8" alt="">
                    <h1>
                        admin
                    </h1>
                </a>
                <form action="logout.php" method="post">
                    <button type="submit" name="logout" class="logout-btn">
                        <i class="fa-solid fa-right-from-bracket text-2xl"></i>
                    </button>
                </form>
            </div>
        </div>
    <?php
}
include "dbconnect.php";
$hid = null;
$hotel_name = null;
$item_name = null;
$price = null;
if (isset($_GET["hid"]) || isset($_GET["hotel_name"]) || isset($_GET["item_name"]) || isset($_GET["price"])) {
    $hid = $_GET["hid"];
    $hotel_name = $_GET["hotel_name"];
    $item_name = $_GET["item_name"];
    $price = $_GET["price"];
    $sid = $_GET["sid"];
}
if (!isset($_POST["submit"])) {
    $sql = "select * from  item_suggestion";
    $res = $con->query($sql);
    ?>
        <form action="add_item.php" method="post" class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
            Hotel name : <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" type="text" required name="hname" value="<?= $hotel_name ?>" /><br>
            Item name : <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" type="text" required name="item" value="<?= $item_name ?>" /><br>
            Item price : <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" type="text" required name="price" value="<?= $price ?>" /><br>
            <input type="hidden" name="hid" value="<?= $hid ?>">
            <input type="hidden" name="sid" value="<?= $sid ?>">
            <input type="submit" name="submit" value="Submit" class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500" />
        </form>
    <?php
} else {
    $hid = $_POST["hid"];
    $hname = $_POST["hname"];
    $item_name = $_POST["item"];
    $price = $_POST["price"];
    $sid = $_POST["sid"];
    $sql = "INSERT INTO `item` (`hotel_id`, `item_name`, `item_price`,`item_img`) VALUES ('$hid','$item_name','$price','https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80')";
    $res = $con->query($sql);
    echo $res . "  |  " . $sql;
    if ($res) {
        echo "<script>alert('Item $item_name added successfully.')</script>";
        $sql = "select * from item_suggestion";
        $res = $con->query($sql);
        if ($res->num_rows > 0) {
            // echo "<script>window.location.href='delete_item_suggestion.php?sid=$sid'</script>";
        }
        // echo "<script>window.location.href='../admin.php'</script>";
    }
}
    ?>
    </body>

</html>