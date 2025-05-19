# SQL Query Performance Optimization Guide

## Objective
Optimize a complex booking system query by analyzing performance issues and implementing improvements.

## Initial Query Analysis

### Original Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.title AS property_title,
    p.address,
    pt.type_name AS property_type,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.method AS payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
JOIN 
    property_types pt ON p.property_type_id = pt.property_type_id
LEFT JOIN 
    payments pay ON b.booking_id = pay.booking_id
ORDER BY 
    b.start_date DESC;
```
Performance Issues Identified

- Unnecessary Data Retrieval:

- Joins all tables even when some data isn't needed

- No filters applied (retrieves entire dataset)

Sorting Challenges:

- Large result set being sorted by start_date

### Indexing Problems:

- Missing indexes on join columns

- No index on the sort column (start_date)

Join Inefficiencies:

LEFT JOIN with payments table may be unnecessary if most bookings have payments

### Potential for duplicate rows from payments join

#### Optimized Solution
Refactored Query
```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.title AS property_title,
    pt.type_name AS property_type,
    pay.amount,
    pay.payment_method
FROM 
    bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN properties p ON b.property_id = p.property_id
INNER JOIN property_types pt ON p.property_type_id = pt.property_type_id
LEFT JOIN (
    SELECT 
        booking_id, 
        SUM(amount) as amount,
        STRING_AGG(DISTINCT method, ', ') as payment_method
    FROM payments
    GROUP BY booking_id
) pay ON b.booking_id = pay.booking_id
WHERE 
    b.start_date >= CURRENT_DATE - INTERVAL '6 months'
ORDER BY 
    b.start_date DESC
LIMIT 1000;
```
#### Key Improvements
- Reduced data scope: Limited to last 6 months with row limit

- Simplified payments: Aggregated payment data to avoid duplicates

- Selective joins: Used INNER JOIN where referential integrity exists

- Removed unused fields: Eliminated unnecessary columns

#### Recommended Indexes
```sql
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
```
#### Additional Recommendations
- Query Splitting: Consider separate queries for core booking data vs. supplemental information

- Pagination: Implement OFFSET/LIMIT for large datasets

- Monitoring: Regularly analyze query performance with EXPLAIN ANALYZE

- Materialized Views: For frequently accessed complex data combinations