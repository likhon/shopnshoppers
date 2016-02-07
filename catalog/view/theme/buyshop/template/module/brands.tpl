<div class="line delimeter_brands"></div>
<div class="container">
    <div class="line delimeter_brands_boxed"></div>
    <div class="row">
        <div class="span12">
            <br>
            <h3 class="padding brands_title"><?php echo $heading_title; ?></h3>
            <div class="brands_block" id="brands<?php echo $module; ?>">
                <ul class="jcarousel-skin-brands">
                    <?php foreach ($banners as $banner) { ?>
                    <li><a href="<?php echo $banner['link']; ?>"><img style="width:<?php echo $width; ?>px;height:<?php echo $height; ?>px " src="<?php echo $banner['image']; ?>" data-image2x="<?php echo $banner['image2x']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    // brands block
    var brands = $('#brands<?php echo $module; ?> ul');
    var brandsImg = $(".brands_block a img");

    brands.jcarousel({
        vertical: false,
        visible: <?php echo $limit; ?>,
        scroll: <?php echo $scroll; ?>,
        buttonNextHTML: '<a class="btn"><i class="icon-right-thin icon-large"></i></a>',
        buttonPrevHTML: '<a class="btn"><i class="icon-left-thin icon-large"></i></a>'
    });
    brandsImg.mouseover(function () {
        brandsImg.removeClass("brands_active").addClass("brands_n_active");
        $(this).removeClass("brands_n_active").addClass("brands_active");
    }).mouseout(function () {
                brandsImg.removeClass("brands_n_active").removeClass("brands_active");
            });

</script>
