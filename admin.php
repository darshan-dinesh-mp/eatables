<!DOCTYPE html>
<html>

<head>
	<title>Eatables</title>
	<link rel="stylesheet" href="style.css">
	<!-- <link rel="stylesheet" href="input.css"> -->
</head>

<body>
	<?php
	session_start();
	if (!$_SESSION['status']) {
		header("Location: login.php");
		exit;
	}
	?>
	<form action="logout.php" method="post" id="logout-form">
		<input type="submit" name="logout" value="LOGOUT">
	</form>
	<table>
		<tr>
			<th>
				<a href="manage_restaurant.php"><b>Manage restaurants</b></a>
			</th>
		</tr>
		<tr>
			<th>
			<b><?php echo "<a href='add_hotel.php'>ADD NEW RESTAURANT</a>"; ?></b>
			</th>
		</tr>
	</table>
</body>

</html>