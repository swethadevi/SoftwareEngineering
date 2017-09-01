<?php if (count($currencies) > 1) { ?>
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">

	<span class="text-ex"><?php echo $text_currency; ?></span>
    
    <ul class="box-content">
      <?php foreach ($currencies as $currency) { ?>
      <?php if ($currency['code'] == $code) { ?>
      <li><button class="currency-select item-selected btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['code'].' - '.$currency['title']; ?> <?php echo $currency['symbol_right']; ?></button></li>
      <?php } else { ?>
      <li><button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['symbol_left']; ?> <?php echo $currency['code'].' - '.$currency['title']; ?> <?php echo $currency['symbol_right']; ?></button></li>
      <?php } ?>
      <?php } ?>
    </ul>

  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>
