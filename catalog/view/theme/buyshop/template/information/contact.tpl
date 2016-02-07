<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">


       <div class="contact-info">
              <div class="row">
                  <div class="span6">
                      <h3><?php echo $heading_title; ?></h3>
                      <div class="row-fluid">
                          <div class="span6">
                              <p>
                                  <strong><?php echo $text_address; ?></strong><br>
                                  <?php echo $store; ?><br>
                                  <?php echo $address; ?>
                              </p>
                          </div>
                          <div class="span6">
                              <p>
                                  <?php if ($telephone) : ?>
                                  <strong><?php echo $text_telephone; ?></strong><br>
                                  <?php echo $telephone; ?>
                                  <?php endif; ?>
                              </p>
                              <p>
                                  <?php if ($fax) : ?>
                                  <strong><?php echo $text_fax; ?></strong><br />
                                  <?php echo $fax; ?>
                                  <?php endif; ?>
                              </p>
                          </div>
                      </div>
                  </div>
                  <?php
                      $theme_additional = $this->config->get('bs_additional');
                      if (isset($theme_additional["google_map"]) && $theme_additional["google_map"] !== '') :
                  ?>
                  <div class="span6">
                      <h3><?php echo $text_location; ?></h3>
                      <!--google map-->
                      <div class="map-outer google_map"><?php echo html_entity_decode($theme_additional["google_map"], ENT_QUOTES, 'UTF-8'); ?></div>
                      <!--end google map-->
                  </div>
                  <?php endif; ?>

              </div>
       </div>



      <h3><?php echo $text_contact; ?></h3>
    <div class="contacts_page">
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="<?php echo $name; ?>" />
    <br />
    <?php if ($error_name) { ?>
    <span class="error"><?php echo $error_name; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_email; ?></b><br />
    <input type="text" name="email" value="<?php echo $email; ?>" />
    <br />
    <?php if ($error_email) { ?>
    <span class="error"><?php echo $error_email; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_enquiry; ?></b><br />
    <textarea name="enquiry" cols="40" rows="10" style="width: 99%;"><?php echo $enquiry; ?></textarea>
    <br />
    <?php if ($error_enquiry) { ?>
    <span class="error"><?php echo $error_enquiry; ?></span>
    <?php } ?>
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_captcha) { ?>
    <span class="error"><?php echo $error_captcha; ?></span>
    <?php } ?>
    </div>
    <div class="buttons">
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>