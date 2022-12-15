<?php
include_once 'functions/functionsStaff.php';
include_once 'header.php';

$person = getIfSet ( "person" );
$salary = getIfSet ( "salary" );
$startDate = getIfSet ( "startDate" );
$endDate = getIfSet ( "endDate" );
$empNum = getIfSet ( "empNum" );
 

if (isValid_and_set ( "person" ) && is_numeric ( $_GET ['person'] ) && isValid_and_set ( "salary" ) && isValid_and_set ( "startDate" ) && isValid_and_set ( "empNum" )) {
    
    $insertResult = addStaff ( $_GET ['person'], $_GET ['salary'], $_GET ['startDate'], $_GET['endDate'], $_GET ['empNum'] );
    
    if ($insertResult == - 1)
        showErrorMessage ( "Failed to insert row ID $person. PK repeated" );
    elseif ($insertResult == 0)
        showErrorMessage ( "Failed to insert row ID $person" );
    else
        showInfoMessage ( "Successfully inserted row ID $person" );
} else if (isset ( $_GET ['btnAddstaff'] ))
    showErrorMessage ( "Please enter valid values" );
   

?>
<form name="frmAddStaff" accept-charset="StaffAdd.php">
    <table border="0">
        <tr>
            <td width="90">
                <strong>Person</strong>
            </td>
            <td>
               <select name=person >
          <option value="NULL">Choose a person</option>';
            <?php 
          $dbc = getDBC ();
          $result = $dbc->query('SELECT * from person');
          while ($row = $result->fetch_assoc()) 
          {
            echo "<option value='".$row['ID']."'";
            if (isset($_GET['person']) && ($_GET['person'] == $row['ID'])) 
            {
                echo 'selected';
            }
            echo ">(".$row['ID'].") &nbsp ".$row['LAST_NAME']." &nbsp ".$row['FIRST_NAME']."</option>\n";
         }   
      ?>
      
          </select>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Salary:</strong>
            </td>
            <td>
                <input type=text name=salary value="<?= $salary ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Start Date:</strong>
            </td>
            <td>
                <input type=text name=startDate value="<?= $startDate?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>End Date:</strong>
            </td>
            <td>
                <input type=text name=endDate value="<?= $endDate ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Emp Number:</strong>
            </td>
            <td>
                <input type=text name=empNum value="<?= $empNum ?>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type=submit name=btnAddstaff>Add</button>
                <button type=reset>Reset</button>
            </td>
        </tr>
    </table>
</form>

<?php
include_once 'footer.php';
?>