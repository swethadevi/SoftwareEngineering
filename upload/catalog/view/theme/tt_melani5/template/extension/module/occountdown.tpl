<script type="text/javascript">
	if (typeof OC == 'undefined') OC = { };
	OC.Countdown = {
		TEXT_YEARS 		: '<?php echo $text_years ?>',
		TEXT_MONTHS 	: '<?php echo $text_months ?>',
		TEXT_WEEKS 		: '<?php echo $text_weeks ?>',
		TEXT_DAYS 		: '<?php echo $text_days ?>',
		TEXT_HOURS 		: '<?php echo $text_hours ?>',
		TEXT_MINUTES 	: '<?php echo $text_minutes ?>',
		TEXT_SECONDS 	: '<?php echo $text_seconds ?>'
	};
</script>
<script type="text/javascript" src="catalog/view/javascript/jquery.countdown.js"></script>
<?php 
	  $count = 0;
	  $rows = $config_slide['f_rows']; 
	  if(!$rows) { $rows=1; }
   ?>
<div class="occountdown_module module-nav2 box-module">
<?php if ($title): ?>
<div class="countdown-title group-title"><h2><?php echo $title; ?></h2></div>
<?php endif; ?>
<?php if($products): ?>
	<div class="owl-container">
	<div class="countdown-product-inner">
    <?php foreach ($products as $product) : ?>
    <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
            <div class="item">
					<div class="item-inner">
						<?php if($config_slide['f_show_label']): ?>
							<?php if ($product['is_new']):
								if($product['special']): ?>
									<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."% ".$text_sale; ?></span></div>
									<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
								<?php else: ?>
									<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
								<?php endif; ?>
							<?php else: ?>
								<?php if($product['special']): ?>
									<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."% ".$text_sale;; ?></span></div>
								<?php endif; ?>
							<?php endif; ?>
						<?php endif; ?>
						
						 
						<div class="images-container">
							
							<a class="product-image" href="<?php echo $product['href']; ?>">
								<?php if($product['rotator_image']): ?>
								<img class="img-r" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
								<?php endif; ?>
								<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
							
							<div class="actions">
								<?php if($config_slide['f_show_addtocart']) { ?>
									<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
									  <span><span><?php echo $button_cart; ?></span></span>
									</button>
								<?php } ?>
								<?php if ($config_slide['f_show_wishlist'] || $config_slide['f_show_compare']) :  ?>
									<ul class="add-to-links">
										<?php if ($config_slide['f_show_wishlist']) :  ?>
										  <li>
											<a class="link-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
											  <em><?php echo $button_wishlist; ?></em>
											</a>
										  </li>
										<?php endif; ?>
										<?php if ($config_slide['f_show_compare']) :  ?>
										  <li>
											<a class="link-compare" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
											  <em><?php echo $button_compare; ?></em>
											</a>
										  </li>
										<?php endif; ?>
									</ul>
								<?php endif; ?>
							  </div><!-- actions -->
						</div><!-- image -->
					
					
					
						<div class="des-container">
							
							<?php if ($product['tags']) { ?>
								  <p class="tags-product">
									<?php for ($i = 0; $i < count($product['tags']); $i++) { ?>
									<?php if ($i < (count($product['tags']) - 1)) { ?>
									<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>,
									<?php } else { ?>
									<a href="<?php echo $product['tags'][$i]['href']; ?>"><?php echo $product['tags'][$i]['tag']; ?></a>
									<?php } ?>
									<?php } ?>
								  </p>
							<?php } ?>
							
							<h2 class="product-name">
								<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
							</h2>
							<?php if (isset($product['rating'])) { ?>
								<div class="ratings">
									<div class="rating-box">
									  <?php for ($i = 0; $i <= 5; $i++) { ?>
									  <?php if ($product['rating'] == $i) {
																$class_r= "rating".$i;
																echo '<div class="'.$class_r.'">rating</div>';
									}
									}  ?>
									</div>
								</div>
							<?php } ?>
							
							<?php if($config_slide['f_show_price']) { ?>
								  <?php if ($product['price']) { ?>
									  <?php if (!$product['special']) { ?>
									  <div class="price-box box-regular">
																<span class="regular-price">
																	<span class="price"><?php echo $product['price']; ?></span>
																</span>
									  </div>
									  <?php } else { ?>
									  <div class="price-box box-special">
										<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
										<p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
									  </div>
									  <?php } ?>
								  <?php } ?>
							<?php } ?>
							<p class="available"><?php echo $text_stock; ?><span class="ex-text"><?php echo $product['stock']; ?></span></p>
							<?php if($config_slide['f_show_des']){ ?>
							  <p class="description"><?php echo substr($product['description'],0,200).'...'; ?></p>
							<?php } ?>
							<p class="text-hurryup"><?php echo $text_hurryup; ?></p>
							<?php if(strtotime($product['date_end'])) { ?>
								<div id="Countdown<?php echo $product['product_id']?>" class="box-timer">
								
								</div>
								<?php if(strtotime($product['date_end'])) { ?>
									<script type="text/javascript">
										$(function () {
											var austDay = new Date();
											austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 26);
											$('#Countdown<?php echo $product['product_id'];?>').countdown({
												until: new Date(
													<?php echo date("Y",strtotime($product['date_end']))?>,
													<?php echo date("m",strtotime($product['date_end']))?> -1, 
													<?php echo date("d",strtotime($product['date_end']))?>,
													<?php echo date("H",strtotime($product['date_end']))?>,
													<?php echo date("i",strtotime($product['date_end']))?>, 
													<?php echo date("s",strtotime($product['date_end']))?>
													),
													//format: 'S'
											});
											
											$('#Countdown<?php echo $product['product_id'];?>').countdown('pause');
											
										});
									</script>
								<?php } ?>
							<?php } ?>
							
						</div>
				
				
				</div>				
				</div>
				<?php if($count % $rows == 0 || $count == count($products)): ?>
					</div>
				<?php endif; ?>
    <?php endforeach;  ?>
	</div>
	<?php if($use_thumbnail_slider): ?>
		<div class="col-sm-12 col-xs-12 list-thumb">
			<ul class="thumb">
				<?php $i=0; foreach ($products as $product) : ?>
					<li class="thumbinner<?php echo $i; echo ($i==0) ? ' active' : ''?>" onclick="timerslider(<?php echo $i; $i++;?>)">
						<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
					</li>
				<?php endforeach;  ?>
			</ul><!-- list-thumb -->
		</div>
	<?php endif; ?>
	</div>
