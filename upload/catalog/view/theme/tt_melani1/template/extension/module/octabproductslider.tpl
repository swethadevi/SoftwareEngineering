<?php $tab_effect = 'wiggle'; ?>
<script type="text/javascript">
$(document).ready(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show(); 

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		$(".tab_content").removeClass("animate1 <?php echo $tab_effect;?>");
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab) .addClass("animate1 <?php echo $tab_effect;?>");
		$("#"+activeTab).fadeIn(); 
	});
});

</script>
<div class="product-tabs-container-slider module-nav2 quickview-add module-style1">
	<div class="title-product-tabs group-title">
        <?php if($title): ?>
			<h2><?php echo $title; ?></h2>
		<?php endif; ?>
		
		<ul class="tabs"> 
			<?php $count=0; ?>
			<?php foreach($productTabslider as $productTab ){ ?>
				<li rel="tab_<?php echo $productTab['id']; ?>"  >
					<span class="tab_<?php echo $productTab['id']; ?>"><?php echo $productTab['name']; ?></span>
				</li>
					<?php $count= $count+1; ?>
			<?php } ?>	
		</ul>
	</div>
	<div class="owl-container">
	<div class="tab_container">
		
		<?php foreach($productTabslider as $productTab){ ?>
			<div id="tab_<?php echo $productTab['id']; ?>" class="tab_content">
				
				<div class="owl-demo-tabproduct">
                <?php if($productTab['productInfo']): ?>
                    <?php
                        $count = 0;
                        $rows = $config_slide['f_rows'];
                        if(!$rows) { $rows=1; }
                    ?>
                    <?php foreach ($productTab['productInfo'] as $product) { ?>
                        <?php  if($count % $rows == 0 ) { echo '<div class="row_items">'; } $count++; ?>
							<div class="item">	
								<div class="item-inner">
									
									<div class="images-container">
										<?php if($config_slide['f_show_label']): ?>
											<?php if ($product['is_new']):
												if($product['special']): ?>
													<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span></div>
													<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
												<?php else: ?>
													<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
												<?php endif; ?>
											<?php else: ?>
												<?php if($product['special']): ?>
													<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span></div>
												<?php endif; ?>
											<?php endif; ?>
										<?php endif; ?>
										<a class="product-image" href="<?php echo $product['href']; ?>">
											<div class="product-image">
												<?php if($product['rotator_image']): ?>
													<img class="img-r" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
												<?php endif; ?>
												<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
											</div>
										</a>
										<div class="actions">
											
											<ul class="add-to-links">
												<li>
													<a class="link-wishlist fa fa-heart" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
														<em><?php echo $button_wishlist; ?></em>
													</a>
												</li>
												<li>
													<a class="link-compare fa fa-refresh" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
														<em><?php echo $button_compare; ?></em>
													</a>
												</li>
											</ul>
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
										
										<?php if($config_slide['f_show_price']) { ?>
											<?php if ($product['price']) { ?>
											<div class="price-box">
												<?php if (!$product['special']) { ?>
													<span class="price"><?php echo $product['price']; ?></span>
												<?php } else { ?>
													<p class="special-price"><span class="price"><?php echo $product['special']; ?></span></p>
													<p class="old-price"><span class="price"><?php echo $product['price']; ?></span></p>
												<?php } ?>
											</div>
											<?php } ?>
										<?php } ?>
										
										<?php if($config_slide['f_show_addtocart']) { ?>
												<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
													<span><?php echo $button_cart; ?></span>
												</button>
											<?php } ?>
										<?php if($config_slide['f_show_des']) { ?>
											<div class="des"><?php echo $product['description']; ?></div>
										<?php } ?>
										<div class="box-hover">
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
										</div>
									</div><!-- des -->
										
									
								</div> <!-- item-inner -->
							</div>
                        <?php if($count % $rows == 0 || $count == count($productTab['productInfo'])) { echo '</div>'; } ?>
                    <?php } ?>
                <?php else: ?>
                    <p><?php echo $productTab['text_empty']; ?></p>
                <?php endif; ?>
				</div>
				
			</div>

		<?php } ?>
	
	</div>
	</div><!-- .tab_container -->
</div>
<script type="text/javascript">
$(document).ready(function() { 
 $(".product-tabs-container-slider .tabs li:first").addClass("active");
  $(".owl-demo-tabproduct").owlCarousel({
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3;} ?>,
		autoPlay : <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false';} ?>,
		slideSpeed: <?php if($config_slide['f_speed']) { echo $config_slide['f_speed'] ;} else { echo 3000;} ?>,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false';} ?>,
		paginationNumbers : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : false,
		itemsDesktop : [1599,4], 
		itemsDesktopSmall : [991,3], 
		itemsTablet: [767,2], 
		itemsMobile : [479,1],
		addClassActive : true,
		scrollPerPage:false,
		afterAction: function(){
			$(".owl-demo-tabproduct .owl-wrapper .owl-item").removeClass('first');
			$(".owl-demo-tabproduct .owl-wrapper .owl-item").removeClass('last');
			$(".owl-demo-tabproduct .owl-item").removeClass('before-active');
			$(".owl-demo-tabproduct .owl-wrapper .owl-item.active:first").addClass('first');
			$(".owl-demo-tabproduct .owl-wrapper .owl-item.active:last").addClass('last');
			$('.owl-demo-tabproduct .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
		}
  });
 
});
</script>



