<?php
session_start();
include "dbconnect.php";
if (!$_SESSION['status']) {
     header("Location: login.php");
     exit;
}

$fullName = $_SESSION['fullname'];
$username = $_SESSION['username'];
$email = $_SESSION['email'];
$sql = "select * from user where uname='$username'";
$res = $con->query($sql);
$row = $res->fetch_assoc();
$imageNull = $row["img"];
if (!isset($_SESSION["path"])) {
     $path = "media/images/user-image/" . $row["img"];
} else {
     $path = $_SESSION['path'];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>
          <?php echo $fullName; ?>
     </title>
     <link rel="stylesheet" href="styles/input.css">
     <link rel="stylesheet" href="styles/style.css">
     <script src="https://cdn.tailwindcss.com"></script>
     <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
     <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
     <div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
          <div class="flex items-center w-full justify-between md:pt-4">
               <a href="index.php" class="text-2xl md:text-4xl font-colvet">
                    eatables.
               </a>
               <form action="logout.php" method="post">
                    <button type="submit" name="logout" class="logout-btn">
                         <i class="fa-solid fa-right-from-bracket text-2xl"></i>
                    </button>
               </form>
          </div>
          <div class="flex flex-col items-center justify-center w-full pt-8 md:pt-12">
               <img src=<?php if ($imageNull == null) {
                              echo 'media/images/user.png';
                         } else {

                              echo "$path";
                         }
                         ?> class="rounded-full border-black border-4 md:border-[6px] shadow-xl w-28 h-28 md:w-28 md:h-28 object-cover" />
               <h1 class="font-poppy text-1xl md:text-2xl font-semibold pt-2 text-center">
                    <?php
                    echo $fullName;
                    ?>
               </h1>
               <h1 class="font-poppy text-lg font-medium text-center">
                    @<?php
                         echo $username;
                         ?>
               </h1>
               <div class="flex space-x-2">
                    <h2 class="font-poppy text-md font-medium lowercase">
                         <?php
                         echo $email;
                         ?>
                    </h2>
               </div>
               <div class="my-3 font-poppy flex items-center justify-evenly w-full">
                    <a href="edit-profile.php" class="bg-black py-2 rounded-md px-6 text-white hover:text-[#F9BB21] duration-300">
                         <i class="fa-solid fa-pen-to-square mr-1"></i>
                         Edit Profile
                    </a>
                    <!-- <a href="#" class="bg-black py-2 rounded-md px-6 text-white">Edit Profile</a> -->
               </div>
               <div class="flex items-center space-x-2 w-full md:space-x-16 border-b-2 justify-evenly border-black">
                    <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-sharp fa-solid fa-heart text-2xl"></i>
                         <h3 class="font-poppy font-bold tracking-wider text-sm md:text-xl">Favourite</h3>
                    </button>
                    <!-- <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-droplet text-2xl"></i>
                         <h3 class="font-poppy font-bold tracking-wider text-sm md:text-xl">Drops</h3>
                    </button> -->
                    <!-- <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-image text-2xl"></i>
                         <h3 class="font-poppy font-bold tracking-wider text-sm md:text-xl">Posts</h3>
                    </button> -->
               </div>
               <hr class="h-[1px] bg-dense border-none">
               </hr>
          </div>

          <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 gap-5 place-content-evenly py-8 w-full">
               <?php
               $user = $_SESSION['id'];
               $sql = "SELECT f.fav_id,i.item_name, i.item_price, h.hotel_name
               FROM favourite f
               INNER JOIN item i ON f.item_id = i.item_id
               INNER JOIN hotel h ON i.hotel_id = h.hotel_id
               WHERE f.uid = '$user'";
               $result = $con->query($sql);

               if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                         echo "<a href='remove-favourite.php?id=" . $row["fav_id"] . "' class='font-poppy rounded-2xl bg-img-food from-white-op to-black-op pt-44 pb-4 px-6 flex items-start justify-center md:flex-col flex-wrap hover:scale-[1.01] hover:shadow-xl duration-300'>
                                   <img src='media/images/eat-fav.png'/>
                                   <h1 class='text-white font-medium text-2xl'>Chicken " . $row['item_name'] . "yani</h1>
                              </a>";
                    }
               } else {
               ?>
          </div>

          <p class='font-poppy text-xl text-center md:text-center'>No favorites found.</p>

     <?php
               }
     ?>

     </div>

</body>