<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>

    <div class="box">

        <div class="heading">
            <h1>Bioproduct Theme Product Options Module</h1>
            <div class="buttons">
                <a class="button" onclick="$('#form').submit();">Save</a>
                <a href="<?php echo $cancel; ?>" class="button">Cancel</a>
            </div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs">
                <a href="#tab-youtube" class="display_inline">YouTube links for products</a>
            </div>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">

                <div id="tab-youtube">
                    <div style="padding-left: 10px">
                        <span class="help">Enter full link to video, for example, //www.youtube.com/embed/HfBRJYyyIgE?autoplay=1.<br>
                    About parameters of YouTube video player you can see here: <a target="_blank" href="https://developers.google.com/youtube/player_parameters">YouTube player</a></span><br>
                        <span style="color:red;">NOTE! If you've entered some YouTube link you can't make field empty. So, to not see it enter symbol "-" in YouTube field</span>
                    </div>
                    <table class="form">
                        <!------------------------------------------------------------------------------------------------>
                        <?php if ($products) {
                            foreach ($products as $product) {
                            $id = $product['product_id'];

                        ?>
                            <tr>
                                <td class="left"><?php echo $product['name']; ?></td>
                                <td style="width:30%" class="left">
                                    <input type="hidden" name="product[<?php echo $id; ?>][product_id]" value="<?php echo $product['product_id']; ?>" />
                                    <input style="width:100%" type="text" name="product[<?php echo $id; ?>][product_video]" value="<?php echo (isset($product['product_video']) && $product['product_video'] !== '' ? $product['product_video'] : ''); ?>" />
									<!--
                                    <br>
									<textarea name="product[<?php echo $id; ?>][custom_html1]" ><?php echo (!empty($product['custom_html1']) ? $product['custom_html1'] : ''); ?></textarea>
									-->
                                </td>
                            </tr>
                        <?php
                            }
                         } else { ?>
                            <tr><td class="center" colspan="8"><?php echo $text_no_results; ?></td></tr>
                        <?php } ?>

                    </table>
                </div>

                <div class="clear_both"></div>
            </form>

            <div class="pagination"><?php echo $pagination; ?></div>

        </div>
    </div>
</div>


<script type="text/javascript"><!--
jQuery('#tabs a').tabs();
//--></script>

<?php echo $footer; ?>