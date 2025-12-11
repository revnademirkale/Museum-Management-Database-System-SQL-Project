DELIMITER //

CREATE TRIGGER trigger_3_assign_sponsor
AFTER INSERT ON Exhibit
FOR EACH ROW
BEGIN
  DECLARE spid INT;

  
  SELECT sponsor_id INTO spid
  FROM Museum_Sponsor
  WHERE museum_id = NEW.museum_id
  LIMIT 1;

 
  IF spid IS NOT NULL THEN
    INSERT INTO Sponsor_Exhibit (sponsor_id, exhibit_id)
    VALUES (spid, NEW.exhibit_id);
  END IF;
END;
//

DELIMITER ;
INSERT INTO Exhibit (exhibit_id, e_title, e_theme, start_date, end_date, museum_id, curator_id)
VALUES (11, 'AI Test Exhibit', 'Technology', '2025-01-01', '2025-02-01', 1, 1);
SELECT * FROM Sponsor_Exhibit WHERE exhibit_id = 11;
