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
    include "dbconnect.php";
if($_POST["suggest"]){
    $name=$_POST["name"];
    $resname=$_POST["resname"];
    $place=$_POST["place"];
    $contact=$_POST["contact"];
    $state=$_POST["state"];
    $zip=$_POST["zip"];

    $sql="insert into suggestion (uname,rname,place,contact,state,zip) values('$name','$resname','$place','$contact','$state',$zip)";
    $res=$con->query($sql);
    echo "<script>window.location.href='user-profile.php'</script>";
}
    ?>
</body>
</html>