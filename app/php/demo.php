<?php
session_start();

echo 'this dummy page shows the current session variables';

echo json_encode($_SESSION);
/**
 * Created by IntelliJ IDEA.
 * User: Alex
 * Date: 24.11.2017
 * Time: 07:23
 */