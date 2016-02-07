<?php
$theme_products = $this->config->get('bs_products');

/* output for labels */
if (isset($theme_products["sale_status"])) {$sale = $theme_products["sale_status"];}  else {$sale = '';}
if (isset($theme_products["new_status"])) {$new = $theme_products["new_status"];}  else {$new = '';}

if (isset($theme_products["sale_position"])) {$saleposition = $theme_products["sale_position"];}  else {$saleposition = '';}
if (isset($theme_products["new_position"])) {$newposition = $theme_products["new_position"];}  else {$newposition = '';}

if (isset($theme_products["newlabel_period"])) {
$days = $theme_products["newlabel_period"];
} else {
    $days = 10;
}
/* end output for labels */

$lang = $this->session->data['language'];

if ($lang == 'ar'&& $theme_products["cloudzoom_mode"] == 'right') {
    $theme_products["cloudzoom_mode"] = 'left';
}



$extensions = $this->model_setting_extension->getExtensions('module');
for ($i = 1; $i < count($extensions); $i++) {
    if ($extensions[$i]["code"] == 'bioproduct_products_options') {
        $products_module_exist = 1;
        $k = $this->load->model('customisation/bioproduct_products_options');
        $youtube = $this->model_customisation_bioproduct_products_options->getAttribute('product_video',$product_id);
    }
}


if (!isset($theme_products["rollover_effect"])) {
    $image_rotate = 1;
}  else {
    $image_rotate = $theme_products["rollover_effect"];
}

if (!isset($theme_products["product_catalog_mode"]))  {$theme_products["product_catalog_mode"] == 'enable';}

?>
<?php echo $header; ?>

<!--1-->


<?php echo $content_top; ?>

<!--BREADCRUMBS BOX-->
<div class="content_top">
    <div class="wrapper_w">
        <div class="breadcrumbs">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <div itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
                    <span class="breadcrumbs_separator <?php echo ($breadcrumb['separator'] == '' ? 'first_separator' : ''); ?>"><?php echo $breadcrumb['separator']; ?></span>
                    <a itemprop="url" href="<?php echo $breadcrumb['href']; ?>">
                        <span class="breadcrumb_title" itemprop="title"><?php echo $breadcrumb['text']; ?></span>
                    </a>
                </div>
            <?php } ?>
        </div>

    </div>
