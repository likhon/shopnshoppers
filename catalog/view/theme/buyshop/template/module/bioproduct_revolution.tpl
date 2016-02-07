<?php $theme_options = $this->config->get('bs_general'); ?>


<section class="slider">
    <h2 style="display:none">Top Slider</h2>

    <div class="<?php echo (isset($slider_width_settings["revolution_width"]) && $slider_width_settings["revolution_width"] == 'boxed' ? 'container' : 'full_width_revolution'); ?>">

    <?php if (!isset($theme_options["layout_skin"]) || $theme_options["layout_skin"] == 'skin_creative') { ?>
        <div id="layerslider-container">
            <div id="layerslider" style="width: 1600px; height: 500px; margin: 0 auto;">
                <!-- Preloader -->
                <div id="preloader">
                    <div id="status">&nbsp;</div>
                </div>
                <!-- end Preloader -->
                <?php echo $message; ?>
            </div>
        </div>
    <?php } else { ?>
        <div class="tp-banner-container">
            <div class="tp-banner" >
                <?php echo $message; ?>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
    <?php }  ?>

    </div>
</section>





