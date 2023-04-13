if ($errfullname) {
            echo "<script>document.getElementById('fullname').classList.add('error');</script>";
            echo "<script>alert('FULL NAME CANT HAVE NUMBERS');</script>";
        }
        if ($errusername) {
            echo "<script>document.getElementById('username').classList.add('error');</script>";
            echo "<script>alert('username cant have space or number');</script>";
        }
        if ($erremail) {
            echo "<script>document.getElementById('email').classList.add('error');</script>";
            echo "<script>alert('PLEASE ENTER A VALID EMAIL');</script>";
        }
        if ($errpassword) {
            echo "<script>document.getElementById('password').classList.add('error');</script>";
            echo "<script>alert('PASSWORD MUST CONTAIN 8 CHARACTER INCLUDING NUMBER AND CHARACTER');</script>";
        }
        if ($errconfirm) {
            echo "<script>document.getElementById('confirm').classList.add('error');</script>";
            echo "<script>alert('PASSWORD DIDNT MATCH');</script>";
        }
        if ($error_cred) {
            echo "<script>document.getElementById('submit').classList.add('error');</script>";
            echo "<script>alert('FILL ALL THE CREDENTIALS');</script>";
        }