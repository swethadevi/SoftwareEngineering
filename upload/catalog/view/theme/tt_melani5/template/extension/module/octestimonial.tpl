<?php
	$count = 0;
	$rows = $slide['rows'];
	if(!$rows) { $rows = 1; }
?>
<div class="testimonial-container module-nav2 box-module">
	<div class="group-title">
		<h2>
			<?php echo $title; ?>
		</h2>
	</div>
	<div class="owl-container">	
		<div class="block-content">
			<div id="slides">
				<?php foreach($testimonials as $testimonial) { ?>
					<?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
					<div class="testimonial-content">
						<!-- <div class="testimonial-images pull-left"> -->
							<!-- <img src="<?php echo $testimonial['image'];?>" alt="<?php echo $testimonial['customer_name'];?>"> -->
						<!-- </div> -->
						<div class="testimonial-box media-body">							
							<a href="<?php echo $more; ?>"><?php echo '" '.$testimonial['content'].'"'; ?></a>
						</div>
					</div><!--testimonial-content-->
					<?php if($count % $rows == 0 || $count == count($testimonials)): ?>
					</div>
					<?php endif; ?>
				<?php  } ?>
			</div>
			<ul class="thumb">
				<?php $i=0; ?>
				<?php $j=0; foreach ($testimonials as $testimonial) { ?>
					<?php if ($testimonial['content']) { ?>
						<li class="testithumb<?php echo $j; echo ($j==0) ? ' active' : ''?>" onclick="testislider(<?php echo $j; $j++;?>)">
							<?php if($testimonial['image'] != null) { ?>
								<img src="<?php echo $testimonial['image'];?>" alt="plazathemes.com">
							<?php } ?>
							<span class="testimonial-author"><?php echo $testimonial['customer_name']; ?></span>
						</li>
					<?php $i++; } ?>
				<?php if($i==$limit){break;} } ?>
			</ul>
		</div><!--block-content-->
	</div>
</div><!--testimonial-container-->
<script type="text/javascript">
    $("#slides").owlCarousel({
		autoPlay : <?php if($slide['auto']) { echo 'true' ;} else { echo 'false'; } ?>,
		items : <?php echo $slide['items'] ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [767,1],
		itemsMobile : [479,1],
		slideSpeed : <?php echo $slide['speed']; ?>,
		paginationSpeed : <?php echo $slide['speed']; ?>,
		rewindSpeed : <?php echo $slide['speed']; ?>,
		navigation : <?php if($slide['navigation']) { echo 'true' ;} else { echo 'false'; } ?>,
		pagination : <?php if($slide['pagination']) { echo 'true' ;} else { echo 'false'; } ?>,
		afterMove: function(){
				x = $( ".block-content #slides .owl-pagination .owl-page" ).index( $( ".block-content #slides .owl-pagination .active" ));
				var testithumb = ".testithumb"+x;
				$(".block-content .thumb li").removeClass('active');
				$(testithumb).addClass('active');
			}
		});
		
		
		
		var owlslider = $(".block-content #slides").data('owlCarousel');
		function testislider(x)
		{
			owlslider.goTo(x)
		}
		var length_item = $('#slides .owl-item').length;
		var y = length_item%2==0 ? length_item/2 : Math.round(length_item/2)-1;
		owlslider.goTo(y);	
		
		$(".testimonial-container .thumb").owlCarousel({
			autoPlay : false,
			items : 5,
			itemsDesktop : [1199,4],
			itemsDesktopSmall : [991,5],
			itemsTablet: [767,3],
			itemsMobile : [479,2],
			slideSpeed : 1000,
			paginationSpeed : 1000,
			navigation : false,
			pagination : true,
			addClassActive : true,
			scrollPerPage:false,
		});
		
		
		
</script>