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
					console.log(lat, lng);
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
			$(document).ready(function () {
				$('#search-bar').keyup(function () {
					var query = $(this).val();
					if (query !== '') {
						$.ajax({
							url: 'search.php',
							method: 'POST',
							data: {
								query: query
							},
							success: function (data) {
								$('#search-results').html(data);
							}
						});
						// $('#search-results').on('click', 'a', function(e) {
						// 	e.preventDefault();
						// 	var query = $(this).text();
						// 	window.location.href = 'hotels.php?hotel_id=' + query;
						// });
					} else {
						$('#search-results').html('');
					}
				});

			});
		</script>

	</head>

	<body>
		<div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
			<div class="flex items-center w-full justify-between margin-one">
				<a href="index.php" class="text-3xl md:text-4xl font-colvet">
					eatables.
				</a>
				<div class='flex items-center justify-between w-20'>
					<a href="drops/view.php"><i class="fa-solid fa-droplet text-2xl cursor-pointer "></i></a>
					<a href="user-profile.php" class="flex items-center justify-center space-x-3">
						<img class="<?php echo
							$_SESSION['img'] == null ? "w-6 h-6" : "w-9 h-9 rounded-full border-2 shadow-sm border-black"
							?>" src="<?php
						echo $_SESSION['img'] == null ? 'media/images/user.png' : 'media/images/user-image/' . $user_img;
						?>" />
					</a>
				</div>
			</div>
			<div class="grid gap-3 grid-cols-1 w-full mt-16 md:mt-40 space-y-0 place-items-center">
				<div class="flex items-center justify-around flex-col relative w-full md:w-3/4">
					<div class="flex items-center justify-center flex-col w-full">
						<?php
						// Retrieve data from location table
						$query = "SELECT * FROM location";
						$result = mysqli_query($con, $query);

						// Check if the value of loc_name column matches $_SESSION['loc'] while ignoring case
						if (isset($_SESSION["loc"])) {
							while ($row = mysqli_fetch_assoc($result)) {
								$loc1 = str_replace(' ', '', strtolower($row['loc_name']));
								$loc2 = str_replace(' ', '', strtolower($_SESSION['loc']));
								//change to != for viewing the o/p in other locations
								if ($loc1 == $loc2) {
									?>
									<h1 class="font-poppy text-2xl md:text-3xl pb-3 font-medium text-center">
										Find your next favorite.
									</h1>
									<form action="" method="get">
										<input id="search-bar" name="search"
											class="hover:border-brand w-full outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-32 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s] blind "
											placeholder="Search Restaurants" type="text" />
									</form>
									<div id="search-results" class="font-poppy text-xl pt-3 search-suggestions">
									</div>
									<a href="index.php"
										class='font-poppy text-center font-medium text-[1.40rem] py-2 flex md:flex-row flex-col space-x-1 items-center justify-center'>
										<div class="flex items-center justify-center space-x-1">
											<?php if (!isset($_GET['search'])) { ?>
												<i class="fa-sharp fa-solid fa-location-dot text-[1.40rem]"></i>
												<p>restaurants near</p>
											</div>
											<p class="font-semibold" id='place-name'></p>
										</a>

										<div
											class="flex flex-wrap items-center justify-center md:space-x-3 md:space-y-0 space-y-3 flex-col md:flex-row">
											<?php
											}
											$sql = "SELECT h.hotel_name,h.hotel_id,h.ratings
							FROM hotel h 
							INNER JOIN location l ON h.loc_name = l.loc_name ";
											$res = $con->query($sql);
											if (isset($_GET['search'])) {
												$search = $_GET['search'];
												$sql = "SELECT h.hotel_name,h.hotel_id,h.ratings
								FROM hotel h 
								WHERE hotel_name LIKE '%$search%'";
												$res = $con->query($sql);

												if ($res->num_rows > 0) {

													while ($row = $res->fetch_assoc()) {
														$ratings = $row['ratings'];
														echo "<br class='md:block hidden'><br class='md:block hidden'><a class='py-2 md:my-4 my-1 mx-2 px-4 bg-black/75 capitalize font-poppy text-center text-white rounded-md hover:bg-black duration-300' href='hotels.php?hotel_id=$row[hotel_id]&hotel_name=$row[hotel_name]&rating=$ratings&page=1'>$row[hotel_name]</a>";
													}
												} else {
													?>
												<div class='flex items-center justify-center h-[60vh] flex-col'>
													<i class='fa-regular fa-face-sad-tear text-3xl mb-1'></i>
													<p class='md:grid-cols-1 text-center font-poppy text-xl'>It seems like you are on Mars!</p>
												</div>

												<?php
												}
											} elseif ($res->num_rows > 0) {
												$i = 1;
												while (($row = $res->fetch_assoc()) && $i <= 10) {
													$ratings = $row['ratings'];
													$i++;
													echo "<br class='md:block hidden'><br class='md:block hidden'><a class='py-2 md:my-4 my-1 mx-2 px-4 bg-black/75 capitalize font-poppy text-center text-white rounded-md hover:bg-black duration-300' href='hotels.php?hotel_id=$row[hotel_id]&hotel_name=$row[hotel_name]&rating=$ratings&page=1'>$row[hotel_name]</a>";
												}
											}
											?>
									</div>
								</div>

							</div>
						</div>
						<?php
						include ("bot/index.php");
						?>
					</div>
					<?php
					include 'components/footer.php'; ?>
					<?php
								} else {
									require ('noservice.php');
								}
							}
						} else {
							echo "<script>window.location.href = 'loading.php';</script>";
						}
}
?>
</body>

</html>