Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.6
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793948782;
	b=o9NVdYe58cx0uvZ96lSHzjYIPipIYqkRWkiyQUOwxfjJTJT4KlswEVdwTSc4jrQPFjqL
	 CYrLFgfWmRyFMtutUdSKUSwlNeBok9CZG4dxmW2sDTtjD9dCJwkoUOLD2IYKijfbSOsRR
	 uGeeHO1Wxp/5lIAMB22GF/muhfJHVqx2PdceOY1RKDb0rvyPlHwx8EEObQEIXcVAmt+Ax
	 9ehpC4PpFDaUn8OA2yXY4WsI0e1zel3fR8HdIOfWlhgoOc0GHRbiYmj5jDhZ0uJFBgBIk
	 4el3KStuvOHARTMMtlfdvfzNeE/jpMZ9Exag3jL9X8NjpBaT/y/ywYQdqbXZOItearQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948782;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=XIPrkf27orXoR8LuOOqmxQvI1umQxyAZnSyJ4q2cxa0=;
	b=RIuDma2I7gb/3m/j4lalGccpdFzxPyfqvRTxALJZWsEYSp2JG50lQOFebGIOvqO1KqGf
	 pGdjRAyG4UWT+3jbFCo8Le9UwJWUhuQWqphO+IDdN4GppeylVrxIKV/tVXQCBOQflvzhU
	 C0Y0KAaUpkqOFgj9pTKGD20Q7GsT3flWRUHeOrTVld+qbKARONxsqzQf7AAxWlpaP1Y1G
	 6/EOgBT8cTej/hVgiMYQfOjG8P+NiUgNiXG4GSHmPdymUP/6EAlqH3FjeQ+OKiavOWPzi
	 McmK27cHA7gCsUP+DcIRpuPRAlEHPcsvlpTW5kEP/k6ejcPoTFMZG5qHZ5VJ9jAjySg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OY8vFdP6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.6
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2C6606A334
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 07:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B2C6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OY8vFdP6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F49ETZ2lSYTZvRA9cxUfs7UWvnF7UEtmVO1LZ85QaWbSsjoQ47viocnxrxAq0AwQ/1Pl1uMh1i9SPyTwiICCtD6wDUperQvaXZm+xa8bibZI7aOR0o/4Sa9KU+M9qcoYv9bTw3XFswWzOAueXWcXdxZyopsVwn4bePzLkB0YBqDTzBhqrOgz8KSRJoDGFwFefZiYaFdBM4iJHSrlGlUhPhC808R3dGR7VYq4MigF+kqRfGAAUDcppcqAOHeTn4zWmO9qAygQUABsm0OKCEJIv3+AUFMSqBVZrmTkfZIxRf8qYPH7QgxD0V+B/dJWLj9I0TtkuO+FAhkUbFHWVKt/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIPrkf27orXoR8LuOOqmxQvI1umQxyAZnSyJ4q2cxa0=;
 b=HXWKf2C6TqxpduCOuSRdmBzpBwts8lGz2VdB0CsWEw6C4NCYdzjA1IGiUruejxvc+33S4o8b2OPtwR96sZuI4CBQqenvPAqzGLa+iy7ByjwO+ZoknIA+zbIGcBbtdPzIKFU7tKF4MckwpszQ0DkdrweCj1e/1rgx0u6tsF+vJVS4wZHUMrGvIJnf4gdzvDoG5dzwfdh6YsXWV7zjefGZpiqjT7wdrXYPADypAM6ncxqsLNaaMzHvp0mWRHJHmP3TJaqHPYAiqHWFzMlN5cbCux2xnqNMYrvthMwT4sV/GqbQRzWlPGFGgPWhIF7ehb5tLvWrRWPz+EeRlWS6rsIJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIPrkf27orXoR8LuOOqmxQvI1umQxyAZnSyJ4q2cxa0=;
 b=OY8vFdP6DH0U8M46mc538TsIyHQNjt3kxqu1Q02zVeaP6hxMtw6n+I59+iO9sdK7YPGBXsPeAtkMQbmoJ+NO1O2UELS7oMr0mxE+R7wfoCLokvpFVkisP0A6TF+q+2JcLBVkK97SxmK29LaBVGQaGsx0RcCbGFbbCSSUOOlGTKjRJpzh3Fp6GjrJI1S5k5Zr4DSOENXnnPtv61uYRp3FDw3dh53oraZXTZM5G9b0O9paM8ZQa9FYryngfpPPcfzrC5W8LHMifc5fV1Xf7cMntoQDWaNUkuZmNhYA1WH3pQPI/7ifUyBKc7LJJ1rhE2R/iEYHVdnB8x7Uzk0I8W2rog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 07:06:18 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 07:06:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Nov 2026 16:06:09 +0900
