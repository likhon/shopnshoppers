<?php echo $header; ?>
<div class="blog_layout">
    <?php echo $content_top; ?>
</div>
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
      <h1><?php //echo $heading_title; ?>Archives: <?php echo isset($month)?$month.', ':'';?> <?php echo $year;?></h1>
      <div class="content">
          <?php if (isset($posts)) { ?>
          <div class="product-filter">
		<div class="display">
			<form method="get" action=""> 
			<input name="route" type="hidden" value="blog/post/archieve" />
			<input name="apath" type="hidden" value="<?=$apath?>" />
			<input name="filter_title" type="text" value="<?=$filter_title?>" placeholder="enter search text..." />
			<input type="submit" value="Search" />
			<a href="/index.php?route=blog/post/archieve&apath=<?=$apath?>">Clear</a>
			</form>
		</div>
            <div class="limit"><b><?php echo $text_limit; ?></b>
              <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="sort"><b><?php echo $text_sort; ?></b>
              <select onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>

            <div id="col3_container" class="cf">
            <?php
            $i = 1;
            foreach ($posts as $key=>$post) {
            ?>
                <div class="blog-post <?=((($i!=1) && $i%(int)$blog_layout_cols != 1)?'col3_col':'')?> col3_span<?=$blog_layout_cols?>">
                    <?php if($post['thumb']){ ?>
                        <div class="author-avatar">
                            <img alt="post image" src="<?php echo $post['thumb'];?>" class="post-img" height="65" width="65" />
                        </div>
                    <?php } ?>

                    <h2><a href="<?php echo $post['href'];?>" rel="bookmark" title=""><?php echo $post['title'];?></a></h2>
                    <cite>by <?php echo $post['author_name'];?></cite>
                    <div class="entry">
                        <p><?php echo $post['short_description'];?>... <span class="blog_date"> <?php echo $post['posted_date'];?></span></p>
                    </div>
                </div>

                <?php if($i++%(int)$blog_layout_cols == 0){ ?>
                </div><div id="col3_container" class="cf">
                <?php } ?>
            <?php } ?>
            </div>
          <div class="pagination"><?php echo $pagination; ?></div>
          <?php } ?>
          <?php if (!isset($posts)) { ?>
          <div class="content"><?php echo $text_empty; ?></div>
          <div class="buttons">
            <div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
          </div>
          <?php } ?>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php if (!empty($column_right)):  echo $column_right;  endif; ?>

</div>
<?php echo $footer; ?>