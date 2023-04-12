<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/input.css">
    <link rel="stylesheet" href="styles/style.css">
    <title>Eatables - Login</title>

    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
    <!-- <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script> -->

</head>
<body>
    <?php
    session_start();
    include "dbconnect.php";
    if ($_SERVER['REQUEST_METHOD'] === 'GET'){
        unset($_SESSION['password_error']);
    }
    
    if(!isset($_SESSION['password_error'])){
    $_SESSION['password_error']="";
    }
    ?>
        <div class="bg-brand bg-img min-h-screen grid">
            <div class="flex flex-col items-center justify-center">
                <div class="flex flex-col items-center justify-center py-16 md:py-36 md:space-y-4 space-y-2">
                    <div class="flex flex-col items-center pb-2 md:pb-4">
                        <a href="login.php" class="text-5xl md:text-6xl font-colvet">
                            eatables.
                        </a>
                        <p class="font-poppy text-sm md:text-md">Find your next favorite.</p>
                    </div>
                    <form  method="post" class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4">
    <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="username" type="text" name="username" autocomplete="off" />
    <input class="hover:border-brand outline-none opacity-90 border-0 text-xl md:text-2xl px-10 py-3 md:px-16 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="password" type="password" name="password" autocomplete="off" />
    <span class="error-message"><?php echo $_SESSION['password_error'] ?></span> <!-- Add error message span element -->
    <input class="py-[0.50rem] md:py-[0.70rem] tracking-wider px-9 md:px-12 text-xl font-poppy rounded-md duration-500" type="submit" name="submit" value="explore" />
</form>
                    <br>
                </div>
                <div class="flex md:flex-row flex-col items-center justify-center w-full">
                    <a href="forgot.php" class="font-poppy md:text-lg underline hover:text-gray-700">
                        forgot password?
                    </a>
                    <a href="signup.php" class="font-poppy md:text-lg underline hover:text-slate-800">
                        create account
                    </a>
                </div>
            </div>
        </div>

    <?php
   if (isset($_POST['submit'])) {
        
        $username = $_POST["username"];
        $password = $_POST["password"];
        $sql = "select * from user where uname='$username'";
        $res = $con->query($sql);
        if ($res->num_rows > 0) {
            $row = $res->fetch_assoc();
            $hash = $row['password'];
            if (password_verify($password, $hash)) {
                $_SESSION['id'] = $row['uid'];
                $_SESSION['fullname'] = $row['fullname'];
                $_SESSION['username'] = $row['uname'];
                $_SESSION['email'] = $row['email'];
                $_SESSION['status'] = true;
                $_SESSION['user_type'] = $row['user_type'];
                $type = $row['user_type'];
                if ($type != 0) {
                    $_SESSION['username_error'] = "";
                    header("Location: index.php");

                    exit;
                } else {
                    $_SESSION['username_error'] = "";
                    header("Location: admin.php");
                    exit();
                }
            } else {
                $_SESSION['password_error']="Incorrect password/username";
                // header("Location:login.php");
            }
        } else {
            $_SESSION['password_error']="Incorrect password/username";
            // header("Location:login.php");
        }
        
        
    }
    // include './components/footer.php';
    ?>
</body>

</html>