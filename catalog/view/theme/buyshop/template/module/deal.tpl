<div class="block block_listing">
    <div class="block-title"><strong><span><?php echo $heading_title; ?></span></strong></div>
    <div class="block-content">
        <div class="flexslider vertical product-small-slider">
            <ul class="slides">
                <?php foreach ($products as $product) : ?>
                  <li class="product-small">
                      <?php if ($product['thumb']) : ?>
                        <div class="product-small-image"><a href="<?php echo $product['href']; ?>"><img class="product-retina img-responsive" src="<?php echo $product['thumb']; ?>" data-image2x="<?php echo $product['thumb2x']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
                      <?php endif; ?>
                      <div class="product-small-info">
                          <div class="name product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                          <?php if ($product['price']) { ?>
                          <div class="price product-price">
                              <?php if (!$product['special']) { ?>
                              <?php echo $product['price']; ?>
                              <?php } else { ?>
                              <span class="price-old old"><?php echo $product['price']; ?></span>
                              <span class="price-new new"><?php echo $product['special']; ?></span>
                              <?php } ?>
                          </div>
                          <?php } ?>
                      </div>

                  </li>
                  <?php endforeach; ?>
            </ul>
        </div>
    </div>

</div>
<script type="text/javascript">
    $('.product-small-carousel ul').jcarousel({
        vertical: true,
        scroll: <?php echo $limit; ?>
    });
</script>
