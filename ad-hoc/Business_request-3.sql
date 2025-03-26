--Business Request - 3: City-Level Repeat Passenger Trip Frequency Report
Generate a report that shows the percentage distribution of repeat passengers by the
number of trips they have taken in each city. Calculate the percentage of repeat passengers
who took 2 trips, 3 trips, and so on, up to IO trips.
Each column should represent a trip count category, displaying the percentage of repeat
passengers who fall into that category out of the total repeat passengers for that city.
This report will help identify cities with high repeat trip frequency, which can indicate strong
customer loyalty or frequent usage pattems.

--answer

select 
round((sum(case WHEN trip_count= "2-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "2-Trips" ,
round((sum(case WHEN trip_count= "3-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "3-Trips" ,
round((sum(case WHEN trip_count= "4-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "4-Trips" ,
round((sum(case WHEN trip_count= "5-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "5-Trips" ,
round((sum(case WHEN trip_count= "6-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "6-Trips" ,
round((sum(case WHEN trip_count= "7-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "7-Trips" ,
round((sum(case WHEN trip_count= "8-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "8-Trips" ,
round((sum(case WHEN trip_count= "9-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "9-Trips" ,
round((sum(case WHEN trip_count= "10-Trips" THEN repeat_passenger_count ELSE 0 END) * 100.0)/nullif(sum(repeat_passenger_count),0),	 2) AS "10-Trips" 
from dim_repeat_trip_distribution r 
join dim_city c
on c.city_id = r.city_id
group by c.city_id
order by c.city_name;

