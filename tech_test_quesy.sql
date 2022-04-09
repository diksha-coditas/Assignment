select DENSE_RANK() OVER (
    PARTITION BY t.volume ) , DENSE_RANK() OVER (
    PARTITION BY t.open_time  ),row_number() over (order by u.login_hash  ) as "ID" ,u.login_hash,u.server_hash ,u.currency 
,t.symbol , cast(t.open_time as date)  as dt_report,cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_prev_all , (
 select cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_2020_08   where t.close_time between '2020-08-01' and '2020-08-31' ),
-- (select DENSE_RANK() OVER (PARTITION BY cast(sum(u.login_hash)) as integer )as sum_volume_prev_7d  WHERE t.close_time >current_timestamp  - interval '7 days' ),
 (select cast( min(t.close_time) over (order by t.symbol )as timestamp)as date_first_trade ),
 (select cast( sum(t.volume) over (order by t.symbol )as double precision)as sum_volume_jun_sep where t.close_time between '2020-06-01' and '2020-09-30'),
 (select cast(row_number() over (order by u.server_hash) as integer) as row_no),
 --(select  DENSE_RANK() OVER ( PARTITION BY (cast( max(t.volume) over (order by t.symbol ))as double precision)as rank_count_prev_7d) WHERE t.close_time >current_timestamp  - interval '7 days'),
 (select cast( max(t.volume) over (order by t.symbol )as double precision)as rank_count_prev_7d WHERE t.close_time >current_timestamp  - interval '7 days'),
(select cast( sum(t.volume) over (order by t.symbol )as double precision) as sum_volume_prev_7d  WHERE t.close_time >current_timestamp  - interval '7 days' )
from users u right join trades t on u.login_hash =t.login_hash 







