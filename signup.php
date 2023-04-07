<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="input.css">
    <title>Eatables|Register</title>

</head>

<body>
    <?php
    include "dbconnect.php";
    if (!isset($_POST['submit'])) {
        ?>
        <div class="bg-brand bg-img min-h-screen flex flex-col items-center py-4 px-4 md:px-16">
            <div class="flex items-center w-full justify-between md:pt-4">
                <div class="flex items-center">
                    <FontAwesomeIcon class="text-sm md:text-lg" icon={faUser} />
                    <h2 class="pl-1 md:pl-2 font-poppy font-medium text-sm md:text-lg">create account</h2>
                </div>
            </div>
            <div class="flex items-center justify-center flex-col h-[90vh] my-12 md:mt-0">
                <div class="flex flex-col items-center justify-center pb-2 md:pb-4">
                    <a href="/" as="/" class="outline-none text-5xl md:text-6xl font-colvet">
                        eatables.
                    </a>
                    <p class="font-poppy text-sm md:text-md">Find your next favorite.</p>
                </div>

                <form action="signup.php" method="post"
                    class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:mt-0 mb-8 place-items-center">
                    <input type="text" name="fullname"
                        class="border-none outline-none w-full text-xl md:text-2xl px-3 py-3  placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s] md:col-span-2"
                        placeholder="fullname" autoComplete="off" />
                    <input type="text" name="username"
                        class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        placeholder="username" maxLength={15} minLength={4} autoComplete="off" />

                    <input type="email" name="email"
                        class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        placeholder="email" autoComplete="off" />
                    <input type="password" name="password"
                        class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        placeholder="password" autoComplete="off" />
                    <input type="password" name="confirm"
                        class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 placeholder:opacity-70 text-center placeholder:font-poppy bg-off-brand placeholder:text-dense font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]"
                        placeholder="confirm" autoComplete="off" />
                    <input type="submit" value="explore" name="submit"
                        class="py-[0.50rem] md:py-[0.70rem] bg-dense w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover:bg-dense duration-500" />
                </form>
                <p class="text-sm text-center md:text-lg font-poppy">
                    have an account?
                    <a href="login.php" as="/" class="underline pl-1">
                        Log In
                    </a>
                    .
                </p>
            </div>
        </div>
        <?php
    } else {
        $con = new mysqli("localhost", "root", "", "eatables");
        if ($con->connect_errno) {
            die("Not connected");
        }
        if (isset($_POST['submit'])) {
            $fullname = $_POST["fullname"];
            $username = $_POST["username"];
            $email = $_POST["email"];
            $password = $_POST["password"];
            $confirm = $_POST["confirm"];

            //generating unique userid
            $sql = "select max(uid) from user";
            $res = $con->query($sql);
            if ($res->num_rows == 0) {
                $id = 1;
            } else {
                $row = $res->fetch_assoc();
                $id = $row['max(uid)'] + 1;
            }


            //VALIDATION
            if (!empty($fullname) && !empty($username) && !empty($email) && !empty($password) && !empty($confirm)) {
                if (!preg_match("/^[a-z A-Z-']*$/", $fullname)) {
                    //display error msg in the same page
                    echo "<script>alert('Error1.')</script>";
                    echo "<script>window.location.href='signup.php'</script>";
                } elseif (!ctype_alpha($username)) {
                    //display error......
                    echo "<script>alert('Error2.')</script>";
                    echo "<script>window.location.href='signup.php'</script>";
                } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                    //display error....
                    echo "<script>alert('Error3.')</script>";
                    echo "<script>window.location.href='signup.php'</script>";
                } elseif (strlen($password) < 8 || (!preg_match("/[a-zA-Z]/", $password) || !preg_match("/[0-9]/", $password))) {
                    //display error....
                    echo "<script>alert('Error4.')</script>";
                    echo "<script>window.location.href='signup.php'</script>";
                } elseif ($password != $confirm) {
                    echo "<script>alert('Error5.')</script>";
                    echo "<script>window.location.href='signup.php'</script>";
                } else {
                    $sql = "select * from user where uname='$username'";
                    $res = $con->query($sql);
                    $sql1 = "select * from user where email='$email'";
                    $res1 = $con->query($sql1);
                    if ($res->num_rows > 0) {
                        echo "<script>alert('user name already taken')</script>";
                        echo "<script>window.location.href='signup.php'</script>";
                    } elseif ($res1->num_rows > 0) {
                        echo "<script>alert('Account already exist for this email.')</script>";
                        echo "<script>window.location.href='signup.php'</script>";
                    } else {
                        //encripting the password
                        $hash = password_hash($password, PASSWORD_DEFAULT);
                        $sql = "insert into user (uid,fullname,uname,email,password) values($id,'$fullname','$username','$email','$hash')";
                        $res = $con->query($sql);
                        if ($res) {
                            echo "<script>alert('Registration successfull.')</script>";
                            echo "<script>window.location.href='login.php'</script>";
                            exit;
                        } else {
                            echo "Error registering. Try again.";
                        }
                    }
                }
            } else {
                echo "<script>alert('Please fill all the credentials.')</script>";
                echo "<script>window.location.href='signup.php'</script>";
            }
        }
    }
    ?>
</body>

</html>