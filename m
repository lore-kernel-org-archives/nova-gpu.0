Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793945680;
	b=Y0gjNSAtJrQZwjzPKCKiM+/sNlxuYcsGwO9kpF75AE2shY1J3TW7XMkug70gxVaCEPxG
	 mDaJ/8lXHh18SF1QO0VLQiyHkqaJaluug2wgQwJH0BYyJgFRbvGcoldOc5eoJQFhEdTXB
	 1mrC2rHadTIGhPZih60gSPP4iEbcDk8GuIsG75J8i+f4Nx7xRUUBdVgeXTQ513G5RoTfv
	 Oe4dk9uq1Ex+NbazIKaa+m/QLAbc0EObD9ERg2UC4NvPkKb4g3KEr4lJjxgXACZ3HPGz1
	 g6gQKcxINpNVu6AumndtsNxKxCbz2aFCEnpfI0inDK1d3W0xFMT93S9jN7xpWQYvuhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945680;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=3Q1duo3QjofSTerlEHZho2qC2y1WsA0WLpsLxRU0Fuk=;
	b=ihKumhX7o+tapkLbiDTGBJD2yYhv5ARRcQMwKFGeTiHM1WhVxH2Zs2cenJAHDAT4ZGSw
	 UJ560QSVvBdfOAGPOyoU7hUt/kSntt/SBUIWsAlkERncUTEd/aXRU7zmhbC4tVWygYY1d
	 FqmBa6jO2cP3jCZ3ezL+I4Hoqsp10rg9WIrcA3wOP3xy/wWEOXnh/PQ3pg8G0vhVZjQKi
	 wNmYbDdEwOLOID4MmO1L5GpNYaVFtziHgwgKj9z/8jZU5O/K5UWwxoTMc1xsLeQU9icEd
	 fFXviVupxrzxZ4OqfYrvnm6FKnENWRQD/5DfU03v/gb2588e4wbaX3LSl92/osJu1Eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="WN/ohylU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.46
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012046.outbound.protection.outlook.com [52.101.43.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B67606A328
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 06:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1B67606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WN/ohylU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+pCYWpzmgl5CNVVSaUKbstl+/GzRB3bfDitLoDq4pq30Y266KDMs3qL1ZyUKRGMWMxZV6TPMpA65NRdLgn5nujuTlo7axNMA7TWL0uGK2Y5G51LwyFpyJoFJXZvEsLU7rW1w2u5xX1gMrMpDVcT/HlPte5bcf8CFuAHF0z0X2chZLFQf/0yeMNgDyZFo7gcshiGlt130Es9zinNtoKPzJeTZHoebfIdK6495uqqWdkSNev/RWRmff9sf30PkD9PyR3qaKvhUNVEMGKZpnuUyW8RIZHVwCq3kgM6LNLv6VehuRU75gkpUyRWy89M3FvO3nstEqy708ZLtRCOeAziZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Q1duo3QjofSTerlEHZho2qC2y1WsA0WLpsLxRU0Fuk=;
 b=HjP3G6ik7mr2dxAwSDiE2ROlQXCxu7INGXlD94p4RhQOhKGwxNVR++0biZ/sgEMM8AzIlzqMNdp12tv7uHz9udhselDh/LwXpLriRu4DgZBll31OgieCqJPiiAjrwfpZZoMaI0a/xKIy3SDWFUfwMxwYcziJoWtwfYDVuv1VBsE76EpNtYlT62kvzmnMlbNl8o/4Vf1VBQB7Ys/i2BAtg64d5iyJ6CWpQNKLIr7BiSTGVPHAWT8aDlaxLO5CJ/NeoI+FfEZwX9tb7F3xlRHaz+7vcqKv+pChEGBomFBvtTxwJ34F7QBqBxi1CoYSgKxLapxWYGXfSu1WEdIrOkzUxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Q1duo3QjofSTerlEHZho2qC2y1WsA0WLpsLxRU0Fuk=;
 b=WN/ohylUsMpBu0kikXloBnUZ13wKnwUwyc6wBVp3ryM/T2pkezVabn1lJDC8ootDE3T6FAuNxmQW6FrpHFVCfg50GYWbcjEQspBaS29de/fGAG/0boZr0R9hKQAz5G0L8wkbcGdByF3UnZJvJ51aY8lHGr3yQan/0XlhDknWY1Ke8AEPAkvE2IWK/lORBdEc99l0ic7mTlXGSqZWjAV89uVxkMLcGJkrzp9eVxzeF6LRReHU4wnCkeX67blWWfX9Kj+ro7WHz58LKDs5bIqYBYsXMOQCKePqYvYXoH1yBadxwPxkOZTxQbTYob0HeCUZA25u27/QstMEyFFMfIJPhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 06:14:35 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 06:14:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 15:14:31 +0900
Message-Id: <DMNWO08EFJD8.D2G9X082FUKN@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: falcon: allow DMA transfers to read
 from a framebuffer address
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-6-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-6-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::20) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 670c55e5-de5c-4328-1af3-08df3bcd3a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|11063799006|4143699003|56012099006|261022115727099003|261022075727099003|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MGl+vdL1vbtpL/ERwyIqvZauDMzkWEHB47DmYMKpf7lGAodtGAFDiQiIGEg6Et7hMi1obZnJFK98YZP8OVDmQxUG2Wzahhrm59h5ZQHr1FGN+ILpxjBUt/SsDh8klD9fkPYsoR+PPiGX30YCSZSZ0pMBDbk67mU3cNhQmKSSs6IrNyoV2/h+9ZhbrsMR2gGtdyufUKJ66nXfePxV2AatRHhJ35CCPi6rnZcqt6Ze+kEUhBcaeO/zgKHdnAatgQN1jdR4fbaW1mXWfLYOo9Vzo8blZai7Q5GRDkS+ra8YoUJCz+GLN6lM2j+1WFyGTwib8zucERlU1mrkOcFX2ERrFnU/1y7pCPdUipNvjasdR/nS19sl1/u/Fp5TaOUe+w0wUD/tfMFI/JNWz6Q2JKsMfubiCkl40Nr3oz8MBWJRLwTuQ4YP5KT6P1yPYRWkyMs0wDTJGCYLHkWYIXMw4dgvl75wGHVRdHnvEyOT6LEtX3v9m2uMQ7nQhvQPDoZNN4nOBDLa1T4JlZrMsVCq2xhVR2E6462RJYYUI3KBzhIMwTx0wodRQNSLYuBsZGc9WdCX8KjT9u1VA8mgSb0RfSX9AsnUY2Q09Oy3wzPRnQofZSMjF6Na2ks4DsFXR4bi5m6mCYdG8cEVdEbR6vYhuYVhRsTh4JSDRhurf/UwS6XjCT0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(261022115727099003)(261022075727099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhwSkE2ZzFlSkhUMHp0TG5mOXJSUXZIbkZtUEtqeFJEQjlpbzNMQUdrallk?=
 =?utf-8?B?YVhyL3pIYXl0ZFVDaUk5VFpzalF4MS9QSXQ2REg1My9aMTlqTDlwaXhBY0RJ?=
 =?utf-8?B?MnN2WFRsazVTa0RpajVqVlBWWWc1NHV0ODF0aW8zWGhjbjcxZkM0dGtVWnZ1?=
 =?utf-8?B?cjZhWWlkUzJ1MENxM2lsa3ZrTG51N2JwRVhCV2ZJclkwalRXZDNlT00rL0hR?=
 =?utf-8?B?WHpGRE9YWXBoaFp2N05XMkQ4clJheDlXY1pvY3ZIWFdWZjBXRWNDc1pXRWp6?=
 =?utf-8?B?YkVPRkpyRE5tNHNTTXNEZmE1ZWl2K0FnMWpjbjRaQzY1TUNFOWovL1dheTBp?=
 =?utf-8?B?T01qTmxoaXVkQW13OWVMSytCd01zQ3hrbVdpS1BKRnBCcjBEdVNwTlRlZmxm?=
 =?utf-8?B?bmd4SCtrSHV4WXpHRzBKa0dNbDFxYmhUdmkrZXZyZEM5RFRyU3FqK3pMSHZy?=
 =?utf-8?B?eTZha0RLSjJCQ25jS0Fhb1l1ZFErTGhVUFhHWWs3NGtvNGhueElwbDBWVDBC?=
 =?utf-8?B?bXp2NHF5L2hKRXUvR3JmbXlvRGlJOGs1QmNMcUlPdEEwYW1jb3gwd2xRRWQz?=
 =?utf-8?B?VWFOZ3UzU3MvUGZpSU9vTmRzKzh2UktWYTR6NXEzdmdEdW1taFVQd3BlL2Nu?=
 =?utf-8?B?M0N5YU5pTXJJM0RkMHJUeTBzaUp3eVBBUTVyV201OUdJSytBcnBOODJqR3ZG?=
 =?utf-8?B?a1pNYnA2T1lDMEpZMElmeTdlVjNKbWRzOEZZdisyeHUyYjNtVFN1SGZqTUlj?=
 =?utf-8?B?KzFJOFlMZGdtNnVKekMvOG8veVNJM2I5N0xIL0NDaFNKOHBJcGZkeWZCYzlH?=
 =?utf-8?B?cnRSRnJTMDRMNmlGZnVGU0g0TUo1d3FEcG5pTklHOStiNXpYd1JoWjVCVFk1?=
 =?utf-8?B?Q1FmaW04ZEU1OHdkNlltQWNpdnVTMEJLZXk1cUNVZDA0VXFvUXRzamlETldG?=
 =?utf-8?B?SW9Odi9xTS83eisvZG9NUlhSV3lnMG5VRXVmdGlibGxncSthb2VPRjZSUDJw?=
 =?utf-8?B?UzNLZU9BUkRhbTdzbUNOMnB5THJTenY1N3dOeG92S1BUYVhnRWs5YTVNaXg3?=
 =?utf-8?B?YTFYVG9yTU1SNjNzNnBxMkQ3RVp5RVJGR3JIUEUvbngzRUNzU1BydExReHdV?=
 =?utf-8?B?ZW5GcndZeGZzTFhGM2lRQmpJcHE2cnRYVnBOTjU3ZDZrNWtBdXoyeGdlbVZH?=
 =?utf-8?B?VWZQMUNUWDR5YnZ3ZmNzUGtuUEZlUmtVenVLV2I4M3pBeEdaYTJFZ21jL29z?=
 =?utf-8?B?MjZBRVVFTGhEQkR5eVQvZ0tqL3JtV0FzYlVmdnB2K0ZXRGVaSWRka004ZlVz?=
 =?utf-8?B?YVJyK2NDT3NxTjVxT0RBV3NDOXZhOUJqM050alQ0MktndlIyZmg1WFFyT3Q1?=
 =?utf-8?B?aklEdVRjR1kzcEFzc0J1QVYva0s3b1E5V1dWUjV1NFZKbk9JUzQ4RVRpUitR?=
 =?utf-8?B?MU1sSjhuT0syQVZMalpDT0JGQ1RGUFRuS1Ria1FsaUU5UG9SNE5pcnA3Si9y?=
 =?utf-8?B?U1JvSFZTRUNtVlYxaFRBdGJUN0RaRzkyYkdzdVFtRm1VVlBaam9GQmp6bDV3?=
 =?utf-8?B?YnNNbytBOU5NVEwwMm1wWTdMVll5VXZoeGh3YTdqd3EyeEQvaU5aWUZ2dXZI?=
 =?utf-8?B?N0tTR29SZndkNEJDY25YSFI2cHB6cU15SHlvVTNSWVQvVjhCVWZhRzBpb2Zw?=
 =?utf-8?B?S2pNbmhVMFZkRm5mMFd0amptVWthcGpSdXFQM3ljSDEyYlpiem5aZElGS1Q1?=
 =?utf-8?B?cE5PNEpXSTBFcFpQa0Iwc0t5Yy9mY0VwVk9EYnlwbDZzaGR6MG5WSVZ0Yk9J?=
 =?utf-8?B?Y2k4cndkNW9MaytXUlpTR1NncXcxb0luSzJoTDFCc2RheWJMODRZajVIRU9r?=
 =?utf-8?B?dXBJUGFpQkczTFBBTW8vQ2NubUt3WGUxakVndlc2MjZvak5TRmhZa0lUZW9D?=
 =?utf-8?B?OUhUMjhYbDk5Z3JwemVic2JWY1hYYWN6aE1KZWJ5WmV1M1d3cEZzQWtacWhm?=
 =?utf-8?B?VENGRm9VcHo1N1gwSzgvRlY1RTlhRTNZSU1GNW9PdnVvYmo1RXNYY2UrK2Rj?=
 =?utf-8?B?N0poTTZkNWdIUyttUEo2dEkrU2pWRGxVTXBOb1NMS3dEMC9TY0FGZkNUaTNv?=
 =?utf-8?B?SjZWajZUaWV3Z3U1VmFKL21vMGZzOE9YbFZhVkNCaEdicDRkSHJIOHBPQ0pi?=
 =?utf-8?B?c2NSOVJsM09KNlBBaTArR1lDcnFWRTVjS1dOWjc1cS9zQklzTUZmZmdHUzg0?=
 =?utf-8?B?SWhvTVZNSFJySnJ4QkRtbWlXZ0VORHU4RE5KbUoyYlZrd21DUEJpTjRCSWFM?=
 =?utf-8?B?b3BRNnRhMDYvZlVtM1ZtWXhXUDBNUlpoS25PMFlpQ0R3NU1uanhTSTJRbVVs?=
 =?utf-8?Q?SmRqprjiZk2oidH1pp9R/YOMncrsen2UdDbi84J5wFT1x?=
X-MS-Exchange-AntiSpam-MessageData-1: vsqRurWzS53OPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670c55e5-de5c-4328-1af3-08df3bcd3a78
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:14:34.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: scQ75px1EOvGXveWE+Y52fecd4ZBPolJLvjMAMQO014drLnMm2SXwt/dydyqUJhAx6hLA5Mlu7T32LzKY9Ib3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> The r000 boot protocol has a load-and-execute event in which GSP-RM asks
> the driver to load a Heavy-Secured binary from framebuffer memory into
> the GSP falcon's memory by DMA in order to run it.
>
> Nova-core's falcon DMA loading method currently only supports loading
> from a DMA object that the driver had allocated, so there is no way to
> copy an image from framebuffer memory that an event supplied.
>
> Address this by making the source of a falcon DMA transfer an enum,
> which can be either a DMA object, or a GPU framebuffer address.
>
> The framebuffer address source has no user yet, but will be used by the
> r000 boot protocol.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

> @@ -626,9 +649,13 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falcon=
DmaLoadable>(&self, fw: &F) ->
>                      .with_mem_type(FalconFbifMemType::Physical)
>              });
> =20

Suggest moving the NV_PFALCON_FBIF_TRANSCFG write into dma_wr because
once we make the source configurable (i.e. allowing vram as a source)
it's now possible to call dma_wr with a bogus NV_PFALCON_FBIF_TRANSCFG
setup with the wrong FalconFbifTarget (but that's determinable from
`FalconDmaSource`).

> -        self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_pa=
rams())?;
>          self.dma_wr(
> -            &dma_obj,
> +            FalconDmaSource::Sysmem(&dma_obj),
> +            FalconMem::ImemSecure,
> +            fw.imem_sec_load_params(),
> +        )?;
> +        self.dma_wr(
> +            FalconDmaSource::Sysmem(&dma_obj),
>              FalconMem::Dmem { tag: false },
>              fw.dmem_load_params(),
>          )?;


