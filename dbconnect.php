<?php
$con = new mysqli("localhost", "root", "", "eatables");
if ($con->connect_errno) {
    die("Not connected");
}
?>