<?php
include "../dbconnect.php";

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="stylesheet" href="../styles/input.css">
  <link rel="stylesheet" href="../styles/style.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="shortcut icon" href="../public/eatables.png" type="image/x-icon">
</head>
<style>
  .avatar{
    position: absolute;
    width: 300px;
    top: -5px;
    height: 100px;
  }
</style>
<body>
  <div class="avatar">
    <img src="../media/images/funny-3d-illustration-cartoon-teenage-girl.png" alt="img">
  </div>
  <div class="bg-brand bg-img bg-fixed min-h-screen flex flex-col items-center p-4 md:px-16">

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mt-24 w-full ">
    here is your result
      <?php
      // Retrieve the selected price range from the query parameter
      $priceRange = $_GET['price'];
      if ($priceRange == 'low') {
        $minPrice = 10;
        $maxPrice = 100;
      } elseif ($priceRange == 'medium') {
        $minPrice = 101;
        $maxPrice = 500;
      } elseif ($priceRange == 'high') {
        $minPrice = 501;
        $maxPrice = 999;
      }
      ?>
    </div>
    <?php
    $sql1 = "SELECT count(*) as total from item where item_price >= $minPrice AND item_price <= $maxPrice";
      $res1 = $con->query($sql1);
      $row1 = $res1->fetch_assoc();
      $total_pages = ceil($row1['total'] / 10);
      $page = isset($_GET['page']) ? $_GET['page'] : 1;
      $offset = ($page - 1) * 10;
      // Query the database to get the items for the current page
      $sql = "SELECT * FROM item WHERE item_price>= $minPrice AND item_price <= $maxPrice LIMIT $offset, 12";
      $res = $con->query($sql);
        
      // Count the total number of items
      $total_items = mysqli_num_rows(mysqli_query($con, "SELECT * FROM item WHERE  item_price >= $minPrice AND item_price <= $maxPrice"));

      // Calculate the total number of pages based on the number of items and the items per page
      $total_pages = ceil($total_items / 12);
      ?>
      <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mt-8 w-full ">

<?php
  while (($row = $res->fetch_assoc())) {

    $img_links = $row['item_img'];
?>
    <a class="text-white hover:scale-[1.01] rounded-lg shadow-lg px-4 py-24 hover:shadow-xl transition-all font-poppy font-semibold text-center duration-500" style="background-image:linear-gradient(to top, rgba(0, 0, 0, 0.916), rgba(0, 0, 0, 0.155)), url('<?php echo $img_links; ?>'); background-size:cover;" href="../itempage.php?item_id=<?php echo $row['item_id']; ?>">
      <p class="text-white-700 text-2xl"><?php echo $row['item_name']; ?></p>
    </a>
  <?php
  } ?>
</div>
<div class="pagination w-full flex items-center justify-center space-x-3 pt-8">
			<?php for ($i = 1; $i <= $total_pages; $i++) : ?>
				<a class="font-poppy" href="?price=<?php echo $priceRange  ?>&page=<?php echo $i ?>" class="<?php if ($i == $page) echo 'active' ?>"><?php if ($_GET['page'] == $i) {
																																													echo "<span class='font-bold text-lg bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
																																												} else {
																																													echo "<span class='font text-lg bold hover:bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
																																												} ?></a>
			<?php endfor; ?>
		</div>
    </div>
  </div>
</body>

</html>