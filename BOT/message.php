<?php

include "../dbconnect.php";
$getmsg = mysqli_real_escape_string($con, $_POST['text']);
// $sql="insert into queries values '$getmsg'";
$check_data = "SELECT replay FROM bot WHERE query LIKE '%$getmsg%' ";
$run_query = mysqli_query($con, $check_data) or die("error in finding");

if (mysqli_num_rows($run_query) > 0) {
    $fetch_data = mysqli_fetch_assoc($run_query);
    $reply = $fetch_data['replay'];
    echo $reply;
} else {
    echo "Sorry can't be able to understand you!";
}
