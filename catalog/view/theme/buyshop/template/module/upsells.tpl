<?php if (isset($products_also_bought) && sizeof($products_also_bought) > 0) : ?>
<div class="upsells_products">
    <h2><?php echo $tab_also_bought_title; ?></h2>
    <div class="flexslider vertical">
        <ul class="slides">

            <?php for ($i = 1; $i < sizeof($products_also_bought); $i++) : ?>
                <li>
                    <a href="<?php echo $products_also_bought[$i]['href']; ?>">
                        <img data2x="<?php echo $products_also_bought[$i]['thumb2x']; ?>" src="<?php echo $products_also_bought[$i]['thumb']; ?>" title="<?php echo $products_also_bought[$i]['name']; ?>" alt="<?php echo $products_also_bought[$i]['name']; ?>" />
                    </a>
                </li>
            <?php endfor; ?>
        </ul>

    </div>

</div>
<?php endif;?>