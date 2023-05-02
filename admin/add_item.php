<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    $sql = "select * from hotel ";
    $res = $con->query($sql);

?>
    <form action="admin/add_item.php" method="post" class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
        HOTEL: <select name="hid">
            <?php
            while ($row = $res->fetch_assoc()) {
            ?>
                <option value="<?php echo $row['hotel_id'] ?>"><?php echo $row['hotel_name'] ?></option>
            <?php
            }
            ?>
        </select><br>

        item name : <input type="text" name="item" /><br>
        item price : <input type="text" name="price" /><br>
        <input type="submit" name="submit" value="Add" class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500" />
    </form>
<?php
} else {
    $hid = $_POST["hid"];
    $item = $_POST["item"];
    $price = $_POST["price"];
    $sql = "INSERT INTO `item` (`hotel_id`, `item_name`, `item_price`) VALUES ($hid, '$item', '$price')";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('item $item added successfully.')</script>";
        echo "<script>window.location.href='../admin.php'</script>";
    }
}
?>