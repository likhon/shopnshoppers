<?php echo $header; ?>
<?php 
function showSizeOptions($fmodule_row, $fmodule){
?>
	<label>Image Size: </label>
	<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][image_width]" value="<?php echo $fmodule['image_width']; ?>" size="3" />
    <input type="text" name="blog_module[<?php echo $fmodule_row; ?>][image_height]" value="<?php echo $fmodule['image_height']; ?>" size="3" />
<?php
}

function showTagsLimit($fmodule_row, $fmodule){
?>
	<p><label>Tags Limit: </label>
	<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][tag_limit]" value="<?php echo $fmodule['tag_limit']; ?>" size="3" /></p>

	<p style="display: none">
        <label>Tags Canvas Size (Width X Height): </label>
	W:<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][canvas_width]" value="<?php echo $fmodule['canvas_width']; ?>" size="4" />
     x H:<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][canvas_height]" value="<?php echo $fmodule['canvas_height']; ?>" size="4" /></p>

<p style="display: none">
<label>Tag Cloud Shape: </label>
	<?php
		$cloud_shapes = array(
			'hcylinder' => 'hcylinder',
			'vcylinder' => 'vcylinder',
			'hring' => 'hring',
			'vring' => 'vring',
			'sphere' => 'sphere',
		);
	?>
	<select name="blog_module[<?php echo $fmodule_row; ?>][cloud_shape]">
		<?php
			foreach($cloud_shapes as $cloud_shape){
				if(isset($fmodule['cloud_shape']) && $cloud_shape == $fmodule['cloud_shape']){
					echo '<option value="',$cloud_shape,'" selected="selected">',$cloud_shape,'</option>';
				} else {
					echo '<option value="',$cloud_shape,'">',$cloud_shape,'</option>';
				}
			}
		?>
	</select>
	</p>

<?php
}

function showCatOptions($fmodule_row, $fmodule, $text_disabled, $text_enabled){
?>
	<p><label>Show Category Image: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][show_img]">
	<?php if ($fmodule['show_img']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>
	<p><label>Image Dimension (Width X Height): </label>
	W:<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][image_width]" value="<?php echo $fmodule['image_width']; ?>" size="3" />
     x H:<input type="text" name="blog_module[<?php echo $fmodule_row; ?>][image_height]" value="<?php echo $fmodule['image_height']; ?>" size="3" /></p>
	<p><label>Show Post Count: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][count]">
	<?php if ($fmodule['count']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>
	<p><label>Show Description: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][show_desc]">
	<?php if ($fmodule['show_short_desc']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>
<?php
}

function showCount($fmodule_row, $fmodule, $text_disabled, $text_enabled){
?>
	<label>Show Post Count: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][count]">
	<?php if ($fmodule['count']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select>
<?php
}

function showLatestPostsOptions($fmodule_row, $fmodule, $text_disabled, $text_enabled){
?>
	<p><label>Post Limit: </label><input value="<?=$fmodule['limit']?>" type="text" size="3" name="blog_module[<?php echo $fmodule_row; ?>][limit]"></p>
	
	<p><label>Show Post Image: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][show_img]">
	<?php if ($fmodule['show_img']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>
	
	<p><label>Image Dimension (Width X Height): </label>
	W: <input value="<?=$fmodule['image_width']?>" type="text" size="3" name="blog_module[<?php echo $fmodule_row; ?>][image_width]"> X H: <input value="<?=$fmodule['image_height']?>" type="text" size="3" name="blog_module[<?php echo $fmodule_row; ?>][image_height]"></p>
	
	<p><label>Show Author: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][show_author]">
	<?php if ($fmodule['show_author']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>
	
	<p><label>Show Short Description: </label>
	<select name="blog_module[<?php echo $fmodule_row; ?>][show_short_desc]">
	<?php if ($fmodule['show_short_desc']) { ?>
	<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	<option value="0"><?php echo $text_disabled; ?></option>
	<?php } else { ?>
	<option value="1"><?php echo $text_enabled; ?></option>
	<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	<?php } ?>
	</select></p>


<?php
}

