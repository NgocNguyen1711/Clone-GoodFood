USE GoodFood;

INSERT INTO HinhAnh
    (Context)
VALUES
    ('/Avatar/abdul-rehman-khalid-ZXMkcHjKx8I-unsplash.jpg'),
    ('/Avatar/amber-kipp-75715CVEJhI-unsplash.jpg'),
    ('/Avatar/andrew-alexander-48IklXGGfZ0-unsplash.jpg'),
    ('/Avatar/hang-niu-Tn8DLxwuDMA-unsplash.jpg'),
    ('/Avatar/michael-sum-LEpfefQf4rU-unsplash.jpg'),
    ('/Avatar/paulo-brandao-YLgTmdb7r1o-unsplash.jpg');
INSERT INTO HinhAnh
    (Context)
VALUES
    ('/Post/1img1.png'),
    ('/Post/1img2.png'),
    ('/Post/1img3.png'),
    ('/Post/1img4.png'),
    ('/Post/1img5.png'),
    ('/Post/2img1.png'),
    ('/Post/2img2.png'),
    ('/Post/2img3.png'),
    ('/Post/2img4.png'),
    ('/Post/2img5.png'),
    ('/Post/3img1.png'),
    ('/Post/3img2.png'),
    ('/Post/3img3.png'),
    ('/Post/3img4.png'),
    ('/Post/3img5.png'),
    ('/Post/4img1.png'),
    ('/Post/4img2.png'),
    ('/Post/4img3.png'),
    ('/Post/4img4.png'),
    ('/Post/4img5.png'),
    ('/Post/4img6.png');
INSERT INTO HinhAnh
    (Context)
VALUES
    ('/Dish/COCO1001-CARITRUNGCHIENGAGION.jpg'),
    ('/Dish/COCO1002-CARITRUNGCHIENHEOCHIENXU.jpg'),
    ('/Dish/COCO1003-CARICROQUETTECAHOISOTKEMPHOMAI.jpg'),
    ('/Dish/COCO1004-CARITRUNGCHIENNAMSOTKEM.jpg'),
    ('/Dish/COCO1005-CARITRUNGCHIENTOMCHIENGION.jpg'),
    ('/Dish/COCO1005-GACHIENTONGHOP.jpg'),
    ('/Dish/default.png');

INSERT INTO HinhAnh
    (Context)
VALUES
    ('/Restaurant/coco.png'),
    ('/Restaurant/speit.jpg');
-- select * from HinhAnh;

INSERT INTO NguoiDung
    (HoVaTen, SoDienThoai, NgaySinh,
    MatKhau, Email, GioiTinh, HinhAnhId, LoaiNguoiDung)
VALUES
    ('Nguyen Minh Nghia', '0123456001', '2001-10-01', '123', 'test001@gmail.com', 'M', 1, 0),
    ('Nguyen Thuy Ngoc', '0123456002', '2001-10-01', '223', 'test002@gmail.com', 'F', 2, 0),
    ('Tran Pham Thai Hoa', '0123456003', '2001-10-01', '323', 'test003@gmail.com', 'M', 3, 0),
    ('Nguyen Mai Thy', '0123456201', '2001-10-01', '423', 'test201@gmail.com', 'F', 4, 2),
    ('Chung Dong Phong', '0123456101', '2001-10-01', '523', 'test101@gmail.com', 'M', 5, 1),
    ('Le Tran Hoang Thinh', '0123456102', '2001-10-01', '623', 'test102@gmail.com', 'M', 6, 1),
    ('Dinh Gia Quang', '0123456103', '2001-10-01', '723', 'test103@gmail.com', 'M', 1, 1),
    ('Tran Nguyen Lam', '0123456104', '2001-10-01', '823', 'test104@gmail.com', 'M', 2, 1),
    ('Nguyen Trung Phong', '0123456105', '2001-10-01', '923', 'test105@gmail.com', 'M', 3, 1),
    ('Cao Thi Thanh Mai', '0123456202', '2001-10-01', '1023', 'test202@gmail.com', 'F', 4, 2);
