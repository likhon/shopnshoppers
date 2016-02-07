<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if (isset($success)) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/setting.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		<table class="form">
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_post_per_page; ?></td>
		  <td><input style="width:40px" maxlength="3" name="blog_settings[config_post_per_page]" value="<?php echo (isset($blog_settings['config_post_per_page']) && intval($blog_settings['config_post_per_page'])>0) ? $blog_settings['config_post_per_page'] : '10'; ?>" />
			<?php if ($error_post_per_page) { ?>
			<span class="error"><?php echo $error_post_per_page; ?></span>
			<?php } ?></td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_guest_comment; ?></td>
		  <td><select name="blog_settings[config_guest_comment]">
				<?php if (isset($blog_settings['config_guest_comment']) && (int)$blog_settings['config_guest_comment']==1) { ?>
				<option value="1" selected="selected">Yes</option>
				<option value="0">No</option>
				<?php } else { ?>
				<option value="1">Yes</option>
				<option value="0" selected="selected">No</option>
				<?php } ?>
			</select>
		   </td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_posts_image_dimension; ?></td>
		  <td><input value="<?=$blog_settings['posts_img_width']?>" type="text" size="3" name="blog_settings[posts_img_width]"> x <input value="<?=$blog_settings['posts_img_height']?>" type="text" size="3" name="blog_settings[posts_img_height]">
		   </td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_post_image_thumb; ?></td>
		  <td><input value="<?=$blog_settings['post_img_thumb_width']?>" type="text" size="3" name="blog_settings[post_img_thumb_width]"> x <input value="<?=$blog_settings['post_img_thumb_height']?>" type="text" size="3" name="blog_settings[post_img_thumb_height]">
		   </td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_post_image_extra; ?></td>
		  <td><input value="<?=$blog_settings['post_img_extra_thumb_width']?>" type="text" size="3" name="blog_settings[post_img_extra_thumb_width]"> x <input value="<?=$blog_settings['post_img_extra_thumb_height']?>" type="text" size="3" name="blog_settings[post_img_extra_thumb_height]">
		   </td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_post_image_popup; ?></td>
		  <td><input value="<?=$blog_settings['post_img_popup_width']?>" type="text" size="3" name="blog_settings[post_img_popup_width]"> x <input value="<?=$blog_settings['post_img_popup_height']?>" type="text" size="3" name="blog_settings[post_img_popup_height]">
		   </td>
		</tr>
		<tr>
		  <td><span class="required">*</span> <?php echo $entry_category_image_dimension; ?></td>
		  <td><input value="<?=$blog_settings['cat_img_width']?>" type="text" size="3" name="blog_settings[cat_img_width]"> x <input value="<?=$blog_settings['cat_img_height']?>" type="text" size="3" name="blog_settings[cat_img_height]">
		   </td>
		</tr>
		

		</table>  
    </form>
  </div>
</div>
<?php echo $footer; ?>
	
	
	