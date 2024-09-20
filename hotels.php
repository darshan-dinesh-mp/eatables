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
	<?php
	include "dbconnect.php";

	$hotel_id = $_GET['hotel_id'];
	$hotel_name = $_GET['hotel_name'];
	$rating = $_GET['rating'];
	$sql = "select count(*) as total from item where hotel_id='$hotel_id'";
	$res1 = $con->query($sql);
	$row1 = $res1->fetch_assoc();
	$total_pages = ceil($row1['total'] / 10);
	$page = isset($_GET['page']) ? $_GET['page'] : 1;
	$offset = ($page - 1) * 10;

	// Query the database to get the items for the current page
	$sql = "SELECT * FROM item WHERE hotel_id='$hotel_id' LIMIT $offset, 12";
	$res = $con->query($sql);

	// Count the total number of items
	$total_items = mysqli_num_rows(mysqli_query($con, "SELECT * FROM item WHERE hotel_id='$hotel_id'"));

	// Calculate the total number of pages based on the number of items and the items per page
	$total_pages = ceil($total_items / 12);
	$sql = "select * from hotel where hotel_id=$hotel_id";
	$row = $con->query($sql);
	$desc = '';


	while ($rowTwo = $row->fetch_assoc()) {
		$links = $rowTwo['links'];
		$contact = $rowTwo['contact'];
		$desc = $rowTwo['desc'];
		$gmap = $rowTwo['hotel_loc'];
	}
	?>
	<div class="bg-brand bg-img bg-fixed min-h-screen flex flex-col items-center p-4 md:px-16">
		<div class="flex items-center w-full justify-between">
			<div>
				<a href="index.php" class="text-3xl md:text-4xl font-colvet">
					<i class="fa-solid fa-chevron-left text-2xl"></i>
				</a>
				<a href="index.php" class="text-3xl md:text-4xl font-colvet">
					eatables.
				</a>
			</div>
			<a href="index.php" class="text-3xl duration-500 hover:rotate-[90deg]">
				<i class="fa-solid fa-xmark"></i>
			</a>
		</div>
		<div class="flex justify-between w-full py-7 md:py-6 md:flex-row flex-col space-y-2 md:space-y-0">
			<div class='w-full md:w-3/6'>
				<div class="flex flex-col">
					<h1 class='font-poppy text-2xl md:text-3xl font-bold'><?php echo $hotel_name ?></h1>
					<div class="flex space-x-5 my-1">
						<p class="space-x-1">
							<i class="fa-solid fa-phone"></i>
							<a href="tel:9539361202" class="font-medium"><?php echo $contact ?></a>
						</p>
					</div>
					<h1 class="text-xl"><?php
					if ($rating == '5') {
						echo "⭐⭐⭐⭐⭐";
					} else if ($rating == '4') {
						echo "⭐⭐⭐⭐";
					} else if ($rating == '3') {
						echo "⭐⭐⭐";
					} else if ($rating == '2') {
						echo "⭐⭐";
					} else if ($rating == '1') {
						echo "⭐";
					} else {
						echo "";
					}
					?>
					</h1>
				</div>
				<?php
				if (!isset($desc)) {
					?>
					<p id="" class='font-poppy text-xl pt-2 text-justify'>No info.</p>
					<?php
				} else {
					echo "<p class='font-poppy text-xl pt-2 text-justify'>$desc</p>";
				}
				?>
				<div class="flex space-x-5 mt-4">
					<a href='<?php echo $links; ?>'><img class="w-21 h-9 cursor-pointer"
							src='media/images/zomato.png' /></a>
					<!-- <a href='https://www.swiggy.com'><img class="w-21 h-9 cursor-pointer" src='media/images/swiggy.png' /></a> -->
				</div>
			</div>
			<div class='w-full md:w-2/6'>
				<h1 class='font-poppy text-lg md:text-xl font-bold'><i
						class="fa-sharp fa-solid fa-location-dot mr-1 mb-2"></i>locate on map</h1>
				<iframe class="w-full h-full" src="<?php echo $gmap ?>" width="600" height="450" style="border:0;"
					allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>


			</div>
		</div>
		<?php
		echo "<div class='flex w-full items-center justify-between'>
				<div class='flex space-x-2 border-b-2 pb-2 border-black'>
					<i class='fa-sharp fa-solid fa-utensils text-xl md:text-2xl'></i>		
					<h3 class='font-poppy text-md md:text-xl'>top dishes for you at <span class='font-bold text-xl md:text-2xl capitalize'> $hotel_name</span></h3>
				</div>		
			</div>";
		?>

		<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mt-8 w-full ">

			<?php
			if ($res->num_rows > 0) {
				while (($row = $res->fetch_assoc())) {

					$img_links = $row['item_img'];
					?>
					<a class="text-white hover:scale-[1.01] rounded-lg shadow-lg px-4 py-24 hover:shadow-xl transition-all font-poppy font-semibold text-center duration-500"
						style="background-image:linear-gradient(to top, rgba(0, 0, 0, 0.916), rgba(0, 0, 0, 0.155)), url('<?php echo $img_links; ?>'); background-size:cover;"
						href="itempage.php?item_id=<?php echo $row['item_id']; ?>">
						<p class="text-white-700 text-2xl"><?php echo $row['item_name']; ?></p>
					</a>
					<?php
				} ?>
			</div>
			<div class="pagination w-full flex items-center justify-center space-x-3 pt-8">
				<?php if (!isset($_GET['page'])) {
					$_GET['page'] = 1;
				}
				for ($i = 1; $i <= $total_pages; $i++): ?>
					<a class="font-poppy"
						href="?hotel_id=<?php echo $hotel_id ?>&hotel_name=<?php echo $hotel_name ?>&rating=<?php echo $rating ?>&page=<?php echo $i ?>"
						class="<?php if ($i == $page)
							echo 'active' ?>"><?php if ($_GET['page'] == $i) {
							echo "<span class='font-bold text-lg bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
						} else {
							echo "<span class='font text-lg bold hover:bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
						} ?></a>
				<?php endfor; ?>
			</div>
			<?php
			} else {
				?>
			<div class="flex items-center justify-center h-[60vh] flex-col">
				<i class="fa-regular fa-face-sad-tear text-3xl mb-1"></i>
				<p class=" md:grid-cols-1 text-center font-poppy text-xl">Looks like this town is so small, the hotels are
					playing hide-and-seek!</p>
			</div>
		</div>
		<?php
			}

			?>
</body>

</html>