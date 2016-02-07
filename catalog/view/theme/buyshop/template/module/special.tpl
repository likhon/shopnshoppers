<?php
$theme_products = $this->config->get('bs_products');
$theme_options = $this->config->get('bs_general');
?>

<?php if (isset($theme_products["slider_mode"]) && $theme_products["slider_mode"] == 'simple'): ?>
<div class="<?php echo (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ? 'span9' : (isset($theme_options["layout_skin"])&&$theme_options["layout_skin"] == 'skin_cosmetic') ? 'span6' : 'span12'); ?>">
<h3 class="main_slider_title special_title"><?php echo $heading_title; ?></h3>
    <div class="carousel es-carousel-wrapper style0 small_slider latest_slider">
        <div class="es-carousel">
            <div class="row <?php echo (isset($theme_options["layout_skin"])&& $theme_options["layout_skin"] == 'skin_cosmetic' ? 'small_with_description' : 'big_with_description'); ?>">
            <div class="product_outer carousel_items">

                    <?php endif; ?>

                    <?php
if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] == 1) {
$image_rotate = 1;
}  else {
$image_rotate = $theme_products["rollover_effect"];
}

if (!isset($theme_products["product_catalog_mode"])) {
$product_catalog_mode = 'disable';
} else {
$product_catalog_mode = $theme_products["product_catalog_mode"];
}

if (isset($theme_products["quick_status"])) {
$quick_status = $theme_products["quick_status"];
}

$category1 = 0;
$category2 = 0;
$category3 = 1;

        $slider = 4;
                $small = 1;

include('catalog/view/theme/theme_slider_model.php');
    ?>

                    <?php if (isset($theme_products["slider_mode"]) && $theme_products["slider_mode"] == 'simple'): ?>
                </div>

            </div>
        </div>
    </div>

</div>
<?php endif; ?>

