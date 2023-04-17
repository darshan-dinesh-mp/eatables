<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View</title>
    <link rel="stylesheet" href="../styles/input.css">
    <link rel="stylesheet" href="../styles/style.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="../public/eatables.png" type="image/x-icon">
    <style>

    </style>
</head>

<body>
    <div class="bg-brand min-h-screen bg-img bg-fixed w-full flex flex-col items-center">

        <div class="flex flex-col items-center justify-center w-full">
            <div class="alb">

                <?php
                if (!isset($_SESSION['id'])) {
                    session_start();
                    include "../dbconnect.php";
                    $sql = "SELECT * FROM drops ORDER BY drop_id DESC";
                    $res = mysqli_query($con, $sql);
                    if (mysqli_num_rows($res) > 0) {
                        while ($video = mysqli_fetch_assoc($res)) {
                            ?>
                            <div class="w-[30rem] h-[100vh] shadow-xl relative ">
                                <h1
                                    class="w-full pl-5 pt-3 h-20 text-3xl md:text-4xl font-colvet text-white absolute bg-gradient-to-b from-black">
                                    eatables.
                                </h1>
                                <video controls id="video-<?= $video['drop_id'] ?>" class="re playable-video "
                                    data-no-fullscreen="true" src="../drops/uploads/<?= $video['video_url'] ?>"></video>
                                <div
                                    class="w-full h-32 px-5 flex justify-between absolute z-50 bottom-0 font-poppy bg-gradient-to-t from-black text-white">
                                    <div class="flex flex-col w-3/4">
                                        <div class="flex items-center my-2 space-x-2">
                                            <img class="w-10 h-10 rounded-full"
                                                src="http://localhost/eatables/media/images/user-image/DB.webp" />
                                            <h1 class=' text-xl text-white'>delbingeorge</h1>
                                        </div>
                                        <p> Omelette Cheese Burger | Hamburg Street Food Cafe</p>
                                    </div>
                                    <div class="flex flex-col items-center space-y-3">
                                        <i class="fa-regular fa-heart text-3xl cursor-pointer"></i>
                                        <i class="fa-regular fa-bookmark text-3xl cursor-pointer"></i>
                                    </div>
                                </div>
                            </div>
                            <?php
                        }
                    }
                } else {
                    $uid = $_SESSION['id'];
                    $sql = "SELECT * FROM drops where uid=$uid ORDER BY drop_id DESC";
                    $res = mysqli_query($con, $sql);
                    if (mysqli_num_rows($res) > 0) {
                        while ($video = mysqli_fetch_assoc($res)) {
                            ?>
                            <div class="w-[420px] h-[780px] shadow-xl relative bg-gradient-to-r from-cyan-500 to-blue-500 ">
                                <h1 class="text-3xl md:text-4xl font-colvet text-white absolute ml-3">
                                    eatables.
                                </h1>
                                <video controls="hidden" id="video-<?= $video['drop_id'] ?>" class="re playable-video"
                                    data-no-fullscreen="true" src="../drops/uploads/<?= $video['video_url'] ?>"></video>
                            </div>
                            <?php
                        }
                    } else {
                        echo "<h1>Empty</h1>";
                    }
                }
                ?>
            </div>
            <?php
            if (!isset($_GET['review'])) {
                if (isset($_GET['error'])) {
                    ?>
                    <p>
                        <?= $_GET['error'] ?>
                    </p>
                <?php } ?>
                <!-- <form action='upload.php' method="post" enctype="multipart/form-data" class="flex">
                    <input type="file" name="my_video" class="hover:cursor-pointer font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand w-full">
                    <input type="submit" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500" name="submit" value="Upload">
                </form> -->
                <?php
            }
            ?>
        </div>
    </div>

</body>

</html>