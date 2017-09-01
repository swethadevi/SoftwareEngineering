<div id="blog_home" class="menu-recent module-nav2 box-module">
	 <div>
		  <div class="blog-title group-title">
			   <p><?php echo $sub_title; ?></p>
			   <h2>
				<?php 
					$title2 = explode(' ',$title,3); 
					for($i=0;$i<count($title2);$i++){ 
						$j=$i+1;
						echo $j>2 ? "<span class='word2'> ".$title2[$i]." </span>" : "<span> ".$title2[$i]." </span>";
					}
				?>
			   </h2>
			   
		  </div>
		<?php
			$count = 0;
			$rows = $slide['rows'];
			if(!$rows) { $rows = 1;}
			$j=0;
		?>
	 <?php if ($articles) { ?>
      <div class="owl-container">
      <div class="articles-container">
        <?php foreach ($articles as $key=>$article) { $j++; ?>
		  <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; }  $count++; ?>
          <div class="articles-inner">
			   <div class="articles-date">				
					<p class="date"><?php echo $article['date_added_m']; ?><?php if($article['author'] != null && $article['author'] != ""): ?></p>
					<p class="author"><?php echo $text_post_by.'<span class="author-name">'.$article['author'].'</span>'; ?></p>
			   <?php endif; ?>
			   </div>
			   <div class="articles-image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['image']; ?>" alt="<?php echo $article['name']; ?>"/></a></div>
			   <div class="aritcles-content">
			   <a class="articles-name" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
			   
			   <div class="articles-intro"><?php echo $article['intro_text']; ?></div>
				<a class="read-more" href="<?php echo $article['href']; ?>"><?php echo $button_read_more; ?></a>
			   </div>
          </div>
		  <?php if($count % $rows == 0 || $count == count($articles)): ?>
	  		</div>
		 <?php endif; ?>
        <?php } ?>
      </div>
      </div>
      <?php } ?>
	  
      <?php if (!$articles) { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
	  </div>
 <script>
 $(document).ready(function() { 
	  $(".articles-container").owlCarousel({
			autoPlay : <?php if($slide['auto']) { echo 'true' ;} else { echo 'false'; } ?>,
			items : <?php echo $slide['items'] ?>,
			itemsDesktop : [1199,3],
			itemsDesktopSmall : [991,2],
			itemsTablet: [767,2],
			itemsMobile : [479,1],
			slideSpeed : <?php echo $slide['speed']; ?>,
			paginationSpeed : <?php echo $slide['speed']; ?>,
			rewindSpeed : <?php echo $slide['speed']; ?>,
			navigation : <?php if($slide['navigation']) { echo 'true' ;} else { echo 'false'; } ?>,
			pagination : <?php if($slide['pagination']) { echo 'true' ;} else { echo 'false'; } ?>,
			stopOnHover : true,
			addClassActive: true
			
	  });
 });
 </script>
</div>
