
<div class="featured-categories-container module-nav2">
	<div class="group-title"><h2><?php echo $title; ?></h2></div>
	<?php
        $count = 0;
        $rows = $config_slide['f_rows'];
        if(!$rows) { $rows=1; }
    ?>
	<div class="owl-container">
	<div class="owl-featured-categories">
		<?php foreach ($categories as $category) { ?>
		<?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; } ?>
			<div class="item">
				<div class="item-inner">
					<div class="fcategory-content">
						<a href="<?php echo $category['href']; ?>" class="image"><img src="<?php echo $category['homethumb_image'] ?>" alt="" /></a>
						<div class="content-thumb">
							<h2 class="name"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></h2>
							<?php if($config_slide['show_description']): ?>
								<p class="dec"><?php echo $category['description']; ?></p>
							<?php endif; ?>
							<?php if($config_slide['show_sub_category']): ?>
								<?php $number_sub = $config_slide['number_sub']; ?>
								<?php if($category['children']): ?>
									<?php $sub_count = 0; ?>
									<ul class="sub-featured-categories">
										<?php foreach($category['children'] as $subcate): ?>
										<?php if($sub_count >= $number_sub) break; ?>
											<li><a href="<?php echo $subcate['href']; ?>"><?php echo $subcate['name']; ?></a></li>
											<?php $sub_count++; ?>
										<?php endforeach; ?>
									</ul>
								<?php endif; ?>
							<?php endif; ?>
							<a href="<?php echo $category['href']; ?>" class="view-more"><?php echo $text_view; ?></a>
						</div>
					</div>
				</div>
			</div>	
		<?php if($count % $rows == 0 || $count == count($categories)) { echo '</div>'; } ?>
		<?php } ?>
	</div>
	</div>
</div>

<?php if($config_slide['use_slider']): ?>
<script type="text/javascript">
$(document).ready(function() { 
  $(".owl-featured-categories").owlCarousel({
	slideSpeed: <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 3000; } ?>,
	items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3; } ?>,
	autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
	navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
	paginationNumbers : true,
	pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ; } else { echo 'false'; } ?>,
	stopOnHover : false,
	itemsDesktop : [1199,3], 
    itemsDesktopSmall : [991,3], 
    itemsTablet: [767,2], 
    itemsMobile : [479,1],
	addClassActive : true,
	scrollPerPage:false,
	afterAction: function(){
		$(".owl-featured-categories .owl-wrapper .owl-item").removeClass('first');
		$(".owl-featured-categories .owl-wrapper .owl-item").removeClass('last');
		$(".owl-featured-categories .owl-wrapper .owl-item").removeClass('before-active');
		$(".owl-featured-categories .owl-wrapper .owl-item.active:first").addClass('first');
		$(".owl-featured-categories .owl-wrapper .owl-item.active:last").addClass('last');
		$('.owl-featured-categories .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
	}
  });
});
</script>
<?php endif; ?>