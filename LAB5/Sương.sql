	--Bài 1	Tìm tất cả các khách hàng mà đã đặt nhiều hơn hoặc bằng hai đơn hàng trong năm 2018.

select c.[first_name] + ' ' + c.[last_name] as TenKH
, SoLan.Nlan
from sales.customers as c
join
	(
	select o.customer_id
	,count(o.order_id) as Nlan
	 from sales.orders as o
	 where YEAR(order_date) = 2018
	 group by o.customer_id
	 having count(o.order_id) >=2
	 ) as SoLan
	 on c.customer_id = SoLan.customer_id


	 -- Bài 2 :Tìm sản phẩm bán chạy nhất năm 2017. 

	 	select  oi.product_id
			,count(product_id) as SoLan
			--,sum([quantity]) as SoLuong
			from sales.order_items as oi, sales.orders as o
	where o.order_id = oi.order_id
	and year(order_date) = 2017
	group by product_id
	having  count(product_id) =
			(
				select max(DABAN.SoLan) 
				from
					(
					select
							--oi.product_id
							count(product_id) as SoLan
							--,sum([quantity]) as SoLuong
							from sales.order_items as oi, sales.orders as o
					where o.order_id = oi.order_id
					and year(order_date) = 2017
					group by product_id
					)DABAN
					)

		--Bài 3: Tìm tên cửa hàng có nhiều đơn đặt hàng nhất năm 2017. 

 SELECT s.store_name AS [Tên cửa hàng]
FROM sales.stores s
JOIN sales.orders o ON s.store_id = o.store_id
WHERE YEAR(o.order_date) = 2017
GROUP BY s.store_name
HAVING COUNT(o.order_id) = (
    SELECT MAX([số lần đặt hàng])
    FROM (
        SELECT COUNT(order_id) AS [số lần đặt hàng]
        FROM sales.orders
        WHERE YEAR(order_date) = 2017
        GROUP BY store_id
    ) AS [số lượng đơn mỗi cửa hàng]
);