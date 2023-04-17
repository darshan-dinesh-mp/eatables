<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles/input.css">
    <link rel="stylesheet" href="./styles/style.css">
    <script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
    <link rel="shortcut icon" href="public/eatables.png" type="image/x-icon">
    <!-- <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script> -->
    <title>Eatables - Register</title>

<script>
    function validateFullname() {
        const fullnameInput = document.getElementById('fullname');
        const errorFullname = document.getElementById('error-fullname');

        if (fullnameInput.value === '') {
            errorFullname.textContent = 'Please enter your fullname';
        } else if (!/^[A-Za-z\s]+$/.test(fullnameInput.value)) {
            errorFullname.textContent = 'Fullname can only contain letters and spaces';
        } else {
            errorFullname.textContent = '';
        }
    }
    function validateUsername() {
        const usernameInput = document.getElementById('username');
        const errorUsername = document.getElementById('error-username');

        if (usernameInput.value === '') {
            errorUsername.textContent = 'Please enter the Username';
        } else if (!/^[a-z]+$/.test(usernameInput.value)) {
            errorUsername.textContent = 'Username can only contain smallcase alphabets';
        } else if (!/^[a-z]{4,15}$/.test(usernameInput.value)) {
            errorUsername.textContent = 'Username should contain between 4 - 15 characters';
        }
        else {
            errorUsername.textContent = '';
        }
    }
    function validateEmail() {
    const emailInput = document.getElementById('email');
    const errorEmail = document.getElementById('error-email');
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (emailInput.value === '') {
        errorEmail.textContent = 'Please enter your email address';
    } else if (!emailRegex.test(emailInput.value)) {
        errorEmail.textContent = 'Invalid email format';
    } else {
        errorEmail.textContent = '';
    }
}

function validatePassword() {
    const passwordInput = document.getElementById('password');
    const errorPassword = document.getElementById('error-password');

    if (passwordInput.value === '') {
        errorPassword.textContent = 'Please enter a password';
    } else if (passwordInput.value.length < 8) {
        errorPassword.textContent = 'Password must be at least 8 characters long';
    } else if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(passwordInput.value)) {
        errorPassword.textContent = 'Password must contain at least one letter and one number';
    } else {
        errorPassword.textContent = '';
    }
}

function validateConfirm() {
  const passwordInput = document.getElementById('password');
  const confirmPasswordInput = document.getElementById('confirm');
  const errorConfirmPassword = document.getElementById('error-confirm');

  if (confirmPasswordInput.value === '') {
    errorConfirmPassword.textContent = 'Please confirm your password';
  } else if (passwordInput.value !== confirmPasswordInput.value) {
    errorConfirmPassword.textContent = 'Passwords do not match';
  } else {
    errorConfirmPassword.textContent = '';
  }
}

</script>
</head>

