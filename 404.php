<?php
http_response_code(404);

?>
<link rel="stylesheet" href="styles/input.css">
<link rel="stylesheet" href="styles/style.css">
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://kit.fontawesome.com/08ae7c27bc.js" crossorigin="anonymous"></script>
<div class="bg-img min-h-screen flex flex-col items-center justify-center py-4 px-4 md:px-16">
     <img class="w-[35rem]" alt="Page Not Found" src='../media/images/foodNotFound.png' />
     <h1 class="text-xl md:text-xl font-poppy text-dense font-medium text-center my-5">
          <span class="line-through">Page</span> Food Not Found
     </h1>
     <a href="../index.php" class="py-3 px-8 bg-dense rounded-lg text-md font-poppy font-semibold text-white">
          <i class="fa-solid fa-house text-2xl hover:text-white duration-300 text-black"></i>
     </a>
</div>