<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    
session_start();
if (!$_SESSION['status']) {
	header("Location: login.php");
	exit;
} elseif ($_SESSION['user_type'] != 0) {

	echo "<script>alert('engoottaaaaaa')</script>";
	echo "<script>window.location.href='login.php'</script>";
}

if($_POST["suggest"]){
    $name=$_POST["name"];
    $resame=$_POST["resname"];
    $place=$_POST["place"];
    $contact=$_POST["contact"];
    $state=$_POST["state"];
    $zip=$_POST["zip"];

    ?>
    <table border=1>
        <th><td>Name - </td><td>Suggesion</td></th>
        <td>
            <?php
            echo $resname;
            ?>
        </td>
    </th>
        
        
    </table>
    <?php
}
    ?>
</body>
</html>