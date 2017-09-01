<footer>
	<div class="newsletter-group">
		<div class="container">
			<div class="container-inner">
				<?php if(isset($block4)){ ?>
					<?php echo $block4; ?>
				<?php } ?>
				<?php if(isset($block6)){ ?>
					<?php echo $block6; ?>
				<?php } ?>
			</div>
		</div>
	</div>
	<div class="footer-top">
	  <div class="container">
		<div class="row">
			<?php if(isset($block5)){ ?>
				<?php echo $block5; ?>
			<?php } ?>
		</div>
	  </div>
	</div>
	<div class="footer-bottom">
		<div class="container">
			<div class="container-inner">
				
				<div class="footer-copyright">
					<span><?php echo $copyright; ?></span>
				</div>
				<?php if(isset($block7)){ ?>
					<?php echo $block7; ?>
				<?php } ?>
			</div>
		</div>
	</div>
	  
  <div id="back-top"><i class="fa fa-angle-up"></i></div>
<script type="text/javascript">
$(document).ready(function(){
	// hide #back-top first
	$("#back-top").hide();
	// fade in #back-top
	$(function () {
		$(window).scroll(function () {
			if ($(this).scrollTop() > 300) {
				$('#back-top').fadeIn();
			} else {
				$('#back-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-top').click(function () {
			$('body,html').animate({scrollTop: 0}, 800);
			return false;
		});
	});
});
</script>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>