<div class="block">
    <div class="block-title"><strong><span><?php echo $heading_title;?></span></strong></div>
    <div class="block-content">
		<ul class="box-category">
		<?php foreach ($favouriate_links as $flinks) { ?>
		<!--
            <li>
			<a href="http://<?php echo str_replace('http://','',$flinks['href']); ?>" <?php echo (int)$flinks['target']==1?'target="_blank"':''?>><?php echo $flinks['name']; ?></a>
		</li>
         -->
            <li>
                <div class="video-container">
                    <iframe src="http://<?php echo str_replace('http://','',$flinks['href']); ?>" frameborder="0" width="560" height="315"></iframe>
                </div>

            </li>
		<?php } ?>
		</ul>
	</div>
</div>