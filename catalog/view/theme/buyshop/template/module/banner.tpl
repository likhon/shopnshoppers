<div style="margin-left: 0px;" class="<?php echo ((!empty($this->request->get['route']) && $this->request->get['route'] != 'common/home') ? 'banner_all_pages' : 'span3 banner_home_page'); ?>" id="banner<?php echo $module; ?>">
    <div class="banners_outer">
        <div class="flexslider banners">
            <ul class="slides">
                <?php foreach ($banners as $banner) : ?>
                    <li>
                        <?php if ($banner['link']) : ?>
                            <a href="<?php echo $banner['link']; ?>">
                        <?php endif; ?>
                                <img class="product-retina" src="<?php echo $banner['image']; ?>" data-image2x="<?php echo $banner['image2x']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
                        <?php if ($banner['link']) : ?>
                            </a>
                        <?php endif; ?>
                    </li>
                <?php endforeach; ?>
            </ul>
        </div>
    </div>
</div>