<?php else: ?>
<p><?php echo $text_empty; ?></p>
<?php endif; ?>
</div>

<script type="text/javascript">
	<?php if($use_thumbnail_slider): ?>
		$('.occountdown_module .list-thumb .thumb').owlCarousel({
			autoPlay : false,
			items : 6,
			itemsDesktop : [1199,4],
			itemsDesktopSmall : [991,3],
			itemsTablet: [767,2],
			itemsMobile : [479,1],
			slideSpeed : 1000,
			paginationSpeed : 3000,
			navigation : true,
			stopOnHover : true,
			pagination : false,
			scrollPerPage:true,
			addClassActive: true,
			lazyLoad : true,
			navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
		});
	<?php endif; ?>
	$('.countdown-product-inner').owlCarousel({
		autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,1],
		itemsTablet: [767,1],
		itemsMobile : [479,1],
		slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 2000;} ?>,
		paginationSpeed : 3000,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		scrollPerPage:true,
		addClassActive: true,
		lazyLoad : true,
		afterAction: function(){
			$(".countdown-product-inner  .owl-wrapper .owl-item").removeClass('first');
			$(".countdown-product-inner  .owl-wrapper .owl-item.active:first").addClass('first');
		},
		afterMove: function(){
			x = $( ".countdown-tab-content .owl-pagination .owl-page" ).index( $( ".countdown-tab-content .owl-pagination .active" ));
			var thumbinner = ".thumbinner"+x;
			$(".list-thumb .thumb li").removeClass('active');
			$(thumbinner).addClass('active');
		}
		
		
	});
	
	var owltimerslider = $(".countdown-product-inner").data('owlCarousel');
	function timerslider(x){
		owltimerslider.goTo(x)
	}
</script>