Subject: [PATCH v2 1/6] gpu: nova-core: gsp: fw: add the r000 bindings for
 the GMC API header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-r000_rebase_on_cmdq-rpc-v2-1-e481ea2168ef@nvidia.com>
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:405:372::14) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: d92cf042-9a39-4311-0051-08df3bd47432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|260925021911599003|260925021311599003|260925022911599003|261026121527099003|261022075727099003|261102130727099003|11063799006|56012099006|261021121427099003|261022115727099003|261009223027099003|261102123227099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|6133799003|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	3fnn9pPrs23BLe+etn4zmL4N8mtICLiSJ8jYiWYajoT7z+ozVrThN/No0A9YenKNKxHeYqtrHlkuKCRD7pS/Eqs2ZB7lL+420pcjl7tAP5VvLxnzqvYiLf9qi1ByBRtlti3UgLY1CKEJg6xlX/y0CBNW5T7W+qW9T8XoNrIFiPk31MIAF8TjDGFqnRgAZTmXFXCMoHpgEqa0SDcx3H4wh9km+e7o73SK8dsyczTn/YIePlI+tZRoW3t3JEXXx9UTgVDw2G+M0tee8/RkOyHEITHOfvA7Qt+lmTIVD3H1rd2EkDxPSJ3MY5ZdcV/LwBWYuu96o4PRFfUvr+5ix2JVFuC3Y4Rhfhi2Ns80RgKKtaVLDi1Hi6CopM70SD+CfoUJdjqGYlU7wFPLTbUYhgml4EFOwUNvuEBpJ1CohWKoMFPgfO4uEFS87XfxxcYaEkf40G0+uObaDx+61datPE2iDSPfojtfJhBSXbz5gYmMys1xPwGmyZ12Ie5iTUW1QSp0zik8Ase6GEB7kdN2m+qXvuKXut+lKOwTc1MwLZTsn9yidSx3yKZg4k3g0gkliXEV9YuKPYD/GFIxeuWNb1y7PmbH3hO6PyWftntugvK7FV6F73wGUJ6Gb/+18dn+Qmt1GHYhAklOuu9YUyIS3s8rLJ51LshuoRyQlga2zqNyXy8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(260925021911599003)(260925021311599003)(260925022911599003)(261026121527099003)(261022075727099003)(261102130727099003)(11063799006)(56012099006)(261021121427099003)(261022115727099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(6133799003)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUNVYXA5V2dSRmxwdW1KWUdWWGtlYnlTRmFoYkxvaFRFRUlGSFdmdmlhZSth?=
 =?utf-8?B?dU5HblQzeVlLUUp0OWQxWjJ4RjQyUFVjZE1zWVhZc1JNZmxSeFB1VnRIQ3d6?=
 =?utf-8?B?ejZwVWFuMGxIZDdISjd0dTdvWTErd0hxOGFVWldrU1FHRXdQTFBzZ251QWdi?=
 =?utf-8?B?cUJwclZjS0x0aDFSQ1dZZWJZb0Zyd2lJcHVtaG4rN2pobHVBVE00ZXJJQlJG?=
 =?utf-8?B?R1JrS2RnQVhrYWtsT04zbUIxekloSmw0SFNLUHJEbEcvY0t1R3BUaDl5blhE?=
 =?utf-8?B?bERkT0tFU0ZObGJ4VEFFK1ZXZkFZZER1SitkS0p4YWl1eVdia0hnaXFaVzh1?=
 =?utf-8?B?djlURXFGUEFoMkJmWXJPRmxRTEJLSlJLb0QzN2U0Y2FqUTNHSmoxekZ6VHVy?=
 =?utf-8?B?L2ZoWVljeTZHTkpxcVBHT1hXNjhXdlF0bzl1RjFyRVErcjJ1RTBPdWt2OTdp?=
 =?utf-8?B?eXpXK2hwakhnWDVLZ2Y2a2VPRExHenJOWVpWeGMvZDd3QkFTMm1wMDM3VWNi?=
 =?utf-8?B?aVZJdlFRUkg1UjFyQ2lqMWtuY2EwV3pVcG1KTmdUK1A3MDVQUXZvbjZLOENJ?=
 =?utf-8?B?L3FkQVlQdFowWno5bEJtM25DM1B0ZDNHNi9UQkdwT0Y5cGtybHJSQ2g5TEpU?=
 =?utf-8?B?R3lQaDNGNEFKQjhJNVE5ckNyQ1NHZDVpbitZRU4rRE1tZGJYWm5HbGJnMzhF?=
 =?utf-8?B?anhoOHViTktJOGgrclYzZWd1dVBsV3Q2QWFFWTNUSnBEOHQvUjVCTnAxVmxB?=
 =?utf-8?B?T09ZeGl3VUEwZkExalltekNSMFlGQ1Blc3J1V05TU0hZN1FPeVlKb0xKTVp0?=
 =?utf-8?B?MWJhQm9zcHBVcmlPUnZCUlFzei9lelN2ZnYzVmJHRUdrSFY2eGpFUFA5N2lj?=
 =?utf-8?B?Zm90ZXNGM3JUZ09oSEo4RmMwZWpIZEJ2K2dreThlczFEMzZxMklFNS8xVU5t?=
 =?utf-8?B?K0w0eWowSFZiM1piOFZyTHNzRU5UZlZqNFUrbFFaL3ZYRUxHR2JqWmdsQXBB?=
 =?utf-8?B?ZEIwY2ZVbFhJeGFOVUZ2ZW94QUQ5aEFQalVCcW9xTTlLaUFSQUswMktVYVRY?=
 =?utf-8?B?cTNZWWgrM0dNdHhUUlFkdlY3dzRmczZCNUlQRXA0cGdnQ09FUUJvb0pRWE82?=
 =?utf-8?B?UUFqY04zNUROZXZTTS9lcWNTODJjaWRHaWl6QzNSUm5PdGtRL2ZOVlFsUXlt?=
 =?utf-8?B?anp2c0VXR1o0S1hNRkkrcE5ESnlDc2JrMXFNZmxEU3dLY1pGZ3A2SlJKZDZr?=
 =?utf-8?B?VVpZMEZlYmhwbEFJVkxhRGtzb1VuUnVLelNZZGhoN052OHUvS1l2cXZwaTQ1?=
 =?utf-8?B?S2JqSUdFRlVGdTJsVDRya09FK3diaEJORnZUY2tsd2xqQmJvNVQ2VjlYRmhF?=
 =?utf-8?B?RzFVYVBHMkdBWStleU9qVk9jeEx3ZHBJN1ZiNEdZYzd0Yi84RHZQWWVTR0pk?=
 =?utf-8?B?L1p6cUZXN1FjUWxManh4WGdaNHpmclpKVkRCRThNbWtlRGZscS8rREdDbjVw?=
 =?utf-8?B?SEpxaGVaa09UNGpZQTFzN1JvNjZZWW5HKzNvVXZGRUhSSFRjb1U2QW16RFJN?=
 =?utf-8?B?bTdXNWdQbUI0b3BFUEwrbXpGSmVBMWYvYlZ6OFVlYWFHYTRVOEQyNHdBVWtW?=
 =?utf-8?B?aHBaaCsxcFk3b3VoSkZRblBmTm9HZHdQVHZHRTEzSUFKbFlnUEMweHpTVWl3?=
 =?utf-8?B?L095ck9VcUVYSVdPdGRvOGRmT0psY1NHaG4xb3RaYXV3SjR2cnJseGV0Rm1U?=
 =?utf-8?B?UzFLV29yN2pGV3piK2VrTjk1L2xWc2gyQ2R4eHdLdjRCcmMxaUUwNUV4OHdW?=
 =?utf-8?B?U1lEODhBRW1ZYU11Z1ZVTm96djVMdzhFN0hab2VXVHk2MTlZcUx5WHluQXd3?=
 =?utf-8?B?a0RmWkRCQVAzNHFYekpQdDVsWDNlSktINkRxdlM5QjlmOVJ0UmNGQmJsck5q?=
 =?utf-8?B?dGZYYWpkNlN1WENCZThONGJhR2pHa3dtRTZ1c215aDZ4YzF3VjM2SGdvQmM5?=
 =?utf-8?B?WE1oaFhJNjdlT2tKL3JHZ2kyUE04UTNHWkJDZEZEQms4cFRMT0l5M2V1N0lq?=
 =?utf-8?B?ZCtocVNURE15bk1PNUQ4ZWUxMnVoQWZIMlcwTTZwZkQrTzlsQXVpZENVZkxV?=
 =?utf-8?B?SFJTSDZRTk4wZjYwYlE2SXkvaXc0bG1TNllrMUpKbktVN0s4TExxY0pvcWZo?=
 =?utf-8?B?K3BYUkFrMy9VN09yVTE5TzJsWTR2VjNRTERmb1ZIRktBbk92TzRzTkxHVFpw?=
 =?utf-8?B?Z0tkQUJwc3ZpQmtsa0hUWmlXSklzMWRBa0ZSNWFLZ2l1SGR0RkE5SDVkcmRD?=
 =?utf-8?B?NkFwWXNDdTN2TUJhV3U2eVA3eFVIMEw3b0t2L0Z4WTB4d0o0OXNBRGhCSG1C?=
 =?utf-8?Q?d/xJy0xWxbwZlKnLQgidpTsKzi5KnQeTL7W3htzHXY5Xx?=
X-MS-Exchange-AntiSpam-MessageData-1: DpVNjqY4D8y6pw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d92cf042-9a39-4311-0051-08df3bd47432
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 07:06:17.9580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqwDn7I2EXhajKJtbcPywmwxSP1N1vzfonSD7YwpD6qhitmrSP5E7oERZxInTuyIEKxiTMt0zqCOOX1Ai5viJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

From: John Hubbard <jhubbard@nvidia.com>

Nova-core boots the r570 GSP firmware, release 570.144. The GSP firmware
releases from r615 onward share one ABI, and their firmware files carry
no version number in their names, because each image records its version
internally. The driver calls that ABI "r000", so that its name does not
change with each release.

Add the first part of the bindings that bindgen generates from the r000
headers of OpenRM, the open-source NVIDIA kernel driver. The following
patch builds the GMC API header type on them, and the driver keeps
compiling against the r570 bindings until the patch that switches
firmware.

The headers are those of OpenRM release 615.71.09.

[acourbot: split the bindings by the code that needs them, name the
 OpenRM release.]

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                  |   1 +
 drivers/gpu/nova-core/gsp/fw/r000_00.rs          |  29 ++++++
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 110 +++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index b2ddeb27984f..213ef5bfb258 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
+mod r000_00;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00.rs b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
new file mode 100644
index 000000000000..0c32f4ec1e27
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bindings generated by `bindgen` from the r000 GSP firmware headers.
+//!
+//! Use them only through the parent module, which abstracts or re-exports the symbols that the
+//! driver needs.
+
+#![allow(
+    dead_code,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+use pin_init::MaybeZeroable;
+
+include!("r000_00/bindings.rs");
+
+// SAFETY: This type has a size of zero, so its inclusion into another type should not affect their
+// ability to implement `Zeroable`.
+unsafe impl<T> kernel::prelude::Zeroable for __IncompleteArrayField<T> {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
new file mode 100644
index 000000000000..552299c98169
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GMCAPI_HEADER {
+    pub command: u32_,
+    pub size: u32_,
+    pub sequence: u64_,
+    pub __bindgen_anon_1: GMCAPI_HEADER__bindgen_ty_1,
+    pub reserved: [u32_; 5usize],
+    pub data: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union GMCAPI_HEADER__bindgen_ty_1 {
+    pub request: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1,
+    pub response: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1 {
+    pub max_response_size: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2 {
+    pub status: u32_,
+}
+impl Default for GMCAPI_HEADER__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GMCAPI_HEADER {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_RESERVED_LAST: GMCAPI_COMMANDS = 65535;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT: GMCAPI_COMMANDS = 65537;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: GMCAPI_COMMANDS = 65538;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY: GMCAPI_COMMANDS = 65539;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND: GMCAPI_COMMANDS = 65540;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_RESUME_DONE: GMCAPI_COMMANDS = 65541;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ADD_VGPU_TYPE: GMCAPI_COMMANDS = 131073;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_SUPPORTED_VGPU_TYPES: GMCAPI_COMMANDS = 131074;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_CREATABLE_VGPU_TYPES: GMCAPI_COMMANDS = 131075;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131076;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_DEASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131077;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES: GMCAPI_COMMANDS = 131078;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: GMCAPI_COMMANDS = 131079;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131104;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131105;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE: GMCAPI_COMMANDS =
+    131106;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: GMCAPI_COMMANDS = 131107;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_PLUGIN_TRIGGERED_EVENT: GMCAPI_COMMANDS = 131108;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB: GMCAPI_COMMANDS = 131109;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS: GMCAPI_COMMANDS = 131110;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS: GMCAPI_COMMANDS = 131111;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SCHED_CONTROL: GMCAPI_COMMANDS = 196609;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED: GMCAPI_COMMANDS = 262145;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_INVALID: GMCAPI_COMMANDS = 4294967295;
+pub type GMCAPI_COMMANDS = ffi::c_uint;

-- 
2.56.0

