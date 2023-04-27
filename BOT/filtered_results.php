<?php
include "../dbconnect.php";
// Retrieve the selected price range from the query parameter
$priceRange = $_GET['price'];
if ($priceRange == 'low') {
  $minPrice = 0;
  $maxPrice = 10;
} elseif ($priceRange == 'medium') {
  $minPrice = 11;
  $maxPrice = 50;
} elseif ($priceRange == 'high') {
  $minPrice = 51;
  $maxPrice = 100;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eatables App - Search</title>
  <link rel="stylesheet" href="../styles/input.css">
  <link rel="stylesheet" href="../styles/style.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="shortcut icon" href="../public/eatables.png" type="image/x-icon">
</head>

<body>
  <div class="bg-brand bg-img bg-fixed min-h-screen flex flex-col items-center p-4 md:px-16">

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-4 mt-8 w-full ">

      <?php
      $sql = "SELECT * FROM item WHERE item_price >= $minPrice AND item_price <= $maxPrice";
      $run_query = mysqli_query($con, $sql) or die("error in finding");
      if (mysqli_num_rows($run_query) > 0) {

        while ($fetch_data = mysqli_fetch_assoc($run_query)) {

          $reply = $fetch_data['item_name'];
          $img_links = $fetch_data['item_img'];
      ?>
          <a class="text-white hover:scale-[1.01] rounded-lg shadow-lg px-4 py-24 hover:shadow-xl transition-all font-poppy font-semibold text-center duration-500" style="background-image:linear-gradient(to top, rgba(0, 0, 0, 0.916), rgba(0, 0, 0, 0.155)), url('<?php echo $img_links; ?>'); background-size:cover;" href="itempage.php?item_id=<?php echo $row['item_id']; ?>">
            <p class="text-white-700 text-2xl"><?php echo $fetch_data['item_name']; ?></p>
          </a>
      <?php
        }
      } else {
        echo "          INPUT NOT PROPER";
      }

      ?>
    </div>
    <div class="pagination w-full flex items-center justify-center space-x-3 pt-8">
      <?php for ($i = 1; $i <= $total_pages; $i++) : ?>
        <a class="font-poppy" href="?hotel_id=<?php echo $hotel_id ?>&hotel_name=<?php echo $hotel_name ?>&rating=<?php echo $rating ?>&page=<?php echo $i ?>" class="<?php if ($i == $page) echo 'active' ?>"><?php if ($_GET['page'] == $i) {
                                                                                                                                                                                                                  echo "<span class='font-bold text-lg bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                  echo "<span class='font text-lg bold hover:bg-black/30 px-4 py-2 rounded-lg'>$i</span>";
                                                                                                                                                                                                                } ?></a>
      <?php endfor; ?>
    </div>
  </div>
</body>

</html>