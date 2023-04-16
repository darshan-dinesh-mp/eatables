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
     $fullname = $_SESSION['fullname'];
     ?>
     <div class="bg-brand bg-img min-h-screen flex flex-col items-center p-4 md:px-16">
          <div class="flex items-center w-full justify-between margin-one">
               <a href="index.php" class="text-3xl md:text-4xl font-colvet">
                    eatables.
               </a>
          </div>
          <div class="grid gap-3 grid-cols-1 w-full mt-16 md:mt-40 space-y-0 place-items-center font-poppy">
               <div class="flex items-center justify-around relative w-full md:w-2/4">
                    <form class="w-full max-w-lg">
                         <div class="flex flex-wrap -mx-3 mb-6">
                              <div class="w-full px-3 mb-6 md:mb-0">
                                   <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                                        Your Name
                                   </label>
                                   <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-red-500 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white" id="grid-first-name" type="text" value="<?php echo $fullname;  ?>">
                              </div>
                         </div>
                         <div class="flex flex-wrap -mx-3 mb-6">
                              <div class="w-full px-3">
                                   <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-password">
                                        Restaurant Name
                                   </label>
                                   <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-password" type="text">
                              </div>
                         </div>
                         <div class="flex flex-wrap -mx-3 mb-2">
                              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                   <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-city">
                                        City
                                   </label>
                                   <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-city" type="text">
                              </div>
                              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                   <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-state">
                                        State
                                   </label>
                                   <div class="relative">
                                        <select class="block appearance-none w-full bg-gray-200 border border-gray-200 text-gray-700 py-3 px-4 pr-8 rounded leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-state">
                                             <option>Kerala</option>
                                             <option>Karnataka</option>
                                             <option>Tamil Nadu</option>
                                        </select>
                                        <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-2 text-gray-700">
                                             <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                                                  <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z" />
                                             </svg>
                                        </div>
                                   </div>
                              </div>
                              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                   <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-zip">
                                        Zip
                                   </label>
                                   <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-zip" type="text">
                              </div>
                              <div class="w-full md:w-1/3 px-3 mb-6 md:mb-0">
                                   <input class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-zip" type="submit">
                              </div>
                         </div>
                    </form>
               </div>
          </div>
     </div>
</body>

</html>