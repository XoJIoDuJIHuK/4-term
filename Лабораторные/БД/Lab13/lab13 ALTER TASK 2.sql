USE [UNIVER]
GO
/****** Object:  StoredProcedure [dbo].[PSUBJECT]    Script Date: 02.05.2023 21:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC PSUBJECT 
	@P VARCHAR(20) = NULL,
	@C INT OUTPUT AS
	BEGIN
		DECLARE @COUNT INT = ( SELECT COUNT( * ) FROM SUBJECT )
		SELECT
			SUBJECT.SUBJECT AS 'КОД',
			SUBJECT.SUBJECT_NAME AS 'НАЗВАНИЕ',
			SUBJECT.PULPIT AS 'КАФЕДРА'
		FROM SUBJECT
			WHERE SUBJECT.SUBJECT = @P
		SET @C = @@ROWCOUNT
		RETURN @COUNT
	END
