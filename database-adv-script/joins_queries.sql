-- retrieve all bookings and the respective users who made those bookings
use AirBnB;
SELECT
    *
FROM
    Booking bk
JOIN
    AirBnB.User U on bk.user_id = U.user_id
;

-- retrieve all properties and their reviews, including properties that have no reviews
SELECT
    *
FROM
    Property pr
LEFT JOIN
    AirBnB.Review R on pr.property_id = R.property_id;
--     payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     payment_method VARCHAR(50) NOT NULL,
--     FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
-- );
--
-- -- retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    *
FROM
    AirBnB.User U
FULL OUTER JOIN
    Booking bk on U.user_id = bk.user_id;

-- retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user
SELECT
    *
FROM
    AirBnB.User U
LEFT JOIN
    Booking bk on U.user_id = bk.user_id
UNION
SELECT
    *
FROM
    AirBnB.User U
RIGHT JOIN
    Booking bk on U.user_id = bk.user_id;