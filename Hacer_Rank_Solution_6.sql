--                              [    Contest Leaderboard        ]


-- The total score of a hacker is the sum of their maximum scores for all of the challenges. 
-- Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
-- If more than one hacker achieved the same total score, 
-- then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.


With 
DS1 as 
(
    Select  *, 
        ROW_NUMBER() 
        over(partition by challenge_id, hacker_id order by hacker_id, Score desc ) as rownumber from Submissions 
),
DS2 as 
(
    Select * from DS1 where rownumber = 1
)

     Select     D.hacker_id
               , h.name
               , Sum(D.Score) 
    from    DS2 D left join Hackers h 
    on      D.hacker_id = h.hacker_id 
    group by D.hacker_id,h.name 
    Having Sum(D.score) > 0
    order by Sum(D.Score) Desc, D.hacker_id Asc
