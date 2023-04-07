<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    $hname = $_GET["hname"];
    echo $hname;
    ?>
    <form action="edit.php" method="post">
        Hotel name : <input type="text" name="newname" /><br>
        Location : <input type="text" name="newloc" /><br>
        <input type="hidden" name="hname" value="<?php echo $hname; ?>">
        <input type="submit" name="submit" value="Confirm">
    </form>
    <?php
} else {
    $hname = $_POST["hname"];
    $newname = $_POST["newname"];
    $newloc = $_POST["newloc"];
    $sql = "update hotel set hname='$newname',lname='$newloc' where hname='$hname'";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel details successfully updated.')</script>";
        echo "<script>window.location.href='manage_restaurant.php'</script>";
    }
}
?>