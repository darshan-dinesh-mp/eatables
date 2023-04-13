<?php
include "dbconnect.php";
if (!isset($_POST["submit"])) {
    $hname = $_GET["hname"];
    $sql="select * from hotel where hotel_name=$hname";
$res=$con->query($sql);
if($res->num_rows>0)
{
} 
    ?>
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
        Rating(1-5): <input type="text" name="rate" /><br>
        link (zomato link): <input type="text" name="link" /><br>
        description: <input type="text" name="disc" /><br>
        <input type="submit" name="submit" value="Add">
        <form method="POST" action="" enctype="multipart/form-data"
            class="grid place-items-center justify-center md:grid-rows-2 grid-cols-1 gap-3 mx-4 mt-52 md:mt-32">
            <h1 class='font-poppy text-3xl'>Edit HOTEL</h1>
            <input type="text" name="fullname"
                class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                value="<?php echo $user['fullname']; ?>">
            <input type="email" name="email"
                class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                value="<?php echo $user['email']; ?>">
            <input type="file" name="img"
                class="font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand w-full">
            <input type="submit" value="update"
                class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500">
        </form>
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
    $sql = "update hotel set hotel_name='$newname',hotel_loc='$newloc' where hotel_name='$hname'";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel details successfully updated.')</script>";
        echo "<script>window.location.href='manage_restaurant.php'</script>";
    }
}
?>