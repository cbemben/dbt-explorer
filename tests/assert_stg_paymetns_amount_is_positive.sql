--assert_stg_paymetns_amount_is_positive

with 

payments as (
    select * from {{ ref('stg_payments') }}
)

select order_id
    , sum(amount) as total_amt
from payments
group by order_id
having sum(amount) <0