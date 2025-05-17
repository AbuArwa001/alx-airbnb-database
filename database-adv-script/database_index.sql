
EXPLAIN (WITH CTE_BOOKINGS AS (SELECT property_id, COUNT(booking_id) AS book_count FROM AirBnB.Booking GROUP BY property_id )
SELECT pr.name, BK.property_id, pr.host_id, pr.price_per_night, COALESCE(BK.book_count, 0) AS number_of_bookings, ROW_NUMBER() OVER (ORDER BY BK.book_count DESC) AS PROPERTY_ROWS, RANK() OVER (ORDER BY BK.book_count DESC) AS PROPERTY_RANK FROM Property pr LEFT JOIN
CTE_BOOKINGS BK ON BK.property_id = pr.property_id)  \G


EXPLAIN SELECT * FROM Property P WHERE (SELECT AVG(R.rating) FROM Review R WHERE P.property_id = R.property_id) > 4.0 \G
--

-- This script creates indexes on the tables in the AirBnB database to improve query performance.


CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_payment_booking ON Payment(booking_id);
CREATE INDEX idx_review_property ON Review(property_id);
CREATE INDEX idx_review_user ON Review(user_id);
CREATE INDEX idx_message_sender ON Message(sender_id);
CREATE INDEX idx_message_recipient ON Message(recipient_id);