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

</head>

<body>
    <button id="upload-btn" class="bg-[#f9bb21] w-16 h-16 rounded-full fixed z-[9999] bottom-8 right-8">
        <i class="fa-solid fa-video text-2xl text-black"></i>
    </button>
    <?php
    if (!isset($_SESSION['id'])) {
        session_start();
        include "../dbconnect.php";
        $sql = "SELECT drops.drop_id, drops.video_url , drops.hotel_name, drops.likes, user.uid, user.fullname, user.img
        FROM drops
        INNER JOIN user
        ON drops.uid = user.uid
        ORDER BY drop_id DESC";
        $res = mysqli_query($con, $sql);
        if (mysqli_num_rows($res) > 0) {

            while ($video = mysqli_fetch_assoc($res)) {
                $imageNull = $video["img"];
                if ($imageNull == null) {
                    $image = "../media/images/user.png";
                } else {
                    $image = "../media/images/user-image/" . $imageNull;
                }
    ?>
                <div class="w-full px-5 h-20 z-50 bg-gradient-to-b fixed top-0 flex items-center justify-between">
                    <a href="../user-profile.php" class="text-3xl w-3/4 md:text-4xl font-colvet text-white ">
                        eatables.
                    </a>
                    <div class="w-28 flex items-center justify-between">
                        <a href="../user-profile.php" class="text-xl md:text-2xl text-white duration-500 hover:text-[#f9bb21]">
                            <i class="fa-solid fa-user "></i>
                        </a>
                        <a href="../index.php" class="text-xl md:text-2xl text-white duration-500 hover:text-[#f9bb21]">
                            <i class="fa-solid fa-house "></i>
                        </a>
                    </div>
                </div>
                <div class="bg-black overflow-hidden bg-fixed w-full flex flex-col items-center">

                    <div class="flex flex-col items-center justify-center w-full">

                        <div class="md:w-[30rem] md:h-[100vh] h-full shadow-2xl relative ">
                            <video controls autoplay="true" id="video-<?= $video['drop_id'] ?>" class="re playable-video md:w-[30rem] md:h-[100vh] object-cover" data-no-fullscreen="true" src="../drops/uploads/<?php echo $video["video_url"]; ?>"></video>
                            <div class="w-full h-36 px-2 md:px-5 flex justify-between absolute z-50 bottom-0 font-poppy bg-gradient-to-t from-black text-white">
                                <div class="flex flex-col w-3/4">
                                    <div class="flex items-center my-2 space-x-2">
                                        <img class="w-8 md:w-10 h-8 md:h-10 rounded-full" src="<?php echo $image ?>" />
                                        <h1 class=' text-sm md:text-xl text-white'><?php echo $video["fullname"]; ?></h1>
                                    </div>
                                    <p class="md:text-lg text-sm"><?php echo $video["hotel_name"] ?></p>
                                </div>
                                <a href="drops.php/view.php" class="flex flex-col">
                                    <?php
                                    $sqllike = "select * from likes where u_id=$_SESSION[id] and drop_id=$video[drop_id]";
                                    $resultlike = $con->query($sqllike);
                                    $rowlike = $resultlike->fetch_assoc();

                                    if ($resultlike->num_rows > 0) {
                                        if (isset($rowlike["likes"])) {
                                            if ($rowlike["likes"]) {
                                    ?>
                                                <div class="flex flex-col items-center">
                                                    <div class="flex flex-col items-center">

                                                        <a href="like.php?drop_id=<?= $video['drop_id'] ?>&likestatus=<?= $rowlike["likes"] ?>"><i class="fa-solid fa-heart text-3xl cursor-pointer hover:text-red-500"></i></a>
                                                    <?php
                                                } else {
                                                    ?>
                                                        <a href="like.php?drop_id=<?= $video['drop_id'] ?>&likestatus=<?= $rowlike["likes"] ?>"><i class="fa-regular fa-heart text-3xl cursor-pointer hover:text-red-500"></i></a>
                                                    <?php
                                                }
                                            } else {
                                                    ?>
                                                    <a href="like.php?drop_id=<?= $video['drop_id'] ?>&likestatus=<?php echo $rowlike["likes"] ?>"><i class="fa-regular fa-heart text-3xl cursor-pointer hover:text-red-500"></i></a>
                                                <?php
                                            }
                                        } else {
                                                ?>
                                                <a href="like.php?drop_id=<?= $video['drop_id'] ?>&likestatus=0"><i class="fa-regular fa-heart text-3xl cursor-pointer hover:text-red-500"></i></a>
                                            <?php
                                        }
                                        echo $video["likes"];
                                            ?>
                                                    </div>
                                                    <button onclick="copyPageUrlToClipboard()"><i class="fa-solid hover:text-[#f9bb21] fa-share-nodes text-white text-3xl mt-2"></i></button>
                                                </div>
                                </a>
                            </div>
                        </div>
                    <?php
                }
            } else {
                include '../404.php';
            }
        }
        if (!isset($_GET['review'])) {
            if (isset($_GET['error'])) {
                    ?>
                    <p>
                        <?= $_GET['error'] ?>
                    </p>
                <?php } ?>

            <?php
        }
            ?>

                    </div>
                </div>
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <form action='upload.php' method="post" enctype="multipart/form-data" class="flex flex-col items-center justify-center space-x-2 space-y-3 md:space-y-4 px-4 py-8">
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
                <script>
                    const autoplayVideos = document.querySelectorAll('.autoplay-video');

                    const observer = new IntersectionObserver(entries => {
                        entries.forEach(entry => {
                            if (entry.isIntersecting) {
                                // Play the video
                                entry.target.autoplay = true;
                                entry.target.play();
                            } else {
                                // Pause the video
                                entry.target.autoplay = false;
                                entry.target.pause();
                            }
                        });
                    });

                    autoplayVideos.forEach(video => {
                        observer.observe(video);
                    });
                </script>

                <script src="../script/modal.js"></script>
</body>

</html>