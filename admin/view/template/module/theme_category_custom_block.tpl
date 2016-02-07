<?php echo $header; ?>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $block_title; ?></h1>
      <div class="buttons">
          <!--<a onclick="buttonApply();" class="button">Apply Changes</a>-->
          <a class="button" onclick="$('#form').submit();"><?php echo $button_save; ?></a>
          <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" name="categoriesform">

          <!--categories blocks-->
          <?php if ($categories) { ?>
          <h3 style="text-align:center">Option is available only for top level categories</h3>

          <div style="padding-bottom:10px"><span style="color:red;">NOTE! If you've entered some symbol in a field you can't make this field empty. So, to make it clean enter symbol "-".</span></div>


          <table class="form">

              <?php
              foreach ($categories as $category) :

                  $k = $category['category_id'];

                  $find = '&gt;';
                  $pos = strpos($category['name'], $find);
                  if ($pos === false) :
              ?>

                  <tr>
                      <td><h3><?php echo $category['name']; ?></h3></td>
                      <td class="left">
                          <input type="hidden" name="category[<?php echo $k; ?>][category_id]" value="<?php echo $category['category_id']; ?>" />

                          <div style="background-color:#e0e8ff;">
                              <span class="help">Upload image for category dropdown block in Top Menu in the path - image/data/ and enter its name here <br>(for example, you can enter such path: category_icons/category-icon-01.png):</span>
                              <div style="padding-bottom:10px;padding-top:10px;border-bottom: 1px dotted #CCCCCC;margin-bottom:10px">
                                  image/data/ <input style="width:90%" type="text" name="category[<?php echo $k; ?>][image_top_src]" value="<?php echo (isset($category['image_top_src']) ? $category['image_top_src'] : ''); ?>" />
                              </div>
                          </div>


                          <div style="background-color:#dcdcdc;">
                              <span class="help">Upload image for category icon in the path - image/data/ and enter its name here <br>(for example, you can enter such path: category_icons/category-icon-01.png):</span>
                              <div style="padding-bottom:10px;padding-top:10px;border-bottom: 1px dotted #CCCCCC;margin-bottom:10px">
                                  image/data/ <input style="width:90%" type="text" name="category[<?php echo $k; ?>][image_src]" value="<?php echo (isset($category['image_src']) ? $category['image_src'] : ''); ?>" />
                              </div>
                          </div>



                      </td>
                  </tr>
              <?php endif; ?>
              <?php endforeach; ?>
          </table>
          <?php } else { ?>
            <div class="categories_absent"><?php echo $text_no_results; ?></div>
          <?php } ?>

          <!--end categories blocks-->

          <input type="hidden" name="buttonForm" value="" />
      </form>
        <div class="pagination"><?php echo $pagination; ?></div>

    </div>
  </div>
</div>
<script type="text/javascript">
    function buttonApply() {document.categoriesform.buttonForm.value='apply';$('#form').submit();}
</script>

<?php echo $footer; ?>