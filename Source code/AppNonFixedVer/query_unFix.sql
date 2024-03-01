
CREATE OR ALTER
PROC Select_AllMedical
AS
SET TRAN ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
	BEGIN TRY		
		WAITFOR DELAY '0:0:08'
		------------------
		Select * FROM MedicationList WHERE InventoryNumber > 0 AND Status = 1
	END TRY
	BEGIN CATCH
		PRINT N'Lỗi hệ thống'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
GO

CREATE OR ALTER
PROC Edit_Medical
	@MedicalID int,
	@Name nvarchar(30),
	@Price money,
	@Allocation nvarchar(50),
	@InventoryNumber int,
	@ExpirationDate date
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (Select * FROM MedicationList WHERE @MedicalID = MedicalID)
		BEGIN	
			ROLLBACK TRAN
			RETURN 1
		END
		UPDATE MedicationList
		SET
		Name = @Name,
		Price = @Price,
		Allocation = @Allocation,
		InventoryNumber = @InventoryNumber,
		ExpirationDate = @ExpirationDate
		WHERE MedicalID = @MedicalID
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
RETURN 0

-- Unrepeatable Bao
CREATE OR ALTER 
PROC GetDAT
	@MANS INT,
	@Date date,
	@SHIFT int
AS
--SET TRAN ISOLATION LEVEL REPEATABLE READ
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (Select * FROM DentistsAvailTime WHERE @MANS = DentistID AND @Date = Date AND @SHIFT = Shift AND Status = 0)
		BEGIN
			ROLLBACK TRAN
			RETURN 1
		END
		WAITFOR DELAY '0:0:08'
		---------------
		SELECT * FROM DentistsAvailTime WHERE @MANS = DentistID AND @SHIFT = Shift AND @Date = Date AND Status = 0
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
RETURN 0
GO

CREATE OR ALTER
PROC Update_AvailableTime
	@MANS int,
	@Date date,
	@SHIFT int
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (Select * FROM DentistsAvailTime WHERE @MANS = DentistID AND @Date = Date AND @SHIFT = Shift)
		BEGIN
			ROLLBACK TRAN
			RETURN 1
		END
		UPDATE DentistsAvailTime
		SET Status = 1
		WHERE @MANS = DentistID AND @SHIFT = Shift AND @Date = Date
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
RETURN 0

---- Dirty
﻿CREATE OR ALTER
PROC Make_Appointment
	@MANS int,
	@Shift int,
	@Ngay Date,
	@KH int,
	@Note nvarchar(200)
AS
BEGIN TRAN 
	BEGIN TRY
		IF NOT EXISTS (Select * FROM Dentist WHERE @MANS = DentistID)
		BEGIN 
			ROLLBACK TRAN
			RETURN 1
		END
		IF NOT EXISTS (SELECT * FROM DentistsAvailTime WHERE @MANS = DentistID AND @Shift = Shift AND Date = @Ngay)
		BEGIN 
			ROLLBACK TRAN
			RETURN 1
		END

		INSERT INTO Appointment  (DentistID, Shift, Date, CustomerID, Note, Status)values (@MANS, @Shift, @Ngay, @KH, @Note, 'Waiting')

		WAITFOR DELAY '0:0:05'
		IF NOT EXISTS (Select * From DentistsAvailTime WHERE @MANS = DentistID AND @Shift = Shift AND Date = @Ngay AND Status = 0) 
		BEGIN
			ROLLBACK TRAN
			RETURN 1
		END
		UPDATE DentistsAvailTime SET Status = 1 WHERE DentistID = @MANS AND Shift = @Shift AND Date = @Ngay 
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
RETURN 0
GO
use DentalClinicManagement
CREATE OR ALTER
PROC View_Appointment
	@MANS int
AS
SET TRAN ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (Select * FROM Dentist WHERE @MANS = DentistID)
		BEGIN 
			PRINT @MANS + N' không tồn tại'
			ROLLBACK TRAN
			
		END

		SELECT A.*, C.Name AS CustomerName,C.PhoneNo AS CustomerPhone 
        FROM Appointment A
        INNER JOIN Customer C ON A.CustomerID = C.CustomerID WHERE @MANS = A.DentistID
	END TRY 
	BEGIN CATCH
		PRINT N'Lỗi hệ thống'
		ROLLBACK TRAN
	END CATCH
COMMIT TRAN
GO

-- Phantom Read - Dat
USE DentalClinicManagement
GO

DROP PROCEDURE IF EXISTS DBO.SP_PHANTOMREAD_2;
GO
DROP PROCEDURE IF EXISTS DBO.SP_PHANTOMREAD_1;
GO

