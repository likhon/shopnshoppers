<?php if (count($currencies) > 1) : ?>
<?php $theme_options = $this->config->get('bs_general'); ?>

<?php if (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_medstore') { ?>
<div class="fadelink fadelink-currency">
<a><i class="icon icon-medstore-dollars"></i><?php echo $this->session->data['currency']; ?><span class="caret"></span></a>

    <div class="ul_wrapper">
        <div class="ul_substitute">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <?php foreach ($currencies as $currency) : ?>
                <?php if ($currency['symbol_left']) { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_left']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } else { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_right']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } ?>
                <?php endforeach; ?>
                <input type="hidden" name="currency_code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </form>

        </div>

    </div>
</div>
<?php } else { ?>
<span class="link_label label_currency"><?php echo $text_currency; ?>:</span>
<div class="fadelink currency_block">
    <a><?php echo $this->session->data['currency']; ?></a>
    <div class="ul_wrapper">
        <div class="ul_substitute">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <?php foreach ($currencies as $currency) : ?>
                <?php if ($currency['symbol_left']) { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_left']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } else { ?>
                <div class="li_substitute">
                    <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().submit();">(<?php echo $currency['symbol_right']; ?>)
                        &nbsp;<?php echo $currency['title']; ?>
                    </a>
                </div>
                <?php } ?>
                <?php endforeach; ?>
                <input type="hidden" name="currency_code" value="" />
                <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
            </form>

        </div>

    </div>

</div>

<?php }  ?>
<?php endif; ?>





