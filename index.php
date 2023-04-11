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
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Eatables App - Search</title>
		<link rel="stylesheet" href="styles/input.css">
		<link rel="stylesheet" href="styles/style.css">
		<script src="https://cdn.tailwindcss.com"></script>
		<script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
	</head>

	<body>
		<div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
			<div class="flex items-center w-full justify-between margin-one">
				<a href="index.php" class="text-2xl md:text-4xl font-colvet">
					eatables.
				</a>
				<form action="logout.php" method="post">
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
						<input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-32 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="Fudopia, Mars" type="text" />
						<h1 class='text-left font-poppy pt-4'> nearby places
							<i class="fa-sharp fa-solid fa-location-dot"></i>
						</h1>
						<div class="flex flex-wrap items-center justify-center md:space-x-3 md:space-y-0 space-y-3 flex-col md:flex-row">
						<?php
						$sql = "select * from location";
						$res = $con->query($sql);
						if ($res->num_rows > 0) {
							while ($row = $res->fetch_assoc()) {
								echo "<a class='py-2 md:my-4 my-1 mx-2 px-4 hover:bg-black/75 capitalize font-poppy text-center text-white rounded-md bg-black duration-300' href='hotels.php?loc_name=$row[loc_name]'>$row[loc_name]</a>";
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