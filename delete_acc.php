<?php
session_start();
require_once('dbconnect.php');

// Check if user is logged in
if (!isset($_SESSION['id'])) {
    header("Location: login.php");
    exit();
}

// Handle account deletion
if (isset($_POST['delete_account'])) {
    // Delete user data from database
    $user_id = $_SESSION['id'];
    $query = "DELETE FROM user WHERE uid = $user_id";
    mysqli_query($con, $query);

    // Log user out and redirect to homepage
    session_destroy();
    header("Location: index.php");
    exit();
}

// Display confirmation message and delete button
?>

<h1>Delete Account</h1>
<p>Are you sure you want to delete your account? This action cannot be undone.</p>
<form method="POST" action="">
    <input type="hidden" name="delete_account" value="true">
    <input type="submit" value="Delete My Account">
</form>
