SELECT
    ROUND(
        COUNT(DISTINCT a.player_id)::numeric /
        (
            SELECT COUNT(DISTINCT player_id)
            FROM Activity
        ),
        2
    ) AS fraction
FROM Activity a
JOIN Activity b
    ON a.player_id = b.player_id
    AND b.event_date = a.event_date + INTERVAL '1 day'
WHERE a.event_date = (
    SELECT MIN(event_date)
    FROM Activity
    WHERE player_id = a.player_id
);