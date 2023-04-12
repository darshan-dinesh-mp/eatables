<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eatables App - Search</title>
    <link rel="stylesheet" href="styles/input.css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
    <div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
        <div class="flex items-center w-full justify-between md:py-4">
            <a href="index.php" class="text-2xl md:text-4xl font-colvet">
                eatables.
            </a>
            <div class='flex items-center justify-between w-32'>
                <form action="user-profile.php" method="post">
                    <button type="submit" name="logout" class="logout-btn">
                        <i class="fa-solid fa-user text-2xl"></i>
                    </button>
                </form>
                <form action="logout.php" method="post">
                    <button type="submit" name="logout" class="logout-btn">
                        <i class="fa-solid fa-right-from-bracket text-2xl"></i>
                    </button>
                </form>
            </div>
        </div>
        <?php
        session_start();
        $con = new mysqli("localhost", "root", "", "eatables");
        if (mysqli_connect_error()) {
            die("Not connected");
        }
        ?>

        <div>

            <h1 class="text-2xl pb-3 font-poppy font-medium">Latest Reviews</h1>
            <?php
                    //adding to favouirte
                    $user_id = $_SESSION["id"];
                    // Check conection
                    if (!$con) {
                        die("conection failed");
                    }

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
                            if ($row["img"] == null) {
                                $image="media/images/user.png";
                            } else {
                                $image = "media/images/user-image/" . $row["img"];
                            }
                            echo "
                            <div class='flex items-start flex-col py-5 bg-black/20 px-8 rounded-xl text-white mb-4 w-full odd:bg-white/20 odd:text-black'>
                                <div class='flex items-center space-x-3 flex-row justify-center mr-3'>
                                    <img src=$image class='w-10 h-10 rounded-full bg-black'>
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
                    ?>
    </div>
</body>

</html>