USE GOOD_FOOD;

INSERT INTO HINH_ANH VALUES 
('test','jpg')
,('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg')
,('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg')
,('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg')
,('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg'),('test','jpg')
,('test','jpg');

INSERT INTO NGUOI_DUNG (HO_VA_TEN, TEN_DANG_NHAP, SO_DIEN_THOAI, NGAY_SINH,
MAT_KHAU, EMAIL, GIOI_TINH, ID_HINH_ANH, LOAI_NGUOI_DUNG) 
VALUES ('Nguyen Minh Nghia', 'mini1001', '0123456001', '2001-10-01', '123', 'test001@gmail.com', 'M', 1,0),
('Nguyen Thuy Ngoc', 'ntn1002', '0123456002', '2001-10-01', '223', 'test002@gmail.com', 'F', 1,0),
('Tran Pham Thai Hoa', 'tpth1003', '0123456003', '2001-10-01', '323', 'test003@gmail.com', 'M', 1,0),
('Nguyen Mai Thy', 'nmt1201', '0123456201', '2001-10-01', '423', 'test201@gmail.com', 'F', 1,2),
('Chung Dong Phong', 'cdp1101', '0123456101', '2001-10-01', '523', 'test101@gmail.com', 'M', 1,1),
('Le Tran Hoang Thinh', 'ltht1102', '0123456102', '2001-10-01', '623', 'test102@gmail.com', 'M', 1,1),
('Dinh Gia Quang', 'lake1103', '0123456103', '2001-10-01', '723', 'test103@gmail.com', 'M', 1,1),
('Tran Nguyen Lam', 'lam1104', '0123456104', '2001-10-01', '823', 'test104@gmail.com', 'M', 1,1),
('Nguyen Trung Phong', 'trupo1105', '0123456105', '2001-10-01', '923', 'test105@gmail.com', 'M', 1,1),
('Cao Thi Thanh Mai', 'mei1202', '0123456202', '2001-10-01', '1023', 'test202@gmail.com', 'F', 1,2);
-- select * from NGUOI_DUNG;

INSERT INTO DIA_CHI (SO_NHA, DUONG, PHUONG_XA, QUAN_HUYEN, TINH_THANH_PHO) 
VALUES ('114','Duong 9A',' ','Huyen Bonh Chonh','HCM'),
('141','Nguyen Thoi',' ','Quan 1','HCM'),
('180','Tran Quang',' ','Quan 1','HCM'),
('44','Hua Bonh',' ','Quan 11','HCM'),
('223','Vu Van',' ','Quan 3','HCM'),
('35-37','Duong 41',' ','Quan 4','HCM'),
('1056','Hau Giang',' ','Quan 6','HCM'),
('359','Do Xuon',' ','Quan 9','HCM'),
('516','Tinh Lo',' ','Quan Bonh Ton','HCM'),
('157','Duong D2',' ','Quan Bonh Thanh','HCM'),
('51','Lo Trung',' ','Quan Ton Bonh','HCM'),
('93/5','Nguyen Anh',' ','Huyen Huc Mun','HCM'),
('572','Ba Thong',' ','Quan 10','HCM'),
('798','Su Van',' ','Quan 10','HCM'),
('670','Nguyen Duy',' ','Quan 2','HCM'),
('682','Tran Hung',' ','Quan 5','HCM'),
('313','Nguyen Thi',' ','Quan 7','HCM'),
('355','Thong Nhat',' ','Quan Gu Vap','HCM'),
('43','Hoa Hong',' ','Quan Phy Nhuan','HCM'),
('141','Ton Son',' ','Quan Ton Phy','HCM'),
('66E','Hoang Dieu',' ','Quan Thu Duc','HCM');
-- select * from DIA_CHI;

