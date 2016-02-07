    <?php
    foreach ($products as $product) {
                            if (isset($sale_status) && $sale_status !== 'disable') {
                               if ($product['special']) {
                                    $sticker_sale = '<div style="'.($image_rotate == 'none' ?  'display:block !important' : '').'" class="label_sale label_sale_'.($sale_position !== '' ?  $sale_position : 'top_right').'">'.$sale_label.'</div>';
                                } else {
                                    $sticker_sale = '';
                                }
                            } else {
                                $sticker_sale = '';
                            }


                            if (isset($new_status) && $new_status !== 'disable') {
                                $day_range = 10;
                                if ($newlabel_period == '') {$days = $day_range;}
                                $day_number_to_range = date( "Y-m-d" ,  strtotime("-$days day")  );

                                if ($product['date_available'] >= $day_number_to_range) {
                                    $sticker_new = '<div style="'.($image_rotate == 'none' ?  'display:block !important' : '').'" class="label_new label_new_'.($new_position !== '' ?  $new_position : 'top_left').'">'.$new_label.'</div>';
                                } else {
                                    $sticker_new = '';
                                }
                            } else {
                                $sticker_new = '';
                            }

                    $image_empty_src = 'data/no_image.jpg';
                    $image_empty = $this->model_tool_image->resize($image_empty_src, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));


    ?>


        <!-- main image -->


        <div class="<?php echo (isset($theme_options["layout_skin"])&&$theme_options["layout_skin"] == 'skin_cosmetic' && $small == 1) ? 'span2' : 'span3'; ?> product carousel_item <?php echo ($category1 == 1 ? 'category1' : ''); ?> <?php echo ($category2 == 1 ? 'category2' : ''); ?> <?php echo ($category3 == 1 ? 'category3' : ''); ?>">
<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_product">
<?php endif; ?>
<?php endif; ?>
            <!-- LABELS -->
            <?php echo $sticker_sale.$sticker_new; ?>
            <?php
            if ($product_catalog_mode !== 'enable' ) :
                if ($product['special']) {
                    if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                        echo '<div class="sale_discount img-rounded">-'.$product['discount'].'%</div>';
                    }
                }
            endif;
            ?>
            <!-- //LABELS -->
            <div class="product-image-wrapper onhover animate scale">
                            <?php if (isset($quick_status) && $quick_status !== '0') : ?>
                                <?php if ($image_rotate != 1 ) : ?>
                                    <a onclick="quickBox('<?php echo $product['product_id']; ?>');" class="quickview img-circle hidden-phone hidden-small-desktop hidden-tablet fancybox" href="#quickview-<?php echo $product['product_id']; ?>">
                                        <table>
                                            <tr>
                                                <td class="quick_view_td">
                                                    <span><?php echo $quick_view; ?></span>
                                                </td>
                                            </tr>
                                        </table>
                                    </a>
                                <?php endif; ?>
                            <?php endif; ?>




                            <a class="main-image-<?php echo $product['product_id']; ?>" href="<?php echo $product['href']; ?>">

                                <?php if ($image_rotate != 2 ) { ?>
                                    <?php if ($product['thumb']) { ?>
                                        <img class="first-main-image first-main-image-<?php echo $product['product_id']; ?> product-retina" data-image2x="<?php echo $product['thumb2x']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                    <?php } else { ?>
                                        <img class="first-main-image first-main-image-<?php echo $product['product_id']; ?>" data-retina="true" width="258" height="245" src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                    <?php } ?>

                                    <?php if ($product['popup']) { ?>
                                        <img class="roll_over_img product-retina" data-image2x="<?php echo $product['popup2x']; ?>" src="<?php echo $product['popup']; ?>" alt="<?php echo $product['name']; ?>" />
                                    <?php } ?>
                                <?php } else { ?>
                                        <div class="view1">
                                            <?php if ($product['thumb']) { ?>
                                            <img class="first-main-image first-main-image-<?php echo $product['product_id']; ?> product-retina" data-image2x="<?php echo $product['thumb2x']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                            <?php } else { ?>
                                            <img class="first-main-image first-main-image-<?php echo $product['product_id']; ?>" data-retina="true" width="258" height="245" src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                            <?php } ?>
                                        </div>

                                        <div class="view2">
                                            <?php if ($product['popup']) { ?>
                                            <img class="product-retina" data-image2x="<?php echo $product['popup2x']; ?>" src="<?php echo $product['popup']; ?>" alt="<?php echo $product['name']; ?>" />
                                            <?php } elseif ($product['thumb']) { ?>
                                            <img class="product-retina" data-image2x="<?php echo $product['thumb2x']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                            <?php } else { ?>
                                            <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                            <?php }  ?>
                                        </div>
                                <?php }  ?>


                            </a>

                        </div>


            <!--begin countdown-->
            <?php
            if (!isset($theme_products["countdown_status"]) || ($theme_products["countdown_status"] !== 'disable')) :

                if ($product['special']) :
                    if ($product['date_end']) :

                        $full_date = explode("-", $product['date_end']);

                        $year_end = $full_date[0];
                        if($full_date[1] < 10) {
                            $month_end = (int)$full_date[1];
                        } else {
                            $month_end = $full_date[1];
                        }
                        $day_end = $full_date[2];

                        if ($day_end !== 0 && $year_end !==0 && $month_end !== 0) :

                            ?>
                            <div class="countdown_box">
                                <div class="countdown_inner">
                                    <div class="title"><?php echo $countdown; ?></div>
                                    <script type="text/javascript"><!--
                                    jQuery(function () {
                                        var austDay = new Date(<?php echo $year_end; ?>, <?php echo $month_end; ?> - 1, <?php echo $day_end; ?>);
                                        jQuery('.defaultCountdown-<?php echo $product['product_id']; ?>').countdown({until: austDay});
                                    });
                                    //--></script>

                                    <div class="defaultCountdown-<?php echo $product['product_id']; ?>"></div>
                                </div>
                            </div>
                            <?php
                        endif;
                    endif;
                endif;
            endif;
            ?>
            <!--end countdown-->

            <div class="wrapper-hover">
                            <div class="product-name">
                                <a href="<?php echo $product['href']; ?>"><?php echo $product['name_short']; ?></a>
                            </div>
                            <?php if ($product_catalog_mode !== 'enable' ) : ?>
                                <div class="wrapper">
                                    <div class="product-tocart">
