<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <?php
    session_start();
    $uname = $_SESSION["fullname"];
    include "dbconnect.php";

    if (isset($_POST["suggest_restaurant"])) {
        if ($_POST["suggest_restaurant"]) {
            $hname = $_POST["hname"];
            $lname = $_POST["lname"];
            $lat = $_POST["lat"];
            $contact = $_POST["contact"];
            $rate = $_POST["rate"];
            $link = $_POST["link"];
            $desc = $_POST["desc"];
            $sql = "INSERT INTO `suggestion` (`hotel_id`,`uname`,`hotel_name`, `hotel_loc`, `loc_name`,`ratings`,`links`,`desc`,`contact`) VALUES (NULL,'$uname', '$hname', '$lat', '$lname','$rate','$link','$desc','$contact')";
            $res = $con->query($sql);
            if ($res) {
                echo "<script>alert('Suggestion submitted successfully.')</script>";
                echo "<script>window.location.href='user-profile.php'</script>";
            }
        }
    }

    if (isset($_POST["suggest_item"])) {
        if ($_POST["suggest_item"]) {
            $hid = $_POST["hid"];
            $item = $_POST["iname"];
            $price = $_POST["price"];
            $sql = "INSERT INTO `item_suggestion` (`s_id`,`uname`,`hotel_id`, `item_name`, `item_price`) VALUES (null,'$uname',$hid, '$item', $price)";
            $res = $con->query($sql);
            if ($res) {
                echo "<script>alert('Suggestion submitted successfully.')</script>";
                echo "<script>window.location.href='user-profile.php'</script>";
            }
        }
    }
    ?>
</body>

</html>