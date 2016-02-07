<?php
$theme_options = $this->config->get('bs_general');
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


if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
    $product_block_width = 2;
} else {
    $product_block_width = 3;
}

if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
    $columns_count = 6;
} else {
    $columns_count = 4;
}
if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] == 1) {
$image_rotate = 1;
}  else {
$image_rotate = $theme_products["rollover_effect"];  
}

?>

<?php echo $header; ?>
<?php echo $content_top; ?>

<div id="content" class="<?php echo ((empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) ? 'span9' : 'span12 float_none');  ?> rollover_none">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>

    <!-- pager block -->
    <div class="listing_header_row1">
        <div class="pull-left">
            <label class="label_sort"><?php echo $text_sort; ?></label>
            <div class="select_wrapper width1">
                <select class="custom sort-by" onchange="location = this.value;" tabindex="1">
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
        </div>
        <div class="pull-left aligncenter hidden-phone">
            <div class="display">
                <label><span class="hidden-tablet"><?php echo $text_display; ?></span></label>
                <a class="icon-th active">&nbsp;</a>
                <a onclick="display('list');" class="icon-th-list">&nbsp;</a>
            </div>
        </div>
        <div class="pull-right alignright">
            <label><span class="hidden-phone"><?php echo $text_limit; ?></span></label>
            <div class="select_wrapper width3">
                <select class="custom" onchange="location = this.value;">
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                </select>
            </div>
            per&nbsp;page</div>
    </div>
    <div class="product-compare">
        <a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a>
    </div>
    <div class="line1"></div>
    <div class="pagination listing_header_row2"><?php echo $pagination; ?></div>
    <!-- end pager block -->

    <!--changed listings-->
    <div class="product-listing product-grid">
        <div class="row <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?>_<?php echo ((empty($theme_products["product_listing"]) || $theme_products["product_listing"] !== 'simple' ) ? 'with' : 'without'); ?>_description <?php echo ((!empty($theme_products["product_catalog_mode"]) && $theme_products["product_catalog_mode"] == 'enable' ) ? 'catalog_mode' : 'usual_mode');  ?> isotope-outer">
        <?php include('catalog/view/theme/listing_view.php'); ?>
    </div>
</div>
<!--changed listings-->



<?php } else { ?>
    <div class="content"><?php echo $text_empty; ?></div>
  <?php }?>

  <?php echo $content_bottom; ?>

</div>
<?php if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) {
        echo $column_left;
        echo $column_right;
}
?>

<script type="text/javascript"><!--
/*
function isotopeGo() {
    //if (jQuery('.isotope-outer').length != 0){
    //jQuery('.isotope-outer').isotope('reLayout');
    //}
    if (jQuery('.isotope-outer').length != 0){
        jQuery('.isotope-outer').isotope({
            itemSelector: '.product',
            layoutMode: 'fitRows'
        });
    }

}

function display(view) {
    if (view == 'list') {
        $('.product-listing').removeClass('product-grid');
        $('.product-listing').addClass('product-list');
        $('.display').html('<label><span class="hidden-tablet"><?php echo $text_display; ?></span></label><a class="icon-th-list active">&nbsp;</a><a onclick="display(\'grid\');" class="icon-th">&nbsp;</a>');
        $.totalStorage('display', 'list');
        isotopeGo();

    } else {
        $('.preview').stop(true, true).hide();
        $('.product-listing').removeClass('product-list');
        $('.product-listing').addClass('product-grid');
        $('.display').html('<label><span class="hidden-tablet"><?php echo $text_display; ?></span></label><a class="icon-th-list" onclick="display(\'list\');">&nbsp;</a><a class="icon-th active">&nbsp;</a>');
        $.totalStorage('display', 'grid');
        isotopeGo();

    }
}
view = $.totalStorage('display');
if (view) {
    display(view);
} else {
    display('grid');
}
*/
//--></script>

<?php echo $footer; ?>