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
		include "dbconnect.php";
		?>
		<form action="logout.php" method="post" id="logout-form">
			<input type="submit" name="logout" value="LOGOUT">
		</form>
		<?php

		echo "<br>";
		echo "<h3><b><u>Top places in mangalore</u></b><br><br></h3>";
		// echo"<a href='review.php'>review page<br></a>";
		$sql = "select * from location";
		$res = $con->query($sql);
		if ($res->num_rows > 0) {
			while ($row = $res->fetch_assoc()) {
				echo "<a href='hotels.php?loc_name=$row[loc_name]'>$row[loc_name]</a>";
				echo "<br>";
			}
		}
	}
	?>
</body>

</html>