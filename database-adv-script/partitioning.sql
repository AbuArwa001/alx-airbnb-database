-- Step 1: Create a new partitioned table
CREATE TABLE Booking_Partitioned (
    booking_id INT NOT NULL,
    property_id INT NOT NULL,
    user_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2),
    status VARCHAR(20),
    created_at TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- Step 2: Migrate data from original table
INSERT INTO Booking_Partitioned
SELECT * FROM Booking;

-- Step 3: Verify partition structure
SELECT 
    partition_name, 
    table_rows 
FROM 
    information_schema.partitions 
WHERE 
    table_name = 'Booking_Partitioned';

-- Step 4: Create indexes on partitioned table
CREATE INDEX idx_booking_partitioned_property ON Booking_Partitioned(property_id);
CREATE INDEX idx_booking_partitioned_user ON Booking_Partitioned(user_id);
CREATE INDEX idx_booking_partitioned_dates ON Booking_Partitioned(start_date, end_date);

-- Step 5: (Optional) Replace original table
-- RENAME TABLE Booking TO Booking_Old, Booking_Partitioned TO Booking;