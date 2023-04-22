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
    $uname=$_SESSION["fullname"];
    include "dbconnect.php";
if($_POST["suggest"]){
    $hname = $_POST["hname"];
    $lname = $_POST["lname"];
    $lat = $_POST["lat"];
    $rate=$_POST["rate"];
    $link=$_POST["link"];
    $desc=$_POST["disc"];
    $sql = "INSERT INTO `suggestion` (`hotel_id`,`uname`,`hotel_name`, `hotel_loc`, `loc_name`,`ratings`,`links`,`desc`) VALUES (NULL,'$uname', '$hname', '$lat', '$lname','$rate','$link','$desc')";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel $hname added successfully.')</script>";
        // echo "<script>window.location.href='user-profile.php'</script>";
    }
}
    ?>
</body>
</html>