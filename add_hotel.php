<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    $sql = "select * from  location ";
    $res=$con->query($sql);

    ?>
    <form action="add_hotel.php" method="post">
        Hotel name : <input type="text" name="hname" /><br>
        Location: <select name="lname"> 
                                <?php
                                    while($row=$res->fetch_assoc()){
                                        ?>
                                        <option value="<?php echo$row['loc_name']?>"><?php  echo $row['loc_name'] ?></option>
                                        <?php
                                    }
                                    ?>
                                    </select><br>
                                
        Location (lat and long): <input type="text" name="lat" /><br>
        <input type="submit" name="submit" value="Add">
    </form>
    <?php
} else {
    $hname = $_POST["hname"];
    $lname = $_POST["lname"];
    $lat = $_POST["lat"];
    $sql = "INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_loc`, `loc_name`) VALUES (NULL, '$hname', '$lat', '$lname')";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel $hname added successfully.')</script>";
        echo "<script>window.location.href='manage_restaurant.php'</script>";
    }
}
?>