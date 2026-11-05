# Website Bán Trà Sữa -    Trần Văn Hưng

Website thương mại điện tử bán trà sữa trực tuyến, built với **ASP.NET MVC 5 (C#)**, LINQ to SQL và SQL Server.

---

## Máy cần cài gì

- **Visual Studio 2017 trở lên** (kèm workload ASP.NET, .NET Framework 4.5+) - Tải tại: https://visualstudio.microsoft.com/downloads/
- **SQL Server** - Dùng SQL Server Express là đủ (kèm SSMS để chạy file SQL)

---

## Cách chạy (Click chạy ngay)

Trong thư mục dự án, có 2 file script:

| File | Dùng khi |
|------|----------|
| `Chay-Du-An.bat` | Máy đã từng chạy, có database rồi |
| `Chay-Day-Du-Chu.bat` | Máy mới, lần đầu chạy |

Nhấn đúp vào file phù hợp → xong.

---
## Cách chạy bằng tay (Visual Studio)

### Bước 1: Tạo cơ sở dữ liệu
Mở file `QuanLiTraSua.sql` bằng **SQL Server Management Studio (SSMS)** → nhấn **Execute (F5)**.
Script sẽ tạo CSDL `QuanLiTraSua` cùng dữ liệu mẫu (sản phẩm, thể loại, tài khoản admin, cấu hình cửa hàng).

### Bước 2: Sửa đường dẫn database
Mở file `src/WebTraSua/Web.config` bằng Notepad hoặc VS Code.
Tìm dòng `Data Source=...`, sửa thành server SQL trên máy bạn:

| Loại SQL Server | Data Source |
|---|---|
| SQL Server Express | `.\SQLEXPRESS` |
| SQL Server đầy đủ | `localhost` hoặc `.` |
| LocalDB | `(localdb)\MSSQLLocalDB` |

Ví dụ nếu dùng SQL Server Express:
```xml
<add name="QuanLiTraSuaConnectionString"
     connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=QuanLiTraSua;Integrated Security=True"
     providerName="System.Data.SqlClient"/>
```

### Bước 3: Mở solution
Mở file `src/WebTraSua.sln` bằng Visual Studio.

### Bước 4: Restore và chạy
Chuột phải Solution → **Restore NuGet Packages**, sau đó nhấn **F5** (hoặc Ctrl+F5) để build và chạy trên IIS Express.

### Bước 5: Mở trình duyệt
Truy cập: **http://localhost:64335**

---

## Tài khoản đăng nhập

| Vai trò | Tài khoản | Mật khẩu |
|---------|-----------|----------|
| Quản trị (Admin) | `admin` | `admin123` |
| Khách hàng | `khachhang` | `123456` |

---

## Cấu trúc thư mục

```
ASPNET-DK25TTC5-TRANVANHUNG-BANTRASUA/
├── Chay-Du-An.bat        # Script chạy nhanh
├── Chay-Day-Du-Chu.bat   # Script cài đặt + chạy
├── Progress_Report/      # Báo cáo tiến độ
├── src/WebTraSua/
│   ├── Controllers/      # Xử lý logic
│   ├── Models/           # Cấu trúc dữ liệu
│   ├── Views/            # Giao diện
│   └── Web.config        # Cấu hình database
├── thesis/               # Báo cáo đồ án
├── QuanLiTraSua.sql      # Script tạo database
└── README.md             # File này
```

---

## Tính năng chính

- **Khách hàng**: Xem sản phẩm theo thể loại, xem chi tiết, giỏ hàng, đặt hàng, đăng ký/đăng nhập
- **Admin**: Quản lý sản phẩm, quản lý thể loại, quản lý phân loại, quản lý đơn hàng, cập nhật thông tin cửa hàng
- **2 vai trò**: Admin, Khách hàng

---

## Ghi chú quan trọng

- Đổi mật khẩu admin mặc định sau khi deploy
- Dữ liệu mẫu (sản phẩm, thể loại, tài khoản admin) được tạo sẵn trong file SQL
- File SQL tạo database nằm ở thư mục gốc: `QuanLiTraSua.sql`

---

**Sinh viên**: Trần Văn Hưng | **Lớp**: DK25TTC5

---

## 📖 Giới thiệu

**Website Bán Trà Sữa (WebTraSua)** là đồ án môn học **Chuyên đề ASP.NET (mã học phần 220064)**, xây dựng bằng **ASP.NET MVC 5**. Ứng dụng mô phỏng một cửa hàng trà sữa trực tuyến: khách hàng duyệt menu theo thể loại (trà sữa, trà trái cây, cà phê, đá xay, topping), thêm món vào giỏ hàng và đặt hàng; cửa hàng có trang quản trị riêng để quản lý sản phẩm và đơn hàng.

### 🎯 Mục tiêu dự án
- Xây dựng website bán hàng trực tuyến hoàn chỉnh theo mô hình MVC
- Đơn giản hóa quy trình chọn món, đặt hàng và theo dõi đơn
- Cung cấp trang quản trị đầy đủ cho việc quản lý menu và đơn hàng
- Áp dụng kiến thức ASP.NET MVC, LINQ to SQL và SQL Server vào bài toán thực tế

---

## ✨ Tính năng nổi bật

### 👥 Dành cho Khách hàng
- **🏠 Trang chủ** – Banner slide, giới thiệu sản phẩm nổi bật
- **🧋 Xem menu theo thể loại** – Trà sữa, trà trái cây, cà phê, đá xay, topping
- **🔎 Xem theo phân loại** – Bán chạy, món mới, khuyến mãi
- **📄 Chi tiết sản phẩm** – Mô tả, giá, nhiều hình ảnh, tình trạng còn hàng
- **🛒 Giỏ hàng** – Thêm / xoá / cập nhật số lượng, tự tính tổng tiền
- **📦 Đặt hàng** – Nhập thông tin giao hàng, xác nhận đơn và theo dõi trạng thái
- **👤 Quản lý tài khoản** – Đăng ký, đăng nhập, đổi mật khẩu

### 🔧 Dành cho Admin
- **🔐 Trang đăng nhập quản trị riêng** – Tách biệt với đăng nhập khách hàng
- **🧋 Quản lý sản phẩm** – Thêm / sửa / xoá, upload tối đa 4 hình cho mỗi món
- **🗂️ Quản lý thể loại** – Thêm / sửa / xoá thể loại kèm logo
- **🏷️ Quản lý phân loại** – Gắn nhãn bán chạy / món mới / khuyến mãi
- **📋 Quản lý đơn đặt hàng** – Xem chi tiết, cập nhật trạng thái thanh toán và giao hàng
- **⚙️ Cập nhật thông tin cửa hàng** – Logo và số điện thoại hiển thị trên website

### 🔐 Bảo mật & Phân quyền
- **ASP.NET Identity 2.2 + OWIN** – Xác thực người dùng khách hàng
- **Session-based admin** – Khu vực quản trị yêu cầu đăng nhập riêng
- **Anti-forgery token** – Chống CSRF cho các form gửi dữ liệu

---

## 🛠️ Công nghệ sử dụng

| Thành phần | Công nghệ |
|------------|-----------|
| **Ngôn ngữ** | C# |
| **Backend Framework** | ASP.NET MVC 5.2.3 (.NET Framework 4.5) |
| **Database** | Microsoft SQL Server |
| **ORM** | LINQ to SQL (`DataClasses1.dbml`) + Entity Framework 6.1.3 |
| **Authentication** | ASP.NET Identity 2.2 + OWIN |
| **Frontend** | Razor View, HTML5, CSS3, JavaScript |
| **UI Framework** | Bootstrap 3 + jQuery |
| **Phân trang** | PagedList.Mvc |

### 🎨 Thiết kế UI
- **Tông màu chủ đạo**: Nâu sữa – kem, gợi cảm giác đồ uống
- **Bố cục**: Banner slide trang chủ, lưới sản phẩm dạng card
- **Hiệu ứng**: Hover trên card sản phẩm, chuyển trang mượt
- **Responsive**: Tối ưu cho Desktop và Tablet

---

## 📂 Cấu trúc dự án

```
src/WebTraSua/
│
├── Controllers/
│   ├── HomeController.cs          # Trang chủ, giới thiệu, liên hệ
│   ├── WebTraSuaController.cs     # Danh sách sản phẩm, thể loại, phân loại, chi tiết
│   ├── GioHangController.cs       # Giỏ hàng, đặt hàng, thanh toán
│   ├── AdminController.cs         # Quản trị (sản phẩm, thể loại, đơn hàng)
│   ├── AccountController.cs       # Đăng ký, đăng nhập, quên mật khẩu
│   ├── ManageController.cs        # Quản lý tài khoản cá nhân
│   └── NguoiDungController.cs     # Thông tin người dùng
│
├── Models/
│   ├── DataClasses1.dbml          # LINQ to SQL — ánh xạ toàn bộ bảng CSDL
│   ├── GioHang.cs                 # Model giỏ hàng (lưu trong Session)
│   ├── IdentityModels.cs          # Model người dùng ASP.NET Identity
│   ├── AccountViewModels.cs       # ViewModel đăng ký / đăng nhập
│   └── ManageViewModels.cs        # ViewModel quản lý tài khoản
│
├── Views/
│   ├── Home/                      # Views trang chủ
│   ├── WebTraSua/                 # Views sản phẩm
│   ├── GioHang/                   # Views giỏ hàng, đặt hàng
│   ├── Admin/                     # Views quản trị
│   ├── Account/                   # Views tài khoản
│   └── Shared/                    # Layout và partial views
│
├── Content/                       # CSS
├── Scripts/                       # JavaScript
├── images/, image_slide/          # Hình sản phẩm, banner
├── App_Start/                     # RouteConfig, BundleConfig, FilterConfig
├── Global.asax.cs                 # Entry point ứng dụng
└── Web.config                     # Cấu hình + chuỗi kết nối
```

---

## 🗂️ Database Schema

CSDL tên **`QuanLiTraSua`** gồm các bảng chính:

#### **ChiTietSanPham** (Sản phẩm)
| Cột | Kiểu | Mô tả |
|-----|------|-------|
| MaSP | int | Primary key |
| TenSP | nvarchar | Tên món (trà sữa trân châu đường đen, ...) |
| NguyenLieu | nvarchar | Nguyên liệu chính |
| GiaBan | decimal | Giá bán |
| MoTa | ntext | Mô tả sản phẩm |
| AnhBia, Anh_1, Anh_2, Anh_3 | varchar | Đường dẫn hình ảnh |
| SlTon | int | Số lượng tồn kho |
| NgayCapNhat | datetime | Ngày cập nhật |
| MaTheLoai | int | Foreign key đến TheLoaiSanPham |
| MaLoai | int | Foreign key đến PhanLoaiSanPham |

#### **TheLoaiSanPham** (Thể loại)
| Cột | Kiểu | Mô tả |
|-----|------|-------|
| MaTheLoai | int | Primary key |
| TenTheLoai | nvarchar | Trà sữa / Trà trái cây / Cà phê / Đá xay / Topping |
| Logo | varchar | Hình đại diện thể loại |

#### **PhanLoaiSanPham** (Phân loại)
| Cột | Kiểu | Mô tả |
|-----|------|-------|
| MaLoai | int | Primary key |
| Loai | nvarchar | Bán chạy / Món mới / Khuyến mãi |

#### **DonDatHang** (Đơn đặt hàng)
| Cột | Kiểu | Mô tả |
|-----|------|-------|
| MaDonHang | int | Primary key |
| MaKH | int | Foreign key đến KhachHang |
| NgayDat | datetime | Ngày đặt |
| NgayGiao | datetime | Ngày giao |
| DaThanhToan | bit | Đã thanh toán hay chưa |
| TinhTrangGiaoHang | bit | Trạng thái giao hàng |

#### **ChiTietDonHang** (Chi tiết đơn)
| Cột | Kiểu | Mô tả |
|-----|------|-------|
| MaDonHang | int | Foreign key đến DonDatHang |
| MaSP | int | Foreign key đến ChiTietSanPham |
| SlMua | int | Số lượng đặt |
| DonGia | decimal | Đơn giá tại thời điểm đặt |

#### **Các bảng khác**
| Bảng | Ý nghĩa |
|------|---------|
| `KhachHang` | Thông tin khách hàng (tên, SĐT, địa chỉ, email) |
| `Admin` | Tài khoản quản trị |
| `CapNhat_LogoCuaHang` | Logo cửa hàng hiển thị trên website |
| `CapNhat_SdtCuaHang` | Số điện thoại cửa hàng |
| `AspNetUsers`, `AspNetRoles`, ... | Bảng hệ thống ASP.NET Identity |

---

## 🚀 Hướng dẫn cài đặt và chạy

### 1️⃣ Yêu cầu hệ thống
- **Visual Studio 2017** trở lên (hoặc 2015) với .NET Framework 4.5+
- **SQL Server Express** trở lên + **SSMS**
- **Git** (để clone repository)

### 2️⃣ Clone repository
```bash
git clone https://github.com/harvin99/ASPNET-DK25TTC5-TRANVANHUNG-BANTRASUA.git
cd ASPNET-DK25TTC5-TRANVANHUNG-BANTRASUA
```

### 3️⃣ Tạo database
Mở `QuanLiTraSua.sql` bằng SSMS → nhấn **Execute (F5)**.

### 4️⃣ Cập nhật chuỗi kết nối
Sửa `Data Source` trong `src/WebTraSua/Web.config` cho khớp với SQL Server trên máy bạn.

### 5️⃣ Restore & Build
Mở `src/WebTraSua.sln` → chuột phải Solution → **Restore NuGet Packages** → **Build Solution**.

### 6️⃣ Chạy ứng dụng
Nhấn **F5** (hoặc Ctrl+F5). Ứng dụng sẽ chạy tại: **http://localhost:64335**

### 7️⃣ Dữ liệu mẫu (Demo Data)
File `QuanLiTraSua.sql` đã tạo sẵn:
- **1 tài khoản Admin**:
  - Tài khoản: `admin`
  - Mật khẩu: `admin123`
- **1 tài khoản khách hàng demo**: `khachhang` / `123456`
- **5 thể loại** (Trà sữa, Trà trái cây, Cà phê, Đá xay, Topping) và **3 phân loại** (Bán chạy, Món mới, Khuyến mãi)
- **15 sản phẩm mẫu** kèm hình ảnh có sẵn trong `src/WebTraSua/images`
- **Cấu hình cửa hàng** (logo, số điện thoại)

---

## 📋 Routes & Endpoints

### 🏠 Public Routes
| Route | Method | Mô tả |
|-------|--------|-------|
| `/` | GET | Trang chủ |
| `/WebTraSua/Index` | GET | Danh sách toàn bộ sản phẩm (có phân trang) |
| `/WebTraSua/TheLoaiSanPham` | GET | Danh sách thể loại |
| `/WebTraSua/PhanLoaiSanPham` | GET | Danh sách phân loại |
| `/WebTraSua/SP_TheoTheLoai/{id}` | GET | Sản phẩm theo thể loại |
| `/WebTraSua/SP_TheoPhanLoai/{id}` | GET | Sản phẩm theo phân loại |
| `/WebTraSua/ChiTietSanPham/{id}` | GET | Chi tiết sản phẩm |
| `/WebTraSua/LienHe` | GET | Trang liên hệ |
| `/Account/Login` | GET/POST | Đăng nhập |
| `/Account/Register` | GET/POST | Đăng ký tài khoản |

### 🛒 Giỏ hàng & Đặt hàng
| Route | Method | Mô tả |
|-------|--------|-------|
| `/GioHang/ThemGioHang` | GET | Thêm sản phẩm vào giỏ |
| `/GioHang/GioHang` | GET | Xem giỏ hàng |
| `/GioHang/CapnhatGioHang` | POST | Cập nhật số lượng |
| `/GioHang/XoaGiohang/{iMaSP}` | GET | Xoá 1 sản phẩm khỏi giỏ |
| `/GioHang/XoaTatCaGioHang` | GET | Xoá toàn bộ giỏ hàng |
| `/GioHang/DatHang` | GET/POST | Nhập thông tin và đặt hàng |
| `/GioHang/XacNhanDonHang` | GET | Xác nhận đơn hàng |
| `/GioHang/ThanhToan_ThanhCong` | GET | Đặt hàng thành công |

### 👨‍💼 Admin Routes
| Route | Method | Mô tả |
|-------|--------|-------|
| `/Admin/Login` | GET/POST | Đăng nhập quản trị |
| `/Admin/Index` | GET | Trang quản trị chính |
| `/Admin/SanPham` | GET | Danh sách sản phẩm |
| `/Admin/ThemMoiSanPham` | GET/POST | Thêm sản phẩm mới |
| `/Admin/SuaSanPham/{id}` | GET/POST | Sửa sản phẩm |
| `/Admin/XoaSanPham/{id}` | GET | Xoá sản phẩm |
| `/Admin/ChiTietSanPham/{id}` | GET | Chi tiết sản phẩm |
| `/Admin/TheLoaiSanPham` | GET | Danh sách thể loại |
| `/Admin/ThemMoiTheLoai` | GET/POST | Thêm thể loại |
| `/Admin/SuaTheLoai/{id}` | GET/POST | Sửa thể loại |
| `/Admin/XoaTheLoai/{id}` | GET | Xoá thể loại |

---

## 🎯 Use Cases

### Use Case 1: Khách hàng đặt trà sữa
1. Khách truy cập trang chủ
2. Chọn thể loại (ví dụ "Trà sữa") hoặc xem món bán chạy
3. Click vào sản phẩm để xem chi tiết (giá, mô tả, hình)
4. Click "Thêm vào giỏ hàng"
5. Vào giỏ hàng kiểm tra số lượng và tổng tiền
6. Điền thông tin giao hàng và xác nhận đặt hàng

### Use Case 2: Khách hàng cập nhật giỏ hàng
1. Vào trang giỏ hàng
2. Sửa số lượng của món cần thay đổi → "Cập nhật"
3. Hoặc click "Xoá" để bỏ món khỏi giỏ
4. Hệ thống tính lại tổng tiền

### Use Case 3: Admin thêm món mới vào menu
1. Đăng nhập `/Admin/Login` với tài khoản admin
2. Vào "Quản lý sản phẩm" → "Thêm mới sản phẩm"
3. Nhập tên món, giá, mô tả, chọn thể loại và phân loại
4. Upload tối đa 4 hình ảnh
5. Lưu → món mới hiển thị ngay trên website

### Use Case 4: Admin xử lý đơn hàng
1. Đăng nhập trang quản trị
2. Vào "Quản lý đơn đặt hàng"
3. Xem chi tiết đơn (khách hàng, món, số lượng, tổng tiền)
4. Cập nhật trạng thái thanh toán và giao hàng
5. Lưu thay đổi

---

## 📝 Ghi chú quan trọng

### ⚠️ Lưu ý bảo mật
- Đổi mật khẩu admin mặc định sau khi deploy
- Cấu hình HTTPS cho production
- Bảo vệ connection string trong `Web.config` khi triển khai thực tế
- Không commit file cấu hình chứa thông tin nhạy cảm lên Git

### 🔄 Roadmap tương lai
- [ ] Tích hợp thanh toán online (VNPay, MoMo)
- [ ] Gửi email/SMS xác nhận khi đơn thay đổi trạng thái
- [ ] Tìm kiếm và lọc sản phẩm theo giá
- [ ] Đánh giá và bình luận sản phẩm
- [ ] Chương trình tích điểm cho khách hàng thân thiết
- [ ] Thống kê doanh thu theo ngày / tháng cho Admin
- [ ] Ứng dụng mobile đặt trà sữa

---

## 👥 Đóng góp

Mọi đóng góp đều được hoan nghênh! Vui lòng:
1. Fork repository
2. Tạo branch mới (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Tạo Pull Request

---

## 📄 License

Dự án này được phát triển cho mục đích học tập và demo.

---

## 📞 Liên hệ

**Sinh viên**: Trần Văn Hưng
**Lớp**: DK25TTC5
**Mã học phần**: 220064 — Chuyên đề ASP.NET
**Giảng viên hướng dẫn**: TS. Nguyễn Nhứt Lam
 Sđt : 0364777144

---

## 🙏 Cảm ơn

Cảm ơn đã quan tâm đến dự án! Nếu bạn thấy hữu ích, hãy cho một ⭐ trên GitHub!
