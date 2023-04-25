<?php
include "../dbconnect.php";
$getmsg = mysqli_real_escape_string($con, $_POST['text']);
// $sql="insert into queries values '$getmsg'";
$check_data = "SELECT option_text FROM bot WHERE prev_option_text LIKE '%$getmsg%' ";
$run_query = mysqli_query($con, $check_data) or die("error in finding");

if (mysqli_num_rows($run_query) > 0) {
    while ($fetch_data = mysqli_fetch_assoc($run_query)) {
        $reply = $fetch_data['option_text'];
        echo "          <button class='option-btn' data-value=" . $reply . ">$reply</button>";
    }
} else {
    echo "          <button class='option-btn' data-value='yes'>yes</button>";
}
?>