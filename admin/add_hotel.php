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
    include "dbconnect.php";
    $uname = null;
    $hotel_name = null;
    $hotel_loc = null;
    $loc_name = null;
    $ratings = null;
    $links = null;
    $desc = null;
    if (isset($_GET["uname"]) || isset($_GET["hotel_name"]) || isset($_GET["hotel_loc"]) || isset($_GET["loc_name"]) || isset($_GET["ratings"]) || isset($_GET["links"]) || isset($_GET["desc"])) {
        $uname = $_GET["uname"];
        $hotel_name = $_GET["hotel_name"];
        $hotel_loc = $_GET["hotel_loc"];
        $loc_name = $_GET["loc_name"];
        $ratings = $_GET["ratings"];
        $links = $_GET["links"];
        $desc = $_GET["desc"];
    }
    if (!isset($_POST["submit"])) {
        $sql = "select * from  location ";
        $res = $con->query($sql);

    ?>
        <form action="admin/add_hotel.php" method="post" class="grid md:grid-cols-1 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    Hotel name :
                </span>
                <input type="text" name="hname" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" value="<?php echo $hotel_name ?>" />
            </div>
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    Location:
                </span>
                <select name="lname" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]">
                    <?php
                    while ($row = $res->fetch_assoc()) {
                    ?>
                        <option value="<?php echo $row['loc_name'] ?>"><?php echo $row['loc_name'] ?></option>
                    <?php
                    }
                    ?>
                </select>
            </div>
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    Location (Gmap location link):
                </span>
                <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" type="text" name="lat" value="<?php echo $hotel_loc ?>" />
            </div>
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    Rating(1-5):
                </span>
                <input type="text" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" name="rate" value="<?php echo $ratings ?>" />
            </div>
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    link (zomato link):
                </span>
                <input type="text" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" name="link" value="<?php echo $links ?>" />
            </div>
            <div class="flex flex-col">
                <span class="font-poppy font-bold">
                    description:
                </span>
                <input type="text" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 md:px-16 md:py-2 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" name="desc" value="<?php echo $desc ?>" />
            </div>
            <input type="submit" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500" name="submit" value="Add" class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500">
        </form>
    <?php
    } else {
        $hname = $_POST["hname"];
        $lname = $_POST["lname"];
        $lat = $_POST["lat"];
        $rate = $_POST["rate"];
        $link = $_POST["link"];
        $desc = $_POST["desc"];
        $sql = "INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_loc`, `loc_name`,`ratings`,`links`,`desc`) VALUES (NULL, '$hname', '$lat', '$lname','$rate','$link','$desc')";
        $res = $con->query($sql);
        if ($res) {
            echo "<script>alert('Hotel $hname added successfully.')</script>";
            echo "<script>window.location.href='admin.php'</script>";
        }
    }
    ?>
</body>

</html>