INSERT INTO QUAN_AN (TEN_QUAN_AN, CHAT_LUONG, THOI_GIAN_HOAT_DONG,
SO_DIEN_THOAI, ID_DIA_CHI, ID_HINH_ANH, DA_DUYET, ID_NGUOI_SO_HUU) 
VALUES ('The Dome Kaffe',4.5,'7:00 - 21:00','0123456789',1,1,0,5),
('Heritage Concept Chill Hub',4.4,'7:00 - 21:00','0123456789',2,2,1,5),
('Almacen Cafo',2.7,'7:00 - 21:00','0123456789',3,3,1,5),
('Com Ngu Quyen',3.6,'7:00 - 21:00','0123456789',4,4,1,5),
('MayCha',4.6,'7:00 - 21:00','0123456789',5,5,0,5),
('TocoToco',2.7,'7:00 - 21:00','0123456789',6,6,1,5),
('Dokki',3.5,'7:00 - 21:00','0123456789',7,7,0,5),
('Subin',4.4,'7:00 - 21:00','0123456789',8,8,0,5),
('Dimsum Tien Phot',1.8,'7:00 - 21:00','0123456789',9,9,1,5),
('Pho Le',4.5,'7:00 - 21:00','0123456789',10,10,0,10),
('Quon bonh mo Hua Mo',4.5,'7:00 - 21:00','0123456789',11,11,1,10),
('Choo Suon Chy Chen',3,'7:00 - 21:00','0123456789',12,12,1,10),
('Quon Nuong Yaki',1.7,'7:00 - 21:00','0123456789',13,13,1,10),
('Am Thuc Quo Nh�',2.8,'7:00 - 21:00','0123456789',14,14,0,10),
('Quon Bui',3.5,'7:00 - 21:00','0123456789',15,15,0,10),
('S�i Gun Xua V� Nay',3.7,'7:00 - 21:00','0123456789',16,16,1,10),
('Food House',2.7,'7:00 - 21:00','0123456789',17,17,1,10),
('Bu To Toy Ninh Nam Sonh',1.8,'7:00 - 21:00','0123456789',18,18,1,10),
('Namo Pizza',3.2,'7:00 - 21:00','0123456789',19,19,1,10),
('Thao Dien Village',2.9,'7:00 - 21:00','0123456789',20,20,0,10),
('An Vat 21',2.5,'7:00 - 21:00','0123456789',21,21,1,10);
-- delete from QUAN_AN;
-- select * from QUAN_AN;


INSERT INTO BAI_VIET (TIEU_DE, NHAN_XET, THOI_GIAN, ID_QUAN_AN, ID_HINH_ANH_QUAN_AN, ID_NGUOI_DUNG) 
VALUES ('tieu de 1','nhan xet 1','2023-02-01 11:00:00',1,1,6),
('tieu de 2','nhan xet 2','2023-02-01 11:00:00',1,1,6),
('tieu de 3','nhan xet 3','2023-02-01 11:00:00',1,1,6),
('tieu de 4','nhan xet 4','2023-02-01 11:00:00',1,1,6),
('tieu de 5','nhan xet 5','2023-02-01 11:00:00',1,1,6),
('tieu de 6','nhan xet 6','2023-02-01 11:00:00',1,1,6),
('tieu de 7','nhan xet 7','2023-02-01 11:00:00',1,1,6),
('tieu de 8','nhan xet 8','2023-02-01 11:00:00',1,1,6),
('tieu de 9','nhan xet 9','2023-02-01 11:00:00',1,1,6),
('tieu de 10','nhan xet 10','2023-02-01 11:00:00',1,1,6);

INSERT INTO BAO_CAO (LOAI_BAO_CAO, ID_BAI_VIET) VALUES ('Spam', 1);
INSERT INTO BAO_CAO (LOAI_BAO_CAO, ID_BAI_VIET) VALUES ('Sai su that', 2);
INSERT INTO BAO_CAO (LOAI_BAO_CAO, ID_BAI_VIET) VALUES ('Noi dung khong phu hop', 3);

