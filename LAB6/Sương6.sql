--Số lượng đơn hàng theo năm, từng store_id và tên cửa hàn
select *
into Sales
from
	(select 
	year(o.order_date) as d,
	o.order_id,
	s.store_name
	from sales.orders o
	join sales.stores as s
	on o.store_id = s.store_id
	) data_table
	pivot
	(count(order_id)

	for d in ([2016],[2017],[2018])
	) as pivot_table


