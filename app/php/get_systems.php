<?php
session_start();
if (session_status() == PHP_SESSION_NONE) {
}

try {
  $return = new stdClass();
  $return -> error_code = '0';
  $return -> error_msg = null;
  $return -> data = null;

    if (!(isset($_SESSION['userid']) && $_SESSION['userid']))
        throw new Exception("Not logged in", 100);
//        $_REQUEST['userid'] = 1;
    ((isset($_REQUEST['userid'])) && $_REQUEST['userid']) ? $userid=$_REQUEST['userid'] : $userid=$_SESSION['userid'];

  
  $database_name = 'varionet';
  $database_user = 'root';
  $database_password = '132qewadS';
  $pdo = new PDO('mysql:host=localhost;dbname=' . $database_name, $database_user, $database_password);
  $pdo -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $sql = 'call select_system_of_client(:branchroot)';
  $stm = $pdo -> prepare($sql);
  $stm -> bindParam('branchroot', $userid);
  $stm -> execute();

  
  
  $return -> data = $stm -> fetchAll(PDO::FETCH_ASSOC);
  $stm -> closeCursor();
  
  
  
} catch(exception $e) {
  $return -> error_msg = $e -> getMessage();
  $return -> error_code = $e -> getCode();
}
die(json_encode($return));
?>