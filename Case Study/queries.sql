-- Create database
CREATE DATABASE cyclistic;

-- Create table
  CREATE TABLE trips (
    ride_id VARCHAR(50),
    rideable_type VARCHAR(50),
    start_date DATE,
    start_time TIME,
    end_date DATE,
    end_time TIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(50),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(50),
    start_lat DECIMAL(10,7) NULL,
    start_lng DECIMAL(10,7) NULL,
    end_lat DECIMAL(10,7) NULL,
    end_lng DECIMAL(10,7) NULL,
    member_casual VARCHAR(20),
    len_trip TIME,
    len_trip_min DECIMAL(10,7) NULL,
    day_of_week VARCHAR(50),
    validation_trip VARCHAR(50)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/202507-divvy-tripdata.csv'
INTO TABLE trips
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ride_id, rideable_type, @start_date, start_time, @end_date, end_time,
 start_station_name, start_station_id, end_station_name, end_station_id,
 start_lat, start_lng, end_lat, end_lng, member_casual, len_trip, len_trip_min, day_of_week, validation_trip)
SET
    start_date = STR_TO_DATE(NULLIF(@start_date,''), '%Y-%m-%d %H:%i:%s'),
    end_date   = STR_TO_DATE(NULLIF(@end_date,''),   '%Y-%m-%d %H:%i:%s');