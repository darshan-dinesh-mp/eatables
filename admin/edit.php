<?php
session_start();
include "dbconnect.php";
if (isset($_GET['hname'])) {
    $hname = $_GET["hname"];
    $_SESSION['hname'] = $hname;
} else {
    $hname = $_SESSION['hname'];
}
$sql = "select * from hotel where hotel_name='$hname'";
$res = $con->query($sql);
$row = $res->fetch_assoc();
$sql1 = "select * from  location ";
$res1 = $con->query($sql1);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eatables App - Search</title>
    <link rel="stylesheet" href="../styles/input.css">
    <link rel="stylesheet" href="../styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="../public/eatables.png" type="image/x-icon">
</head>

<body>
    <?php

    if (!isset($_POST["submit"])) {


    ?>
        <div class="bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
            <div class="grid gap-3 grid-cols-1 w-full mt-16 space-y-0 place-items-center font-poppy">
                <div class="flex flex-col items-center justify-center pb-2 md:pb-4">
                    <h1 class="outline-none text-lg md:text-3xl font-poppy">
                        Edit restaurant details.
                    </h1>
                </div>
                <form action="edit.php" method="post" class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
                    Hotel name : <input type="text" required value="<?php echo $row['hotel_name']; ?>" name="hname" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    Location: <select name="lname" required class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]">
                        <?php
                        while ($row1 = $res1->fetch_assoc()) {
                        ?>
                            <option value="<?php echo $row1['loc_name'] ?>"><?php echo $row1['loc_name'] ?></option>
                        <?php
                        }
                        ?>
                    </select><br>
                    Location (Gmap link): <input type="text" required value="<?php echo $row['hotel_loc']; ?>" name="lat" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    Contact: <input type="text" required value="<?php echo $row['contact']; ?>" name="contact" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    Rating(1-5): <input type="text" required value="<?php echo $row['ratings']; ?>" name="rate" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    link (zomato link): <input type="text" required value="<?php echo $row['links']; ?>" name="link" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    description: <input type="text" required value="<?php echo $row['desc']; ?>" name="desc" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
                    <input type="submit" name="submit" value="Add" class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500">
                </form>
            </div>
        </div>
    <?php
    } else {
        $id = $row['hotel_id'];
        $hname = $_POST["hname"];
        $contact = $_POST["contact"];
        $lname = $_POST["lname"];
        $lat = $_POST["lat"];
        $rate = $_POST["rate"];
        // $link=$_POST["link"];
        $desc = $_POST["desc"];
        $sql = "UPDATE `hotel` SET `hotel_name`='$hname', `hotel_loc`='$lat', `loc_name`='$lname', `ratings`='$rate', `desc`='$desc', `contact`='$contact' WHERE `hotel_id`=$id";

        $res = $con->query($sql);
        if ($res) {
            echo "<script>alert('Hotel $hname updated successfully.')</script>";
            echo "<script>window.location.href='../admin.php'</script>";
        }
    }
    ?>
</body>

</html>