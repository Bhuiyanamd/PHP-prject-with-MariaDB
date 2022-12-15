<?php
function getAllBuilding() {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "CALL buildingList" );
    
    $dbc->close ();
    
    return $resultArr;
}
function delBuilding($rowID) {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "SELECT deleteBuildingByID($rowID) AS deleteResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['deleteResult'];
}
function addBuilding($manager, $buildingId, $buildingCode, $buildingName, $buildingAddress) {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "SELECT insertBuilding (\"$manager\", \"$buildingId\", \"$buildingCode\", \"$buildingName\", \"$buildingAddress\") AS insertResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['insertResult'];
}


?>