<!--                                        <a class="button_compare" onclick="addToCompare_theme('<?php echo $product['product_id']; ?>');"><i class="icon-chart-bar"></i></a>
                                        <a class="button_wishlist" onclick="addToWishList_theme('<?php echo $product['product_id']; ?>');"><i class="icon-plus"></i></a>-->
                                        <a class="button_add_cart" onclick="addToCart_theme('<?php echo $product['product_id']; ?>');"><i class="icon-medstore-cart"></i></a>
                                    </div>

                                    <div class="product-price">
                                        <?php if ($product['price']) { ?>
                                        <?php if (!$product['special']) { ?>
                                            <?php echo $product['price']; ?>
                                        <?php } else { ?>
                                        <div class="product-price-regular">
                                            <span class="new"><?php echo $product['special']; ?></span>
                                            <span class="old"><?php echo $product['price']; ?></span>
                                        </div>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>

                            </div>
                            <?php endif; ?>
                        </div>

        <?php if (isset($theme_options["layout_skin"])) : ?>
            <?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            </div>
<?php endif; ?>
            <?php endif; ?>

        </div>
        <!-- main image -->

                    <?php if ($image_rotate == 1) { ?>
                    <!-- addit images -->
                    <div class="preview <?php echo (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic' && $small == 1) ? 'small' : 'big'; ?> hidden-tablet hidden-phone">

<?php if (isset($theme_options["layout_skin"])) : ?>
<?php if ($theme_options["layout_skin"] == 'skin_medstore') : ?>
            <div class="border_preview">
<?php endif; ?>
<?php endif; ?>

                            <!-- LABELS -->
                        <?php echo $sticker_sale.$sticker_new; ?>
                        <?php
                        if ($product_catalog_mode !== 'enable' ) :
                            if ($product['special']) {
                                if (isset($theme_products["discount_status"])&& $theme_products["discount_status"] !== 'disable' && $product['price']) {
                                    echo '<div class="sale_discount img-rounded">-'.$product['discount'].'%</div>';
                                }
                            }
                        endif;
                        ?>
                    <!-- //LABELS -->


                    <div class="wrapper">
                        <!--quick view-->
                        <?php if (isset($quick_status) && $quick_status !== '0') : ?>
                                <div class="horizon_quick_view_align">
                                    <div class="content_example_wrapper">
                                        <a onclick="quickBox('<?php echo $product['product_id']; ?>', '<?php echo $slider; ?>');" class="quickview img-circle hidden-phone hidden-small-desktop hidden-tablet fancybox" href="#quickview-<?php echo $product['product_id']; ?>-<?php echo $slider; ?>">
                                            <table><tr><td class="quick_view_td"><i class="icon-zoom-in"></i></td></tr></table>
                                        </a>
                                    </div>
                                </div>

                        <div id="quickview-<?php echo $product['product_id']; ?>-<?php echo $slider; ?>" style="display: none;">
                            <div class="product-box quickviewblock">
                                <div class="row">
                                    <!--image-->
                                    <div class="span3">
                                        <div class="product-img-box onhover scale animated">
                                        </div>
                                    </div>
                                    <!--image-->
                                    <div class="span4">
                                        <div class="product-info product-shop">
                                            <div class="product-name"><h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3></div>
                                            <div class="quick_description">
                                                <?php echo $product['description']; ?>
                                            </div>
                                            <!--options-->
                                            <?php if ($product_catalog_mode !== 'enable' ) : ?>
                                            <div class="price-box">
                                                <?php if ($product['price']) { ?>
                                                    <?php if (!$product['special']) { ?>
                                                        <?php echo $product['price']; ?>
                                                    <?php } else { ?>
                                                    <div class="product-price-regular">
                                                        <span class="old-price"><span class="price"><?php echo $product['price']; ?></span></span>
                                                        <span class="price-new"><?php echo $product['special']; ?></span>
                                                    </div>
                                                    <?php } ?>
                                                <?php } ?>
                                            </div>
                                            <!--
                                            <?php if ($product['tax']) : ?>
                                                <div class="price-tax"><?php echo $ex_tax; ?>: <?php echo $product['tax']; ?></div>
                                                <?php endif; ?>
                                            -->
                                            <?php if ($product['points']) : ?>
                                                <div class="reward">
                                                    <?php echo $price_in_reward_points; ?> <?php echo $product['points']; ?>
                                                </div>
                                                <?php endif; ?>

                                            <div class="cart add-to-cart">
                                                <a class="button btn-cart" onclick="addToCart_theme('<?php echo $product['product_id']; ?>');">
                                                    <i class="icon-cart"></i>
                                                    <?php echo $button_cart; ?>
                                                </a>
                                            </div>
<!--                                            <div class="product-link">
                                                <ul>
                                                    <li class="additional_link wishlist_link">
                                                        <a onclick="addToWishList_theme('<?php echo $product['product_id']; ?>');" class="small_icon_color"><i class="icon-heart"></i></a>
                                                        <a onclick="addToWishList_theme('<?php echo $product['product_id']; ?>');" class="small_icon_color"><?php echo $button_wishlist; ?></a>
                                                    </li>
                                                    <li class="additional_link compare_link">
                                                        <a onclick="addToCompare_theme('<?php echo $product['product_id']; ?>');" class="small_icon_color"><i class="icon-popup"></i></a>
                                                        <a onclick="addToCompare_theme('<?php echo $product['product_id']; ?>');" class="small_icon_color"><?php echo $button_compare; ?></a>
                                                    </li>

                                                </ul>
                                            </div>-->

                                            <?php endif; ?>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <?php endif; ?>
                        <!--end quick view-->



                        <!-- some previews -->
            <?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') : ?>
                            <?php if ($product['popup'] && count($product['additional_images']) > 1) : ?>
                        <div class="col-1">
                            <?php $quantity = 0; ?>
                            <?php

                            foreach($product['additional_images'] as $additional_image){ ?>

                                <?php
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
                            } ?>
                        </div>
                            <?php endif; ?>
                    <?php endif; ?>
                    <!-- some previews -->

                        <div class="col-2">
                                <div class="big_image">

                                        <a href="<?php echo $product['href']; ?>">




                                        <?php if ($product['popup']) { ?>
                                            <img class="product-retina" data-image2x="<?php echo $product['popup2x']; ?>" src="<?php echo $product['popup']; ?>" alt="<?php echo $product['name']; ?>" />
                                        <?php } elseif ($product['thumb']) { ?>
                                            <img class="product-retina" data-image2x="<?php echo $product['thumb2x']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
                                        <?php } else { ?>
                                            <img src="<?php echo $image_empty; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                                        <?php }  ?>
                                    </a>
                                </div>
                                <div class="wrapper-hover">
                                    <div class="product-name">
                                        <a href="<?php echo $product['href']; ?>"><?php echo $product['name_short']; ?></a>
                                    </div>

                                    <?php if ($product_catalog_mode !== 'enable' ) : ?>
                                    <div class="wrapper">
                                        <div class="product-tocart">
                                            <a><i onclick="addToCart_theme('<?php echo $product['product_id']; ?>');" class="icon-medstore-cart"></i></a>
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

<!--                                    <div class="product-link">
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
                    <!-- addit images -->
                    <?php } ?>

                    <?php } ?>


