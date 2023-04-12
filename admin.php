<?php
session_start();
if (!$_SESSION['status']) {
	header("Location: login.php");
	exit;
} elseif ($_SESSION['user_type'] != 0) {
	header("Location: login.php");
	echo "<script>alert('engoottaaaaaa')</script>";
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		Eatables - Admin
	</title>
	<link rel="stylesheet" href="styles/input.css">
	<link rel="stylesheet" href="styles/style.css">
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
	<div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
		<div class="flex items-center w-full justify-between md:pt-4">
			<a href="index.php" class="text-2xl md:text-4xl font-colvet">
				<i class="fa-solid fa-user text-2xl"></i>admin eatables.
			</a>
			<form action="logout.php" method="post">
				<button type="submit" name="logout" class="logout-btn">
					<i class="fa-solid fa-right-from-bracket text-2xl"></i>
				</button>
			</form>
		</div>
		<div class="flex flex-col items-center justify-center w-full pt-8 md:pt-12">

			<a href="manage_restaurant.php">Manage restaurants</a>
			<?php echo "<a href='add_hotel.php'>ADD NEW RESTAURANT</a>"; ?>

		</div>
	</div>
</body>

</html>