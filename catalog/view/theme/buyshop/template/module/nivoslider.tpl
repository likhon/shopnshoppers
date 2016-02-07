<div class="<?php echo (isset($slider_width_settings["nivo_width"]) && $slider_width_settings["nivo_width"] == 'boxed' ? 'container' : 'full_width_nivoslider'); ?>">
    <section class="slider">

    <div class="slideshow">
      <div id="slideshow<?php echo $module; ?>" class="nivoSlider">
        <?php foreach ($banners as $banner) { ?>
        <?php if ($banner['link']) { ?>
        <a href="<?php echo $banner['link']; ?>"><img src="<?php echo 'image/'.$banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
        <?php } else { ?>
        <img src="<?php echo 'image/'.$banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
        <?php } ?>
        <?php } ?>
      </div>
    </div>
        </section>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#slideshow<?php echo $module; ?>').nivoSlider({
        slices: 10,
        startSlide: 0,
        directionNav: true,
        controlNav: false,
        controlNavThumbs: false,
        prevText: '',
        nextText: '',

        effect: 'boxRainGrowReverse',
		animSpeed: 1000,
		pauseTime: 5300

	});
});
--></script>