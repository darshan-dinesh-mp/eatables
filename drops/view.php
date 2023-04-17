<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            min-height: 100vh;
        }

        video {
            width: 640px;
            height: 360px;
        }
    </style>
</head>

<body>
    <br>
    <br>
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
                    <div style="margin-bottom:50px;" class="w-full h-full flex items-center justify-center">
                        <video controls autoplay muted id="video-<?= $video['drop_id'] ?>" class="video-stream html5-main-video" data-no-fullscreen="true" style="width: 567px; height: 1008px; left: 0px; top: 0px;" src="../drops/uploads/<?= $video['video_url'] ?>" loop=""></video>
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
                    <div style="margin-bottom:50px;" class="w-full h-full flex items-center justify-center">
                        <video controls autoplay muted  id="video-<?= $video['drop_id'] ?>" autoplay muted class="video-stream html5-main-video" data-no-fullscreen="true" style="width: 567px; height: 1008px; left: 0px; top: 0px;" src="drops/uploads/<?= $video['video_url'] ?>" loop=""></video>
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
	if(!isset($_GET['review'])){
	if (isset($_GET['error'])) {
                         ?>         
						   <p><?= $_GET['error'] ?></p>
                           <?php } ?>                    
					      <form action='upload.php' method="post" enctype="multipart/form-data" class="flex">
                           <input type="file" name="my_video" class="hover:cursor-pointer font-poppy file:py-3 text-center file:border-0 file:px-6 bg-off-brand w-full">
                           <input type="submit" class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500" name="submit" value="Upload">
                          </form>
						  <?php 
						  }
						  ?>
</body>

</html>