-- select * from NguoiDung;
/* select nd.HoVaTen, ha.Context
from NguoiDung nd 
left outer join HinhAnh ha
on nd.IdHinhAnh = ha.id;*/

INSERT INTO DiaChi
    (MoTa)
VALUES
    (N'290, Lý Thái Tổ, Phường 1, Quận 3, TP Hồ Chí Minh'),
    (N'772, Điện Biên Phủ, Phường 1, Quận 3, TP Hồ Chí Minh' );
-- select * from DiaChi;

INSERT INTO QuanAn
    (TenQuanAn, ChatLuong, [Open], [Close],
    SoDienThoai, DiaChiId, HinhAnhId, DaDuyet, NguoiSoHuuId)
VALUES
    ('Coco Ichibanya - Curry House - Vincom Landmark 81', 5.0, '8:00:00', '22:00:00', '0123456789', 1, 35, 1, 5),
    ('Speit Tea And Cheese', 4.3, '12:00:00', '22:00:00', '0123456789', 2, 36, 1, 5);
-- select * from QuanAn;
-- delete from QuanAn;
/*update QuanAn 
set IdHinhAnh = 36
where id = 2;
select qa.TenQuanAn, ha.Context
from QuanAn qa
left outer join HinhAnh ha
on ha.id = qa.IdHinhAnh;*/


INSERT INTO MonAn
    (TenMon, GiaTien, QuanAnId, HinhAnhId)
VALUES
    (N'Cà-ri trứng chiên gà giòn', 127000, 1, 28),
    (N'Cà-ri trứng chiên heo chiên xù', 143000, 1, 29),
    (N'Cà-ri Croquette cá hồi sốt kem & phô mai', 132000, 1, 30),
    (N'Cà-ri trứng chiên nấm sốt kem', 127000, 1, 31),
    (N'Gà chiên tổng hợp', 89000, 1, 33),
    (N'Cà-ri trứng chiên tôm chiên giòn', 143000 , 1, 32),
    (N'RĂNG MỰC BƠ TỎI PHÔ MAI', 120000, 2, 34),
    (N'GÀ CAY PHÔ MAI TOKBOKKI', 55000, 2, 34),
    (N'TRÀ SỮA SỐT MILO', 35000, 2, 34),
    (N'TRÀ SỮA BƠ', 35000, 2, 34),
    (N'Nui Phô Mai Sốt Bò', 55000, 2, 34),
    (N'Sụn Gà Giòn', 45000, 2, 34),
    (N'Thịt cua Phomai', 95000, 2, 34),
    (N'Trà sữa Cacao', 35000, 2, 34),
    (N'Sữa tươi trân châu đường đen', 35000, 2, 34),
    (N'Khoai tây chiên', 40000, 2, 34),
    (N'Khoai tây lắc phomai', 50000, 2, 34),
    (N'Khoai tây lắc rong biển', 50000, 2, 34);
-- select * from HinhAnh;
-- select * from MonAn;

INSERT INTO BaiViet
    (TieuDe, NhanXet, ThoiGian, QuanAnId, HinhAnhQuanAnId, NguoiDungId, VeSinh, HuongVi, KhongGian, PhucVu, GiaCa)
