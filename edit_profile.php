<?php
session_start();
$con = new mysqli("localhost", "root", "", "eatables");
if ($con->connect_errno) {
    die("Not connected");
}

// Check if user is logged in
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}

// Get user information from database
$user_id = $_SESSION['id'];
$query = "SELECT * FROM user WHERE uid = $user_id";
$result = mysqli_query($con, $query);
$user = mysqli_fetch_assoc($result);

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $fullname = mysqli_real_escape_string($con, $_POST['fullname']);
    $email = mysqli_real_escape_string($con, $_POST['email']);

    // Update user information in database
    $query = "UPDATE user SET fullname = '$fullname', email = '$email' WHERE uid = $user_id";
    mysqli_query($con, $query);
    $_SESSION['fullname'] = $fullname;
    $_SESSION['email'] = $email;

    // Redirect to profile page
    header("Location:userprofile.php");
    exit();
}

// Display user information and edit form
?>

<h1>Edit Profile</h1>
<form method="POST" action="">
    <label for="fullname">Full Name:</label>
    <input type="text" name="fullname" value="<?php echo $user['fullname']; ?>"><br>
    <label for="email">Email:</label>
    <input type="email" name="email" value="<?php echo $user['email']; ?>"><br>
    <input type="file" name="img"><br>
    <input type="submit" value="Save Changes">
</form>
