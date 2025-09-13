SELECT 
AVG(len_trip_min), 
MAX(len_trip_min), 
MIN(len_trip_min) 
FROM trips 
WHERE len_trip_min >2;

----------------------------------------------------------

select member_casual, 
count(*) as number_of_rides 
from trips 
where len_trip_min >2 
group by member_casual;

----------------------------------------------------------

select avg(len_trip_min) as avg_len_members, 
max(len_trip_min) as max_len_members, 
min(len_trip_min) as min_len_members 
from trips 
where member_casual='member' and len_trip_min>2;

----------------------------------------------------------

select avg(len_trip_min) as avg_len_casual, 
max(len_trip_min) as max_len_casual, 
min(len_trip_min) as min_len_casual 
from trips

----------------------------------------------------------

CREATE OR REPLACE VIEW vw_avg_by_type AS SELECT member_casual, 
AVG(len_trip_min) AS avg_duration_min, 
COUNT(*) AS total_rides, 
ROUND(STDDEV_POP(len_trip_min),2) AS sd_duration 
FROM trips 
WHERE len_trip_min>2 
GROUP BY member_casual;

----------------------------------------------------------

CREATE OR REPLACE VIEW view_monthly_trips AS SELECT member_casual, 
YEAR(start_date) AS year_date, 
MONTH(start_date) AS month_date, 
COUNT(*) AS trips, 
AVG(len_trip_min) AS avg_duration_min 
FROM trips 
WHERE len_trip_min > 2 AND start_date IS NOT NULL 
GROUP BY member_casual, YEAR(start_date), MONTH(start_date) 
ORDER BY member_casual, YEAR(start_date), MONTH(start_date);

----------------------------------------------------------

CREATE OR REPLACE VIEW vw_hourly_by_type AS SELECT member_casual, 
HOUR(start_time) AS hour, 
COUNT(*) AS trips, 
AVG(len_trip_min) AS avg_duration_min 
FROM trips 
WHERE len_trip_min > 2 
GROUP BY member_casual, hour 
ORDER BY hour;

----------------------------------------------------------

CREATE OR REPLACE VIEW vw_avg_by_type_day AS SELECT member_casual, 
day_of_week, 
AVG(len_trip_min) AS avg_duration_min, 
COUNT(*) AS total_rides 
FROM trips 
WHERE len_trip_min > 2 
GROUP BY member_casual, day_of_week 
ORDER BY day_of_week;

----------------------------------------------------------

CREATE OR REPLACE VIEW vw_pct_short_trips AS SELECT member_casual, 
	SUM(CASE WHEN len_trip_min < 5 THEN 1 ELSE 0 END) / COUNT(*) * 100 AS pct_short 
FROM trips WHERE len_trip_min >2 
GROUP BY member_casual;
