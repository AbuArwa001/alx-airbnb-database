-- query that retrieves all bookings along with the user details, property details, and payment details and save it on
EXPLAIN SELECT
    BK.property_id,
    BK.user_id,
    U.first_name,
    U.last_name
FROM
    Booking BK
LEFT JOIN AirBnB.User U on U.user_id = BK.user_id
LEFT JOIN AirBnB.Property P on BK.property_id = P.property_id
LEFT JOIN AirBnB.Payment P2 on BK.booking_id = P2.booking_id
;
-- -- This script creates indexes on the tables in the AirBnB database to improve query performance.
--
CREATE INDEX idx_booking_prop ON Booking (booking_id);
CREATE INDEX idx_booking_pay ON Booking (booking_id, property_id);

-- optimized query that retrieves all bookings along with the user details, property details, and payment details
EXPLAIN SELECT
    BK.property_id,
    BK.user_id,
    U.first_name,
    U.last_name
FROM
    Booking BK
LEFT JOIN AirBnB.User U on U.user_id = BK.user_id
LEFT JOIN AirBnB.Property P on BK.property_id = P.property_id
LEFT JOIN AirBnB.Payment P2 on BK.booking_id = P2.booking_id
WHERE
    BK.property_id IS NOT NULL
    AND BK.user_id IS NOT NULL
    AND U.first_name IS NOT NULL
    AND U.last_name IS NOT NULL
    AND P2.booking_id IS NOT NULL
ORDER BY
    BK.property_id,
    BK.user_id,
    U.first_name,
    U.last_name
LIMIT 1000
OFFSET 0;
--