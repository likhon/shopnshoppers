<div class="block">
    <div class="block-title"><strong><span><?php echo $heading_title;?></span></strong></div>
    <div class="block-content">
		<!--
        <div id="tagCanvasContainer">
		  <canvas width="<?=$canvas_width?>" height="<?=$canvas_height?>" id="tagCanvas">
			<p>Anything in here will be replaced on browsers that support the canvas element</p>
		  </canvas>
		</div>
        -->
		<div id="tags" class="tags_cloud">

			<?php
			foreach($tags as $tag){
			?>
			<a href="/index.php?route=blog/post&filter_tag=<?=$tag['tag']?>"><?=$tag['tag']?></a>
			<?php } ?>
		</div>
	</div>
</div>
