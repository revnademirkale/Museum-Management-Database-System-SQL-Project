DELIMITER //

CREATE PROCEDURE create_ticket_auto(
    IN p_museum_id INT,
    IN p_curator_id INT,
    IN p_issue_date DATE,
    OUT p_ticket_id INT
)
BEGIN
    DECLARE calc_price INT;

    
    SELECT 
        CASE
            WHEN established_year >= 2010 THEN 70
            WHEN established_year >= 2000 THEN 50
            ELSE 40
        END
    INTO calc_price
    FROM Museum
    WHERE museum_id = p_museum_id;

    
    SET p_ticket_id = (SELECT IFNULL(MAX(ticket_id), 1000) + 1 FROM Ticket);

    
    INSERT INTO Ticket (ticket_id, t_price, issue_date, museum_id, curator_id)
    VALUES (p_ticket_id, calc_price, p_issue_date, p_museum_id, p_curator_id);
END;
//

DELIMITER ;
CALL create_ticket_auto(1, 1, '2025-02-20', @tid);
SELECT @tid;
SELECT * FROM Ticket WHERE ticket_id = @tid;