INSERT INTO DANH_SACH_YEU_THICH (ID_NGUOI_DUNG) VALUES (1);
INSERT INTO DANH_SACH_YEU_THICH (ID_NGUOI_DUNG) VALUES (2);
INSERT INTO DANH_SACH_YEU_THICH (ID_NGUOI_DUNG) VALUES (3);

INSERT INTO BAI_VIET_THUOC_DANH_SACH_YEU_THICH (ID_BAI_VIET, ID_DANH_SACH) VALUES (1, 2);
INSERT INTO BAI_VIET_THUOC_DANH_SACH_YEU_THICH (ID_BAI_VIET, ID_DANH_SACH) VALUES (2, 3);
INSERT INTO BAI_VIET_THUOC_DANH_SACH_YEU_THICH (ID_BAI_VIET, ID_DANH_SACH) VALUES (3, 1);

INSERT INTO THONG_BAO (THOI_GIAN, NOI_DUNG, ID_NGUOI_DUNG)
VALUES ('2023-02-01 14:00:00', 'Thong bao nguoi dung 1', 1);

INSERT INTO THONG_BAO (THOI_GIAN, NOI_DUNG, ID_NGUOI_DUNG)
VALUES ('2023-02-01 15:00:00', 'Thong bao nguoi dung 2', 2);

INSERT INTO THONG_BAO (THOI_GIAN, NOI_DUNG, ID_NGUOI_DUNG)
VALUES ('2023-02-01 16:00:00', 'Thong bao nguoi dung 3', 3);

INSERT INTO THEO_DOI (ID_NGUOI_DUNG_THEO_DOI, ID_NGUOI_DUNG_DUOC_THEO_DOI) 
VALUES (1, 2);

INSERT INTO THEO_DOI (ID_NGUOI_DUNG_THEO_DOI, ID_NGUOI_DUNG_DUOC_THEO_DOI) 
VALUES (2, 3);

INSERT INTO THEO_DOI (ID_NGUOI_DUNG_THEO_DOI, ID_NGUOI_DUNG_DUOC_THEO_DOI) 
VALUES (3, 1);


-- select * from MON_AN;
-- delete from MON_AN;
INSERT INTO MON_AN (TEN_MON, GIA_TIEN, ID_QUAN_AN, ID_HINH_ANH) 
VALUES ('cafo sua',40,4,5),
('cafo do',35,4,5),
('tr� sua thoi do',40,4,5),
('tr� sua thoi xanh',40,4,5),
('chanh tuoi',40,4,5),
('cafo bailey',60,4,5),
('cafo rum',55,4,5),
('cafo kem',60,4,5),
('tr� d�o',50,4,5),
('soda viet quat',50,4,5),
('soda chanh',50,4,5),
('soda phyc bon tu',50,4,5),
('soda chanh doy',50,4,5),
('deep blue sea',50,4,5),
('blue bay',50,4,5),
('purple rain soda',50,4,5),
('galaxy soda',55,4,5),
('mojito chanh doy',50,4,5),
('mojito luu',50,4,5),
('cacao sua',40,4,5),
('matcha latte',40,4,5),
('tr� hoa biet',45,4,5),
('yougurt do',50,4,5),
('yougurt viet quat',50,4,5),
('coke',35,4,5),
('sting',35,4,4);

INSERT INTO BAI_VIET_CO_MON_AN (ID_BAI_VIET, ID_MON_AN, ID_HINH_ANH,
NHAN_XET) VALUES (1, 1, 1, 'nhan xet'),
(2, 2, 2, 'nhan xet'),
(3, 3, 3, 'nhan xet');

INSERT INTO BINH_LUAN (THOI_GIAN, NOI_DUNG, ID_BAI_VIET, ID_NGUOI_DUNG) 
VALUES ('2023-02-01 17:00:00', 'binh luan', 1, 1);

INSERT INTO BINH_LUAN (THOI_GIAN, NOI_DUNG, ID_BAI_VIET, ID_NGUOI_DUNG) 
VALUES ('2023-02-01 18:00:00', 'binh luan', 2, 2);

