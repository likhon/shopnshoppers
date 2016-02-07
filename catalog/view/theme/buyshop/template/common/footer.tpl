<?php
$theme_options = $this->config->get('bs_general');
$theme_colors = $this->config->get('bs_colors');
$theme_skin = $this->config->get('bs_theme');
$theme_skin["general_skin"] = 'light';
if(!empty($this->request->get['route']) && $this->request->get['route'] != 'common/home') {
?>
</div>
</div>

</section>

<?php } ?>





<div id="push"></div>

</div>
<!-- end wrap -->

<div id="footer">
    <div id="footer_line" class="<?php echo ((isset($theme_options["footerpopup_mode"]) && $theme_options["footerpopup_mode"] == 'normal') ? 'footer_line_normal_bg' : 'footer_line_slide_bg'); ?>">
        <?php if (empty($theme_options["footerpopup"]) || $theme_options["footerpopup"] !== 'disable' ) :  ?>
            <div <?php echo ((isset($theme_options["footerpopup_mode"]) && $theme_options["footerpopup_mode"] == 'normal') ? 'class="footer_popup_open"' : 'id="footer_popup" class="footer_bg allowHover"'); ?>>

                <div class="container">
                    <div class="row">
                        <div class="span6">
                            <div class="row">
                                <div class="span3">
                                    <?php if ($informations) { ?>
                                        <h3><?php echo $text_information; ?></h3>
                                        <?php foreach ($informations as $information) { ?>
                                            <p><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></p>
                                        <?php } ?>
                                    <?php } ?>
                                </div>
                                <div class="span3">
                                    <h3><?php echo $text_service; ?></h3>
                                    <p><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></p>
                                    <p><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></p>
                                    <p><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></p>
                                </div>
                            </div>
                        </div>
                        <div class="span6">
                            <div class="row">
                                <div class="span3">
                                    <h3><?php echo $text_account; ?></h3>
                                    <p><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></p>
                                    <p><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></p>
                                    <p><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></p>
                                    <p><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></p>
                                </div>
                                <div class="span3">
                                    <h3><?php echo $text_extra; ?></h3>
                                    <p><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></p>
                                    <p><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></p>
                                    <p><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></p>
                                    <p><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></p>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

             </div>
<!--
<div id="footer_button" class="<?php echo (($theme_skin["general_skin"] == 'dark') ? 'popup_button_dark' : 'popup_button_light'); ?> <?php echo ((isset($theme_options["footerpopup_mode"]) && $theme_options["footerpopup_mode"] == 'normal') ? 'popup_button_normal_mode' : 'popup_button_slide_mode'); ?>">
<i class="icon-up"></i>
</div>
-->
        <?php endif; ?>

        <div class="<?php echo ((isset($theme_options["footerpopup_mode"]) && $theme_options["footerpopup_mode"] == 'normal') ? 'footer_bottom_normal_mode' : 'footer_bottom_slide_mode'); ?> <?php echo(($theme_skin["general_skin"] == 'dark') ? 'footer_dark_skin_wrapper' : 'footer_light_skin_wrapper'); ?>">
            <div class="container" id="footer_bottom">
            <div class="row">
                <div class="span12">
                    <div class="pull-left noHover">


                    <?php
                        if (!isset($theme_options["footerpayment_status"]) || $theme_options["footerpayment_status"] !== 'disable' ) {
                    ?>
                        <span class="hidden-phone payment_icons">


                        <?php
                             if ($theme_options["footerpayment"] !== '') {
                                    $footerpayment = html_entity_decode($theme_options["footerpayment"], ENT_QUOTES, 'UTF-8');
                                    echo $footerpayment;
                             }
                        ?>



                        </span>

                    <?php
                       }
                    ?>

                        <span class="text">
                            <?php
                                if (!empty($theme_options["footercopyright"]) && $theme_options["footercopyright"] !== '' ) {
                                    $footercopyright = html_entity_decode($theme_options["footercopyright"], ENT_QUOTES, 'UTF-8');
                                    echo $footercopyright;
                                } else {echo $powered;}
                            ?>
                        </span>
                    </div>
                    <?php
                         if (!isset($theme_options["socials_status"]) || $theme_options["socials_status"] !== 'disable' ) {
                    ?>
                    <div class="pull-right noHover footer_social_icons">

                        <?php
                             if ($theme_options["socials"] !== '') {
                                    $footersocials = html_entity_decode($theme_options["socials"], ENT_QUOTES, 'UTF-8');
                                    echo $footersocials;
                             }
                        ?>

                    </div>
                    <?php
                        }
                    ?>
                </div>
            </div>
        </div>
        </div>

    </div>
</div>

</body>
</html>