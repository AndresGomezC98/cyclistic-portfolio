# Appendices – Cyclistic Case Study

This document summarizes the technical steps, transformations, and formulas used during the cleaning and preparation phase.

## 🧹 Data Cleaning (Excel)
- Extract date: `=DATE(YEAR(C2), MONTH(C2), DAY(C2))`
- Extract time: `=TEXT(C2,"hh:mm:ss")`
- Trip duration: `=IF(F2<D2,(F2+1)-D2,F2-D2)`
- Convert duration to minutes: `=HOUR(P2)*60 + MINUTE(P2) + SECOND(P2)/60`
- Day of week: `=WEEKDAY(C2,1)`
- Weekday name: nested `IF` function (Sunday–Saturday)
- Distance (approx): `=SQRT((M2-K2)^2+(N2-L2)^2)`
- Trip validation: `=IF(OR(Q2>=2, AND(Q2>=0.03, S2>=0.002)), "Valid trip", "Invalid trip")`

## 🗄 SQL Processing
- Table creation (`create_tables.sql`)
- Data loading with `LOAD DATA INFILE`
- Views created for monthly, daily, hourly analysis and short-trip percentages.
