<?php if ($products) { ?>
<div class="link-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
<div class="toolbar toolbar-products">
	<div class="modes">
		<div class="btn-group">
			<button type="button" id="grid-view" class="btn"><i class="icon ion-android-apps"></i></button>
			<button type="button" id="list-view" class="btn"><i class="icon ion-navicon-round"></i></button>
		</div>
	</div>
	<div class="toolbar-amount">
		<span><?php echo $results; ?></span>
	</div>
	<div class="sorter">
		<select id="input-sort" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
			<?php foreach ($sorts as $sorts) { ?>
			<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
			<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $text_sort; ?>&nbsp;<?php echo $sorts['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $sorts['href']; ?>"><?php echo $text_sort; ?>&nbsp;<?php echo $sorts['text']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
	</div>
	<div class="limiter">
		<select id="input-limit" class="form-control" onchange="oclayerednavigationajax.filter(this.value)">
			<?php foreach ($limits as $limits) { ?>
			<?php if ($limits['value'] == $limit) { ?>
			<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $text_limit; ?>&nbsp;<?php echo $limits['text']; ?></option>
			<?php } else { ?>
			<option value="<?php echo $limits['href']; ?>"><?php echo $text_limit; ?>&nbsp;<?php echo $limits['text']; ?></option>
			<?php } ?>
			<?php } ?>
		</select>
	</div>
</div>
<div class="custom-products quickview-add">
	 <div class="row">
		<?php 
			$count = 1;
			foreach ($products as $product) { 
		?>
			<div class="product-layout product-list ">
			  <div class="item <?php echo 'item'.$count;  ?>">
				<div class="item-inner">
					
					  
					
					<div class="col-image">
						<div class="images-container">
							<?php if ($product['is_new']):
								if($product['special']): ?>
									<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span></div>
									<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
								<?php else: ?>
									<div class="label-pro-new"><span><?php echo $text_new; ?></span></div>
								<?php endif; ?>
							<?php else: ?>
								<?php if($product['special']): ?>
									<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span></span></div>
								<?php endif; ?>
							<?php endif; ?>
							  <a href="<?php echo $product['href']; ?>">
								  <?php if ($product['thumb']) { ?>
									
									<?php if($product['rotator_image']){ ?><img class="img-r lazy" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
								  <?php } else { ?>
									<img  src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
								  <?php } ?>
								  <img  src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy" />
							  </a>
							<div class="actions">
									<ul class="add-to-links">
										<li>
											<a class="link-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
												<em><?php echo $button_wishlist; ?></em>
											</a>
										</li>
										<li>
											<a class="link-compare" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
												<em><?php echo $button_compare; ?></em>
											</a>
										</li>
									</ul>
								</div>
						</div>
					</div>
					<div class="col-des">
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
							  <h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
								 <div class="box-rating"></div>
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
							 
							 
							  
								<p class="product-des"><?php echo $product['description']; ?></p>
								
								
								
								<div class="box-hover">
									<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
										<span><span><?php echo $button_cart; ?></span></span>
									</button>
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
			  </div>
			  <script type="text/javascript">
					$(document).ready(function() {
						$(".product-list .item<?php echo $count; ?> .ratings").appendTo('.item<?php echo $count; ?> .des-container .box-rating');
						$('#grid-view').click(function() {
							$(".item<?php echo $count; ?> .ratings").appendTo('.item<?php echo $count; ?> .des-container .box-hover');
						});
						$('#list-view').click(function() {
							$(".item<?php echo $count; ?> .ratings").appendTo('.item<?php echo $count; ?> .des-container .box-rating');
						});
					});
			</script>
			</div>
		<?php $count++; } ?>
	 </div>
</div>
<div class="toolbar toolbar-products toolbar-bottom">
	<div class="toolbar-amount">
		<span><?php echo $results; ?></span>
	</div>
	<div class="pages">
		<?php echo $pagination; ?>
	</div>
   
</div>
<?php } ?>
<?php if (!$products) { ?>
<p><?php echo $text_empty; ?></p>
<div class="buttons">
	<div class="pull-right"><a href="<?php echo $continue; ?>" class="button btn btn-primary"><?php echo $button_continue; ?></a></div>
</div>
<?php } ?>
