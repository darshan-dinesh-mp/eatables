<?php
include "../dbconnect.php";
$getmsg = $_POST['text'];
// $sql="insert into queries values '$getmsg'";
$check_data = "SELECT option_text FROM bot WHERE prev_option_text = '$getmsg' ";
$run_query = mysqli_query($con, $check_data) or die("error in finding");
if ($getmsg == 'no') {
    echo "<script>
            window.location.href='index.php';
    </script>";
}
if ($getmsg == 'price') {
    echo "<button class='filter-button px-3 py-1 bg-brand rounded-md' data-value='low'>Low</button>
    <button class='filter-button px-3 py-1 bg-brand rounded-md' data-value='medium'>Medium</button>
    <button class='filter-button px-3 py-1 bg-brand rounded-md' data-value='high'>High</button>
    ";
} else {
    if (mysqli_num_rows($run_query) > 0) {

        while ($fetch_data = mysqli_fetch_assoc($run_query)) {

            $reply = $fetch_data['option_text'];
            echo "          <button class='option-btn px-4 py-1 bg-brand rounded-md' data-value=" . $reply . ">$reply</button>";
        }
    } else {
        echo "INPUT NOT PROPER";
    }
}
