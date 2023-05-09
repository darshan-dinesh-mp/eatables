<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        .card.visible {
            opacity: 1;
        }

        .card.hidden {
            opacity: 0;
        }

        .dummy {
            position: absolute;
            bottom: 0;
            width: 220px;
            /* animation: moveUpDown 3s infinite cubic-bezier(0.4, 0.1, 0.6, 0.9); */
            left: 120px;
            padding: 10px 10px 10px 0;
            margin: 0 auto;
            top: 279px;
            left: 0;
        }

        .dummy.hidden {
            opacity: 0;
        }

        .card {
            display: none;
            position:sticky;
            left: 0;
            top: 550px;
            background-color: #ffd770;
            opacity: 0;
            padding: 10px 10px 10px 0;
            transition: opacity 0.5s ease;
            width: 220px;
            margin:0;
            border-radius: 5px;
            z-index: 1;
        }

        .tools {
            display: flex;
            align-items: center;
            padding: 9px;
        }

        .circle {
            padding: 0 4px;
        }

        .box {
            display: inline-block;
            align-items: center;
            width: 10px;
            height: 10px;
            padding: 1px;
            border-radius: 50%;
        }

        .red {
            background-color: #ff605c;
        }

        .yellow {
            background-color: #ffbd44;
        }

        .green {
            background-color: #00ca4e;
        }

        .card__content {
            font-family: poppins;
            padding-left: 10px;
        }

        .card.visible {
            display: block;
            margin-left: -1500px;
            opacity: 1;
        }

        .circle {
            display: flex;
            align-items: center;
            justify-content: center;
            /* height: 50px;
      width: 50px;
      margin: 10px; */
            border-radius: 50%;
        }

        .red {
            animation: moveUpDown 1s ease-in-out infinite alternate;
        }

        .yellow {
            animation: moveUpDown 1s ease-in-out infinite alternate;
            animation-delay: 0.5s;
            /* Add a delay of 0.5 seconds */
        }

        .green {
            animation: moveUpDown 1s ease-in-out infinite alternate;
            animation-delay: 1s;
            /* Add a delay of 1 second */
        }

        @keyframes moveUpDown {
            0% {
                transform: translateY(0);
            }

            100% {
                transform: translateY(-15px);
            }
        }

        .avatar2 {
            position: relative;
            left: -300px;
            animation-name: slideRight;
            animation-duration: 2s;
            animation-timing-function: ease-out;
            animation-fill-mode: forwards;
        }

        @keyframes slideRight {
            to {
                left: 0;
            }
        }
    </style>

</head>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const avatar = document.querySelector('.avatar2');
        const cardContent = document.querySelector('.card');
        const dummy = document.querySelector('.dummy');
        avatar.addEventListener('click', function() {
            cardContent.classList.add('visible');
            // dummy.classList.add('hidden');
        });
    });
</script>

<body>
    <div class="dummy hover:cursor-pointer">
        <img class='avatar2' class='image-assistant' src="media/images/avatar.png" width=300px alt="img">
    </div>
    <div class="card" id="cardContainer">
        <div class="card__content">
            <div class="wrapper">
                <div class="font-bold">
                    <span class="">Sera</span>
                </div>
                <div class="form">
                    <div class="bot-inbox inbox">
                        <div class="icon">

                        </div>
                        <div class="msg-header">
                            <p>Want to have filtered result?</p>
                        </div>
                        <div class="reply">
                        </div>
                    </div>
                </div>

                <div class="typing-field">
                    <div class="input-data options-wrapper flex items-center justify-evenly ">
                        <?php
                        include "dbconnect.php";
                        $check_data = "SELECT option_text FROM bot where is_default=1";
                        $res = mysqli_query($con, $check_data) or die("error in finding");
                        while ($row = $res->fetch_assoc()) {
                            echo '<button class="option-btn bg-brand my-2 py-1 px-7 hover:bg-black hover:text-[#F9BB21] duration-300 rounded-md" data-value="' . $row['option_text'] . '">' . $row['option_text'] . '</button>';
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
                            $msg = ` <div class="user-inbox inbox"><div class="reply" style="text-align: right;><p>${priceRange}</p></div></div>`;
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
                            window.location.href = 'bot/filtered_results.php?page=1&price=' + priceRange;
                        });
                        // Attach event listener to parent element and delegate to child element
                        $('.input-data').on('click', '.option-btn', (event) => {
                            let value = $(event.target).data('value');
                            $msg = ` <div class="user-inbox inbox">
                                        <div class="reply flex items-end justify-end">
                                            <p class='w-16 py-1 text-center rounded-md mb-2 bg-brand'>${value}</p>
                                        </div>
                                    </div>`;
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
        </div>
    </div>
</body>

</html>