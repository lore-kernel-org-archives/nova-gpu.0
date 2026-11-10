Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306088;
	b=phsEgZUjrkYoTUlojtqtlgLgTVz7yjdtddmQ8tyssc+M8yzM/CVggwcoopLYO2a/S8eS
	 +SDBgQ81VH50tslncTiJQavMRMIIUBLY5HJV9/hBU+n87DKamTwreWTg43Xbg8itmI+qK
	 ymB4ahv3h6CaYxt3KjVxlPrCoDZEIwsRQ+LjcFmjAVhRjs0PowBVFwdQKc6Rt65WOovWf
	 X5F/2TQnIU8DBtFbtXQl2gLkm9FdX3/bRVuBD6y+CCygS36bspQH1ymAZyT91Q6uiJSLT
	 MxY3qae0W47TvQ3O64d+5NTmXA1eqX2PUm4E8VfGX+7Q1BDHhLhVLahP3LjxYVhNkoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306088;
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
	bh=AoX1x5rbgixSTFAYuhA6EbQVYmigHmz6PzT4TiIWaWg=;
	b=SjfcPWG9i+qTdrZTgxKBJNIECuTqpixCGeok28skT8+Ckp2QiJOEql7zc5NahbyRvzbJ
	 FAPrbk20n0RdYZsqP9gkMOIp6jZPQGq1AC+5MGunAhKeUoCGHJ5phJBJdH6uTnZ1N9Co8
	 0jIUnwow83Gj4/cMbOUiF84PAb4PD/L6tLvq6kkNHFwNPzEMXxBpc/bu325ASXjCBXq6V
	 1eoy1kD0daJk34K2VRTeaPTXLxgAsaYf8f8Patgr8iADRQVnw5rkx05bHOo52uUSv46Zt
	 2fC1XysoBUwb2PdJz47/HWOPfzggEWnzwdEe1GTr4AdXw4RYjJKZqPx1aF9UzA/tf7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgCThK3f;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.3
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AEE606A421
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AEE606A421
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgCThK3f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f52MrSGFlwvS3y2sA69BgTBVYO6Dp4gWlGZyqMp4snyVSIMGEN429cO8Y29jeIad/pHAAXZaLX2FmBZ4PyKzv3ThLW4+e38BVCOpn0gI4AWIBaIGPiEre8ZF2qNCc3gCJiYhOr8Z5SLOijFSgb4cFji1MRnSH11mIRCqJRY0/pyQpfPBT5JQJJDD/JubHOfBleh4a5tQhDPcnW4LR/gvqtcMO9t16PcECVINwK09Dy+xhaaFShS+42ykbAwubSYGvQBwlVHM/rIOHHGmBnQMgVeS3aeKeEYy437e1e0zcHJp15eGFoXigBUUvalTu2CmUaSd8YnZ4QBYHBgbBk/wIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AoX1x5rbgixSTFAYuhA6EbQVYmigHmz6PzT4TiIWaWg=;
 b=IefYx8OVVN50Pb/EiWvfa+1yBkffhz7YPTx2/nb+B8hZlzXrPpLhNi6HulRZIQBG2vddNIM305RNAaNVzbOR6vzyAeukeFrpz0SB3Hjv3Q55lud++WYf7iORk9ZRxfYa6lyZm8hXTwqgiGaTOsLkYhQVuA7/WeLDF8UcOCt+2RgFIOniIbHkaOnHhrnRHBW7sc8KX300dqqhqUr/HngsYX+n9VOplMM6+M7b50au9pGm1eHCH/dWtKy0GB1NKsZ4PXC7eqWq0XoEdgxiI86TM5iDgYWbVy3l3h6DD3JWF7TNoEtGhtXaOluzTAympp6M211iWjSfhE55gKpb1JNxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoX1x5rbgixSTFAYuhA6EbQVYmigHmz6PzT4TiIWaWg=;
 b=cgCThK3f+fgeSEL1en74Q+g5DvLZHouoGmoIZuDLb290FXS/Ib9Ypb0EWFgeoELeGbaD28sIy9b6QRvOPoAEUhd7CJhLuL1qNw3p/bkrD8+zNX3RHp0wrlXuejsYYGkv6oya0NqWN0TOBOEFUvUcscuaFdmtU52KMhG9OkXwHkt6nA4GBJ7R6LAk5DGZIMz23juR6UnZxPLTJ6sbufYLv1Ff6h31FVKXW6hDS/OnI0z02B6o9yCNHoj3RaTynP+evTaQwh0cb8OODyTGbI/rp39xF7KR0A9FNVs/eVC9LF6Xhr2THHCbPrMXI0ZW9dcJmb0PmrNb2J2xm6USLuCmkw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:23 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:55 +0900
