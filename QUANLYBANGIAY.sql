CREATE DATABASE QLBG
GO
USE QLBG
GO

-- Xóa cơ sở dữ liệu nếu có
DROP DATABASE IF EXISTS QLBG
GO

-- Tạo lại cơ sở dữ liệu và các bảng
CREATE TABLE USERS (
    ID_KhachHang INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(60),
    NgaySinh DATETIME,
    DiaChi NVARCHAR(60),
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(60),
    SoDienThoai NVARCHAR(13),
    TaiKhoan NVARCHAR(50),
    MatKhau NVARCHAR(50),
    Role BIT Default 0
);

CREATE TABLE THUONGHIEU (
    ID_ThuongHieu INT PRIMARY KEY,
    TenThuongHieu NVARCHAR(50)
);

CREATE TABLE DANHMUC (
    ID_DanhMuc INT PRIMARY KEY,
    TenDanhMuc NVARCHAR(50)
);

CREATE TABLE Sizes (
    ID_Size INT PRIMARY KEY,
    Size INT
);

CREATE TABLE MAU (
    ID_Mau INT PRIMARY KEY,
    TenMau NVARCHAR(50)
);

CREATE TABLE HINHANH (
    ID_Anh INT PRIMARY KEY,
    AnhChinh NVARCHAR(255),
    Anh1 NVARCHAR(255),
    Anh2 NVARCHAR(255)
);

CREATE TABLE SANPHAM (
    ID_SanPham INT IDENTITY(1,1) PRIMARY KEY,
    TenSanPham NVARCHAR(100),
    ID_ThuongHieu INT,
    ID_DanhMuc INT,
    ID_Anh INT,
    ID_Size INT,
    ID_Mau INT,
    Mota NVARCHAR(255),
    DonViGia DECIMAL(10, 2),
    SoLuongTon INT,
    FOREIGN KEY (ID_ThuongHieu) REFERENCES THUONGHIEU(ID_ThuongHieu),
    FOREIGN KEY (ID_DanhMuc) REFERENCES DANHMUC(ID_DanhMuc),
    FOREIGN KEY (ID_Anh) REFERENCES HINHANH(ID_Anh),
    FOREIGN KEY (ID_Size) REFERENCES Sizes(ID_Size),
    FOREIGN KEY (ID_Mau) REFERENCES MAU(ID_Mau)
);

CREATE TABLE DATHANG (
    ID_DatHang INT PRIMARY KEY IDENTITY(1,1),
    ID_KhachHang INT,
    NgayDat DATE,
    SoLuong INT,
    TongThanhTien DECIMAL(18, 2),
    FOREIGN KEY (ID_KhachHang) REFERENCES USERS(ID_KhachHang)
);

CREATE TABLE CT_DATHANG (
    ID_CTDatHang INT IDENTITY(1,1) PRIMARY KEY,
    ID_DatHang INT,
    ID_SanPham INT,
    SoLuong INT,
    DonViGia DECIMAL(10, 2),
    FOREIGN KEY (ID_DatHang) REFERENCES DATHANG(ID_DatHang),
    FOREIGN KEY (ID_SanPham) REFERENCES SANPHAM(ID_SanPham)
);

-- Tạo bảng HOADON
CREATE TABLE HOADON (
    ID_HoaDon INT PRIMARY KEY IDENTITY(1,1),
    ID_DatHang INT,
    NgayLap DATE,
    TongTien DECIMAL(18, 2),
    FOREIGN KEY (ID_DatHang) REFERENCES DATHANG(ID_DatHang)
);

