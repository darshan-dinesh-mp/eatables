<?php
session_start();
$_SESSION['loc'] = '';
$value = $_POST['value'];
$_SESSION['loc'] = $value;
?>