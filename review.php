<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<?php

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
    $review_date=date(NO);
    $item_id=$_SESSION['item_id'];

    // Validate form data
    // TODO: Add validation code here

    // Insert review into database0
    $sql = "INSERT INTO review (uid, item_id, review_content,review_date) VALUES ('$user', '$item_id', '$review', '$review_date') where item_id=$item_id";
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

// Close database conection
mysqli_close($con);
?>
    
    </body>
</html> -->