<div class="qrcode">
  <?php if (isset($heading_title)) { ?>
	  <div class="box-heading"><?php echo $heading_title; ?></div>
	  <div class="box-content">
		<?php echo $qr_code; ?>
	  </div>
  <?php } else {
	    echo '<div class="box-content">'.$qr_code.'</div>';
  } ?>
</div>