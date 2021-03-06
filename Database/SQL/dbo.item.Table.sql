USE [DRSDATA_2015]
GO
/****** Object:  Table [dbo].[item]    Script Date: 2015/3/15 13:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[item](
	[LINTITEMNUMBER] [int] NOT NULL,
	[STRPOS12DESCRIPTION] [varchar](12) NULL,
	[STRPOS20DESCRIPTION] [varchar](20) NULL,
	[STRDEPTCODE] [varchar](10) NOT NULL,
	[STRCATCODE] [varchar](10) NOT NULL,
	[STRGROUPCODE] [varchar](10) NOT NULL,
	[STRCLASSCODE] [varchar](10) NULL,
	[STRUNITOFMEASURE] [varchar](10) NULL,
	[STRTAXCODE] [varchar](10) NULL,
	[STRLIQUORTAXCODE] [varchar](10) NULL,
	[STRFAMILYCODE] [varchar](10) NULL,
	[STRCOMPETITION] [varchar](10) NULL,
	[YSNDISCOUNT] [varchar](1) NOT NULL,
	[YSNCREDITCARD] [varchar](1) NOT NULL,
	[STRLABEL] [varchar](10) NULL,
	[DTMDATEENTERED] [datetime] NULL,
	[YSNNEW] [varchar](1) NOT NULL,
	[YSNCHANGED] [varchar](1) NOT NULL,
	[YSNCHANGEAPN] [varchar](1) NOT NULL,
	[YSNCHANGEBRAND] [varchar](1) NOT NULL,
	[YSNCHANGECATEG] [varchar](1) NOT NULL,
	[YSNCHANGECLASS] [varchar](1) NOT NULL,
	[YSNCHANGECOLOUR] [varchar](1) NOT NULL,
	[YSNCHANGECOMPETITION] [varchar](1) NOT NULL,
	[YSNCHANGEDEPT] [varchar](1) NOT NULL,
	[YSNCHANGEDESC] [varchar](1) NOT NULL,
	[YSNCHANGEFAMILY] [varchar](1) NOT NULL,
	[YSNCHANGEGROUP] [varchar](1) NOT NULL,
	[YSNCHANGEPOS12] [varchar](1) NOT NULL,
	[YSNCHANGEPOS20] [varchar](1) NOT NULL,
	[YSNCHANGESIZE] [varchar](1) NOT NULL,
	[YSNCHANGETAX] [varchar](1) NOT NULL,
	[YSNCHANGELIQUORTAX] [varchar](1) NOT NULL,
	[YSNCHANGEUNITOFMEASURE] [varchar](1) NOT NULL,
	[YSNCHANGEDISCOUNT] [varchar](1) NOT NULL,
	[YSNCHANGECREDITCARD] [varchar](1) NOT NULL,
	[YSNCHANGELABEL] [varchar](1) NOT NULL,
	[DBLTAXRATE] [decimal](19, 4) NULL,
	[YSNCHANGETAXRATE] [varchar](1) NOT NULL,
	[MEMCOMMENTS] [text] NULL,
	[YSNCHANGECOMMENTS] [varchar](1) NOT NULL,
	[LINTLINKEDITEM] [int] NOT NULL,
	[DBLLINKEDQTY] [decimal](19, 4) NOT NULL,
	[INTPOINTS] [int] NOT NULL,
	[YSNCHANGEPOINTS] [varchar](1) NOT NULL,
	[YSNLINKPARENT] [varchar](1) NOT NULL,
	[YSNRECIPEITEM] [varchar](1) NOT NULL,
	[STRPRODUCTBRANDNAME] [varchar](30) NULL,
	[STRPRODUCTDESCRIPTION] [varchar](30) NULL,
	[STRPRODUCTVARIETY] [varchar](30) NULL,
	[STRPRODUCTSIZE] [varchar](10) NULL,
	[STROTHERDESCRIPTION] [varchar](50) NULL,
	[STROTHERSIZE] [varchar](10) NULL,
	[STROTHERPOS] [varchar](20) NULL,
	[YSNCHANGEOTHER] [varchar](1) NOT NULL,
	[STRXREFCODE] [varchar](20) NULL,
	[INTTICKETREQUIRED] [int] NOT NULL,
	[YSNKEEPSTOCKCOUNT] [varchar](1) NULL,
	[YSNACTIVE] [varchar](1) NULL,
	[LINTTICKETCLIP1] [int] NULL,
	[LINTTICKETCLIP2] [int] NULL,
	[LINTTICKETCLIP3] [int] NULL,
	[LINTTICKETCLIP4] [int] NULL,
	[LINTTICKETCLIP5] [int] NULL,
	[LINTINFOCLIP] [int] NULL,
	[MEMNOTES] [text] NULL,
	[STRTICKETTYPE] [varchar](2) NULL,
	[STRSELLADVICE] [varchar](255) NULL,
	[MEMCOMMENTS2] [text] NULL,
	[INTWARRANTYMONTHS] [int] NULL,
	[STRSUBGROUPCODE] [varchar](10) NOT NULL,
	[DBLHEIGHT] [decimal](19, 4) NULL,
	[DBLWIDTH] [decimal](19, 4) NULL,
	[DBLDEPTH] [decimal](19, 4) NULL,
	[INTSPACEMANAGERCLIP] [int] NULL,
	[STRDELIVERYCODE] [varchar](10) NULL,
	[LINTMANUFACTURERCLIP] [int] NULL,
	[YSNPROPOSESELLEXCEPTION] [varchar](1) NULL,
	[YSNCHANGETERMS] [varchar](1) NULL,
	[YSNCHARGECESS] [varchar](1) NULL,
	[YSNCHARGESERVICE] [varchar](1) NULL,
	[YSNDISCOUNTABLE] [varchar](1) NULL,
	[STRSEASONCODE] [varchar](10) NULL,
	[STRYEARCODE] [varchar](4) NULL,
	[YSNPACKAGEITEM] [varchar](1) NULL,
	[DTMITEMRELEASE] [datetime] NULL,
	[DTMITEMDELETED] [datetime] NULL,
	[YSNASKPOSCOMMENT] [varchar](1) NULL,
	[ysnConsignment] [varchar](1) NULL,
	[YSNTRANSFERITEM] [varchar](1) NULL,
	[YSNWAREHOUSE] [varchar](1) NULL,
	[STRORDERMETHOD] [varchar](10) NULL,
	[INTCHANGEFLAG] [int] NULL,
	[INTNEWFLAG] [int] NULL,
	[INTCHANGEPOS] [int] NULL,
	[INTCHANGEDESC] [int] NULL,
	[INTCHANGECOST] [int] NULL,
	[INTCHANGESELL] [int] NULL,
	[STRORDERCATCODE] [varchar](10) NULL,
	[DBLALCOHOLPER] [decimal](10, 4) NULL,
	[STRSPECIFICATION] [varchar](100) NULL,
	[STRMANUFACTURERCOUNTRY] [varchar](100) NULL,
	[STRFORMOFPRODUCT] [varchar](100) NULL,
	[STRENGLISHDESCRIPTION] [varchar](100) NULL,
	[STRREGISTEREDTRADEMARK] [varchar](100) NULL,
	[STRPRODUCTREFERENCE1] [varchar](100) NULL,
	[STRPRODUCTREFERENCE2] [varchar](100) NULL,
	[STRPRODUCTREFERENCE3] [varchar](100) NULL,
	[STRPRODUCTREFERENCE4] [varchar](100) NULL,
	[STRPRODUCTREFERENCE5] [varchar](100) NULL,
	[STRTRACKSERIALNUM] [varchar](1) NULL,
	[YSNTRACKSERIALNUM] [varchar](1) NULL,
	[LINTSTOCKITEM] [int] NULL,
	[STRKITCHENINSTRUCT] [varchar](20) NULL,
	[STRKITCHENCODE] [varchar](10) NULL,
	[YSNSETMEAL] [varchar](1) NULL,
	[YSNSETMEALALWAYSAVAIL] [varchar](1) NULL,
	[STRITEMMENU] [varchar](10) NULL,
	[YSNASKDELIVERYITEM] [varchar](1) NULL,
	[INTDELIVERYSOURCE] [int] NULL,
	[STRPERWEIGHTCODE] [varchar](10) NULL,
	[DBLPERWEIGHTQTY] [decimal](19, 4) NULL,
	[YSNALLOWOVERRIDE] [varchar](1) NULL,
	[YSNFOODSTAMP] [varchar](1) NULL,
	[YSNWIC] [varchar](10) NULL,
	[STRPRODUCTFIT] [varchar](20) NULL,
	[YSNKIT] [varchar](1) NULL,
	[STRTVLA] [varchar](1) NULL,
	[LINTSUBSTITUTEITEM] [int] NULL,
	[STRLONGDESCRIPTION] [varchar](200) NULL,
	[STRFSACATEGORY] [varchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
