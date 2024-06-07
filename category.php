<?php
include 'components/connect.php';

session_start();

if (isset($_SESSION['user_id'])) {
    $user_id = $_SESSION['user_id'];
} else {
    $user_id = '';
}

$id = isset($_GET['category']) ? intval($_GET['category']) : 0;

$products = $conn->prepare("SELECT * FROM products WHERE category_id = :category_id");

// Bind parameter
$products->bindParam(':category_id', $id, PDO::PARAM_INT);

// Jalankan Query
$products->execute();

// Ambil semua hasil sebagai array asosiatif
$ProductsCategory = $products->fetchAll(PDO::FETCH_ASSOC);

       // Siapkan Query untuk mendapatkan nama kategori
       $titleCategory = $conn->prepare("SELECT * FROM products WHERE id = :category_id");

       // Bind parameter untuk query kategori
       $titleCategory->bindParam(':category_id', $id, PDO::PARAM_INT);

       // Jalankan Query
       $titleCategory->execute();

       // Ambil hasil query kategori
       $category = $titleCategory->fetch(PDO::FETCH_ASSOC);
include 'components/wishlist_cart.php';

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category</title>
    <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
   
    <!-- custom css file link  -->
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <?php include 'components/user_header.php'; ?>

    <section class="products">
        <h1 class="heading">Category </h1>
        <div class="box-container">
            <?php
            try {

                if ($id > 0) {
                    // Siapkan Query dengan parameter terikat
                   

                    // Loop melalui hasil dan tampilkan produk
                    foreach ($ProductsCategory as $product) :
            ?>
                        <div class="container">
                            <div class="box">
                            <form action="" method="post" class="swiper-slide slide">
                                <input type="hidden" name="pid" value="<?= $product['id']; ?>">
                                <input type="hidden" name="name" value="<?= $product['name']; ?>">
                                <input type="hidden" name="price" value="<?= $product['price']; ?>">
                                <input type="hidden" name="image" value="<?= $product['image_01']; ?>">
                                <button class="fas fa-heart" type="submit" name="add_to_wishlist"></button>
                                
                                <img src="uploaded_img/<?= $product['image_01']; ?>" alt="">
                                <div class="name"><?= $product['name']; ?></div>
                                <div class="flex">
                                    <div class="price"><span>Rp.</span><?= $product['price']; ?><span>/-</span></div>
                                    <input type="number" name="qty" class="qty" min="1" max="99" onkeypress="if(this.value.length == 2) return false;" value="1">
                                </div>
                                <input type="submit" value="add to cart" class="btn" name="add_to_cart">
                            </form>
                            </div>
                        </div>
            <?php
                    endforeach;
                } else {
                    echo "<p>Invalid category ID.</p>";
                }
            } catch (PDOException $e) {
                echo "<p>Error: " . $e->getMessage() . "</p>";
            }
            ?>
        </div>
    </section>
    <div class="swiper products-slider">

<div class="swiper-wrapper">
    <?php foreach ($ProductsCategory as $product) :?>
        
   <?php endforeach ?>
</div>
</div>

<?php include 'components/footer.php'; ?>
<script src="js/script.js"></script>


    
</body>
</html>