-- Tạo bảng CT_HOADON
CREATE TABLE CT_HOADON (
    ID_CT_HoaDon INT PRIMARY KEY IDENTITY(1,1),
    ID_HoaDon INT,
    ID_SanPham INT,
    SoLuong INT,
    DonGia DECIMAL(18, 2),
    FOREIGN KEY (ID_HoaDon) REFERENCES HOADON(ID_HoaDon),
    FOREIGN KEY (ID_SanPham) REFERENCES SANPHAM(ID_SanPham)
);
SET IDENTITY_INSERT USERS ON;
-- Thêm dữ liệu vào bảng USERS
INSERT INTO USERS (ID_KhachHang, HoTen, NgaySinh, DiaChi, GioiTinh, Email, SoDienThoai, TaiKhoan, MatKhau, Role) VALUES
    (1,N'Nguyen Van A', '1990-01-01', N'123 Street, City', N'Nam', 'nguyenvana@gmail.com', '0123456789', 'user1', 'password1', 0),
    (2,N'Tran Thi B', '1985-05-15', N'456 Street, Town', N'Nữ', 'tranthib@gmail.com', '0987654321', 'user2', 'password2', 0),
    (3,N'Le Van C', '1992-08-20', N'789 Street, Village', N'Nam', 'levanc@gmail.com', '0123456789', 'user3', 'password3', 0),
    (4,N'Pham Thanh D', '1988-12-10', N'101 Street, Suburb', N'Nam', 'phamthanhd@gmail.com', '0987654321', 'user4', 'password4', 0),
    (5,N'Vo Thi E', '1995-03-25', N'202 Street, County', N'Nữ', 'vothie@gmail.com', '0123456789', 'user5', 'password5', 0),
    (6,N'Truong Van F', '1982-06-18', N'303 Street, District', N'Nam', 'truongvanf@gmail.com', '0987654321', 'user6', 'password6', 0),
    (7,N'Nguyen Thi G', '1997-09-05', N'404 Street, Province', N'Nữ', 'nguyenthig@gmail.com', '0123456789', 'user7', 'password7', 0),
    (8,N'Hoang Van H', '1980-02-28', N'505 Street, State', N'Nam', 'hoangvanh@gmail.com', '0987654321', 'user8', 'password8', 0),
    (9,N'Le Thi I', '1994-11-15', N'606 Street, Country', N'Nữ', 'lethii@gmail.com', '0123456789', 'user9', 'password9', 0),
    (10,N'Nguyen Van J', '1987-07-08', N'707 Street, Republic', N'Nam', 'nguyenvanj@gmail.com', '0987654321', 'user10', 'password10', 0);

-- Thêm dữ liệu vào bảng THUONGHIEU
INSERT INTO THUONGHIEU (ID_ThuongHieu, TenThuongHieu) VALUES
    (1, N'Fila'),
    (2, N'Nike'),
    (3, N'Adidas'),
    (4, N'Puma'),
    (5, N'Converse'),
    (6, N'Vans'),
    (7, N'New Balance'),
    (8, N'Reebok'),
    (9, N'Under Armour'),
    (10, N'Asics');

-- Thêm dữ liệu vào bảng DANHMUC
INSERT INTO DANHMUC (ID_DanhMuc, TenDanhMuc) VALUES
    (1, N'Giày thể thao'),
    (2, N'Giày nam'),
    (3, N'Giày nữ'),
    (4, N'Giày Trẻ Em'),
    (5, N'Giày chạy bộ'),
    (6, N'Giày công sở'),
    (7, N'Giày sandal'),
    (8, N'Giày tây');

-- Thêm dữ liệu vào bảng Sizes
INSERT INTO Sizes (ID_Size, Size) VALUES
    (1, 35),
    (2, 36),
    (3, 37),
    (4, 38),
    (5, 39),
    (6, 40),
    (7, 41),
    (8, 42),
    (9, 43);

-- Thêm dữ liệu vào bảng MAU
INSERT INTO MAU (ID_Mau, TenMau) VALUES
    (1, N'Trắng'),
    (2, N'Đen'),
    (3, N'Đỏ'),
    (4, N'Xám'),
    (5, N'Màu sắc');

