DROP PROCEDURE IF EXISTS personList;
DROP FUNCTION IF EXISTS deletePersonByID;
DROP FUNCTION IF EXISTS insertPerson;

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
CREATE FUNCTION insertPerson (p_id INT, p_first_name VARCHAR(32), p_last_name VARCHAR(32), p_dob DATE, p_address VARCHAR(32)) RETURNS INT
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
    FROM   person 
    WHERE id = p_id;
    
    IF v_pk_count = 0 THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM person;

        INSERT INTO person (id, first_name, last_name, dob, address) VALUE (p_id, p_first_name, p_last_name, p_dob, p_address);

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM person;
        
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
CREATE PROCEDURE personList()
BEGIN
	SELECT id, last_name, first_name, DOB, address FROM person ORDER BY id DESC;
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
CREATE FUNCTION deletePersonByID (p_id INT) RETURNS INT
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

	-- Check if the ID is being referenced from the staff table
    SELECT COUNT(*) 
    INTO v_fk_count 
    FROM   staff 
    WHERE person_id = p_id;

    IF v_fk_count = 0 THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM person;

        DELETE FROM person WHERE id = p_id;

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM person;

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

