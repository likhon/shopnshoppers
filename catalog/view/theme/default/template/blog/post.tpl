<?php echo $header; ?>
<div class="blog_layout">
    <?php echo $content_top; ?>
</div>

<script type="text/javascript">
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
po.src = 'https://apis.google.com/js/plusone.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
</script>
<div class="page_blog_post">

    <?php if (isset($success)) { ?>
        <div class="success"><?php echo $success; ?></div>
    <?php } ?>
    <?php if (!empty($column_left)) : ?>
            <?php echo $column_left; ?>
    <?php endif; ?>
    <div id="content" class="<?php echo ((!empty($column_right) || !empty($column_left)) ? (!empty($column_right) && !empty($column_left)) ? 'span6' : 'span9' : 'span12' ); ?> page_blog_post">
        <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
        </div>
        <?php if ($post) { ?>
            <div class="clearfix">
                <div class="post-preview">
                    <h3><?php echo $post['title'];?></h3>

                    <div class="image">
                        <?php if ($thumb) { ?>
                            <div class="image image-detail">
                                <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a>
                            </div>
                        <?php } ?>
                        <?php if ($thumb || $images) { ?>
                            <?php if ($images) { ?>
                                <div class="image-additional">
                                    <?php foreach ($images as $image) { ?>
                                        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox">
                                            <img class="product-retina" src="<?php echo $image['thumb']; ?>" data-image2x="<?php echo $image['thumb2x']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>
                                    <?php } ?>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                    <div class="storycontent b-description">
                            <div class="post-meta">
                                <span class="meta-date"><i class="icon-clock-alt"></i><?php echo date('F j, Y',strtotime($post['posted_date']));?></span>
                                <?php if ($post['poster_name']): ?><span class="meta-author"><i class="icon-user-2"></i><?=$post['poster_name']?></span><?php endif; ?>
                            </div>
                            <?php echo html_entity_decode($post['description']);?>
                        <?php if(strlen(trim($post['tags']))){ ?>
                        <div class="post_related_tags post-tags">

                            <i class="icon-tag-1">&nbsp;</i>

                            <?php
						$tag_arr = explode(',', $post['tags']);
						$tag_links = array();
						foreach($tag_arr as $itag){
							$itag = trim($itag);
							$tag_links[] = '<a href="/index.php?route=blog/post&filter_tag='.$itag.'">'.$itag.'</a>';
                            }
                            echo implode(', ', $tag_links);
                            ?>
                        </div>
                        <?php }	?>

                    </div>
                    <?php
    function curPageURL() {
     $pageURL = 'http';
     if (isset($_SERVER["HTTPS"]) && $_SERVER["HTTPS"] == "on") {$pageURL .= "s";}
     $pageURL .= "://";
     if ($_SERVER["SERVER_PORT"] != "80") {
      $pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
     } else {
      $pageURL .= $_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
     }
     return $pageURL;
    }
    ?>
                    <div class="post-tags">
                        <ul id="socialbuttonnav">
                            <li><!-- Facebook like--><iframe src="http://www.facebook.com/plugins/like.php?href=<?=urlencode(curPageURL());?>&amp;send=false&amp;layout=button_count&amp;width=450&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21&amp;appId=220231561331594" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:450px; height:21px;" allowTransparency="true"></iframe></li>
                            <li style="line-height:1px"><!-- Google plus one--><div class="g-plusone" data-size="tall" data-annotation="inline" data-width="120"></div></li>
                            <li><!-- Twitter--><a name="twitter_share" data-count="horizontal" href="http://twitter.com/share" class="twitter-share-button" >Tweet</a></li>

                            <li><!-- Buffer--><a href="http://bufferapp.com/add" class="buffer-add-button" data-count="horizontal" >Buffer</a>
                                <script type="text/javascript" src="http://static.bufferapp.com/js/button.js"></script>
                            </li>
                            <!--
                            <li>
                            <div><script src="//platform.linkedin.com/in.js" type="text/javascript">lang: en_US</script><script type="IN/Share" data-counter="right"></script></div>
                            </li>
                            -->
                            <li><!-- stumbleupon--><div><script src="http://www.stumbleupon.com/hostedbadge.php?s=1"></script></div></li>
                            <li class="pininterest_blog_button"><!-- Pinterest like--><span class="pinwidget"><a class="" href="//www.pinterest.com/pin/create/button/" data-pin-do="buttonBookmark">&nbsp;</a></span></li>

                        </ul>
                    </div>
                </div>

                <div class="line"></div>
                <div id="comments"></div>


                <h3 class="comment-title" id="content-title">Add comment</h3>

                <?php if ($comment_status) { ?>
                      <div id="tab-review" class="tab-content" style="border:1px solid #DDDDDD;">
                        <b><?php echo $entry_name; ?></b><br />
                        <input type="text" name="name" value="" />
                        <br />
                        <b><?php echo $entry_email; ?></b><br />
                        <input type="text" name="email" value="" />
                        <br />
                        <b><?php echo $entry_comment; ?></b>
                        <textarea name="comment" cols="40" rows="8" style="width: 98%;"></textarea>
                        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
                        <br />
                        <b><?php echo $entry_captcha; ?></b><br />
                        <input type="text" name="captcha" value="" />
                        <br />
                        <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
                        <br />
                        <div class="buttons">
                          <div class="right"><a id="button-comment" class="button"><?php echo $button_continue; ?></a></div>
                        </div>
                      </div>
                <?php } ?>

            </div>
        <?php } ?>
        <?php if ( !$post) { ?>
            <div><?php  echo $text_empty; ?></div>
            <div class="buttons">
                <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
            </div>
        <?php } ?>
        <?php echo $content_bottom; ?>
    </div>
    <?php if (!empty($column_right)):  echo $column_right;  endif; ?>
</div>

<script type="text/javascript"><!--
$('#comments .pagination a').live('click', function() {
	$('#comments').slideUp('slow');
		
	$('#comments').load(this.href);
	
	$('#comments').slideDown('slow');
	
	return false;
});			

$('#comments').load('index.php?route=blog/comment&blog_post_id=<?php echo $blog_post_id; ?>');

$('#button-comment').bind('click', function() {
	$.ajax({
		url: 'index.php?route=blog/comment/write&blog_post_id=<?php echo $blog_post_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&email=' + encodeURIComponent($('input[name=\'email\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'comment\']').val()) + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-comment').attr('disabled', true);
			$('#content-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-comment').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#content-title').after('<div class="warning">' + data.error + '</div>');
			}
			
			if (data.success) {
				$('#content-title').after('<div class="success">' + data.success + '</div>');
				
				/* Comment Form Reseting */
				$('input[name=\'name\']').val('');
				$('input[name=\'email\']').val('');
				$('textarea[name=\'comment\']').val('');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		overlayClose: true,
		opacity: 0.5,
		rel: "colorbox"
	});
});
//--></script> 
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
<script src="http://platform.linkedin.com/in.js" type="text/javascript"></script>
<script type="text/javascript" async src="//assets.pinterest.com/js/pinit.js"></script>
<?php echo $footer; ?>