Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793971610;
	b=rOxXCYwyeOGo2N5EkbP/8hVkYl0m3gw8VixJ6i91AJrwGGNC8tHs8bu5l4eAKJMSQfGG
	 vFczEFLBfXydnN3gDi2EFgI/ZCsotayiGytxPhcKfIZoWaLxyNhnuyQQAowHTmJdKdQe3
	 6OcZu5ZZGVbaaAu2+kZEbZ+OFnvcbhVMbnCI9L6Ng48684nwr/Py8hv2iX8V1sdeMv0Uh
	 VOj6zfBDmmJTVzdETTDBoK5s9sJF80dZOJRs1o8vCm16sp8bIlGfHDA0gHvAjzhWxWtEi
	 wn78J9uYxs6VnSLV6IgKFGJy3w164kQDjl0p6DXA/3BskURuvoP9m267ukKKrCmJazQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971610;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=R/1xXH9/Rxx4kUnNVxhzqm8q7hTRf++5F5+6IpcmYM0=;
	b=TBBGUgz8fJbp3V0v3y9JAjGChu5usaJ7bP5AEzJIPboTQnqtNBXAR3ha2VbJDCZI0jjr
	 DTSGWWMpVfCvVskeHlLjTLFoYzubtpKqf+/iCyQMiYkJE5hZYEePn+iIPT4N7K4xoaPVj
	 KNidUOo10e7kopjiDi8lE5Hu7JKnqVAKJrTPKmpZJ0dq3+WJog9nlnZSyvKGtoRkU+MP0
	 MEk0IuoeLYEkr3D0/3P49ZiUsBTjr8H1xYWSSHGz8AkkKZzb3cXRgmQjEoQLEbFqhl7i/
	 IsISdY39tn90U55RJXg3aWRlcN5viRqnu7mE9AldVAlWY1TkQa0mctD1sBI1KtHx3cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ev2DHpn5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.53
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010053.outbound.protection.outlook.com [52.101.193.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F434606A32D
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 13:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F434606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ev2DHpn5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXft319wNrvJ8bZBwa6Ub48tkMdMmGjOCjFHws8ZeF4Kbh0K69Lu9q5wTyB1fUvKi1czCOZccs80Eo9umLbEVAKHPvlcA7naGubvwIok/viBH+9F3WPDRT2l0l8td+DwWF2HrbmcYvSdwufMuV9JO7noghL2wKnVZ2gruVE7QTjnrbYyGw7S4vuPDoIISIpU2NpQhbQS8GJ2qV/7vAu3HBk90bDNEAsCurjhNpe0ylBwcxuoXYxXmtpePQA/hM/4XNQ8QIWFq7aorb4ne9D9FqdNIn/HuO6KBb009/qPqvqMJROBXMSoXFuyH3SAMgy20DGEdDh6Ng1/jbzrsKN/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/1xXH9/Rxx4kUnNVxhzqm8q7hTRf++5F5+6IpcmYM0=;
 b=bCmNTenE+e6Nh9xSDiEuSaR0+qrzxobqyPKbMzoAPkNU97vaBv6HSxXMNQRDREUhJyCKV1Wbjlupq3jhDriG3So+e6sZ3VGvBju0qqpDt5YztqGxM4H/eimH1BZg9Vx5yH3qN5qkRYLLF2mFOh/2FBLB5L0QAIuk6tv5C7yK574ZCEcuEH/leIgfUvUvvd0mOV2xmYe5++Yn8MzJ7v0+v0/JGgIJTMjQ7rGWlNUOyykWQbJIEkw9ZehLnUFm17xf11gMTofQJY0B9lK8qDOEGrY3LPY20jCoUw9mXIchnT4ZBZAg85MopB5mO/A39LfMFtjGiUJatqRyyDBe5c8DdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/1xXH9/Rxx4kUnNVxhzqm8q7hTRf++5F5+6IpcmYM0=;
 b=Ev2DHpn5Gw0weRQLOKHv9DrFMgNpELpb7dTkLAbIWpEK3qTDGS43Nr9aHicbbUMsSdh8n0ZhDYb87/YI2GZr8bZbJTqzF5Gby49Pe5TZ6Lr7dramN1pjAzc4Q8uGfTAapXaE7VOOMYaQtfu564k0QLGOyVIkPgZ1Oh3xYSQ+d0bUlHQUi92ZawtNc+hcBbeaB/sTqBgr5yAGkd8S106pGvWfjafC5q3BO/JgnmciXyXoP9XH/IR7rzKstNLWoG5f4Wc7mA/DZDnv4GvHDEqzD2iQhNllRj8JLmqL2S91pYHxjQRIIdR3lXCILSK1EFB/hgFWtLlecVVdBuXGBplqXg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Fri, 6 Nov 2026 13:26:42 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 13:26:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 22:26:38 +0900
Message-Id: <DMO5UV7AN2DT.2POBRMO308S2@nvidia.com>
Subject: Re: [PATCH 5/7] gpu: nova-core: falcon: allow DMEM DMA transfers to
 request tagging
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
 <DMNBQYC8KTD1.31I6CHXMYL2NS@nvidia.com>
In-Reply-To: <DMNBQYC8KTD1.31I6CHXMYL2NS@nvidia.com>
X-ClientProxiedBy: TYCP286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 4167fb11-68d1-4174-3c6a-08df3c099834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|6133799003|22082099003|56012099006|18002099003|3023799007|261026140227099003|261021123027099003|261028144727099003|261021121427099003|261022105027099003|261022115727099003|261021135927099003|261009223027099003|261022075727099003|11063799006|4143699003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	JTU+Hh5mALZwM7dJUczSTS551z1sRnLR+2msZpjK9EP8dXjlEALWvDSlfaBO0w3ubbnZ40Tc1kl+R3Dlbz4qKqUT9aXmkEIK9Jw0wdi/pjTag/E5QzlmeuTLyH0nmNdC/bCevJWKnaXulzC99ac6HVzuBzlPkIQ+0m7ZV+H/3h7XnccXZSa1+kKdHbNqzBvsT2nifJeybCnUAl3S9vHkSvS0+w3DeQAtvaVxCWpiN5oy9iHOBmFazmvyvrjPGlw9mvJdFtno7/2SwX98036HfJp7VFNSgJMGQJ02CVHCG/OdpzW7NLJ2kysqwFWHqRpZ1yQFVup7qZp93L7szv4kGqxZK01cuiedUkWOsg7zEbHCSD60GHfTINN6NyJw7CGsHP31RIjxzuO4+EoqRih7589BJdoDBezbcYXYr25QHhRkZYcfc1fIMMYnYnCL342RTYFVLG+y8xvurGGOjTYowujDS+8I5Vfj0DCSZIwXYeHjTEnaVCkNOOxJOVx4pQ0cSKtQ+/Za2IjDxz0E6YQ5nnFCaUdClV+5kvh1kmiM/IEmtFFzVNvti4PR8seOHJX3Yy6ljVThrCNOSUsEXdeOmDFpc5Sm2ryzpACkjLokGnW2QK7y4Z++w9YnJSoD51a2m3zKugZadUEvAXeVeJXdjx717Tr3NQtuVcmCjOAkq/c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(6133799003)(22082099003)(56012099006)(18002099003)(3023799007)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003)(261022105027099003)(261022115727099003)(261021135927099003)(261009223027099003)(261022075727099003)(11063799006)(4143699003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVlFb29BQThzUGV2bXNQVC8zRVFKc3BQRjVxRkNJbGxYdkZ2aGRrckd5MTNu?=
 =?utf-8?B?enJRQWNlQXdLUnVzdDN3NU9MZFpla2JEZmFLekN2YUlZbFk3eWEweGdmRm1q?=
 =?utf-8?B?MHRacW1PTzd4c3kwN2hOT0hGYnFINk9QYU96UGpBdzh0MGh1a04wU0NHMmJo?=
 =?utf-8?B?eUgwRTB2WE9TZGVacjB2NVFYR3YvWXhYMW91TTVGTkcxNFJBUFQ4eGc3MlEy?=
 =?utf-8?B?bnVMQzhCbVlkOCtKS0lTMlhMMHRITGJRajd5MGpQaEhVaFNqZ3pDZHNoWWRq?=
 =?utf-8?B?TkhycGF3UWtrdVpUdEY0V2tmd2VCc0o1d0JKczE4VjQ0R1dpbWFRdmdBeGtN?=
 =?utf-8?B?VkZ1RWlITlMveGRIQWI1ZlhLV1pyUWNLRVpIdWpwdy91VW41VU90OTNLVEwr?=
 =?utf-8?B?MXo3WnZsS3hCTkdOOENuWmgzZ3NZRURBSFBWL2ZSblVjWW51d2hUUmVqUWJr?=
 =?utf-8?B?QnFMNFYxK2N2b3YwbFI5cmdpME5DZFhac3gzOGRoMVZmOSthaERQdm9QSEZE?=
 =?utf-8?B?QWVqd2QvVFhleG1xblJIUjM3VmxmeUJpUERTZW1YZjQ0aWNYZkduT3cwanpB?=
 =?utf-8?B?bERHZkZVNzNKQjNCTEN4ZFUvbTN5UFZkN1IwMmlNUGk5eldrZ0twVjZoNDVQ?=
 =?utf-8?B?YmNzckNvSmVqd3d2WnE3UVJCYUE2NFhaQUE0elBadmFiZXFKSlR2L3hwN1Rn?=
 =?utf-8?B?RzNaNDYzUkQ4N3Q5aXdmNEdYOTVBaXNDZFM2bXRXK1dhVzhPbkZtV0F3ZGZl?=
 =?utf-8?B?a2VCamZ5VTN5VWdDVmEvUzdQSnpkRW1WNEp4WXpyRjhYVkttYmJzVGEyUmw5?=
 =?utf-8?B?UGdYcDE0ZXJzeE5ZcmwrS2RtTXI3eGRHRm42dFJlcE5ZbGh5ZE8rZEhSL3cv?=
 =?utf-8?B?UHgyRVVNYWN0UWJ2RUVYOVZHWVc0cG8xc3FDSDFEMURwSlJMZkpNMGRNNnVO?=
 =?utf-8?B?N3JiaDNWRXlZYmE5dWUza0drOHhlNVl6V3lPL3pJSENkMUQwdkVkTEQ1bzBR?=
 =?utf-8?B?TEE4eE5yMHJMLzg0ak1Fc24vTUtIbit1MXNzUDQrRjVjS05haEVvUmd5VUpi?=
 =?utf-8?B?WmxTV0oxQ3NUY2s2WnQwMVZ5YkVsUEpzYnFwcGo3QkVneFY2eUNad2E4V2pG?=
 =?utf-8?B?VTlGMUlCcFRxSm4xNmpYMFJOQkpMVVIwc0hrMjI5OGZHT3FiN09pVkc1VEtS?=
 =?utf-8?B?ZmwySDBhZ0pHZ05vUnZZRlptV0R1SG9uaEtjOGJWMXhZOEpTcXA3K00vVW9L?=
 =?utf-8?B?QUhTVVJucCtYTGJzWnVHbk55R2dYQU9PYzRZK2hEWkRqTXVXdDU5UitqbDE3?=
 =?utf-8?B?QXNaZVRrTE81U0pDaHVNVEtXcW54bVVnUXhBeGgzeE0rS3dkQ1NlYlFoNkt4?=
 =?utf-8?B?VnpSMjQwdzFOVUNGbUFxWnRGWTFSbWlXaTJOOVhJUE5PR3F2TGkxOVpaQUZ6?=
 =?utf-8?B?UXdCa0NVZCt6empOSnlMbHdnenJrOGswTmwzd1VMOGlDK0lwZlMxbHBXRWp5?=
 =?utf-8?B?b3lTSDNzek5GVGgzQjA4bDVNSCtyMlRFdVNoVlh1MGtzeTRnSVhXSE9wT1l0?=
 =?utf-8?B?M0ZNNUNkQVdPdlhHVG8ycGFIbHRtRysyR20ybWRQKzRhTmVaRGNSMWZIQ2hN?=
 =?utf-8?B?eGFrbmdLYUNLTlhpUVpMS1dnaWN3RG5QcUZvTS9reUR0dnF2T1dKV3dnZHRI?=
 =?utf-8?B?UzRkTUhQNFdlK1cvYXdZTFhrc1AyeXlGa0JKZXdpMTBYaWJTaTlrM3owSmJp?=
 =?utf-8?B?ZkdaUUFVT3RUNllpSEZ4RHFXc05JRlVleTZ1LzRPbE5HbWprcnIzSmJ1YUE2?=
 =?utf-8?B?K0R3azVlVnh1a2FxMzhpUEtJNC96eGRYdkVFSXpmVHQwYS9QUVluU09NK2JT?=
 =?utf-8?B?SjcrOXU5MFU0Vlo1akFBamxSYnRkQVdURWRsdFg2aGxTcXg5ZkZudmk2YlRx?=
 =?utf-8?B?MU5oalhraGI3NUtueUpWTDcxQjI2ZU5waEhZbjh1N1B4c3R5dXlnR2QwMzUz?=
 =?utf-8?B?TndEMDk2YWczTmlWRFNCNjJFUnJjUks3ZU1ZYVlPb244YjJqUVRDbDhQRmZo?=
 =?utf-8?B?MVprZXE4ajU0LzIxeExNR0w4MURyWlROeE5WZllKMENaS2I1Z0JWUXUwa2RU?=
 =?utf-8?B?cm9aQ2FaOFZubUF6V0paSzlaMHU5SlM1L3FBbXVGRHp2WmtLWjRiclVxclFx?=
 =?utf-8?B?S3BBWWltR2J1ZUJpUzhwNzFaUnJ2YjFxdTR1cXRveWRNc3EyVzF6WEQ3MnR4?=
 =?utf-8?B?TFk4dElxTHpQSHFRS015dTFDMCs1NnpybzFGclA2RXFDblNvblVvOERiVDVz?=
 =?utf-8?B?L0hma3lwdmg0dTFWODByMXl6MGhXRk5uOEQySHp0RW5uNll6RkFNdzY2dHQr?=
 =?utf-8?Q?Xrn4ImhPMw7YzzyN52YVt1oijUEHEuVHIIBt/xEGIvqa0?=
X-MS-Exchange-AntiSpam-MessageData-1: h0U7jBfzHdx0yA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4167fb11-68d1-4174-3c6a-08df3c099834
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:26:41.7770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEnyXuUJQh26gOMnzyIPH2tyQybxQL2Z6nCZk5KSIDtxC1dXkOt76lmrxEZIYbYijtgyYIhg8VdbrxJMckrFNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661

On Thu Nov 5, 2026 at 10:50 PM JST, Eliot Courtney wrote:
> On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
>> Add a tag flag to FalconMem::Dmem and set DMATRFCMD's DMTAG bit from it.
>>
>> This is needed for the r000 load-and-execute event which specifies
>> whether DMEM should be tagged or not.
>>
>> No functional change intended.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> It would be nice if this explained what the tagging was.
>
>> ---
>>  drivers/gpu/nova-core/falcon.rs | 20 +++++++++++++-------
>>  drivers/gpu/nova-core/regs.rs   |  2 +-
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index 1bceb38c33c6..f48f2eabab0f 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -131,8 +131,9 @@ pub(crate) enum FalconMem {
>>      /// Non-Secure Instruction Memory.
>>      #[expect(unused)]
>>      ImemNonSecure,
>> -    /// Data Memory.
>> -    Dmem,
>> +    /// Data Memory. If `tag` is set, a transfer into DMEM also tags ea=
ch block with its source
>> +    /// offset, which is then the DMEM virtual address of the image.
>> +    Dmem { tag: bool },
>>  }
>> =20
>>  bounded_enum! {
>> @@ -529,9 +530,9 @@ fn dma_wr(
>>          // code addresses in the firmware (and the boot vector) are vir=
tual.
>>          //
>>          // For DMEM, the start offset is folded into the DMA address.
>> -        let (src_start, dma_start) =3D match target_mem {
>> -            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load=
_offsets.src_start, 0),
>> -            FalconMem::Dmem =3D> (0, usize::from_safe_cast(load_offsets=
.src_start)),
>> +        let (src_start, dma_start, tag_dmem) =3D match target_mem {
>> +            FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load=
_offsets.src_start, 0, false),
>> +            FalconMem::Dmem { tag } =3D> (0, usize::from_safe_cast(load=
_offsets.src_start), tag),
>
> I am not sure, but is it correct to have `src_start` as zero for
> tag=3D=3Dtrue here? Surely something should change based on the value of =
tag
> w.r.t. the addressing.

Yes, there is indeed a problem, tagged DMEM should behave like IMEM
(which is always tagged) here. I'll fix it.

The poor variable names are in great part responsible for the confusion,
so I'll also introduce a patch renaming them.

>
>>          };
>> =20
>>          let dma_address =3D {
>> @@ -568,7 +569,8 @@ fn dma_wr(
>> =20
>>          let cmd =3D regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
>>              .with_size(DmaTrfCmdSize::Size256B)
>> -            .with_falcon_mem(target_mem);
>> +            .with_falcon_mem(target_mem)
>> +            .with_set_dmtag(tag_dmem);
>
> Instead of taking tag_dmem out of FalconMem and using
> .with_set_dmtag(tag_dmem), let `with_falcon_mem` set it? It looks like
> it's always just passed through.

Good idea!
