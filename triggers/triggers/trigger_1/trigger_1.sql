DELIMITER //

CREATE TRIGGER trigger_4_min_ticket_price
BEFORE INSERT ON Ticket
FOR EACH ROW
BEGIN
  IF NEW.t_price <= 0 THEN
    SET NEW.t_price = 30;
  END IF;
END;
//

DELIMITER ;
INSERT INTO Ticket (ticket_id, t_price, issue_date, museum_id, curator_id)
VALUES (999, -50, '2025-02-15', 1, 1);
