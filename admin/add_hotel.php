<?php
include "dbconnect.php";
$uname=null;
$hotel_name=null;
$hotel_loc=null;
$loc_name=null;
$ratings=null;
$links=null;
$desc=null;
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
    <form action="admin/add_hotel.php" method="post">
        Hotel name : <input type="text" name="hname" value="<?php echo $hotel_name?>" /><br>
        Location: <select name="lname">
            <?php
            while ($row = $res->fetch_assoc()) {
                ?>
                <option value="<?php echo $row['loc_name'] ?>"><?php echo $row['loc_name'] ?></option>
                <?php
            }
            ?>
        </select><br>

        Location (Gmap location link): <input type="text" name="lat" value="<?php echo $hotel_loc?>" /><br>
        Rating(1-5): <input type="text" name="rate" value="<?php echo $ratings?>" /><br>
        link (zomato link): <input type="text" name="link" value="<?php echo $links?>" /><br>
        description: <input type="text" name="desc" value="<?php echo $desc?>" /><br>
        <input type="submit" name="submit" value="Add">
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