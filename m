Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044926;
	b=Wn/dtdgpbFmQ1ny9pPDhlYoRt+tlMn+GPz5R4jQQJOmvSOl7Pikr9ouMLpixdX38XT4u
	 dvdxKUr2+iBLV4ZXhuGe1PxOCzpjb2hEDR4wASFR4BXJr7NZInAj00NbRCA2RPWNxWkfg
	 389f6m+KJzLgIotJ5u9GCWlbZXFoFYWwDIfavIj2y+9ufh81zbVkQ6UEzrbG+DMl+HZXT
	 0d3wMEH1kIM4ztI0b7siFNaKRhvhNpn6GVxLnRkf7sppMIwoZuivYHjszt5NbvmJV0IYB
	 U8X+PHTUI7v+pYx55vvwcISo3ZX7jU2tcb4uZcj7Fbx+I9pHL2jS3ImY9ZhauOAMKww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044926;
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
	bh=WGD7gVxFPjEGXIHvX67sFT4eW7n3fNzMbKjOdPPpF4g=;
	b=YZcjomGhr1oLSrFAqsMGA3MdhxDz1rsUK74Ey/widFOeb+t8Ey8y/EdpRFiMd6Cg1wsQ
	 CTe992a0PFTtyKtteRpDWE0Ol/vpb1XyCjEXMelwjsm7kiwj00WPEeodWOhhKJ76ZfzlF
	 4tOd9UxtrEUATUDocuy8P5Ot9Yxop6HiUFxlztjYQII0yjwQxc1i77v2hVwjbJ5r5qWMA
	 ZIe+MIHNJXIrCKaEg8/t6vUCLTFkDEB3HrCQiPb4tUse9NFT0ZnThtL2ckeaws4tcqthM
	 lx8M09kvrR9xK1s+nNIVXOMVeALfcBVpZYvnwS2g+j6tkL85+KQsAwe3o6YQhectzJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y736wxbf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8B606D81D
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88A8B606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y736wxbf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oIH7QMKD/c3q9oLqBmpp/Ywv7/ck1cCQBRt8Wa7ThIU1xiP+TdwN5filearspGAwOwLsoUzNtZvS2iNu8mnX9LArMGfa5Rbs6SAjfz6GN6+w4icPsckwXtLAVneXTaVmFpPsgpxTWtMEjK41orxCda3lzCZticnxKEtwIrQDVVOVt5UZJDU5oyiZQP6Xsx4tu0hKvScVYiQ+asxrnNj2TayPxvt5KQx+ix+VFtA8PJc+HSQYc//D3JDXFCXrg0eF7Yr4JQjU/muWeQqV++nA5pLw16ip0u116oRvh70uxuEmw0swQ3Otqy8OPYdbLOT9swQFhq+ubOH3RkWjFbyzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGD7gVxFPjEGXIHvX67sFT4eW7n3fNzMbKjOdPPpF4g=;
 b=WSoXfYBLwuywQkrissSzZrBUTdEiM7RONufpyjHY0arJ4+0iEnh6NQR26lQs2+LR1gupVkeQzQWHoj2bZkuz2graKo3WxNUcrGAHtJ8fLhVQqUN5Eb+qt0Ylnt3UpC8pzp6Tsf9CRFq5cLd8kKTHD3HnaI8IGysoL78l+d564zDT6GevGQ1GLoWixdKqzSeh2G649Ke6nu2onWI8J6nca9u8Pj+kNEAlGBNCMk+UPUYc+kEdLyfv8RSXPLZV1wZwGXoUyj5yaRjf0aD4NvtuXdKE5+F49kaESwvHKUZI691Ouvv8A9mcPJ8doolYa1FwpGW9BArgGetS+uuKoaPFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGD7gVxFPjEGXIHvX67sFT4eW7n3fNzMbKjOdPPpF4g=;
 b=Y736wxbfZGCVdZz6bt0yu7QhCu+YB4InrwIQ12nxCRe6THuvcm1Fzwko7x5s02sL6tCz5l7oKTYRQK9AUGp9PjZXFX/UCbVmZgAA42l74haZp5Jsuayg+kPkdlg+UiCp2LPrLWMZ9eU8UqjdZQnwRT3RysMGtETm6sBZtlal6cZw+0ID1ztgYK/cmyc0xSkTpRvCCbj+u0RCcoeOGvcK9t0WXkF0HvLIs4nZzp8Ew+O+HopLIYBLokhJ/MIV+bCtLIfw94JlqfcmCIiXN/10RFEkWT1TGNnysijSODzHGx0bYbt+pBH3YlBY/aEOL22Xi1sjnPa1iuS7a03D2A2ebw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:47:58 +0900
