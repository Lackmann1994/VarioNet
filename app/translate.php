<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

try {
    $return = new stdClass();
    $return -> error_code = '0';
    $return -> error_msg = null;
    $return -> data = null;
    if (isset($_REQUEST["lang"]) && $_REQUEST["lang"])
        $lang = $_REQUEST["lang"];
    else
        throw new Exception("no_lang", 1);
    if (isset($_REQUEST["word"]) && $_REQUEST["lang"])
        $word = $_REQUEST["word"];
    else
        throw new Exception("no_word", 2);



  $database_name = 'varionet';
  $database_user = 'root';
  $database_password = '132qewadS';
  $pdo = new PDO('mysql:host=localhost;dbname='.$database_name , $database_user, $database_password);
  $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $sql = sprintf('SELECT name_%1$s FROM translation WHERE name = "%2$s"', $lang, $word);
  $stm = $pdo -> prepare($sql);
  $stm -> execute();
  $result = $stm -> fetch()[0];
  $stm -> closeCursor();
  if (isset($result)) {
      $return -> data = $result;
  } else {
      throw new Exception("missing_entry", 3);
  }
} catch(exception $e) {
//    session_destroy();
    $return -> error_msg = $e -> getMessage();
    $return -> error_code = $e -> getCode();
}
die(json_encode($return));
?>