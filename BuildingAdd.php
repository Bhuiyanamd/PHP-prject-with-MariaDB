<?php
include_once 'functions/functionsBuilding.php';
include_once 'header.php';

$manager = getIfSet ( "manager" );
$buildingId = getIfSet ( "buildingId" );
$buildingCode = getIfSet ( "buildingCode" );
$buildingName = getIfSet ( "buildingName" );
$buildingAddress = getIfSet ( "buildingAddress" );


if (isValid_and_set ( "manager" ) && is_numeric ( $_GET ['manager'] ) && isValid_and_set ( "buildingId" ) && isValid_and_set ( "buildingCode" ) && isValid_and_set ( "buildingName" )  && isValid_and_set ( "buildingAddress" )) {
    
    $insertResult = addBuilding ( $_GET ['manager'], $_GET ['buildingId'], $_GET ['buildingCode'], $_GET['buildingName'], $_GET ['buildingAddress'] );
    
    if ($insertResult == - 1)
        showErrorMessage ( "Failed to insert row ID $manager. PK repeated" );
    elseif ($insertResult == 0)
        showErrorMessage ( "Failed to insert row ID $person" );
    else
        showInfoMessage ( "Successfully inserted row ID $manager" );
} else if (isset ( $_GET ['btnAddbuilding'] ))
    showErrorMessage ( "Please enter valid values" );
   

?>
<form name="frmAddBuilding" accept-charset="BuildingAdd.php">
    <table border="0">
        <tr>
            <td width="90">
                <strong>Manager</strong>
            </td>
            <td>
               <select name=manager >
               <option value="NULL">Choose a manager</option>';
               <?php 
                    $dbc = getDBC ();
                    $result = $dbc->query('SELECT * from person, staff where person.id=staff.person_id');
                    while ($row = $result->fetch_assoc()) 
                   {
                       echo "<option value='".$row['ID']."'";
                   if (isset($_GET['manager']) && ($_GET['manager'] == $row['ID'])) 
                   {
                      echo 'selected';
                    }
                  echo ">(".$row['ID'].") &nbsp ".$row['LAST_NAME']."  &nbsp  ".$row['FIRST_NAME']."</option>\n";
                } 
                   ?>

                
                  
                    
               </select>
            </td>
        </tr>
        <tr>
            <td>
                <strong>Building ID:</strong>
            </td>
            <td>
                <input type=text name=buildingId value="<?= $buildingId ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Building Code:</strong>
            </td>
            <td>
                <input type=text name=buildingCode value="<?= $buildingCode ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Building Name:</strong>
            </td>
            <td>
                <input type=text name=buildingName value="<?= $buildingName ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Building Address:</strong> 
            </td>
            <td>
                <input type=text name=buildingAddress value="<?= $buildingAddress ?>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type=submit name=btnAddbuilding>Add</button>
                <button type=reset>Reset</button>
            </td>
        </tr>
    </table>
</form>

<?php
include_once 'footer.php';
?>