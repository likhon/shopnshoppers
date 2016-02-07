<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?>
 <div class="wishlist_page">
<div id="content" class="span9">
    <?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($products) { ?>
  <div class="wishlist-info table shopping-cart-table">
    <table>
      <thead>
        <tr>
          <td class="image"><?php echo $column_image; ?></td>
          <td class="name"><?php echo $column_name; ?></td>
          <td class="model"><?php echo $column_model; ?></td>
          <td class="stock"><?php echo $column_stock; ?></td>
          <td class="price"><?php echo $column_price; ?></td>
          <td class="action"><?php echo $column_action; ?></td>
        </tr>
      </thead>
      <?php foreach ($products as $product) { ?>
      <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
        <tr>
          <td class="image"><?php if ($product['thumb']) { ?>
              <?php
                $thumb = $product['thumb'];
                $thumb2x = str_replace($this->config->get('config_url').'image/cache/', "", $thumb);
              $thumb2x = substr($thumb2x,0,strrpos($thumb2x, '-')).'.'.preg_replace("/.*?\./", '', $thumb);
              $thumb2x = $this->model_tool_image->resize($thumb2x, $this->config->get('config_image_wishlist_width')*2, $this->config->get('config_image_wishlist_height')*2);
              ?>

              <a href="<?php echo $product['href']; ?>"><img class="product-retina" src="<?php echo $product['thumb']; ?>"data-image2x="<?php echo $thumb2x; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name">
              <span class="cart-col-name"><?php echo $column_name; ?>:</span>
              <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          </td>
          <td class="model">
              <span class="cart-col-name"><?php echo $column_model; ?>:</span>
              <?php echo $product['model']; ?>
          </td>
          <td class="stock">
              <span class="cart-col-name"><?php echo $column_stock; ?>:</span>
              <?php echo $product['stock']; ?>
          </td>
          <td class="price"><?php if ($product['price']) { ?>
              <span class="cart-col-name"><?php echo $column_price; ?>:</span>

              <div class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <s class="old"><?php echo $product['price']; ?></s>
                  <b class="new"><?php echo $product['special']; ?></b>
              <?php } ?>
            </div>
            <?php } ?></td>
          <td class="action">
              <span class="cart-col-name"><?php echo $column_action; ?>:</span>
              <i class="icon-cart" onclick="addToCart('<?php echo $product['product_id']; ?>');"></i>
              <a href="<?php echo $product['remove']; ?>">
                  <i class="icon-trash-3"></i>
              </a>
          </td>
        </tr>
      </tbody>
      <?php } ?>
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
     <?php echo $column_right; ?>

 </div>
<?php echo $footer; ?>