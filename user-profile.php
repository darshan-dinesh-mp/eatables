<?php
session_start();
include "dbconnect.php";
if (!$_SESSION['status']) {
     header("Location: login.php");
     exit;
}
$uid = $_SESSION['id'];
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
     <div class="bg-brand min-h-screen bg-img bg-fixed w-full flex flex-col items-center p-4 md:py-0 md:px-16">
          <div class="flex items-center w-full justify-between md:pt-4">
               <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                    eatables.
               </a>
               <form action="logout.php" method="post" class='flex items-center justify-between w-36 md:w-40'>
                    <a href="drops/view.php"><i class="fa-solid fa-droplet text-2xl cursor-pointer "></i></a>
                    <a id="upload-btn">
                         <i class="fa-solid fa-video text-2xl cursor-pointer"></i>
                    </a>
                    <button type="submit" name="logout" class="logout-btn">
                         <i class="fa-solid fa-right-from-bracket text-2xl"></i>
                    </button>
               </form>
          </div>
          <div class="flex flex-col items-center justify-center w-full pt-8 md:pt-12">
               <div class="relative">
                    <a href="edit-profile.php" class="flex items-center justify-center absolute bottom-0 right-0 z-5 p-3 bg-black/80 hover:text-[#f9bb21] duration-300 w-8 h-8 text-white rounded-full">
                         <i class="fa-solid fa-camera text-[12px]"></i>
                    </a>
                    <img src="<?php echo $imageNull == null ? 'media/images/user.png' : $path; ?>" class="rounded-full border-black border-4 md:border-5 shadow-xl w-28 h-28 md:w-32 md:h-32 object-cover" />
               </div>

               <h1 class="font-poppy text-1xl md:text-2xl font-semibold pt-2 text-center">
                    <span>
                         <?php
                         echo $fullName;
                         ?>
                    </span>
                    <?php
                    if ($row['verified'] == 1) {
                         echo "<i class='fa-solid fa-circle-check text-[10px] md:text-[16px]'></i>";
                    } else {
                         echo "";
                    } ?>
               </h1>
               <h1 class="font-poppy text-lg font-medium text-center">
                    @<?php
                         echo $username;
                         ?>
               </h1>
               <div class="flex space-x-2">
                    <a href="mailto:<?php
                                        echo $email;
                                        ?>" class="font-poppy text-md font-medium lowercase">
                         <?php
                         echo $email;
                         ?>
                    </a>
               </div>
               <div class="my-3 font-poppy flex items-center flex-col md:flex-row flex-wrap justify-evenly md:w-1/10 space-y-2 md:space-y-0">

                    <a href="edit-profile.php" class="bg-black py-2 rounded-md px-6 text-white hover:text-[#F9BB21] duration-300">
                         <i class="fa-solid fa-pen-to-square mr-1"></i>
                         Edit Profile
                    </a>
                    <?php if ($_SESSION['user_type'] == 0) { ?>
                         <a href="admin.php" class="bg-black cursor-pointer mx-2 py-2 rounded-md px-4 text-white hover:text-[#F9BB21] duration-300">
                              <i class="fa-solid fa-gear mr-1"></i>
                              Manage eatables
                         </a>
                    <?php
                    } ?>
               </div>
               <div class="flex items-center space-x-2 w-full md:w-4/6 md:space-x-16 border-b-[2px] justify-evenly border-black">
                    <a href="user-profile.php" class="w-1/4 justify-center flex items-center hover:bg-black/10 py-3 px-8 duration-500 space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense ">
                         <i class="fa-sharp fa-solid fa-heart text-2xl"></i>
                         <span class="font-poppy font-semibold md:block hidden">Favorites</span>
                    </a>
                    <a href="user-profile.php?review=2" class=" w-1/4 flex justify-center items-center hover:bg-black/10 py-3 px-8 duration-500 space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-droplet text-2xl"></i>
                         <span class="font-poppy font-semibold md:block hidden"> Drops</span>
                    </a>
                    <a href="user-profile.php?review=1" class="w-1/4 flex justify-center items-center hover:bg-black/10 py-3 px-8 duration-500 space-x-2 md:space-x-3 text-xl md:my-0 pb-3 text-dense">
                         <i class="fa-solid fa-eye text-2xl"></i>
                         <span class="font-poppy font-semibold md:block hidden"> Reviews</span>
                    </a>
               </div>
          </div>
          <!-- Favorite Component loads below -->
          <?php
          if ($review_id == null) {
          ?>
               <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-3 gap-5 place-content-evenly py-8 w-full md:w-4/6">
                    <?php
                    $user = $_SESSION['id'];
                    $sql = "SELECT f.fav_id, i.item_id, i.item_name, i.item_price,i.item_img, h.hotel_name
                    FROM favourite f
                    INNER JOIN item i ON f.item_id = i.item_id
                    INNER JOIN hotel h ON i.hotel_id = h.hotel_id
                    WHERE f.uid = '$user'";
                    $result = $con->query($sql);

                    if ($result->num_rows > 0) {
                         while ($row = $result->fetch_assoc()) {
                              $img_links = $row['item_img'];
                    ?>
                              <div class='font-poppy rounded-2xl from-white-op to-black-op  pb-4 px-6 hover:scale-[1.01] hover:shadow-xl duration-500 flex flex-col items-end justify-between' style="background-image:linear-gradient(to top, rgba(0, 0, 0, 0.916), rgba(0, 0, 0, 0.155)), url( <?php echo $img_links; ?>); background-size:cover;">
                                   <?php
                                   echo "
                                   <a href='remove-favorite.php?item_id=$row[item_id]' class='hover:rotate-[90deg] duration-500 mt-4 '>
                                                  <i class='fa-solid fa-xmark text-2xl text-white'></i>
                                   </a>
                                   <a href='itempage.php?item_id=$row[item_id]' class='pt-40 w-full'>
                                             <h1 class='text-white font-medium text-md'> " . $row['hotel_name'] . "</h1>
                                             <h1 class='text-white font-medium text-2xl'> " . $row['item_name'] . "</h1>
                                   </a>";
                                   ?>
                              </div>
                         <?php
                         }
                    } else {
                         ?>
               </div>
               <p class=' font-poppy font-medium text-xl text-center md:text-center'>Don't have any favorites yet?
                    <br>Let Eatables help you discover your new go-to dishes!<br><a href="index.php" class="underline">explore more</a>
               </p>
          <?php
                    }
               } elseif ($review_id == 1) {
          ?>
          <div class="grid grid-cols-1 sm:grid-cols-1 md:grid-cols-1 gap-5 place-content-evenly py-8 w-full md:w-4/6">
               <?php
                    // Retrieve reviews from database
                    $sql = "SELECT item.item_name,hotel.hotel_name,review.review_content, review.review_date, review.review_id
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
                                   $image = "media/images/user.png";
                              } else {
                                   $image = "media/images/user-image/" . $imageNull;
                              }
                              echo "
                                        <div class='flex items-center py-5 justify-between bg-black/20 px-8 rounded-xl text-white w-full odd:bg-white/20 odd:text-black'>
                                             <div class='flex items-start flex-col'>
                                                  <div class='flex items-center space-x-3 flex-row justify-center mr-3'>
                                                       <img src=$image class='w-10 h-10 rounded-full  object-cover border-black border-1 md:border-[2px]'>
                                                      <div>
                                                            <h1 class='text-lg font-poppy font-medium'>$username</h1>
                                                            <div class='flex items-start flex-col justify-center'>
                                                                 <p class='font-poppy text-sm space-x-2'>
                                                                      <i class='fa-solid fa-utensils'></i>
                                                                      $row[item_name] | 
                                                                      $row[hotel_name]
                                                                 </p>
                                                            </div>
                                                       </div>
                                                       
                                                   </div>  
                                                       <div>
                                                              <p class='font-poppy text-xl pt-2'> $row[review_content]</p>
                                                       </div>
                                             </div> 
                                             <a href='remove-review.php?review_id=$row[review_id]'>
                                                  <i class='fa-solid fa-trash text-xl cursor-pointer hover:text-red-700'></i>
                                              </a>
                                        </div>
                                         ";
                         }
                    } else {
                         echo "<h1 class='opacity-0 '></h1>";
                         echo "<h1 class='font-poppy text-xl font-medium text-center mt-28'>Uh-oh! No reviews found? <br> Time to dig in and discover new flavors with Eatables!</h1>";
                         echo "<h1 class='opacity-0 '></h1>";
                    }
               ?>
          </div>
     <?php
               } elseif ($review_id == 2) {
     ?>
          <div class="flex flex-row items-center w-3/4 justify-center flex-wrap md:pt-4 ">
               <?php
                    $uid = $_SESSION['id'];
                    $sql = "SELECT * FROM drops where uid=$uid ORDER BY drop_date DESC";
                    $res = mysqli_query($con, $sql);

                    if (mysqli_num_rows($res) > 0) {
                         while ($video = mysqli_fetch_assoc($res)) {
                              $sqllike = "select * from likes where u_id=$_SESSION[id] and drop_id=$video[drop_id]";
                              $resultlike = $con->query($sqllike);
                              $rowlike = $resultlike->fetch_assoc();
               ?>
                         <div class="hover:scale-[1.01] duration-500 m-2 relative flex items-center justify-center cursor-pointer">
                              <video id="video-<?= $video['drop_id'] ?>" class="re playable-video h-[30rem] rounded-md" data-no-fullscreen="true" src="drops/uploads/<?= $video['video_url'] ?>"></video>
                              <h1 class="absolute z-50 text-white font-poppy text-bold w-full h-full hover:bg-black/80 hover:rounded-md bg-black/0 flex items-center justify-center duration-500"><i class="fa-solid fa-heart mr-1"></i><?php echo $video["likes"]; ?></h1>
                         </div>
               <?php
                         }
                    } else {
                         echo "<div class='flex flex-col items-center justify-center font-poppy space-y-2'>
                   <h1 class='font-poppy text-xl font-medium text-center mt-28'>Something big is cooking at Eatables! <br> Join us as we explore the world of food and discover new flavors.</h1>
                 </div>
                 ";
                    } ?>
          </div>
          <?php
                    if (isset($_GET['error'])) {
          ?>
               <p>
                    <?= $_GET['error'] ?>
               </p>
     <?php }
               }
     ?>
     </div>
     <div id="modal" class="modal">
          <div class="modal-content">
               <form action='drops/upload.php' method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center space-x-2 space-y-3 md:space-y-4 px-4 py-8">
                    <input type="text" name="hotel-name" class="rounded-lg hover:border-brand outline-none opacity-90 border-2 border-black text-xl md:text-2xl px-10 py-2 md:px-16 w-full placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:opacity-0 placeholder:duration-[0.5s]" placeholder="Hotel name" required>
                    <input type="file" name="my_video" class="hover:cursor-pointer font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand rounded-xl w-full" required>
                    <button type="submit" class="py-[0.50rem] md:py-[0.70rem] space-x-2 tracking-wider px-9 md:px-12 text-xl font-poppy duration-500 hover:bg-black/30 rounded-xl" name="submit" value="Upload"><i class="fa-solid fa-arrow-up-from-bracket text-xl"></i><span>Upload</span></button>
                    <button type='button' id="close" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy duration-500 close hover:bg-black/30 rounded-xl" onclick="closess();"><i class="fa-solid fa-xmark text-xl"></i></button>
               </form>
          </div>
     </div>
     <script>
          function closess() {
               var modal = document.getElementById("modal");
               if (modal.style.display == "none") {
                    modal.style.display = "block";
               } else {
                    modal.style.display = "none"
               }

          }
     </script>
     </div>
     <?php
     include "components/footer.php";
     ?>
     <script src="script/modal.js"></script>
</body>

</html>