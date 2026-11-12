Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794471660;
	b=bPweBtZcT76gq+05IsLyGxbxcySLjrsSFvswtBVn91XcZmwAcTcao36DmEJxaHEqGvIW
	 bQ3/sM0Jm28tdbv93ep8p6BNxz2+wr6Ydx0gOQH9vRWsnzGukO9tmc5zMxHYjwD6/uvO2
	 Ablb78ceto+5iW4a9QKKUSX6r7LffCYQxTB/Fp4P/oWSdCwBxj+G2CVnrLPc826msQkbh
	 oK4MszmYrT111LmfBvZO4+WtjtKwZM/S3hr/AEMxihWuHhbnsg/4Y7zu3pb5kQQ8QA1zh
	 3GCoyZNPHNl1Z2yIdU9IVMR5IGk860HODGOQDJnmedn04VjQu42ELFijq5jHD7/5/lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471660;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=V2bF6IW/t/AO4D5wf5hj8NEj3Am7AZTh/+B9mDN3qAY=;
	b=TTwY713xqy0RhUvu7Jrt5RXL6Zqw96mFy5OXUMwTtNuNULq5cgBlUY/z4qfYcGvlY5h3
	 TIy03fgk9R7TqhCalIRv//SBMpm/fF7PbB6vtsqZa6U0QKiz47tZlBu+DZLXvqRPrLQfM
	 ViTLDTMpgqlhW9XjtYlQ7/GESHTWz+Y+L6Rl2X8TDih+YnFeqUlDZ89M6CkVucz7sWqXL
	 t7VgsozUPB/yLrvPI5+QVd/E1N0GiOkLMfv3xqpNd0H2AtGiO7E0FP+WL0tQeWCKpqp53
	 4Vnyn961NHpEAQ5d4uGnJshlH5STbUZKOU0hwmU5PYz1XPvEKY4tPMthaJWKcYYZ0SQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qPGK63F7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.22
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93394606A336
	for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 08:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93394606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qPGK63F7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2Flv/kdfA6hMmbz/kitiLPrzyJOulkeP+z4iisTtdR3d7hGo7yhJ968kiK4WG5Tdqnq2uKgr6FCKFWI/2pV7CUpqcmWs5lDz7QdaOrI7O6E1pkyBYIiBLhKDf6XJ1Np9HPcq5Tc6qvOB6Skni9Ybeb2QvvEpIEbJHdId432mbH12yMV8aloaPqyT/8v2iNtnOyA2fd+gUCo064TBo7GB6fiqRb7vyYos+BxtmCSovHGwYvpYuZ77749jMyhGi7nwbGD6a3Z5vS85+mnZgc7Gh9ohLO6dkHAturGjiSNddNnm/8xaIziVJXi1LFZSEXHfhI2YOaJlsLeVLAxPZTCsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2bF6IW/t/AO4D5wf5hj8NEj3Am7AZTh/+B9mDN3qAY=;
 b=K29ppZbHFUMgtDyAufo/wyCWv72bgpMvjUDcyZ9QkBGyJQuURU6/t00Ta1TWmeRuJJ/fQRrTdpGHCv6S93rlqkL38eHWN1b7nP/TqHmpb6gcfyMIAO/LK8qjl/ECtT+FKAUnyQmS2j4YV48mOF13xcum8zZyyCPEeJdz1+PSW2xXHlnDMIYUNuDwJMu+rzofDf78ijzVPCig7jjwWSLRiQuoetXrZOly9e99JX9cJudfGqgQUSLPLf2fW89R7EaJQJoXaIPQTTcF2HJ0GQ/Wl5nYKLbsKOrzc3CLRnQMmQDzHjPaYbus+vzEvke4fBRnqxrv3FnnpdsM/A9JbvTMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2bF6IW/t/AO4D5wf5hj8NEj3Am7AZTh/+B9mDN3qAY=;
 b=qPGK63F7ugPywF+RrFzhkarbeNEAHKG6J6zwJCQqvqSg+tivzc/7wddhVUgYhRmEznj9Xb69Qxs0jSEqDyOe06ZWca+7OI5EYDNn8PMOWAJ0ovhzmL3sONnwb/4ERBk1rrYIie3ygAUL1wAKwPDc8/CYvyQRrzfYOD6MpKqRn8CHDn3nWT+3JdatNMA/5aXyAYzIAMZAC6ZffTfg9lkkyKJnG1jL8IU+63Qk5avBd3bSYTT1s/QwtFw3XNv+KWSkhVjZQDWzsyFp14hUKmxesOtL8ykvQF6CdLekqzDtM5zRxeef3wPIYNhf2X2pXw1S7Iw7uUUCOYP2O/XbVrTRSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA1PR12MB8223.namprd12.prod.outlook.com (2603:10b6:208:3f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 08:20:56 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 08:20:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
Subject: Re: [PATCH v3 00/13] gpu: nova-core: generic bootloader and falcon DMA changes for r000
Message-Id: <179447159951.1733522.4075357736636588028.b4-ty@b4>
Date: Thu, 12 Nov 2026 17:19:59 +0900
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: OS3P286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:200::11) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA1PR12MB8223:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b02b23d-0e7f-4f47-9050-08df4095df9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|260925022911599003|260925021311599003|260925021911599003|261026140227099003|56012099006|261022105027099003|11063799006|10067099003|261022075727099003|261026121527099003|261028144727099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	CygOiIJz6rLiZJMrqnNiBzrGHq6195n95PGtEXW2GR9tc18hbYyre0B5mxKgp6eCHadgCjVQc7ba7hFnEN51l1WTKylyh+dcK30eTj6bUa+drY8U3e/fIzWeLU33Xb7vt/G38oaqJGlEp3gkCdLyWzx3Gp46bXEzrWQdGJqTFYNzrze87GzM/LstDZR62w2sMduKZANmimRZDBGrPko3yIZzUw4GvqRauPkIbOQglEN/umff3qcw2wt3LHBkxlA6JQXCkmypUaJUwdYWdQxWxItJ6RNSVKZz1pPb1Yo1SLFFfR3YuyeCnnkL3ed7OBuXKdMLvHskVAvu/hexcGC7bYoprUKtI9G7i8EGN34M4yosnyf2ZepfqbRgwgejcglGJE4HLKAxZ0z07KBxkwsrciYIQvF+/gXnNDTqhnZhP1gVUPGAR4ju0UpbITs4eiOGT7UKq0MRktz0sVO0ghaCKJmH840cXprOoR2LAoqTml+EU8g1rQ8U639oiXyT4kiaMcL3Z+NJhe3UqgxFTqX7XCzTr4xFJ/Sb5EzZwBFvFR+SYRSknx86LHYocIyz0oMcExmEtVPUr1tf6Y/bgQHsqHm5J9QQI6l4nKbo/OCIkhuCfF+nNSb/wxmLz6Pq3qMRq9YwyilpMU/8OBOm0uSSuscPxE9FOaw8OBL55AHtiRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(261026140227099003)(56012099006)(261022105027099003)(11063799006)(10067099003)(261022075727099003)(261026121527099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmhkMjZvRkZ5Uk5ZRElpcVQ3dHdETWVhdHdYcjJwNFVoWTJxTC9SR04yUHAx?=
 =?utf-8?B?eDk5LzNtTmhMUXJPLzY5M1ppOVpIMXlGRHBNc1phVFhZb1B2dzlGbWpZQ255?=
 =?utf-8?B?QmNieitiaHcvcW14SU1Bc25XUVBLWEw0VDEya25mbUZsTzM0U2tRUmNvb1U4?=
 =?utf-8?B?WkY0RXY4LzBzMUhxemRkQnUyRGRVL3cwWXhPT1FsbloxUG5NTzU5MUhrL1BX?=
 =?utf-8?B?bkVyUzUvMW1GbXRpSFdHZHA4U1JSaHZHdk9YZXFVTGxuRDkrdXFmaDEvRXZl?=
 =?utf-8?B?QzFPV01kWjZIdFRKOWJwaXhncHNoSis2VFJXaWRUeXFHOUZ3RGsyWWpqS2lh?=
 =?utf-8?B?ZUlUTUl3UVdqeFhkbGlFRlp2YWpLNGdva0J0SXBoaGhncTk1WkFBeHF3NHVr?=
 =?utf-8?B?RlhLZ1B4citwcDFVSVRFRTk2NEphbkVTWXRENE84Q1hwMXlLazY3VlFrclFp?=
 =?utf-8?B?QkRmT01JK3YyaTVkbjRLVkJhUjY0SEVNems1bHpNWlhmNTMyZTB5d0RuUkI3?=
 =?utf-8?B?MHlFa24xdFVLdDlISkpHT0FIa3Q3encyamVEeHNJcDBOZXp6Q3pobTVIYjQ0?=
 =?utf-8?B?VHRHbzJ1enB5dlVkdXFKbENqUnNXamxGRkxWek5idS9NMzBySmZuVy8zTWcx?=
 =?utf-8?B?Njl2eEozSU5RaHVFR1FUcnQrRm1UbGt3cnpCUjMyWFBRNDlQa3ZtaHFsWW50?=
 =?utf-8?B?bW0zV3pxVW5nRm1UbVF1NkkwUjZ3N2NaU3Z4YjdJZlNUR01zZlFvK29ndHRj?=
 =?utf-8?B?SFJmdmlpOU5NcWNYd1pwcFFnTGlGOENTbU9mYnJVSlNkbGVVWnVXTkRwUDF6?=
 =?utf-8?B?UUUzTVhFR3pNNnh4eE8vSDZxb0hRdm9MazNTemM3UHQzQ2RYWWgvOE5NZnNs?=
 =?utf-8?B?MjBYTmJCb2RlS2JWcHphWEJhekZmMzFUVWRNcjdUTHdMdGFiSGxIeUlPYjdR?=
 =?utf-8?B?eHVHQ0xZWDBOUm9xQjc4ZXlrekQ5bzRJZUpScXZVWGpOY3dQdUE5RkhFYUw5?=
 =?utf-8?B?THdxWGhuTlNRV0hJN3lzR0VONnJKTjVpalNlRDdESWp5RWUrcFpjeUVrZEdn?=
 =?utf-8?B?Mm9RbmcrckYxTEc5QWErd0s5bEJBTkR5RzlLWGpGMXg5MEo4clhHMXRLL1E0?=
 =?utf-8?B?blFtQ2t4NnYwVjdoUE9FU3ArNFlPYTlSby96Q2NXclY4MS80LzdlTkg3T0ps?=
 =?utf-8?B?OW02UHBjeE10SjdqT3hDUW1uZ013ZVViMEQ1bU5OMmlycEw1VGpidnVETFBl?=
 =?utf-8?B?ZGpGd0Fab2pzN1Q1SzhwR2M5bjJ6MGNkL1dSZFlrZ0RwNmlXZkQyV2RyL3Bi?=
 =?utf-8?B?ODlwdmNxcUZVbGptVU1VeWtiMVB1bk1iNGd5blYrNmhsNTQyUXRXVVZQRTkz?=
 =?utf-8?B?MjMyNHRsRTVvQ1VyT0M5Qll3bm43VkVwTjUvTFoySk9ncHNHQ0k4R0FpQWg2?=
 =?utf-8?B?SXp4T0F0Qmw5SWMwbVBTRnVJVGkyeVB6N2Z6UmIrcGJmb0dFb2ZtSnpRN3Ez?=
 =?utf-8?B?NXdvZzlIL29ERmlvMTYyRWM4Q2pRSlFlU083Rm1OeUxOaE5oMDFPeVp4dCtO?=
 =?utf-8?B?eHBoRUVEcmZNTURRSWs0T1RPdVRIc2Fqb3pSd21TZ2d1RHNNWTdsZ3NodmdK?=
 =?utf-8?B?NmZCZjJwMkRuZ0pYdWxkaUxSMXRTOFoxRFRyQ0o5ZktpdWgvYUVVeWlreWVq?=
 =?utf-8?B?S21hUDRFbVhkaVg3Y0N2ODdDSjlmOHpkOTBtd1pUSzgwVlFIUGQ5MnQydVZ0?=
 =?utf-8?B?c001U293ODVYSUR5Z3FIYXBlMGVoY1IxcndjQ0V6MVcwOW9VYzVsMmRMMksv?=
 =?utf-8?B?OCtvRlVGN2lnTUFYb2xEa0F6dWlsYzJINUh5VnBCUnRQQ1pRME9LRWNJOHpF?=
 =?utf-8?B?aDNkZGQwcWppZ1pOSkdLWm8xbWZUM08yS1A2aGVlbGVjclZxdHdLOU9IbDlW?=
 =?utf-8?B?aEp3RGIvaGszenBHbll6N0dHVEVvM1UyMHNFVTJheVdKblFLZmJxZjhVcy8x?=
 =?utf-8?B?dUVoSGtvL1RlMldPa3NpVlRUM1hlcmxRQWovNmVjanEzbDBhaU45U2NiNGNu?=
 =?utf-8?B?V0NsVk9KSExtaTkyeWdUellXLzUwRWlPTHVHanlkSUIyM25rQS9VeWRWN0t4?=
 =?utf-8?B?aU4xNFFuWmQ5OERad0xXTkZXT3R0QmlqU3lMayswMTl2ZDBvemxQY2dSTVNZ?=
 =?utf-8?B?VHIxSGg5eGNIOGJNTlhqcStXelNjbjEyZUJrVlgvMHhicUpUdUFKV2p6SmMv?=
 =?utf-8?B?cGtlNUQ0djRGTkwzdS90WG1IYkUyWkpWTlRRZHcwTWM5U2RyTkc4YnJjTjNw?=
 =?utf-8?B?T0p4UUVaZ0JCYnVFTXpjK3p2OC9BSy9pUktMMWpGTFpiT0tiU2xXSGMrQ0JQ?=
 =?utf-8?Q?zFhi8l1EnyvZaab7qbOpPILC+4hTO+ty2s1411Cau/Dk5?=
X-MS-Exchange-AntiSpam-MessageData-1: ESVU+Sca8ZKeQw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b02b23d-0e7f-4f47-9050-08df4095df9a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:20:55.9311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hy2kPUUTpClIqzVNsSt4aZApaHXtu98FOiXr37jO8DiwoYd30w1b4UagOuU0zzj6MLYaHuI92JNFgSf60subbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8223

On Tue, 10 Nov 2026 19:20:49 +0900, Alexandre Courbot wrote:
> This series contains patches 13, 14, 16 and 17 from John's r000 series
> v3 [1], that prepare the generic falcon bootloader and the falcon DMA
> code for the r000 boot protocol. They are submitted separately as they
> do not depend on the command queue work, and are valuable on their own.
> A few preparatory patches are also introduced to smoothen the
> transition.
> 
> [...]

Applied to drm-rust-next, thanks!

[01/13] gpu: nova-core: separate the generic falcon bootloader from FWSEC
        commit: 8bf7832a74e1caef599047235343b4750dcc6107
[02/13] gpu: nova-core: falcon: widen the IMEM PIO offset to 24 bits
        commit: 597e943e69931b5adce6e0665eae79fa080a1d73
[03/13] gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
        commit: e28788cdcb49f645bf68831ff656ac2a7fc60e31
[04/13] gpu: nova-core: run the generic bootloader from its own type
        commit: d2de6ea2e2ef1c21dc52b42e336b3318d2282b0e
[05/13] gpu: nova-core: place the generic bootloader at the top of IMEM
        commit: e45827a4cd3d220f01e6c15886d3cf62f700c19d
[06/13] rust: io: register: implement Copy and Clone for RegisterArrayLoc
        commit: 2dd2dfc3051266633bc48e22c9478a4c15e170a5
[07/13] gpu: nova-core: falcon: introduce and use with_fbif_transcfg
        commit: c78820b1414a766ed59c6808608eae3b323bee39
[08/13] gpu: nova-core: falcon: rename the local variables of dma_wr()
        commit: fd54afcfd67345e54b46323a74b453583b084834
[09/13] gpu: nova-core: falcon: allow DMEM DMA transfers to request tagging
        commit: 412984fe3871ef3607fffa2c7199a2095171e11f
[10/13] gpu: nova-core: falcon: allow DMA transfers to read from a framebuffer address
        commit: 12c2ab28b668b174f0e58de986459c8aba67f303
[11/13] gpu: nova-core: falcon: use src_start as FB offset for all DMA transfers
        commit: 31468ee8b9d43503f9b04d551d0b2d5f8b9e9d1c
[12/13] gpu: nova-core: falcon: check the per-block DMA offsets for overflow
        commit: fbeb01eb3a218cc5a209ebcd9f91e99a28ce6b85
[13/13] gpu: nova-core: falcon: program the FBIF_TRANSCFG register in dma_wr
        commit: b62ffc10ca05a38b9c84cdc36be66b6224944bcd