function showFields($fmodule_row, $fmodule, $text_disabled, $text_enabled){
	switch((int)$fmodule['widget_id']){
		//Blog Category
		case 1: showCatOptions($fmodule_row, $fmodule, $text_disabled, $text_enabled); break;
		//Favourite Links
		case 2: break;
		//Archives
		case 3: showCount($fmodule_row, $fmodule, $text_disabled, $text_enabled); break;
		//Latest Posts
		case 4: showLatestPostsOptions($fmodule_row, $fmodule, $text_disabled, $text_enabled); break;
		//Post Related Products
		case 5: showSizeOptions($fmodule_row, $fmodule); break;
		//Post Related Categories
		case 6: break;
		//Related Post
		case 7: showLatestPostsOptions($fmodule_row, $fmodule, $text_disabled, $text_enabled);  break;
		//Tag Widget
		case 8: showTagsLimit($fmodule_row, $fmodule);  break;
	}
}
?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table id="module" class="list">
        <thead>
          <tr>
			<td class="left"><?php  echo $entry_widget; ?></td>
            <td class="left"><?php  echo $entry_options; ?></td>
			<td class="left"><?php  echo $entry_layout; ?></td>
            <td class="left"><?php  echo $entry_position; ?></td>
            <td class="left"><?php  echo $entry_status; ?></td>
            <td class="right"><?php echo $entry_sort_order; ?></td>
            <td></td>
          </tr>
        </thead>
        <?php $module_row = 0; ?>
        <?php foreach ($modules as $module) { ?>
        <tbody id="module-row<?php echo $module_row; ?>">
          <tr>
			<td class="left">
				<select name="blog_module[<?php echo $module_row; ?>][widget_id]" onchange="showOptions($(this).val(),<?php echo $module_row; ?>)">
                <?php foreach ($widgets as $widget) { ?>
                <?php if ($widget['widget_id'] == $module['widget_id']) { ?>
                <option value="<?php echo $widget['widget_id']; ?>" selected="selected"><?php echo $widget['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $widget['widget_id']; ?>"><?php echo $widget['name']; ?></option>
                <?php } ?>
                <?php } ?>
				</select>
			</td>
			<td class="left" id="options-<?=$module_row?>">
				<?php showFields($module_row, $module, $text_disabled, $text_enabled); ?>
			</td>
            <td class="left"><select name="blog_module[<?php echo $module_row; ?>][layout_id]">
                <?php foreach ($layouts as $layout) { ?>
                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select></td>
            <td class="left"><select name="blog_module[<?php echo $module_row; ?>][position]">
                <?php if ($module['position'] == 'content_top') { ?>
                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                <?php } else { ?>
                <option value="content_top"><?php echo $text_content_top; ?></option>
                <?php } ?>  
                <?php if ($module['position'] == 'content_bottom') { ?>
                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                <?php } else { ?>
                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                <?php } ?>     
                <?php if ($module['position'] == 'column_left') { ?>
                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                <?php } else { ?>
                <option value="column_left"><?php echo $text_column_left; ?></option>
                <?php } ?>
                <?php if ($module['position'] == 'column_right') { ?>
                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                <?php } else { ?>
                <option value="column_right"><?php echo $text_column_right; ?></option>
                <?php } ?>
              </select></td>
            <td class="left"><select name="blog_module[<?php echo $module_row; ?>][status]">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
            <td class="right"><input type="text" name="blog_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
          </tr>
        </tbody>
        <?php $module_row++; ?>
        <?php } ?>
        <tfoot>
          <tr>
            <td colspan="6"></td>
            <td class="left"><a onclick="addModule();" class="button"><?php echo $button_add_module; ?></a></td>
          </tr>
        </tfoot>
      </table>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function showSizeOptions(fmodule_row){
	return '<label>Image Size: </label><input type="text" name="blog_module['+fmodule_row+'][image_width]" value="80" size="3" /><input type="text" name="blog_module['+fmodule_row+'][image_height]" value="80"" size="3" />';
}

function showTagsLimit(fmodule_row){
	return '<p><label>Tags Limit: </label><input type="text" name="blog_module['+fmodule_row+'][tag_limit]" value="100" size="3" /></p><p><label>Tags Canvas Size (Width X Height): </label>W:<input type="text" name="blog_module['+fmodule_row+'][canvas_width]" value="150" size="4" /> x H:<input type="text" name="blog_module['+fmodule_row+'][canvas_height]" value="200" size="4" /></p><p><label>Tag Cloud Shape: </label><select name="blog_module['+fmodule_row+'][cloud_shape]"><option value="hcylinder">hcylinder</option><option value="vcylinder">vcylinder</option><option value="hring">hring</option><option value="vring">vring</option><option value="sphere">sphere</option></select></p>';
}

function showCatOptions(fmodule_row){

	return '<p><label>Show Category Image: </label><select name="blog_module['+fmodule_row+'][show_img]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select></p><p><label>Image Dimension (Width X Height): </label>W:<input type="text" name="blog_module['+fmodule_row+'][image_width]" value="80" size="3" /> x H:<input type="text" name="blog_module['+fmodule_row+'][image_height]" value="80" size="3" /></p><p><label>Show Post Count: </label><select name="blog_module['+fmodule_row+'][count]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select></p><p><label>Show Description: </label><select name="blog_module['+fmodule_row+'][show_desc]"><option value="1"><?php echo $text_enabled; ?></option><option value="0" selected="selected"><?php echo $text_disabled; ?></option></select></p>';

}

function showCount(fmodule_row){
	return '<label>Show Post Count: </label><select name="blog_module['+fmodule_row+'][count]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select>';
}

function showLatestPostsOptions(fmodule_row){

	var html = '<p><label>Post Limit: </label><input value="5" type="text" size="3" name="blog_module['+fmodule_row+'][limit]"></p>';
	
	html += '<p><label>Show Post Image: </label><select name="blog_module['+fmodule_row+'][show_img]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select></p>';
				
	html += '<p><label>Post Image Dimension (Width X Height): </label>W: <input type="text" size="3" value="80" name="blog_module['+fmodule_row+'][image_width]"> X H: <input type="text" size="3" value="80" name="blog_module['+fmodule_row+'][image_height]"></p>';
				
	html += '<p><label>Show Author: </label><select name="blog_module['+fmodule_row+'][show_author]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select></p>';
				
	html += '<p><label>Show Short Description: </label><select name="blog_module['+fmodule_row+'][show_short_desc]"><option value="1" selected="selected"><?php echo $text_enabled; ?></option><option value="0"><?php echo $text_disabled; ?></option></select></p>';
	

	return html;
}

function showFields(widget_id, fmodule_row){
	switch(parseInt(widget_id, 10)){
		//Blog Category
		case 1: return showCatOptions(fmodule_row); break;
		//Favourite Links
		case 2: break;
		//Archives
		case 3: return showCount(fmodule_row); break;
		//Latest Posts
		case 4: return showLatestPostsOptions(fmodule_row); break;
		//Post Related Products
		case 5: return showSizeOptions(fmodule_row); break;
		//Post Related Categories
		case 6: break;
		//Related Post
		case 7: return showLatestPostsOptions(fmodule_row);  break;
		//Tags
		case 8: return showTagsLimit(fmodule_row);  break;
	}
	
	return "";
}

function showOptions(widget_id, fmodule_row){
	$('#options-'+fmodule_row).html(showFields(widget_id, fmodule_row));
}

function addModule() {	
	html  = '<tbody id="module-row' + module_row + '">';
	html += '  <tr>';
	html += '    <td class="left"><select name="blog_module[' + module_row + '][widget_id]" onchange="showOptions($(this).val(),' + module_row + ')">';
	<?php foreach ($widgets as $widget) { ?>
	html += '      <option value="<?php echo $widget['widget_id']; ?>"><?php echo addslashes($widget['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	
	html += '    <td class="left" id="options-' + module_row + '">'+showCatOptions(module_row)+'</td>';
	
	
	html += '    <td class="left"><select name="blog_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '    </select></td>';
	html += '    <td class="left"><select name="blog_module[' + module_row + '][position]">';
	html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="blog_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '      <option value="0"><?php echo $text_disabled; ?></option>';
    html += '    </select></td>';
	html += '    <td class="right"><input type="text" name="blog_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	module_row++;
}
//--></script>
<?php echo $footer; ?>