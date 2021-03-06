USE [DRSDATA_2015]
GO
/****** Object:  StoredProcedure [dbo].[FIND_ORDERDETAIL]    Script Date: 2015/3/15 13:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FIND_ORDERDETAIL]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  dbo.DAILYSALES_2015.INTORDERCODE AS INTORDERCODE, 
                ROW_NUMBER() OVER (PARTITION BY INTORDERCODE ORDER BY dbo.DAILYSALES_2015.LINTITEMNUMBER DESC) AS ROEID,
                dbo.ITEM.STRPRODUCTDESCRIPTION AS STRPRODUCTDESCRIPTION
	FROM dbo.DAILYSALES_2015 
			INNER JOIN
         dbo.ITEM 
			ON dbo.DAILYSALES_2015.LINTITEMNUMBER = dbo.ITEM.LINTITEMNUMBER
	WHERE  [STRSALETYPE] = 'I' 
		AND 
		DAILYSALES_2015.STRTRADECODE = 'SH161'

	ORDER BY INTORDERCODE DESC
		
END

	--SELECT  A.INTORDERCODE AS INTORDERCODE, 
 --               --ROW_NUMBER() OVER (PARTITION BY INTORDERCODE ORDER BY dbo.DAILYSALES_2015.LINTITEMNUMBER DESC) AS ROEID,
 --              B.DRSITEMCODENAME AS STRPRODUCTDESCRIPTION
	--FROM dbo.DAILYSALES_2015 A,
		
 --        dbo.ITEM_ONLINE B
			
	--WHERE  A.[STRSALETYPE] = 'I' 
	--	AND 
	--	A.STRTRADECODE = 'SH161'
	--	AND
	--	A.LINTITEMNUMBER = B.DRSITEMCODE
		
	--ORDER BY INTORDERCODE DESC







GO
