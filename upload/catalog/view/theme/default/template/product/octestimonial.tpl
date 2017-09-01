<?php echo $header; ?>
<div class="container main">
<div class="main">
    <div id="content">
    <?php echo $content_top; ?>
        <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li> <a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
  </ul>
        <div class="testimonial-product">
        <div class="title-module">
            <div class="page-title"><h1><?php echo $heading_title; ?></h1></div>
        </div>
            <?php if ($testimonials) { ?>
            <div class="testimonial-container">
                <?php foreach ($testimonials as $testimonial) { ?>
				<div class="row-testimonials">
					<div class="testimonial-images col-lg-3 col-md-3 col-xs-12 colsm-12"><img src="<?php echo $testimonial['image']; ?>"></div>
					<div class="box-testimonial col-lg-9 col-md-9 col-xs-12 colsm-12">
						<div class="testimonial-std"><?php echo $testimonial['content']; ?></div>
						<div class="testimonial-name"><h2>--<?php echo $testimonial['customer_name']; ?>--</h2></div>
					</div>
				</div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
        </div>
    </div>
</div>
    <?php echo $content_bottom; ?>
</div>
<?php echo $footer; ?>