-- Thêm dữ liệu vào bảng HINHANH
INSERT INTO HINHANH(ID_Anh, AnhChinh, Anh1, Anh2) VALUES
    (1, 'Giay001-avt.jpg', 'Giay001-a1.jpg', 'Giay001-a2.jpg'),
    (2, 'Giay002-avt.jpg', 'Giay002-a1.jpg', 'Giay002-a2.jpg'),
    (3, 'Giay003-avt.jpg', 'Giay003-a1.jpg', 'Giay003-a2.jpg'),
    (4, 'Giay004-avt.jpg', 'Giay004-a1.jpg', 'Giay004-a2.jpg'),
    (5, 'Giay005-avt.jpg', 'Giay005-a1.jpg', 'Giay005-a2.jpg'),
    (6, 'Giay006-avt.jpg', 'Giay006-a1.jpg', 'Giay006-a2.jpg'),
    (7, 'Giay007-avt.jpg', 'Giay007-a1.jpg', 'Giay007-a2.jpg'),
    (8, 'Giay008-avt.jpg', 'Giay008-a1.jpg', 'Giay008-a2.jpg'),
    (9, 'Giay009-avt.jpg', 'Giay009-a1.jpg', 'Giay009-a2.jpg'),
    (10,'Giay010-avt.jpg', 'Giay010-a1.jpg', 'Giay010-a2.jpg'),
    (11, 'Giay011-avt.jpg', 'Giay011-a1.jpg', 'Giay011-a2.jpg'),
    (12, 'Giay012-avt.jpg', 'Giay012-a1.jpg', 'Giay012-a2.jpg'),
    (13, 'Giay013-avt.jpg', 'Giay013-a1.jpg', 'Giay013-a2.jpg'),
    (14, 'Giay014-avt.jpg', 'Giay014-a1.jpg', 'Giay014-a2.jpg'),
    (15, 'Giay015-avt.jpg', 'Giay015-a1.jpg', 'Giay015-a2.jpg'),
    (16, 'Giay016-avt.jpg', 'Giay016-a1.jpg', 'Giay016-a2.jpg'),
    (17, 'Giay017-avt.jpg', 'Giay017-a1.jpg', 'Giay017-a2.jpg'),
    (18, 'Giay018-avt.jpg', 'Giay018-a1.jpg', 'Giay018-a2.jpg'),
    (19, 'Giay019-avt.jpg', 'Giay019-a1.jpg', 'Giay019-a2.jpg'),
    (20, 'Giay020-avt.jpg', 'Giay020-a1.jpg', 'Giay020-a2.jpg');

SET IDENTITY_INSERT SANPHAM OFF;
-- Thêm dữ liệu vào bảng SANPHAM
INSERT INTO SANPHAM (TenSanPham, ID_ThuongHieu, ID_DanhMuc, ID_Anh, ID_Size, ID_Mau, Mota, DonViGia, SoLuongTon) VALUES
    (N'Fila Running Shoes 1', 1, 1, 1, 1, 1, N'High-performance running shoes with advanced technology.', 79.99, 100),
    (N'Fila Running Shoes 2', 1, 1, 2, 2, 2, N'Durable running shoes designed for all terrains.', 89.99, 150),
    (N'Fila Sneakers 1', 1, 1, 3, 3, 3, N'Classic sneakers with a stylish and comfortable design.', 99.99, 120),
    (N'Fila Sneakers 2', 1, 1, 4, 4, 4, N'Modern sneakers with a sleek and trendy look.', 109.99, 80),
    (N'Fila Casual Shoes 1', 1, 2, 5, 5, 5, N'Casual shoes for everyday comfort and style.', 69.99, 200),
    (N'Fila Casual Shoes 2', 1, 2, 3, 1, 5, N'Fashionable casual shoes for a relaxed look.', 79.99, 180),
    (N'Fila Sandals 1', 1, 7, 7, 5, 4, N'Comfortable sandals for a day at the beach or casual outings.', 49.99, 90),
    (N'Fila Sandals 2', 1, 7, 8, 1, 3, N'Stylish sandals with a modern design for various occasions.', 59.99, 110),
    (N'Fila Boots 1', 1, 2, 9, 4, 2, N'Durable boots for outdoor activities and harsh conditions.', 129.99, 70),
    (N'Fila Boots 2', 1, 2, 10, 9, 5, N'Trendy boots for a fashionable and bold statement.', 139.99, 60),
    (N'Fila Running Shoes 3', 1, 3, 11, 2, 3, N'High-performance running shoes with advanced technology.', 99.99, 130),
    (N'Fila Running Shoes 4', 1, 4, 12, 3, 4, N'Durable running shoes designed for all terrains.', 109.99, 110),
    (N'Fila Sneakers 3', 1, 1, 13, 4, 5, N'Classic sneakers with a stylish and comfortable design.', 89.99, 170),
    (N'Fila Sneakers 4', 1, 1, 14, 5, 1, N'Modern sneakers with a sleek and trendy look.', 119.99, 90),
    (N'Fila Casual Shoes 3', 1, 3, 15, 3, 2, N'Casual shoes for everyday comfort and style.', 79.99, 200),
    (N'Fila Casual Shoes 4', 1, 4, 16, 2, 3, N'Fashionable casual shoes for a relaxed look.', 89.99, 180),
    (N'Fila Sandals 3', 1, 7, 17, 3, 4, N'Comfortable sandals for a day at the beach or casual outings.', 59.99, 130),
    (N'Fila Sandals 4', 1, 7, 18, 2, 5, N'Stylish sandals with a modern design for various occasions.', 69.99, 150),
    (N'Fila Boots 3', 1, 2, 19, 7, 1, N'Durable boots for outdoor activities and harsh conditions.', 149.99, 70),
    (N'Fila Boots 4', 1, 2, 20, 8, 2, N'Trendy boots for a fashionable and bold statement.', 159.99, 60);









