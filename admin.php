<?php
session_start();
if (!$_SESSION['status']) {
	header("Location: login.php");
	exit;
} elseif ($_SESSION['user_type'] != 0) {
	echo "<script>window.location.href='login.php'</script>";
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

<body class="min-h-screen w-full bg-slate-200">
	<div class="flex flex-col items-center p-4 md:py-0 md:px-16">
		<div class="flex items-center w-full justify-between md:pt-4">
			<a href="index.php" class="text-2xl md:text-4xl font-colvet flex flex-row items-center justify-center space-x-2 ">
				<img src="media/images/admin.png" class="w-10 h-8" alt="">
				<h1>
					admin
				</h1>
			</a>
			<form action="logout.php" method="post">
				<button type="submit" name="logout" class="logout-btn">
					<i class="fa-solid fa-right-from-bracket text-2xl"></i>
				</button>
			</form>
		</div>
	</div>
	<div class="flex flex-row flex-wrap px-6 items-center justify-center font-poppy text-white w-full pt-8 md:pt-12" id="links-container">
		<a class="bg-brand hover:shadow-md duration-500 py-3 px-5 m-4 rounded-md" href='admin/add_hotel.php'><i class="fa-sharp fa-solid fa-plus mr-2"></i>ADD NEW RESTAURANT</a>
		<a class="bg-brand hover:shadow-md duration-500 py-3 px-5 m-4 rounded-md" href='admin/manage_restaurant.php'><i class="fa-solid fa-pen mr-2"></i>MANAGE RESTAURANT</a>
		<a class="bg-brand hover:shadow-md duration-500 py-3 px-5 m-4 rounded-md" href='admin/add_item.php'><i class="fa-sharp fa-solid fa-plus mr-2"></i>ADD ITEM</a>
		<a class="bg-brand hover:shadow-md duration-500 py-3 px-5 m-4 rounded-md" href='admin/displaysuggestion.php'><i class="fa-sharp fa-solid fa-plus mr-2"></i>User suggestions</a>

	</div>

	<div id="content-container" class="flex flex-row flex-wrap px-6 items-center justify-center font-poppy w-full pt-8 md:pt-12">
	</div>
	<script>
		var linksContainer = document.getElementById('links-container');
		var contentContainer = document.getElementById('content-container');
		linksContainer.addEventListener('click', function(event) {
			event.preventDefault();
			var link = event.target;
			var href = link.getAttribute('href');
			var xhr = new XMLHttpRequest();
			xhr.open('GET', href);
			xhr.onload = function() {
				contentContainer.innerHTML = xhr.responseText;
			};
			xhr.send();
		});
	</script>
</body>

</html>