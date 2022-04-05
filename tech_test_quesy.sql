

select row_number() over (order by u.login_hash  ) as "ID" ,u.login_hash,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_prev_7d 
from users u left join trades t on u.login_hash =t.login_hash WHERE t.close_time >current_timestamp  - interval '7 days'


select row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_prev_all 
from users u right join trades t on u.login_hash =t.login_hash 


select DENSE_RANK() OVER (
    PARTITION BY t.volume )  , row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_prev_all 
from users u right join trades t on u.login_hash =t.login_hash WHERE t.close_time >current_timestamp  - interval '7 days'


select DENSE_RANK() OVER (
    PARTITION BY t.open_time  )  , row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( max(t.volume) over (order by t.symbol )as double precision)as sum_volume_prev_all 
from users u right join trades t on u.login_hash =t.login_hash WHERE t.close_time >current_timestamp  - interval '7 days'


select row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_2020_08 
from users u right join trades t on u.login_hash =t.login_hash where t.close_time between '2020-08-01' and '2020-08-31'

select row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( min(t.close_time) over (order by t.symbol )as timestamp)as date_first_trade 
from users u right join trades t on u.login_hash =t.login_hash 


select row_number() over (order by u.login_hash) as "ID" ,cast(row_number() over (order by u.server_hash) as integer) as row_no, u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report 
from users u right join trades t on u.login_hash =t.login_hash

select row_number() over (order by u.login_hash) as "ID" , u.login_hash ,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report, cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_2020_08 
from users u right join trades t on u.login_hash =t.login_hash where t.close_time between '2020-06-01' and '2020-09-30'

