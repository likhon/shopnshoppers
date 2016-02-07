<?php $flexslider_settings = $this->config->get('bs_flexslider'); ?>


<script type="text/javascript"><!--
  jQuery(document).ready(function() {
        jQuery('.flexslider.big').flexslider({
              <?php if (!empty($flexslider_settings["flexslider_nav"])) { ?>
                  directionNav: <?php echo $flexslider_settings["flexslider_nav"]; ?>,
              <?php } ?>
              <?php if (!empty($flexslider_settings["flexslider_direction"])) { ?>
                    direction: "<?php echo $flexslider_settings["flexslider_direction"]; ?>",
              <?php } ?>
              <?php if (!empty($flexslider_settings["flexslider_animationspeed"])) { ?>
                  animationSpeed: <?php echo $flexslider_settings["flexslider_animationspeed"]; ?>,
              <?php } ?>
              <?php if (!empty($flexslider_settings["flexslider_slideshowspeed"])) { ?>
                  slideshowSpeed: <?php echo $flexslider_settings["flexslider_slideshowspeed"]; ?>,
              <?php } ?>
              <?php if (!empty($flexslider_settings["flexslider_control"])) { ?>
                  controlNav: <?php echo $flexslider_settings["flexslider_control"]; ?>,
              <?php } ?>
              <?php if (!empty($flexslider_settings["flexslider_animation"])) { ?>
                  animation: "<?php echo $flexslider_settings["flexslider_animation"]; ?>",
              <?php } ?>

              prevText: "prev btn rounded flaticon-arrow270 icon-2x",
              nextText: "next btn rounded flaticon-arrow367 icon-2x"

        });

        jQuery(".flexslider.big .flex-direction-nav .flex-prev").hover(function() {
            jQuery(".prev-slider").fadeToggle(200, "linear");
        });
        jQuery(".flexslider.big .flex-direction-nav .flex-next").hover(function() {
            jQuery(".next-slider").fadeToggle(200, "linear");
        });


  });

  if ($.browser.msie && ($.browser.version == 7 || $.browser.version == 8)) {
    jQuery(window).load(function() {
        TopSlider();
    });
    } else {
       jQuery(document).ready(function() {
      TopSlider();
      });
    }



  jQuery(window).resize(function() {
      TopSlider();
  });

  function TopSlider() {
        var w0 = jQuery(document).width();
        var w1 = (w0 - jQuery(".container").width()) * 0.5 - 25;

          if(w0 > 1500) {
              w1 = (w0 - jQuery(".container").width()) * 0.5 - 125;
        }

      if(w0 > 1900) {
          w1 = (w0 - jQuery(".container").width()) * 0.5 - 225;
      }


      jQuery(".flexslider.big .flex-direction-nav .flex-next").css({
          "right": w1 + "px"
      });
        jQuery(".flexslider.big .flex-direction-nav .flex-prev").css({
            "left": w1 + "px"
        });

        jQuery(".flexslider.big .next-slider").css({
            "right": w1 + "px"
        });
        jQuery(".flexslider.big .prev-slider").css({
            "left": w1 + "px"
        });

  }


--></script>

<div class="<?php echo (isset($slider_width_settings["flexslider_width"]) && $slider_width_settings["flexslider_width"] == 'boxed' ? 'container' : 'full_width_flexslider'); ?>">
    <section class="slider">
        <div class="flexslider big">

            <ul class="slides">
                <?php foreach ($banners as $banner) { ?>

                <li style="position: relative;">

                    <?php if ($banner['link']) { ?>
                    <a href="<?php echo $banner['link']; ?>">
                        <img data-retina="true" width="1600" height="497" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                    </a>
                    <?php } else { ?>
                        <img data-retina="true" width="1600" height="497" src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                    <?php } ?>

                </li>
                <?php } ?>

            </ul>


        </div>
    </section>
</div>