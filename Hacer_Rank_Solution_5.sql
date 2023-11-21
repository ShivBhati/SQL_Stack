--                                        [     Challenges       ]


-- <!-- Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges 
-- created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the 
-- same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and 
-- the count is less than the maximum number of challenges created, then exclude those students from the result. -->

With 
ds1 as
(Select
h.hacker_id, h.name, count(c.challenge_id) as tc from hackers h left join challenges c on h.hacker_id = c.hacker_id 
group by h.hacker_id, h.name 
 ),
ds2 as 
(
Select tc, count(tc) as tc1 from ds1 
Where tc < (Select max(tc) from ds1)  
group by tc
having count(tc) > 1 
)
Select h.hacker_id, h.name, count(c.challenge_id) as tc2 from hackers h left join challenges c on h.hacker_id = c.hacker_id 
group by h.hacker_id, h.name 
having count(c.challenge_id) not in (select tc from Ds2)
order by count(c.challenge_id) desc, h.hacker_id