Subject: [PATCH v3 06/13] rust: io: register: implement Copy and Clone for
 RegisterArrayLoc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-6-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::10) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 799112cd-7760-474f-2302-08df3f145ec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mUu0Dk1OkDLR76NzuEvP/f8iBnXYJNI0d2Jy3+tLO70328vF5pijOz6WbGofLmtTxtn6vnnrxApwpt3TybT0v7/ZfOSzEWUiy0qLIa9tGxqs3x6sIMH/bcrE0V6POOeRWgbnpjtUaf0WELv5T4gFv3aq7Bnn4LoCivW7+MXQP49/bvBZ0xjbb2+PNjgAPHwq8DmBfZXzaRZxOaozrRBDMLOPFXYNrHhAoErDHxrVy61IVgX+Ntj8vB1VIf34idipPiTpcZ9kjiP6Y0fLtISp/SAfOLrsY3W2ewOwUcAnmDcSMhQk138jGeeigxWLt/5oW84zMGs7eCX1NcEJ6hHccVTixOMiDT09G5sO6zRKjai4IxKWTiUiyL/8mYi1Z2oCUjJPTEGVjyuchxNyqpNOKzYBVSO89SDfRG59MkmX2MYK/lO/EMfzKd2BOGgWPCVzaXQmrevV9EUYoqVgpwyZcbHI7JUz6HIo10AfxIo5R/rowHmCO01nCMBJEi3tyBhErxv4tWla1krNcYUFZC2fihyHKTXUG7O/rFdyv6fVqtcktqygQorrf01SORH8YbUDI8MTKbEYF/ulXUvIjAh6D09aMwwliGYtxOnNjnlYY1Y/GVTEYDnVOmPiBLiD3odkseEPsp8+xt5qEO/urOPThW1fY5O75k6bgdhkcn2ta1s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlVDUkZJbFl0dVRMWG93bzhtYVRidWVIVkk4QVgzQ2pZQTRWUmNJS2p1eEdy?=
 =?utf-8?B?ZkozUVZnR1lUbHNMNGVROFl1S0Nuc1Q3dEVvR2lkNGJFZ2tnci9LQkJ3aEVy?=
 =?utf-8?B?eFlUUmQ1U1A0cDZrMnRNZlUreDNMTDEwcE1PaCsrV044UWo3ZHhYUDk4Sith?=
 =?utf-8?B?NTRPUjFlUDJqVUwzUmJGdS90VGVQc3JUZ1hMV3FmZUpucVFTeFVJR1dWcEhC?=
 =?utf-8?B?U2ZoT2VGME03RUNpb25CKzVUVWlxMDM1TUlCMlNOVU85YmZSVlkyazBtMDl1?=
 =?utf-8?B?U3ZyVzhETlAwa2htcGY0ZkxEZDJ4anRvbHdkNnBhdTVTMk8zU2xWaE5NS0FW?=
 =?utf-8?B?WURtMGp5M2NiTHBHdHhDM2lzRDdSRnFDQWJPNk9Nd3BJR05TSldCSldaOHRm?=
 =?utf-8?B?d01jYzB4a1hjcVZoVjhWWkw2b0I3aTVBM2lHVjZpSnBuZFRBMXQwcTBOZFI1?=
 =?utf-8?B?NnErZ0hHWjhvckRUUVprMnQyQkloWVJaSVY0YjdLZGR4WDVGdmdadU5tSUEz?=
 =?utf-8?B?ekZpbkVNdmptNDVqT1NQUkJkOFBNWGM2LzBXVktDNmMrTFplWkZBdlJTYjBX?=
 =?utf-8?B?NWFrTGYzcmFJSndNR1hxaUIrSE1POWZaRVFoQzNjQ0xhTFpNNWtKbFhXK3JL?=
 =?utf-8?B?UTBKSHdDVEk5MHZaUHVOOWFoRVVBcEZjTWtHTmhqcHRwSDU3QWJWNEs1YlN6?=
 =?utf-8?B?Q3pOaCtWdlppSGwxbUxYMWZreFBiOVlhL29XbitvOFR2VTBVVmhHUEprazJ0?=
 =?utf-8?B?cjlPcG5FSTYwc0RiNkEzcGFZTWJRek5ESDFMeTV5YUFIYUpGSWhWQ2ZYQUNt?=
 =?utf-8?B?aDd4L09jV0o1VzFjUHpxKzNVZFg3WXI5UlZ4b2R3SFJDc21vK213aDZiVkZL?=
 =?utf-8?B?TWNOUEViMDE5dUZPbkE4SzYxcDl3M3UzVjVkOWhBaGVXYm5DNTRtQWxiM3N0?=
 =?utf-8?B?aXlKVWhIczc1VE9uZTNpa21VYTNwWWVEa0ZRVDJ6am8rT2ZsS0VyQWFnd1M0?=
 =?utf-8?B?d1FydEtYVmtvK0d5NjR2aExtTlpqNjJJR1NuV2pkVkt1aStYNUpnQ1BGTTNX?=
 =?utf-8?B?dGtZMXpHWGEwZ3d0MHdvRU45Z2VWUXpNSWkraUE5dmlyN3NNYzR2NE9XZnpM?=
 =?utf-8?B?aWVXYmxERUpJcW11UTVuMElvOForeWNXNk5DRnFLNWgzcGZFeExPOXc0SW5a?=
 =?utf-8?B?Rm5CZVJxcFY4OFc3c1BHV20wSFNQaDVzbmN5L0pKTTBkemdxVENUWkxXZTh2?=
 =?utf-8?B?VVRtQ2NIdTdmRTVxT2V4dzNyQzllSFJhNHlqd1g5bHhzSHl5VlduNlJLWS9r?=
 =?utf-8?B?NGJvSnlGZkFUaWU4WnVHb2VoUEI4TUlrT0tWQTZNamJLM0o2SDdSVHZOU09u?=
 =?utf-8?B?MHJYaG9vMDFVUEc5azBiNDNoMStpQXdUZXBGNW5vdmhQVGVPa3hOcjlCcjd0?=
 =?utf-8?B?VTJjR04vK2E2K21qRFZkWjRwV242L1hrUFJsVktQcWRIWHQxL3Y2QWNMOXNZ?=
 =?utf-8?B?OG9DNW9mdkpabEttaXdYazBoTnFuYyt2aEJzZXBtRW1BMExrQzhPaDNiYkxM?=
 =?utf-8?B?dE1Td3E1NFVkRnQ5L1FKM05IRmZIRzYvTkxrRk1leEFjeXd4ekhpOVJiZ1VL?=
 =?utf-8?B?ZnJqUEQ3WklDRHhxY3dRRllYSmVsQk8rOGtKM3BLU2VXU2liK2NJcjNHb3Vt?=
 =?utf-8?B?eEw4ZzJpTFpTaWRjVlJGUXNIQW5YTW9IZE9vRnNUWnpQdnRIdGxxcmU1N1NO?=
 =?utf-8?B?SS9mbUhuZDNUcGRXeGJ0V2p6Ylp1WlJGSmpRUFNCQklzOUZycVNVMGVOL25Q?=
 =?utf-8?B?NmpVdlN5MXcrMFJhbjdMY0hkZkFhM21CdEt3b0d1bHhYamZrNEtWQU9HRGlM?=
 =?utf-8?B?aUhiRzVmSHBJdUVOKzBoMjRRbzlnT2F1Ti9UbDJ5eXByUUJQbElkSUczS29S?=
 =?utf-8?B?UTgwTmxmWXRwTldjbXRIejVnemEwWnN5MkcyYXJ2b1VRZmxUYU9vVjRKSG9E?=
 =?utf-8?B?aWU1a09DNnk1ajRGODB3OFNjVkR5ZFRhaUxQV0VTWTNHRHdEWFdsN3dtcmU3?=
 =?utf-8?B?M3djVVhuUFlHSUhQcjdxTFZlYjV3UGt2UHh2Nng5UkdCdmUwZFpVY0hvRjJx?=
 =?utf-8?B?eG1TOHE5dDNFNmxaWlhoOGtPeTU4NSsydWxsdDczYkxiNWdzTjBpVjBxS0F1?=
 =?utf-8?B?VkhwUEdtdXo0R0o3Q3JOV0tiV3hRV0EyMUtuVkFFcStjaDY5bEM3SCtwZUJP?=
 =?utf-8?B?bk9JV2NMdE1jY0Q1UnNzYm85bVZJRUtjOGFFZnlDa0FKd1ZkMGRCK25hTnNN?=
 =?utf-8?B?Vit6WXF5UDE3UHBqaDhTNzFiNEoxK0t6cUJSb3BzK3JCY294WlpjZVd3dzRF?=
 =?utf-8?Q?DRGKsy7ZfH9vMqabQC43lP/2hfEXOu5VhCUCFhaON+OfY?=
X-MS-Exchange-AntiSpam-MessageData-1: xyWWvpHpMJjVMg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799112cd-7760-474f-2302-08df3f145ec6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:23.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnBsmRU4qfTTWNjVwHFBXgmV9fsZhQUY2wv0oHtzqGGTvvwjfYVknUxkbl9ft4C+/XBy6QshqwUs3KCBWJ7FHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

Register array locations are small values that are cheap to copy, but
obtaining one can fail. Making them implement `Copy` lets the same
location be checked once and used for several accesses.

Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io/register.rs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index b6513fa0f412..08129e20698d 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -194,6 +194,15 @@ pub fn try_new(idx: usize) -> Option<Self> {
     }
 }
 
+impl<T: RegisterArray> Clone for RegisterArrayLoc<T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+
+impl<T: RegisterArray> Copy for RegisterArrayLoc<T> {}
+
 impl<Base: ?Sized, T> IoLoc<Base, T> for RegisterArrayLoc<T>
 where
     T: RegisterArray<Base = Base>,

-- 
2.56.0

