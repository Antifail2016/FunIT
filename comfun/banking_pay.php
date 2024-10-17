<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if(!isset($user_id)){
   header('location:login.php');
}

if(isset($_POST['add_product'])) {

    // Retrieving the bill name and image file from the form
    $bill_name = mysqli_real_escape_string($conn, $_POST['bill_name']);  // Assuming you're adding a field for bill_name in the form
    $image = $_FILES['image']['name'];
    $image_tmp_name = $_FILES['image']['tmp_name'];
    $image_folder = 'uploaded_images/'.$image;

    // Moving the uploaded image to a specific folder
    move_uploaded_file($image_tmp_name, $image_folder);

    // Inserting the bill_name and image path into the database
    $add_product_query = mysqli_query($conn, "INSERT INTO `bank_img` (bill_name, bill_image) VALUES('$bill_name', '$image')") or die('query failed');

    if($add_product_query){
        $message[] = 'ส่งสลีปเรียบร้อย';
        unset($_SESSION['add_product_fix']);
        header('refresh: 1; shop.php');
    } else {
        $message[] = 'การส่งสลีปล้มเหลว';
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
        <form action="" method="POST" enctype="multipart/form-data">
            <h3>ชำระเงินผ่านธนาคาร</h3>
            <br></br>
            <h3><font color="#5677fc">กสิกร ( ตรินัยน์ เลานะ ) 115-2-696590-7</font></h3>
            <input type="text" name="bill_name" class="box" required placeholder="ชื่อสมาชิก"> <!-- Added name field for bill_name -->
            <input type="file" name="image" accept="image/jpg, image/jpeg, image/png" class="box" required>
            <input type="submit" value="add product" name="add_product" class="btn">
        </form>  
    </section>

<?php include 'footer.php'; ?>

<script src="js/script.js"></script>

</body>
</html>