-- Kiểm tra dữ liệu bảng USERS
SELECT * FROM USERS;

-- Xóa dữ liệu không hợp lệ
DELETE FROM USERS WHERE ID_KhachHang = 0;
SET IDENTITY_INSERT USERS off;

-- Thêm dữ liệu vào bảng USERS với quyền Admin
INSERT INTO USERS (HoTen, NgaySinh, DiaChi, GioiTinh, Email, SoDienThoai, TaiKhoan, MatKhau, Role) VALUES
    (N'Nguyen Van An', '1990-01-01', N'123 Street, City', N'Nam', 'nguyenvanan@gmail.com', '0123456789', 'admin', '123', 1);

-- Tạo Sequence
CREATE SEQUENCE UserSequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 10000
    CACHE 10;

-- Sử dụng Sequence để chèn dữ liệu vào bảng USERS
INSERT INTO USERS (ID_KhachHang, HoTen, NgaySinh, DiaChi, GioiTinh, Email, SoDienThoai, TaiKhoan, MatKhau, Role)
VALUES (NEXT VALUE FOR UserSequence, N'Nguyen Van An', '1990-01-01', N'123 Street, City', N'Nam', 'nguyenvanan@gmail.com', '0123456789', 'admin', '123', 1);

-- Xem danh sách dữ liệu bảng USERS
SELECT * FROM USERS;

-- Kiểm tra kết quả
SELECT * FROM SANPHAM;
SELECT * FROM USERS;
SELECT * FROM DATHANG;
SELECT * FROM CT_DATHANG;
SELECT * FROM THUONGHIEU;
SELECT * FROM DANHMUC;
SELECT * FROM MAU;
SELECT * FROM HINHANH;
SELECT * FROM Sizes;

CREATE PROCEDURE sp_DatHang
    @ID_KhachHang INT,
    @NgayDat DATE,
    @SoLuong INT,
    @SanPhamList NVARCHAR(MAX)  -- Chuỗi JSON hoặc dạng danh sách sản phẩm
