SELECT
    new_id AS id,
    student
FROM (
    SELECT
        id,
        student,
        CASE
            WHEN id = (SELECT MAX(id) FROM Seat)
                 AND id % 2 = 1 THEN id
            WHEN id % 2 = 1 THEN id + 1
            ELSE id - 1
        END AS new_id
    FROM Seat
) AS swapped_seats
ORDER BY id;