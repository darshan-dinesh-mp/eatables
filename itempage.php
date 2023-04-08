<?php
session_start();
$con=new mysqli("localhost","root","","eatables");
if(mysqli_connect_error())
{
	die("Not connected");
}
echo "<br>";
$item_id=$_SESSION['item_id'];
echo "DETAILS OF THE ITEM";
$sql = "SELECT item.item_name,item.item_price,item.item_rating, hotel.hotel_name
FROM item
INNER JOIN hotel
ON item.hotel_id = hotel.hotel_id";
$res=$con->query($sql);
if($res->num_rows>0)
{
	while($row=$res->fetch_assoc())
	{
		echo "<p> HOTEL :$row[hotel_name] <br></p>";
		echo "ITEM : $row[item_name] <br>";
        echo "PRICE : $row[item_price] <br></p>";
	}

?>
<form action="itempage.php" method="post">
        <textarea name="review" id="review" cols="30" rows="10"></textarea>
        <input type="submit" name="submit">
    </form>
    <?php
}

// conect to database
include "dbconnect.php";

// Check conection
if (!$con) {
    die("conection failed: " . mysqli_conect_error());
}

// If form is submitted
if (isset($_POST['submit'])) {
    // Get form data
    $user=$_SESSION['id'];
    $review = $_POST['review'];
    $review_date=date('Y-m-d H:i:s');
    $item_id=$_SESSION['item_id'];

    // Validate form data
    // TODO: Add validation code here

    // Insert review into database0
    $sql = "INSERT INTO review (uid, item_id, review_content,review_date) VALUES ('$user', '$item_id', '$review', '$review_date')";
    if (mysqli_query($con, $sql)) {
        echo "<script>alert('Review submitted successfully');</script>";
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
}

// Retrieve reviews from database
$sql = "SELECT review.review_content, user.uname
FROM review
INNER JOIN user
ON review.uid = user.uid where item_id = $item_id;
";
$result = mysqli_query($con, $sql);

// Display reviews
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {
        echo "Name: " . $row["uname"] . "<br>";
        echo "Review: " . $row["review_content"] . "<br><hr>";
    }
} else {
    echo "No reviews found.";
}
?>