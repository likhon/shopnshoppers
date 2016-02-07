<?php if ($categories) :

$products_module_exist = 0;
$extensions = $this->model_setting_extension->getExtensions('module');
for ($i = 1; $i < count($extensions); $i++) {
if ($extensions[$i]["code"] == 'theme_category_custom_block') {
$products_module_exist = 1;
}
}


?>



<div class="block_listing block_listing_category">
    <div class="block block-layered-nav">
        <div class="block-title"><strong><span><?php echo $heading_title; ?></span></strong></div>
        <div class="block-content">
            <div id="category_menu">
                <ul id="collapsed-menu">
                    <?php
              $nav_0 = 1;
              $nav_1 = 1;
              $nav_2 = 1;


              if (isset($this->request->get['path'])) {
                    $parts1 = explode('_', (string)$this->request->get['path']);
                    } else {
                    $parts1 = array();
                    }

                    if (isset($parts1[0])) {
                    $c = $parts1[0];
                    } else {
                    $c = 0;
                    }
              ?>
                    <!--level0-->
                    <?php foreach ($categories as $category) : ?>
                    <li class="level0 nav-<?php echo $nav_0; ?> <?php echo($nav_0 == 1 ? 'first' : ''); ?> <?php echo ($category['children'] ? 'parent' : 'child'); ?> <?php echo ($category['category_id'] == $c ? 'active7' : ''); ?>">
                        <label class="tree-toggler nav-header closed">
                            <!--category icon-->
                            <?php
                            if ($products_module_exist == 1) :


                            $k = $this->load->model('customisation/bioproduct_products_options');

                            if (isset($category["href"])) {
                            $parts = explode('=', (string)$category["href"]);
                            } else {
                            $parts = array();
                            }

                            $category_id = end($parts);
                            if (is_numeric($category_id)) {
                            $category_id = $category_id;
                            } else {
                            $parts = explode('/', (string)$category_id);
                            $query = $this->db->query("SELECT query as query FROM ".DB_PREFIX."url_alias WHERE keyword='".end($parts)."'");
                            $parts = explode('=', (string)$query->row['query']);
                            $category_id = end($parts);
                            }

                            $category_image_src = $this->model_customisation_bioproduct_products_options->getAttributeCategories('image_src',$category_id);

endif;

                            if (isset($category_image_src) && $category_image_src != '-') :
                            echo '<img class="category_icon" src="image/data/'.$category_image_src.'" alt="" />';
                            endif;

                            ?>

                            <!--end category icon-->

                            <a style="<?php echo (isset($category_image_src) && $category_image_src != '-' ? '' : 'margin:0'); ?>" href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>



                            <?php if ($category['children']) : ?><span class="collapse_button">+</span><?php endif; ?>
                        </label>
                        <?php if ($category['children']) : ?>
                        <ul class="nav nav-list tree">
                            <!--level1-->
                            <?php foreach ($category['children'] as $child) : ?>
                            <li class="level1 nav-<?php echo $nav_0; ?>-<?php echo $nav_1; ?> <?php echo($nav_1 == 1 ? 'first' : ''); ?> <?php echo ($child['sister_id'] ? 'parent' : 'child'); ?> <?php echo ($child['category_id'] == $child_id ? 'active7' : ''); ?>">
                                <label class="tree-toggler nav-header closed">
                                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                    <?php if($child['sister_id']) : ?><span class="collapse_button">+</span><?php endif; ?>
                                </label>

                                <?php if($child['sister_id']): ?>
                                <ul class="nav nav-list tree">
                                    <!--level2-->
                                    <?php foreach($child['sister_id'] as $sisters) : ?>
                                    <li class="level2 nav-<?php echo $nav_0; ?>-<?php echo $nav_1; ?>-<?php echo $nav_2; ?> <?php echo($nav_2 == 1 ? 'first' : ''); ?>">
                                        <label class="tree-toggler nav-header closed"><a href="<?php echo $sisters['href']; ?>"><?php echo $sisters['name']; ?></a></label>
                                    </li>
                                    <?php $nav_2 ++; ?>
                                    <?php endforeach; ?>
                                    <!--//level2-->
                                </ul>
                                <?php endif; ?>
                            </li>
                            <?php $nav_1 ++; ?>
                            <?php endforeach; ?>
                            <!--//level1-->

                        </ul>
                        <?php endif; ?>
                    </li>
                    <?php $nav_0 ++; ?>
                    <?php endforeach; ?>
                    <!--//level0-->
                </ul>

            </div>

        </div>
    </div>
</div>
<?php endif; ?>
