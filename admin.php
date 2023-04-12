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

<!-- <body>
	<div class=" min-h-screen w-full flex flex-col items-center p-4 md:py-0 md:px-16">
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
		<div class="flex flex-col items-center justify-center w-full pt-8 md:pt-12">

			<a href="manage_restaurant.php">Manage restaurants</a>
			<?php echo "<a href='add_hotel.php'>ADD NEW RESTAURANT</a>"; ?>

		</div>
	</div>
</body> -->

<body>

	<aside id="default-sidebar" class="fixed top-0 left-0 z-40 w-64 h-screen transition-transform -translate-x-full sm:translate-x-0" aria-label="Sidebar">
		<div class="h-full px-3 py-4 overflow-y-auto bg-gray-50 dark:bg-gray-800">
			<ul class="space-y-2 font-medium">
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<!-- <img src="media/images/admin.png" /> -->
						<span class="font-colvet text-2xl">Dashboard</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Manage Restaurants</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path d="M8.707 7.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l2-2a1 1 0 00-1.414-1.414L11 7.586V3a1 1 0 10-2 0v4.586l-.293-.293z"></path>
							<path d="M3 5a2 2 0 012-2h1a1 1 0 010 2H5v7h2l1 2h4l1-2h2V5h-1a1 1 0 110-2h1a2 2 0 012 2v10a2 2 0 01-2 2H5a2 2 0 01-2-2V5z"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Inbox</span>
						<span class="inline-flex items-center justify-center w-3 h-3 p-3 ml-3 text-sm font-medium text-blue-800 bg-blue-100 rounded-full dark:bg-blue-900 dark:text-blue-300">3</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Users</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Products</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M3 3a1 1 0 00-1 1v12a1 1 0 102 0V4a1 1 0 00-1-1zm10.293 9.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L14.586 9H7a1 1 0 100 2h7.586l-1.293 1.293z" clip-rule="evenodd"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Sign In</span>
					</a>
				</li>
				<li>
					<a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
						<svg aria-hidden="true" class="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
							<path fill-rule="evenodd" d="M5 4a3 3 0 00-3 3v6a3 3 0 003 3h10a3 3 0 003-3V7a3 3 0 00-3-3H5zm-1 9v-1h5v2H5a1 1 0 01-1-1zm7 1h4a1 1 0 001-1v-1h-5v2zm0-4h5V8h-5v2zM9 8H4v2h5V8z" clip-rule="evenodd"></path>
						</svg>
						<span class="flex-1 ml-3 whitespace-nowrap">Sign Up</span>
					</a>
				</li>
			</ul>
		</div>
	</aside>

	<div class="p-4 sm:ml-64">
		<div class="p-4 border-2 border-gray-200 border-dashed rounded-lg dark:border-gray-700">
			<div class="grid grid-cols-3 gap-4 mb-4">
				<div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center h-24 rounded bg-gray-50 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
			</div>
			<div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-800">
				<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
			</div>
			<div class="grid grid-cols-2 gap-4 mb-4">
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
			</div>
			<div class="flex items-center justify-center h-48 mb-4 rounded bg-gray-50 dark:bg-gray-800">
				<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
			</div>
			<div class="grid grid-cols-2 gap-4">
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
				<div class="flex items-center justify-center rounded bg-gray-50 h-28 dark:bg-gray-800">
					<p class="text-2xl text-gray-400 dark:text-gray-500">+</p>
				</div>
			</div>
		</div>
	</div>

</body>

</html>