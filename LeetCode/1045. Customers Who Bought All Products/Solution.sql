/* Write your T-SQL query statement below */
select distinct c.customer_id
from customer c
where not exists (
    (select product_key from product)
    except
    (select product_key from customer c2 where c2.customer_id = c.customer_id)
)
