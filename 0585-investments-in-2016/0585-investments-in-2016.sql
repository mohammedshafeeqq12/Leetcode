SELECT
    ROUND(SUM(i.tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance i
JOIN (
    SELECT
        tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
) AS duplicate_tiv
    ON i.tiv_2015 = duplicate_tiv.tiv_2015
JOIN (
    SELECT
        lat,
        lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
) AS unique_location
    ON i.lat = unique_location.lat
    AND i.lon = unique_location.lon;