<div class="brand-slider">	

		<div class="container-inner">
			<div class="owl-container">
				<div id="carousel<?php echo $module; ?>" class="owl-carousel">
				  <?php foreach ($banners as $banner) { ?>
				  <div class="item text-center">
					<?php if ($banner['link']) { ?>
					<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
					<?php } else { ?>
					<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
					<?php } ?>
				  </div>
				  <?php } ?>
				</div>
			</div>
		</div>

</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?>').owlCarousel({
	items: 5,
	autoPlay: false,
	navigation: true,
	pagination: false,
	itemsDesktop : [1199,5],
	itemsDesktopSmall : [991,4],
	itemsTablet: [767,3],
	itemsMobile : [479,2],
});
--></script>