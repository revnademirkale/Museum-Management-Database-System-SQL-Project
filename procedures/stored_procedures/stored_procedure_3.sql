DELIMITER //

CREATE PROCEDURE artist_total_value(
    IN p_artist_id INT
)
BEGIN
    SELECT 
        a.a_name AS artist_name,
        SUM(ar.art_value) AS total_art_value,
        COUNT(*) AS artwork_count
    FROM Artist a
    JOIN Artwork ar ON a.artist_id = ar.artist_id
    WHERE a.artist_id = p_artist_id
    GROUP BY a.artist_id;
END;
//

DELIMITER ;
CALL artist_total_value(1);
