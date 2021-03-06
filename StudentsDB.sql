USE [master]
GO
/****** Object:  Database [StudentsDB]    Script Date: 9/13/2020 2:13:23 PM ******/
CREATE DATABASE [StudentsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentsDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentsDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentsDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentsDB', N'ON'
GO
ALTER DATABASE [StudentsDB] SET QUERY_STORE = OFF
GO
USE [StudentsDB]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 9/13/2020 2:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [varchar](8) NOT NULL,
	[LastName] [varchar](20) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[MiddleName] [varchar](20) NULL,
	[Course] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spStudent_Delete]    Script Date: 9/13/2020 2:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spStudent_Delete]
	@Id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Students WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[spStudent_Insert]    Script Date: 9/13/2020 2:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudent_Insert]
@StudentId varchar(8),
@LastName varchar(20),
@FirstName varchar(20),
@MiddleName varchar(20),
@Course varchar(20)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO dbo.Students (StudentId, LastName, FirstName, MiddleName, Course)
	VALUES (@StudentId, @LastName, @FirstName, @MiddleName, @Course);

END
GO
/****** Object:  StoredProcedure [dbo].[spStudent_Update]    Script Date: 9/13/2020 2:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudent_Update]
@Id int,
@StudentId varchar(8),
@LastName varchar(20),
@FirstName varchar(20),
@MiddleName varchar(20),
@Course varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE Students SET StudentId=@StudentId, LastName=@LastName, FirstName=@FirstName, MiddleName=@MiddleName, Course=@Course
	WHERE Id=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[spStudents_GetAll]    Script Date: 9/13/2020 2:13:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spStudents_GetAll]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT * FROM dbo.Students
END
GO
USE [master]
GO
ALTER DATABASE [StudentsDB] SET  READ_WRITE 
GO
