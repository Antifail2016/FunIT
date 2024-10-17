<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['add_to_cart'])){

   $product_name = $_POST['product_name'];
   $product_price = $_POST['product_price'];
   $product_image = $_POST['product_image'];
   $product_quantity = $_POST['product_quantity'];

   $check_cart_numbers = mysqli_query($conn, "SELECT * FROM `cart` WHERE name = '$product_name' AND user_id = '$user_id'") or die('query failed');

   if(mysqli_num_rows($check_cart_numbers) > 0){
      $message[] = 'already added to cart!';
   }else{
      mysqli_query($conn, "INSERT INTO `cart`(user_id, name, price, quantity, image) VALUES('$user_id', '$product_name', '$product_price', '$product_quantity', '$product_image')") or die('query failed');
      $message[] = 'product added to cart!';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>home</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<?php include 'header.php'; ?>

<section class="home">

   <div class="content">
      <h3>ยินดีต้อนรับทุกคนที่หลงไหลในโลกของเสื้อผ้า.</h3>
      <p>ที่นี่ที่เดียวคือที่ที่คุณจะพบเสื้อผ้าที่ทันสมัยและเท่สุดๆ ที่สามารถเสริมสร้างสไตล์ของคุณได้อย่างแท้จริง มีคอลเลคชันที่หลากหลายและเทรนด์ล่าสุดที่จะทำให้คุณดูดีทุกวัน มาเปลี่ยนแปลงลุคของคุณพร้อมเราและเสื้อผ้า ที่เท่ที่สุดในเมือง!</p>
      <a href="about.php" class="white-btn">ค้นหาเรา</a>
   </div>

</section>

<section class="products">

   <h1 class="title">สินค้าล่าสุด</h1>

   <div class="box-container">

      <?php  
         $select_products = mysqli_query($conn, "SELECT * FROM `products` LIMIT 6") or die('query failed');
         if(mysqli_num_rows($select_products) > 0){
            while($fetch_products = mysqli_fetch_assoc($select_products)){
      ?>
     <form action="" method="post" class="box">
      <img class="image" src="uploaded_img/<?php echo $fetch_products['image']; ?>" alt="">
      <div class="name"><?php echo $fetch_products['name']; ?></div>
      <div class="price">฿<?php echo $fetch_products['price']; ?> THB</div>
      <input type="number" min="1" name="product_quantity" value="1" class="qty">
      <input type="hidden" name="product_name" value="<?php echo $fetch_products['name']; ?>">
      <input type="hidden" name="product_price" value="<?php echo $fetch_products['price']; ?>">
      <input type="hidden" name="product_image" value="<?php echo $fetch_products['image']; ?>">
      <input type="submit" value="add to cart" name="add_to_cart" class="btn">
     </form>
      <?php
         }
      }else{
         echo '<p class="empty">ยังไม่มีสินค้าที่เพิ่มเข้ามา!</p>';
      }
      ?>
   </div>

   <div class="load-more" style="margin-top: 2rem; text-align:center">
      <a href="shop.php" class="option-btn">แสดงเพิ่มเติม</a>
   </div>

</section>

<section class="about">

   <div class="flex">

      <div class="image">
         <img src="images/logo_sup2.png" alt="">
      </div>

      <div class="content">
         <h3>เกี่ยวกับเรา</h3>
         <p>เราคือ เว็บไซต์ "เปิดประสบการณ์แฟชั่นที่ไม่ซ้ำซากที่ร้านของเรา - สนุกไปกับสไตล์ที่ทันสมัยและดุจริตของเสื้อผ้า street ที่ทำให้คุณโดดเด่น! ด้วยการผสมผสานของดีไซน์ทันสมัยและความสะดวกสบายที่เหนือระดับ, ร้านของเราคือจุดหมายที่คุณต้องมาสัมผัสและสวมใส่ลุคที่ไม่ซ้ำใคร. เริ่มต้นการผจญภัยทางแฟชั่นของคุณที่นี่และเตรียมพบกับความเป็นเอกลักษณ์ที่ท่ามกลางเมือง!" </p>
         <a href="about.php" class="btn">อ่านเพิ่มเติม</a>
      </div>

   </div>

</section>

<section class="home-contact">

   <div class="content">
      <h3>สอบถามเพิ่มเติม</h3>
      <p>สามารถส่งข้อความถึงเรา หรือเขียนปัญหาเกี่ยวกับเรา และปัญหาที่พบเจอในเว็บไซต์หรือปัญหาการใช้งาน และเขียนรีวิวถึงเรา</p>
      <a href="contact.php" class="white-btn">ติดต่อเรา</a>
   </div>

</section>





<?php include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>