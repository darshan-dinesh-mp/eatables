<?php
session_start();
$_SESSION['loc']='';
$value = $_POST['value'];
$_SESSION['loc']=$value;
    echo $value;
    echo "sessopm";
    echo $_SESSION['loc'];
?>