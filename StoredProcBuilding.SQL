DROP PROCEDURE IF EXISTS buildingList;
DROP FUNCTION IF EXISTS deleteBuildingByID;
DROP FUNCTION IF EXISTS insertBuilding;

DELIMITER $$

/*
 * Function to add a new person to the table
 * The function checks if the person ID already exists.
 * If the ID doesn't exist, the insertion qurey is executed
 * 
 * The function returns these codes
 * -1: insert failed, ID exists
 *  0: insert failed
 *  1: insert OK
 */
CREATE FUNCTION insertBuilding (mgr_id INT, bld_id INT, bld_code VARCHAR(5), bld_name VARCHAR(32), bld_address VARCHAR(32)) RETURNS INT
BEGIN
	
	-- Declare and initialize variables
    DECLARE v_result INT;
    DECLARE v_pk_count INT;
    DECLARE v_row_count_before INT;
    DECLARE v_row_count_after INT;

    SET v_result = -1;
    SET v_pk_count = 0;
    SET v_row_count_before = 0;
    SET v_row_count_after = 0;
	
    -- Check if the ID is already used
    SELECT COUNT(*) 
    INTO v_pk_count 
    FROM   building 
    WHERE manager_id = mgr_id; 
    
    IF v_pk_count = 0 THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM building;

        INSERT INTO building (manager_id, id, code, name, address) VALUE (mgr_id, bld_id, bld_code, bld_name, bld_address);

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM building;
        
        /*
         * Compare the row count before and after.
         * If the difference is 0, then the delete did not succeed
         */
        IF v_row_count_after - v_row_count_before = 1 THEN
            -- insert succeeded
            SET v_result = 1;
        ELSE
            -- insert failed
            SET v_result = 0;
        END IF;
        
    END IF;
    
    return v_result;
END $$

/*
 * Procedure for returning all rows in the person table
 */
CREATE PROCEDURE buildingList()
BEGIN
	SELECT b.manager_id, s.emp_num, p.last_name, p.first_name, b.id, b.code, b.name, b.address   FROM person p, staff s, building b  WHERE p.id=s.person_id and b.manager_id=s.person_id ORDER BY id DESC;
END $$
/*
 * Function for deleting a record from the person table
 * The function checks if the person ID to be deleted is being referenced by the staff table (FK).
 * If a FK exists, then the delete will not be allowed.
 * 
 * The function returns these codes
 * -1: delete failed a FK exists
 *  0: delete failed
 *  1: delete OK
 */
CREATE FUNCTION deleteBuildingByID (bld_id INT) RETURNS INT
BEGIN

    -- Declare and initialize variables
	DECLARE v_result INT;
    DECLARE v_fk_count INT;
    DECLARE v_row_count_before INT;
    DECLARE v_row_count_after INT;

    SET v_result = -1;
	SET v_fk_count = 0;
    SET v_row_count_before = 0;
    SET v_row_count_after = 0;

	-- Check if the ID is being referenced from the employee table
    SELECT COUNT(*) 
    INTO v_fk_count 
    FROM   employee 
    WHERE building_id = bld_id;
 
    IF v_fk_count = 0 THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM building;

        DELETE FROM building WHERE id = bld_id;

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM building;

        /*
         * Compare the row count before and after.
         * If the difference is 0, then the delete did not succeed
         */
        IF v_row_count_before - v_row_count_after != 0 THEN
            -- Delete succeeded
            SET v_result = 1;
        ELSE
            -- Delete failed
            SET v_result = 0;
        END IF;
    END IF;

  return v_result;
END $$

DELIMITER ;

