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

if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) {
    if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
        $columns_count = 4;
    } else {
        $columns_count = 3;
    }
} else {
    if (!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) {
        $columns_count = 6;
    } else {
        $columns_count = 4;
    }
}


if (!isset($theme_products["rollover_effect"]) || $theme_products["rollover_effect"] == 1) {
$image_rotate = 1;
}  else {
$image_rotate = $theme_products["rollover_effect"];
}


?>


<?php echo $header; ?>
<?php echo $content_top; ?>

<div class="page_category">


    <div id="content" class="<?php echo ((empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) ? 'span9' : 'span12 float_none');  ?> rollover_none">

    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) : ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php endforeach; ?>
    </div>

    <h1 class="category_title"><?php echo $heading_title; ?></h1>
    <?php if ($thumb || $description) : ?>
        <div class="category-info">
             <?php if ($thumb) : ?>
                <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
             <?php endif; ?>
             <?php
             if ($description) :
                if (!isset($theme_products["category_description"]) || $theme_products["category_description"] !=0 ) :
                    echo $description;
                endif;
             endif;
             ?>
        </div>
    <?php endif; ?>


    <?php if ($categories) { ?>
        <h3 class="refine_search"><?php //echo $text_refine; ?></h3>
      <div class="category-list">



          <section class="color-5">
              <nav class="cl-effect-5">

        <?php if (count($categories) <= 5) { ?>

          <?php foreach ($categories as $category) { ?>
          <a href="<?php echo $category['href']; ?>"><span data-hover="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></span></a>
          <?php } ?>


        <?php } else { ?>

          <?php for ($i = 0; $i < count($categories);) { ?>

          <?php $j = $i + ceil(count($categories) / 4); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($categories[$i])) { ?>
           <a href="<?php echo $categories[$i]['href']; ?>"><span data-hover="<?php echo $categories[$i]['name']; ?>"><?php echo $categories[$i]['name']; ?></span></a>
          <?php } ?>
          <?php } ?>

        <?php } ?>
        <?php } ?>
              </nav>
          </section>
      </div>
      <?php } ?>

  <?php if ($products) { ?>

    <!-- pager block -->
    <!--
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
                <label> <span class="hidden-tablet">View as:</span></label>
                <a href="#" class="icon-th view-grid"></a><a href="#" class="icon-th-list view-list"></a>
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
            <a href="<?php echo $compare; ?>" id="compare-total"><?php //echo $text_compare; ?></a>
        </div>
      -->
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


  <?php } ?>

  <?php if (!$categories && !$products) { ?>

<div class="content">
      <?php echo $text_empty; ?>
  </div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>

  <?php echo $content_bottom; ?>

</div>

<?php if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) {
        echo $column_left;
        echo $column_right;
}
?>

</div>



<?php echo $footer; ?>