VALUES
    (N'CHẾT MÊ CHẾT MỆT VỚI CARI NHẬT TẠI COCO ICHIBANYA', N'Một đứa không thích ăn cơm như em cũng phải đổ gục trước độ ngon của COCO ICHIBANYA o(≧▽≦)o', '2023-02-01 18:00:00', 1, 22, 5, 5, 5, 5, 5, 4),
    (N'SPEI.T', N'Quán nhỏ nhỏ xinh xinh núp mình trong con hẻm nhưng @spei.t đảm bảo sẽ để lại dấu ấn cực tốt trong lòng mọi người./n /n Quán bé bé xinh xinh thôi chứ chất lượng không đùa đâu nha. Em bị nghiện cái răng mực bơ tỏi phô mai mất rồi, mới nghĩ thôi đã thèm. Các bạn nhân viên cũng thân thiện, nhiệt tình. Có 1 cái khá hạn chế là ai lên lầu ngồi cẩn thận đụng đầu vì trần nhà khá thấp nha, tuy bạn nhân viên đã nhắc em nhưng em vẫn bị đụng 2 lần (*꒦ິ꒳꒦ີ)', '2023-02-01 19:00:00', 2, 7, 6, 5, 5, 5, 5, 4),
    (N'Ở ĐÂY CÓ BÁN SỤN GÀ, RĂNG MỰC NGON NHỨC NHỐI', N'Quán ăn vặt nổi tiếng trong con hẻm nhỏ Lê Thị Riêng mà đến giờ mình mới lần ra được á. Quán nhỏ thôi nhưng khách ra vô liên tục, menu rất đa dạng về đồ ăn vặt cũng như nước uống luôn nha.', '2023-02-01 20:00:00', 2, 12, 7, 5, 5, 5, 5, 4),
    (N'THẾ GIỚI CHEESE', N'[ THẾ GIỚI PHÔ MAI ] - TEAM ĐỒ BÉO NOTE LẠI KO LÀ HỐI HẬN NHÉ !!!', '2023-02-01 11:00:00', 2, 17, 8, 5, 5, 5, 5, 4);
-- select * from BaiViet;

/* select bv.TieuDe, qa.TenQuanAn, ha.Context, nd.HoVaTen
from BaiViet bv
left outer join QuanAn qa on qa.ID = bv.IdQuanAn
left outer join HinhAnh ha on ha.ID = bv.IdHinhAnhQuanAn
left outer join NguoiDung nd on nd.ID = bv.IdNguoiDung;*/
-- select * from NguoiDung;

-- select * from HinhAnh
INSERT INTO BaiVietCoMonAn
    (BaiVietId, MonAnId, HinhAnhId, NhanXet)
