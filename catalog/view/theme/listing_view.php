<?php
$col_count = 1;
if (!isset($theme_products["product_catalog_mode"]))  {$theme_products["product_catalog_mode"] == 'enable';}

foreach ($products as $k => $product) {

    /* --------------output for NEW label---------------- */
    $query = $this->db->query("SELECT date_added, date_available FROM ".DB_PREFIX."product WHERE product_id='".$product['product_id']."'");
    $date_available = $query->row["date_available"];

    if (isset($new) && $new !== 'disable') {

        $day_number_to_range = date( "Y-m-d" ,  strtotime("-$days day")  );

        if ($date_available >= $day_number_to_range) {
            $sticker_new = '<span class="label_new label_new_'.($newposition !== '' ?  $newposition : 'top_left').'">NEW</span>';
        } else {
            $sticker_new = '';
        }
    } else {
        $sticker_new = '';
    }
    /* --------------end output for NEW label---------------- */


    /* --------------output for SALE label---------------- */
    if (isset($sale) &&  $sale !== 'disable') {
        if ($product['special']) {
            $sticker_sale = '<span class="label_sale label_sale_'.($saleposition !== '' ?  $saleposition : 'top_right').'">SALE</span>';
        } else {
            $sticker_sale = '';
        }
    } else {
        $sticker_sale = '';
    }
    /* --------------end output for SALE label---------------- */
    $main_image = $this->model_catalog_product->getProduct($product['product_id']);
    $main = $this->model_tool_image->resize($main_image['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));
    $main2x = $this->model_tool_image->resize($main_image['image'], $this->config->get('config_image_related_width')*2, $this->config->get('config_image_related_height')*2);


    $results_images = $this->model_catalog_product->getProductImages($product['product_id']);

    if ($results_images) {

        $first = true;
        foreach ($results_images as $results_image) {
            if ( $first ) {
                $popup = $this->model_tool_image->resize($results_image['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                $popup2x = $this->model_tool_image->resize($results_image['image'], $this->config->get('config_image_product_width')*2, $this->config->get('config_image_product_height')*2);
                $first = false;
            }
        }
    } else {
        $popup = false;
        $popup2x = false;

    }
    $name_short = strlen($product['name']) > 50 ? utf8_substr(strip_tags(html_entity_decode($product['name'], ENT_QUOTES, 'UTF-8')), 0, 50) . '..' : $product['name'];

    $image_empty_src = 'data/no_image.jpg';
    $image_empty = $this->model_tool_image->resize($image_empty_src, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));


    $additional_images = $this->model_catalog_product->getProductImages($product['product_id']);

    ?>

    <div class="span<?php echo $product_block_width; ?> product <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?> carousel_item count_<?php echo $col_count; ?>">
<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_product">
<?php endif; ?>
<?php endif; ?>




    <!-- LABELS -->
        <?php echo $sticker_sale.$sticker_new; ?>
        <?php
        if ($theme_products["product_catalog_mode"] !== 'enable' ) :
            if ($product['special']) {
                if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                    $discount = round(((preg_replace('/[^\d.]/','',$product['price']) - preg_replace('/[^\d.]/','',$product['special']))/preg_replace('/[^\d.]/','',$product['price']))*100, 0);
                    echo '<div class="sale_discount img-rounded">-'.$discount.'%</div>';
                }
            }
        endif;
        ?>
        <!-- //LABELS -->
        <div class="product-image-wrapper onhover animate scale">

            <a href="<?php echo $product['href']; ?>">
                <?php if ($image_rotate != 2 ) { ?>
                    <?php if ($product['thumb']) { ?>
                        <img class="product-retina" data-image2x="<?php echo $main2x; ?>" src="<?php echo $main; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php } else { ?>
                        <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                    <?php } ?>

                <?php } else { ?>
                    <div class="view1">
                        <?php if ($product['thumb']) { ?>
                        <img class="product-retina" data-image2x="<?php echo $main2x; ?>" src="<?php echo $main; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                        <?php } else { ?>
                        <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                        <?php } ?>
                    </div>

                    <div class="view2">
                        <?php if ($popup) { ?>
                            <img class="product-retina" data-image2x="<?php echo $popup2x; ?>" src="<?php echo $popup; ?>" alt="<?php echo $product['name']; ?>" />
                        <?php
                    } elseif ($product['thumb']) { ?>
                        <img class="product-retina" data-image2x="<?php echo $thumb2x; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />

                        <?php } else {  ?>
                        <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                        <?php } ?>
                    </div>

                <?php }  ?>
            </a>

        </div>

                <div class="wrapper-hover <?php echo ((empty($theme_products["product_listing"]) || $theme_products["product_listing"] !== 'simple' ) ? '' : 'hidden_name'); ?>">
                    <div class="product-name">
                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                    </div>

                    <div class="wrapper">
                        <?php if ($theme_products["product_catalog_mode"] !== 'enable' ) : ?>
                        <div class="product-tocart">
                            <a onclick="addToCart_theme('<?php echo $product['product_id']; ?>');"><i class="icon-basket"></i></a>
                        </div>
                         <?php if ($product['price']) { ?>
                             <div class="product-price sort-price">
                                    <?php if (!$product['special']) { ?>
                                        <?php echo $product['price']; ?>
                                    <?php } else { ?>
                                    <div class="product-price-regular">
                                        <span class="new"><?php echo $product['special']; ?></span>
                                        <span class="old"><?php echo $product['price']; ?></span>
                                        </div>
                                 <?php } ?>
                                 <?php if ($product['tax']) { ?>
                                 <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                 <?php } ?>
                             </div>
                         <?php } ?>
                    <?php endif;    ?>
                        <!--rating-->
                        <?php if ($product['rating']) { ?>
                        <div class="sort-rating <?php echo (($theme_products["product_catalog_mode"] !== 'enable' )? 'rating-listing' : ''); ?> rating">
                            <?php
                            if ($product['rating'] > 0) {
                                echo '<strong>';
                                for ($i = 1; $i <= $product['rating']; $i++) {
                                    echo '<a><i class="icon-star"></i></a>';
                                }
                                echo '</strong>';
                                $k =  5 - $product['rating'];
                                for ($j = 1; $j <= $k; $j ++) {
                                    echo '<a><i class="icon-star"></i></a>';
                                }
                            } else {
                                for ($i = 1; $i <= 5; $i++) {
                                    echo '<a><i class="icon-star"></i></a>';
                                }
                            }
                            ?>
                        </div>
                        <?php } ?>
                        <!--rating-->

                    </div>

                    <!--description-->
                    <?php echo '<div class="list_description">'.$product['description'].'</div>';   ?>
                    <!--description-->

                    <!--buttons-->
                    <?php if ($theme_products["product_catalog_mode"] !== 'enable' ) : ?>
                        <div class="product-buttons listing_buttons">
                            <a class="button btn-cart" onclick="addToCart_theme('<?php echo $product['product_id']; ?>');">
                                <i class="icon-basket"></i><?php echo $button_cart; ?>
                            </a>

<!--                            <div class="add-to-links">
                                <ul>
                                    <li class="wishlist_link">
                                        <a class="small_icon_color" onclick="addToWishList_theme('<?php echo $product['product_id']; ?>');"><i class="icon-heart"></i><?php echo $button_wishlist; ?></a>
                                    </li>
                                    <li class="compare_link">
                                        <a class="small_icon_color" onclick="addToCompare_theme('<?php echo $product['product_id']; ?>');"><i class="icon-popup"></i><?php echo $button_compare; ?></a>
                                    </li>
                                </ul>
                            </div>-->
                        </div>
                    <?php endif; ?>

                    <!--buttons-->
                </div>

        <?php if (isset($theme_options["layout_skin"])) : ?>
        <?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            </div>
<?php endif; ?>
        <?php endif; ?>


    </div>


<!--previews-->
<?php if ($image_rotate == 1) : ?>

    <div class="preview <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?> hidden-tablet hidden-phone">
        <?php if (isset($theme_options["layout_skin"])) : ?>
        <?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_preview">
<?php endif; ?>
        <?php endif; ?>

        <?php
        echo $sticker_sale.$sticker_new;
        if ($theme_products["product_catalog_mode"] !== 'enable' ) :
            if ($product['special']) {
                if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                   echo '<div class="sale_discount img-rounded">-'.$discount.'%</div>';
                }
            }
        endif;
        ?>




        <div class="wrapper">
            <!--small images-->
            <?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') : ?>
                <?php if ($additional_images && count($additional_images) > 1) : ?>
                    <div class="col-1">
                        <?php $quantity = 0;
                        foreach($additional_images as $additional_image){
                            $quantity ++;
                            if ($quantity < 4){
                                $small_img_rel = $this->model_tool_image->resize($additional_image['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                                $small_img = $this->model_tool_image->resize($additional_image['image'], 71, 65);
                                $small_img2x = $this->model_tool_image->resize($additional_image['image'], 142, 130);
                                ?>
                                <a data-rel="<?php echo $small_img_rel; ?>" class="image">
                                    <img class="product-retina thumb" data-image2x="<?php echo $small_img2x; ?>" src="<?php echo $small_img; ?>" alt="<?php echo $product['name']; ?>" />
                                </a>
                                <?php
                            }
                        }
                        ?>
                    </div>
                <?php endif; ?>
            <?php endif; ?>
            <!--end small images-->
            <div class="col-2">
                     <div class="big_image">
                         <a href="<?php echo $product['href']; ?>">
                             <?php if ($popup) { ?>
                                <img class="product-retina" data-image2x="<?php echo $popup2x; ?>" src="<?php echo $popup; ?>" alt="<?php echo $product['name']; ?>" />
                             <?php
                                } elseif ($product['thumb']) { ?>
                                     <img class="product-retina" data-image2x="<?php echo $popup2x; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />

                             <?php } else {  ?>
                                     <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                             <?php } ?>
                         </a>
                     </div>
                        <div class="wrapper-hover">
                         <div class="product-name">
                             <a href="<?php echo $product['href']; ?>"><?php echo $name_short; ?></a>
                         </div>
                        <?php if (empty($theme_products["product_catalog_mode"]) || $theme_products["product_catalog_mode"] !== 'enable' ) :  ?>
                            <div class="wrapper">
                                <div class="product-tocart">
                                    <a><i onclick="addToCart_theme('<?php echo $product['product_id']; ?>');" class="icon-basket"></i></a>
                                </div>

                                <div class="product-price">
                                 <?php if ($product['price']) { ?>
                                 <?php if (!$product['special']) { ?>
                                     <?php echo $product['price']; ?>
                                     <?php } else { ?>
                                     <div class="product-price-regular">
                                         <span class="price-new"><?php echo $product['special']; ?></span>
                                         <span class="old"><?php echo $product['price']; ?></span>
                                     </div>
                                     <?php } ?>
                                 <?php } ?>
                             </div>

                            </div>

<!--                            <div class="product-link">
                                <div class="wishlist_link">
                                    <a onclick="addToWishList_theme('<?php echo $product['product_id']; ?>');"><i class="icon-plus"></i><?php echo $button_wishlist; ?></a>
                                </div>
                                <div class="compare_link">
                                    <a onclick="addToCompare_theme('<?php echo $product['product_id']; ?>');"><i class="icon-chart-bar"></i><?php echo $button_compare; ?></a>
                                </div>
                            </div>-->
                        <?php endif; ?>


                        <?php if ($product['rating']) { ?>
                         <div class="rating">
                             <?php
                             if ($product['rating'] > 0) {
                                 echo '<strong>';
                                 for ($i = 1; $i <= $product['rating']; $i++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                                 echo '</strong>';
                                 $k =  5 - $product['rating'];
                                 for ($j = 1; $j <= $k; $j ++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                             } else {
                                 for ($i = 1; $i <= 5; $i++) {
                                     echo '<a><i class="icon-star"></i></a>';
                                 }
                             }
                             ?>

                         </div>
                         <?php } ?>


                     </div>


                 </div>




             </div>

<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            </div>
<?php endif; ?>
<?php endif; ?>


    </div>

    <?php endif; ?>

<!--end previews-->

<?php
    $col_count ++;
    if ($col_count == $columns_count + 1) {$col_count = 1;}
}
?>

