-- Insert Roles
INSERT INTO Role (role_id, role_name) VALUES
(1, 'guest'),
(2, 'host'),
(3, 'admin');

-- Insert Users (5 users)
INSERT INTO User (user_id, role_id, first_name, last_name, email, password_hash, phone_number, created_at) VALUES
(1, 3, 'Admin', 'User', 'admin@airbnb.com', '$2a$10$xJwL5v5Jz6UZJZJZJZJZJe', '+1234567890', '2023-01-01 00:00:00'),
(2, 2, 'John', 'Smith', 'john.smith@example.com', '$2a$10$xJwL5v5Jz6UZJZJZJZJZJe', '+1987654321', '2023-01-15 10:30:00'),
(3, 2, 'Sarah', 'Johnson', 'sarah.j@example.com', '$2a$10$xJwL5v5Jz6UZJZJZJZJZJe', '+1654321890', '2023-02-10 14:15:00'),
(4, 1, 'Michael', 'Brown', 'michael.b@example.com', '$2a$10$xJwL5v5Jz6UZJZJZJZJZJe', '+1876543210', '2023-03-05 09:45:00'),
(5, 1, 'Emily', 'Davis', 'emily.d@example.com', '$2a$10$xJwL5v5Jz6UZJZJZJZJZJe', '+1765432890', '2023-03-20 16:20:00');

-- Insert Properties (5 properties)
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
(1, 2, 'Cozy Downtown Apartment', 'Modern 1-bedroom apartment in the heart of the city', 'New York, NY', 120.00, '2023-01-20 11:00:00', '2023-01-20 11:00:00'),
(2, 2, 'Beachfront Villa', 'Luxury villa with private beach access', 'Miami, FL', 350.00, '2023-01-25 09:30:00', '2023-02-15 14:00:00'),
(3, 3, 'Mountain Cabin', 'Rustic cabin with stunning mountain views', 'Aspen, CO', 180.00, '2023-02-15 10:15:00', '2023-03-10 12:30:00'),
(4, 3, 'City Loft', 'Spacious loft with industrial chic design', 'Chicago, IL', 150.00, '2023-02-20 14:45:00', '2023-02-20 14:45:00'),
(5, 2, 'Lake House', 'Charming house with private dock on the lake', 'Lake Tahoe, CA', 250.00, '2023-03-01 08:00:00', '2023-03-20 10:15:00');

-- Insert Bookings (5 bookings)
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(1, 1, 4, '2023-04-01', '2023-04-05', 480.00, 'confirmed', '2023-03-10 15:30:00'),
(2, 2, 5, '2023-05-15', '2023-05-20', 1750.00, 'confirmed', '2023-03-15 11:20:00'),
(3, 3, 4, '2023-06-10', '2023-06-15', 900.00, 'pending', '2023-03-20 09:45:00'),
(4, 1, 5, '2023-07-01', '2023-07-07', 720.00, 'confirmed', '2023-03-25 14:10:00'),
(5, 4, 4, '2023-08-12', '2023-08-15', 450.00, 'canceled', '2023-04-01 10:30:00');

-- Insert Payments (5 payments)
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(1, 1, 480.00, '2023-03-10 15:35:00', 'credit_card'),
(2, 2, 1750.00, '2023-03-15 11:25:00', 'paypal'),
(3, 4, 720.00, '2023-03-25 14:15:00', 'credit_card'),
(4, 3, 300.00, '2023-03-20 09:50:00', 'credit_card'),
(5, 5, 450.00, '2023-04-01 10:35:00', 'paypal');

-- Insert Reviews (5 reviews)
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(1, 1, 4, 5, 'Fantastic location and very clean apartment!', '2023-04-06 10:00:00'),
(2, 2, 5, 4, 'Beautiful villa, but the beach was smaller than expected', '2023-05-21 14:30:00'),
(3, 1, 5, 5, 'Perfect stay, would definitely book again!', '2023-07-08 09:15:00'),
(4, 3, 4, 3, 'Nice views but the cabin was a bit cold at night', '2023-06-16 11:45:00'),
(5, 4, 4, 4, 'Great loft with lots of space and good amenities', '2023-08-16 16:20:00');

-- Insert Messages (5 messages)
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(1, 4, 2, 'Hi John, is the apartment available for early check-in?', '2023-03-28 08:30:00'),
(2, 2, 4, 'Yes, we can arrange for 1pm check-in. Let me know if that works.', '2023-03-28 09:15:00'),
(3, 5, 3, 'Is there parking available at the mountain cabin?', '2023-06-05 14:20:00'),
(4, 3, 5, 'Yes, there is a private parking spot included with your booking.', '2023-06-05 15:05:00'),
(5, 4, 3, 'Do you provide towels at the city loft?', '2023-08-10 11:40:00');