<?php
function getAllStaff() {
    $dbc = getDBC (); 
    
    $resultArr = $dbc->query ( "CALL StaffList" );
    
    $dbc->close ();
    
    return $resultArr;
}
function delStaff($rowID) {
    $dbc = getDBC ();
    
    $resultArr = $dbc->query ( "SELECT deleteStaffByID($rowID) AS deleteResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['deleteResult'];
}
function addStaff($person, $salary, $startDate, $endDate, $empNum) {
    $dbc = getDBC ();
	
	if(!empty($endDate)){
		$endDate = "\"" . $_GET ['endDate'] . "\"";
    }else
       $endDate = 'NULL';
   
    $resultArr = $dbc->query ( "SELECT insertStaff (\"$person\", \"$salary\", \"$startDate\", $endDate, \"$empNum\") AS insertResult" );
    
    $result = $resultArr->fetch_assoc ();
    
    $dbc->close ();
    
    return $result ['insertResult'];
}


?>