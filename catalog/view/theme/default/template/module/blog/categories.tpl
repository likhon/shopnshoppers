<div class="block">
        <div class="block-title"><strong><span><?php echo $heading_title;?></span></strong></div>
        <div class="block-content blog-categories-content">
            <ul class="categories box-category blog-categories">
                <?php $i=1; foreach ($categories as $category) { ?>
                <li class="blog-post " <?php if(!$category['img']){ ?>style="text-align:left;"<?php }?>>
                <a href="<?php echo $category['href']; ?>" class="<?=($category['category_id'] == $category_id)?'active':''; ?>">
                    <?php if($category['img']){ ?>
                    <img src="<?=$category['img']?>" alt="cat-image" />
                    <?php } ?>
                    <span><?php echo $category['name']; ?></span>
                </a>
                <?php if($category['desc']){ ?><?=$category['desc'];?><?php } ?>
                <?php if ($category['children']) { ?>
                <ul>
                    <?php foreach ($category['children'] as $child) { ?>
                    <li <?php if(!$child['img']){ ?>style="text-align:left;border-top: 1px solid #EEEEEE;"<?php }?>>
                    <a href="<?php echo $child['href']; ?>" class="<?=($child['category_id'] == $child_id)?'active':''; ?>">
                        <?php if($child['img']){ ?>
                        <img src="<?=$child['img']?>" alt="cat-image" align="left" />
                        <?php } ?>
                        <span><?php echo $child['name']; ?></span>
                    </a>
                    <?php if($category['desc']){ ?><?=$category['desc'];?><?php } ?>
                    </li>
                    <?php } ?>
                </ul>
                <?php } ?>
                </li>


                <?php } ?>
            </ul>
        </div>
</div>