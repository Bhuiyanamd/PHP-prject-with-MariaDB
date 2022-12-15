<?php

function showErrorMessage($msg) {
    echo "<div style=\"text-align:center;font-size:24px;color:#F00;width:500px;font-weight:bold;padding:5px;\">$msg</div>";
}
function showInfoMessage($msg) {
    echo "<div style=\"text-align:center;font-size:24px;color:#000;width:500px;font-weight:bold;padding:5px;\">$msg</div>";
}
function isValid_and_set($val) {
    return isset ( $_GET [$val] ) && strlen ( $_GET [$val] ) != 0;
}
function getDBC() {
    $host = "127.0.0.1";
    $user = "root";
    $pass = "";
    $db = "cis495";
    
    $dbc = new mysqli ( $host, $user, $pass, $db );
    
    return $dbc;
}
function getIfSet($fldName) {
    if (isset ( $_GET [$fldName] ))
        return $_GET [$fldName];
    
    return "";
}
?>