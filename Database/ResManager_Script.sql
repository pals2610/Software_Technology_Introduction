use master
go

if exists (select name from master..sysdatabases where name = 'ResManager')
	drop database ResManager
go

create database ResManager
go

use ResManager
go

create table BanAn
(
	MaSoBan int,
	SoGhe int,
	primary key(MaSoBan)
)
go

create table NhanVien
(
	MaNV	int not null,
	HoTen nvarchar(40),
	NgaySinh nvarchar(30),
	TenDN	nvarchar(20),
	MatKhau	nvarchar(20),
	Quyen	nvarchar(20),
	primary key(MaNV)	
)
go

create table PhanCong
(
	Ca int,
	MaNV int,
	MaSoBan int,
	primary key (Ca, MaNV, MaSoBan)
)
go

create table LoaiThucDon
(
	MaLoai int,
	Nhom nvarchar (20),
	TenLoai nvarchar (40),
	primary key (MaLoai)
)
go

create table ThucDon
(
	MaThucDon int,
	MaLoai int,
	TenThucDon nvarchar (50),
	DonViTinh nvarchar (30),
	primary key (MaThucDon)
)
go

create table Gia
(
	NgayADGia datetime, 
	MaThucDon int,
	Gia float,
	primary key (NgayADGia, MaThucDon)
)
go
	
create table HoaDon
(
	SoHD int,
	ThoiGianLap datetime,
	MaSoBan int,
	SoKhach int,
	MaNVLap int,
	MaNVTT int,
	TongTien float,
	primary key (SoHD)
)
go

create table ChiTietHD
(
	SoHD int,
	MaThucDon int,
	SoLuong int,
	DonGia float,
	primary key (SoHD, MaThucDon)
)
go


alter table PhanCong
	add constraint fk_PC_BA foreign key (MaSoBan) references BanAn (MaSoBan),
	constraint fk_PC_NV foreign key (MaNV) references NhanVien (MaNV)

alter table ThucDon
	add constraint fk_TD_Loai foreign key (MaLoai) references LoaiThucDon (MaLoai)

alter table Gia
	add constraint fk_Gia_TD foreign key (MaThucDon) references ThucDon(MaThucDon)

alter table HoaDon
	add constraint fk_HD_NV foreign key (MaNVLap) references NhanVien (MaNV),
	constraint fk_HD_NV2 foreign key (MaNVTT) references NhanVien (MaNV),
	constraint fk_HD_BA foreign key (MaSoBan) references BanAn (MaSoBan)

alter table ChiTietHD
	add constraint fk_CTHD_HD foreign key (SoHD) references  HoaDon(SoHD),
	constraint fk_CTHD_TD foreign key (MaThucDon) references ThucDon(MaThucDon)


----------------------------BanAn------------------------------
insert into BanAn values (1, 4)
insert into BanAn values (2, 4)
insert into BanAn values (3, 4)
insert into BanAn values (4, 4)
insert into BanAn values (5, 4)
insert into BanAn values (6, 4)
insert into BanAn values (7, 4)
insert into BanAn values (8, 4)
insert into BanAn values (9, 4)
insert into BanAn values (10, 4)
insert into BanAn values (11, 4)
insert into BanAn values (12, 4)
insert into BanAn values (13, 4)
insert into BanAn values (14, 4)
insert into BanAn values (15, 4)
insert into BanAn values (16, 8)
insert into BanAn values (17, 8)
insert into BanAn values (18, 8)
insert into BanAn values (19, 8)
insert into BanAn values (20, 8)
insert into BanAn values (21, 8)
insert into BanAn values (22, 8)
insert into BanAn values (23, 8)
insert into BanAn values (24, 8)
insert into BanAn values (25, 8)
insert into BanAn values (26, 8)
insert into BanAn values (27, 8)
insert into BanAn values (28, 8)
insert into BanAn values (29, 8)
insert into BanAn values (30, 8)

----------------------------NhanVien------------------------------

set dateformat DMY

