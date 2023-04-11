<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Eatables</title>
  <link rel="stylesheet" href="styles/input.css">
  <link rel="stylesheet" href="styles/style.css">
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
  <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
</head>

<body>
  <div class="bg-brand bg-img min-h-screen grid">
    <div class="flex flex-col items-center justify-center">
      <div class="flex flex-col items-center justify-center py-16 md:py-64 md:space-y-4 space-y-2">
        <div class="flex flex-col items-center pb-2 md:pb-4">
          <a href="login.php" class="text-5xl md:text-6xl font-colvet">
            eatables.
          </a>
          <p class="font-poppy text-sm md:text-md">Find your next favorite.</p>
        </div>
        <h1 class='text-xl font-poppy'>Don't Let a Forgotten Password Leave You Hangry - Reset Now!</h1>
        <form action="forgot.php" method="post" class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4">
          <input type="email" class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="enter you email here" name="email" id="email">
          <input type="submit" value='reset now' class="py-[0.50rem] md:py-[0.70rem] px-9 md:px-12 text-xl font-poppy rounded-md duration-500" name="submit">
        </form>
        <?php

        use PHPMailer\PHPMailer\PHPMailer;
        use PHPMailer\PHPMailer\Exception;

        if (isset($_POST['submit'])) {
          session_start();

          require 'vendor/autoload.php';

          $mail = new PHPMailer(true);
          $mail->SMTPDebug = 4;
          $mail->isSMTP();
          $mail->Host       = 'smtp.gmail.com;';
          $mail->SMTPAuth   = true;
          $mail->Username   = 'youreatables@gmail.com';
          $mail->Password   = 'jpjzdzkibgeawchq';
          $mail->SMTPSecure = 'ssl';
          $mail->Port       = 465;

          // Include database connection code
          $con = new mysqli("localhost", "root", "", "eatables");


          // Get email address entered by user
          $email = $_POST['email'];

          // Validate email address
          if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            $_SESSION['error'] = 'Invalid email address.';
            header('Location: login.php');
            exit();
          }

          // Check if email exists in database
          $stmt = "SELECT * FROM user WHERE email = '$email'";
          $res = $con->query($stmt);
          $user = $res->fetch_assoc();
          $name = $user['uname'];
          if (!$user) {
            $_SESSION['error'] = 'Email not found.';
            header('Location: forgot.php');
            exit();
          }

          // Generate unique token
          $token = bin2hex(random_bytes(32));

          // Store token in database with expiration time
          //have to check the expiry
          $stmt = $con->prepare('UPDATE user SET reset_token = ?, reset_expiration = DATE_ADD(NOW(), INTERVAL 10 minute) WHERE email = ? and uname= ?');
          $stmt->execute([$token, $email, $name]);

          // Send email with reset password link

          $mail->setFrom('eatables.bitdrag@gmail.com', 'eatables');
          $mail->addAddress($email);
          $reset_link = 'https://localhost/eatables/reset_password.php?token=' . $token;
          $mail->isHTML(true);
          $mail->Subject = 'PASSWORD RESET LINK';
          $mail->Body    = "Click the link below to reset your password:\n\n" . $reset_link;
          $mail->AltBody = 'nill';
          if ($mail->send()) {
            echo "Mail has been sent successfully!";
            //give alert
            $_SESSION['success'] = 'Password reset link sent to your email.';
            echo "<script>alert('PASSWORD RESET LINK SEND TO THE MAIL')</script>";
            echo "<script>window.location.href='login.php'</script>";
            exit();
          } else {
            $_SESSION['error'] = 'Error sending email. Please try again.';
            header('Location: forgot.php');
            exit();
          }
        }
        ?>
      </div>
    </div>
    <?php
    // include './components/footer.php';
    ?>
</body>

</html>