Subject: [PATCH v2 02/12] gpu: nova-core: falcon: widen the IMEM PIO offset
 to 24 bits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-2-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OSTPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:604:220::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 746b02d2-3674-42d5-278c-08df3cb44543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|3023799007|261022105027099003|11063799006|261026140227099003|261028144727099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	Z/jiIJ5tpEry3OXQZsgKAd7Phe0Lg0lHL0rPACowhfhnPku2twKA/eSNqXkT7G491+TTeieeHXsZjCCbz1s1Vwsnp4o0f3dQz/QhcMr2NdHxfMKTqaU8BJSgy6yHh7AYfjoYsChbcbjLAby51E560i5z+ceb2kx7I1Xy3FaHS8OQSlv43rwRUpz1fZiSvmcyKoFQJDwBhFwlaNYiUge8URPVyXXV2m3N9DmikWLJGz+UJbn1C1HycPtwNGPanYjrbHX4hUCkFrSMn2rOcP/wsPHLrPIphcBMZzsV98LKUfAJp+cvgqkI5a8iP3Hse/gulPj9VjCtDOue6FNF1MHiaeUxE62OEkfxg5JeSrtIHtAq/s/n3ge6nIeJHS2iwulKTr7bkrIhB2HK/en1oyBANqUKzwM7CRJYhArIkWAAsMKitMPodnrUn1rx9ouWEIXdg7/PD3iO3n+pxNsf/+lUNbm2GLvJGE4Y4dddKY4U/cD6QIJ6f2wB0PDnxZ2kj14kQqL/4tCCM6/sveJlp4wZkqdECYeYbL2fmPdls4mVx/eiDNGVt3wF8sB0JZIvOy9TcHhIpTaszTan9SXdx6t4MnCp9DYlHs1zz5nrXgp1MxX2rNfoZhBlUx0vHFO+i3vQe+/AGn/CMQxe+NeVHrEOnBJrT0YhLuwQQReZyWbEtrY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(3023799007)(261022105027099003)(11063799006)(261026140227099003)(261028144727099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUxERmp4MHFMc1NDTVVmcGF5LzhZQlArWU51U005U3NiSEhMN1NpY1NiMU1k?=
 =?utf-8?B?bENqVkUxR0xnWDU4aG5KRkFpOGIzTDdoWmhudTZsU29vd1ZrTHJkVVIycUps?=
 =?utf-8?B?UVBrdWhjUTU1Q212WFZHTmpRWmVpWUJoYW90WFBvcmExYVR6aXVGME5JOVpS?=
 =?utf-8?B?MHlRdHFTNktxazhKaCtHTTlxYTFMeXp6ZnRwZFV0NHA2RW40TXBoU1JkYnZP?=
 =?utf-8?B?RG1RYlY3dmxsMHg4Mmd1NHpaT2NRWEJxa1ZkQ0RrZ0VyMVFleDRQNG1Ib0pu?=
 =?utf-8?B?RjlrcVIyVk5CbHA4bStibjIrWU9UTmN6QmlnWVB1NmNMS3dUcHMrRFNNSWxs?=
 =?utf-8?B?d2c2SGpQWmdoQS91UHhhaDN4TkxaWDVKeDBIcGxqOGszdjBDYTV4SHpjS1FW?=
 =?utf-8?B?ZW5TeFc3emlCTXJWTDl6UDBhRVFQNmlpa052ZE82MTlERDR5eU81cE93SUh3?=
 =?utf-8?B?cklFTVhWNklmWmZJZE5QUVlMVi9URk9yLzZRV1pLQ2N0QkVqaCtiamE2OEx5?=
 =?utf-8?B?RExSbVRqNUR4MTdNeEF0T0VMZk5EdlJBallmcG1aT0xIdzduOEUrcUNDUENN?=
 =?utf-8?B?b3pKTmE5d1lwV21yL0dYSEttZjhTRmNEMHBza0lKUFpHTS9lSTNHZVZHRTk1?=
 =?utf-8?B?OGpsemxESlcwU1VtMjlmcmVpYmRKUkpwQXBUMmdCVCtQTlZpUzVBeXdOM04y?=
 =?utf-8?B?YkliYkR2VHRON2F4ZTZ5ekVqRTZOU2kwSGlqbSswTm1xTk1vZnRjTTQ5Q0Yy?=
 =?utf-8?B?dVhxTkdlcVAxKzFqcVZOeEZpejNMdlhWRGZMWXk4UmlPS1duY2w5MGZSbmgr?=
 =?utf-8?B?bmtCT2pPcXBSUkVJa0x5RlM1eVBLc0FIM3RUcnJyQ1RhVjBsQTk5Ti9UTkxP?=
 =?utf-8?B?R05EVitTZGs4ekx5Q3o0b2tVZER5QzBRanNzUVZ5SFRBemhaK3lLR1lua2l4?=
 =?utf-8?B?MnMvcGZGSlZJZUJLaVJRS0R1Mjk2VDF3TCtGN3h3Z0IzZlhjMUlPajFFMUVu?=
 =?utf-8?B?R3Bxdk10bzJXbEVQbXR2L0RkVEZBMDVZc3kxc2hJK240bHhoVjBCZXc4N2hZ?=
 =?utf-8?B?MzVNT1V4UmNkMEtsVUtROU5DZVVnVURMaVNqZmZrOUxQeDl5OThNbHpnSEpE?=
 =?utf-8?B?NFIyVC9KRzZ3UldPcExhbHgxN214TmRsNEMrd2J6RG5HT3BjYXJSVW1yU2lR?=
 =?utf-8?B?LzdUMUNxaTdRSXdLVFRheVlGT0szb3lBa01odXloT3krOHoxa2FZUzFGNDcz?=
 =?utf-8?B?QTBNWE5GY01pNDJUczNYRml1RUcyRmFDVCtid0Zmd3JhMWk1Z3FSSkhCUlJs?=
 =?utf-8?B?dys1TnFQSGZldmFFL2hrSW1qMkEyM0FaWlV0TzVHSDdZUzFPNzNrclN1b2hG?=
 =?utf-8?B?VkRaL2dvZVc0TmszSE0xQ3lBelI5QmtNSDBmK3V2bmFud0w5UEYzdWttaExp?=
 =?utf-8?B?MEZ0TnJLcTZDbTM0ZUhuTW1nS1hUaW80Q0pTV2U4dkE0eUs0YlFoN3VDRzdZ?=
 =?utf-8?B?RHI1M0pNWEZuQU5icERFSGpESFoyN2Y0MEZ2SVJuTkRuNVRtN1FrTXo3ZzVQ?=
 =?utf-8?B?NEtNV3dpUGtRK1ZnY0UyTGU0VGptdDYyeFVkOFJucWtocmVETko1MzkrR0Vu?=
 =?utf-8?B?N3ZuY2t6YmtQMkFJN1VtUzhNKy9YNFFhYlYwM2g0OWUvSVJUN1hNSWtwQnF5?=
 =?utf-8?B?OUlwN1Z4M2t4NkRHVzFoWE0yR0xsOXYzdHIxR1RwOVQ0dElUeEJhaHN1WURy?=
 =?utf-8?B?N3hmRXhBakQvQzI5VW55VWRpQXBXdUFSM2EvVERnbEN6QlUwaVZYMUpIQ0hs?=
 =?utf-8?B?RldjMUQwSkpGVVFyMmROaG1uU2MyS0g2NWRJVjNZQm4yTG9xV1E0TW5rY2xI?=
 =?utf-8?B?M1JlRUc0ZytUNDM5S1ZzZUM1eUtmT1pFUTQvWmdKRHYzZ0hwSEdXVVRiUXk3?=
 =?utf-8?B?bExMbEQ4T2Vka0xIcEorUG84aXZrWC92SUQyTTcrYWtuNS9naGQ3Z1lUUXI0?=
 =?utf-8?B?VjBrN2RoRHhrSEVoVW9HeWVRaTRWbm10YVNzSk9hUzZwZm04anJqdW5oT1gv?=
 =?utf-8?B?WVNnM1BadnZvSGVnZG1sb0JjNGQwdVNwRTN5Qm5tRUM4YmVDM0ZDNEZ5VGVz?=
 =?utf-8?B?YWFDM1ZhWWh0TnZaWlhaNjBOeGJxSTVWdEpuaWU4eEIrQjZtQXljYU5EZHF1?=
 =?utf-8?B?TnpDWXk1TlRKZmtqb0JuSzg4Q1MySVlsOEh1VktOVndJaEZwRTZ5dm55TVlx?=
 =?utf-8?B?czh6Qk5YOVdSS0J4WjBTenNIRnltM0VXSTJTbEVMY0tFUDBKazR6c0hFZWxT?=
 =?utf-8?B?RVhKMVYwQ2d5WnA1eE9xTHBNdDRBdlo0WW9GTFZ5emQwZk1mTHd4RkVzRmR5?=
 =?utf-8?Q?y9snzmDtJEbJfAziww8lJy5PYl7fW4eSrW0MDxFqip5vQ?=
X-MS-Exchange-AntiSpam-MessageData-1: xCcnmA6QC4O7qg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746b02d2-3674-42d5-278c-08df3cb44543
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:26.4700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghGjHZc6bgCkqh+9cHF6+iEqQdXW2F379zv8Lbmcqg1X9b/lSuRX6B/8HRhcdXWwk85eA3s8zhtz1XLMLQEmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

`NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 24-bit offset since GA100
(16 bits on Turing, with the following 8 bits unused).

Nova declared it as 16 bits and carried IMEM PIO destinations as `u16`,
which prevents loading anything above 64 KiB of IMEM, a scenario that
becomes possible once the generic bootloader is placed at the top of
IMEM.

Widen the register field and carry the destination as a 24-bit `Bounded`.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMNAN7KX22SC.QQ5HURCU332A@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                  | 10 +++++++---
 drivers/gpu/nova-core/firmware/gen_bootloader.rs |  8 ++++++--
 drivers/gpu/nova-core/regs.rs                    |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0b377bd6524a..a34748abc74a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -18,6 +18,10 @@
         Io,
         Mmio, //
     },
+    num::{
+        Bounded,
+        TryIntoBounded, //
+    },
     prelude::*,
     sizes::SZ_4K,
     time::Delta,
@@ -230,13 +234,13 @@ fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
             let end = start + usize::from_safe_cast(params.len);
             let data = self.as_slice().get(start..end).ok_or(EINVAL)?;
 
-            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+            let dst_start = params.dst_start.try_into_bounded().ok_or(EINVAL)?;
 
             Ok::<_, Error>(FalconPioImemLoadTarget {
                 data,
                 dst_start,
                 secure,
-                start_tag: dst_start >> 8,
+                start_tag: dst_start.shr::<8, 16>().into(),
             })
         };
 
@@ -272,7 +276,7 @@ fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
 #[derive(Clone)]
 pub(crate) struct FalconPioImemLoadTarget<'a> {
     pub(crate) data: &'a [u8],
-    pub(crate) dst_start: u16,
+    pub(crate) dst_start: Bounded<u32, 24>,
     pub(crate) secure: bool,
     pub(crate) start_tag: u16,
 }
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 1e7ff9699174..16ef2c79a6b1 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,6 +7,10 @@
 
 use kernel::{
     device,
+    num::{
+        Bounded,
+        TryIntoBounded, //
+    },
     prelude::*,
     ptr::Alignable,
     sizes, //
@@ -30,7 +34,7 @@ pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
     ucode: KVec<u8>,
     /// Byte offset in IMEM at which the code is loaded.
-    imem_dst_start: u16,
+    imem_dst_start: Bounded<u32, 24>,
     /// Tag under which the first code block is loaded.
     start_tag: u16,
 }
@@ -76,7 +80,7 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
 
         Ok(Self {
             ucode,
-            imem_dst_start: u16::try_from(imem_dst_start)?,
+            imem_dst_start: imem_dst_start.try_into_bounded().ok_or(EINVAL)?,
             start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
         })
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index df2eddc58efb..bf3a43f1c09e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -236,7 +236,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         /// Auto-increment on write.
         24:24     aincw => bool;
         /// IMEM block and word offset.
-        15:0      offs;
+        23:0      offs;
     }
 
     /// IMEM data register. Reading/writing this register accesses IMEM at the address

-- 
2.56.0

