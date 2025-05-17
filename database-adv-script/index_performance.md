# Table Optimization
 - analyzing the table to see room of improvement.
---
## conclusion
  After finding the cost and time it takes i added index on places where searching, and finding is Done,
~~~
    CREATE INDEX idx_user_email ON User(email);
    CREATE INDEX idx_property_host ON Property(host_id);
    CREATE INDEX idx_booking_property ON Booking(property_id);
    CREATE INDEX idx_booking_user ON Booking(user_id);
    CREATE INDEX idx_payment_booking ON Payment(booking_id);
    CREATE INDEX idx_review_property ON Review(property_id);
    CREATE INDEX idx_review_user ON Review(user_id);
    CREATE INDEX idx_message_sender ON Message(sender_id);
    CREATE INDEX idx_message_recipient ON Message(recipient_id);
~~~