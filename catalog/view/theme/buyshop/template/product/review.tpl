<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $review['author']; ?></b> <?php echo $text_on; ?> <?php echo $review['date_added']; ?></div>
  <div class="rating">
      <?php
      echo '<strong>';
      for ($i = 1; $i <= $review['rating']; $i++) {
      echo '<a><i class="icon-star"></i></a>';
      }
      echo '</strong>';
      $k =  5 - $review['rating'];
      for ($j = 1; $j <= $k; $j ++) {
      echo '<a><i class="icon-star"></i></a>';
      }
      ?>
  </div>
  <div class="text"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
<div class="content"><?php echo $text_no_reviews; ?></div>
<?php } ?>
