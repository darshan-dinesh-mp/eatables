<!DOCTYPE html>
<html>

<head>
	<title>Eatables</title>
	<link rel="stylesheet" href="style.css">
</head>

<body>
	<?php
	session_start();
	if (!$_SESSION['status']) {
		header("Location: login.php");
		exit;
	} else {
		$con = new mysqli("localhost", "root", "", "eatables");
		if (mysqli_connect_error()) {
			die("Not connected");
		}
		?>
		<form action="logout.php" method="post" id="logout-form">
			<input type="submit" name="logout" value="LOGOUT">
		</form>
		<?php

		echo "<br>";
		echo "<h3><b><u>Top places in mangalore</u></b><br><br></h3>";
		$sql = "select * from location";
		$res = $con->query($sql);
		if ($res->num_rows > 0) {
			while ($row = $res->fetch_assoc()) {
				echo "<a href='items.php?lname=$row[lname]'>$row[lname]";
				echo "<br>";
			}
		}
	}
	?>
</body>

</html>