</div>
<!--END BREADCRUMBS BOX-->




  <div class="product-box" itemscope itemtype="http://data-vocabulary.org/Product">
  <div class="row">
  <?php
  if ($thumb || $images || (isset($youtube) && $youtube != '-')) {
     $image_empty_src = 'data/no_image.jpg';
     $image_empty = $this->model_tool_image->resize($image_empty_src, $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));

  ?>
    <div class="<?php echo (($images || (isset($youtube) && $youtube != '-')) ? 'span5' : 'span4'); ?>">

        <div class="product-img-box noselect">
            <div class="<?php echo ($images ? 'row' : 'row-no-add-images'); ?>">

                <!--additional images-->
                <?php if ($images) { ?>
                    <div class="span1">
                        <div class="product-more-views">
                            <ul class="jcarousel jcarousel-skin-previews">
                                <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') : ?>
                                    <li>
                                       <?php if ($thumb) { ?>
                                           <img class="cloudzoom-gallery" src="<?php echo $thumb; ?>" data-cloudzoom="useZoom: '#CloudZoom', image:'<?php echo $thumb; ?>', zoomImage: '<?php echo $popup; ?>' " itemprop="image" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                       <?php } ?>
                                    </li>
                                <?php endif; ?>
                                <?php foreach ($images as $image) { ?>
                                    <li>
                                        <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') { ?>
                                            <img class="cloudzoom-gallery" itemprop="image" src="<?php echo $image['thumb']; ?>" data-cloudzoom = "useZoom: '#CloudZoom', image: '<?php echo $image['thumb']; ?>', zoomImage: '<?php echo $image['popup']; ?>' " title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        <?php } else { ?>
                                            <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="fancybox" rel="group">
                                                <img class="cloudzoom-gallery" itemprop="image" src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                            </a>
                                        <?php } ?>

                                    </li>
                                <?php } ?>

                                <!--youtube video-->
                                <?php if (isset($youtube) && $youtube != '-') : ?>
                                <li>
                                    <a class="video various fancybox.iframe" href="<?php echo $youtube; ?>"><i class="icon-link"></i></a>
                                </li>
                                <?php endif; ?>
                                <!--youtube video-->

                            </ul>
                        </div>
                    </div>
                <?php } else {
                        if (isset($youtube) && $youtube != '-') {
                ?>
                <div class="span1">
                    <div class="youtube_empty">
                        <a class="video various fancybox.iframe" href="<?php echo $youtube; ?>"><i class="icon-link"></i></a>
                    </div>

                </div>

                <?php
                        }
                 }

                 ?>
                <!-- end additional images-->

                <?php if ($thumb) { ?>
                    <div class="<?php echo ($images ? 'span4' : 'no-add-images'); ?>">
                        <div class="product-image">
                            <?php if ($theme_products["product_zoom_mode"] !== 'fancybox') { ?>
                            <img class = "cloudzoom" id="CloudZoom" itemprop="image" src="<?php echo $thumb; ?>" data-cloudzoom = "zoomImage: '<?php echo $popup; ?>'" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />

                            <?php } else { ?>

                            <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="universal fancybox" rel="group">
                            <img class="cloudzoom" itemprop="image" src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                            </a>
                            <?php } ?>


                    </div>
                <?php } else { ?>
                    <div class="<?php echo ($images ? 'span4' : 'no-add-images'); ?>">
                        <div class="product-image">
                            <img itemprop="image" data-retina="true" width="460" height="440" src="<?php echo $image_empty; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                        </div>

                <?php  } ?>


                        <!--social plugins-->
                        <div class="socials_plugins">

                            <?php
             if (isset($theme_products["facebook_button"]) && $theme_products["facebook_button"] !== '') :
        ?>
                            <div class="facebook">

                                <script>(function(d, s, id) {
                                    var js, fjs = d.getElementsByTagName(s)[0];
                                    if (d.getElementById(id)) return;
                                    js = d.createElement(s); js.id = id;
                                    js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
                                    fjs.parentNode.insertBefore(js, fjs);
                                }(document, 'script', 'facebook-jssdk'));</script>

                                <div class="fb-like" data-href="https://www.facebook.com/<?php echo $theme_products["facebook_button"]; ?>" data-width="150" data-layout="button_count" data-show-faces="true" data-send="false"></div>

                        </div>
                        <?php
             endif;

             if (isset($theme_products["twitter_button"]) && $theme_products["twitter_button"] !== '') :
        ?>
                        <div class="twitter">
                            <a href="https://twitter.com/share" class="twitter-share-button" data-url="https://twitter.com/<?php echo $theme_products["twitter_button"]; ?>" data-text="seaofclouds">Tweet</a>
                            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
                        </div>
                        <?php
             endif;

             if (isset($theme_products["pinit_button"]) && $theme_products["pinit_button"] !== '') {
                $pinit_button = html_entity_decode($theme_products["pinit_button"], ENT_QUOTES, 'UTF-8');
                echo '<div class="pinit_button">'.$pinit_button.'</div>';
                        }
                        ?>

                    </div>
                <!--end social plugins-->

                </div>

          </div>



  </div>

    </div>
    <?php } ?>


  <!--right block-->
  <div class="<?php echo (($images || (isset($youtube) && $youtube != '-')) ? 'span7' : 'span8'); ?>">



    <div class="product-info product-shop">

    <!--custom block-->
    <div class="product_custom">
        <?php echo $column_right; ?>

    </div>

    <!--end custom block-->


    <!--end info part-->

    <div class="product_info_left">
        <div class="product-name"><h1 itemprop="name"><?php echo $heading_title; ?></h1></div>

        <p class="availability in-stock">
            <span><?php echo $text_stock; ?><strong itemprop="availability"> <?php echo $stock; ?></strong></span>
            <br>
            <?php if ($manufacturer) { ?>
            <span><?php echo $text_manufacturer; ?></span>
            <a href="<?php echo $manufacturers; ?>"><span itemprop="brand"><?php echo $manufacturer; ?></span></a><br />
            <?php } ?>
            <span><?php //echo $text_model; ?></span> <?php //echo $model; ?><br />
            <?php if ($reward) { ?>
            <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
            <?php } ?>
        </p>

        <div class="short-description">
            <?php if ($description) : ?>
            <?php
                echo (utf8_substr(strip_tags(html_entity_decode($description, ENT_QUOTES, 'UTF-8')), 0, 200) . '..');
            ?>
            <?php endif; ?>
            </div>
        </div>



        <!-- price-->


        <?php
        if ($theme_products["product_catalog_mode"] !== 'enable' ) {

            if ($price) { ?>
                  <div itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer" class="price-box">

                        <?php if (!$special) { ?>
                            <span itemprop="price"><?php echo $price; ?></span>
                        <?php } else { ?>
                              <span class="old-price">
                                 <span class="price"><?php echo $price; ?></span>
                              </span>
                              <span class="special-price">
                                  <span itemprop="price" class="price"><?php echo $special; ?></span>
                              </span>
                        <?php } ?>
                        <br />


                        <?php if ($tax) { ?>
                            <span class="price-tax"><?php //echo $text_tax; ?> <?php //echo $tax; ?></span><br />
                        <?php } ?>
                        <?php if ($points) { ?>
                            <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
                        <?php } ?>
                        <?php if ($discounts) { ?>
                        <br />
                        <div class="discount">
                          <?php foreach ($discounts as $discount) { ?>
                            <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
                          <?php } ?>
                        </div>
                        <?php } ?>
                  </div>
              <?php }        
      }
      ?>
        <!-- end price-->
        <?php if ($options) { ?>
          <div class="options">
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
                <b><?php echo $option['name']; ?>:</b><br />
                <select name="option[<?php echo $option['product_option_id']; ?>]">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
              <?php } ?>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
              <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
              </label>
              <br />
              <?php } ?>
            </div>
            <br />
            <?php } ?>
            
            
                       
            
            <?php if ($option['type'] == 'image') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />

              <div class="option-image">
                <?php foreach ($option['option_value'] as $option_value) { ?>
                <div class="label_wrapper">
                    <td class="label_image" style="width: 1px">
                        <input class="label_image" type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                    </td>

                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>

                      <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>

                </div>
                <?php } ?>
              </div>

            </div>

            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
            </div>
            <br />
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
              <?php if ($option['required']) { ?>
              <span class="required">*</span>
              <?php } ?>
              <b><?php echo $option['name']; ?>:</b><br />
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
            </div>
            <br />
            <?php } ?>
            <?php } ?>
          </div>
          <?php } ?>


        <?php if ($theme_products["product_catalog_mode"] !== 'enable' ) : ?>

        <div class="cart add-to-cart">

              <div class="qty">
                  <label for="qty"><?php echo $text_qty; ?></label>
                  <input type="button" class="decrease" id="decrease" value="-" />
                  <input id="qty" class="input-text qty" type="text" name="quantity" value="<?php echo $minimum; ?>" />
                  <input type="button" class="increase" id="increase" value="+" />
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              </div>
              <button id="button-cart" class="button btn-cart" title="<?php echo $button_cart; ?>" type="button">
                  <i class="icon-cart"></i><?php echo $button_cart; ?>
              </button>


            <?php if ($minimum > 1) { ?>
                <div class="minimum"><?php echo $text_minimum; ?></div>
            <?php } ?>

          </div>
        

        <?php endif; ?>



         


  </div>

    <!--end info part-->

    </div>
  </div>

  <!--end right block-->

  </div>

