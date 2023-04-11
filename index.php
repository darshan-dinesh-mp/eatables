<?php
session_start();
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
		<!-- <meta charset="UTF-8"> -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Eatables App - Search</title>
		<link rel="stylesheet" href="styles/input.css">
		<link rel="stylesheet" href="styles/style.css">
		<script src="https://cdn.tailwindcss.com"></script>
		<script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
		<script >
			$(document).ready(function() {
    $('#search-bar').keyup(function() {
      var query = $(this).val();
      if (query !== '') {
        $.ajax({
          url: 'search.php',
          method: 'POST',
          data: {query: query},
          success: function(data) {
            $('#search-results').html(data);
          }
        });
      } else {
        $('#search-results').html('');
      }
    });
  });
  
		</script>
	</head>

	<body>
		<script>
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition);
			} else {
				console.log("Geolocation is not supported by this browser.");
			}

			function showPosition(position) {
				const latitude = position.coords.latitude;
				const longitude = position.coords.longitude;
				console.log(`Latitude: ${latitude}, Longitude: ${longitude}`);
			}
		</script>
		
		<div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
			<div class="flex items-center w-full justify-between margin-one">
				<a href="index.php" class="text-2xl md:text-4xl font-colvet">
					eatables.
				</a>
				<form action="userprofile.php" method="post">
					<button type="submit" name="logout" class="logout-btn">
						<i class="fa-solid fa-user text-xl"></i>
					</button>
				</form>
			</div>
			<div class="grid gap-3 grid-cols-1 w-full mt-16 md:mt-40 space-y-0 place-items-center">
				<div class="flex items-center justify-around relative w-full md:w-2/4">
					<div class="flex items-center justify-center flex-col w-full">
						<h1 class="font-poppy text-2xl md:text-3xl pb-3 font-bold text-center">
							find your favorite!
						</h1>
						<form action="" method="get">
						<input id="search-bar" name="search" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-32 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="Search for places..." type="text" />
						</form>
						<div id="search-results" style="font-family: 'Poppins black';">
						</div>
						
						<div class="flex flex-wrap items-center justify-center md:space-x-3 md:space-y-0 space-y-3 flex-col md:flex-row">
						<?php
			
						$sql = "SELECT h.hotel_name 
						FROM hotel h 
						INNER JOIN location l ON h.loc_name = l.loc_name ";
						
						$res = $con->query($sql);
						
						if(isset($_GET['search'])){
							$search = $_GET['search'];
							$sql = "SELECT h.hotel_name 
							FROM hotel h 
							INNER JOIN location l ON h.loc_name = l.loc_name 
							WHERE l.loc_name LIKE '%$search%'";
							$res=$con->query($sql);
							if($res->num_rows > 0){
								while($row=$res->fetch_assoc()){
									echo "<br><br><a class='py-2 md:my-4 my-1 mx-2 px-4 hover:bg-black/75 capitalize font-poppy text-center text-white rounded-md bg-black duration-300' href='hotels.php?loc_name=$row[hotel_name]'>$row[hotel_name]</a>";
								}
							} else {
								echo "<p>No results found</p>";
							}
						}
						elseif ($res->num_rows > 0) {?>
						
							<h1 class='text-left font-poppy pt-4'>
							<i class="fa-sharp fa-solid fa-location-dot"></i>
							nearby restaurants
						</h1>
						<?php
							while($row=$res->fetch_assoc()){
								echo "<br><br><a class='py-2 md:my-4 my-1 mx-2 px-4 hover:bg-black/75 capitalize font-poppy text-center text-white rounded-md bg-black duration-300' href='hotels.php?hotel_name=$row[hotel_name]'>$row[hotel_name]</a>";
							}
						}
					
						
					}
						?> </div>
					</div>
				</div>

			</div>

		</div>
	</body>

	</html>