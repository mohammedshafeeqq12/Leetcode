select
    activity_date as day,
    count(distinct user_id) as active_users 
from activity 
where activity_date between '2019-06-28' and '2019-07-27'
-- WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
group by activity_date 
order by activity_date;