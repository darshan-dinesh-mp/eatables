<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="chat-style.css">
    <title>chatbot</title>
</head>

<body>
    <div class="wrapper">
        <div class="title">Chatbot</div>

        <div class="form">
            <div class="bot-inbox inbox">
                <div class="icon">
                    <i class="fa fa-user" aria-hidden="true"></i>
                </div>
                <div class="msg-header">
                    <p>Want to have filtered result ?</p>
                </div>
            </div>
        </div>

        <div class="typing-field">
            <div class="input-data options-wrapper">
                <?php
                include "dbconnect.php";
                $check_data = "SELECT option_text FROM bot where is_default=1";
                $res = mysqli_query($con, $check_data) or die("error in finding");
                while ($row = $res->fetch_assoc()) {
                    echo '          <button class="option-btn" data-value="' . $row['option_text'] . '">' . $row['option_text'] . '</button>            ';
                }
                ?>
            </div>
        </div>
    </div>
    <script src="bot/jquery.js"></script>
    <script>
        // Get all filter buttons
    </script>

    <script>
        $(document).ready(() => {
          

            $(document).ready(() => {
                $('.input-data').on('click', '.filter-button', (event) => {
                    let priceRange = $(event.target).data('value');
                    $msg = ` <div class="user-inbox inbox"><div class="msg-header"><p>${priceRange}</p></div></div>`;
                    $('.form').append($msg);
                    $('.options-wrapper').empty();
                    $.ajax({
                        url: 'bot/filter.php',
                        type: 'POST',
                        data: 'price=' + priceRange,
                        success: (result) => {
                            $reply = `${result}`
                            $('.input-data').append($reply);
                            $('.input-data').scrollTop($('.input-data')[0].scrollHeight);
                        }
                    });
                    window.location.href = 'bot/filtered_results.php?price=' + priceRange;
                });
                // Attach event listener to parent element and delegate to child element
                $('.input-data').on('click', '.option-btn', (event) => {
                    let value = $(event.target).data('value');
                    $msg = ` <div class="user-inbox inbox"><div class="msg-header"><p>${value}</p></div></div>`;
                    $('.form').append($msg);
                    $('.options-wrapper').empty();
                    // start ajax code
                    $.ajax({
                        url: 'bot/message.php',
                        type: 'POST',
                        data: 'text=' + value,
                        success: (result) => {
                            $reply = `${result}`
                            $('.input-data').append($reply);
                            $('.input-data').scrollTop($('.input-data')[0].scrollHeight);
                        }
                    });
                });

            });


        });
    </script>

</body>

</html>