<?php
session_start();
include("../dbconnect.php");

$drop_id = $_GET["drop_id"];
if (isset($_GET["likestatus"])) {
    $likestatus = $_GET["likestatus"];
    if ($likestatus == 1) {
        $sql = "select likes from drops where drop_id=$drop_id";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $like = $row["likes"] - 1;
            $sqlupdate = "update drops set likes=$like where drop_id=$drop_id";
            $updateresult = $con->query($sqlupdate);
        }
        $sql = "select likes from likes where drop_id=$drop_id and u_id=$_SESSION[id]";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $likeupdate = "update likes set likes=0 where drop_id=$drop_id and u_id=$_SESSION[id]";
            $likeresult = $con->query($likeupdate);
        } else {
            $sql = "insert into likes (u_id,drop_id,likes) values($_SESSION[id],$drop_id,0)";
            $result = $con->query($sql);
        }
        echo "<script>window.location.href='view.php'</script>";
    } else {
        $sql = "select likes from drops where drop_id=$drop_id";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $like = $row["likes"] + 1;
            $sqlupdate = "update drops set likes=$like where drop_id=$drop_id";
            $updateresult = $con->query($sqlupdate);
        }
        $sql = "select likes from likes where drop_id=$drop_id and u_id=$_SESSION[id]";
        $result = $con->query($sql);
        if ($result->num_rows > 0) {
            $likeupdate = "update likes set likes=1 where drop_id=$drop_id and u_id=$_SESSION[id]";
            $likeresult = $con->query($likeupdate);
        } else {
            $sql = "insert into likes (u_id,drop_id,likes) values($_SESSION[id],$drop_id,1)";
            $result = $con->query($sql);
        }
        echo "<script>window.location.href='view.php'</script>";
    }
}

?>