USE ola;

-- Question 1: Completed vs cancelled share
SELECT booking_status,
       COUNT(*) AS bookings,
       ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS pct
FROM ride_bookings
GROUP BY booking_status
ORDER BY bookings DESC;

-- Question 2: Why do rides get cancelled?
SELECT 'Customer' AS cancelled_by,
       customer_cancel_reason AS reason,
       COUNT(*) AS cancellations
FROM ride_bookings
WHERE customer_cancel_reason IS NOT NULL
GROUP BY customer_cancel_reason
UNION ALL
SELECT 'Driver',
       driver_cancel_reason,
       COUNT(*)
FROM ride_bookings
WHERE driver_cancel_reason IS NOT NULL
GROUP BY driver_cancel_reason
ORDER BY cancelled_by, cancellations DESC;

-- Question 3a: Busiest hours
SELECT HOUR(ride_time) AS hour_of_day,
       COUNT(*) AS bookings
FROM ride_bookings
GROUP BY hour_of_day
ORDER BY bookings DESC
LIMIT 5;

-- Question 3b: Busiest weekdays
SELECT DAYNAME(ride_date) AS weekday,
       COUNT(*) AS bookings
FROM ride_bookings
GROUP BY weekday
ORDER BY bookings DESC;

-- Question 4: Revenue by vehicle type (completed rides only)
SELECT vehicle_type,
       COUNT(*) AS completed_rides,
       ROUND(SUM(booking_value), 2) AS revenue,
       ROUND(AVG(booking_value), 2) AS avg_booking_value,
       RANK() OVER (ORDER BY SUM(booking_value) DESC) AS revenue_rank
FROM ride_bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY revenue_rank;