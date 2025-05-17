-- This script demonstrates the use of Common Table Expressions (CTEs) to aggregate data
-- and perform window functions in SQL. It retrieves user information along with the number of bookings each user has made.
WITH CTE_BOOKING AS (
    SELECT
        b.user_id as uid,
        COUNT(b.user_id) AS NOB
    FROM
        AirBnB.Booking b
    GROUP BY
        b.user_id
)
SELECT
    us.user_id,
    us.first_name,
    us.last_name,
    COALESCE(CTE_BOOKING.NOB, 0) AS number_of_bookings
FROM
    User us
LEFT JOIN CTE_BOOKING ON us.user_id = CTE_BOOKING.uid
ORDER BY
    us.user_id;

-- This script demonstrates the use of window functions to calculate the running total of payments for each user.
WITH CTE_BOOKINGS AS (
    SELECT
        property_id,
        COUNT(booking_id) AS book_count
    FROM
        AirBnB.Booking
    GROUP BY
        property_id
)
SELECT
    pr.name,
    BK.property_id,
    pr.host_id,
    pr.price_per_night,
    COALESCE(BK.book_count, 0) AS number_of_bookings,
    ROW_NUMBER() OVER (ORDER BY BK.book_count DESC) AS PROPERTY_ROW,
    RANK() OVER (ORDER BY BK.book_count DESC) AS PROPERTY_RANK
FROM
    Property pr
LEFT JOIN CTE_BOOKINGS BK ON BK.property_id = pr.property_id
;