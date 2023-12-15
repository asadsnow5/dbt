with sources 
as
(
    select * from {{ source('stripe', 'payment') }}
)

,

transformed
as
(
    select 
        id as payment_id,
        orderid as order_id,
        status as payment_status,
        round(amount/100, 2) as payment_amount
    from 
    sources
)

select * from transformed