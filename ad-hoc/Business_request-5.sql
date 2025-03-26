--Business Request - 5: Identify Month with Highest Revenue for Each City
Generate a report that identifies the month with the highest revenue for each city. For each
city, display the month_name, the revenue amount for that month, and the percentage
contribution of that month's revenue to the city's total revenue.

--answer


with 
revenue_monthly as (
select 
c.city_name,
monthname(t.date) as month,
sum(fare_amount) as revenue
from fact_trips t 
join dim_city c
on t.city_id = c.city_id
group by c.city_id,month
),
revenue_ranking as (
select 
city_name,
month as highest_revenue_month,
revenue,
dense_rank() over(partition by city_name order by 	revenue desc) as revenue_rank
from revenue_monthly
),
revenue_total as (
select
city_name,
sum(revenue) as total_revenue
from revenue_monthly
group by city_name
)
select 
r.city_name,
r.highest_revenue_month,
r.revenue,
round((r.revenue/t.total_revenue)*100,2) as percentage_contribution
from revenue_ranking r
join  revenue_total t
on r.city_name = t.city_name
where r.revenue_rank=1;
