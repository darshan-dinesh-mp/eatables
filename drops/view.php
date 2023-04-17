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
		 $uid=$_SESSION['id'];
		 $sql = "SELECT * FROM drops where uid=$uid ORDER BY drop_id DESC";
		 $res = mysqli_query($con, $sql);

		 if (mysqli_num_rows($res) > 0) {
		 	while ($video = mysqli_fetch_assoc($res)) { 
		 ?>
		 		
	        <video controls loop autoplay muted src="drops/uploads/<?=$video['video_url']?>" 
			  >
	        	
	        </video>

	    <?php 
	     }
		 }else {
		 	echo "<h1>Empty</h1>";
		 }
		 ?>
</body>
</html>