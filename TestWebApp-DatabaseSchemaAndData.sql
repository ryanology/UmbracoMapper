USE [master]
GO
/****** Object:  Database [UmbracoTestBed701]    Script Date: 01/21/2014 22:24:28 ******/
CREATE DATABASE [UmbracoTestBed701] ON  PRIMARY 
( NAME = N'UmbracoTestBed701', FILENAME = N'C:\Databases\Data\UmbracoTestBed701.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UmbracoTestBed701_log', FILENAME = N'C:\Databases\Data\UmbracoTestBed701_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UmbracoTestBed701] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UmbracoTestBed701].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UmbracoTestBed701] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET ANSI_NULLS OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET ANSI_PADDING OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET ARITHABORT OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [UmbracoTestBed701] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [UmbracoTestBed701] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [UmbracoTestBed701] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET  DISABLE_BROKER
GO
ALTER DATABASE [UmbracoTestBed701] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [UmbracoTestBed701] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [UmbracoTestBed701] SET  READ_WRITE
GO
ALTER DATABASE [UmbracoTestBed701] SET RECOVERY SIMPLE
GO
ALTER DATABASE [UmbracoTestBed701] SET  MULTI_USER
GO
ALTER DATABASE [UmbracoTestBed701] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [UmbracoTestBed701] SET DB_CHAINING OFF
GO
USE [UmbracoTestBed701]
GO
/****** Object:  Table [dbo].[umbracoUserType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userTypeAlias] [nvarchar](50) NULL,
	[userTypeName] [nvarchar](255) NOT NULL,
	[userTypeDefaultPermissions] [nvarchar](50) NULL,
 CONSTRAINT [PK_umbracoUserType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUserType] ON
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (1, N'admin', N'Administrators', N'CADMOSKTPIURZ:5F7')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (2, N'writer', N'Writer', N'CAH:F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (3, N'editor', N'Editors', N'CADMOSKTPUZ:5F')
INSERT [dbo].[umbracoUserType] ([id], [userTypeAlias], [userTypeName], [userTypeDefaultPermissions]) VALUES (4, N'translator', N'Translator', N'AF')
SET IDENTITY_INSERT [dbo].[umbracoUserType] OFF
/****** Object:  Table [dbo].[umbracoUserLogins]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogins](
	[contextID] [uniqueidentifier] NOT NULL,
	[userID] [int] NOT NULL,
	[timeout] [bigint] NOT NULL
) ON [PRIMARY]
GO
CREATE CLUSTERED INDEX [umbracoUserLogins_Index] ON [dbo].[umbracoUserLogins] 
(
	[contextID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tag] [nvarchar](200) NULL,
	[ParentId] [int] NULL,
	[group] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags] 
(
	[tag] ASC,
	[group] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTags] ON
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (1, N'cat', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (2, N'dog', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (3, N'rabbit', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (4, N'frog', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (5, N'test', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (6, N'xxx''s', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (7, N'x''''''s', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (8, N'dog'';CREATE TABLE Fred (Id int NOT NULL);', NULL, N'default')
INSERT [dbo].[cmsTags] ([id], [tag], [ParentId], [group]) VALUES (9, N'Umbraco.Core.Models.Tag', NULL, N'default')
SET IDENTITY_INSERT [dbo].[cmsTags] OFF
/****** Object:  Table [dbo].[cmsTaskType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTaskType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsTaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsTaskType_alias] ON [dbo].[cmsTaskType] 
(
	[alias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTaskType] ON
INSERT [dbo].[cmsTaskType] ([id], [alias]) VALUES (1, N'toTranslate')
SET IDENTITY_INSERT [dbo].[cmsTaskType] OFF
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer] 
(
	[computerName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer] 
(
	[isActive] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NOT NULL,
	[childObjectType] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoRelationType] ON
INSERT [dbo].[umbracoRelationType] ([id], [dual], [parentObjectType], [childObjectType], [name], [alias]) VALUES (1, 1, N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', N'Relate Document On Copy', N'relateDocumentOnCopy')
SET IDENTITY_INSERT [dbo].[umbracoRelationType] OFF
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trashed] [bit] NOT NULL,
	[parentID] [int] NOT NULL,
	[nodeUser] [int] NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_structure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeObjectType] ON [dbo].[umbracoNode] 
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeParentId] ON [dbo].[umbracoNode] 
(
	[parentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoNodeTrashed] ON [dbo].[umbracoNode] 
(
	[trashed] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoNode] ON
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-92, 0, -1, 0, 1, N'-1,-92', 35, N'f0bc4bfb-b499-40d6-ba86-058885a5178c', N'Label', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-90, 0, -1, 0, 1, N'-1,-90', 34, N'84c6b441-31df-4ffe-b67e-67d5bc3ae65a', N'Upload', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-89, 0, -1, 0, 1, N'-1,-89', 33, N'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3', N'Textbox multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-88, 0, -1, 0, 1, N'-1,-88', 32, N'0cc0eba1-9960-42c9-bf9b-60e150b429ae', N'Textstring', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-87, 0, -1, 0, 1, N'-1,-87', 4, N'ca90c950-0aff-4e72-b976-a30b1ac57dad', N'Richtext editor', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-51, 0, -1, 0, 1, N'-1,-51', 2, N'2e6d3631-066e-44b8-aec4-96f09099b2b5', N'Numeric', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-49, 0, -1, 0, 1, N'-1,-49', 2, N'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49', N'True/false', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-43, 0, -1, 0, 1, N'-1,-43', 2, N'ffffffd5-0000-0000-0000-000000000000', N'Checkbox list', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-42, 0, -1, 0, 1, N'-1,-42', 2, N'0b6a45e7-44ba-430d-9da5-4e46060b9e03', N'Dropdown', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-41, 0, -1, 0, 1, N'-1,-41', 2, N'5046194e-4237-453c-a547-15db3a07c4e1', N'Date Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-40, 0, -1, 0, 1, N'-1,-40', 2, N'bb5f57c9-ce2b-4bb9-b697-4caca783a805', N'Radiobox', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-39, 0, -1, 0, 1, N'-1,-39', 2, N'f38f0ac7-1d27-439c-9f3f-089cd8825a53', N'Dropdown multiple', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-38, 0, -1, 0, 1, N'-1,-38', 2, N'fd9f1447-6c61-4a7c-9595-5aa39147d318', N'Folder Browser', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB524 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-37, 0, -1, 0, 1, N'-1,-37', 2, N'0225af17-b302-49cb-9176-b9f35cab9c17', N'Approved Color', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-36, 0, -1, 0, 1, N'-1,-36', 2, N'e4d66c0f-b935-4200-81f0-025f7256b89a', N'Date Picker with time', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-21, 0, -1, 0, 0, N'-1,-21', 0, N'bf7c7cbc-952f-4518-97a2-69e9c7b33842', N'Recycle Bin', N'cf3d8e34-1c1c-41e9-ae56-878b57b32113', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-20, 0, -1, 0, 0, N'-1,-20', 0, N'0f582a79-1e41-4cf0-bfa0-76340651891a', N'Recycle Bin', N'01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8', CAST(0x0000A2A100FEB523 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (-1, 0, -1, 0, 0, N'-1', 0, N'916724a5-173d-4619-b97e-b9de133dd6f5', N'SYSTEM DATA: umbraco master root', N'ea7d8624-4cfe-4578-a871-24aa946bf34d', CAST(0x0000A2A100FEB51C AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1031, 0, -1, 0, 1, N'-1,1031', 2, N'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d', N'Folder', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1032, 0, -1, 0, 1, N'-1,1032', 2, N'cc07b313-0843-4aa8-bbda-871c8da728c8', N'Image', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1033, 0, -1, 0, 1, N'-1,1033', 2, N'4c52d8ab-54e6-40cd-999c-7a5f24903e4d', N'File', N'4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1034, 0, -1, 0, 1, N'-1,1034', 2, N'a6857c73-d6e9-480c-b6e6-f15f6ad11125', N'Content Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1035, 0, -1, 0, 1, N'-1,1035', 2, N'93929b9a-93a2-4e2a-b239-d99334440a59', N'Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1036, 0, -1, 0, 1, N'-1,1036', 2, N'2b24165f-9782-4aa3-b459-1de4a4d21f60', N'Member Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1040, 0, -1, 0, 1, N'-1,1040', 2, N'21e798da-e06e-4eda-a511-ed257f78d4fa', N'Related Links', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1041, 0, -1, 0, 1, N'-1,1041', 2, N'b6b73142-b9c1-4bf8-a16d-e1c23320b549', N'Tags', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB525 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1044, 0, -1, 0, 1, N'-1,1044', 0, N'd59be02f-1df9-4228-aa1e-01917d806cda', N'Member', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A2A100FEB526 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1045, 0, -1, 0, 1, N'-1,1045', 2, N'7e3962cc-ce20-4ffc-b661-5897a894ba7e', N'Multiple Media Picker', N'30a2a501-1978-4ddb-a57b-f7efed43ba3c', CAST(0x0000A2A100FEB526 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1046, 0, -1, 0, 1, N'-1,1046', 0, N'f080ba02-e646-4d00-b311-66739d016679', N'TestDocType', N'a2cb7800-f571-4787-9638-bc48539a0efb', CAST(0x0000A2A10101E139 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1047, 1, -20, 0, 1, N'-1,-20,1047', 1, N'87d7ffeb-5cd7-4208-8ac6-d5c709e32fde', N'Home Page', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A2A101020F2A AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1048, 0, -1, 0, 1, N'-1,1048', 1, N'de263a7c-7452-443f-aae0-28ad5188e764', N'TestDocType', N'6fbde604-4178-42ce-a10b-8a2600a2f07d', CAST(0x0000A2A1010305B2 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1049, 1, -20, 0, 1, N'-1,-20,1049', 2, N'61919022-74c1-4be7-8a6e-f7308be0c027', N'Home page (1)', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A2A801129C7E AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1050, 0, -1, 0, 1, N'-1,1050', 0, N'ebee0156-ed77-46cf-8d64-f56045e35012', N'Test Page', N'c66ba18e-eaf3-4cff-8a22-41b16d66a972', CAST(0x0000A2A80112F7EE AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1051, 0, -1, 0, 1, N'-1,1051', 0, N'94767361-bf81-487f-b966-053b3f64c6e3', N'Audio', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A2AB0164D633 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1052, 1, -21, 0, 1, N'-1,-21,1052', 1, N'e9660ad4-bce9-4a48-8994-d37447e4b107', N'schema', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A2AB0164F1E8 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1053, 1, -21, 0, 1, N'-1,-21,1053', 2, N'ad291784-b4b8-4547-968a-e1707de39e97', N'ss', N'b796f64c-1f99-4ffb-b886-4bf4bc011a9c', CAST(0x0000A2AB016552BB AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1054, 0, -1, 0, 1, N'-1,1054', 1, N'5d09f3e5-d155-4077-90ee-9789b6bc1aa5', N'Test Group', N'366e63b9-880f-4e13-a61c-98069b029728', CAST(0x0000A2AB016C1CC0 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1056, 0, -1, 0, 1, N'-1,1056', 1, N'88d359e6-a87f-4b95-811c-1850432f39d6', N'Test Member Type', N'9b5416fb-e72f-45a9-a07b-5a9a2709ce43', CAST(0x0000A2AB016C6564 AS DateTime))
INSERT [dbo].[umbracoNode] ([id], [trashed], [parentID], [nodeUser], [level], [path], [sortOrder], [uniqueID], [text], [nodeObjectType], [createDate]) VALUES (1057, 0, -1, 0, 1, N'-1,1057', 1, N'4061e5ed-92aa-4f54-bd69-16178d0f2e2d', N'Jim', N'39eb0f98-b348-42a1-8662-e7eb18487560', CAST(0x0000A2AB016C8AC6 AS DateTime))
SET IDENTITY_INSERT [dbo].[umbracoNode] OFF
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[NodeId] [int] NOT NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog] 
(
	[NodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLog] ON
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (1, 0, -1, CAST(0x0000A2A100FF89FD AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (2, 0, -1, CAST(0x0000A2A100FFD7A3 AS DateTime), N'Save', N'Save ContentTypes performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (3, 0, 1046, CAST(0x0000A2A10101E15C AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (4, 0, 1046, CAST(0x0000A2A10101EB70 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (5, 0, 1046, CAST(0x0000A2A10101F0A1 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (6, 0, 1046, CAST(0x0000A2A10101FC0D AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (7, 0, 0, CAST(0x0000A2A101020317 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (8, 0, 1047, CAST(0x0000A2A101020F56 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (9, 0, 1046, CAST(0x0000A2A10103217A AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (10, 0, 1047, CAST(0x0000A2A101032E7E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (11, 0, 1047, CAST(0x0000A2A500B3395E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (12, 0, -43, CAST(0x0000A2A500E67A22 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (13, 0, -43, CAST(0x0000A2A500E67A75 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (14, 0, -43, CAST(0x0000A2A500E68A2C AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (15, 0, -43, CAST(0x0000A2A500E694F5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (16, 0, -43, CAST(0x0000A2A500E6A1CA AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (17, 0, -43, CAST(0x0000A2A500E6B7AD AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (18, 0, -43, CAST(0x0000A2A500E6C096 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (19, 0, -43, CAST(0x0000A2A500E6CD2E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (20, 0, -43, CAST(0x0000A2A500E95186 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (21, 0, -43, CAST(0x0000A2A500E9EF1A AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (22, 0, -43, CAST(0x0000A2A700D29533 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (23, 0, -43, CAST(0x0000A2A700D2A4D7 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (24, 0, -43, CAST(0x0000A2A700D2AF7E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (25, 0, -43, CAST(0x0000A2A700D2BE9D AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (26, 0, -43, CAST(0x0000A2A700D2CAD8 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (27, 0, -43, CAST(0x0000A2A700D2D470 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (28, 0, -43, CAST(0x0000A2A700D2DEEA AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (29, 0, -43, CAST(0x0000A2A700D2EBE8 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (30, 0, -43, CAST(0x0000A2A700D2F42E AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (31, 0, -43, CAST(0x0000A2A700D2FD4B AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (32, 0, 1046, CAST(0x0000A2A8011169C3 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (33, 0, 1047, CAST(0x0000A2A801126A20 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (34, 0, 1047, CAST(0x0000A2A8011286D8 AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (35, 0, 1047, CAST(0x0000A2A8011286F8 AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (36, 0, 0, CAST(0x0000A2A801128C08 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (37, 0, 1049, CAST(0x0000A2A801129CAD AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (38, 0, 0, CAST(0x0000A2A80112CABF AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (39, 0, 1049, CAST(0x0000A2A80112DB5F AS DateTime), N'UnPublish', N'UnPublish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (40, 0, 1049, CAST(0x0000A2A80112DB7A AS DateTime), N'Move', N'Move Content to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (41, 0, 0, CAST(0x0000A2A80112EDD2 AS DateTime), N'New', N'Content '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (42, 0, 1050, CAST(0x0000A2A80112F837 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (43, 0, 1050, CAST(0x0000A2A8011302D2 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (44, 0, 1050, CAST(0x0000A2A801130C0E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (45, 0, -43, CAST(0x0000A2A80114B420 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (46, 0, -43, CAST(0x0000A2A80114B6A6 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (47, 0, -43, CAST(0x0000A2A80114BAD5 AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (48, 0, -43, CAST(0x0000A2A80114CB6C AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (49, 0, -43, CAST(0x0000A2A80114CDFC AS DateTime), N'Save', N'Save DataTypeDefinition performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (50, 0, 1050, CAST(0x0000A2A801178D4E AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (51, 0, 1050, CAST(0x0000A2A80118AB57 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (52, 0, 1050, CAST(0x0000A2A80118BDB4 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (53, 0, 1046, CAST(0x0000A2AB015E89A2 AS DateTime), N'Save', N'Save ContentType performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (54, 0, 1050, CAST(0x0000A2AB015EA857 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (55, 0, 1050, CAST(0x0000A2AB015EB680 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (56, 0, 1050, CAST(0x0000A2AB016481A8 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (57, 0, 1050, CAST(0x0000A2AB01648C73 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (58, 0, 0, CAST(0x0000A2AB0164CF6C AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (59, 0, 1051, CAST(0x0000A2AB0164D65A AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (60, 0, 0, CAST(0x0000A2AB0164DB51 AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (61, 0, 1052, CAST(0x0000A2AB0164F1F2 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (62, 0, 1052, CAST(0x0000A2AB0164F6C0 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (63, 0, 1052, CAST(0x0000A2AB01650BDB AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (64, 0, 0, CAST(0x0000A2AB016511FC AS DateTime), N'New', N'Media '''' was created')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (65, 0, 1053, CAST(0x0000A2AB016552C3 AS DateTime), N'Save', N'Save Media performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (66, 0, 1053, CAST(0x0000A2AB01655B1B AS DateTime), N'Move', N'Move Media to Recycle Bin performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (67, 0, 1050, CAST(0x0000A2AB0166378B AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (68, 0, 1050, CAST(0x0000A2AB0166415F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (69, 0, 1050, CAST(0x0000A2AB01664DBF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (70, 0, 1050, CAST(0x0000A2AB01665686 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (71, 0, 1050, CAST(0x0000A2AB0166C9EF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (72, 0, 1050, CAST(0x0000A2AB016910E6 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (73, 0, 1050, CAST(0x0000A2AB01691C19 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (74, 0, 1050, CAST(0x0000A2AB016925B9 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (75, 0, 1050, CAST(0x0000A2AB016930D9 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (76, 0, 1050, CAST(0x0000A2AB016D46CF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (77, 0, 1050, CAST(0x0000A2AB016D823A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (78, 0, 1050, CAST(0x0000A2AB016DAD35 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (79, 0, 1050, CAST(0x0000A2AC0099BDB4 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (80, 0, 1050, CAST(0x0000A2AC009A2550 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (81, 0, 1050, CAST(0x0000A2AC009A3287 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (82, 0, 1050, CAST(0x0000A2AC009A59F6 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (83, 0, 1050, CAST(0x0000A2AC009A7934 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (84, 0, 1050, CAST(0x0000A2AC009A8491 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (85, 0, 1050, CAST(0x0000A2AC009AE47F AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (86, 0, 1050, CAST(0x0000A2AC009AEDCC AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (87, 0, 1050, CAST(0x0000A2AC009B00BF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (88, 0, 1050, CAST(0x0000A2AC00A079DF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (89, 0, 1050, CAST(0x0000A2AC00A0ECEA AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (90, 0, 1050, CAST(0x0000A2AC00A1ADC7 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (91, 0, 1050, CAST(0x0000A2AC00A1B71A AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (92, 0, 1050, CAST(0x0000A2AC00A1E7FF AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (93, 0, 1050, CAST(0x0000A2AC00A2CAA4 AS DateTime), N'Publish', N'Save and Publish performed by user')
INSERT [dbo].[umbracoLog] ([id], [userId], [NodeId], [Datestamp], [logHeader], [logComment]) VALUES (94, 0, 1050, CAST(0x0000A2AC00A3A16E AS DateTime), N'Publish', N'Save and Publish performed by user')
SET IDENTITY_INSERT [dbo].[umbracoLog] OFF
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](10) NULL,
	[languageCultureName] [nvarchar](100) NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage] 
(
	[languageISOCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoLanguage] ON
INSERT [dbo].[umbracoLanguage] ([id], [languageISOCode], [languageCultureName]) VALUES (1, N'en-US', N'en-US')
SET IDENTITY_INSERT [dbo].[umbracoLanguage] OFF
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroScriptType] [nvarchar](255) NULL,
	[macroScriptAssembly] [nvarchar](255) NULL,
	[macroXSLT] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroPython] [nvarchar](255) NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro] 
(
	[macroAlias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsStylesheetProperty]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheetProperty](
	[nodeId] [int] NOT NULL,
	[stylesheetPropertyEditor] [bit] NULL,
	[stylesheetPropertyAlias] [nvarchar](50) NULL,
	[stylesheetPropertyValue] [nvarchar](400) NULL,
 CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NOT NULL,
	[key] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty] 
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsStylesheet]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsStylesheet](
	[nodeId] [int] NOT NULL,
	[filename] [nvarchar](100) NOT NULL,
	[content] [ntext] NULL,
 CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType] 
(
	[icon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentType] ON
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (531, 1044, N'Member', N'icon-user', N'folder.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (532, 1031, N'Folder', N'icon-folder', N'folder.png', NULL, 0, 1)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (533, 1032, N'Image', N'icon-picture', N'mediaPhoto.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (534, 1033, N'File', N'icon-document', N'mediaFile.png', NULL, 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (535, 1046, N'TestDocType', N'.sprTreeFolder', N'folder.png', N'', 0, 0)
INSERT [dbo].[cmsContentType] ([pk], [nodeId], [alias], [icon], [thumbnail], [description], [isContainer], [allowAtRoot]) VALUES (536, 1056, N'TestMemberType', N'member.gif', N'folder.png', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[cmsContentType] OFF
/****** Object:  Table [dbo].[cmsContent]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContent](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[contentType] [int] NOT NULL,
 CONSTRAINT [PK_cmsContent] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContent] ON [dbo].[cmsContent] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContent] ON
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (1, 1047, 1046)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (2, 1049, 1046)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (3, 1050, 1046)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (4, 1051, 1031)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (5, 1052, 1033)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (6, 1053, 1033)
INSERT [dbo].[cmsContent] ([pk], [nodeId], [contentType]) VALUES (8, 1057, 1056)
SET IDENTITY_INSERT [dbo].[cmsContent] OFF
/****** Object:  Table [dbo].[cmsDataType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_cmsDataType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDataType_nodeId] ON [dbo].[cmsDataType] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataType] ON
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (1, -49, N'Umbraco.TrueFalse', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (2, -51, N'Umbraco.Integer', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (3, -87, N'Umbraco.TinyMCEv3', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (4, -88, N'Umbraco.Textbox', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (5, -89, N'Umbraco.TextboxMultiple', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (6, -90, N'Umbraco.UploadField', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (7, -92, N'Umbraco.NoEdit', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (8, -36, N'Umbraco.DateTime', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (9, -37, N'Umbraco.ColorPickerAlias', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (10, -38, N'Umbraco.FolderBrowser', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (11, -39, N'Umbraco.DropDownMultiple', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (12, -40, N'Umbraco.RadioButtonList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (13, -41, N'Umbraco.Date', N'Date')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (14, -42, N'Umbraco.DropDown', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (15, -43, N'Umbraco.CheckBoxList', N'Nvarchar')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (16, 1034, N'Umbraco.ContentPickerAlias', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (17, 1035, N'Umbraco.MediaPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (18, 1036, N'Umbraco.MemberPicker', N'Integer')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (21, 1040, N'Umbraco.RelatedLinks', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (22, 1041, N'Umbraco.Tags', N'Ntext')
INSERT [dbo].[cmsDataType] ([pk], [nodeId], [propertyEditorAlias], [dbType]) VALUES (25, 1045, N'Umbraco.MultipleMediaPicker', N'Nvarchar')
SET IDENTITY_INSERT [dbo].[cmsDataType] OFF
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomains]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomains](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomains] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[master] [int] NULL,
	[alias] [nvarchar](100) NULL,
	[design] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate] 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsTemplate] ON
INSERT [dbo].[cmsTemplate] ([pk], [nodeId], [master], [alias], [design]) VALUES (1, 1048, NULL, N'TestDocType', N'@inherits Umbraco.Web.Mvc.UmbracoViewPage<Umbraco701.Models.TestDocTypeViewModel>

@{
    Layout = null;
}

<h1>@Model.Heading</h1>
<p>ID: @Model.Id</p>')
SET IDENTITY_INSERT [dbo].[cmsTemplate] OFF
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userType] [int] NOT NULL,
	[startStructureID] [int] NOT NULL,
	[startMediaID] [int] NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser] 
(
	[userLogin] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[umbracoUser] ON
INSERT [dbo].[umbracoUser] ([id], [userDisabled], [userNoConsole], [userType], [startStructureID], [startMediaID], [userName], [userLogin], [userPassword], [userEmail], [userLanguage]) VALUES (0, 0, 0, 1, -1, -1, N'admin', N'admin', N'W477AMlLwwJQeAGlPZKiEILr8TA=', N'test@test.com', N'en')
SET IDENTITY_INSERT [dbo].[umbracoUser] OFF
/****** Object:  Table [dbo].[umbracoUser2NodePermission]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodePermission](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2app]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2app](
	[user] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user2app] PRIMARY KEY CLUSTERED 
(
	[user] ASC,
	[app] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'content')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'developer')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'media')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'member')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'settings')
INSERT [dbo].[umbracoUser2app] ([user], [app]) VALUES (0, N'users')
/****** Object:  Table [dbo].[cmsTask]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTask](
	[closed] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[taskTypeId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[parentUserId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Comment] [nvarchar](500) NULL,
 CONSTRAINT [PK_cmsTask] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocumentType] ([contentTypeNodeId], [templateNodeId], [IsDefault]) VALUES (1046, 1048, 1)
/****** Object:  Table [dbo].[cmsDocument]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[documentUser] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[releaseDate] [datetime] NULL,
	[expireDate] [datetime] NULL,
	[updateDate] [datetime] NOT NULL,
	[templateId] [int] NULL,
	[alias] [nvarchar](255) NULL,
	[newest] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocument] PRIMARY KEY CLUSTERED 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDocument] ON [dbo].[cmsDocument] 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsDocument_newest] ON [dbo].[cmsDocument] 
(
	[newest] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsDocument_published] ON [dbo].[cmsDocument] 
(
	[published] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 0, 0, N'78527414-3caf-42a5-b4ab-0024619ca6e6', N'Home page (1)', NULL, NULL, CAST(0x0000A2A80112DB78 AS DateTime), 1048, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A1B6FA AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'9bfe9539-644a-4391-89a2-0622777b6983', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A2CA2D AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'1e68c846-9add-4727-8151-0a6451706d14', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A0EC7B AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1047, 0, 0, N'dc98e03e-34d3-4348-9b40-19ba449c30cb', N'Home Page', NULL, NULL, CAST(0x0000A2A8011286C1 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', N'Test Page', NULL, NULL, CAST(0x0000A2AB0169108B AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'b2509d74-42e5-447f-937d-2d59af907c80', N'Test Page', NULL, NULL, CAST(0x0000A2AB01648C65 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'50c948fe-b8c7-4503-b5d9-3ae7f2391efc', N'Test Page', NULL, NULL, CAST(0x0000A2A8011302BA AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', N'Test Page', NULL, NULL, CAST(0x0000A2AB016D46A8 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1047, 0, 0, N'8e2830a9-e2f6-4c7b-ace0-4ec92f8efd99', N'Home Page', NULL, NULL, CAST(0x0000A2A8011286EB AS DateTime), 1048, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', N'Test Page', NULL, NULL, CAST(0x0000A2AB015EB2BA AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', N'Test Page', NULL, NULL, CAST(0x0000A2AB01648170 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'6c3aebeb-ca07-47aa-b506-6826727673b5', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A0F5FA AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1047, 0, 0, N'525999a0-9a86-40e8-9cb0-70d363ca0d0b', N'Home Page', NULL, NULL, CAST(0x0000A2A80112698A AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'26569e02-810d-48be-b35c-71e26958d0dd', N'Test Page', NULL, NULL, CAST(0x0000A2AB01691BF4 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', N'Test Page', NULL, NULL, CAST(0x0000A2AB016930BA AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'5b1c1c28-1984-4693-a7c2-83374dbfa23d', N'Test Page', NULL, NULL, CAST(0x0000A2A80118AB48 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'f4ce9ab0-e162-492d-9210-84a7e518660b', N'Test Page', NULL, NULL, CAST(0x0000A2AC009A3274 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'1509c934-161a-4779-9654-89e1ac894f83', N'Test Page', NULL, NULL, CAST(0x0000A2A80112F7EE AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1047, 0, 0, N'54240acd-063d-44d2-b899-8c50822a1fc0', N'Home Page', NULL, NULL, CAST(0x0000A2A500B33737 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', N'Test Page', NULL, NULL, CAST(0x0000A2A80118BDA4 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'8361f856-874b-4b9b-afed-98804405370f', N'Test Page', NULL, NULL, CAST(0x0000A2AB01665663 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A1C4AE AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'38a968c8-16cb-4bfb-89f6-a0231c069ea6', N'Test Page', NULL, NULL, CAST(0x0000A2A801130BF0 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', N'Test Page', NULL, NULL, CAST(0x0000A2AC009A8475 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 0, 0, N'a3116b0e-bb16-428f-872b-a48eeb441d50', N'Home page', NULL, NULL, CAST(0x0000A2A80112DB57 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', N'Test Page', NULL, NULL, CAST(0x0000A2AB016DAD1F AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'274971b6-edc8-4873-9567-a62ea7765df0', N'Test Page', NULL, NULL, CAST(0x0000A2A801178C8A AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 1, 0, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A3A14E AS DateTime), 1048, NULL, 1)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'30ad93e1-4dc2-4999-8150-b02943331749', N'Test Page', NULL, NULL, CAST(0x0000A2AC009A790C AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'e194aae1-b817-4c97-bf79-b15900730af0', N'Test Page', NULL, NULL, CAST(0x0000A2AB0166C9CE AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', N'Test Page', NULL, NULL, CAST(0x0000A2AB015EA738 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', N'Test Page', NULL, NULL, CAST(0x0000A2AC0099BD76 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', N'Test Page', NULL, NULL, CAST(0x0000A2AC009B00B0 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'6e93f6cb-c030-4974-b475-ce5b318782aa', N'Test Page', NULL, NULL, CAST(0x0000A2AB016925A6 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1049, 0, 0, N'd884fda2-8d96-469d-b191-d2384fc738dd', N'Home page', NULL, NULL, CAST(0x0000A2A801129C7E AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', N'Test Page', NULL, NULL, CAST(0x0000A2AC009A250D AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', N'Test Page', NULL, NULL, CAST(0x0000A2AB01664DAB AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'775d5abb-b52c-42cc-a8ae-e15cec411979', N'Test Page', NULL, NULL, CAST(0x0000A2AB016D8223 AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', N'Test Page', NULL, NULL, CAST(0x0000A2AC00A0799A AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'32135086-9c0c-43c4-8c01-f1c220068f3e', N'Test Page', NULL, NULL, CAST(0x0000A2AC009AE42D AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'f0a29936-8fcb-4d49-a435-fc898988b439', N'Test Page', NULL, NULL, CAST(0x0000A2AC009AEDBD AS DateTime), 1048, NULL, 0)
INSERT [dbo].[cmsDocument] ([nodeId], [published], [documentUser], [versionId], [text], [releaseDate], [expireDate], [updateDate], [templateId], [alias], [newest]) VALUES (1050, 0, 0, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', N'Test Page', NULL, NULL, CAST(0x0000A2AC009A59E1 AS DateTime), 1048, NULL, 0)
/****** Object:  Table [dbo].[cmsContentXml]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentXml](
	[nodeId] [int] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsContentXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1050, N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:55:45" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[dog,cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1051, N'<Folder id="1051" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-06T21:39:12" updateDate="2014-01-06T21:39:12" nodeName="Audio" urlName="audio" path="-1,1051" isDoc="" nodeType="1031" writerName="admin" writerID="0" version="c4669b3c-1339-4c33-aadf-3bfef0dff673" template="0" nodeTypeAlias="Folder">
  <contents></contents>
</Folder>')
INSERT [dbo].[cmsContentXml] ([nodeId], [xml]) VALUES (1057, N'<TestMemberType id="1057" parentID="-1" level="1" creatorID="0" sortOrder="1" createDate="2014-01-06T22:07:15" updateDate="2014-01-06T22:07:15" nodeName="Jim" urlName="jim" path="-1,1057" isDoc="" nodeType="1056" nodeTypeAlias="TestMemberType" loginName="jim" email="jim@xxx.com" key="4061e5ed-92aa-4f54-bd69-16178d0f2e2d">
  <umbracoCommentPropertyTypeAlias></umbracoCommentPropertyTypeAlias>
  <umbracoFailedPasswordAttemptsPropertyTypeAlias></umbracoFailedPasswordAttemptsPropertyTypeAlias>
  <umbracoApprovePropertyTypeAlias></umbracoApprovePropertyTypeAlias>
  <umbracoLockPropertyTypeAlias></umbracoLockPropertyTypeAlias>
  <umbracoMemberLastLockout></umbracoMemberLastLockout>
  <umbracoLastLoginPropertyTypeAlias></umbracoLastLoginPropertyTypeAlias>
  <umbracoMemberLastPasswordChange></umbracoMemberLastPasswordChange>
  <umbracoPasswordRetrievalAnswerPropertyTypeAlias></umbracoPasswordRetrievalAnswerPropertyTypeAlias>
  <umbracoPasswordRetrievalQuestionPropertyTypeAlias></umbracoPasswordRetrievalQuestionPropertyTypeAlias>
</TestMemberType>')
/****** Object:  Table [dbo].[cmsContentVersion]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ContentId] [int] NOT NULL,
	[VersionId] [uniqueidentifier] NOT NULL,
	[VersionDate] [datetime] NOT NULL,
	[LanguageLocale] [nvarchar](10) NULL,
 CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsContentVersion_ContentId] ON [dbo].[cmsContentVersion] 
(
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentVersion_VersionId] ON [dbo].[cmsContentVersion] 
(
	[VersionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsContentVersion] ON
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (1, 1047, N'54240acd-063d-44d2-b899-8c50822a1fc0', CAST(0x0000A2A500B33737 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (2, 1047, N'525999a0-9a86-40e8-9cb0-70d363ca0d0b', CAST(0x0000A2A80112698A AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (3, 1047, N'dc98e03e-34d3-4348-9b40-19ba449c30cb', CAST(0x0000A2A8011286C1 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (4, 1047, N'8e2830a9-e2f6-4c7b-ace0-4ec92f8efd99', CAST(0x0000A2A8011286EB AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (5, 1049, N'd884fda2-8d96-469d-b191-d2384fc738dd', CAST(0x0000A2A801129C7E AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (6, 1049, N'a3116b0e-bb16-428f-872b-a48eeb441d50', CAST(0x0000A2A80112DB57 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (7, 1049, N'78527414-3caf-42a5-b4ab-0024619ca6e6', CAST(0x0000A2A80112DB78 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (8, 1050, N'1509c934-161a-4779-9654-89e1ac894f83', CAST(0x0000A2A80112F7EE AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (9, 1050, N'50c948fe-b8c7-4503-b5d9-3ae7f2391efc', CAST(0x0000A2A8011302BA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (10, 1050, N'38a968c8-16cb-4bfb-89f6-a0231c069ea6', CAST(0x0000A2A801130BF0 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (11, 1050, N'274971b6-edc8-4873-9567-a62ea7765df0', CAST(0x0000A2A801178C8A AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (12, 1050, N'5b1c1c28-1984-4693-a7c2-83374dbfa23d', CAST(0x0000A2A80118AB48 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (13, 1050, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', CAST(0x0000A2A80118BDA4 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (14, 1050, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', CAST(0x0000A2AB015EA738 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (15, 1050, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', CAST(0x0000A2AB015EB2BA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (16, 1050, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', CAST(0x0000A2AB01648170 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (17, 1050, N'b2509d74-42e5-447f-937d-2d59af907c80', CAST(0x0000A2AB01648C65 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (18, 1051, N'c4669b3c-1339-4c33-aadf-3bfef0dff673', CAST(0x0000A2AB0164D633 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (19, 1052, N'2d71fa46-5d70-491f-9118-ee2154bf6018', CAST(0x0000A2AB01650BD1 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (20, 1053, N'c32e8b8f-f2dc-458d-8dd3-d195ab63319b', CAST(0x0000A2AB01655B0E AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (23, 1050, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', CAST(0x0000A2AB01664DAB AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (24, 1050, N'8361f856-874b-4b9b-afed-98804405370f', CAST(0x0000A2AB01665663 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (27, 1050, N'e194aae1-b817-4c97-bf79-b15900730af0', CAST(0x0000A2AB0166C9CE AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (30, 1050, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', CAST(0x0000A2AB0169108B AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (31, 1050, N'26569e02-810d-48be-b35c-71e26958d0dd', CAST(0x0000A2AB01691BF4 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (32, 1050, N'6e93f6cb-c030-4974-b475-ce5b318782aa', CAST(0x0000A2AB016925A6 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (33, 1050, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', CAST(0x0000A2AB016930BA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (35, 1057, N'9419d75b-5487-40b3-bab9-3047173dac4d', CAST(0x0000A2AB016C8B12 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (36, 1050, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', CAST(0x0000A2AB016D46A8 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (37, 1050, N'775d5abb-b52c-42cc-a8ae-e15cec411979', CAST(0x0000A2AB016D8223 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (38, 1050, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', CAST(0x0000A2AB016DAD1F AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (39, 1050, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', CAST(0x0000A2AC0099BD76 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (40, 1050, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', CAST(0x0000A2AC009A250D AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (41, 1050, N'f4ce9ab0-e162-492d-9210-84a7e518660b', CAST(0x0000A2AC009A3274 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (42, 1050, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', CAST(0x0000A2AC009A59E1 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (43, 1050, N'30ad93e1-4dc2-4999-8150-b02943331749', CAST(0x0000A2AC009A790C AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (44, 1050, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', CAST(0x0000A2AC009A8475 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (45, 1050, N'32135086-9c0c-43c4-8c01-f1c220068f3e', CAST(0x0000A2AC009AE42D AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (46, 1050, N'f0a29936-8fcb-4d49-a435-fc898988b439', CAST(0x0000A2AC009AEDBD AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (47, 1050, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', CAST(0x0000A2AC009B00B0 AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (48, 1050, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', CAST(0x0000A2AC00A0799A AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (49, 1050, N'1e68c846-9add-4727-8151-0a6451706d14', CAST(0x0000A2AC00A0EC7B AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (50, 1050, N'6c3aebeb-ca07-47aa-b506-6826727673b5', CAST(0x0000A2AC00A0F5FA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (51, 1050, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', CAST(0x0000A2AC00A1B6FA AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (52, 1050, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', CAST(0x0000A2AC00A1C4AE AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (54, 1050, N'9bfe9539-644a-4391-89a2-0622777b6983', CAST(0x0000A2AC00A2CA2D AS DateTime), NULL)
INSERT [dbo].[cmsContentVersion] ([id], [ContentId], [VersionId], [VersionDate], [LanguageLocale]) VALUES (56, 1050, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', CAST(0x0000A2AC00A3A14E AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[cmsContentVersion] OFF
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1031, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1032, 0)
INSERT [dbo].[cmsContentTypeAllowedContentType] ([Id], [AllowedId], [SortOrder]) VALUES (1031, 1033, 0)
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentGroupId] [int] NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] ON
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (3, NULL, 1032, N'Image', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (4, NULL, 1033, N'File', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (5, NULL, 1031, N'Contents', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (11, NULL, 1044, N'Membership', 1)
INSERT [dbo].[cmsPropertyTypeGroup] ([id], [parentGroupId], [contenttypeNodeId], [text], [sortorder]) VALUES (12, NULL, 1046, N'Content', 10)
SET IDENTITY_INSERT [dbo].[cmsPropertyTypeGroup] OFF
/****** Object:  Table [dbo].[cmsMember]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsMember] ([nodeId], [Email], [LoginName], [Password]) VALUES (1057, N'jim@xxx.com', N'jim', N'68MKv4B3OpSeH4/SIazzDUCBghg=')
/****** Object:  Table [dbo].[cmsDataTypePreValues]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDataTypePreValues](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datatypeNodeId] [int] NOT NULL,
	[value] [nvarchar](2500) NULL,
	[sortorder] [int] NOT NULL,
	[alias] [nvarchar](50) NULL,
 CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] ON
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (3, -87, N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|', 0, N'')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (4, 1041, N'default', 0, N'group')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (10, -43, N'z', 1, N'0')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (11, -43, N'w', 2, N'3')
INSERT [dbo].[cmsDataTypePreValues] ([id], [datatypeNodeId], [value], [sortorder], [alias]) VALUES (12, -43, N'aaa', 3, N'0')
SET IDENTITY_INSERT [dbo].[cmsDataTypePreValues] OFF
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPreviewXml]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPreviewXml](
	[nodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[xml] [ntext] NOT NULL,
 CONSTRAINT [PK_cmsPreviewXml] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1047, N'525999a0-9a86-40e8-9cb0-70d363ca0d0b', CAST(0x0000A2A8011269C6 AS DateTime), N'<TestDocType id="1047" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-27T15:39:33" updateDate="2014-01-03T16:39:06" nodeName="Home Page" urlName="home-page" path="-1,1047" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Heading for home page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1047, N'54240acd-063d-44d2-b899-8c50822a1fc0', CAST(0x0000A2A500B338C2 AS DateTime), N'<TestDocType id="1047" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2013-12-27T15:39:33" updateDate="2013-12-31T10:52:30" nodeName="Home Page" urlName="home-page" path="-1,1047" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Heading for home page]]></heading>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1049, N'd884fda2-8d96-469d-b191-d2384fc738dd', CAST(0x0000A2A801129C91 AS DateTime), N'<TestDocType id="1049" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:39:49" updateDate="2014-01-03T16:39:49" nodeName="Home page" urlName="home-page" path="-1,1049" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Home page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', CAST(0x0000A2AC00A1B6FC AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:48:47" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'9bfe9539-644a-4391-89a2-0622777b6983', CAST(0x0000A2AC00A2CA4D AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:52:41" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[dog,cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'1e68c846-9add-4727-8151-0a6451706d14', CAST(0x0000A2AC00A0EC93 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:45:54" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', CAST(0x0000A2AB016910B3 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:54:35" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,xxx''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'b2509d74-42e5-447f-937d-2d59af907c80', CAST(0x0000A2AB01648C6C AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:38:09" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'50c948fe-b8c7-4503-b5d9-3ae7f2391efc', CAST(0x0000A2A8011302BD AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T16:41:16" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', CAST(0x0000A2AB016D46B5 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T22:09:55" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog,x''''''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', CAST(0x0000A2AB015EB62C AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:16:51" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', CAST(0x0000A2AB016481A2 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:37:59" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'6c3aebeb-ca07-47aa-b506-6826727673b5', CAST(0x0000A2AC00A1ADA1 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:46:02" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[test''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'26569e02-810d-48be-b35c-71e26958d0dd', CAST(0x0000A2AB01691C0C AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:54:45" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,xxx''s,frog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', CAST(0x0000A2AB016930CC AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:55:03" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog,x''''''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'5b1c1c28-1984-4693-a7c2-83374dbfa23d', CAST(0x0000A2A80118AB4D AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T17:01:53" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'f4ce9ab0-e162-492d-9210-84a7e518660b', CAST(0x0000A2AC009A3282 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:21:24" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog'';CREATE TABLE Fred (Id int NOT NULL);]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'1509c934-161a-4779-9654-89e1ac894f83', CAST(0x0000A2A80112F7FE AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T16:41:07" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', CAST(0x0000A2A80118BDAA AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T17:02:08" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'8361f856-874b-4b9b-afed-98804405370f', CAST(0x0000A2AB01665674 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:44:40" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,test]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', CAST(0x0000A2AC00A1E7FA AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:48:58" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[dog,cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'38a968c8-16cb-4bfb-89f6-a0231c069ea6', CAST(0x0000A2A801130BF3 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T16:41:24" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', CAST(0x0000A2AC009A8489 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:22:34" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,x''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', CAST(0x0000A2AB016DAD24 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T22:11:23" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog,x''''''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'274971b6-edc8-4873-9567-a62ea7765df0', CAST(0x0000A2A801178CFD AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-03T16:57:48" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', CAST(0x0000A2AC00A3A152 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:55:45" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[dog,cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'30ad93e1-4dc2-4999-8150-b02943331749', CAST(0x0000A2AC009A7927 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:22:25" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'e194aae1-b817-4c97-bf79-b15900730af0', CAST(0x0000A2AB0166C9DD AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:46:18" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', CAST(0x0000A2AB015EA7C6 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:16:41" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,rabbit]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', CAST(0x0000A2AC0099BD8F AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:19:45" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog'';CREATE TABLE Fred (Id int NOT NULL);]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', CAST(0x0000A2AC009B00B4 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:24:20" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,x''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'6e93f6cb-c030-4974-b475-ce5b318782aa', CAST(0x0000A2AB016925AE AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:54:53" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', CAST(0x0000A2AC009A2527 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:21:13" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', CAST(0x0000A2AB01664DAD AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T21:44:32" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'775d5abb-b52c-42cc-a8ae-e15cec411979', CAST(0x0000A2AB016D8227 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-06T22:10:46" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "1050",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": true,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog,frog,x''''''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', CAST(0x0000A2AC00A079B1 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:44:16" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[test''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'32135086-9c0c-43c4-8c01-f1c220068f3e', CAST(0x0000A2AC009AE44D AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:23:56" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,x''s]]></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'f0a29936-8fcb-4d49-a435-fc898988b439', CAST(0x0000A2AC009AEDC3 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:24:04" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]]]></relatedLInks>
  <tags></tags>
</TestDocType>')
INSERT [dbo].[cmsPreviewXml] ([nodeId], [versionId], [timestamp], [xml]) VALUES (1050, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', CAST(0x0000A2AC009A59E9 AS DateTime), N'<TestDocType id="1050" parentID="-1" level="1" creatorID="0" sortOrder="0" createDate="2014-01-03T16:41:07" updateDate="2014-01-07T09:21:58" nodeName="Test Page" urlName="test-page" path="-1,1050" isDoc="" nodeType="1046" creatorName="admin" writerName="admin" writerID="0" template="1048" nodeTypeAlias="TestDocType">
  <heading><![CDATA[Test Page]]></heading>
  <relatedLInks><![CDATA[[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]]]></relatedLInks>
  <tags><![CDATA[cat,dog'';CREATE TABLE Fred (Id int NOT NULL);,x''s]]></tags>
</TestDocType>')
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsMember2MemberGroup] ([Member], [MemberGroup]) VALUES (1057, 1054)
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[helpText] [nvarchar](1000) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyType] ON
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (6, -90, 1032, 3, N'umbracoFile', N'Upload image', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (7, -92, 1032, 3, N'umbracoWidth', N'Width', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (8, -92, 1032, 3, N'umbracoHeight', N'Height', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (9, -92, 1032, 3, N'umbracoBytes', N'Size', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (10, -92, 1032, 3, N'umbracoExtension', N'Type', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (24, -90, 1033, 4, N'umbracoFile', N'Upload file', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (25, -92, 1033, 4, N'umbracoExtension', N'Type', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (26, -92, 1033, 4, N'umbracoBytes', N'Size', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (27, -38, 1031, 5, N'contents', N'Contents:', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (28, -89, 1044, 11, N'umbracoCommentPropertyTypeAlias', N'Comments', NULL, 0, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (29, -92, 1044, 11, N'umbracoFailedPasswordAttemptsPropertyTypeAlias', N'Failed Password Attempts', NULL, 1, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (30, -49, 1044, 11, N'umbracoApprovePropertyTypeAlias', N'Is Approved', NULL, 2, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (31, -49, 1044, 11, N'umbracoLockPropertyTypeAlias', N'Is Locked Out', NULL, 3, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (32, -92, 1044, 11, N'umbracoMemberLastLockout', N'Last Lockout Date', NULL, 4, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (33, -92, 1044, 11, N'umbracoLastLoginPropertyTypeAlias', N'Last Login Date', NULL, 5, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (34, -92, 1044, 11, N'umbracoMemberLastPasswordChange', N'Last Password Change Date', NULL, 6, 0, NULL, NULL)
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (35, -88, 1046, 12, N'heading', N'Heading', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (36, 1040, 1046, 12, N'relatedLInks', N'Related LInks', NULL, 0, 0, N'', N'')
INSERT [dbo].[cmsPropertyType] ([id], [dataTypeId], [contentTypeId], [propertyTypeGroupId], [Alias], [Name], [helpText], [sortOrder], [mandatory], [validationRegExp], [Description]) VALUES (37, 1041, 1046, 12, N'tags', N'Tags', NULL, 0, 0, N'', N'')
SET IDENTITY_INSERT [dbo].[cmsPropertyType] OFF
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1050, 1, 37)
INSERT [dbo].[cmsTagRelationship] ([nodeId], [tagId], [propertyTypeId]) VALUES (1050, 2, 37)
/****** Object:  Table [dbo].[cmsPropertyData]    Script Date: 01/21/2014 22:24:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contentNodeId] [int] NOT NULL,
	[versionId] [uniqueidentifier] NULL,
	[propertytypeid] [int] NOT NULL,
	[dataInt] [int] NULL,
	[dataDate] [datetime] NULL,
	[dataNvarchar] [nvarchar](500) NULL,
	[dataNtext] [ntext] NULL,
 CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData] ON [dbo].[cmsPropertyData] 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_1] ON [dbo].[cmsPropertyData] 
(
	[contentNodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_2] ON [dbo].[cmsPropertyData] 
(
	[versionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_cmsPropertyData_3] ON [dbo].[cmsPropertyData] 
(
	[propertytypeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cmsPropertyData] ON
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (1, 1047, N'54240acd-063d-44d2-b899-8c50822a1fc0', 35, NULL, NULL, N'Heading for home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (2, 1047, N'54240acd-063d-44d2-b899-8c50822a1fc0', 36, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (3, 1047, N'525999a0-9a86-40e8-9cb0-70d363ca0d0b', 35, NULL, NULL, N'Heading for home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (4, 1047, N'525999a0-9a86-40e8-9cb0-70d363ca0d0b', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (5, 1047, N'dc98e03e-34d3-4348-9b40-19ba449c30cb', 35, NULL, NULL, N'Heading for home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (6, 1047, N'dc98e03e-34d3-4348-9b40-19ba449c30cb', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (7, 1047, N'8e2830a9-e2f6-4c7b-ace0-4ec92f8efd99', 35, NULL, NULL, N'Heading for home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (8, 1047, N'8e2830a9-e2f6-4c7b-ace0-4ec92f8efd99', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (9, 1049, N'd884fda2-8d96-469d-b191-d2384fc738dd', 35, NULL, NULL, N'Home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (10, 1049, N'd884fda2-8d96-469d-b191-d2384fc738dd', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (11, 1049, N'a3116b0e-bb16-428f-872b-a48eeb441d50', 35, NULL, NULL, N'Home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (12, 1049, N'a3116b0e-bb16-428f-872b-a48eeb441d50', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (13, 1049, N'78527414-3caf-42a5-b4ab-0024619ca6e6', 35, NULL, NULL, N'Home page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (14, 1049, N'78527414-3caf-42a5-b4ab-0024619ca6e6', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (15, 1050, N'1509c934-161a-4779-9654-89e1ac894f83', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (16, 1050, N'1509c934-161a-4779-9654-89e1ac894f83', 36, NULL, NULL, NULL, N'[]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (17, 1050, N'50c948fe-b8c7-4503-b5d9-3ae7f2391efc', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (18, 1050, N'50c948fe-b8c7-4503-b5d9-3ae7f2391efc', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (19, 1050, N'38a968c8-16cb-4bfb-89f6-a0231c069ea6', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (20, 1050, N'38a968c8-16cb-4bfb-89f6-a0231c069ea6', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (21, 1050, N'274971b6-edc8-4873-9567-a62ea7765df0', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (22, 1050, N'274971b6-edc8-4873-9567-a62ea7765df0', 36, NULL, NULL, NULL, N'[
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (23, 1050, N'5b1c1c28-1984-4693-a7c2-83374dbfa23d', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (24, 1050, N'5b1c1c28-1984-4693-a7c2-83374dbfa23d', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (25, 1050, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (26, 1050, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (27, 1050, N'69a52566-914e-4f61-91a0-8e6e34c9ac85', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (28, 1050, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (29, 1050, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (30, 1050, N'a853c04f-fa4c-482a-86d6-bb5cc93b998f', 37, NULL, NULL, NULL, N'cat,dog,rabbit')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (31, 1049, N'78527414-3caf-42a5-b4ab-0024619ca6e6', 37, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (32, 1050, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (33, 1050, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (34, 1050, N'855d62e7-d721-4f07-9f31-634a31cfc8d9', 37, NULL, NULL, NULL, N'cat,dog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (35, 1050, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (36, 1050, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (37, 1050, N'4877cd2f-3e07-44db-bf23-64dd0dd917e1', 37, NULL, NULL, NULL, N'cat,dog,frog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (38, 1050, N'b2509d74-42e5-447f-937d-2d59af907c80', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (39, 1050, N'b2509d74-42e5-447f-937d-2d59af907c80', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (40, 1050, N'b2509d74-42e5-447f-937d-2d59af907c80', 37, NULL, NULL, NULL, N'cat,dog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (41, 1051, N'c4669b3c-1339-4c33-aadf-3bfef0dff673', 27, NULL, NULL, NULL, NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (42, 1052, N'2d71fa46-5d70-491f-9118-ee2154bf6018', 24, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (43, 1052, N'2d71fa46-5d70-491f-9118-ee2154bf6018', 25, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (44, 1052, N'2d71fa46-5d70-491f-9118-ee2154bf6018', 26, NULL, NULL, N'', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (45, 1053, N'c32e8b8f-f2dc-458d-8dd3-d195ab63319b', 24, NULL, NULL, N'/media/1002/sql.mp3', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (46, 1053, N'c32e8b8f-f2dc-458d-8dd3-d195ab63319b', 25, NULL, NULL, N'mp3', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (47, 1053, N'c32e8b8f-f2dc-458d-8dd3-d195ab63319b', 26, NULL, NULL, N'498', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (54, 1050, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (55, 1050, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (56, 1050, N'18e29b56-322a-4490-bc0a-da4fbfc8b439', 37, NULL, NULL, NULL, N'cat,dog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (57, 1050, N'8361f856-874b-4b9b-afed-98804405370f', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (58, 1050, N'8361f856-874b-4b9b-afed-98804405370f', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (59, 1050, N'8361f856-874b-4b9b-afed-98804405370f', 37, NULL, NULL, NULL, N'cat,dog,test')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (66, 1050, N'e194aae1-b817-4c97-bf79-b15900730af0', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (67, 1050, N'e194aae1-b817-4c97-bf79-b15900730af0', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (68, 1050, N'e194aae1-b817-4c97-bf79-b15900730af0', 37, NULL, NULL, NULL, N'cat,dog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (75, 1050, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (76, 1050, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (77, 1050, N'563b4ba6-9fc9-4233-ba3a-2057d2e9c0e8', 37, NULL, NULL, NULL, N'cat,dog,xxx''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (78, 1050, N'26569e02-810d-48be-b35c-71e26958d0dd', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (79, 1050, N'26569e02-810d-48be-b35c-71e26958d0dd', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (80, 1050, N'26569e02-810d-48be-b35c-71e26958d0dd', 37, NULL, NULL, NULL, N'cat,dog,xxx''s,frog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (81, 1050, N'6e93f6cb-c030-4974-b475-ce5b318782aa', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (82, 1050, N'6e93f6cb-c030-4974-b475-ce5b318782aa', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (83, 1050, N'6e93f6cb-c030-4974-b475-ce5b318782aa', 37, NULL, NULL, NULL, N'cat,dog,frog')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (84, 1050, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (85, 1050, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://aaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (86, 1050, N'6bc4bb84-25ab-437e-8f08-7c93fab10d91', 37, NULL, NULL, NULL, N'cat,dog,frog,x''''''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (94, 1050, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (95, 1050, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (96, 1050, N'177e6f41-37b5-4f2b-a2bf-4ec3e60e9cbe', 37, NULL, NULL, NULL, N'cat,dog,frog,x''''''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (97, 1050, N'775d5abb-b52c-42cc-a8ae-e15cec411979', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (98, 1050, N'775d5abb-b52c-42cc-a8ae-e15cec411979', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "1050",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": true,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (99, 1050, N'775d5abb-b52c-42cc-a8ae-e15cec411979', 37, NULL, NULL, NULL, N'cat,dog,frog,x''''''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (100, 1050, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (101, 1050, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (102, 1050, N'5b5afa9c-795f-41be-b33d-a5f80ff5f950', 37, NULL, NULL, NULL, N'cat,dog,frog,x''''''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (103, 1050, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (104, 1050, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (105, 1050, N'25c96180-7d1c-4192-a94e-bc1d75a0fbcd', 37, NULL, NULL, NULL, N'cat,dog'';CREATE TABLE Fred (Id int NOT NULL);')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (106, 1050, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (107, 1050, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (108, 1050, N'9c068bc3-7d17-4213-bb83-d43a5d5d865d', 37, NULL, NULL, NULL, N'cat')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (109, 1050, N'f4ce9ab0-e162-492d-9210-84a7e518660b', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (110, 1050, N'f4ce9ab0-e162-492d-9210-84a7e518660b', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (111, 1050, N'f4ce9ab0-e162-492d-9210-84a7e518660b', 37, NULL, NULL, NULL, N'cat,dog'';CREATE TABLE Fred (Id int NOT NULL);')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (112, 1050, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (113, 1050, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (114, 1050, N'394fbb59-80a3-46c4-aea8-fcb03ead9824', 37, NULL, NULL, NULL, N'cat,dog'';CREATE TABLE Fred (Id int NOT NULL);,x''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (115, 1050, N'30ad93e1-4dc2-4999-8150-b02943331749', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (116, 1050, N'30ad93e1-4dc2-4999-8150-b02943331749', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (117, 1050, N'30ad93e1-4dc2-4999-8150-b02943331749', 37, NULL, NULL, NULL, N'cat')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (118, 1050, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (119, 1050, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  },
  {
    "caption": "bbb",
    "link": "http://bbb.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "bbb"
  },
  {
    "caption": "aaa",
    "link": "http://bbbaaaa.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "aaa"
  },
  {
    "caption": "test",
    "link": "www.xxx.com",
    "newWindow": false,
    "internal": "1050",
    "edit": false,
    "isInternal": false,
    "iternalName": "Test Page",
    "type": "internal",
    "title": "test"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (120, 1050, N'685d7da2-b2b3-45b1-a6d1-a2a5d97d96f1', 37, NULL, NULL, NULL, N'cat,x''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (121, 1050, N'32135086-9c0c-43c4-8c01-f1c220068f3e', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (122, 1050, N'32135086-9c0c-43c4-8c01-f1c220068f3e', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (123, 1050, N'32135086-9c0c-43c4-8c01-f1c220068f3e', 37, NULL, NULL, NULL, N'cat,x''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (124, 1050, N'f0a29936-8fcb-4d49-a435-fc898988b439', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (125, 1050, N'f0a29936-8fcb-4d49-a435-fc898988b439', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
GO
print 'Processed 100 total records'
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (126, 1050, N'f0a29936-8fcb-4d49-a435-fc898988b439', 37, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (127, 1050, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (128, 1050, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (129, 1050, N'115771f2-d973-4fd1-84ae-bdefa5597b3d', 37, NULL, NULL, NULL, N'cat,x''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (130, 1050, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (131, 1050, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (132, 1050, N'c9453b8c-9b62-49d2-923b-f193f2dda21e', 37, NULL, NULL, NULL, N'test''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (133, 1050, N'1e68c846-9add-4727-8151-0a6451706d14', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (134, 1050, N'1e68c846-9add-4727-8151-0a6451706d14', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (135, 1050, N'1e68c846-9add-4727-8151-0a6451706d14', 37, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (136, 1050, N'6c3aebeb-ca07-47aa-b506-6826727673b5', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (137, 1050, N'6c3aebeb-ca07-47aa-b506-6826727673b5', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (138, 1050, N'6c3aebeb-ca07-47aa-b506-6826727673b5', 37, NULL, NULL, NULL, N'test''s')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (139, 1050, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (140, 1050, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (141, 1050, N'3b60d568-9b07-4708-8933-03ca8e7d41c3', 37, NULL, NULL, NULL, N'')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (142, 1050, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (143, 1050, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (144, 1050, N'e2d50996-f749-4664-a6cd-9d6c96176a6d', 37, NULL, NULL, NULL, N'dog,cat')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (148, 1050, N'9bfe9539-644a-4391-89a2-0622777b6983', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (149, 1050, N'9bfe9539-644a-4391-89a2-0622777b6983', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (150, 1050, N'9bfe9539-644a-4391-89a2-0622777b6983', 37, NULL, NULL, NULL, N'dog,cat')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (154, 1050, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', 35, NULL, NULL, N'Test Page', NULL)
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (155, 1050, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', 36, NULL, NULL, NULL, N'[
  {
    "caption": "ddd",
    "link": "http://ddd.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ddd"
  },
  {
    "caption": "ccc",
    "link": "http://ccc.com",
    "newWindow": false,
    "edit": false,
    "isInternal": false,
    "type": "external",
    "title": "ccc"
  }
]')
INSERT [dbo].[cmsPropertyData] ([id], [contentNodeId], [versionId], [propertytypeid], [dataInt], [dataDate], [dataNvarchar], [dataNtext]) VALUES (156, 1050, N'b561ca49-0aa1-4f73-ae5b-afb221c9c290', 37, NULL, NULL, NULL, N'dog,cat')
SET IDENTITY_INSERT [dbo].[cmsPropertyData] OFF
/****** Object:  Default [DF_umbracoServer_registeredDate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
/****** Object:  Default [DF_umbracoServer_lastNotifiedDate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_lastNotifiedDate]  DEFAULT (getdate()) FOR [lastNotifiedDate]
GO
/****** Object:  Default [DF_umbracoNode_trashed]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
/****** Object:  Default [DF_umbracoNode_createDate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
/****** Object:  Default [DF_umbracoLog_Datestamp]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
/****** Object:  Default [DF_cmsMacro_macroUseInEditor]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
/****** Object:  Default [DF_cmsMacro_macroRefreshRate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
/****** Object:  Default [DF_cmsMacro_macroCacheByPage]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
/****** Object:  Default [DF_cmsMacro_macroCachePersonalized]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
/****** Object:  Default [DF_cmsMacro_macroDontRender]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
/****** Object:  Default [DF_cmsMacroProperty_macroPropertySortOrder]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
/****** Object:  Default [DF_cmsContentType_thumbnail]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
/****** Object:  Default [DF_cmsContentType_isContainer]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
/****** Object:  Default [DF_cmsContentType_allowAtRoot]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
/****** Object:  Default [DF_umbracoRelation_datetime]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
/****** Object:  Default [DF_umbracoUser_userDisabled]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
/****** Object:  Default [DF_umbracoUser_userNoConsole]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
/****** Object:  Default [DF_cmsTask_closed]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_closed]  DEFAULT ('0') FOR [closed]
GO
/****** Object:  Default [DF_cmsTask_DateTime]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask] ADD  CONSTRAINT [DF_cmsTask_DateTime]  DEFAULT (getdate()) FOR [DateTime]
GO
/****** Object:  Default [DF_cmsDocumentType_IsDefault]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
/****** Object:  Default [DF_cmsDocument_updateDate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
/****** Object:  Default [DF_cmsDocument_newest]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocument] ADD  CONSTRAINT [DF_cmsDocument_newest]  DEFAULT ('0') FOR [newest]
GO
/****** Object:  Default [DF_cmsContentVersion_VersionDate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentVersion] ADD  CONSTRAINT [DF_cmsContentVersion_VersionDate]  DEFAULT (getdate()) FOR [VersionDate]
GO
/****** Object:  Default [df_cmsContentTypeAllowedContentType_sortOrder]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
/****** Object:  Default [DF_cmsMember_Email]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
/****** Object:  Default [DF_cmsMember_LoginName]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
/****** Object:  Default [DF_cmsMember_Password]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
/****** Object:  Default [DF_cmsMemberType_memberCanEdit]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
/****** Object:  Default [DF_cmsMemberType_viewOnProfile]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
/****** Object:  Default [DF_cmsPropertyType_sortOrder]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
/****** Object:  Default [DF_cmsPropertyType_mandatory]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
/****** Object:  ForeignKey [FK_cmsTags_cmsTags]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_cmsTags] FOREIGN KEY([ParentId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_cmsTags]
GO
/****** Object:  ForeignKey [FK_umbracoNode_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsMacroProperty_cmsMacro_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
/****** Object:  ForeignKey [FK_cmsStylesheet_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsStylesheet]  WITH CHECK ADD  CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsStylesheet] CHECK CONSTRAINT [FK_cmsStylesheet_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_child]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
/****** Object:  ForeignKey [FK_cmsContentType2ContentType_umbracoNode_parent]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
/****** Object:  ForeignKey [FK_cmsContentType_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContent_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContent]  WITH CHECK ADD  CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContent] CHECK CONSTRAINT [FK_cmsContent_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDataType_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDataType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDataType] CHECK CONSTRAINT [FK_cmsDataType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsLanguageText_cmsDictionary_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
/****** Object:  ForeignKey [FK_umbracoDomains_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoDomains]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomains] CHECK CONSTRAINT [FK_umbracoDomains_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTemplate_cmsTemplate]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_cmsTemplate] FOREIGN KEY([master])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_cmsTemplate]
GO
/****** Object:  ForeignKey [FK_cmsTemplate_umbracoNode]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoNode1]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
/****** Object:  ForeignKey [FK_umbracoRelation_umbracoRelationType_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoRelation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser_umbracoUserType_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY([userType])
REFERENCES [dbo].[umbracoUserType] ([id])
GO
ALTER TABLE [dbo].[umbracoUser] CHECK CONSTRAINT [FK_umbracoUser_umbracoUserType_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodePermission_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodePermission_umbracoUser_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodePermission] CHECK CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2NodeNotify_umbracoUser_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_umbracoUser2app_umbracoUser_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[umbracoUser2app]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY([user])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2app] CHECK CONSTRAINT [FK_umbracoUser2app_umbracoUser_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_cmsTaskType_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY([taskTypeId])
REFERENCES [dbo].[cmsTaskType] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_cmsTaskType_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY([parentUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser]
GO
/****** Object:  ForeignKey [FK_cmsTask_umbracoUser1]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTask]  WITH CHECK ADD  CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[cmsTask] CHECK CONSTRAINT [FK_cmsTask_umbracoUser1]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsContentType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_cmsTemplate_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocumentType_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsContent_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_cmsTemplate_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_cmsTemplate_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsDocument_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDocument]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocument] CHECK CONSTRAINT [FK_cmsDocument_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsContentXml_cmsContent_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentXml] CHECK CONSTRAINT [FK_cmsContentXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContentVersion_cmsContent_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentVersion] CHECK CONSTRAINT [FK_cmsContentVersion_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
/****** Object:  ForeignKey [FK_cmsContentTypeAllowedContentType_cmsContentType1]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
/****** Object:  ForeignKey [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id] FOREIGN KEY([parentGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id]
GO
/****** Object:  ForeignKey [FK_cmsMember_cmsContent_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsDataTypePreValues_cmsDataType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsDataTypePreValues]  WITH CHECK ADD  CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId] FOREIGN KEY([datatypeNodeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDataTypePreValues] CHECK CONSTRAINT [FK_cmsDataTypePreValues_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_cmsContentType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMemberType_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContent_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContent_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPreviewXml_cmsContentVersion_VersionId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPreviewXml]  WITH CHECK ADD  CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId] FOREIGN KEY([versionId])
REFERENCES [dbo].[cmsContentVersion] ([VersionId])
GO
ALTER TABLE [dbo].[cmsPreviewXml] CHECK CONSTRAINT [FK_cmsPreviewXml_cmsContentVersion_VersionId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_cmsMember_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsMember2MemberGroup_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsContentType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsDataType_nodeId]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[cmsDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsDataType_nodeId]
GO
/****** Object:  ForeignKey [FK_cmsPropertyType_cmsPropertyTypeGroup_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsContent]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[cmsContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsPropertyType]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
/****** Object:  ForeignKey [FK_cmsTagRelationship_cmsTags_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_cmsPropertyType_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY([propertytypeid])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id]
GO
/****** Object:  ForeignKey [FK_cmsPropertyData_umbracoNode_id]    Script Date: 01/21/2014 22:24:28 ******/
ALTER TABLE [dbo].[cmsPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY([contentNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyData] CHECK CONSTRAINT [FK_cmsPropertyData_umbracoNode_id]
GO
