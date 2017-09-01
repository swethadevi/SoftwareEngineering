<?php if (count($languages) >= 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">

	<span class="text-ex"><?php echo $text_language; ?></span>
    
    <ul class="box-content">
      <?php foreach ($languages as $language) { ?>
		<?php if ($language['code'] == $code) { ?>
			<li><button class="btn btn-link btn-block language-select item-selected" type="button" name="<?php echo $language['code']; ?>"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></button></li>
		<?php } else { ?>
			<li><button class="btn btn-link btn-block language-select" type="button" name="<?php echo $language['code']; ?>"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></button></li>
		<?php } ?>
      <?php } ?>
    </ul>

  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
