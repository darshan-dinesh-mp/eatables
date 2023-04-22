<!DOCTYPE html>
<html lang="en">

<head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Add Restaurant</title>
     <link rel="stylesheet" href="styles/input.css">
     <link rel="stylesheet" href="styles/style.css">
     <script src="https://cdn.tailwindcss.com"></script>
     <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
     <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
     <?php
     session_start();
     include "dbconnect.php";
    $sql = "select * from  location ";
    $res=$con->query($sql);
     if (!$_SESSION['status']) {
          header("Location: login.php");
          exit;
     } elseif ($_SESSION['user_type'] == 1) {
          $fullname = $_SESSION['fullname'];
     ?>
          <div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
               <div class="flex items-center w-full justify-between margin-one">
                    <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                         eatables.
                    </a>
               </div>
               <div class="grid gap-3 grid-cols-1 w-full mt-16 md:mt-24 space-y-0 place-items-center font-poppy">
                    <div class="flex flex-col items-center justify-center pb-2 md:pb-4">
                         <h1 class="outline-none text-xl md:text-2xl font-poppy">
                              Found a restaurant that's not on our list?
                         </h1>
                         <h1 class="outline-none text-lg md:text-xl font-poppy">
                              Fill the details.
                         </h1>
                    </div>
                    <div class="flex items-center justify-around relative w-full md:w-2/4">
                         <form action="suggestion.php" method="post">
                              Hotel name* : <input type="text" name="hname" required /><br>
                              Location* : <select name="lname">
                                   <?php
                                   while ($row = $res->fetch_assoc()) {
                                   ?>
                                        <option value="<?php echo $row['loc_name'] ?>"><?php echo $row['loc_name'] ?></option>
                                   <?php
                                   }
                                   ?>
                              </select><br>

                              Location (Gmap location link)*: <input type="text" name="lat" /><br>
                              Rating(1-5): <input type="text" name="rate" /><br>
                              link (zomato link): <input type="text" name="link" /><br>
                              description: <input type="text" name="disc" /><br>
                              <input class="bg-black py-2 rounded-md px-6 text-white hover:text-[#F9BB21] duration-300" type="submit" name="suggest" value="Add">
                         </form>
                    </div>
                    *required
               </div>
          </div>
     <?php
     } else {
          echo "<script>window.location.href='login.php'</script>";
     }
     ?>
</body>

</html>