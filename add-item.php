<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Restaurant</title>
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
    $sql = "select * from  location ";
    $res = $con->query($sql);
    if (!$_SESSION['status']) {
        header("Location: login.php");
        exit;
    } elseif ($_SESSION['user_type'] == 1) {
        $sql = "select * from hotel ";
        $res = $con->query($sql);
        $fullname = $_SESSION['fullname'];
        ?>
        <div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
            <div class="flex items-center w-full justify-between margin-one">
                <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                    eatables.
                </a>
            </div>
            <div class="grid gap-3 grid-cols-1 w-full mt-16 space-y-0 place-items-center font-poppy">
                <div class="flex flex-col items-center justify-center pb-2 md:pb-4">
                    <h1 class="outline-none text-xl md:text-2xl font-poppy">
                        Found a restaurant that's not on our list?
                    </h1>
                    <h1 class="outline-none text-lg md:text-xl font-poppy">
                        Fill the details.
                    </h1>
                </div>
                <div class="flex items-center justify-around relative w-full md:w-2/4">
                    <form action="suggestion.php" method="post"
                        class="grid md:grid-cols-2 md:grid-rows-2 grid-cols-1 gap-3 mt-4 md:my-2 place-items-center">
                        <div class="w-full md:col-span-2">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-password">
                                Restaurant name*:
                            </label>
                            <select name="hid"
                                class="border-none outline-none w-full text-xl md:text-2xl px-3 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:-translate-y-20 placeholder:duration-[0.5s] md:col-span-2">
                                <?php
                                while ($row = $res->fetch_assoc()) {
                                    ?>
                                    <option value="<?php echo $row['hotel_id'] ?>"><?php echo $row['hotel_name'] ?></option>
                                    <?php
                                }
                                ?>
                            </select>
                        </div>
                        <div class="w-full md:col-span-2">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-password">
                                Item name*:
                            </label>
                            <input name="iname" required
                                class="border-none outline-none w-full text-xl md:text-2xl px-3 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:opacity-0 placeholder:duration-[0.5s] md:col-span-2"
                                id="grid-password" type="text">
                        </div>
                        <div class="w-full md:col-span-2">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2"
                                for="grid-password">
                                Item price*:
                            </label>
                            <input name="price" required
                                class="border-none outline-none w-full text-xl md:text-2xl px-3 py-3 text-center placeholder:font-poppy bg-off-brand placeholder-color font-poppy hover:placeholder:opacity-0 placeholder:duration-[0.5s] md:col-span-2"
                                id="grid-password" type="text">
                        </div>
                        <input
                            class="py-[0.50rem] md:py-[0.70rem] w-44 md:col-span-2 text-white px-9 hover:cursor-pointer text-xl font-poppy rounded-md hover: duration-500"
                            type="submit" name="suggest_item" value="Submit">
                    </form>
                </div>
                *required
            </div>
        </div>
        <?php
    } else {
        echo "<script>window.location.href='login.php'</script>";
    }
    ?>

</body>

</html>