<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset Password</title>
  <link rel="stylesheet" href="styles/input.css">
  <link rel="stylesheet" href="styles/style.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
  <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>

  <?php
  session_start();
  $con = new mysqli("localhost", "root", "", "eatables");
  if (!isset($_POST['submit'])) {

    $_SESSION['token'] = $_GET['token'];
    $token = $_SESSION['token'];

$stmt ="SELECT * FROM user WHERE reset_token = '$token'";
  $res=$con->query($stmt);
  $user=$res->fetch_assoc();
  $reset_expiration = $user['reset_expiration']; // example reset expiration time
  $current_time = time(); // current timestamp

if (strtotime($reset_expiration) < $current_time) {
    // reset expiration time has ended
    echo "Password reset has expired.";
} else {

  if ($user) {
    ?>
    <form action="reset_password.php" method="post">
        <input type="text" name="pass" id="pass">
        <input type="text" name="cnfpass" id="cnfpass">
        <input type="submit" name="submit">
    </form>

    <?php
  }
  else{
    echo"some error occured";
}
}else{
    
        $token=$_SESSION['token'];
        $pass=$_POST['pass'];
        $cnfpass=$_POST['cnfpass'];
        if($pass!=$cnfpass){
            echo "<script>alert('PASSWORD MISSMATCH')</script>";
        }
        else{
            $password=password_hash($pass,PASSWORD_DEFAULT);
            $stmt = $con->prepare('UPDATE user SET password = ? WHERE reset_token = ?');
            $stmt->execute([$password, $token]);
            echo "<script>alert('PASSWORD CHANGED SUCCESFULLY')</script>";
            header('Location: http://localhost/eatables/login.php');
        }
        
    exit();
  }


      ?>

</body>

</html>