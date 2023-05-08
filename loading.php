<?php
session_start();
$user_img = $_SESSION['img'];
if (!$_SESSION['status']) {
	header("Location: login.php");
	exit;
} else {
	include "dbconnect.php";
?>
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
		<script>
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(position => {
					let place = document.getElementById('place-name');
					const lat = position.coords.latitude;
					const lng = position.coords.longitude;
					const url = `https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${lat}&lon=${lng}`;

					fetch(url)
						.then(response => response.json())
						.then(data => {
							const placeName = data.display_name;
							console.log(placeName);
							const currentPlace = placeName.split(",")[0];
							const mainPlace = placeName.split(",")[1];
							const main2Place = placeName.split(",")[2];
							place.innerText = mainPlace + "," + main2Place;
							
							$.ajax({
								url: "livelocation.php",
								type: "POST",
								data: {
									value: mainPlace
								},
								success: function(response) {
									console.log(response);
									if(response !== 'error'){
										// Redirect to another page
										window.location.href = 'index.php';
									}
								}
							});
						})
						.catch(error => console.error(error));
				}, error => {
					console.error(error.message);
				}, {
					enableHighAccuracy: true
				});
			} else {
				console.log("Geolocation is not supported by this browser.");
			}
			
		</script>

	</head>

	<body>
							<p class="font-semibold" id='place-name'></p>
						</a>
						<?php 
						} ?>
					
	</body>

	</html>