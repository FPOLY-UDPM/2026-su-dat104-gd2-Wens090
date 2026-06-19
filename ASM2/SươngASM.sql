--Cho biết danh sách vắng học (sinh viên vắng (TrangThai = 'A'))
select * 
from DiemDanh
where TrangThai = 'A'
--2.	Đếm số buổi vắng theo từng sinh viên
select MASV,
count( TrangThai) as SoBuoiVang
from DiemDanh
where TrangThai = 'A'
group by MASV

--3.	Thêm 1 dòng (record) vào bảng DiemDanh
insert into DiemDanh (MASV , NgayHoc,TrangThai,Lop)
values
('PS44444',N'05/13 - Buổi 2','A','SD21202')


--Thêm 1 dòng (record) vào bảng KhoiPhucDiemDanh
insert into KhoiPhucDiemDanh(MASV,ma_lop,NgayHoc,NoiDung_SinhVien,NoiDung_GiangVien,Duyet)
values
('PS44444','SD21202',N'05/11 - Buổi 1',N'Kẹt xe',N'Cho Phép',1)

--4.	Cập nhật trạng thái điểm danh của 1 sinh viên
update DiemDanh
set TrangThai = 'P'
Where NgayHoc = '05/13 - Buổi 2'
--5.	Giảng viên duyệt yêu cầu khôi phục điểm danh

update KhoiPhucDiemDanh
set Duyet = 0
where MASV='PS44444'

--6.Xóa 1 yêu cầu khôi phục điểm danh theo MASV, Lop, và NgayHoc	
delete [KhoiPhucDiemDanh]
where MASV = 'PS44444' and Ma_Lop = 'SD21202' and NgayHoc ='05/13 - Buổi 2'

-- Mức 2
--7.	Đếm số buổi vắng của từng sinh viên theo từng lớp
select MASV,Lop,Count(TrangThai) as So_Buoi_vang
from DiemDanh
where TrangThai = 'A'
group by MASV,Lop 

--8.	Tìm sinh viên có số buổi vắng > 3
select MASV,Lop,Count(TrangThai) as So_Buoi_vang
from DiemDanh
where TrangThai = 'A'
group by MASV,Lop 
having count([trangthai]) >3
--9.	Liệt kê sinh viên có yêu cầu khôi phục điểm danh trùng với ngày KHÔNG bị vắng
select *
from DiemDanh as d
join KhoiPhucDiemDanh as k
on d.MASV = k.MASV
and k.NgayHoc = d.NgayHoc
and k.ma_lop = d.Lop
where [TrangThai] = 'P' 
and [NoiDung_SinhVien] = N'Vắng'
--10.	Cập nhật trạng thái điểm danh thành 'P' cho các sinh viên đã được duyệt khôi phục
INSERT INTO [dbo].[KhoiPhucDiemDanh] ([MASV], [ma_lop], [NgayHoc], [NoiDung_SinhVien], [NoiDung_GiangVien], [Duyet])
VALUES 
(N'PS49264', N'DP21301', N'05/11 - Buổi 1', N'Bận việc gia đình', N'Chưa duyệt', 0),
(N'PS43165', N'DP21301', N'05/11 - Buổi 1', N'Đi trễ 10 phút', N'Đã duyệt', 1),
(N'PS48866', N'DP21301', N'05/11 - Buổi 1', N'Quên điểm danh', N'Đã duyệt', 1),
(N'PS49697', N'DP21301', N'05/11 - Buổi 1', N'Ốm đau', N'Chưa duyệt', 0),
(N'PS48163', N'DP21301', N'05/11 - Buổi 1', N'Hỏng xe', N'Đã duyệt', 1);
GO
a