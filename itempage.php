<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eatables App</title>
    <link rel="stylesheet" href="styles/input.css">
    <link rel="stylesheet" href="styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
    <?php
    session_start();

    include "dbconnect.php";

    if (isset($_GET['item_id'])) {
        $item_id = $_GET['item_id'];
        $_SESSION['item_id'] = $item_id;
    } else {
        $item_id = $_SESSION['item_id'];
    }

    $sql = "SELECT item.item_name,item.item_price,item.item_rating,item.item_img, hotel.hotel_name, hotel.hotel_id, hotel.ratings
        FROM item
        INNER JOIN hotel
        ON item.hotel_id = hotel.hotel_id where item_id=$item_id";
    $res = $con->query($sql);
    $sqlone = "SELECT item.item_name,item.item_price,item.item_rating,item.item_img, hotel.hotel_name, hotel.hotel_id, hotel.ratings
        FROM item
        INNER JOIN hotel
        ON item.hotel_id = hotel.hotel_id where item_id=$item_id";
    $resone = $con->query($sqlone);
    $rowone = $resone->fetch_assoc();
    $user_id = $_SESSION["id"];
    $check_sql = "SELECT * FROM favourite WHERE uid = $user_id AND item_id = $item_id";
    $check_result = $con->query($check_sql);
    $item_in_fav = ($check_result->num_rows > 0);
    ?>
    <div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
        <div class="flex items-center w-full justify-between md:py-4">
            <div>
                <a href="hotels.php?hotel_id=<?php echo $rowone["hotel_id"]; ?>&hotel_name=<?php echo $rowone["hotel_name"]; ?>&rating=<?php echo $rowone["ratings"]; ?>"
                    class="text-3xl md:text-4xl font-colvet">
                    <i class="fa-solid fa-chevron-left text-2xl"></i>
                </a>
                <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                    eatables.
                </a>
            </div>
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

        <div class="w-full font-poppy">
            <div class="flex items-center justify-around relative w-full flex-col h-[40vh]">

                <?php
                if ($res->num_rows > 0) {
                    while ($row = $res->fetch_assoc()) {
                        $img_link = $row['item_img'];
                        echo "
                        <div style='background-image:linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0)),url(" . $img_link . ")' class='h-full bg-cover rounded-xl w-full text-white pl-5 py-10 space-y-4 flex flex-col items-start justify-center my-4'>
                            <div class=''>   
                                <h2 class='text-4xl font-bold capitalize'>$row[item_name]</h2>
                                <h1 class='text-2xl font-medium py-1'>$row[hotel_name]</h1>
                                <h3><span class='text-2xl'>₹</span><span class='text-4xl font-medium'>" . $row["item_price"] . ".00</span></h3>
                            </div>
                            ";
                        ?>
                        <div class="w-full flex space-x-2">
                            <?php
                            if ($item_in_fav == 0) {
                                ?>
                                <form method="post" class="flex items-center justify-center">
                                    <input type="hidden" name="item_id">
                                    <button type="submit"
                                        class="group hover:bg-white hover:text-black duration-500 flex items-center space-x-2 font-poppy font-regular bg-white/25 py-2 px-8 rounded-xl"
                                        name="add_favorite">
                                        <i class="fa-regular fa-heart text-3xl text-[#ff0000] duration-500"></i>
                                        <h1>Add to favorite</h1>
                                    </button>
                                    <button onclick="copyPageUrlToClipboard()"><i
                                            class="fa-solid hover:text-[#f9bb21] fa-share-nodes text-white text-3xl ml-5"></i></button>
                                </form>
                                <?php
                            }
                            if ($item_in_fav == 1) {
                                ?>
                                <form method="post" class="flex items-center justify-center">
                                    <input type="hidden" name="item_id">
                                    <button type="submit"
                                        class="group hover:bg-white hover:text-black duration-500 flex items-center space-x-2 font-poppy font-regular bg-white/25 py-2 px-8 rounded-xl"
                                        name="remove_favorite">
                                        <i class="fa-solid fa-heart text-3xl text-[#ff0000] duration-500"></i>
                                        <h1>Remove favorite</h1>
                                    </button>
                                    <button onclick="copyPageUrlToClipboard()"><i
                                            class="fa-solid hover:text-[#f9bb21] fa-share-nodes text-white text-3xl ml-5"></i></button>
                                </form> <?php
                            }
                            ?>
                        </div>
                    </div>

                </div>
                <div class="w-full flex items-start flex-row justify-between my-4">
                    <form action="itempage.php" class="flex items-center justify-center shadow-sm w-full" method="post">
                        <input type='text' maxlength="256"
                            class="hover:border-brand outline-none rounded-s-lg w-full border-0 text-xl md:text-2xl px-10 py-[0.80rem] md:px-16 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:opacity-0 placeholder:duration-[0.5s]"
                            placeholder="write your review here." name="review" id="review" required />
                        <button type="submit"
                            class=" bg-[rgb(255,255,255,39%)] group py-[0.42rem]  md:py-[0.55rem] px-[0.90rem] rounded-e-lg"
                            name="submit">
                            <i class="fa-brands fa-telegram  text-4xl text-black group-hover:scale-[1.06] duration-500"></i>
                        </button>
                    </form>
                </div>

                <?php
                    }

                    ?>

        </div>
        <p class="absolute py-2 bottom-5 duration-900 rounded-md font-poppy text-white px-8 bg-black/80 z-80 text-lg font-medium hidden"
            id='share-btn'>Link copied!</p>
        <h1 class="text-2xl pb-3 font-poppy font-medium">Latest Reviews</h1>
        <?php
                }
                //adding to favorites
                $user_id = $_SESSION["id"];

                // Check if form was submitted
                if (isset($_POST["add_favorite"])) {
                    // Check if item is already in favorites
                    $check_sql = "SELECT * FROM favourite WHERE uid = $user_id AND item_id = $item_id";
                    $check_result = $con->query($check_sql);
                    if ($check_result->num_rows > 0) {
                        // Item is already in favorites, show error message
                        echo "<h1 class='font-poppy text-xl font-bold'>Item is already in favorites.</h1>";
                    } else {
                        // Item is not in favorites, add it
                        $add_sql = "INSERT INTO favourite (uid, item_id) VALUES ($user_id, $item_id)";
                        $add_result = $con->query($add_sql);
                        if ($add_result) {
                            // Item added to favorites, show success message 
                            echo "<script>window.location.href='itempage.php';</script>";
                            echo "<h1 class='font-poppy text-xl font-bold'>Item added to favorite!</h1>";
                        } else {
                            // Error adding item to favorites, show error message
                            echo "Error adding item to favorites.";
                        }
                    }
                } else if (isset($_POST["remove_favorite"])) {
                    $sql = "DELETE FROM favourite WHERE item_id = $item_id AND uid = $user_id";
                    $res = $con->query($sql);
                    if ($res) {
                        echo "<script>window.location.href='itempage.php?item_id=$item_id'</script>";
                    }
                }
                // Check connection
                if (!$con) {
                    die("connection failed");
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
                        echo "";
                    } else {
                        echo "Error: " . $sql . "<br>" . mysqli_error($con);
                    }
                }

                // Retrieve reviews from database
                $sql = "SELECT review.review_content, user.uname, user.img, review.review_date
                    FROM review
                    INNER JOIN user
                    ON review.uid = user.uid
                    WHERE item_id = $item_id
                    ORDER BY review.review_date DESC";

                $result = mysqli_query($con, $sql);
                // Display reviews
                if (mysqli_num_rows($result) > 0) {
                    while ($row = mysqli_fetch_assoc($result)) {
                        $review_date = strtotime($row['review_date']);
                        $current_date = strtotime(date('Y-m-d H:i:s'));
                        $diff = $current_date - $review_date;
                        $age = '';

                        if ($diff < 60) {
                            $age = 'Just now';
                        } elseif ($diff < 3600) {
                            $age = floor($diff / 60) . ' minutes ago';
                        } elseif ($diff < 86400) {
                            $age = floor($diff / 3600) . ' hours ago';
                        } elseif ($diff < 172800) {
                            $age = 'Yesterday';
                        } elseif ($diff < 31536000) {
                            $age = floor($diff / 86400) . ' days ago';
                        } elseif ($diff < 63072000) {
                            $age = floor($diff / 31536000) . ' year ago';
                        } elseif ($diff < 94608000) {
                            $age = '2 years ago';
                        } else {
                            $age = date('F j, Y', $review_date);
                        }

                        if ($row["img"] == null) {
                            $image = "media/images/user.png";
                        } else {
                            $image = "media/images/user-image/" . $row["img"];
                        }
                        echo "
                            <div class='flex items-start flex-col py-5 bg-black/20 px-8 rounded-xl text-white mb-4 w-full odd:bg-white/20 odd:text-black'>
                                <div class='w-full flex items-center justify-between'>    
                                    <div class='flex items-center space-x-3 flex-row justify-center mr-3'>
                                        <img src=$image class='w-10 h-10 rounded-full  object-cover border-black border-1 md:border-[2px]'>
                                        <h1 class='text-lg font-poppy font-medium'>$row[uname]</h1>
                                    </div>  
                                    <div>  
                                    <h2 class='font-poppy text-sm'>$age</h2>
                                    </div>  
                                </div>  
                                <div class='flex items-start flex-col justify-center'>
                                    <p class='font-poppy text-xl pt-3'>$row[review_content]</p>
                                </div>
                              </div>
                                    ";
                    }
                } else {
                    echo "<h1 class='font-poppy text-xl font-bold'>Oops no reviews found!</h1>";
                }
                ?>
    </div>
    <script>
        function copyPageUrlToClipboard() {
            // Get the current page URL
            const pageUrl = window.location.href;

            // Create a temporary input element to hold the URL
            const tempInput = document.createElement('input');
            tempInput.setAttribute('value', pageUrl);
            document.body.appendChild(tempInput);

            // Select the contents of the input element
            tempInput.select();

            // Copy the selected contents to the clipboard
            document.execCommand('copy');

            // Remove the temporary input element
            document.body.removeChild(tempInput);

            // Show a message to the user
            const shareBtn = document.getElementById('share-btn');
            shareBtn.classList.remove('hidden');
        }
    </script>
</body>

</html>