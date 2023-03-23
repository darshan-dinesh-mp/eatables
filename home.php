<!DOCTYPE html>
<html>

<head>
	<title>Eatables</title>
	<style>
		a {
			text-decoration: none;
		}
	</style>
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
		if (isset($_SESSION['status'])) {
			if (isset($_POST['logout'])) {
				session_destroy();
				header("Location: login.php");
				exit;
			}
			?>
			<form action="home.php" method="post" id="logout-form">
				<a href="#" onclick="document.getElementById('logout-form').submit();">Logout</a>
				<input type="hidden" name="logout" value="1">
			</form>
			<?php
		}
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