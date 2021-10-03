# Write your MySQL query statement below
with
    half_cnt(cnt) as (select sum(frequency) / 2 from numbers),
    smaller_cnt(number, cnt) as (
        select n1.number, coalesce(sum(n2.frequency), 0)
        from numbers n1
        left join numbers n2
        on n1.number > n2.number
        group by n1.number
    ),
    greater_cnt(number, cnt) as (
        select n1.number, coalesce(sum(n2.frequency), 0)
        from numbers n1
        left join numbers n2
        on n1.number < n2.number
        group by n1.number
    )

select avg(distinct sc.number) as median
from smaller_cnt sc, greater_cnt gc
where
    sc.number = gc.number and
    sc.cnt <= (select cnt from half_cnt) and
    gc.cnt <= (select cnt from half_cnt);
