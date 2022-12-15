<?php
include_once 'functions/functionsPerson.php';
include_once 'header.php';

$pID = getIfSet ( "pID" );
$pFName = getIfSet ( "pFName" );
$pLName = getIfSet ( "pLName" );
$pDOB = getIfSet ( "pDOB" );
$pAdd = getIfSet ( "pAdd" );

if (isValid_and_set ( "pID" ) && is_numeric ( $_GET ['pID'] ) && isValid_and_set ( "pFName" ) && isValid_and_set ( "pLName" ) && isValid_and_set ( "pDOB" ) && isValid_and_set ( "pAdd" )) {
    
    $insertResult = addPerson ( $_GET ['pID'], $_GET ['pFName'], $_GET ['pLName'], $_GET ['pDOB'], $_GET ['pAdd'] );
    
    if ($insertResult == - 1)
        showErrorMessage ( "Failed to insert row ID $pID. PK repeated" );
    elseif ($insertResult == 0)
        showErrorMessage ( "Failed to insert row ID $pID" );
    else
        showInfoMessage ( "Successfully inserted row ID $pID" );
} else if (isset ( $_GET ['btnAddPerson'] ))
    showErrorMessage ( "Please enter valid values" );

?>
<form name="frmAddPerson" accept-charset="personAdd.php">
    <table border="0">
        <tr>
            <td width="90">
                <strong>ID:</strong>
            </td>
            <td>
                <input type=text name=pID value="<?=$pID ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>First Name:</strong>
            </td>
            <td>
                <input type=text name=pFName value="<?= $pFName ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Last Name:</strong>
            </td>
            <td>
                <input type=text name=pLName value="<?= $pLName ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>DOB:</strong>
            </td>
            <td>
                <input type=text name=pDOB value="<?= $pDOB ?>" />
            </td>
        </tr>
        <tr>
            <td>
                <strong>Address:</strong>
            </td>
            <td>
                <input type=text name=pAdd value="<?= $pAdd ?>" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type=submit name=btnAddPerson>Add</button>
                <button type=reset>Reset</button>
            </td>
        </tr>
    </table>
</form>

<?php
include_once 'footer.php';
?>