CREATE PROCEDURE SP_PHANTOMREAD_1
	@Name nvarchar(30)
AS

BEGIN TRAN
	SELECT *
	FROM MedicationList WHERE Name LIKE @Name AND Status = 1
--ĐỂ TEST
WAITFOR DELAY '0:0:10'
	SELECT *
	FROM MedicationList WHERE Name LIKE @Name AND Status = 1
IF(@@ERROR<>0)
BEGIN
	ROLLBACK
	RETURN 1
END
COMMIT TRAN
RETURN 0
GO


CREATE PROCEDURE SP_PHANTOMREAD_2
	@Name nvarchar (30),
	@Price money,
	@Unit nchar (10),
	@Allocation nvarchar (50),
	@InventoryNumber int,
	@ExpirationDate date,
	@AdministratorID int,
	@status bit
	
as
begin tran
	--kt xem admin có tồn tại hay không
	--KIỂM TRA @AdministratorID CÓ TỒN TẠI TRONG BẢNG Administrator chưa
	if(not exists(select * from Administrator where AdministratorID= @AdministratorID))
	begin
		print @AdministratorID + N' AdministratorID không tồn tại'
		return 1
	end
	INSERT INTO MedicationList (Name, Price, Unit, Allocation, InventoryNumber, ExpirationDate, AdministratorID, Status) 
	VALUES ( @Name, @Price, @Unit, @Allocation, @InventoryNumber, @ExpirationDate, @AdministratorID, @status);

commit tran 
RETURN 0

-- Dirty read - Phuong
USE DentalClinicManagement
GO

DROP PROCEDURE IF EXISTS DBO.SP_DIRTYREAD_3;
GO
DROP PROCEDURE IF EXISTS DBO.SP_DIRTYREAD_4;
GO

CREATE PROC SP_DIRTYREAD_3
	@DentistID INT,
	@Shift INT, 
	@Date  DATE
AS	
BEGIN TRAN
INSERT INTO DentistsAvailTime (DentistID, Shift, Date, Status) 
VALUES (@DentistID, @shift, @Date, 'false');
--ĐỂ TEST
WAITFOR DELAY '00:00:05'
IF(@Shift > 8 or @Shift < 1  or @@ERROR<>0)
	BEGIN
		ROLLBACK
		RETURN 1
	END
COMMIT
RETURN 0
GO

CREATE PROC SP_DIRTYREAD_4
		@Date DATE
AS
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
select d.Shift, de.Name, de.DentistID
	from DentistsAvailTime d, Dentist de
	where @Date = d.Date
	and d.DentistID = de.DentistID
    and d.Status = 0
COMMIT TRAN
GO

----------
-- HUY - Cài đặt tình huống tranh chấp: Lost Update
-- Stored procedure 1 thực hiện giao tác thanh toán hóa đơn bởi NV1
CREATE OR ALTER
PROC sp_LostUpdate_1
	@appointmentRecordID int,
	@date DATETIME,
	@paidAmount money
AS
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	-- B1: Lấy số tiền cần thanh toán
	Declare @total money = (SELECT TotalPrice 
							FROM Payment
							WHERE AppointmentRecordID = @appointmentRecordID AND Date = @date)
	-- Gán trạng thái mới mặc định = 0
	Declare @newStatus bit = 0
	----------
	WAITFOR DELAY '00:00:5'
	----------
	-- B2: Thực hiện tính toán
	-- Nếu tiền đóng > tổng cần thanh toán => Gán tiền đóng = tổng cần thanh toán => Không tính tiền thối
	IF (@paidAmount > @total)
		SET @total = 0
	-- Nếu tiền đóng <= tổng cần thanh toán => Tính bình thường
	ELSE
		SET @total = @total - @paidAmount
	-- Nếu đã trả hết => Set Status = 1
	IF (@total <= 0)
		SET @newStatus = 1

	----------
	-- B3: Cập nhật số tiền thanh toán
	UPDATE Payment
	SET TotalPrice = @total, Status = @newStatus
	WHERE AppointmentRecordID = @appointmentRecordID AND Date = @date

	PRINT (N'Cập nhật thành công.')
COMMIT
RETURN 0
GO

-- Stored procedure 2 thực hiện giao tác thanh toán hóa đơn bởi NV2
CREATE OR ALTER
PROC sp_LostUpdate_2
	@appointmentRecordID int,
	@date DATETIME,
	@paidAmount money
