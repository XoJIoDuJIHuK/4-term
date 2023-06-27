USE [Weather]
GO

/****** Object:  Table [dbo].[Regions]    Script Date: 25.03.2021 12:08:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Regions](
	[Name] [nvarchar](20) NOT NULL,
	[Square] [real] NULL,
	[Residents_Type] [nvarchar](15) NULL,
 CONSTRAINT [PK_Regions] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Residents_Type] FOREIGN KEY([Residents_Type])
REFERENCES [dbo].[Residents_Type] ([Name])
GO

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_Regions_Residents_Type]
GO

ALTER TABLE [dbo].[Regions]  WITH CHECK ADD  CONSTRAINT [FK_Regions_Weather] FOREIGN KEY([Name])
REFERENCES [dbo].[Weather] ([Region])
GO

ALTER TABLE [dbo].[Regions] CHECK CONSTRAINT [FK_Regions_Weather]
GO

