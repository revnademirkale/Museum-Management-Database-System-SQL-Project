DELIMITER //

CREATE PROCEDURE list_museum_exhibits(
    IN p_museum_id INT
)
BEGIN
    SELECT e_title, e_theme, start_date, end_date
    FROM Exhibit
    WHERE museum_id = p_museum_id;
END;
//

DELIMITER ;
CALL list_museum_exhibits(1);