<div class="row tabs_wrapper">
    <div class="span12">
        <ul class="nav-tabs contentTab">
            <?php if ($description) { ?>
            <li class="active"><a href="#tab-description"><?php echo $tab_description; ?></a></li>
            <?php } ?>

            <?php if ($attribute_groups) { ?>
            <li class="<?php echo(!$description ? 'active':'none_active'); ?>"><a href="#tab-attribute"><?php echo $tab_attribute; ?></a></li>
            <?php } ?>
            <?php if ($review_status) { ?>
            <li class="<?php echo(!$description && !$attribute_groups ? 'active':'none_active'); ?>"><a href="#tab-review"><?php echo $tab_review; ?></a></li>
            <?php } ?>

            <?php if ($tags) { ?>
            <li class="<?php echo(!$description && !$attribute_groups && !$review_status ? 'active':'none_active'); ?>"><a href="#tab-tags">Tags</a></li>
            <?php } ?>
            <?php if ($content_bottom) : ?>
            <li class="<?php echo(!$description && !$attribute_groups && !$review_status && !$tags ? 'active':'none_active'); ?>">
                <a href="#tab-custom-block">
                    <?php
                        if (isset($theme_products[$lang]["tabblock_title"]) && $theme_products[$lang]["tabblock_title"] !== '') {
                            echo $theme_products[$lang]["tabblock_title"];
                        } else {
                            echo 'Custom block';
                        }
                     ?>
                </a>
            </li>
            <?php endif; ?>


        </ul>
        <div class="tab-content">
            <?php if ($description) { ?>
            <div id="tab-description" class="tab-pane active">
                <?php echo $description; ?>
            </div>
            <?php } ?>

            <?php if ($attribute_groups) { ?>
            <div id="tab-attribute" class="tab-pane <?php echo(!$description ? 'active':'none_active'); ?>">
                <table class="attribute">
                    <?php foreach ($attribute_groups as $attribute_group) { ?>
                    <thead>
                    <tr>
                        <td colspan="2"><?php echo $attribute_group['name']; ?></td>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <tr>
                        <td><?php echo $attribute['name']; ?></td>
                        <td><?php echo $attribute['text']; ?></td>
                    </tr>
                    <?php } ?>
                    </tbody>
                    <?php } ?>
                </table>
            </div>
            <?php } ?>
            <?php if ($review_status) { ?>
            <div id="tab-review" class="tab-pane <?php echo(!$description && !$attribute_groups ? 'active':'none_active'); ?>">
                <div id="review"></div>
                <h3 id="review-title"><?php echo $text_write; ?></h3>
                <b><?php echo $entry_name; ?></b><br />
                <input type="text" name="name" value="" />
                <br />
                <br />
                <b><?php echo $entry_review; ?></b>
                <textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea>
                <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                <br />
                <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
                <input type="radio" name="rating" value="1" />
                &nbsp;
                <input type="radio" name="rating" value="2" />
                &nbsp;
                <input type="radio" name="rating" value="3" />
                &nbsp;
                <input type="radio" name="rating" value="4" />
                &nbsp;
                <input type="radio" name="rating" value="5" />
                &nbsp;<span><?php echo $entry_good; ?></span><br />
                <br />
                <b><?php echo $entry_captcha; ?></b><br />
                <input type="text" name="captcha" value="" />
                <br />
                <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
                <br />
                <div class="buttons">
                    <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
                </div>
            </div>
            <?php } ?>


            <?php if ($tags) { ?>
            <div id="tab-tags" class="tab-pane <?php echo(!$description && !$attribute_groups && !$review_status ? 'active':'none_active'); ?>">
                <b><?php echo $text_tags; ?></b>
                <?php for ($i = 0; $i < count($tags); $i++) { ?>
                <?php if ($i < (count($tags) - 1)) { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                <?php } else { ?>
                <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                <?php } ?>
                <?php } ?>
            </div>
            <?php } ?>


            <?php  if ($content_bottom) : ?>
            <div id="tab-custom-block" class="tab-pane <?php echo(!$description && !$attribute_groups && !$review_status && !$tags ? 'active':'none_active'); ?>">
                <?php echo $content_bottom; ?>
            </div>
            <?php endif; ?>
        </div>

    </div>
