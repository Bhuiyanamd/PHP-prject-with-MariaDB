<?php
include_once 'functions/functionsBuilding.php';

include_once 'header.php';

if (isset ( $_GET ['delRowId'] )) {
    
    $rowID = $_GET ['delRowId'];
    
    $deleteResult = delBuilding ( $rowID );
    
    if ($deleteResult == - 1)
        showErrorMessage ( "Failed to delete row ID $rowID. FK Violation" );
    elseif ($deleteResult == 0)
        showErrorMessage ( "Failed to deleted row ID $rowID" );
    else
        showInfoMessage ( "Successfully deleted row ID $rowID" );
}

$result = getAllBuilding ();

if ($result->num_rows > 0) {
    // Print table's header
    echo '<table width="100%" border="1">
            <tr>
                <td><strong>Building ID</strong></td>
                <td><strong>Last Name</strong></td>
                <td><strong>First Name</strong></td>
				<td><strong>Manager ID</strong></td>
				<td><strong>Employee #</strong></td>
                <td><strong>Building Code</strong></td>
                <td><strong>Building Name</strong></td>
                <td><strong>Building Address</strong></td>
                
                <td>&nbsp;</td>
            </tr>';
    
    // Print table's body
    while ( $rows = $result->fetch_assoc () ) {
        
        echo "<tr>
                <td>{$rows ['id']}</td>
                <td>{$rows ['last_name']}</td>
                <td>{$rows ['first_name']}</td>
				<td>{$rows ['manager_id']}</td>
				<td>{$rows ['emp_num']}</td>
                <td>{$rows ['code']}</td>
                <td>{$rows ['name']}</td>
                <td>{$rows ['address']}</td>
                
                <td>
                    <form action=buildingList.php>
                        <input type=hidden name=delRowId value=\"{$rows ['id']}\" />
                        <button type=submit>Delete</button>
                    </form>
                </td>
            </tr>";
    }
    
    echo '</table>';
}
include_once 'footer.php';
?>