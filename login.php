<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Eatables|Login</title>

</head>

<body>
    <?php
    $con = new mysqli("localhost", "root", "", "eatables");
    if ($con->connect_errno) {
        die("Not connected");
    }
    if (!isset($_POST['submit'])) {
        ?>
        <!-- <div className="bg-brand bg-img min-h-screen flex flex-col items-center py-4 px-4 md:px-16">
            <div className="flex items-center w-full justify-between md:pt-4">
                <div className="flex items-center cursor-default">
                    <h2 className="pl-1 md:pl-2 font-poppy font-medium text-sm md:text-lg">Login to your account</h2>
                </div>
            </div>
            <div className="flex items-center justify-center flex-col h-[90vh] my-12 md:mt-0">
                <div className="flex flex-col items-center justify-center pb-2 md:pb-4">
                    <h1 className="outline-none text-5xl md:text-6xl font-colvet cursor-none">eatables.</h1>
                    <p className="font-poppy text-sm md:text-md">Find your next favorite.</p>
                </div>
                <form action="login.php" method="POST"
                    className="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:mt-0 mb-8 place-items-center">
                    <input type="text" name="username" placeholder="username"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        autoComplete="off" />
                    <input type="password" name="password" placeholder="password" autoComplete="off"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" />
                    <input type="submit" name="submit" value="Login"
                        className="py-[0.50rem] md:py-[0.70rem] bg-dense w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover:bg-dense duration-500">
                    </input>
                </form>
                <p className="text-sm text-center md:text-lg font-poppy">
                    New to eatables?
                    <a href="register.php">
                        <span className="underline pl-1 cursor-pointer">Sign up</span>
                    </a>
                    .
                </p>
            </div>
        </div> -->
        <div class="bg-brand bg-img min-h-screen grid">
        <div class="flex flex-col items-center justify-center">
            <div class="flex flex-col items-center justify-center py-16 md:py-36 md:space-y-4 space-y-2">
                <div class="flex flex-col items-center pb-2 md:pb-4">
                    <a href="/" as="/" class="text-5xl md:text-6xl font-colvet">
                        eatables.
                    </a>
                    <p class="font-poppy text-sm md:text-md">Find your next favorite.</p>
                </div>
                <form action="/api/login" method="post" class="grid place-items-center md:grid-rows-2 grid-cols-1 gap-3 mx-4">
                    <input class="border-dense w-full outline-none text-xl md:text-2xl px-3 py-3 md:px-24 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="username" type="text" name="username" autoComplete="off" />
                    <input class="border-dense w-full outline-none text-xl md:text-2xl px-3 py-3 md:px-24 md:py-4 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="password" type="password" name="password" autoComplete="off" />
                    <input class="py-[0.50rem] md:py-[0.70rem] bg-dense tracking-wider text-white px-9 md:px-12 text-xl font-poppy rounded-md hover:bg-dense duration-500 " type="submit" />
                </form>
                <h1 class="font-poppy text-sm">OR</h1>
                <div class="flex items-center justify-center space-x-3">
                    <a href="/api/auth/signin" class=" bg-dense text-white px-6 py-3 text-sm font-poppy rounded-md hover:bg-dense duration-500" type="button">
                        other sign in options
                    </a>
                </div>
            </div>
            <div class="md:space-x-4 flex flex-col md:flex-row items-center justify-center">
                <a href="/forgotpassword" as="/forgotpassword" class="font-poppy md:text-lg underline hover:text-gray-700">
                    forgot password?
                </a>
                <a href="/signup" as="/signup" class="font-poppy md:text-lg underline hover:text-slate-800">
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

        $sql = "select * from user where uname='$username' and password='$password'";
        $res = $con->query($sql);
        if ($res->num_rows > 0) {
            $row = $res->fetch_assoc();
            $_SESSION['id'] = $row['uid'];
            $_SESSION['fullname'] = $row['fullname'];
            $_SESSION['username'] = $row['uname'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['status'] = true;
            echo "<script>alert('Login successfull.')</script>";
            echo "<script>window.location.href='home.php'</script>";
            exit;
        }
    }
    ?>
</body>

</html>