VALUES
    (1, 1, 23, N'Phần này bạn em chọn cấp độ 1, ăn cũng không gọi là cay đâu mà vừa ăn. Nước cari đậm đà vừa ăn, sệt sệt ăn với trứng beo béo ngon lắm. Phần gà viên chiên giòn, thịt mềm được tầm 8 viên ăn cũng okela lắm nha'),
    (1, 2, 24, N'Phần này là cấp độ 2 vị nồng hơn một xíu. Thịt heo chiên xù được áo một lớp bột giòn rụm, ráo dầu cắn vào là lớp thịt mềm ăn ngon lắm. Phần này em thấy cũng nhiều người gọi nè #musttry'),
    (1, 3, 25, N'Bạn em gọi 150g cơm + ít cay. Cari ít cay có màu nhạt hơn mấy dĩa khác và ở đây ngoài chọn độ cay của cari mọi người cũng có thể chọn mức cơm ăn cho phù hợp vì một phần cũng lớn, sức ăn ai yếu thì gọi ít lại để đỡ phí. Phần này có thêm phô mai nên béo hơn và bánh cá hồi bên ngoài giòn cắn vào mềm ngon.'),
    (1, 4, 26, N'Phần này xuất sắc luôn, có thêm sốt kem làm cho cari thêm béo, ăn mà mê. Ở đây là kiểu trứng omurice người Nhật hay ăn với cơm như tan trong miệng và có phần béo hơn thêm sốt kem nữa ra một dĩa hoàn hảo luôn.'),
    (1, 5, 27, N'Gọi phần này ăn chơi cũng mlem lắm, có gà viên chiên giòn, khoai tây chiên & đùi gà mini da giòn thịt mềm được tẩm gia vị đậm đà.'),
    (2, 7, 8, N'Mọi người nhất định phải gọi món này khi tới @spei.t, ngon cực kì đảm bảo ăn 1 lần là nhớ. Nước bơ tỏi beo béo ngọt ngọt, có chút vị cay, ăn gây nghiện đó trời ạ σ(≧ε≦σ) ♡ Em chưa ăn ở quán ăn vặt nào mà có răng mực bự khổng lồ như vậy, răng mực siêu nhiều, ăn dai dai mềm mềm. Món này không biết phải khen bao nhiêu lần mới ngừng được nói chung là #musttry'),
    (2, 8, 9, N'Phần này có 2 size, em ăn size nhỏ 55k còn phần lớn 100k. Size nhỏ thôi nhưng gà cũng siêu nhiều, thịt gà mềm, thấm gia vị đậm đà. Tokbokki thì không được dai & mềm lắm. Nước sốt cay cay mặn mặn, đậm đà ăn ngon.'),
    (2, 9, 10, N'TRÀ SỮA SỐT MILO + TRÂN CHÂU ĐƯỜNG ĐEN + OREO CHEESE CUBE. 40K /n Sốt milo dưới đáy nhiều lắm nên mọi người nhớ khuấy đều trước khi uống. Do sốt milo nhiều quá nên hơi bị ngọt, trân châu mềm dai ăn ngon nè. Oreo cheese cube ngon lắm nè, mềm mướt, béo ngọt ăn thích lắm.'),
    (2, 10, 11, N'TRÀ SỮA BƠ + TRÂN CHÂU THƯỜNG + PHÔ MAI TƯƠI MATCHA: 55k /n Uống giống sinh tố bơ, béo béo ngọt ngọt. Bên này em gọi phô mai tươi matcha ăn cũng ngon nè nhưng em thích oreo cheese cube hơn.'),
    (3, 11, 13, N'nóng hổi vừa thổi vừa ăn. Nui phô mai dai dai, béo nhẹ ăn kèm thịt bò sốt ngọt ngọt nè.'),
    (3, 12, 14, N'món bán chạy nhất ở quán. Sụn gà được chiên ráo dầu, giòn rụm chấm với tương xí muội thề là ăn ghiền lắm luôn.'),
    (3, 7, 15, N'giá hơi cao nhưng 1 phần nhiều lắm. Món này có kèm 1 ổ bánh mì để chấm, sốt có vị ngọt béo, răng mực cắn vào sần sật.'),
    (3, 9, 16, N'dù có milo nhưng vẫn giữ được vị chát của trà và thoang thoảng vị cacao nè. Trà sữa không bị ngọt, dễ uống không ngán đâu nha.'),
    (4, 11, 18, N'Ưng cái kia rồi , ưng thêm cái này nữa coi chết ko chứ =)) nui béo từng cọng luôn'),
    (4, 13, 19, N'Bạn đi cùng mình thích cái này cực , vỏ ngoài giòn bên trong có pmai , thanh cua thịt bằm chấm vs nước sốt riêng biệt lạ miệng .'),
    (4, 14, 20, N'Trà sữa Cacao Kem trứng 45k /n /n mình add thêm phô mai tươi uống cùng cacao hay sữa tươi đều hợp . Sữa hơi nhạt và trân châu chưa được dẽo lắm , hơi tiếc 1 xíu nhưng bù lại cacao và kem trứng ưng lắm ạ . Duyệt quán này từ cái nhìn đầu tiên.'),
    (4, 15, 21, N'Sữa tươi trân châu đường đen Kem trứng 45k /n mình add thêm phô mai tươi uống cùng cacao hay sữa tươi đều hợp . Sữa hơi nhạt và trân châu chưa được dẽo lắm , hơi tiếc 1 xíu nhưng bù lại cacao và kem trứng ưng lắm ạ . Duyệt quán này từ cái nhìn đầu tiên.');
-- select * from BaiVietCoMonAn;
/* select bvcma.IdBaiViet, ma.TenMon, ma.GiaTien, ha.Context
from BaiVietCoMonAn bvcma
left outer join MonAn ma on ma.ID = bvcma.IdMonAn
left outer join HinhAnh ha on ha.id = bvcma.IdHinhAnh; */

INSERT INTO BinhLuan
    (ThoiGian, NoiDung, BaiVietId, NguoiDungId)
