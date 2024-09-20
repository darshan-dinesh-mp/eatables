<?php
session_start();
include "dbconnect.php";

// Check if user is logged in
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}

// Handle account deletion
if (isset($_POST['delete_account'])) {
    // Delete user data from database
    $user_id = $_SESSION['id'];
    $query = "DELETE FROM user WHERE uid = $user_id";
    mysqli_query($con, $query);

    // Log user out and redirect to homepage
    session_destroy();
    header("Location: index.php");
    exit();
}

// Display confirmation message and delete button
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
    <div
        class="bg-brand font-poppy min-h-screen bg-img w-full flex flex-col items-center justify-center p-4 md:py-0 md:px-16">
        <div
            class="flex items-center justify-center flex-col bg-black/70 md:px-12 p-8 text-center  md:py-16 rounded-xl text-white shadow-2xl">

            <div class="flex items-center justify-center space-x-2 text-[red]">
                <i class="fa-solid fa-circle-exclamation text-lg md:text-2xl"></i>
                <h1 class="text-lg md:text-2xl font-extrabold tracking-wider">Delete Account</h1>
            </div>

            <div class="flex items-center justify-center flex-col text-lg md:text-xl my-2">
                <p>Are you sure you want to delete your account? </p>
                <p>This action cannot be undone.</p>
            </div>

            <form method="POST" action="">
                <input type="hidden" name="delete_account" value="true">
                <input type="submit" value="Delete Account"
                    class="py-3 px-6 text-md md:text-lg rounded-lg text-red-600 hover:scale-[1.02] duration-500">
            </form>
        </div>
    </div>
</body>

</html>