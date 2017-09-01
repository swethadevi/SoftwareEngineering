<?php echo $header; ?>
<div class="container ">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row">
	<div class="col-order">
	<?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class="category-name"><?php echo $heading_title; ?></h2>
      <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div>
      <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" />
      <h2><?php echo $text_search; ?></h2>
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
				<label><?php echo $text_sort; ?></label>
				<select id="input-sort" class="form-control" onchange="location = this.value;">
					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
			<div class="limiter">
				<label><?php echo $text_limit; ?></label>
				<select id="input-limit" class="form-control" onchange="location = this.value;">
					<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
					<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
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
											<div class="label-pro-sale"><span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span></div>
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
		
		<?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
	</div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#content input[name=\'search\']').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<?php echo $footer; ?>