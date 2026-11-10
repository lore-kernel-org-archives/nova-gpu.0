Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306111;
	b=J/V1Nb2X9DK4UEtTtaX1CcEuVnqA1LPilTuC+OcFAK+JiQPDAl5EB98uN55fIrPV3Szu
	 z8MPZIbjBUSYn6BtLNDiI5X1Y8seVyTBho3ZkWWpXjowjUvmjCjmeWB0zVCcmtpxugmiE
	 9OwmcVnCanBrzHf1q4McTNNn6j7kbjqBulAzOWoQa7B7GIgpPu6VrL2+OSfyMX8FPHWDO
	 jPKwX3+DLR4gqqyzMKPP3z1nM6QSJ5NpWq/VRj6mM4lii4SYuTVygOGwFNwCdOz4elFtc
	 g2WpJZiALbsjbT4VB5NVSZwcvWXSTY9n1i9yTJy1qv4abOcY5gollb73Sskyz6HR+xQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306111;
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
	bh=3x7Fr4sHzJp0XlhI700ghk3/j2Y4NbGczaHuFW2Opt4=;
	b=G1RMZLzVFv46Ile5AR5sS/AnOozsSHYOwrAOZ96QzlPa39bPKNrWGgt8PUjG6jZPFaDq
	 jRndZTNPZXMUu6g+t2qs+n8WMM60Hk9jkpcSz4S2RuOvUB6+D8/jMneG6C2cCgHhezlQ+
	 u+pqQywFk0jDGgJr0P9cwaCOLVqr7tWP75ACaN4+dVStkCuhEN0KkHN+Y0TJk/9UOyWzy
	 qhu0F9FtYMgV+Mb9Fv01ZFybxGBkMOZvjo1q7rcYuh5FJ8WB6Z1wb5GLx74Hxu+n/MkHJ
	 QMBGiH0xvshp/z0D7wtl1i9XlvnDZEw/ZU9yemM48UTA2Uc/FMWl3GTBswYaXux0Hpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cAtAX8GS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.10
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012010.outbound.protection.outlook.com [40.107.209.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25360A5BFC
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC25360A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cAtAX8GS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KipmTgIsCASjQnezrdKF/J05xDXmZ9yIwaikw0AJZKDkjKsGhY4H0+7ri9T5sQp2GJ7peUbCIg5X6zeAo140MA8SNyWl+sXwIxEMLRgMXeRqb1wz6FjuJfGX9yAaX9H+zdXJzj3q4PPoUHF1GhseLDioUaLbWHvD2lp6vE8Z9J6cbEwY8gDeic0BvOiBf8mYeh+GzGYjfVcKBoQXRY4anU2RbM30vpwn95/qImfbv6e6H01aZEUAlhjlgDalVVSNDcmSBLkXDjH58lLslHybXvE8KzuR8/2SXaqn4km5y/shl/FpzfqOdbf2syXxE6ZwNhyPPq8X1A7A3VotxU8/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3x7Fr4sHzJp0XlhI700ghk3/j2Y4NbGczaHuFW2Opt4=;
 b=Bk17lmfjbar+AI7vSKatVjBK6ZeOSoRmDf85gd1QwTnl8Pe/WboZ4l6tSjjks5wt/3JlykMp//Wx1xow3uBDxdm1uqQIEbY0eYSVagAetKczEwRuWjLe4fFQP6cV5QiOSS+XMyBD24y51iQ4s/krmcB1Mh1ktciEqLNjPkaPvkdkx+OxxYygIlZ72nDMRrXmPDQBBJN/Fr4qFHMfzpGilrtfEtlWe6VMtXH3f7TAbC1+DDnnoEH6AlQ6M8d6b6UJSSEi4zSdBry0OIb6r0lZshv/MMO9udIb4fflrnTlO6EWnIQPfIPmgNAoTEsRnY+k/e1aaFq8/5v+KWavjlvmUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3x7Fr4sHzJp0XlhI700ghk3/j2Y4NbGczaHuFW2Opt4=;
 b=cAtAX8GSiffFfBIkcqDAWIsVEZRET3KngQsG3ubaMEN9vKYRdYJAhEB1pV3Qy4eorI2xyGcCLv2KXqaEWmjrQ0jb48ss0BfBF7x5PIwJ3PF8gHl4EXJFBr5LksZmusx1OGirBuyyLKSjgnvYjbjcbeRWXDoNAChBvfplz1CLevG0pkpko6AFh3bJKdZiWUq96fxPvBwG+nZ1MF4RmXc5AQWma/UmbzDdIgwEIwGEMUUwniJ5h+vCUhbPHSUFodI/g32yizoru40B1XPVz54ngSwHckErsxzlAXdcWBd4WMaxfAMA77r0HLD9E2LUX8ocfD/8Ncr/aBDCJTHYAllDnw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA3PR12MB111810.namprd12.prod.outlook.com (2603:10b6:208:712::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:21:02 +0900
Subject: [PATCH v3 13/13] gpu: nova-core: falcon: program the FBIF_TRANSCFG
 register in dma_wr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-13-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0122.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA3PR12MB111810:EE_
X-MS-Office365-Filtering-Correlation-Id: c2f7585e-cf3f-44e0-9d1a-08df3f146c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|10067099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4ihf/8wkT7Tnvq7bLJdgKIm0CWGS2jzNedeFu2MnhgbIKBkLioSQTFGLrKFHatlCcnaPmNLEblto0wVbk1jVnZLH/tYijyjswnbGfvU9y3U/nMCLaXW+LO4yf/xwdyfZi9qjdRFBYYkh8W8IdV0Tf3OPhYfWqaayDzxloW2MMMht1vWp/gss/BOyUp/YIKOO5yRAaljQ6FHtaa6ajWZL+/PGgfM5/xlBPeAI9qtm+QRy5PRiWwUFotHgoHSz8ZDTwIU5GEYCZU9ProO+bhHb9lvHEcB3V32ftpISfRx4jADBzRQGSbxxfH0ac0i2Q641gbTJ7m0WJUsnxqtoZtxs/p86lvCBu+mxKPSg2eE/n89rqpv3mZzlPlZrb3xwfXxrjg04fkICE7gm3krp/cDF/Tt7fdhSnRtA+/8dJjk3ZJ4g5kJ/pl83iWTgKxZe8WoiM0gSTBU6soqU8ReiEX09W9HQPUbb2aPthw3pMDpfhzU53fwXqXzV7J4a+yeeRHpU+FL1Y5lfGPgFmqtAeMLSpffuXhKJglw2Px1L/jNWf9U1IRz1ax5KY9ERMm1VfLmBAZeyOh7idDSIKVsAofXzuG7FrTCyNjNeYTPUb3vMrEuFP0en1j9EZLSnrK/m1kNVLjDcvK4PRDm4QH8rBzQrQNP2QJnMYnE6HtVIDjQYtAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5jN2Mwd3cyTFpQWCt6MjlqYithL0h2M0VTVUNTdTR4RHBrVWhrM2RrRnpY?=
 =?utf-8?B?T3g4UnlJUlE2WDdnNXBacUNtd1UvQktvSVVCd2ZpWFdUaXFOMFVBQ0J5L1NK?=
 =?utf-8?B?aU5leWFWOFg5K0VnWHhRMW5iZ25jR1pBMXU0eVlKY004THdacW1UT0JyZDhI?=
 =?utf-8?B?SkZWSTZUNWltcDBmYlJWcWRBdml3V2RKSDBHejFxdDRBNEdDQytxVnhmMjVa?=
 =?utf-8?B?dTZISldhVlcyWHBaeXV5NU1WcHlucHZUbWxpdTBpdWNKankrYWZHSUYyTkpL?=
 =?utf-8?B?R3NLckUxcjZoTmdIZ0l3NGRpZVJpNXVWSmd1Y0VoRXk1KzMvajZ2cjN0WXlk?=
 =?utf-8?B?dTFGY2V1aElHZ2NXVTZMNnA0WmR1elRnYWhIaGlYNEV1MDRUK01UWjJzOWtr?=
 =?utf-8?B?dDkxR1RXM2Z0Z3dEWVVWaitPQWh6WnBkYkFtRXM4NEptQzhZWjVyVi9JdGZw?=
 =?utf-8?B?YS9KaG5MN3FMcVlONGlxWmZwQWowT0J4WnV5eTkxUW5ycHVrWTFLQjZvRkU2?=
 =?utf-8?B?YzlPMnR2VHA3UXdJSGRrYm16b0h6Z0VGdDVCQktrN0R1OVlwdVIycVNoZEdr?=
 =?utf-8?B?RDJzYlE4V2NCQ3dsVFp4S2RLdnBIV3RqenFYRHZaV2NRRVRzaE1qeDhUVXl1?=
 =?utf-8?B?UzdXSzlHUHR0dEE1bE1EZUJuSnNMeDVtaDRsM3pDMjkwM1VhbkZkM1lRQStj?=
 =?utf-8?B?WklzY0ZPbWhiVWJQV3FoRS91WkhuY1l2NGZVNmM3Mldxa1lyUmEvUVA4eXBY?=
 =?utf-8?B?V05CcUpsNHQvcE5abFpYemRhKzRyTzFTb0JYVkZKSDZQdWt0Z0UzN0xtMlo1?=
 =?utf-8?B?MFFhZXJxSVpUeXozUndhSDdGc2ZRVDVYaGk4eXlqSGNWVHdUY045S0Z1a1ho?=
 =?utf-8?B?TEV5UFlMdUpaNGlzNUozMUdJbUJqcFVrSkFURVdDM2tBSUZ5M2p0a3dMQkcx?=
 =?utf-8?B?WE4vM1o4YUd3ekR6OEpiQ09qY1ppUXk4RG1NQmdrcmxIdGIxTW54bnlYOFdI?=
 =?utf-8?B?QWF1SjQ2c0Q3b01IQzl3WEFsSVc4c3FIa3RvMGRNNDZKOHZKQjZCTnM3dk51?=
 =?utf-8?B?Q3U1R3NMRXp3TnpQNUJtdUlwS3NLK1FaNFVyQUd0bGRPUFpBeGJjYVZWSVdC?=
 =?utf-8?B?elRDQVpXMUw2MkZnSHcxMnBTY1M4SG5kUnZWeGRWYzhENFBCNGVzK3BnMGV2?=
 =?utf-8?B?US9OVFgxamFNRGIvRC95dkhTbWVjZ2dlbE50MWVDUjVYTDRkME1EZG9vejU5?=
 =?utf-8?B?WEZCZFVZUGx1VHVCNkpGUXdabktBVnlTcWdlUXBKMW1GNTFvNTl4M2xmU0tD?=
 =?utf-8?B?Skg5U0RHQVp4MUZORXpHc3FPdVJpdC8veWhTQWdrblZsdHFGQk12dU8wRmtO?=
 =?utf-8?B?NnkxbnFoZTZSR1F2L0QrS0tIM2h0K0FnRkNqSnFsc01JTFJtM3B0bGV5VzhV?=
 =?utf-8?B?bDUzTGh5ZlNlaDZDbE5QcFBYeVFtM25aMXlBMUhyN1VLdUQ1VDVRU2VwWC9E?=
 =?utf-8?B?MlpHNWNvOGxCdVQ1VG5FYUp4bjk3WUFzWHR0TUhXajNYa29wRVg1eXlWalIx?=
 =?utf-8?B?RnE0WVRkaTVzMnkrWGhTaHlUK3loS3UwcURRc01NS1NLenJVV3RUYnBFSW8w?=
 =?utf-8?B?SmZzeWErL3ZJUmYrdEtHVXYvb1YzZnl4NnRVTmpDMkFSTGFCSnVXOFo2UXpp?=
 =?utf-8?B?Rm93eEgrbG8wSUw5ZW1HM0pmelpGclJQeW5oczdmeWY0dXNUYXNvczYxZ3VD?=
 =?utf-8?B?LzU4WVJXb0t1OU1wb2Y5TU9BMWo3Yi85TlVtY2ZPejh2dFRUNmRKK2h0ZkZq?=
 =?utf-8?B?K1BSUEZ2VG9heTVlcnhRUGhSSEM5ZW8xcW9QVkZuTVUxL3F2N2JHb052SkF6?=
 =?utf-8?B?QXplUGtESGd5ai9qNmNtejdQVWQ5SFNraDI4SG9EMDJrS1A0Z1hQY2tzMXcy?=
 =?utf-8?B?cVo3VnVsK0t6NHpVdEMxTjViMWEzVjNiR2pFT2ZVQWwvMnVvZnZWYmRvUHl1?=
 =?utf-8?B?MHJoc00ycHVxQnRCcm1BZXd5UWlIY1p0SERRZWhYSnMvbjBUdlAxRzF0Yjh0?=
 =?utf-8?B?b2VJRFc0V0ZRZ1V2Y3U4WS9YU0prUDFhdXdDYUZrc0Y1VHphWmNYd1l1ZlpW?=
 =?utf-8?B?aC9kcFhHdVpPWUVTb004UUh3ZWRkME80b0Fuc0tOYVRDREw3eklQMkFsQjdw?=
 =?utf-8?B?VWpNdUhIeEMwUnZTVk1MQ2ZQSlV0ZTcybXMwK0lTcWM3anBJN2wyQ25FMno3?=
 =?utf-8?B?am1MUzZrTTFsSGNXZkJxUWpMSG81bEp3emhVZWNCdDhqR010RWdDY0FsaUdT?=
 =?utf-8?B?U2tiQTEyVGtXQlk0Q2lBL00ybWVEUmR2WEpHeEFMK0l4ek05YUVDbWw5U2JO?=
 =?utf-8?Q?XUJZc5RZUEp/deuxsMyw/2FeFcgebNYwJyEWvZ4zgJ8PF?=
X-MS-Exchange-AntiSpam-MessageData-1: UUvGj4MdaKwbtA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f7585e-cf3f-44e0-9d1a-08df3f146c8e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:46.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkBbH9V3XizePu+pRevarQZYIbBQNgYG50OeTV0ULODBZhonYcHlPorHsHbM3+IDPKBcfFFBx8dtyuicT0SbNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB111810

`dma_wr` takes the source of the transfer as a parameter and can derive
the value of the `FBIF_TRANSCFG` register from it. Do it so the caller
does not need to program this register beforehand, which could leave the
door open to bogus setups.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMNWO08EFJD8.D2G9X082FUKN@nvidia.com/
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index beac0b7ac57e..fb4f1cad867e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -566,7 +566,7 @@ fn dma_wr(
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
 
-        let dma_base = match src {
+        let (dma_base, fbif_target) = match src {
             FalconDmaSource::Sysmem(dma_obj) => {
                 // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
                 let end_offset = num_transfers
@@ -575,9 +575,12 @@ fn dma_wr(
                     .map(usize::from_safe_cast)
                     .ok_or(EOVERFLOW)?;
 
-                io_project!(dma_obj, [try: 0..end_offset]).dma_address()
+                (
+                    io_project!(dma_obj, [try: 0..end_offset]).dma_address(),
+                    FalconFbifTarget::CoherentSysmem,
+                )
             }
-            FalconDmaSource::Framebuffer { base } => base,
+            FalconDmaSource::Framebuffer { base } => (base, FalconFbifTarget::LocalFb),
         };
 
         if dma_base % DmaAddress::from(DMA_LEN) > 0 {
@@ -605,6 +608,12 @@ fn dma_wr(
             .with_size(DmaTrfCmdSize::Size256B)
             .with_falcon_mem(target_mem);
 
+        self.pfalcon
+            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
+                v.with_target(fbif_target)
+                    .with_mem_type(FalconFbifMemType::Physical)
+            });
+
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             self.pfalcon.write_reg(
@@ -655,11 +664,6 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
         };
 
         self.dma_reset();
-        self.pfalcon
-            .update(regs::NV_PFALCON_FBIF_TRANSCFG::at(0), |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            });
 
         self.dma_wr(
             FalconDmaSource::Sysmem(&dma_obj),

-- 
2.56.0

