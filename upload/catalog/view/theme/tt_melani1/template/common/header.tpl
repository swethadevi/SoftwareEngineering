<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/jquery-ui.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/css/jquery-ui.css" rel="stylesheet" media="screen" />
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/oclayerednavigation/css/oclayerednavigation.css" rel="stylesheet">
<script src="catalog/view/javascript/opentheme/oclayerednavigation/oclayerednavigation.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<link href="catalog/view/javascript/bootstrap/css/bootstrap-theme.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" type="text/css" rel="stylesheet"  />
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="catalog/view/javascript/ionicons/css/ionicons.css" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Overpass:300,400,600,600i,700,800" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Poiret+One" rel="stylesheet" />
<script src="catalog/view/javascript/opentheme/hozmegamenu/custommenu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/hozmegamenu/mobile_menu.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery.plugin.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocslideshow/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/vermegamenu/ver_menu.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/vermegamenu/css/ocvermegamenu.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/ocslideshow/ocslideshow.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/hozmegamenu/css/custommenu.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/css/animate.css" rel="stylesheet" />
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/css/owl.carousel.css" rel="stylesheet" />
<script src="catalog/view/javascript/jquery/elevatezoom/jquery.elevatezoom.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.js" type="text/javascript"></script>
<script src="catalog/view/javascript/opentheme/ocquickview/ocquickview.js" type="text/javascript"></script>
<script src="catalog/view/javascript/ma.lettering.js" type="text/javascript"></script>
<link href="catalog/view/theme/tt_melani1/stylesheet/opentheme/ocquickview/css/ocquickview.css" rel="stylesheet">
<link href="catalog/view/theme/tt_melani1/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?> home1">

<header>
	<div class="header-inner">
	  <div class="container">
		<div class="container-inner">
			<div class="logo-container">
				<div id="logo">
				  <?php if ($logo) { ?>
				  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
				  <?php } else { ?>
				  <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
				  <?php } ?>
				</div>
			</div>
			<div class="hoz-menu">
				<?php if(isset($block1)){ echo $block1; } ?>
			</div>
			<div class="box-options">
				<div class="top-search btn-group">
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown"><i class="icon ion-ios-search-strong"></i></button>
					<div class="dropdown-menu">
						<?php echo $search; ?>
					</div>
				</div>
				<div class="setting btn-group">
					<button class="btn btn-link dropdown-toggle" data-toggle="dropdown"><i class="icon ion-android-settings"></i></button>
					<ul class="dropdown-menu">
						<li>
							<div class="box-content" id="top-links">
								<?php if($use_ajax_login): ?>
									<ul class="ul-account list-unstyled">
								<?php else: ?>
									<ul class="list-unstyled">
								<?php endif; ?>
								<?php if ($logged) { ?>
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
								<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>				
								<li>
									<?php if($use_ajax_login): ?>
										<a id="a-logout-link" href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
									<?php else: ?>
										<a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a>
									<?php endif; ?>
								</li>			
								<?php } else { ?>
								<li>
									<?php if($use_ajax_login): ?> 
										<a id="a-register-link" href="<?php echo $register; ?>"><?php echo $text_register; ?></a>
									<?php else: ?>
										<a href="<?php echo $register; ?>"><?php echo $text_register; ?></a> 
									<?php endif; ?>
								</li>
								<li>
									<?php if($use_ajax_login): ?> 
										<a id="a-login-link" href="<?php echo $login; ?>"><?php echo $text_login; ?></a>
									<?php else: ?>
										<a href="<?php echo $login; ?>"><?php echo $text_login; ?></a> 
									<?php endif; ?>
								</li>
								<?php } ?>
							  </ul>
							</div>
							
						</li>
						<li class="currency"><?php echo $currency; ?></li>
						<li class="language"><?php echo $language; ?></li>
					</ul>
				</div>
				<a href="<?php echo $wishlist; ?>" id="wishlist-total" class="btn-group" title="<?php echo $title_wishlist; ?>"><i class="icon ion-heart"></i><span><?php echo $text_wishlist; ?></span></a>
				<?php echo $cart; ?>
				
			</div>
		  <div class="clearfix"></div>
		</div>
	  </div>
	</div>
	
</header>

<script type="text/javascript">
$(document).ready(function() { 
	
   $("#corporate").owlCarousel({ 
		autoPlay : false,
		slideSpeed : 1000,
		navigation : false,
		stopOnHover : true,
		pagination : true,
		items : 3,
		itemsDesktop : [1199,3],
		itemsDesktopSmall : [991,2],
		itemsTablet: [767,2],
		itemsMobile : [479,1],
		addClassActive : true,
		scrollPerPage:false,
		afterAction: function(){
			$(".ma-corporate-about .owl-wrapper .owl-item").removeClass('last');
			$(".ma-corporate-about .owl-wrapper .owl-item").removeClass('first');
			$(".ma-corporate-about .owl-wrapper .owl-item").removeClass('before-active');
			$(".ma-corporate-about .owl-wrapper .owl-item.active:first").addClass('first');
			$(".ma-corporate-about .owl-wrapper .owl-item.active:last").addClass('last');
			$('.ma-corporate-about .owl-wrapper .owl-item.active:first').prev().addClass('before-active');
		}
   });
});
</script>

