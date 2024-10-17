<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>about</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<div class="heading">
   <h3><font color="white"> about us </font></h3>
   <p> <a href="home.php">home</a> / <font color="white"> about </font></p>
</div>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="images/stuss_ab.jpg" alt="">
      </div>

      <div class="content">
         <h2>ผู้จัดทำ</h2>
         <h3>นายตรินัยน์ เลานะ 6706021610124</h3>
         <h3>นายศุภฤกษ์ โปรยลาภ 6706021610094 </h3>
         <h3>นายเมฆา โอสถานนท์ 6706021610167</h3>
      </div>

   </div>

</section>




<?php include 'footer.php'; ?>

</body>
</html>