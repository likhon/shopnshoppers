<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="compare_page">
    <?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="overflow_auto">
    <table class="compare-info">
    <thead>
      <tr>
        <td class="compare-product" colspan="<?php echo count($products) + 1; ?>"><?php echo $text_product; ?></td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><?php echo $text_name; ?></td>
        <?php foreach ($products as $product) { ?>
        <td class="name"><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_image; ?></td>
        <?php foreach ($products as $product) { ?>
        <td>
            <div class="compare_image">
                <?php if ($products[$product['product_id']]['thumb']) { ?>
                <?php
                $thumb = $products[$product['product_id']]['thumb'];
                $thumb2x = str_replace($this->config->get('config_url').'image/cache/', "", $thumb);
                $thumb2x = substr($thumb2x,0,strrpos($thumb2x, '-')).'.'.preg_replace("/.*?\./", '', $thumb);
                $thumb2x = $this->model_tool_image->resize($thumb2x, $this->config->get('config_image_compare_width')*2, $this->config->get('config_image_compare_height')*2);
                ?>
                <img class="product-retina" src="<?php echo $products[$product['product_id']]['thumb']; ?>" data-image2x="<?php echo $thumb2x; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>" />
                <?php } ?>

            </div>
        </td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_price; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php if ($products[$product['product_id']]['price']) { ?>
          <?php if (!$products[$product['product_id']]['special']) { ?>
          <?php echo '<span class="price-regular">'.$products[$product['product_id']]['price'].'</span>'; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span> <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
          <?php } ?>
          <?php } ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_model; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['model']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_manufacturer; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_availability; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['availability']; ?></td>
        <?php } ?>
      </tr>
	  <?php if ($review_status) { ?>
      <tr>
        <td><?php echo $text_rating; ?></td>
        <?php foreach ($products as $product) { ?>
        <td>
            <div class="rating">

                <?php
                if ($product['rating'] > 0) {
                echo '<strong>';
                for ($i = 1; $i <= $product['rating']; $i++) {
                echo '<i class="icon-star"></i>';
                }
                echo '</strong>';
                $k =  5 - $product['rating'];
                for ($j = 1; $j <= $k; $j ++) {
                echo '<i class="icon-star"></i>';
                }
                } else {
                for ($i = 1; $i <= 5; $i++) {
                echo '<a><i class="icon-star"></i></a>';
                }
                }
                ?>
            </div>

          <?php echo $products[$product['product_id']]['reviews']; ?></td>
        <?php } ?>
      </tr>
      <?php } ?>
	  <tr>
        <td><?php echo $text_summary; ?></td>
        <?php foreach ($products as $product) { ?>
            <td class="description"><?php  echo $products[$product['product_id']]['description']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_weight; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['weight']; ?></td>
        <?php } ?>
      </tr>
      <tr>
        <td><?php echo $text_dimension; ?></td>
        <?php foreach ($products as $product) { ?>
        <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
        <?php } ?>
      </tr>
    </tbody>
    <?php foreach ($attribute_groups as $attribute_group) { ?>
    <thead>
      <tr>
        <td class="compare-attribute" colspan="<?php echo count($products) + 1; ?>"><?php echo $attribute_group['name']; ?></td>
      </tr>
    </thead>
    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
    <tbody>
      <tr>
        <td><?php echo $attribute['name']; ?></td>
        <?php foreach ($products as $product) { ?>
        <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
        <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
        <?php } else { ?>
        <td></td>
        <?php } ?>
        <?php } ?>
      </tr>
    </tbody>
    <?php } ?>
    <?php } ?>
    <tr>
      <td></td>
      <?php foreach ($products as $product) { ?>
      <td><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></td>
      <?php } ?>
    </tr>
    <tr>
      <td></td>
      <?php foreach ($products as $product) { ?>
      <td class="remove"><a href="<?php echo $product['remove']; ?>" class="button"><?php echo $button_remove; ?></a></td>
      <?php } ?>
    </tr>
  </table>
  </div>
    <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>