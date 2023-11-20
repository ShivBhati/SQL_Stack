Select 
    Name
    ,Grade
    ,Marks 
from 
    Students 
    left join Grades
    on 
    Marks between Min_Mark and Max_Mark
Where 
    Grade >= 8 
Order by 
    Grade Desc
    ,Name;
Select 
    null as 'Name', 
    Grade
    ,Marks 
from 
    Students 
    left join Grades
    on Marks between Min_Mark and Max_Mark
Where 
    Grade < 8 
Order by Grade Desc, Marks