AS
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRAN
	-- B1: Lấy số tiền cần thanh toán
	Declare @total money = (SELECT TotalPrice 
							FROM Payment
							WHERE AppointmentRecordID = @appointmentRecordID AND Date = @date)
	-- Gán trạng thái mới mặc định = 0
	Declare @newStatus bit = 0

	----------
	-- B2: Thực hiện tính toán
	-- Nếu tiền đóng > tổng cần thanh toán => Gán tiền đóng = tổng cần thanh toán => Không tính tiền thối
	IF (@paidAmount > @total)
		SET @total = 0
	-- Nếu tiền đóng <= tổng cần thanh toán => Tính bình thường
	ELSE
		SET @total = @total - @paidAmount
	-- Nếu đã trả hết => Set Status = 1
	IF (@total <= 0)
		SET @newStatus = 1

	----------
	-- B3: Cập nhật số tiền thanh toán
	UPDATE Payment
	SET TotalPrice = @total, Status = @newStatus
	WHERE AppointmentRecordID = @appointmentRecordID AND Date = @date

	PRINT (N'Cập nhật thành công.')
COMMIT
RETURN 0
GO


--THI--------------------------------------------------------------------------
--Dirty read
CREATE PROC SP_DIRTYREAD_THI
	@AccountID INT,
	@NewPhone CHAR(10)
AS
BEGIN TRAN
	BEGIN TRY
		DECLARE @isTrue INT;
		IF NOT EXISTS (SELECT * FROM Account WHERE AccountID = @AccountID)
		BEGIN
			PRINT N'Tài khoản không tồn tại'
			ROLLBACK TRAN
			RETURN 1
		END

		IF EXISTS (SELECT * FROM Account WHERE PhoneNo = @NewPhone)
		BEGIN
			SET @isTrue = 1; -- tồn tại
		END
		ELSE
		BEGIN
			SET @isTrue = 0; -- không tồn tại
		END
	
		UPDATE ACCOUNT SET PhoneNo = @NewPhone WHERE AccountID = @AccountID

		WAITFOR DELAY '00:00:10'

		IF ( @isTrue = 1)
		BEGIN
			PRINT N'Số điện thoại đã tồn tại'
			ROLLBACK TRAN
			RETURN 1
		END
	END TRY
	BEGIN CATCH
		PRINT N'Lỗi hệ thống: ' + ERROR_MESSAGE()
        ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
RETURN 0
GO

CREATE PROC SP_DIRTYREAD_2_THI
	@AccountID INT
AS
SET TRAN ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRAN
	IF NOT EXISTS (SELECT * FROM Account WHERE AccountID = @AccountID)
	BEGIN
		PRINT N'Tài khoản không tồn tại'
		ROLLBACK TRAN
	END

	SELECT * FROM ACCOUNT WHERE AccountID = @AccountID

	IF ( @@ERROR <> 0)
	BEGIN
		PRINT N'Lỗi hệ thống'
		ROLLBACK TRAN
	END
COMMIT TRAN
GO

--Unrepeatable Read
CREATE PROC SP_UNREPEAT_THI
		@AccountID INT
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Customer WHERE AccountID = @AccountID)
		BEGIN
			PRINT N'Tài khoản của khách hàng này không tồn tại'
			ROLLBACK TRAN
			RETURN
		END

		IF NOT EXISTS (SELECT * FROM Account WHERE AccountID = @AccountID AND Status = 1)
		BEGIN
			PRINT N'Tài khoản đã bị khóa'
			ROLLBACK TRAN
			RETURN
		END
		--TEST
		WAITFOR DELAY '00:00:10'

		SELECT C.PhoneNo, C.Name, C.Email, C.Address, C.DateOfBirth, C.Gender
		FROM ACCOUNT A, CUSTOMER C 
		WHERE A.AccountID = C.AccountID AND 
		A.Status = 1 AND C.AccountID = @AccountID
		
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN
	END CATCH
COMMIT TRAN

GO

CREATE PROC SP_UNREPEAT_2_THI
		@AccountID INT
AS
BEGIN TRAN
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Account WHERE AccountID = @AccountID)
		BEGIN
			PRINT N'Tài khoản không tồn tại'
			ROLLBACK TRAN
			RETURN 1
		END

		UPDATE Account
		SET Status = 0
		WHERE AccountID = @AccountID		
		
	END TRY
	BEGIN CATCH
		PRINT N'LỖI HỆ THỐNG'
		ROLLBACK TRAN
		RETURN 1
	END CATCH
COMMIT TRAN
RETURN 0
GO

--THI--------------------------------------------------------------------------------------