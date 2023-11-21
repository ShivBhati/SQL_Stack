---                 [ Top Competitors ]



-- Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
-- Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than 
-- one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score.
--  If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Solution:
 

 With 
CD as 
(
Select Challenge_ID, Score 
    from Challenges c
        left join difficulty d
            on   c.difficulty_level = d.difficulty_level 
),
SR as 
(
Select  s.hacker_Id, count(s.challenge_id) as count1
    from Submissions s
        inner join hackers h on  s.hacker_id = h.hacker_Id
        inner join CD on CD.challenge_id = s.challenge_id
    Where 
        cd.Score = s.score
    group by s.hacker_id   
)
Select  h.hacker_Id, h.name from SR 
    left join hackers h on SR.hacker_id = h.hacker_Id 
    where SR.Count1 > 1
    order by SR.count1 desc, h.hacker_id
   
    


