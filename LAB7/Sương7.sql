SELECT *
  FROM [BikeStores].[dbo].[Customers_Oakland]

   -- Bài 2: Xóa khách hàng có first_name bắt đầu bằng ‘Ka’ từ bảng được tạo ra ở bài 1.
  delete [Customers_Oakland]
  where [first_name] like 'Ka%'

   -- Bài 3:Sửa khách hàng có tên ‘Philip’ thành tên ‘Peter’ trong bảng được tạo ra từ bài 1.
  update [Customers_Oakland]
    set first_name = 'Peter'
    where First_name = 'Philip'

   -- Bài 4:Xóa tất các các khách hàng trong bảng tạo ra từ bài 1 và tiến hành insert 10 khách hàng mới vào trong bảng.	
 insert [Customers_Oakland]([first_name],[last_name],[Email],[city])
  values 
 ('Mike','Smith','@gm','Oakland'),
 ('Joe','Kae','@gm','Oakland'),
 ('B','A','@gm','Oakland'),
 ('C','B','@gm','Oakland'),
 ('A','C','@gm','Oakland'),
 ('C','D','@gm','Oakland'),
 ('D','E','@gm','Oakland'),
 ('E','N','@gm','Oakland'),
 ('P','E','@gm','Oakland'),
 ('O','D','@gm','Oakland')

    delete [Customers_Oakland]
