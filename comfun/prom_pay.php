<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

$_SESSION['add_product_fix'] = $_POST['add_product'];


if(isset($_SESSION['add_product_fix'])) {

    $image = $_FILES['image']['name'];

    $add_product_query = mysqli_query($conn, "INSERT INTO `pp_img`(image) VALUES('$image')") or die('query failed');
 
    if(isset($add_product_query)) {
        $message[] = 'ส่งสลีปเรียบร้อย';
        unset($_SESSION['add_product_fix']);
        header('refresh: 1; shop.php');
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
   <link rel="stylesheet" href="css/css_payment.css">

</head>
<body>
    <?php include 'header.php'; ?>

    <section class="add-products">
        <h1 class="title">ชำระสินค้า</h1>
        <form action="" method="post" enctype="multipart/form-data">
            <h3>ชำระเงินผ่านพร้อมเพย์</h3>
            <br></br>
            <h3><font color="#5677fc">063-409-9845</font></h3>
            <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" required>
            <input type="submit" value="add product" name="add_product" class="btn">
        </form>  
    </section>

<?php include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>