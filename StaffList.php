<?php
include_once 'functions/functionsStaff.php';

include_once 'header.php';

if (isset ( $_GET ['delRowId'] )) {
    
    $rowID = $_GET ['delRowId'];
    
    $deleteResult = delStaff ( $rowID );
    
    if ($deleteResult == - 1)
        showErrorMessage ( "Failed to delete row ID $rowID. FK Violation" );
    elseif ($deleteResult == 0)
        showErrorMessage ( "Failed to deleted row ID $rowID" );
    else
        showInfoMessage ( "Successfully deleted row ID $rowID" );
}

$result = getAllStaff ();

if ($result->num_rows > 0) {
    // Print table's header
    echo '<table width="100%" border="1">
            <tr>
                <td><strong>ID</strong></td>
                <td><strong>Last Name</strong></td>
                <td><strong>First Name</strong></td>
                <td><strong>DOB</strong></td>
                <td><strong>Address</strong></td>
                <td><strong>Salary</strong></td>
                <td><strong>Start Date</strong></td>
                <td><strong>End Date</strong></td>
                <td><strong>Employee #</strong></td>
                <td>&nbsp;</td>
            </tr>';
    
    // Print table's body
    while ( $rows = $result->fetch_assoc () ) {
        
        echo "<tr>
                <td>{$rows ['id']}</td>
                <td>{$rows ['last_name']}</td>
                <td>{$rows ['first_name']}</td>
                <td>{$rows ['DOB']}</td>
                <td>{$rows ['address']}</td>
                <td>{$rows ['salary']}</td>
                <td>{$rows ['start_date']}</td>
                <td>{$rows ['end_date']}</td>
                <td>{$rows ['emp_num']}</td>
                <td>
                    <form action=staffList.php>
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