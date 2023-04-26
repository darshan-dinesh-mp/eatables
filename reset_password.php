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
  include "dbconnect.php";
  if (!isset($_POST['submit'])) {

    $_SESSION['token'] = $_GET['token'];
    $token = $_SESSION['token'];

    $stmt = "SELECT * FROM user WHERE reset_token = '$token'";
    $res = $con->query($stmt);
    $user = $res->fetch_assoc();
    $reset_expiration = $user['reset_expiration']; // example reset expiration time
    $current_time = time(); // current timestamp
  
    if (strtotime($reset_expiration) < $current_time) {
      // reset expiration time has ended
      echo "Password reset has expired.";
    } else {

      if ($user) {
        ?>
        <div class="bg-brand bg-img min-h-screen grid">
          <div class="flex flex-col items-center justify-center">
            <div class="flex flex-col items-center justify-center py-16 md:py-64 md:space-y-4 space-y-2">
              <div class="flex flex-col items-center pb-2 md:pb-4">
                <a href="login.php" class="text-5xl md:text-6xl font-colvet">
                  eatables.
                </a>
                <p class="font-poppy text-sm md:text-md">Find your next favourite.</p>
              </div>
              <form action="reset_password.php" class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4"
                method="post">
                <input
                  class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                  type="text" name="pass" id="pass" placeholder="New password" required>
                <input
                  class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                  type="text" name="cnfpass" id="cnfpass" placeholder="Confirm password" required>
                <input class="py-[0.50rem] md:py-[0.70rem] px-9 md:px-12 text-xl font-poppy rounded-md duration-500"
                  type="submit" name="submit">
              </form>
            </div>
          </div>
        </div>

        <?php
      } else {
        echo "some error occured";
      }
    }
  } else {

    $token = $_SESSION['token'];
    $pass = $_POST['pass'];
    $cnfpass = $_POST['cnfpass'];
    if (strlen($pass) < 8 || (!preg_match("/[a-zA-Z]/", $pass) || !preg_match("/[0-9]/", $pass))) {
      echo "<script>alert('Minimum 8 characters with combination of number and alphabet required.')</script>";
      echo "<script>window.location.href='http://localhost/eatables/reset_password.php?token=$token'</script>";
    }
    else if ($pass != $cnfpass) {
      echo "<script>alert('PASSWORD MISSMATCH')</script>";
      echo "<script>window.location.href='http://localhost/eatables/reset_password.php?token=$token'</script>";
    } else {
      $password = password_hash($pass, PASSWORD_DEFAULT);
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