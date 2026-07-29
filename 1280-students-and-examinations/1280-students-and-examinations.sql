-- Write your PostgreSQL query statement below
with exam_count as (
    select 
        student_id, 
        subject_name,
        count(*) as attended_exams
    from 
        Examinations
    group by 
        student_id, subject_name
    )

select 
    c.student_id,
    c.student_name,
    s.subject_name,
    coalesce(ec.attended_exams, 0) as attended_exams
from students as c
cross join subjects as s
Left join exam_count as ec on ec.student_id = c.student_id and ec.subject_name = s.subject_name
order by student_id, subject_name;
