<?php
session_start();
include "dbconnect.php";

// Check if user is logged in
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="styles/input.css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>

    <?php

    // Get user information from database
    $user_id = $_SESSION['id'];
    $query = "SELECT * FROM user WHERE uid = $user_id";
    $result = mysqli_query($con, $query);
    $user = mysqli_fetch_assoc($result);

    // Handle form submission
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        $fullname = mysqli_real_escape_string($con, $_POST['fullname']);
        $email = mysqli_real_escape_string($con, $_POST['email']);

        if (!empty($_FILES['img']['name'])) {
            $image_name = $_FILES['img']['name'];
            $image_tmp_name = $_FILES['img']['tmp_name'];
            $image_error = $_FILES['img']['error'];
            if ($image_error === UPLOAD_ERR_OK) {
                $target_dir = 'media/images/user-image/'; // specify the target directory where you want to move the image
                $target_file = $target_dir . basename($image_name); // set the target file path
                if (move_uploaded_file($image_tmp_name, $target_file)) {
                    $query = "update user set fullname='$fullname', email='$email', img='$image_name' where uid=$user_id";
                    mysqli_query($con, $query);
                    $_SESSION['fullname'] = $fullname;
                    $_SESSION['email'] = $email;
                    $_SESSION['path'] = $target_file;
                } else {
                    echo "Error moving image file";
                }
            } else {
                echo "Error uploading image file";
            }
        }
        // Update user information in database

        // Redirect to profile page
        header("Location:user-profile.php");
        exit();
    }

    // Display user information and edit form
    ?>
    <div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
        <div class="flex items-center w-full justify-between md:mt-4">
            <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                eatables.
            </a>
            <a href="user-profile.php" class="text-2xl duration-500 hover:rotate-[90deg]">
                <i class="fa-solid fa-xmark "></i>
            </a>
        </div>
        <form method="POST" action="" enctype="multipart/form-data" class="grid place-items-center justify-center md:grid-rows-2 grid-cols-1 gap-3 mx-4 mt-52 md:mt-32">
            <i class="fa-solid fa-user-pen text-5xl"></i>
            <h1 class='font-poppy text-3xl'>Edit Profile</h1>
            <input type="text" name="fullname" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl  px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" value="<?php echo $user['fullname']; ?>">
            <input type="email" name="email" class="hover:border-brand outline-none opacity-90 border-0 w-full md:w-auto text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" value="<?php echo $user['email']; ?>">
            <input type="file" name="img" class="hover:cursor-pointer font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand w-full">
            <input type="submit" value="update" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500">
        </form>
        <div class="my-24">
            <a href="delete-account.php" class="font-poppy">
                <i class="fa-solid fa-trash"></i>
                <span>
                    Delete your account!
                </span>
            </a>
        </div>
    </div>
</body>