AS
BEGIN
    SET NOCOUNT ON;
	IF NOT EXISTS (SELECT 1 FROM USERS WHERE ID_KhachHang = @ID_KhachHang)
    BEGIN
        RAISERROR('Khách hàng với ID_KhachHang = %d không tồn tại!', 16, 1, @ID_KhachHang);
        RETURN;
    END
    -- Thêm đơn hàng vào bảng DATHANG
    DECLARE @ID_DatHang INT;
    DECLARE @TongThanhTien DECIMAL(18, 2) = 0.0;

    INSERT INTO DATHANG (ID_KhachHang, NgayDat, SoLuong, TongThanhTien)
    VALUES (@ID_KhachHang, @NgayDat, @SoLuong, 0.0);

    -- Lấy ID của đơn hàng vừa thêm
    SET @ID_DatHang = SCOPE_IDENTITY();

    -- Lấy danh sách sản phẩm từ chuỗi JSON
    DECLARE @ProductTable TABLE (ID_SanPham INT, SoLuong INT, DonGia DECIMAL(18, 2));

    INSERT INTO @ProductTable (ID_SanPham, SoLuong, DonGia)
    SELECT ID_SanPham, SoLuong, DonGia
    FROM OPENJSON(@SanPhamList)
    WITH (
        ID_SanPham INT '$.ID_SanPham',
        SoLuong INT '$.SoLuong',
        DonGia DECIMAL(18, 2) '$.DonGia'
    );

    -- Tính tổng thành tiền
    SELECT @TongThanhTien = SUM(SoLuong * DonGia) FROM @ProductTable;

    -- Cập nhật lại tổng thành tiền cho đơn hàng
    UPDATE DATHANG
    SET TongThanhTien = @TongThanhTien
    WHERE ID_DatHang = @ID_DatHang;

    -- Thêm hóa đơn vào bảng HOADON
    DECLARE @ID_HoaDon INT;
    INSERT INTO HOADON (ID_DatHang, NgayLap, TongTien)
    VALUES (@ID_DatHang, @NgayDat, @TongThanhTien);

    -- Lấy ID của hóa đơn vừa thêm
    SET @ID_HoaDon = SCOPE_IDENTITY();

    -- Thêm chi tiết hóa đơn vào bảng CT_HOADON
    INSERT INTO CT_HOADON (ID_HoaDon, ID_SanPham, SoLuong, DonGia)
    SELECT @ID_HoaDon, ID_SanPham, SoLuong, DonGia
    FROM @ProductTable;

    -- Thêm chi tiết đặt hàng vào bảng CT_DATHANG
    INSERT INTO CT_DATHANG (ID_DatHang, ID_SanPham, SoLuong, DonViGia)
    SELECT @ID_DatHang, ID_SanPham, SoLuong, DonGia
    FROM @ProductTable;

    -- Trả về thông tin đơn hàng và hóa đơn
    SELECT @ID_DatHang AS ID_DatHang, @ID_HoaDon AS ID_HoaDon;
END;

DROP PROCEDURE sp_DatHang
DECLARE @SanPhamList NVARCHAR(MAX) = '[
    {"ID_SanPham": 1, "SoLuong": 1, "DonGia": 79.99},
    {"ID_SanPham": 2, "SoLuong": 1, "DonGia": 89.99},
    {"ID_SanPham": 3, "SoLuong": 2, "DonGia": 99.99}
]';

EXEC sp_DatHang
    @ID_KhachHang = 10,  -- ID của khách hàng, ví dụ là 1
    @NgayDat = '2024-07-15',  -- Ngày đặt hàng
    @SoLuong = 4,  -- Tổng số lượng sản phẩm
    @SanPhamList = @SanPhamList;

SELECT * FROM HOADON;
SELECT * FROM DATHANG;
SELECT * FROM CT_DATHANG;
SELECT * FROM CT_HOADON;


DELETE FROM HOADON;
DELETE FROM DATHANG;
DELETE FROM CT_DATHANG;
DELETE FROM CT_HOADON;




-- Xóa cơ sở dữ liệu
DROP DATABASE QLBG;


CREATE PROCEDURE sp_DatHang
    @ID_KhachHang INT,
    @NgayDat DATE,
    @SoLuong INT,
    @SanPhamList NVARCHAR(MAX)  -- Chuỗi JSON hoặc dạng danh sách sản phẩm
