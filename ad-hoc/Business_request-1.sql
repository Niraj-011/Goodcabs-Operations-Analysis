--Business Request - 1: City-Level Fare and Trip Summary Report
Generate a report that displays the total trips, average fare per km, average fare per trip, and
the percentage contribution of each city's trips to the overall trips. This report will help in
assessing trip vdume, pricing efficiency, and each city's contribution to the overall trip count.




-- answer

SELECT
c.city_name,
count(trip_id) as total_trips,
round((sum(fare_amount)/sum(distance_travelled_km)),2) as avg_fare_per_km,
round(avg(fare_amount),2)	as average_fare_per_trip,
round((count(trip_id)/(select count(trip_id) from fact_trips))*100,2) as pt_contribution_of_total_trips
from dim_city c
join fact_trips t
on c.city_id = t.city_id
group by c.city_name;
