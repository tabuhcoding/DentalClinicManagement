
CREATE DATABASE [DentalClinicManagement]
GO
ALTER DATABASE [DentalClinicManagement] SET COMPATIBILITY_LEVEL = 160
GO
ALTER DATABASE [DentalClinicManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DentalClinicManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DentalClinicManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DentalClinicManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DentalClinicManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [DentalClinicManagement] SET  MULTI_USER 
GO
ALTER DATABASE [DentalClinicManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DentalClinicManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DentalClinicManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DentalClinicManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DentalClinicManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DentalClinicManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DentalClinicManagement', N'ON'
GO
ALTER DATABASE [DentalClinicManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [DentalClinicManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DentalClinicManagement]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNo] [char](10) NULL,
	[Password] [nchar](10) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrator](
	[AdministratorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[DateOfBirth] date NULL,
	[PhoneNo] [char](10) NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Administrator] PRIMARY KEY CLUSTERED 
(
	[AdministratorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[DentistID] [int] NULL,
	[Shift] [int] NULL,
	[Date] [date] NULL,
	[CustomerID] [int] NULL,
	[Note] [nvarchar](200) NULL,
	[Status] [nvarchar](30) NULL
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppointmentRecord](
	[AppointRecordID] [int] IDENTITY(1,1) NOT NULL,
	[RecordID] [int] NULL,
	[AppointmentID] [int] NULL,
 CONSTRAINT [PK_AppointmentRecord] PRIMARY KEY CLUSTERED 
(
	[AppointRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[DateOfBirth] [date] NULL,
	[Address] [nvarchar](50) NULL,
	[Gender] [nvarchar](10) NULL,
	[PhoneNo] [char](10) NOT NULL,
	[Email] [varchar](50) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dentist](
	[DentistID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[DateOfBirth] date NULL,
	[PhoneNo] [char](10) NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Dentist] PRIMARY KEY CLUSTERED 
(
	[DentistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DentistsAvailTime](
	[DentistID] [int] NOT NULL,
	[Shift] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DentistsAvailTime] PRIMARY KEY CLUSTERED 
(
	[DentistID] ASC,
	[Shift] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationList](
	[MedicalID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Price] [money] NULL,
	[Unit] [nchar](10) NULL,
	[Allocation] [nvarchar](50) NULL,
	[InventoryNumber] [int] NULL,
	[ExpirationDate] [date] NULL,
	[AdministratorID] [int] NULL,
	[Status] [int] NULL
 CONSTRAINT [PK_MedicationList] PRIMARY KEY CLUSTERED 
(
	[MedicalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicationRecord](
	[AppointRecordID] [int] NOT NULL,
	[MedicalID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [money] NULL,
 CONSTRAINT [PK_MedicationRecord_1] PRIMARY KEY CLUSTERED 
(
	[AppointRecordID] ASC,
	[MedicalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientRecord](
	[RecordID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_PatientRecord_1] PRIMARY KEY CLUSTERED 
(
	[RecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PayID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Fee] [money] NULL,
	[TotalPrice] [money] NULL,
	[Status] [bit] NULL,
	[StaffID] [int] NULL,
	[AppointmentRecordID] [int] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PayID] ASC,
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceDetail](
	[ServiceID] [int] NOT NULL,
	[AppointmentRecordID] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_ServiceDetail_1] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[AppointmentRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NULL,
	[Gender] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[DateOfBirth] date NULL,
	[PhoneNo] [char](10) NOT NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Administrator]  WITH CHECK ADD  CONSTRAINT [FK_Administrator_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Administrator] CHECK CONSTRAINT [FK_Administrator_Account]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_Customer]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_Appointment_DentistsAvailTime1] FOREIGN KEY([DentistID], [Shift], [Date])
REFERENCES [dbo].[DentistsAvailTime] ([DentistID], [Shift], [Date])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_Appointment_DentistsAvailTime1]
GO
ALTER TABLE [dbo].[AppointmentRecord]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentRecord_Appointment] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointment] ([AppointmentID])
GO
ALTER TABLE [dbo].[AppointmentRecord] CHECK CONSTRAINT [FK_AppointmentRecord_Appointment]
GO
ALTER TABLE [dbo].[AppointmentRecord]  WITH CHECK ADD  CONSTRAINT [FK_AppointmentRecord_PatientRecord] FOREIGN KEY([RecordID])
REFERENCES [dbo].[PatientRecord] ([RecordID])
GO
ALTER TABLE [dbo].[AppointmentRecord] CHECK CONSTRAINT [FK_AppointmentRecord_PatientRecord]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Dentist]  WITH CHECK ADD  CONSTRAINT [FK_Dentist_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([AccountID])
GO
ALTER TABLE [dbo].[Dentist] CHECK CONSTRAINT [FK_Dentist_Account]
GO
ALTER TABLE [dbo].[DentistsAvailTime]  WITH CHECK ADD  CONSTRAINT [FK_DentistsAvailTime_Dentist] FOREIGN KEY([DentistID])
REFERENCES [dbo].[Dentist] ([DentistID])
GO
ALTER TABLE [dbo].[DentistsAvailTime] CHECK CONSTRAINT [FK_DentistsAvailTime_Dentist]
GO
ALTER TABLE [dbo].[MedicationList]  WITH CHECK ADD  CONSTRAINT [FK_MedicationList_Administrator] FOREIGN KEY([AdministratorID])
REFERENCES [dbo].[Administrator] ([AdministratorID])
GO
ALTER TABLE [dbo].[MedicationList] CHECK CONSTRAINT [FK_MedicationList_Administrator]
GO
ALTER TABLE [dbo].[MedicationRecord]  WITH NOCHECK ADD  CONSTRAINT [FK_MedicationRecord_AppointmentRecord] FOREIGN KEY([AppointRecordID])
REFERENCES [dbo].[AppointmentRecord] ([AppointRecordID])
GO
ALTER TABLE [dbo].[MedicationRecord] CHECK CONSTRAINT [FK_MedicationRecord_AppointmentRecord]
GO
ALTER TABLE [dbo].[MedicationRecord]  WITH CHECK ADD  CONSTRAINT [FK_MedicationRecord_MedicationList] FOREIGN KEY([MedicalID])
REFERENCES [dbo].[MedicationList] ([MedicalID])
GO
ALTER TABLE [dbo].[MedicationRecord] CHECK CONSTRAINT [FK_MedicationRecord_MedicationList]
GO
ALTER TABLE [dbo].[PatientRecord]  WITH CHECK ADD  CONSTRAINT [FK_PatientRecord_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[PatientRecord] CHECK CONSTRAINT [FK_PatientRecord_Customer]
GO
ALTER TABLE [dbo].[Payment]  WITH NOCHECK ADD  CONSTRAINT [FK_Payment_AppointmentRecord] FOREIGN KEY([AppointmentRecordID])
REFERENCES [dbo].[AppointmentRecord] ([AppointRecordID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_AppointmentRecord]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([StaffID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Staff]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH NOCHECK ADD  CONSTRAINT [FK_ServiceDetail_AppointmentRecord] FOREIGN KEY([AppointmentRecordID])
REFERENCES [dbo].[AppointmentRecord] ([AppointRecordID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_ServiceDetail_AppointmentRecord]
GO
ALTER TABLE [dbo].[ServiceDetail]  WITH CHECK ADD  CONSTRAINT [FK_ServiceDetail_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ServiceID])
GO
ALTER TABLE [dbo].[ServiceDetail] CHECK CONSTRAINT [FK_ServiceDetail_Service]
GO


insert into Account(PhoneNo, Password, Status)
values ('0906723667', 'Ad667', 1)
insert into Account(PhoneNo, Password, Status)
values ('0986457891', 'Ad668', 1)
insert into Account(PhoneNo, Password, Status)
values ('0913223651', 'S651', 1)
insert into Account(PhoneNo, Password, Status)
values ('0872447567', 'S567', 1)
insert into Account(PhoneNo, Password, Status)
values ('0865772882', 'D882', 1)
insert into Account(PhoneNo, Password, Status)
values ('0976523456', 'D456', 1)
insert into Account(PhoneNo, Password, Status)
values ('0909225621', 'D621', 1)
insert into Account(PhoneNo, Password, Status)
values ('0907336782', 'C782', 1)
insert into Account(PhoneNo, Password, Status)
values ('0987654321', 'C321', 1)
insert into Account(PhoneNo, Password, Status)
values ('0932109876', 'C876', 1)

insert into Customer(Name,Gender, DateOfBirth, Address, PhoneNo, AccountID)
values ('Giang',N'Nam', '2000-12-18', 'HCM', '0907336782', 8)
insert into Customer(Name,Gender, DateOfBirth, Address, PhoneNo, AccountID)
values ('Minh',N'Nam', '1999-02-12', 'Hà Nội', '0987654321', 9)
insert into Customer(Name,Gender, DateOfBirth, Address, PhoneNo, AccountID)
values (N'Ngọc',N'Nữ', '2003-09-10', 'Đà Nẵng', '0932109876', 10)

insert into Dentist(Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values ('Long',N'Nam', N'134 abc, Q12, TP HCM','2003-11-25', '0865772882', 5)
insert into Dentist(Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values ('Mai',N'Nữ', N'134 abc, Q Tân Bình, TP HCM','2001-11-25', '0976523456', 6)
insert into Dentist(Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values (N'Phúc',N'Nam', N'134 abc, Q Bình Thạnh, TP HCM','2004-11-25', '0909225621', 7)

-- status = 0 thì mới được đặt lịch
insert into DentistsAvailTime(DentistID, Shift, Date, Status)
values (1, 1, '2023-11-10', 1)
insert into DentistsAvailTime(DentistID, Shift, Date, Status)
values (1, 2, '2023-11-10', 0)
insert into DentistsAvailTime(DentistID, Shift, Date, Status)
values (2, 3, '2023-11-10', 1)
insert into DentistsAvailTime(DentistID, Shift, Date, Status)
values (2, 1, '2023-11-10', 0)
insert into DentistsAvailTime(DentistID, Shift, Date, Status)
values (3, 1, '2023-11-12', 1)
INSERT INTO DentistsAvailTime (DentistID, Shift, Date, Status)
VALUES (1, 1, '2023-01-06', 1), -- Shift 1, Status 1
       (1, 2, '2023-01-06', 1), -- Shift 2, Status 1
       (1, 3, '2023-01-06', 0), -- Shift 3, Status 0
       (1, 4, '2023-01-06', 0); -- Shift 4, Status 0

-- DentistID = 2, Date = '2023-01-06'
INSERT INTO DentistsAvailTime (DentistID, Shift, Date, Status)
VALUES (2, 1, '2023-01-06', 1), -- Shift 1, Status 1
       (2, 2, '2023-01-06', 1), -- Shift 2, Status 1
       (2, 3, '2023-01-06', 0), -- Shift 3, Status 0
       (2, 4, '2023-01-06', 0); -- Shift 4, Status 0

-- DentistID = 3, Date = '2023-01-06'
INSERT INTO DentistsAvailTime (DentistID, Shift, Date, Status)
VALUES (3, 1, '2023-01-06', 1), -- Shift 1, Status 1
       (3, 2, '2023-01-06', 1), -- Shift 2, Status 1
       (3, 3, '2023-01-06', 0), -- Shift 3, Status 0
       (3, 4, '2023-01-06', 0); -- Shift 4, Status 0	

insert into Appointment(DentistID, Shift, Date, CustomerID, Note, Status)
values (1, 1, '2023-11-10', 1, N'ghi chú 1', N'Đã xong')
insert into Appointment(DentistID, Shift, Date, CustomerID, Note, Status)
values (2, 3, '2023-11-10', 2, N'ghi chú 2', N'Quá hẹn')
insert into Appointment(DentistID, Shift, Date, CustomerID, Note, Status)
values (3, 1, '2023-11-12', 3, N'ghi chú 3', N'Đã hủy')
-- INSERT dữ liệu vào bảng Appointment
INSERT INTO Appointment (DentistID, Shift, Date, CustomerID, Note, Status)
VALUES
    (1, 1, '2023-01-06', 1, N'Ghi chú 1', N'Đã xong'),
    (1, 2, '2023-01-06', 1, N'Ghi chú 1', N'Đã xong'),
    (2, 1, '2023-01-06', 2, N'Ghi chú 1', N'Đã xong'),
    (2, 2, '2023-01-06', 2, N'Ghi chú 1', N'Đã xong'),
    (3, 1, '2023-01-06', 3, N'Ghi chú 1', N'Đã xong'),
    (3, 2, '2023-01-06', 3, N'Ghi chú 1', N'Đã xong');


insert into Service(Name, Price)
values ('Chụp X-quang', 900000)
insert into Service(Name, Price)
values ('Trám răng', 340000)
insert into Service(Name, Price)
values ('Cạo vôi', 500000)

insert into Administrator(Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values (N'Thư', N'Nữ', N'134 abc, Q5, TP HCM','2000-11-25', '0906723667', 1)
insert into Administrator(Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values (N'Minh', N'Nam', N'456 abc, Q9, TP HCM','2000-10-14', '0986457891', 2)

insert into MedicationList(Name, Price, Unit, Allocation, InventoryNumber, ExpirationDate, AdministratorID, Status)
values ('Corticoid', 53000, 'vnd', 'Thuốc giảm đau, chống viêm', 50, '2025-1-1', 1,1)
insert into MedicationList(Name, Price, Unit, Allocation, InventoryNumber, ExpirationDate, AdministratorID, Status)
values ('Xylocain', 103000, 'vnd', 'Thuốc gây tê', 43, '2024-10-1', 1,1)
insert into MedicationList(Name, Price, Unit, Allocation, InventoryNumber, ExpirationDate, AdministratorID, Status)
values ('Pilocarpin', 99000, 'vnd', 'Thuốc chống khô miệng', 78, '2026-1-1', 1,1)
insert into MedicationList(Name, Price, Unit, Allocation, InventoryNumber, ExpirationDate, AdministratorID, Status)
values ('Phenolxymethylpenicillin', 120000, 'vnd', 'Thuốc diệt khuẩn', 35, '2024-9-2', 1,1)

insert into Staff (Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values (N'Hải',N'Nam', N'134 abcd, Q10, TP HCM','2005-11-25', '0913223651', 3)
insert into Staff (Name,Gender,Address,DateOfBirth, PhoneNo, AccountID)
values (N'Châu',N'Nữ', N'134 abc, Q11, TP HCM','2002-11-25', '0872447567', 4)

insert into PatientRecord(CustomerID)
values (1)
insert into PatientRecord(CustomerID)
values (2)
insert into PatientRecord(CustomerID)
values (3)
insert into PatientRecord(CustomerID)
values (1), (1), (2), (2), (3), (3)

insert into AppointmentRecord (RecordID, AppointmentID)
values (1, 1)
insert into AppointmentRecord (RecordID, AppointmentID)
values (2, 2)
insert into AppointmentRecord (RecordID, AppointmentID)
values (3, 3)
insert into AppointmentRecord (RecordID, AppointmentID)
values (4, 4),
        (5, 5),
        (6, 6),
	(7, 7),
	(8, 8),
	(9, 9)

insert into ServiceDetail(ServiceID, AppointmentRecordID, Description)
values (1, 1, null)
insert into ServiceDetail(ServiceID, AppointmentRecordID, Description)
values (2, 2, null)
insert into ServiceDetail(ServiceID, AppointmentRecordID, Description)
values (3, 3, null)
insert into ServiceDetail( AppointmentRecordID,ServiceID, Description)
values (4, 1, null),
 (5, 1, null),
 (6, 1, null),
 (7, 1, null),
 (8, 1, null),
 (9, 1, null)
insert into ServiceDetail( AppointmentRecordID,ServiceID, Description)
values (9, 2, null)


insert into MedicationRecord(AppointRecordID, MedicalID, Quantity, TotalPrice)
values (1, 1, 2, 106000)
insert into MedicationRecord(AppointRecordID, MedicalID, Quantity, TotalPrice)
values (2, 2, 1, 103000)
insert into MedicationRecord(AppointRecordID, MedicalID, Quantity, TotalPrice)
values (3, 3, 1, 99000)
insert into MedicationRecord(AppointRecordID, MedicalID, Quantity, TotalPrice)
values (4, 3, 1, 99000),
	(5, 3, 1, 99000),
	(6, 3, 1, 99000),
	(7, 3, 1, 99000),
	(8, 3, 1, 99000),
	(9, 1, 1, 106000),
	(9, 2, 1, 103000),
	(9, 3, 1, 99000)
	

insert into Payment(Date, AppointmentRecordID, Fee, TotalPrice, StaffID, Status)
values ('2023-11-10', 1, 200000, 306000, 1, 1)
insert into Payment(Date, AppointmentRecordID, Fee, TotalPrice, StaffID, Status)
values ('2023-11-10', 2, 200000, 303000, 1, 1)
insert into Payment( Date, AppointmentRecordID, Fee, TotalPrice, StaffID, Status)
values ('2023-11-12', 3, 200000, 299000, 2, 1)
insert into Payment( Date, AppointmentRecordID, Fee, TotalPrice, StaffID, Status)
values ('2023-01-06', 4, 200000, 299000, 2, 0),
	('2023-01-06', 5, 200000, 299000, 2, 0),
	('2023-01-06', 6, 200000, 299000, 2, 0),
	('2023-01-06', 7, 200000, 299000, 2, 0),
	('2023-01-06', 8, 200000, 299000, 2, 0),
	('2023-01-06', 9, 400000, 708000, 2, 0)