AS
BEGIN
    SET NOCOUNT ON;

    -- Kiểm tra sự tồn tại của khách hàng
    IF NOT EXISTS (SELECT 1 FROM USERS WHERE ID_KhachHang = @ID_KhachHang)
    BEGIN
        RAISERROR('Khách hàng với ID_KhachHang = %d không tồn tại!', 16, 1, @ID_KhachHang);
        RETURN;
    END

    -- Thêm đơn hàng vào bảng DATHANG
    DECLARE @ID_DatHang INT;
    DECLARE @TongThanhTien DECIMAL(18, 2) = 0.0;

    INSERT INTO DATHANG (ID_KhachHang, NgayDat, SoLuong, TongThanhTien)
    VALUES (@ID_KhachHang, @NgayDat, @SoLuong, 0.0);

    -- Lấy ID của đơn hàng vừa thêm
    SET @ID_DatHang = SCOPE_IDENTITY();

    -- Lấy danh sách sản phẩm từ chuỗi JSON
    DECLARE @ProductTable TABLE (ID_SanPham INT, SoLuong INT, DonGia DECIMAL(18, 2), ID_Size INT);

    INSERT INTO @ProductTable (ID_SanPham, SoLuong, DonGia, ID_Size)
    SELECT ID_SanPham, SoLuong, DonGia, ID_Size
    FROM OPENJSON(@SanPhamList)
    WITH (
        ID_SanPham INT '$.ID_SanPham',
        SoLuong INT '$.SoLuong',
        DonGia DECIMAL(18, 2) '$.DonGia',
        ID_Size INT '$.ID_Size'
    );

    -- Tính tổng thành tiền
    SELECT @TongThanhTien = SUM(SoLuong * DonGia) FROM @ProductTable;

    -- Cập nhật lại tổng thành tiền cho đơn hàng
    UPDATE DATHANG
    SET TongThanhTien = @TongThanhTien
    WHERE ID_DatHang = @ID_DatHang;

    -- Thêm hóa đơn vào bảng HOADON
    DECLARE @ID_HoaDon INT;
    INSERT INTO HOADON (ID_DatHang, NgayLap, TongTien)
    VALUES (@ID_DatHang, @NgayDat, @TongThanhTien);

    -- Lấy ID của hóa đơn vừa thêm
    SET @ID_HoaDon = SCOPE_IDENTITY();

    -- Thêm chi tiết hóa đơn vào bảng CT_HOADON
    INSERT INTO CT_HOADON (ID_HoaDon, ID_SanPham, SoLuong, DonGia)
    SELECT @ID_HoaDon, ID_SanPham, SoLuong, DonGia
    FROM @ProductTable;

    -- Thêm chi tiết đặt hàng vào bảng CT_DATHANG
    INSERT INTO CT_DATHANG (ID_DatHang, ID_SanPham, SoLuong, DonViGia, ID_Size)
    SELECT @ID_DatHang, ID_SanPham, SoLuong, DonGia, ID_Size
    FROM @ProductTable;

    -- Trả về thông tin đơn hàng và hóa đơn
    SELECT @ID_DatHang AS ID_DatHang, @ID_HoaDon AS ID_HoaDon;
END;


-- Thêm cột ID_Size vào bảng CT_DATHANG nếu bảng đã tồn tại
ALTER TABLE CT_DATHANG ADD ID_Size INT;

-- Đảm bảo rằng cột ID_Size có khóa ngoại tham chiếu đến bảng Sizes
ALTER TABLE CT_DATHANG ADD FOREIGN KEY (ID_Size) REFERENCES Sizes(ID_Size);


-- Chuỗi JSON mô tả danh sách sản phẩm
DECLARE @SanPhamList NVARCHAR(MAX) = N'[
    {"ID_SanPham": 1, "SoLuong": 2, "DonGia": 100.00, "ID_Size": 1},
    {"ID_SanPham": 2, "SoLuong": 1, "DonGia": 200.00, "ID_Size": 2}
]';

-- Gọi thủ tục lưu trữ để thêm đơn hàng
EXEC sp_DatHang
    @ID_KhachHang = 1,  -- Giả sử có khách hàng với ID = 1
    @NgayDat = '2024-07-30',
    @SoLuong = 3,  -- Tổng số lượng sản phẩm
    @SanPhamList = @SanPhamList;
