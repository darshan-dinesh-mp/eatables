<?php
session_start();
include "../dbconnect.php";
if (isset($_POST['submit']) && isset($_FILES['my_video'])) {
	$video_name = $_FILES['my_video']['name'];
	$tmp_name = $_FILES['my_video']['tmp_name'];
	$error = $_FILES['my_video']['error'];
	if ($error === 0) {
		$video_ex = pathinfo($video_name, PATHINFO_EXTENSION);

		$video_ex_lc = strtolower($video_ex);

		$allowed_exs = array("mp4", 'webm', 'avi', 'flv');

		if (in_array($video_ex_lc, $allowed_exs)) {

			$new_video_name = uniqid("video-", true) . '.' . $video_ex_lc;
			$video_upload_path = '../drops/uploads/' . $new_video_name;
			if (move_uploaded_file($tmp_name, $video_upload_path)) {
				$uid = $_SESSION['id'];
				$date = date('d-m-y h:i:s');
				// Insert the video path into database
				$sql = "INSERT INTO drops(uid,video_url,drop_date) 
                   VALUES($uid,'$new_video_name','$date')";
				mysqli_query($con, $sql);

				$count_drops = "select count(uid) as count from drops where uid=$uid";
				$count_result = $con->query($count_drops);
				$count_row = $count_result->fetch_assoc();
				if($count_row["count"]>2){
					$update_verify="update user set verified=1 where uid=$uid";
					$update_verify_result=$con->query($update_verify);
				}

				if (isset($_GET['review'])) {
					header("Location: ../user-profile.php?review=2");
				} else {

					header("Location: view.php");
				}
			}
		} else {
			if (isset($_GET['review'])) {
				$em = "You can't upload files of this type";
				header("Location: ../user-profile.php?review=2&error=$em");
			} else {

				$em = "You can't upload files of this type";
				header("Location: view.php?error=$em");
			}

		}
	}


} else {
	if (isset($_GET['review'])) {
		header("Location: ../user-profile.php?review=2");
	} else {

		header("Location: view.php");
	}
}