<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    ?>
    <form action="add_hotel.php" method="post">
        Hotel name : <input type="text" name="hname" /><br>
        Location : <input type="text" name="lname" /><br>
        Item name : <input type="text" name="iname" /><br>
        <input type="submit" name="submit" value="Add">
    </form>
    <?php
} else {
    $hname = $_POST["hname"];
    $lname = $_POST["lname"];
    $iname = $_POST["iname"];
    $sql = "insert into hotel (hname,lname,iname) values('$hname','$lname','$iname')";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel $hname added successfully.')</script>";
        echo "<script>window.location.href='manage_restaurant.php'</script>";
    }
}
?>