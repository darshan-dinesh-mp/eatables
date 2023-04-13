<?php
include "dbconnect.php";
if(isset($_GET['hname']))
{
    $hname = $_GET["hname"];
    $_SESSION['hname']=$hname;
}
else{
    $hname=$_SESSION['hname'];
}
$sql="select * from hotel where hotel_name='$hname'";
$res=$con->query($sql);
$row=$res->fetch_assoc();
$sql1 = "select * from  location ";
$res1=$con->query($sql1);


if (!isset($_POST["submit"])) {

   
    ?>
    
    <!-- <form method="POST" action="" enctype="multipart/form-data" class="grid place-items-center justify-center md:grid-rows-2 grid-cols-1 gap-3 mx-4 mt-52 md:mt-32">
    <input type="text" name="hotelname"
                class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                value="<?php echo $user['hotel_name']; ?>">
            <input type="email" name="email"
                class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                value="<?php echo $user['email']; ?>">
            <input type="file" name="img"
                class="font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand w-full">
            <input type="submit" value="update"
                class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500">
        </form> -->


    <form action="edit.php" method="post">
    Hotel name : <input type="text" value=<?php echo $row['hotel_name']; ?> name="hname" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
        Location: <select name="lname" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"> 
                                <?php
                                    while($row1=$res1->fetch_assoc()){
                                        ?>
                                        <option value="<?php echo$row1['loc_name']?>"><?php  echo $row1['loc_name'] ?></option>
                                        <?php
                                    }
                                    ?>
                                    </select><br>
                                
        Location (lat and long): <input type="text" value="<?php echo $row['hotel_loc']; ?>" name="lat" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"/><br>
        Rating(1-5): <input type="text"  value=<?php echo $row['ratings']; ?> name="rate" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
        link (zomato link): <input type="text"  value=<?php echo $row['links']; ?>name="link" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"/><br>
        description: <input type="text"  value="<?php echo $row['disc']; ?>" name="disc" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" /><br>
        <input type="submit" name="submit" value="Add">
      
        <?php
} else {
    $id= $row['hotel_id'];
    $hname = $_POST["hname"];
    $lname = $_POST["lname"];
    $lat = $_POST["lat"];
    $rate=$_POST["rate"];
    $link=$_POST["link"];
    $desc=$_POST["disc"];
    $sql = "UPDATE `hotel` set `hotel_name`=$hname, `hotel_loc`=$lat, `loc_name=$lname,`ratings`=$rate,`links`=$link,`disc`=$desc where 'hotel_id'=$id";
    $res = $con->query($sql);
    if ($res) {
        echo "<script>alert('Hotel $hname  succupdated sessfully.')</script>";
        echo "<script>window.location.href='manage_restaurant.php'</script>";
    }
}
?>