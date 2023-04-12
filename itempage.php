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

        $path = "media/images/user-images/";
        $image = $path . $_SESSION['img'];

        if (isset($_GET['item_id'])) {
            $item_id = $_GET['item_id'];
            $_SESSION['item_id'] = $item_id;
        } else {
            $item_id = $_SESSION['item_id'];
        }

        $sql = "SELECT item.item_name,item.item_price,item.item_rating, hotel.hotel_name
                FROM item
                INNER JOIN hotel
                ON item.hotel_id = hotel.hotel_id where item_id=$item_id";
        $res = $con->query($sql); ?>
        <div class="w-full font-poppy">
            <div class="flex items-center justify-around relative w-full flex-col h-[25vh]">
                <div class="w-full">
                    <?php
                    if ($res->num_rows > 0) {
                        while ($row = $res->fetch_assoc()) {
                            echo "<h1 class='text-3xl font-bold capitalize'>$row[hotel_name]</h1>";
                            echo "<h2 class='text-2xl font-medium'>$row[item_name]</h2>";
                            echo "<h3 class='text-2xl font-medium'><span class='text-lg'>₹</span>" . $row["item_price"] . ".00</h3>";
                    ?>
                </div>
                <div class="w-full">
                    <form method="post" class="">
                        <input type="hidden" name="item_id">
                        <button type="submit" class="group flex items-center space-x-2 font-poppy font-semibold bg-white/40 py-2 px-8 rounded-full" name="add_favourite">
                            <i class="fa-solid fa-heart text-3xl text-red-600 group-hover:scale-[1.10] animate-pulse duration-500"></i>
                            <h1>Add to favouirte</h1>
                        </button>
                    </form>
                </div>
            </div>
        <?php
                        }

        ?> <div class="w-full flex items-start flex-col my-4">

            <form action="itempage.php" class="flex items-center justify-center" method="post">
                <input type='text' maxlength="150" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-[0.80rem] rounded-md md:px-16 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="write your review here." name="review" id="review" />
                <button type="submit" class="ml-3" name="submit">
                    <i class="fa-solid fa-location-arrow text-4xl hover:rotate-[50deg] duration-500"></i>
                </button>
            </form>
        </div>

        </div>

    <?php
                    }
                    //adding to favouirte
                    $user_id = $_SESSION["id"];

                    // Check if form was submitted
                    if (isset($_POST["add_favourite"])) {

                        // Check if item is already in favourites
                        $check_sql = "SELECT * FROM favourite WHERE uid = $user_id AND item_id = $item_id";
                        $check_result = $con->query($check_sql);
                        if ($check_result->num_rows > 0) {
                            // Item is already in favourites, show error message
                            echo "Item is already in favourites.";
                        } else {
                            // Item is not in favourites, add it
                            $add_sql = "INSERT INTO favourite (uid, item_id) VALUES ($user_id, $item_id)";
                            $add_result = $con->query($add_sql);
                            if ($add_result) {
                                // Item added to favourites, show success message
                                echo "<script>alert('Item added to favourites')</script>.";
                            } else {
                                // Error adding item to favourites, show error message
                                echo "Error adding item to favourites.";
                            }
                        }
                    }
                    // Check conection
                    if (!$con) {
                        die("conection failed");
                    }

                    // If form is submitted
                    if (isset($_POST['submit'])) {
                        // Get form data
                        $user = $_SESSION['id'];
                        $review = $_POST['review'];
                        $review_date = date('Y-m-d H:i:s');
                        $item_id = $_SESSION['item_id'];

                        // Insert review into database0
                        $sql = "INSERT INTO review (uid, item_id, review_content,review_date) VALUES ('$user', '$item_id', '$review', '$review_date')";
                        if (mysqli_query($con, $sql)) {
                            header("Location: itempage.php");
                        } else {
                            echo "Error: " . $sql . "<br>" . mysqli_error($con);
                        }
                    }

                    // Retrieve reviews from database
                    $sql = "SELECT review.review_content, user.uname
        FROM review
        INNER JOIN user
        ON review.uid = user.uid where item_id = $item_id;
        ";
                    $result = mysqli_query($con, $sql);
    ?>
    <div>
        <h1 class="text-xl font-poppy font-medium">Latest Reviews</h1>

        <?php
        // Display reviews
        if (mysqli_num_rows($result) > 0) {
            while ($row = mysqli_fetch_assoc($result)) {
                echo "
                <div class='flex items-start py-8 bg-black/50 px-8 rounded-xl text-white mb-4'>
                    <div class='flex items-start flex-col justify-center mr-3'>
                    <p class='w-10 h-10 rounded-full bg-black'></p>
                </div>  
                <div class='flex items-start flex-col justify-center'>
                        <h1 class='text-xl font-poppy font-medium'>Darshan Dinesh MP</h1>
                        <p class='font-poppy text-lg pt-1'>Lorem ipsum dolor sit amet consectetur adipisicing elit. Suscipit adipisci ex velit ad laborum, dolorum vel autem maiores cumque ea? Ratione, sit voluptas cumque harum deleniti officiis et eveniet labore?</p>
                    </div>
                </div>
        ";
            }
        } else {
            echo "No reviews found.";
        }
        ?>
    </div>
    </div>
    </div>
</body>

</html>