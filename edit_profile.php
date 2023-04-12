<?php
session_start();
$con = new mysqli("localhost", "root", "", "eatables");
if ($con->connect_errno) {
    die("Not connected");
}

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

        // Update user information in database
        $query = "UPDATE user SET fullname = '$fullname', email = '$email' WHERE uid = $user_id";
        mysqli_query($con, $query);
        $_SESSION['fullname'] = $fullname;
        $_SESSION['email'] = $email;

        // Redirect to profile page
        header("Location:userprofile.php");
        exit();
    }

    // Display user information and edit form
    ?>
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

        <h1 class='font-poppy text-xl'>Edit Profile</h1>
        <form method="POST" action="" class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4"">
            <input type=" text" name="fullname" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" value="<?php echo $user['fullname']; ?>">
            <input type="email" name="email" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" value="<?php echo $user['email']; ?>">
            <input type="file" name="img">
            <input type="submit" value="update" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500">
        </form>
    </div>
    </div>

</body>

</html>