<?php
session_start();

echo $_SERVER['DOCUMENT_ROOT'] . '\app\securimage\securimage.php';
include_once $_SERVER['DOCUMENT_ROOT'] . '\app\securimage\securimage.php';
$securimage = new Securimage();

echo json_encode($_SESSION);
/**
 * Created by IntelliJ IDEA.
 * User: Alex
 * Date: 24.11.2017
 * Time: 07:23
 */