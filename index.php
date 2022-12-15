<?php
include_once 'functions/functionsCommon.php';

$dbc = getDBC ();

if ($dbc->connect_errno != 0) {
    
    showErrorMessage ( "Database connection failed" );
    showErrorMessage ( "Error #: " . $dbc->connect_errno );
    showErrorMessage ( "Error Description: " . $dbc->connect_error );
} else {
    include_once 'header.php';
    
    showErrorMessage ( "Successfully connected to database" );
}

include_once'footer.php';
?>