VALUES
    ('2023-02-01 19:00:00', N'hấp dẫn nha', 2, 5),
    ('2023-02-01 20:00:00', N'Miếng phô maiiiii béooooo ghê', 2, 6),
    ('2023-02-01 21:00:00', N'goy bít thứ 4 đi đâu g', 2, 7);

-- INSERT INTO DanhGia(VeSinh, HuongVi, KhongGian, PhucVu, GiaCa, IdNguoiDung, IdBaiViet, ThoiGian)
-- VALUES (10,10,10,10,8,5,1,'2023-03-01 19:00:00'),
-- (10,10,10,10,10,7,4,'2023-02-05 20:00:00'),
-- (8,8,8,8,8,6,3,'2023-02-10 19:30:00'),
-- (7,8,9,7,7,5,2,'2023-02-20 19:45:00');



INSERT INTO DanhSachYeuThich
    (NguoiDungId)
VALUES
    (5),
    (5);
-- danh sach 1 luu bai viet
-- danh sach 2 luu nha hang
-- select * from DanhSachYeuThich;

INSERT INTO BaiVietThuocDanhSachYeuThich
    (BaiVietId, DanhSachId)
VALUES
    (2, 1);

INSERT INTO QuanAnThuocDanhSachYeuThich
    (QuanAnId, DanhSachId)
VALUES(1, 2);

INSERT INTO TheLoai
    (TenTheLoai)
VALUES
    (N'Salad'),
    (N'Bánh mì'),
    (N'Bánh ngọt'),
    (N'Lẩu'),
    (N'Món Việt'),
    (N'Món Hàn'),
    (N'Món Nhật'),
    (N'Món Thái'),
    (N'Món Âu'),
    (N'Cơm'),
    (N'Mì'),
    (N'Món nướng'),
    (N'Trà sữa'),
    (N'Cà phê'),
    (N'Pizza'),
    (N'Ăn vặt'),
    (N'Hải sản'),
    (N'Thức ăn nhanh'),
    (N'Bar')
;
-- select * from TheLoai;

-- select * from TheLoaiQuanAn;

INSERT INTO TheoDoi
    (NguoiDungTheoDoiId, NguoiDungDuocTheoDoiId)
VALUES
    (5, 6),
    (6, 5),
    (5, 7),
    (5, 8);
-- select * from TheoDoi;

INSERT INTO ReportType
    (Id,[Type])
VALUES
    (1, N'Nội dung không phù hợp'),
    (2, N'Quảng cáo'),
    (3, N'Spam');

INSERT INTO Report
    (ReportTypeId, ReporterId, ReportedPostId, ReportedRestaurantId, ReportedUserId, Description, ThoiGian, IsDeleted)
VALUES
    (1, 1, 1, null, null, '', '2023-03-04 19:00:00', 0),
    (2, 1, 2, null, null, '', '2023-03-05 18:00:00', 0),
    (3, 1, 3, null, null, '', '2023-03-06 17:00:00', 0),
    (1, 2, null, 1, null, '', '2023-03-07 16:00:00', 0),
    (2, 2, null, 2, null, '', '2023-03-08 15:00:00', 0),
    (3, 2, null, 3, null, '', '2023-03-09 14:00:00', 0),
    (1, 3, null, null, 9, '', '2023-03-01 13:00:00', 0),
    (2, 3, null, null, 8, '', '2023-03-02 12:00:00', 0),
    (3, 3, null, null, 7, '', '2023-03-03 11:00:00', 0);

INSERT INTO NguoiDung
    (Email,MatKhau,Salt,LoaiNguoiDung)
VALUES('goodfood.ad.datn@gmail.com',
        'xR/rOKcD7Fw3tQ+ijEjtQ67dtR0fl48Pui6AQ6w3VC4=',
        CONVERT(varbinary(64),'0xE26236E0D778151914F08D1E8D9ED80E5E5E6C971092022C6BA0A37DD9612F34CD6BF805F0F211F8B88085AEA16BD1D98552EDEAF2FB6BDC010FCA2FD9617BD5'),
        0);