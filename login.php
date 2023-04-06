<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Eatables|Login</title>

</head>

<body >
    <?php
    $con = new mysqli("localhost", "root", "", "eatables");
    if ($con->connect_errno) {
        die("Not connected");
    }
    if (!isset($_POST['submit'])) {
        ?>
        <div class="bg-brand bg-img min-h-screen grid">
            <div class="flex flex-col items-center justify-center">
                <div class="flex flex-col items-center justify-center py-16 md:py-36 md:space-y-4 space-y-2">
                    <div class="flex flex-col items-center pb-2 md:pb-4">
                        <a href="/" as="/" class="text-5xl md:text-6xl font-colvet">
                            eatables.
                        </a>
                        <p class="font-poppy text-sm md:text-md">Find your next favorite.</p>
                    </div>
                    <form action="login.php" method="post"
                        class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4">
                        <input
                            class="border-dense w-full outline-none text-xl md:text-2xl px-3 py-3 md:px-24 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                            placeholder="username" type="text" name="username" autoComplete="off" />
                        <input
                            class="border-dense w-full outline-none text-xl md:text-2xl px-3 py-3 md:px-24 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                            placeholder="password" type="password" name="password" autoComplete="off" />
                        <input
                            class="py-[0.50rem] md:py-[0.70rem] bg-dense tracking-wider text-white px-9 md:px-12 text-xl font-poppy rounded-md hover:bg-dense duration-500 "
                            type="submit" name="submit" />
                    </form>
                    <h1 class="font-poppy text-sm">OR</h1>
                    <div class="flex items-center justify-center space-x-3">
                        <a href="signin.php"
                            class=" bg-dense text-white px-6 py-3 text-sm font-poppy rounded-md hover:bg-dense duration-500"
                            type="button">
                            other sign in options
                        </a>
                    </div>
                </div>
                <div class="md:space-x-4 flex flex-col md:flex-row items-center justify-center">
                    <a href="forgotpassword.php" as="/forgotpassword"
                        class="font-poppy md:text-lg underline hover:text-gray-700">
                        forgot password?
                    </a>
                    <a href="signup.php" as="/signup" class="font-poppy md:text-lg underline hover:text-slate-800">
                        create account
                    </a>
                </div>
            </div>
        </div>
        <?php
    } else {
        session_start();
        $username = $_POST["username"];
        $password = $_POST["password"];
        $sql = "select * from user where uname='$username'";
        $res = $con->query($sql);
        if ($res->num_rows > 0) {
            $row = $res->fetch_assoc();
            $hash = $row['password'];
        }
        if (password_verify($password, $hash)) {
            $_SESSION['id'] = $row['uid'];
            $_SESSION['fullname'] = $row['fullname'];
            $_SESSION['username'] = $row['uname'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['status'] = true;
            echo "<script>alert('Login successfull.')</script>";
            echo "<script>window.location.href='home.php'</script>";
            exit;
        } else {
            echo "<script>window.location.href='login.php'</script>";
        }
            // $sql = "select * from user where uname='$username' and password='$password'";
            // $res = $con->query($sql);
            // if ($res->num_rows > 0) {
            //     $row = $res->fetch_assoc();
            //     $_SESSION['id'] = $row['uid'];
            //     $_SESSION['fullname'] = $row['fullname'];
            //     $_SESSION['username'] = $row['uname'];
            //     $_SESSION['email'] = $row['email'];
            //     $_SESSION['status'] = true;
            //     echo "<script>alert('Login successfull.')</script>";
            //     echo "<script>window.location.href='home.php'</script>";
            //     exit;
            // } else {
            //     echo "<script>window.location.href='login.php'</script>";
            // }
    }
    ?>
</body>
</html>