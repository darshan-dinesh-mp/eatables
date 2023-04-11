<?php
session_start();
if (!$_SESSION['status']) {
	header("Location: login.php");
	exit;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Eatables</title>
	<link rel="stylesheet" href="styles/input.css">
	<link rel="stylesheet" href="styles/style.css">
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
	<link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
	<div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
		<?php
		$con = new mysqli("localhost", "root", "", "eatables");
		if (mysqli_connect_error()) {
			die("Not connected");
		}

		echo "<br>";

		$hotel_name = $_GET['hotel_name'];
		echo "<div class='flex w-full pt-4 items-center justify-between'>
				<div class='flex space-x-2 border-b-2 pb-2 border-black'>
					<i class='fa-sharp fa-solid fa-magnifying-glass text-2xl'></i>		
					<h3 class='font-poppy text-xl'>top picks that suits you in <span class='font-bold text-2xl capitalize'> $hotel_name</span></h3>
				</div>	
				<a href='index.php'>
					<i class='fa-solid fa-xmark text-3xl'></i>
				</a>	
			</div>";
		?>

		<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mt-12 w-full ">
			<?php
			$sql = "select * from hotel where hotel_name='$hotel_name'";
			$res = $con->query($sql);
			if ($res->num_rows > 0) {
				while ($row = $res->fetch_assoc()) {
			?>
					<a class="text-white bg-black hover:scale-[1.03] rounded-lg shadow-lg px-4 py-24 hover:shadow-xl transition-all font-poppy font-semibold text-center bg-img-food duration-500" href="items.php?hotel_name=<?php echo $row['hotel_name']; ?>&hotel_id=<?php echo $row['hotel_id']; ?>">
						<h4 class="text-lg  mb-2 "><?php echo $row['hotel_name']; ?></h4>
						<p class="text-gray-700 hidden"><?php echo $row['description']; ?></p>
					</a>

				<?php
				}
			} else {
				?>
		</div>
		<div class="flex items-center justify-center h-[60vh] flex-col">
			<i class="fa-regular fa-face-sad-tear text-3xl mb-1"></i>
			<p class=" md:grid-cols-1 text-center font-poppy text-xl">Looks like this town is so small, the hotels are playing hide-and-seek!</p>
		</div>
	<?php
			}

	?>
</body>

</html>