INSERT INTO BINH_LUAN (THOI_GIAN, NOI_DUNG, ID_BAI_VIET, ID_NGUOI_DUNG) 
VALUES ('2023-02-01 19:00:00', 'binh luan', 3, 3);

INSERT INTO CUOC_TRO_CHUYEN (ID_NGUOI_DUNG_1, ID_NGUOI_DUNG_2, THONG_BAO, CHAN) 
VALUES (1, 2, 1, 0);

INSERT INTO CUOC_TRO_CHUYEN (ID_NGUOI_DUNG_1, ID_NGUOI_DUNG_2, THONG_BAO, CHAN) 
VALUES (2, 3, 0, 0);

INSERT INTO CUOC_TRO_CHUYEN (ID_NGUOI_DUNG_1, ID_NGUOI_DUNG_2, THONG_BAO, CHAN) 
VALUES (3, 1, 1, 1);

INSERT INTO THE_LOAI (TEN_THE_LOAI) VALUES ('Mon Han');
INSERT INTO THE_LOAI (TEN_THE_LOAI) VALUES ('Mon Nhat');
INSERT INTO THE_LOAI (TEN_THE_LOAI) VALUES ('Mon Au');

--INSERT INTO THE_LOAI_NHA_HANG (ID_THE_LOAI, ID_QUAN_AN) VALUES (1, 1),(2,2),(3,3);

INSERT INTO TIN_NHAN (ID_CUOC_TRO_CHUYEN, THOI_GIAN, NOI_DUNG, CUA_USER_NAO) 
VALUES (1, '2023-02-01 20:00:00', 'test tro chuyen 1', 0);

INSERT INTO TIN_NHAN (ID_CUOC_TRO_CHUYEN, THOI_GIAN, NOI_DUNG, CUA_USER_NAO) 
VALUES (2, '2023-02-01 21:00:00', 'test tro chuyen 2', 1);

INSERT INTO TIN_NHAN (ID_CUOC_TRO_CHUYEN, THOI_GIAN, NOI_DUNG, CUA_USER_NAO) 
VALUES (3, '2023-02-01 22:00:00', 'test tro chuyen 3', 0);

INSERT INTO DU_LIEU_DE_XUAT (ID_NGUOI_DUNG, ID_THE_LOAI, MOC_THOI_GIAN) 
VALUES (1, 1, 'moc thoi gian 1');

INSERT INTO DU_LIEU_DE_XUAT (ID_NGUOI_DUNG, ID_THE_LOAI, MOC_THOI_GIAN) 
VALUES (2, 2, 'moc thoi gian 2');

INSERT INTO DU_LIEU_DE_XUAT (ID_NGUOI_DUNG, ID_THE_LOAI, MOC_THOI_GIAN) 
VALUES (3, 3, 'moc thoi gian 3');

INSERT INTO [DBO].[DANH_GIA] 
([VE_SINH],[HUONG_VI],[KHONG_GIAN],[PHUC_VU],[GIA_CA],[ID_NGUOI_DUNG],[ID_BAI_VIET],[THOI_GIAN])
VALUES
(3.5, 4.5, 4, 3, 5, 1, 1, '2023-02-18'),
(4, 3.5, 5, 1, 4, 2, 1, '2023-02-18'),
(4, 3.5, 5, 1, 4, 3, 1, '2023-02-18');
GO

-- Insert rows into table 'THE_LOAI_QUAN_AN' in schema '[dbo]'
INSERT INTO [dbo].[THE_LOAI_QUAN_AN] 
VALUES 
(1, 1),
(1, 2),
(1, 3),
(2, 2),
(3, 1);
GO

INSERT INTO [dbo].[BAI_VIET_CO_MON_AN]
VALUES
(1, 1, 1, 'Nhan xet mon an 1'),
(1, 2, 2, 'Nhan xet mon an 2'),
(2, 1, 3, 'Nhan xet mon an 3'),
(2, 2, 4, 'Nhan xet mon an 4');
GO