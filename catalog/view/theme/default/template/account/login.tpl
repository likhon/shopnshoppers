<?php echo $header; ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

    <div class="login-panel-left">
        <div class="login-panel-heading"><?php echo $text_new_customer; ?></div>
        <div class="login-panel-body">
            <p class="new-customer-text"><?php echo $text_register_account; ?></p>
            <p class="new-customer-button-group">
                <a href="<?php echo $register; ?>" class="button">Register with email<?php //echo $button_continue; ?></a>
                <a href="<?php echo $register; ?>" class="button p-0"><img src="<?=$this->config->get('config_url')?>/image/social/facebook.png" alt="Facebook"/> </a>
                <a href="<?php echo $register; ?>" class="button p-0"><img src="<?=$this->config->get('config_url')?>/image/social/linkedin.png" alt="LinkedIn"/> </a>
                <a href="<?php echo $register; ?>" class="button p-0"><img src="<?=$this->config->get('config_url')?>/image/social/twitter.png" alt="Twitter"/> </a>
                <a href="<?php echo $register; ?>" class="button p-0"><img src="<?=$this->config->get('config_url')?>/image/social/google.png" alt="Google Plus"/> </a>
            </p>
        </div>
    </div>

    <div class="login-panel-right">
        <div class="login-panel-heading"><?php echo $text_returning_customer; ?></div>
        <div class="login-panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="content">
                    <p><?php echo $text_i_am_returning_customer; ?></p>
                    <b><?php echo $entry_email; ?></b><br />
                    <input type="text" name="email" value="<?php echo $email; ?>" />
                    <br />
                    <br />
                    <b><?php echo $entry_password; ?></b><br />
                    <input type="password" name="password" value="<?php echo $password; ?>" />
                    <br />
                    <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
                    <br />
                    <input type="submit" value="<?php echo $button_login; ?>" class="button" />
                    <?php if ($redirect) { ?>
                    <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                </div>
            </form>
        </div>
    </div>
    <br>

  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>