<body>
    <?php
    include "dbconnect.php";
    $error = "";
    ?>
    <div class="bg-brand bg-img min-h-screen flex flex-col items-center py-4 px-4 md:px-16">
        <div class="flex items-center w-full justify-between">
            <div class="flex items-center">
                <i class="fa-solid fa-user text-2xl"></i>
                <h2 class="pl-1 md:pl-2 font-poppy font-medium text-sm md:text-lg">create account</h2>
            </div>
        </div>
        <div class="flex items-center justify-center flex-col h-[90vh] md:mt-0">
            <div class="flex flex-col items-center justify-center pb-2 md:pb-4">
                <a href="index.php" class="outline-none text-5xl md:text-6xl font-colvet">
                    eatables.
                </a>
                <p class="font-poppy text-sm md:text-md">Find your next favourite.</p>
            </div>
            <form action="signup.php" method="post" class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
                <input type="text" name="fullname" id="fullname" class="border-none outline-none w-full text-xl md:text-2xl px-3 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s] md:col-span-2" placeholder="fullname" autocomplete="on" oninput="validateFullname()" />
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-fullname"></p>              
                <input type="text" name="username" id="username" class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="username" maxlength={15} minlength={4} autocomplete="on" oninput="validateUsername()" />
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-username"></p>
                <input type="email" name="email" id="email" class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="email" autocomplete="on" oninput="validateEmail()"/>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-email"></p>
                <input type="password" name="password" id="password" class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="password" autocomplete="on" oninput="validatePassword()" />
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-password"></p>
                <input type="password" name="confirm" id="confirm" class="border-none w-full outline-none text-xl md:text-2xl px-6 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s]" placeholder="confirm" autocomplete="on" oninput="validateConfirm()"/>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-confirm"></p>
                <input type="submit" value="explore" name="submit" id="submit" class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500" />
            </form>
            <div class='error-div'>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-all-cred"></p>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-name"></p>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-username"></p>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-email"></p>
                <p class="w-full font-poppy text-red-500 text-2xl text-center" id="error-pwd"></p>
            </div>
            <p class="text-sm text-center md:text-lg font-poppy">
                have an account?
                <a href="login.php" class="underline">
                    login
                </a>
            </p>
        </div>

    </div>
    <?php
    $errfullname = false;
    $errusername = false;
    $erremail = false;
    $errpassword = false;
    $errconfirm = false;
    $error_cred = false;
    $flag = 1;
    if (isset($_POST['submit'])) {
        $fullname = $_POST["fullname"];
        $username = $_POST["username"];
        $email = $_POST["email"];
        $password = $_POST["password"];
        $confirm = $_POST["confirm"];
        $error_cred = "";

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
                $errfullname = true;
                $flag = 0;
                // echo "<script>document.getElementById('fullname').classList.add('error');</script>";
            }
            if (!ctype_alpha($username)) {
                $errusername = true;
                $flag = 0;
                // echo "<script>document.getElementById('username').classList.add('error');</script>";
            }
            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                $erremail = true;
                $flag = 0;
                // echo "<script>document.getElementById('email').classList.add('error');</script>";
            }
            if (strlen($password) < 8 || (!preg_match("/[a-zA-Z]/", $password) || !preg_match("/[0-9]/", $password))) {
                $errpassword = true;
                $flag = 0;
                // echo "<script>document.getElementById('password').classList.add('error');</script>";
            }
            if ($password != $confirm) {
                $errconfirm = true;
                $flag = 0;
                // echo "<script>document.getElementById('confirm').classList.add('error');</script>";
            }

            if (!$errfullname && !$errusername && !$erremail && !$errpassword && !$errconfirm) {

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
                        echo "<script>window.location.href='login.php?signupstatus=true'</script>";
                        exit();
                    } else {
                        echo "Error registering. Try again.";
                    }
                }
            }
        } else {
            $error_cred = true;
        }
        if ($errfullname) {
            echo "<script>document.getElementById('error-name').innerHTML='Error in full name!';</script>";
            echo "<script>document.getElementById('fullname').classList.add('error');</script>";
            // echo "<script>alert('FULL NAME CANT HAVE NUMBERS');</script>";
        }
        if ($errusername) {
            echo "<script>document.getElementById('error-username').innerHTML='Username must contain only Alphabets!';</script>";
            echo "<script>document.getElementById('username').classList.add('error');</script>";
            // echo "<script>alert('username cant have space or number');</script>";
        }
        if ($erremail) {
            echo "<script>document.getElementById('error-email').innerHTML='Incorrect email!';</script>";
            echo "<script>document.getElementById('email').classList.add('error');</script>";
            // echo "<script>alert('PLEASE ENTER A VALID EMAIL');</script>";
        }
        if ($errpassword) {
            echo "<script>document.getElementById('error-pwd').innerHTML='Password does not match!';</script>";
            echo "<script>document.getElementById('password').classList.add('error');</script>";
            // echo "<script>alert('PASSWORD MUST CONTAIN 8 CHARACTER INCLUDING NUMBER AND CHARACTER');</script>";
        }
        if ($errconfirm) {
            echo "<script>document.getElementById('error-pwd').innerHTML='Password does not match!';</script>";
            echo "<script>document.getElementById('confirm').classList.add('error');</script>";
            // echo "<script>alert('PASSWORD DIDNT MATCH');</script>";
        }
        if ($error_cred) {
            echo "<script>document.getElementById('error-all-cred').innerHTML='Fill all credentials!';</script>";
            echo "<script>document.getElementById('submit').classList.add('error');</script>";
            // echo "<script>alert('FILL ALL THE CREDENTIALS');</script>";
        }
    }
    // include './components/footer.php';
    ?>
    <script>
        // Get the error div element
        const errorDiv = document.querySelector('.error-div');

        // Set a timeout function to hide the div after 7 seconds
        setTimeout(() => {
            errorDiv.style.display = 'none';
        }, 10000);
    </script>
</body>

</html>

</html>