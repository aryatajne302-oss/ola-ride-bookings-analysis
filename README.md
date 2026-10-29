\# OLA Ride Bookings: SQL + Power BI Analysis



!\[Dashboard](ola\_dashboard.png)



Analysis of 150,000 ride bookings (public practice dataset from Kaggle) using MySQL and Power BI.



\## Key findings

\- Only 62% of bookings were completed. Driver cancellations (18%) were about 2.6x customer cancellations (7%).

\- Cancel reasons were spread almost evenly, so there is no single dominant cause.

\- 44% of customer cancellations were linked to driver behaviour.

\- Auto, Go Mini and Go Sedan brought in about 63% of completed-ride revenue. Average booking value was similar across vehicles (about 503 to 512), so revenue follows ride volume.



\## Skills used

GROUP BY, CASE WHEN, UNION ALL, window functions, Power BI slicers, DAX measures (completion rate, cancel rate, completed revenue).



\## Notes

\- The dataset appears synthetic, so the findings show the method, not real Ola data.

\- Revenue = booking value of completed rides only.



\## How to run

Download the dataset from Kaggle, load it into MySQL, then run `ola\_analysis.sql`.



\## Files

\- `ola\_analysis.sql`: the queries

\- `ola\_dashboard.png`: dashboard screenshot

