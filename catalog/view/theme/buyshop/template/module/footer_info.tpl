<div class="line delimeter_brands"></div>

<div class="container">
    <div class="row">
        <br>

        <div class="footer_info_module">
            <div class="span3 footer_info_about_us"  style="width: 30%">
                <?php echo $title; ?>
                <?php echo $message; ?>
            </div>

            <?php if ($facebook_account != '') : ?>
            <div class="span3 footer_info_facebook"  style="width: 30%">
                <script type="text/javascript">
                    (function(d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/en_En/all.js#xfbml=1";
                        fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                </script>
                <h3 class="title"><?php echo $title_facebook; ?></h3>
                <div class="fb-like-box" data-href="https://www.facebook.com/<?php echo $facebook_account; ?>" data-height="265" data-show-faces="true" data-stream="false" data-show-border="false" data-header="false"></div>
            </div>
            <?php endif; ?>

            <?php if ($twitter_account != '') : ?>
            <div class="span3 footer_info_twitter">
                    <?php  $twitter_link_color = '#000'; ?>
                    <script type="text/javascript">
                        !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
                    </script>
                    <h3 class="title"><?php echo $title_twitter; ?></h3>
                    <a class="twitter-timeline" data-widget-id="375593032344563712"
                       height="200"
                       data-dnt="true"
                       data-theme="light"
                       data-link-color="#000"
                       data-screen-name="<?php echo $twitter_account; ?>"
                       data-aria-polite="assertive"
                       data-chrome="noheader nofooter noborders noscrollbar transparent">
                        &nbsp;
                    </a>
                </div>
            <?php endif; ?>

            <div class="span3 footer_info_contacts"  style="width: 30%">
                <?php echo $title1; ?>
                <?php echo $message1; ?>
            </div>


        </div>
    </div>
</div>
