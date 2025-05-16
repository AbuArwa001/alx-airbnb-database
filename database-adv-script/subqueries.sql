use AirBnB;

--- All properties where the average rating is greater than 4.0 using a subquery
SELECT
    *
FROM
    Property P
WHERE
    (
        SELECT
            AVG(R.rating)
        FROM
            Review R
        WHERE
            P.property_id = R.property_id
    ) > 4.0
;

SELECT 
    *
FROM User u
WHERE (
    SELECT COUNT(*)
    FROM Booking b
    WHERE b.user_id = u.user_id  -- This correlation links the subquery to the outer query
) > 3;