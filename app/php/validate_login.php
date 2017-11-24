<?php
session_start();
if (session_status() == PHP_SESSION_NONE) {
}


try {
    $return = new stdClass();
    $return->error_code = '0';
    $return->error_msg = null;
    $return->data = null;

//    include_once $_SERVER['DOCUMENT_ROOT'] . '\app\securimage\securimage.php';
//    $securimage = new Securimage();
//    $return -> data = $securimage;
//    throw new Exception('demo_exception', 77);


    if (!(isset($_REQUEST["email"]) && $_REQUEST["email"]))
        throw new Exception("no_email", 1);
    if (!(isset($_REQUEST["password"]) && $_REQUEST["password"]))
        throw new Exception("no_password", 2);
    if (!(isset($_REQUEST["captcha"]) && $_REQUEST["captcha"]))
        throw new Exception("no_captcha", 3);

    $postfields = array('secret' => '6LcGNDoUAAAAAJrACA0STA-nHOnIMFUvERneWR-h', 'response' => $_REQUEST["captcha"]);
    $ch = curl_init('https://www.google.com/recaptcha/api/siteverify');
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postfields);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $response = curl_exec($ch);
    $response = json_decode($response, true);
    curl_close($ch);

    if($response['success'] != 'true'){
        $return->data = $response;
        throw new Exception('captcha_error', 6);
    }


    $database_name = 'varionet';
    $database_user = 'root';
    $database_password = '132qewadS';
    $pdo = new PDO('mysql:host=localhost;dbname=' . $database_name, $database_user, $database_password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = sprintf('SELECT * FROM client WHERE email = :email');
    $stm = $pdo->prepare($sql);
    $stm->bindParam('email', $_REQUEST['email']);
    $stm->execute();
    $result = $stm->fetch(PDO::FETCH_ASSOC);
    $stm->closeCursor();

    if ($result) {
        if (password_verify($_REQUEST['password'], $result['password_hash'])) {
//      if ($securimage -> check($_REQUEST['captcha_code']) == true) {
            $_SESSION['userid'] = $result['id'];
//      } else {
//          $return -> data = $_SESSION;
//          throw new Exception(json_encode($_SESSION), 6);
//          throw new Exception("wrong_captcha", 6);
//      }
        } else {
            throw new Exception("wrong_password", 5);
        }
    } else {
        throw new Exception("wrong_email", 4);
    }
} catch (exception $e) {
    session_destroy();
    $return->error_msg = $e->getMessage();
    $return->error_code = $e->getCode();
}
die(json_encode($return));
?>

