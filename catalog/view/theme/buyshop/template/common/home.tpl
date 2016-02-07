<?php
$theme_options = $this->config->get('bs_general');
$theme_skin = $this->config->get('bs_theme');
?>

<?php echo $header; ?>
<?php echo $content_top; ?>
    <section id="content">
        <h1 style="display: none;"><?php echo $heading_title; ?></h1>
        <h2 style="display: none;">main page</h2>

        <div class="container top">
            <div class="row">

<?php
if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_lifestore'):
if (empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable' ) :
     echo $column_left;
endif;
endif;
?>

                <div class="<?php echo ((empty($theme_options["sidebar"]) || $theme_options["sidebar"] !== 'disable') && (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_lifestore') ? 'span9' : 'span12'); ?>" id="column_right">
                    <div class="row7">
                        <?php if (isset($column_right_filter)) {echo $column_right_filter;} ?>
                        <div class="row">
                            <?php echo $column_right; ?>
                        </div>
                    </div>
                </div>






            </div>
        </div>
        <?php echo $content_bottom; ?>
    </section>
<?php echo $footer; ?>