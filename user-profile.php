<?php
session_start();
include "dbconnect.php";
if (!$_SESSION['status']) {
     header("Location: login.php");
     exit;
}
$uid=$_SESSION['id'];
$fullName = $_SESSION['fullname'];
$username = $_SESSION['username'];
$email = $_SESSION['email'];
$sql = "select * from user where uname='$username'";
$res = $con->query($sql);
$row = $res->fetch_assoc();
$imageNull = $row["img"];
if (isset($_GET['review'])) {
     $review_id = $_GET['review'];
 } else {
     $review_id = "";
 }
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
                         ?> class="rounded-full border-black border-4 md:border-[2px] shadow-xl w-28 h-28 md:w-36 md:h-36 object-cover" />
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
               <div class="flex items-center pt-4 space-x-2 w-4/6 md:space-x-16 border-b-[2px] justify-evenly border-black">
                    <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-sharp fa-solid fa-heart text-2xl"></i>
                         <a href="user-profile.php" class="font-poppy font-bold tracking-wider text-sm md:text-xl">Favourite</a>
                    </button>
                    <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-droplet text-2xl"></i>
                         <a href="user-profile.php?review=2" class="font-poppy font-bold tracking-wider text-sm md:text-xl">Drops</a>
                    </button>
                    <button class="flex items-center space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-image text-2xl"></i>
                         <a href="user-profile.php?review=1" class="font-poppy font-bold tracking-wider text-sm md:text-xl">Reviews</a>
                    </button>
               </div>

          </div>
          <?php 
          if($review_id==null){
          ?>


          <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 gap-5 place-content-evenly py-8 w-4/6">
               <?php
               $user = $_SESSION['id'];
               $sql = "SELECT f.fav_id, i.item_id, i.item_name, i.item_price, h.hotel_name
               FROM favourite f
               INNER JOIN item i ON f.item_id = i.item_id
               INNER JOIN hotel h ON i.hotel_id = h.hotel_id
               WHERE f.uid = '$user'";
               $result = $con->query($sql);

               if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                         echo "
                         <div class='font-poppy rounded-2xl bg-img-food from-white-op to-black-op  pb-4 px-6 hover:scale-[1.01] hover:shadow-xl duration-500 flex flex-col items-end'>
                              <a href='remove-favorite.php?item_id=$row[item_id]' class='hover:scale-[1.2] hover:rotate-[30deg] duration-500 mt-4'>
                                             <i class='fa-solid fa-xmark text-4xl text-red-500'></i>
                               </a>
                              <a href='itempage.php?item_id=$row[item_id]' class='pt-40'>
                                        <img src='media/images/eat-fav.png'/>
                                        <h1 class='text-white font-medium text-2xl'>Chicken " . $row['item_name'] . "yani</h1>
                                        
                              </a>
                         </div>
                              ";
                    }
               } else {
               ?>
          </div>

          <p class='font-poppy text-xl text-center md:text-center'>No favorites found.</p>

     <?php
          }
     }
          elseif($review_id==1){
     ?>
       <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 gap-5 place-content-evenly py-8 w-4/6">
       <?php  
       // Retrieve reviews from database
       $sql = "SELECT item.item_name,hotel.hotel_name,review.review_content, review.review_date
       FROM review
       INNER JOIN item on item.item_id=review.item_id
       INNER JOIN hotel on hotel.hotel_id=item.hotel_id
       WHERE uid = $uid
       ORDER BY review.review_date DESC";

       $result = mysqli_query($con, $sql);
       // Display reviews
       if (mysqli_num_rows($result) > 0) {
           while ($row = mysqli_fetch_assoc($result)) {
               if ($imageNull == null) {
                   $image="media/images/user.png";
               } else {
                   $image = "media/images/user-image/" . $imageNull;
               }
               echo "
               <div class='flex items-start flex-col py-5 bg-black/20 px-8 rounded-xl text-white mb-4 w-full odd:bg-white/20 odd:text-black'>
                   <div class='flex items-center space-x-3 flex-row justify-center mr-3'>
                       <img src=$image class='w-10 h-10 rounded-full  object-cover border-black border-1 md:border-[2px]'>
                       <h1 class='text-lg font-poppy font-medium'>$username</h1>
                       <h2 class='text-lg font-poppy font-medium'>$row[item_name]</h2>
                       <h3 class='text-lg font-poppy font-medium'>$row[hotel_name]</h3>
                   </div>  
                   <div class='flex items-start flex-col justify-center'>
                       <p class='font-poppy text-xl pt-3'>$row[review_content]</p>
                   </div>
               </div>
                       ";
           }
       } else {
           echo "<h1 class='font-poppy text-center text-xl'>Oops no reviews found!</h1>";
       }
     }
     elseif($review_id==2){
          ?>
          <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 gap-5 place-content-evenly py-8 w-4/6">
               <h1>SOMETHIG BIG IS COOKING</h1>
     </div>


     <?php
     }
       ?>

          </div>

     </div>

</body>