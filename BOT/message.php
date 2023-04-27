<?php
include "../dbconnect.php";
$getmsg = $_POST['text'];
// $sql="insert into queries values '$getmsg'";
$check_data = "SELECT option_text FROM bot WHERE prev_option_text = '$getmsg' ";
$run_query = mysqli_query($con, $check_data) or die("error in finding");
if($getmsg=='price'){
    echo"<button class='option-btn' data-value='low'>Low Price</button>
    <button class='filter-button' data-value='medium'>Medium Price</button>
    <button class='filter-button' data-value='high'>High Price</button>
    ";
}
else{
if (mysqli_num_rows($run_query) > 0) {
    
    while ($fetch_data = mysqli_fetch_assoc($run_query)) {
    
        $reply = $fetch_data['option_text'];
        echo "          <button class='option-btn' data-value=" . $reply . ">$reply</button>";
    }
} else {
    echo "          INPUT NOT PROPER";
}
}
?>