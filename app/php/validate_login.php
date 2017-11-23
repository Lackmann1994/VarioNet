<?php
session_start();
if (session_status() == PHP_SESSION_NONE) {
}


try {
    $return = new stdClass();
    $return -> error_code = '0';
    $return -> error_msg = null;
    $return -> data = null;

//    $return ->data = $_REQUEST;
//    die(json_encode($return));






  if (!(isset($_REQUEST["email"]) && $_REQUEST["email"]))
    throw new Exception("no_email", 1);
  if (!(isset($_REQUEST["password"]) && $_REQUEST["password"]))
    throw new Exception("no_password", 2);
  if (!(isset($_REQUEST["captcha_code"]) && $_REQUEST["captcha_code"]))
    throw new Exception("no_captcha_code", 3);

  $database_name = 'varionet';
  $database_user = 'root';
  $database_password = '132qewadS';
  $pdo = new PDO('mysql:host=localhost;dbname=' . $database_name, $database_user, $database_password);
  $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $sql = sprintf('SELECT * FROM client WHERE email = :email');
  $stm = $pdo -> prepare($sql);
  $stm -> bindParam('email', $_REQUEST['email']);
  $stm -> execute();
  $result = $stm -> fetch(PDO::FETCH_ASSOC);
  $stm -> closeCursor();

  if ($result) {
    if (password_verify($_REQUEST['password'], $result['password_hash'])) {
      include_once $_SERVER['DOCUMENT_ROOT'] . '\app\securimage\securimage.php';
      $securimage = new Securimage();
      if ($securimage -> check($_REQUEST['captcha_code']) == true) {
        $_SESSION['userid'] = $result['id'];
      } else {
        throw new Exception("wrong_captcha", 6);
      }
    } else {
      throw new Exception("wrong_password", 5);
    }
  } else {
    throw new Exception("wrong_email", 4);
  }
} catch(exception $e) {
  session_destroy();
  $return -> error_msg = $e -> getMessage();
  $return -> error_code = $e -> getCode();
}
die(json_encode($return));
?>

