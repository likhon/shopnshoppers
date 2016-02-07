<?php if ($comments) { ?>
<h2 class="font2">Comments (<?=count($comments)?>)</h2>

<?php foreach ($comments as $comment) { ?>
        <div class="media comment">
            <div class="user_pic">
                <img alt="" src="image/data/custom_blocks_images/user_pic.jpg">
            </div>
                <div class="username"><?php echo $comment['author']; ?></div>
                <div class="date"><?php echo date('jS F, Y',$comment['date_added']);?></div>
                <div class="text"><?php echo $comment['text']; ?></div>
        </div>
	<?php } ?>

	<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
	<div class="no_comment"><h3 class="font2"><?php echo $text_no_comments; ?></h3></div>
<?php } ?>
