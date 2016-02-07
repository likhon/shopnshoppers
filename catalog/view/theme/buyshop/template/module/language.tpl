<?php if (count($languages) > 1) : ?>
<?php $theme_options = $this->config->get('bs_general'); ?>

<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_medstore') { ?>
<div class="fadelink fadelink-language">
<a><i class="icon icon-medstore-speech"></i><?php echo $this->session->data['language']; ?><span class="caret"></span></a>
<div class="ul_wrapper">
    <div class="ul_substitute">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <?php foreach ($languages as $language) { ?>
            <div class="li_substitute">
                <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().submit();">
                    <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                    <?php echo $language['name']; ?>
                </a>
            </div>
            <?php } ?>
            <input type="hidden" name="language_code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
    </div>

</div>
</div>

<?php } else { ?>
<span class="link_label label_language"><?php echo $text_language; ?>:</span>
<div class="fadelink language_block">
    <a><?php echo $this->session->data['language']; ?></a>
    <div class="ul_wrapper">
        <div class="ul_substitute">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <?php foreach ($languages as $language) { ?>
                <div class="li_substitute">
                    <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().submit();">
                        <img src="image/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" />
                        <?php echo $language['name']; ?>
                    </a>
                </div>
                <?php } ?>
                <input type="hidden" name="language_code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </form>
        </div>

    </div>

</div>
<?php }  ?>
<?php endif; ?>
