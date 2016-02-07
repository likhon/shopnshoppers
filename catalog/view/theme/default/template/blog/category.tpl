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
      <h1><?php echo $heading_title; ?>: <?php echo $category_info['name']?></h1>
      <div class="blog-filter posts-page">
          <?php if (isset($posts)) { ?>
          <div class="product-filter">
		<div class="display">
			<form method="get" action="/index.php"> 
			<input name="route" type="hidden" value="blog/post/category" />
			<input name="path" type="hidden" value="<?=$path;?>" />
			<input name="filter_title" type="text" value="<?=$filter_title?>" placeholder="enter search text..." />
			<input class="button" type="submit" value="Search" />
			<a href="/index.php?route=blog/post/category&path=<?=$path;?>">Clear</a>
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
          <div>
            <?php
                foreach ($posts as $key=>$post) {
            ?>
                <div class="post-preview">
                    <h3><a href="<?php echo $post['href'];?>" rel="bookmark"><?php echo $post['title'];?></a></h3>
                    <div class="image">
                        <?php if($post["first_image"]) { ?>
                        <img class="img-responsive img-rounded" data-image2x="<?php echo $post["first_image2x"]; ?>" src="<?php echo $post["first_image"]; ?>" alt="post image blog_posts" />
                        <?php } elseif($post['thumb']){ ?>
                        <div class="image">
                            <img alt="post image blog_posts" src="<?php echo $post['thumb'];?>" class="img-responsive img-rounded" />
                        </div>
                        <?php } ?>
                    </div>
                    <div class="post-meta">
                            <span class="meta-date"><i class="icon-clock-alt"></i><?php echo $post['posted_date'];?></span>
                            <span class="meta-author"><i class="icon-user-2"></i><?=$post['author_name']?></span>
                        </div>
                        <p><?php echo $post['short_description'];?>...</p>
                        <p><a class="button" href="<?php echo $post['href'];?>">More Info</a></p>
                </div>
              <div class="line"></div>


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
      <?php echo $content_bottom; ?>
    </div>
    <?php if (!empty($column_right)):  echo $column_right;  endif; ?>
</div>
<?php echo $footer; ?>