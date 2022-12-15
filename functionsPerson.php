<?php
function getAllPerson() {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "CALL personList" );
    
    $dbc->close ();
    
    return $resultArr;
}
function delPerson($rowID) {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "SELECT deletePersonByID($rowID) AS deleteResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['deleteResult'];
}
function addPerson($pID, $pFName, $pLName, $pDOB, $pAdd) {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "SELECT insertPerson (\"$pID\", \"$pFName\", \"$pLName\", \"$pDOB\", \"$pAdd\") AS insertResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['insertResult'];
}
?>