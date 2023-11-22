--          [ 15 Days of Learning SQL ]

-- <!-- Julia conducted a  days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.
-- Write a query to print total number of unique hackers who made at least  submission each day (starting on the first day of the contest),
-- and find the hacker_id and name of the hacker who made maximum number of submissions each day. 
-- If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date. -->

With
final_1 as 
(
Select submission_date, count( distinct hacker_id) Uniqhacksub from (
Select submission_date, hacker_id,  
        case 
              when
                s2.submission_date = (select min(mins.submission_date) from submissions mins) Then 1 
              else 
                1 + (select count(distinct s1.submission_date) from submissions s1 
                      where s1.hacker_id = s2.hacker_id and s1.submission_date < s2.submission_date) 
              end as  ctofsubmissions,
        Dense_Rank() over(Order by submission_date) as daterank
        
from 
    submissions  s2
) s3
where s3.ctofsubmissions = s3.daterank
Group by s3.submission_date
),
Unqsubechday
as
(
select submission_date, hacker_id, count(1) as subcount from submissions
group by submission_date, hacker_id
),
maxsubeachday as
(
Select *, row_number() over(Partition by submission_date order by subcount desc, hacker_id) as rn
from unqsubechday
),
final_2 as 
(Select maxsubeachday.submission_date, maxsubeachday.subcount , maxsubeachday.hacker_id, h.name from maxsubeachday left join Hackers h on
maxsubeachday.hacker_id = h.hacker_id where rn = 1

)
Select final_1.submission_date,  final_1.Uniqhacksub, final_2.hacker_id, final_2.name from final_1 join final_2 on final_1.submission_date = final_2.submission_date
order by submission_date