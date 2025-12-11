DROP TRIGGER IF EXISTS trigger_2_artwork_value;
DELIMITER //

CREATE TRIGGER trigger_2_artwork_value
AFTER UPDATE ON Artwork
FOR EACH ROW
BEGIN
  IF OLD.art_value <> NEW.art_value THEN
    INSERT INTO artwork_value_history (artwork_id, old_value, new_value)
    VALUES (OLD.artwork_id, OLD.art_value, NEW.art_value);
  END IF;
END;
//

DELIMITER ;
SHOW TRIGGERS;
UPDATE Artwork
SET art_value = art_value + 10000
WHERE artwork_id = 3;
SELECT * FROM artwork_value_history;
