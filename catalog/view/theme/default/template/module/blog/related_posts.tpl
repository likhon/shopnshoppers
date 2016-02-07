<div class="box">
	<div class="box-heading"><?php echo $heading_title;?></div>
	<div class="box-content">
		<div id="col3_container" class="cf">  
		<?php $i=1; foreach ($posts as $post) { ?>
			<div class="blog-post <?=((($i!=1) && $i%(int)$blog_layout_cols != 1)?'col3_col':'')?> col3_span<?=$blog_layout_cols?>">
				<?php if($post['thumb']){ ?>
					<div class="author-avatar">
						<img alt="post image module_blog_related_posts" src="<?php echo $post['thumb'];?>" class="post-img" />
					</div>
				<?php } ?>
				<h2><a href="<?php echo $post['href'];?>" rel="bookmark" title=""><?php echo $post['title'];?></a></h2>
				<?php if ($post['author_name']) { ?>
				<cite>by <?php echo $post['author_name'];?></cite>
				<?php } ?>
				<?php if ($post['short_description']) { ?>
				<div class="entry">
					<p><?php echo $post['short_description'];?>... <span class="blog_date"> <?php echo $post['posted_date'];?></span></p>
				</div>
				<?php } ?>
			</div>
			<?php if($i++%(int)$blog_layout_cols == 0){ ?>
			</div><div id="col3_container" class="cf">  
			<?php } ?>
		<?php } ?>
		</div>
	</div>
</div>

