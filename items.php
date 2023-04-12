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
</head>

<body>
	<?php
	session_start();
	$con = new mysqli("localhost", "root", "", "eatables");
	if (mysqli_connect_error()) {
		die("Not connected");
	}
	$hotel_name = $_GET['hotel_name'];
	$hotel_id = $_GET['hotel_id'];
	echo "<h3>Must try items in $hotel_name</h3>";
	$sql = "select * from item where hotel_id='$hotel_id'";

	$res = $con->query($sql);
	?>

	<div class="bg-brand min-h-screen bg-img w-full flex flex-col items-center p-4 md:py-0 md:px-16">
		<div class="flex items-center w-full justify-between md:pt-4">
			<a href="index.php" class="text-2xl md:text-4xl font-colvet">
				eatables.
			</a>
			<form action="logout.php" method="post">
				<button type="submit" name="logout" class="logout-btn">
					<i class="fa-solid fa-right-from-bracket text-2xl"></i>
				</button>
			</form>
		</div>
		<?php
		if ($res->num_rows > 0) {
			while ($row = $res->fetch_assoc()) {
				echo "<a href='itempage.php?item_id=$row[item_id]'>$row[item_name]";
				echo "<br>";
			}
		}
		?>
	</div>
</body>

</html>