<div class="container">
    <div class="blog-categories-content blog_module">

        <?php $theme_options = $this->config->get('bs_general');        ?>

        <h3 class="padding"><?php echo $heading_title; ?></h3>
        <div class="carousel es-carousel-wrapper style2 from-blog">
            <div class="es-carousel">
                <div class="row">
                    <div class="carousel_items">


                        <?php $i=1; foreach ($posts as $post) : ?>
                        <div class="span6 carousel_item">
                            <div class="row-fluid">

                                <?php if($post['thumb']): ?>
                                <div class="<?php echo (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic' ? 'span3' : 'span5'); ?>">
                                    <a href="<?php echo $post['href'];?>" rel="bookmark" title="">
                                        <img alt="post image module_blog_recent_posts product-retina" src="<?php echo $post['thumb'];?>" data-image2x="<?php echo $post['thumb2x']; ?>" class="animate pulse" />
                                    </a>
                                </div>
                                <?php endif; ?>


                                <div class="<?php echo ($post['thumb'] ? (isset($theme_options["layout_skin"]) && $theme_options["layout_skin"] == 'skin_cosmetic' ? 'span9' : 'span7') : 'span12'); ?>">
                                    <h4><a href="<?php echo $post['href'];?>" rel="bookmark" title=""><?php echo $post['title'];?></a></h4>
                                    <p class="post-meta">
                                        <?php echo $post['posted_date'];?>
                                        <?php if ($post['author_name']) { ?>
                                        <?php echo $post['author_name'];?>
                                        <?php } ?>

                                    </p>

                                    <?php if ($post['short_description']) { ?>
                                    <p><?php echo $post['short_description'];?>...</p>
                                    <?php } ?>
                                </div>

                            </div>
                        </div>


                        <?php endforeach; ?>




                    </div>
                </div>
            </div>
        </div>



    </div>
</div>
