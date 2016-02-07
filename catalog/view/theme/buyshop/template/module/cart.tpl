<?php
$text_items_full = explode(" ",$text_items);;
$text_items_number = $text_items_full[0];
?>

<div id="cart">
    <div class="heading">
      <span class="pull-right">
          <a class="btn">
              <i class="icon-cart icon-medstore-cart icon-large"></i>
          </a>
      </span>
          <span class="badge" id="cart-total">
             <?php echo $text_items_number; ?>
          </span>

    </div>
    <div class="content shopping_cart_mini">
        <div class="cart-close"><i class="flaticon-close15"></i></div>

        <div class="inner-wrapper">
            <?php if ($products || $vouchers) { ?>
            <div class="mini-cart-info">
                <div class="added_items"><?php echo (count($products) <= 3 ? '' : 'Last 3 added items from '.count($products)) ; ?></div>

                <div>

                    <?php $i = 0;
              $products1 = array_reverse($products);
                ?>
                    <?php foreach ($products1 as $product) : ?>
                    <?php $i ++; ?>
                    <?php if ($i<4): ?>

                    <div class="item">
                    <?php if ($product['thumb']) { ?>
                        <?php
                        $thumb2x = str_replace($this->config->get('config_url').'image/cache/', "", $product['thumb']);
                        $thumb2x = substr($thumb2x,0,strrpos($thumb2x, '-')).'.'.preg_replace("/.*?\./", '', $product['thumb']);
                        $thumb2x = $this->model_tool_image->resize($thumb2x, $this->config->get('config_image_cart_width')*2, $this->config->get('config_image_cart_height')*2);
                        ?>
                        <a class="product-image" href="<?php echo $product['href']; ?>">
                            <img class="product-retina" src="<?php echo $product['thumb']; ?>" data-image2x="<?php echo $thumb2x; ?>"  alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
                        </a>
                    <?php } ?>

                    <div class="product-detailes">
                        <a class="product-name" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <div>
                            <?php foreach ($product['option'] as $option) { ?>
                            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                            <?php } ?>
                        </div>
                        <div class="product-price">
                            <?php echo $product['quantity']; ?>x&nbsp;<?php echo $product['total']; ?>
                        </div>
                    </div>

                    <div class="alignright">
                        <a href="<?php echo $product['href']; ?>"><i class="icon-edit-1"></i></a>
                        <a onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#header #cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#spy #cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');">
                            <i class="icon-trash-3"></i>
                        </a>
                    </div>
                </div>

                    <?php endif; ?>

                    <?php endforeach; ?>


                    <?php foreach ($vouchers as $voucher) { ?>
                <div>
                    <div class="product-image"></div>
                    <div class="product-name"><?php echo $voucher['description']; ?></div>
                    <div class="quantity">x&nbsp;1</div>
                    <div class="total"><?php echo $voucher['amount']; ?></div>
                    <a onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#header #cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#spy #cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');">
                        <i class="icon-trash-3"></i>
                    </a>
                </div>
                <?php } ?>


                <!-- taxes and discounts -->
                <table>
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="right"><?php echo $total['title']; ?>:</td>
                        <td class="right"><b><?php echo $total['text']; ?></b></td>
                    </tr>
                    <?php } ?>
                </table>
                <!-- taxes and discounts -->
                <div class="wrapper">
                    <a href="<?php echo $cart; ?>" class="button"><?php echo $text_cart; ?></a>
                    <a href="<?php echo $checkout; ?>" class="button"><?php echo $text_checkout; ?></a>
                </div>

            </div>
            </div>
            <?php } else { ?>
            <div class="empty"><?php echo $text_empty; ?></div>
            <?php } ?>
        </div>
    </div>
</div>

