Lưu ý khi chạy app:
- Trước khi chạy app, cần chạy các file scripts sau:
	+ File script DentalClinicManagement.sql trong folder Scripts để thực hiện import dữ liệu vào SQLSERVER.
	+ Khi chạy phiên bản app đã xử lí tranh chấp: query.sql chứa các stored procedure phiên bản đã xử lí
	tranh chấp. (cùng cấp với source code)
	+ Khi chạy phiên bản app chưa xử lí tranh chấp: query_unFix.sql chứa các stored procedure phiên bản chưa
	xử lí tranh chấp. (cùng cấp với source code)
- Để chạy app, khởi chạy DentalClinicManagement trong từng folder -> truy cập file Database.cs
-> Đổi ConnectionString ở dòng 22 