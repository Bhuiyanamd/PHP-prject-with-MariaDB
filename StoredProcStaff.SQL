DROP PROCEDURE IF EXISTS staffList;
DROP FUNCTION IF EXISTS deleteStaffByID;
DROP FUNCTION IF EXISTS insertStaff;

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
CREATE FUNCTION insertStaff (staff_id INT, staff_salary DOUBLE, staff_start_date DATE, staff_end_date DATE, staff_emp VARCHAR(5)) RETURNS INT
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
    FROM   staff 
    WHERE person_id = staff_id;
    
    IF v_pk_count = 0 THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM staff;

        INSERT INTO staff (person_id, salary, start_date, end_date, emp_num) VALUE (staff_id, staff_salary, staff_start_date, staff_end_date, staff_emp);

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM staff;
        
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
CREATE PROCEDURE staffList()
BEGIN
	SELECT p.id, p.last_name, p.first_name, p.DOB, p.address, s.salary, s.start_date, s.end_date, s.emp_num  FROM person p, staff s  WHERE p.id=s.person_id ORDER BY id DESC;
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
CREATE FUNCTION deleteStaffByID (staff_id INT) RETURNS INT
BEGIN

    -- Declare and initialize variables
	DECLARE v_result INT;
    DECLARE v_fk_count INT;
	DECLARE v1_fk_count INT;
    DECLARE v_row_count_before INT;
    DECLARE v_row_count_after INT;

    SET v_result = -1;
	SET v_fk_count = 0;
    SET v_row_count_before = 0;
    SET v_row_count_after = 0;

	-- Check if the ID is being referenced from the building table
    SELECT COUNT(*) 
    INTO v_fk_count 
    FROM   building 
    WHERE manager_id = staff_id;
	
	-- Check if the ID is being referenced from the building table
    SELECT COUNT(*) 
    INTO v1_fk_count 
    FROM   employee
    WHERE person_id = staff_id;

    IF (v_fk_count = 0) AND (v1_fk_count = 0) THEN
    
        -- Here when a FK does NOT exist
        SELECT COUNT(*) 
        INTO v_row_count_before
        FROM staff;

        DELETE FROM staff WHERE person_id = staff_id;

        SELECT COUNT(*) 
        INTO v_row_count_after
        FROM staff;
 
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

