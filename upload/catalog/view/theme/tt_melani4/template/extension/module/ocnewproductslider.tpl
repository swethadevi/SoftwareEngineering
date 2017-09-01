<div class="ocnewproductslider special-button-owl module-style1 quickview-add module-nav2">
   
   <?php if($title): ?>  
   <div class="group-title2">
	  <h2>
		<?php 
			$title2 = explode(' ',$title,3); 
			for($i=0;$i<count($title2);$i++){ 
				$j=$i+1;
				echo $j>1 ? "<span class='word2'> ".$title2[$i]." </span>" : "<span> ".$title2[$i]." </span>";
			}
		?>
		</h2>
   </div>
   <?php endif; ?>
   <?php 
	  $count = 0;
	  $rows = $config_slide['f_rows']; 
	  if(!$rows) { $rows=1; }
   ?>
   <div class="owl-container">
   <div class="newproducts_slider">
	   	<?php if($products): ?>
			<?php foreach ($products as $product) { ?>
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
								<?php if($product['rotator_image']): ?>
									<img class="img-r" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
								<?php endif; ?>
								<img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
							</a>
							<div class="actions">
								
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
							<?php if($config_slide['f_show_des']) { ?>
								<p class="product-des"><?php echo $product['description']; ?></p>
							<?php } ?>
							<?php if($config_slide['f_show_addtocart']) { ?>
								<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								  <span><span><?php echo $button_cart; ?></span></span>
								</button>
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
						</div>
				
				
				</div>				
				</div>
			<?php if($count % $rows == 0 || $count == count($products)): ?>
			</div>
			<?php endif; ?>
			<?php } ?>
		<?php else: ?>
			<p><?php echo $text_empty; ?></p>
		<?php endif; ?>
   </div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".newproducts_slider").owlCarousel({
		autoPlay: <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
		items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3; } ?>,
		slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed']; } else { echo 200;} ?>,
		navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
		paginationNumbers : true,
		pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
		stopOnHover : false,
		lazyLoad : true,
		itemsDesktop : [1199,1],
		itemsDesktopSmall : [991,2],
		itemsTablet: [767,2],
		itemsMobile : [479,1],
		addClassActive : true,
		scrollPerPage:false,
		afterAction: function(){
			$(".newproducts_slider .owl-wrapper .owl-item").removeClass('first');
			$(".newproducts_slider .owl-wrapper .owl-item").removeClass('last');
			$(".newproducts_slider .owl-wrapper .owl-item").removeClass('before-active');
			$(".newproducts_slider .owl-wrapper .owl-item.active:first").addClass('first');
			$(".newproducts_slider .owl-wrapper .owl-item.active:last").addClass('last');
			$('.newproducts_slider .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
		}
		 
  });
});
</script>