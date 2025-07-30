select years, customer_id,payment, d_rank from
(select year(orders.order_purchase_timestamp) years,
orders.customer_id,
sum(payments.payment_value) payment,
dense_rank() over (partition by year(orders.order_purchase_timestamp) order by sum(payments.payment_value ) desc) d_rank
from orders join payments
on payments.order_id = orders.order_id
group by orders.order_purchase_timestamp, orders.customer_id) as a
where d_rank <= 3;