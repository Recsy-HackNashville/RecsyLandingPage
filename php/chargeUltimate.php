<?php
  require_once(dirname(__FILE__) . '/config.php');
 
  $token  = $_POST['stripeToken'];
 
  $customer = Stripe_Customer::create(array(
      'email' => $_POST['stripeEmail'],
      'plan'  => 'Ultimate',
      'card'  => $token
  ));
 
header('Location: https://www.recsy.com')

?>