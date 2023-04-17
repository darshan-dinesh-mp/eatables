<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    $sql = "select * from hotel  ";
    $res=$con->query($sql);

    ?>
    <form action="add_item.php" method="post">
    HOTEL: <select name="hname"> 
                                <?php
                                    while($row=$res->fetch_assoc()){
                                        ?>
                                        <option value="<?php echo$row['hotel_id']?>"><?php  echo $row['hotel_name'] ?></option>
                                        <?php
                                    }
                                    ?>
                                    </select><br>
    item name : <input type="text" name="item" /><br>
    item price : <input type="text" name="price" /><br>
        <input type="submit" name="submit" value="Add">
    </form>
    <?php
} else {
    $hid = $_POST["hname"];
    $item = $_POST["item"];
    $price=$_POST["price"];
    $sql = "INSERT INTO `item` (`hotel_id`, `item_name`, `item_price`) VALUES ('$hid', '$item', '$price')";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('item $item added successfully.')</script>";
        echo "<script>window.location.href='admin.php'</script>";
    }
}
?>