<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eatables|Register</title>

</head>

<body>
    <?php
    $con = new mysqli("localhost", "root", "", "eatables");
    if ($con->connect_errno) {
        die("Not connected");
    }
    if (!isset($_POST['submit'])) {
        ?>
        <div className="bg-brand bg-img min-h-screen flex flex-col items-center py-4 px-4 md:px-16">
            <div className="flex items-center w-full justify-between md:pt-4">
                <div className="flex items-center cursor-default">
                    <h2 className="pl-1 md:pl-2 font-poppy font-medium text-sm md:text-lg">create account</h2>
                </div>
            </div>
            <div className="flex items-center justify-center flex-col h-[90vh] my-12 md:mt-0">
                <div className="flex flex-col items-center justify-center pb-2 md:pb-4">
                    <h1 className="outline-none text-5xl md:text-6xl font-colvet cursor-none">eatables.</h1>
                    <p className="font-poppy text-sm md:text-md">Find your next favorite.</p>
                </div>
                <form action="register.php" method="POST"
                    className="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:mt-0 mb-8 place-items-center">
                    <input type="text" name="fullname"
                        className="border-none outline-none w-full text-xl md:text-2xl px-3 py-3  placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s] md:col-span-2"
                        placeholder="fullname" autoComplete="off" />
                    <input type="text" name="username" placeholder="username"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        autoComplete="off" />
                    <input type="email" name="email" placeholder="email"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        autoComplete="off" />
                    <input type="password" name="password" placeholder="password" autoComplete="off"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" />
                    <input type="password" name="cpassword" placeholder="confirm" autoComplete="off"
                        className="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" />
                    <input type="submit" name="submit" value="Sign Up"
                        className="py-[0.50rem] md:py-[0.70rem] bg-dense w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover:bg-dense duration-500">
                    </input>
                </form>
                <p className="text-sm text-center md:text-lg font-poppy">
                    have an account?
                    <a href="login.php">
                        <span className="underline pl-1 cursor-pointer">Log In</span>
                    </a>
                    .
                </p>
            </div>
        </div>
        <?php
    } else {
        $fullname = $_POST["fullname"];
        $username = $_POST["username"];
        $email = $_POST["email"];
        $password = $_POST["password"];


        $sql = "select max(uid) from user";
        $res = $con->query($sql);
        if ($res->num_rows == 0) {
            $id = 1;
        } else {
            $row = $res->fetch_assoc();
            $id = $row['max(uid)'] + 1;
        }
        $sql = "insert into user values($id,'$fullname','$username','$email','$password')";
        $res = $con->query($sql);
        if ($res) {
            echo "<script>alert('Registration successfull.')</script>";
            echo "<script>window.location.href='login.php'</script>";
            exit;
        } else {
            echo "Error registering. Try again.";
        }
    }
    ?>
</body>

</html>