use Travego;

# a.	How many females and how many male passengers traveled a minimum distance of 600 KMs?
select Gender, count(*) as traveled_a_minimum_distance_of_600KMs  from passengers where Distance >= 600 group by Gender;

# b.	Find the minimum ticket price of a Sleeper Bus. 
select min(price) from Price where Bus_Type like "Sleeper";

# c.	Select passenger names whose names start with character 'S' 
select passenger_name from passengers where upper(passenger_name) like "S%";

# d.	Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output.
select a.Passenger_name, a.Boarding_City, a.Destination_City, a.Bus_Type, a.Distance, b.Price 
from passengers a inner join price b on a.Bus_Type = b.Bus_Type and a.Distance = b.Distance order by Passenger_id;

# e1.	What are the passenger name(s) and the category for those who traveled 1000 KMs Sitting in a bus?  
select Passenger_name, Category, Distance, Bus_Type from passengers where Distance = 1000 and Bus_Type like 'Sitting'; #returns nothing.
select Passenger_name, Category, Distance, Bus_Type from passengers where Distance = 1000; #returns one row but the bus_type is sleeper.

# e2.	What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus 
select a.Passenger_name, a.Distance, a.Bus_Type, b.Price from passengers a inner join price b 
on a.Bus_Type = b.Bus_Type and a.Distance = b.Distance where a.Distance = 1000 and a.Bus_Type like 'Sitting'; #returns nothing.
select a.Passenger_name, a.Distance, a.Bus_Type, b.Price from passengers a inner join price b 
on a.Bus_Type = b.Bus_Type and a.Distance = b.Distance where a.Distance = 1000; #returns one row but the bus_type is sleeper.

# f.	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select a.Passenger_name, a.Destination_City as Boarding_City, a.Boarding_City as Destination_City, b.Distance, b.Bus_Type, b.Price 
from passengers a join price b on a.Distance = b.Distance where Passenger_name like 'Pallavi';

# g.	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
select distinct Distance from passengers order by Distance desc;
 
# h.	Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables 
select Passenger_name, (Distance *100/ (select sum(Distance) from passengers)) as percentage_distance_travelled from  passengers;