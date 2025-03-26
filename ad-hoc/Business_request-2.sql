--Business Request - 2: Monthly City-Level Trips Target Performance Report
Generate a report that evaluates the target performance for trips at the monthly and city
level. For each city and month, compare the actual total trips with the target trips and
categorise the performance as follows:
• If actual trips are greater than target trips, mark it as "Above Target".
• If actual trips are less than or equal to target trips, mark it as "Below Target".
Additionally, calculate the % difference between actual and target trips to quantify the
performance gap.


--answer

with 
target as (
select monthname(month) as month_name,city_id, total_target_trips as target_trips from targets_db.monthly_target_trips),
actual as (
select city_id,monthname(date) as month_name, count(trip_id) as actual_trips from fact_trips	group by city_id,month_name)

select 
c.city_name,a.month_name,a.actual_trips,t.target_trips,
case when actual_trips-target_trips >0 then "Above Target"
else "Below Target"
end as Performance_Status,
round(100*(a.actual_trips-target_trips)/target_trips,2) as pc_diff
from actual a 
join target t 
on a.city_id  = t.city_id
and a.month_name = t.month_name
join dim_city c
 on a.city_id = c.city_id
 order by city_name, month_name;
 
 