</div>



<!--related products-->
<?php if ($products) { ?>
<div class="container rollover_none related_products container_width_change_related">
    <h3 class="padding"><?php echo $tab_related; ?></h3>
    <div class="carousel es-carousel-wrapper style0">
        <div class="es-carousel">
            <div class="row">
                <div class="product_outer carousel_items">
                    <?php $columns_count = 4; $product_block_width = 3; ?>
                    <?php include('catalog/view/theme/listing_view_grid.php'); ?>
                </div>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<!--end related products-->


<!-- MODULE: CUSTOMER WHO BOUGHT THIS ALSO BOUGHT-->
<?php
if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/product_also_bought.tpl')) :
include('product_also_bought.tpl');
endif;
?>
<!-- MODULE: CUSTOMER WHO BOUGHT THIS ALSO BOUGHT-->





<!--1-->

<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script>

<!--fancybox-->
<?php if ($theme_products["product_zoom_mode"] == 'fancybox') : ?>
<script type="text/javascript"><!--
$(".fancybox").fancybox();
//--></script>
<?php endif; ?>

<script type="text/javascript">
    $(".various").fancybox({
        maxWidth	: 800,
        maxHeight	: 600,
        fitToView	: false,
        width		: '70%',
        height		: '70%',
        autoSize	: false,
        closeClick	: false,
        openEffect	: 'none',
        closeEffect	: 'none'
    });

</script>

<!--end fancybox-->

<script type="text/javascript"><!--
$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
                
                if (json['error']['profile']) {
                    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                }
			} 
			
			if (json['success']) {
				//$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                $('#notification').html('<div class="preloader"><div class="success_ev" style="display: none;">' + json['success'] + '</div></div>');
                $('.success_ev').fadeIn('slow');

                var str=json['total'];
                var myArray = str.split(' ');

                $('#header #cart').removeClass('active');
                $('#spy #cart').removeClass('active');

                $('#spy #cart-total').html(myArray[0]);
                $('#header #cart-total').html(myArray[0]);


                //$('#cart-total').html(json['total']);
                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)

                //$('html, body').animate({ scrollTop: 0 }, 'slow');
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			//$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				//$('#review-title').after('<div class="warning">' + data['error'] + '</div>');

                $('#notification').html('<div class="preloader"><div class="success_ev warning_message" style="display: none;">' + data['error'] + '</div></div>');
                $('.success_ev').fadeIn('slow');

                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)


            }
			
			if (data['success']) {
				//$('#review-title').after('<div class="success">' + data['success'] + '</div>');

                $('#notification').html('<div class="preloader"><div class="success_ev success_message" style="display: none;">' + data['success'] + '</div></div>');
                $('.success_ev').fadeIn('slow');

                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)


                $('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>