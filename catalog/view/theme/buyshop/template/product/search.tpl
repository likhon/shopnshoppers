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

<div class="page_category">
<div id="content" class="shop <?php echo ((empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) ? 'span9' : 'span12 float_none');  ?> rollover_none">

  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <!--<h1><?php echo $heading_title; ?></h1> -->
    <!--<b><?php echo $text_critea; ?></b> -->
    <div class="content search_categories">

        <div class="col-md-9" style="float: left">
            <div class="col-md-12">
                <?php if ($search) { ?>
                <input type="text" name="search" value="<?php echo $search; ?>" placeholder="Search keyword" />
                <?php } else { ?>
                <input type="text" name="search" value="<?php echo $search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
                <?php } ?>

                <select name="category_id" id="category_id" data-placeholder="Your Favorite Football Team" class="chosen-select" tabindex="5">
                    <option value="0"><?php echo $text_category; ?></option>
                    <?php foreach ($categories as $category_1) { ?>
                    <?php if ($category_1['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_1['children'] as $category_2) { ?>
                    <?php if ($category_2['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                    <?php } ?>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <?php if ($category_3['category_id'] == $category_id) { ?>
                    <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                    <?php } ?>
                </select>

        </div>
            <div class="col-md-12">

                <?php if ($sub_category) { ?>
                <input type="checkbox" name="sub_category" value="1" id="sub_category" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="sub_category" value="1" id="sub_category" />
                <?php } ?>
                <label for="sub_category"><?php echo $text_sub_category; ?></label>

                <?php if ($description) { ?>
                <input type="checkbox" name="description" value="1" id="description" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="description" value="1" id="description" />
                <?php } ?>
                <label for="description"><?php echo $entry_description; ?></label>
            </div>
        </div>
        <div class="col-md-2" style="text-align: right">
            <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" />
        </div>
    </div>

    <!--<h2><?php echo $text_search; ?></h2>-->
    <?php if ($products) { ?>

      <!-- pager block -->

    <div class="line1"></div>
    <div class="pagination listing_header_row2"><?php //echo $pagination; ?></div>
    <!-- end pager block -->


    <!--changed listings-->
    <div class="product-listing product-grid">
        <div class="row <?php echo ((!empty($theme_products["product_image_size"]) && $theme_products["product_image_size"] == 'small' ) ? 'small' : 'big'); ?>_<?php echo ((empty($theme_products["product_listing"]) || $theme_products["product_listing"] !== 'simple' ) ? 'with' : 'without'); ?>_description <?php echo ((!empty($theme_products["product_catalog_mode"]) && $theme_products["product_catalog_mode"] == 'enable' ) ? 'catalog_mode' : 'usual_mode');  ?> isotope-outer">
        <?php include('catalog/view/theme/listing_view.php'); ?>
    </div>
</div>
<!--changed listings-->






<?php } else { ?>
  <div class="content no-item-found"><?php echo $text_empty; ?></div>
  <?php }?>
  <?php echo $content_bottom; ?>

</div>
<?php if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) {
        echo $column_left;
        echo $column_right;
}
?>
</div>
<script type="text/javascript"><!--
    var config = {
        '.chosen-select'           : {},
        '.chosen-select-deselect'  : {allow_single_deselect:true},
        '.chosen-select-no-single' : {disable_search_threshold:10},
        '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
        '.chosen-select-width'     : {width:"95%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }

$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').attr('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

//--></script>
<?php echo $footer; ?>