insert into NhanVien values (1, N'Nguyễn Hữu Phương', '12/04/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (2, N'Nguyễn Văn Phương', '08/12/1988', '', '', N'Tiếp Tân')
insert into NhanVien values (3, N'Trần Thị Hiền', '12/11/1988', '', '', N'Tiếp Tân')
insert into NhanVien values (4, N'Trần Thị Thanh', '15/06/1987', '', '', N'Tiếp Tân')
insert into NhanVien values (5, N'Nguyễn Thị Huế Thanh', '12/04/1986', '', '', N'Tiếp Tân')
insert into NhanVien values (6, N'Mai Văn Đạt', '28/02/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (7, N'Nguyễn Tiến Dũng', '30/04/1987', '', '', N'Tiếp Tân')
insert into NhanVien values (8, N'Đoàn Duy Dũng', '24/08/1987', '', '', N'Tiếp Tân')
insert into NhanVien values (9, N'Võ Thanh Phong', '11/03/1989', '', '', N'Tiếp Tân')
insert into NhanVien values (10, N'Ngô Bích Doãn', '21/12/1987', '', '', N'Tiếp Tân')
insert into NhanVien values (11, N'Đào Lệ Phương', '01/03/1988', '', '', N'Tiếp Tân')
insert into NhanVien values (12, N'Lê Thanh Ngọc', '05/05/1986', '', '', N'Tiếp Tân')
insert into NhanVien values (13, N'Huỳnh Hữu Châu', '13/04/1986', '', '', N'Tiếp Tân')
insert into NhanVien values (14, N'Đặng Minh Nhật', '12/04/1987', '', '', N'Tiếp Tân')
insert into NhanVien values (15, N'Chu Minh Tân', '16/04/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (16, N'Trần Thị Hải Yến', '12/07/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (17, N'Đỗ Thị Phương Diễm', '02/11/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (18, N'Nguyễn Tuân', '01/04/1985', '', '', N'Tiếp Tân')
insert into NhanVien values (19, N'Nguyễn Bảo An', '08/04/1985', 'nhanvien', '123', N'Tiếp Tân')
insert into NhanVien values (20, N'Nguyễn Xuân Thức', '17/11/1989', N'xuanthucit', N'babyonemoretime', N'Thu Ngân')
insert into NhanVien values (21, N'Võ Nhật Tài', '11/04/1989', N'windy_giodong', N'dniwenola', N'Thu Ngân')
insert into NhanVien values (22, N'Administrator', '01/01/1989', N'quantri', N'123456', N'Admin')
insert into NhanVien values (23, N'Nguyễn Bảo Ann', '08/04/1986', 'nhanvien', '123', N'Tiếp Tân')

----------------------------PhanCong------------------------------
set dateformat DMY

insert into PhanCong values (1, 1, 1)
insert into PhanCong values (1, 1, 2)
insert into PhanCong values (1, 1, 3)
insert into PhanCong values (2, 1, 1)
insert into PhanCong values (2, 1, 2)
insert into PhanCong values (2, 1, 3)
insert into PhanCong values (3, 2, 1)
insert into PhanCong values (3, 2, 2)
insert into PhanCong values (3, 2, 3)
insert into PhanCong values (1, 2, 4)
insert into PhanCong values (1, 2, 5)
insert into PhanCong values (1, 2, 6)
insert into PhanCong values (2, 3, 4)
insert into PhanCong values (2, 3, 5)
insert into PhanCong values (2, 3, 6)
insert into PhanCong values (3, 3, 4)
insert into PhanCong values (3, 3, 5)
insert into PhanCong values (3, 3, 6)
insert into PhanCong values (1, 4, 7)
insert into PhanCong values (1, 4, 8)
insert into PhanCong values (1, 4, 9)
insert into PhanCong values (2, 4, 7)
insert into PhanCong values (2, 4, 8)
insert into PhanCong values (2, 4, 9)
insert into PhanCong values (3, 5, 7)
insert into PhanCong values (3, 5, 8)
insert into PhanCong values (3, 5, 9)
insert into PhanCong values (1, 5, 10)
insert into PhanCong values (1, 5, 11)
insert into PhanCong values (1, 5, 12)
insert into PhanCong values (2, 6, 10)
insert into PhanCong values (2, 6, 11)
insert into PhanCong values (2, 6, 12)
insert into PhanCong values (3, 6, 10)
insert into PhanCong values (3, 6, 11)
insert into PhanCong values (3, 6, 12)
insert into PhanCong values (1, 7, 13)
insert into PhanCong values (1, 7, 14)
insert into PhanCong values (1, 7, 15)
insert into PhanCong values (2, 7, 13)
insert into PhanCong values (2, 7, 14)
insert into PhanCong values (2, 7, 15)
insert into PhanCong values (3, 8, 13)
insert into PhanCong values (3, 8, 14)
insert into PhanCong values (3, 8, 15)
insert into PhanCong values (1, 8, 16)
insert into PhanCong values (1, 8, 17)
insert into PhanCong values (2, 9, 16)
insert into PhanCong values (2, 9, 17)
insert into PhanCong values (3, 9, 16)
insert into PhanCong values (3, 9, 17)
insert into PhanCong values (1, 10, 18)
insert into PhanCong values (1, 10, 19)
insert into PhanCong values (2, 10, 18)
insert into PhanCong values (2, 10, 19)
insert into PhanCong values (3, 11, 18)
insert into PhanCong values (3, 11, 19)
insert into PhanCong values (1, 11, 20)
insert into PhanCong values (1, 11, 21)
insert into PhanCong values (2, 12, 20)
insert into PhanCong values (2, 12, 21)
insert into PhanCong values (3, 12, 20)
insert into PhanCong values (3, 12, 21)
insert into PhanCong values (1, 13, 22)
insert into PhanCong values (1, 13, 23)
insert into PhanCong values (2, 13, 22)
insert into PhanCong values (2, 13, 23)
insert into PhanCong values (3, 14, 22)
insert into PhanCong values (3, 14, 23)
insert into PhanCong values (1, 14, 24)
insert into PhanCong values (1, 14, 25)
insert into PhanCong values (2, 15, 24)
insert into PhanCong values (2, 15, 25)
insert into PhanCong values (3, 15, 24)
insert into PhanCong values (3, 15, 25)
insert into PhanCong values (1, 16, 26)
insert into PhanCong values (1, 16, 27)
insert into PhanCong values (2, 16, 26)
insert into PhanCong values (2, 16, 27)
insert into PhanCong values (3, 17, 26)
insert into PhanCong values (3, 17, 27)
insert into PhanCong values (1, 17, 28)
insert into PhanCong values (1, 17, 29)
insert into PhanCong values (2, 18, 28)
insert into PhanCong values (2, 18, 29)
insert into PhanCong values (3, 18, 28)
insert into PhanCong values (3, 18, 29)
insert into PhanCong values (1, 19, 30)
insert into PhanCong values (2, 19, 30)
insert into PhanCong values (3, 19, 30)

--------------------------- Loai -----------------------------------------

insert into LoaiThucDon values (1, N'Thức Ăn', N'Đồ Nguội, Thức Ăn Nhanh')
insert into LoaiThucDon values (2, N'Thức Ăn', N'Thịt Rừng')
insert into LoaiThucDon values (3, N'Thức Ăn', N'Hải Sản')
insert into LoaiThucDon values (4, N'Thức Ăn', N'Các Món Lẩu')
insert into LoaiThucDon values (5, N'Thức Ăn', N'Cật - Bao Tử - Dồi Trường')
insert into LoaiThucDon values (6, N'Thức Ăn', N'Súp - Cháo - Cơm')
insert into LoaiThucDon values (7, N'Thức Ăn', N'Rau - Khoai - Đậu')
insert into LoaiThucDon values (8, N'Thức Ăn', N'Bánh - Bún - Mì')
insert into LoaiThucDon values (9, N'Thức Ăn', N'Tráng Miệng')
insert into LoaiThucDon values (10, N'Nước Uống', N'Bia')
insert into LoaiThucDon values (11, N'Nước Uống', N'Rượu')
insert into LoaiThucDon values (12, N'Nước Uống', N'Nước Giải Khát')

----------------------------ThucDon------------------------------

insert into ThucDon values (1, 1, N'Chả Cá Thì Là', N'Dĩa')
insert into ThucDon values (2, 1, N'Gỏi Sen Tôm Thịt', N'Dĩa')
insert into ThucDon values (4, 1, N'Gỏi Cuốn', N'Phần')
insert into ThucDon values (5, 1, N'Gỏi Khô Cá Sặc', N'Dĩa')
insert into ThucDon values (6, 1, N'Gỏi Mực Thái', N'Dĩa')
insert into ThucDon values (7, 1, N'Gỏi Sứa Tôm Thịt', N'Dĩa')
insert into ThucDon values (8, 1, N'Gỏi Bò Bóp Thấu', N'Dĩa')
insert into ThucDon values (9, 1, N'Gỏi Bồn Bồn Tôm Thịt', N'Dĩa')
insert into ThucDon values (10, 1, N'Gỏi Ngó Sen', N'Dĩa')
insert into ThucDon values (11, 1, N'Khoai Tây Chiên', N'Dĩa')
insert into ThucDon values (12, 1, N'Đậu Hủ Chiên', N'Dĩa')
insert into ThucDon values (13, 1, N'Chả Giò SaKê', N'Phần')
insert into ThucDon values (14, 1, N'Xúc Xích Đức Nướng', N'Dĩa')

insert into ThucDon values (15, 2, N'Cà Ri Dê, Bánh Mì', N'Tô')
insert into ThucDon values (16, 2, N'Heo Rừng Nướng Muối Ớt', N'Dĩa')
insert into ThucDon values (17, 2, N'Thịt Dê Nướng', N'Dĩa')
insert into ThucDon values (18, 2, N'Gà HMông Nướng', N'Con')
insert into ThucDon values (19, 2, N'Dê Quay Chảo', N'Dĩa')
insert into ThucDon values (20, 2, N'Bê Luộc Cuốn Bánh Tráng Phơi Sương', N'Dĩa')
insert into ThucDon values (21, 2, N'Thỏ RôTi', N'Dĩa')
insert into ThucDon values (22, 2, N'Nhím Xào Lăn', N'Dĩa')
insert into ThucDon values (23, 2, N'Nhím Hấp Gừng', N'Dĩa')
insert into ThucDon values (24, 2, N'Gà Nấu Cháo', N'Con')
insert into ThucDon values (25, 2, N'Bò Nhúng Dấm', N'Dĩa')

insert into ThucDon values (26, 3, N'Mực 1 Nắng Nướng', N'Dĩa')
insert into ThucDon values (27, 3, N'Mực Nướng Sa Tế', N'Dĩa')
insert into ThucDon values (28, 3, N'Cá SaPa Nướng', N'Con')
insert into ThucDon values (29, 3, N'Ếch Nướng', N'Dĩa')
insert into ThucDon values (30, 3, N'Tôm Lăn Bột', N'Dĩa')
insert into ThucDon values (31, 3, N'Tôm Sú Tái Chanh', N'100gr')
insert into ThucDon values (32, 3, N'Tôm Sú Rang Me - Rang Muối', N'100gr')
insert into ThucDon values (33, 3, N'Cua Rang Me', N'Dĩa')
insert into ThucDon values (34, 3, N'Cua Hấp', N'Dĩa')
insert into ThucDon values (35, 3, N'Hàu Tái Chanh', N'Dĩa')
insert into ThucDon values (36, 3, N'Nghêu Hấp Xã', N'Dĩa')
insert into ThucDon values (37, 3, N'Sò Huyết Cháy Tỏi', N'Dĩa')
insert into ThucDon values (38, 3, N'Sò Huyết Rang Me', N'Dĩa')
insert into ThucDon values (39, 3, N'Mực Hấp Gừng', N'Dĩa')
insert into ThucDon values (40, 3, N'Mực Nhúng Dấm', N'Dĩa')
insert into ThucDon values (41, 3, N'Mực Xào Chua Ngọt', N'Dĩa')
insert into ThucDon values (42, 3, N'Mực Chiên Giòn', N'Dĩa')
insert into ThucDon values (43, 3, N'Lươn Xào Lăn', N'Dĩa')
insert into ThucDon values (44, 3, N'Lươn Nướng', N'Dĩa')
insert into ThucDon values (45, 3, N'Cá Lóc Hấp Bầu', N'Con')
insert into ThucDon values (46, 3, N'Cá Tai Tượng Chiên Xù', N'Con')
insert into ThucDon values (47, 3, N'Cá Basa Nướng', N'Con')
insert into ThucDon values (48, 3, N'Cá Diêu Hồng Tái Chanh', N'Con')
insert into ThucDon values (49, 3, N'Cá Thác Lác Bao Cốm', N'Dĩa')
insert into ThucDon values (50, 3, N'Cua Đinh Tiềm Thuốc Bắc', N'Con')

insert into ThucDon values (51, 4, N'Lẩu Thái', N'Lẩu')
insert into ThucDon values (52, 4, N'Lẩu Cá Bông Lau', N'Lẩu')
insert into ThucDon values (53, 4, N'Lẩu Dê', N'Lẩu')
insert into ThucDon values (54, 4, N'Lẩu Mắm', N'Lẩu')
insert into ThucDon values (55, 4, N'Lẩu Cá Diêu Hồng Nấu Riêu', N'Lẩu')
insert into ThucDon values (56, 4, N'Lẩu Cá Diêu Hồng Chua Ngọt', N'Lẩu')
insert into ThucDon values (57, 4, N'Lẩu Đầu Cá Hồi', N'Lẩu')

insert into ThucDon values (58, 5, N'Dồi Lươn Nướng', N'Dĩa')
insert into ThucDon values (59, 5, N'Dồi Trường Chiên Giòn', N'Dĩa')
insert into ThucDon values (60, 5, N'Dồi Trường Hấp Gừng', N'Dĩa')
insert into ThucDon values (61, 5, N'Bao Tử Hầm Tiêu', N'Dĩa')
insert into ThucDon values (62, 5, N'Cật Xào Nấm Đông Cô', N'Dĩa')
insert into ThucDon values (63, 5, N'Cật Cháy Tỏi', N'Dĩa')

insert into ThucDon values (64, 6, N'Cơm Xào Thập Cẩm', N'Dĩa')
insert into ThucDon values (65, 6, N'Cơm Xào Hải Sản', N'Dĩa')
insert into ThucDon values (66, 6, N'Cháo Hàu', N'Tô')
insert into ThucDon values (67, 6, N'Cháo Lươn', N'Tô')
insert into ThucDon values (68, 6, N'Cháo Tôm', N'Tô')
insert into ThucDon values (69, 6, N'Cháo Bò', N'Tô')
insert into ThucDon values (70, 6, N'Soup Cua', N'Chén')
insert into ThucDon values (71, 6, N'Soup Hải Sản', N'Chén')

insert into ThucDon values (72, 7, N'Khổ Qua Chà Bông', N'Dĩa')
insert into ThucDon values (73, 7, N'Rau Muống Xào Tỏi', N'Dĩa')
insert into ThucDon values (74, 7, N'Rau Nhút Xào Tỏi', N'Dĩa')
insert into ThucDon values (75, 7, N'Khoai Tây Chiên', N'Dĩa')

insert into ThucDon values (76, 8, N'Bún Gạo Xào Hải Sản', N'Dĩa')
insert into ThucDon values (77, 8, N'Miến Xào Tôm', N'Phần')
insert into ThucDon values (78, 8, N'Mì Xào Bò', N'Phần')
insert into ThucDon values (79, 8, N'Mì Xào Thập Cẩm', N'Phần')
insert into ThucDon values (80, 8, N'Bún Gạo Xào Thập Cẩm', N'Phần')
insert into ThucDon values (81, 8, N'Bún Nướng', N'Phần')

insert into ThucDon values (82, 9, N'Bưởi Da Xanh', N'Dĩa')
insert into ThucDon values (83, 9, N'Dưa', N'Dĩa')
insert into ThucDon values (84, 9, N'Thơm', N'Dĩa')

insert into ThucDon values (85, 10, N'Heineken', N'Chai')
insert into ThucDon values (86, 10, N'Sài Gòn Đỏ', N'Chai')
insert into ThucDon values (87, 10, N'333', N'Lon')
insert into ThucDon values (88, 10, N'Tiger', N'Lon')
insert into ThucDon values (89, 10, N'Đại Việt', N'Lon')

insert into ThucDon values (90, 11, N'Vang Đà Lạt Dakia', N'Chai 750 ml')
insert into ThucDon values (91, 11, N'Vodka Thăng Long 39,5', N'Chai 750 ml')
insert into ThucDon values (92, 11, N'Champagne Nga Đỏ', N'Chai 750 ml')
insert into ThucDon values (93, 11, N'Champagne Nga Trắng', N'Chai 750 ml')
insert into ThucDon values (94, 11, N'Mật Sim', N'Chai 650 ml')
insert into ThucDon values (95, 11, N'Nếp Cẩm', N'Chai 750 ml')
insert into ThucDon values (96, 11, N'Cognac X.O Bahia', N'Chai 370 ml')
insert into ThucDon values (97, 11, N'Cognac Henessy V.S.O.P', N'Chai 370 ml')
insert into ThucDon values (98, 11, N'Nếp Quốc Tửu', N'Chai 750 ml')
insert into ThucDon values (99, 11, N'Champagne Mumm', N'Chai 750 ml')

insert into ThucDon values (100, 12, N'Doctor Thanh', N'Chai')
insert into ThucDon values (101, 12, N'Trà Xanh 0 Độ', N'Chai')
insert into ThucDon values (102, 12, N'Redbull', N'Lon')
insert into ThucDon values (103, 12, N'Sprite', N'Lon')
insert into ThucDon values (104, 12, N'Cocacola', N'Lon')
insert into ThucDon values (105, 12, N'7 Up', N'Lon')
insert into ThucDon values (106, 12, N'Pepsi', N'Lon')
insert into ThucDon values (107, 12, N'Nước Yến', N'Lon')
insert into ThucDon values (108, 12, N'Sting Dâu', N'Lon')
insert into ThucDon values (109, 12, N'Soda', N'Lon')

--------------------------------------------Gia-----------------------------------------------
set dateformat DMY

insert into Gia values ('22/05/2010', 1, 60000)
insert into Gia values ('22/05/2010', 2, 55000)
insert into Gia values ('22/05/2010', 4, 50000)
insert into Gia values ('22/05/2010', 5, 60000)
insert into Gia values ('22/05/2010', 6, 60000)
insert into Gia values ('22/05/2010', 7, 65000)
insert into Gia values ('22/05/2010', 8, 65000)
insert into Gia values ('22/05/2010', 9, 55000)
insert into Gia values ('22/05/2010', 10, 55000)
insert into Gia values ('22/05/2010', 11, 25000)
insert into Gia values ('22/05/2010', 12, 30000)
insert into Gia values ('22/05/2010', 13, 50000)
insert into Gia values ('22/05/2010', 14, 45000)
insert into Gia values ('22/05/2010', 15, 80000)
insert into Gia values ('22/05/2010', 16, 60000)
insert into Gia values ('22/05/2010', 17, 60000)
insert into Gia values ('22/05/2010', 18, 180000)
insert into Gia values ('22/05/2010', 19, 60000)
insert into Gia values ('22/05/2010', 20, 85000)
insert into Gia values ('22/05/2010', 21, 55000)
insert into Gia values ('22/05/2010', 22, 60000)
insert into Gia values ('22/05/2010', 23, 60000)
insert into Gia values ('22/05/2010', 24, 250000)
insert into Gia values ('22/05/2010', 25, 65000)
insert into Gia values ('22/05/2010', 26, 65000)
insert into Gia values ('22/05/2010', 27, 55000)
insert into Gia values ('22/05/2010', 28, 85000)
insert into Gia values ('22/05/2010', 29, 65000)
insert into Gia values ('22/05/2010', 30, 60000)
insert into Gia values ('22/05/2010', 31, 28000)
insert into Gia values ('22/05/2010', 32, 26000)
insert into Gia values ('22/05/2010', 33, 60000)
insert into Gia values ('22/05/2010', 34, 70000)
insert into Gia values ('22/05/2010', 35, 60000)
insert into Gia values ('22/05/2010', 36, 45000)
insert into Gia values ('22/05/2010', 37, 50000)
insert into Gia values ('22/05/2010', 38, 50000)
insert into Gia values ('22/05/2010', 39, 65000)
insert into Gia values ('22/05/2010', 40, 65000)
insert into Gia values ('22/05/2010', 41, 55000)
insert into Gia values ('22/05/2010', 42, 55000)
insert into Gia values ('22/05/2010', 43, 70000)
insert into Gia values ('22/05/2010', 44, 70000)
insert into Gia values ('22/05/2010', 45, 90000)
insert into Gia values ('22/05/2010', 46, 90000)
insert into Gia values ('22/05/2010', 47, 85000)
insert into Gia values ('22/05/2010', 48, 75000)
insert into Gia values ('22/05/2010', 49, 60000)
insert into Gia values ('22/05/2010', 50, 160000)
insert into Gia values ('22/05/2010', 51, 120000)
insert into Gia values ('22/05/2010', 52, 85000)
insert into Gia values ('22/05/2010', 53, 80000)
insert into Gia values ('22/05/2010', 54, 120000)
insert into Gia values ('22/05/2010', 55, 75000)
insert into Gia values ('22/05/2010', 56, 75000)
insert into Gia values ('22/05/2010', 57, 70000)
insert into Gia values ('22/05/2010', 58, 65000)
insert into Gia values ('22/05/2010', 59, 70000)
insert into Gia values ('22/05/2010', 60, 65000)
insert into Gia values ('22/05/2010', 61, 60000)
insert into Gia values ('22/05/2010', 62, 55000)
insert into Gia values ('22/05/2010', 63, 55000)
insert into Gia values ('22/05/2010', 64, 45000)
insert into Gia values ('22/05/2010', 65, 55000)
insert into Gia values ('22/05/2010', 66, 40000)
insert into Gia values ('22/05/2010', 67, 75000)
insert into Gia values ('22/05/2010', 68, 35000)
insert into Gia values ('22/05/2010', 69, 28000)
insert into Gia values ('22/05/2010', 70, 15000)
insert into Gia values ('22/05/2010', 71, 15000)
insert into Gia values ('22/05/2010', 72, 40000)
insert into Gia values ('22/05/2010', 73, 30000)
insert into Gia values ('22/05/2010', 74, 40000)
insert into Gia values ('22/05/2010', 75, 25000)
insert into Gia values ('22/05/2010', 76, 50000)
insert into Gia values ('22/05/2010', 77, 50000)
insert into Gia values ('22/05/2010', 78, 45000)
insert into Gia values ('22/05/2010', 79, 45000)
insert into Gia values ('22/05/2010', 80, 45000)
insert into Gia values ('22/05/2010', 81, 60000)
insert into Gia values ('22/05/2010', 82, 25000)
insert into Gia values ('22/05/2010', 83, 25000)
insert into Gia values ('22/05/2010', 84, 25000)
insert into Gia values ('22/05/2010', 85, 20000)
insert into Gia values ('22/05/2010', 86, 10000)
insert into Gia values ('22/05/2010', 87, 15000)
insert into Gia values ('22/05/2010', 88, 12000)
insert into Gia values ('22/05/2010', 89, 8000)
insert into Gia values ('22/05/2010', 90, 38000)
insert into Gia values ('22/05/2010', 91, 58000)
insert into Gia values ('22/05/2010', 92, 95000)
insert into Gia values ('22/05/2010', 93, 95000)
insert into Gia values ('22/05/2010', 94, 135000)
insert into Gia values ('22/05/2010', 95, 200000)
insert into Gia values ('22/05/2010', 96, 350000)
insert into Gia values ('22/05/2010', 97, 450000)
insert into Gia values ('22/05/2010', 98, 600000)
insert into Gia values ('22/05/2010', 99, 990000)
insert into Gia values ('22/05/2010', 100, 9000)
insert into Gia values ('22/05/2010', 101, 8000)
insert into Gia values ('22/05/2010', 102, 8000)
insert into Gia values ('22/05/2010', 103, 8000)
insert into Gia values ('22/05/2010', 104, 7000)
insert into Gia values ('22/05/2010', 105, 7000)
insert into Gia values ('22/05/2010', 106, 7000)
insert into Gia values ('22/05/2010', 107, 6000)
insert into Gia values ('22/05/2010', 108, 5000)
insert into Gia values ('22/05/2010', 109, 5000)

---------------------------------------------------------Stored Procedure --------------------------------------

go
create proc sp_LayCTHDTuSoHD @SoHD int
as
begin
	select hd.SoHD, hd.ThoiGianLap, hd.SoKhach, nv1.HoTen as 'Người Lập', hd.MaSoBan, nv2.HoTen as 'Tiếp Tân' , hd.TongTien, td.TenThucDon, ct.SoLuong, ct.DonGia
	from ChiTietHD ct, HoaDon hd, NhanVien nv1, NhanVien nv2, ThucDon td
	where hd.SoHD = ct.SoHD and hd.MaNVLap = nv1.MaNV and hd.MaNVTT = nv2.MaNV and hd.SoHD = @SoHD and td.MaThucDon = ct.MaThucDon
end

go

create proc sp_ThongKeHDTheoNgay @Ngay datetime
as 
begin 
	set dateformat DMY 
	select SoHD as 'Số HĐ', ThoiGianLap as 'Thời Gian Lập', MaSoBan as 'Mã Bàn', SoKhach as 'Số Khách', nv1.HoTen as 'Người Lập', nv2.HoTen as 'Tiếp Tân', TongTien as 'Tổng Tiền' 
	from HoaDon, NhanVien nv1, NhanVien nv2 
	where HoaDon.MaNVLap = nv1.MaNV and HoaDon.MaNVTT = nv2.MaNV and convert(varchar(10), ThoiGianLap,103) = convert(varchar(10), convert(datetime, @Ngay), 103)
end

go

create proc sp_ThongKeHDTheoThangNam @ThangNam nvarchar(7)
as
begin
	select hd.SoHD as 'Số HĐ', hd.ThoiGianLap as 'Thời Gian Lập', hd.MaSoBan as 'Mã Bàn', hd.SoKhach as 'Số Khách', nv1.HoTen as 'Người Lập', nv2.HoTen as 'Tiếp Tân', hd.TongTien as 'Tổng Tiền' 
	from HoaDon hd, NhanVien nv1, NhanVien nv2 
	where hd.MaNVLap = nv1.MaNV and hd.MaNVTT = nv2.MaNV and convert(nvarchar(10), ThoiGianLap, 103) like '%'+@ThangNam
end

go

create proc sp_ThongKeHDTheoKhoangNgay @TuNgay datetime, @DenNgay datetime
as
begin
	set dateformat DMY select convert(varchar(10),convert(datetime, @TuNgay) , 103) as 'TuNgay', convert(varchar(10),convert(datetime,@DenNgay), 103) as 'DenNgay', SoHD as 'Số HĐ', ThoiGianLap as 'Thời Gian Lập', MaSoBan as 'Mã Bàn', SoKhach as 'Số Khách', nv1.HoTen as 'Người Lập', nv2.HoTen as 'Tiếp Tân', TongTien as 'Tổng Tiền' 
	from HoaDon, NhanVien nv1, NhanVien nv2 
	where HoaDon.MaNVLap = nv1.MaNV and HoaDon.MaNVTT = nv2.MaNV and convert(varchar(10), ThoiGianLap,103) >= convert(varchar(10),convert(datetime, @TuNgay), 103) and convert(varchar(10), ThoiGianLap,103) <= convert(varchar(10),convert(datetime,@DenNgay), 103)
end
