Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793598430;
	b=HlCnx/NARhrSHVNdM/L9qO8yZCIW0yxwmU15ciYFF0C4kbgwp8YpGWcsqzQ4FnXUJwl6
	 VZL1fSMZgZ2yBU8I1cgI/aH54oHKpbAQUvwnwtigLgov5dcjDaLNv1ZpeF0YU0cR8UHvY
	 MPSki1+seDFX5TgchPbMv6bJspx7jq55oN7dFto0tYelbfbvaz/gOj5ORwMcEia3j07Zf
	 NucQNd1GUj7LYbwnMm9qvppn3wmyucc2DtRTzWS6H6ur1T0K7skejCoskHPYyFL3sjq/p
	 O8hBBO2h/MjreaFvW+2TE2seKk1Q1UW3TBIb6ao8yStxX8ov2b8zXUiljCIpwtIN1sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598430;
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
	bh=sJAkpN6NIEZB7YQ7I+1RuVIZNi41yHhQHxBec9BF57Q=;
	b=BVEFjqEIlB6ofzw2Bb796sLqBqEj4LmAcXFTE8roGsZL394saQgviLSx4PGeDvTt9jyB
	 QCVb5eVUPSNKm5FvWaf3GWjdZVVyc5XHQeeqre16egbDk+h79CI+OjUxCrwkRCBjO0IIF
	 G59NvakE2Tlyq0qXTXJeEzIGq4e0YXiI8IQCVTwKwsrb/TRlypJnIGQOVlwUGHCdnuNuj
	 OeyTG98MSGEKfRYqHZdSStxWVHhn1n92KP7S0vvBG9ujI59MZdTHid+f7JeAe/sOtlKnM
	 AHcZNAF7/NPMV8tYTvkkvmMQrwWMSyK8Eb5HltzphRsHDCREcFuvurRXd8+tRLGIkKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pmaEBEUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.71
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004E606A327
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 05:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9004E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pmaEBEUC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irsBFT/s6e2A2132KV+eLWrqQKyesQ/uoe1EjFVFRl8p/50zfdDlBB5D6e8yn1r2JZb3E3OZEOPsJRaEk5iPUV/SEIG47gQGUhH7Mr2yPmvGej4l2ySzdCJ6ea9ltsTeF+VhlAgYB3RacjSRvwKsg/dKtGzzlzohZRT/eemgaPwmykxNJcEuqnHR38t57Q5sSQr/yitK5HluY0Yph1B/OlCouwISQVZdEzC9AfTEPE8KKxyhkMZQswlQb3PXfGBTMz5ETob3LonR9aLV6PPbuAf3mAz/mPMOBnWsS4ugKUZj3xx1l0tLzKq1n5/3KOq+tkTkgcljiAZgXg2FvNqVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJAkpN6NIEZB7YQ7I+1RuVIZNi41yHhQHxBec9BF57Q=;
 b=af8A7KuGWA6X1WB7uxznl0e95P0xbvTU24JWJ5ioXq0JQgYFJzuk53nDo9Wx1nY5LzmGyctbuwZ4BgryBXfQvxIV2AIKXgoZ4gXEkBrdHESMhCTYKfvJTIqabcMn423c9QrD5HuM8ScuzkhpT2ri6FZB7EeOlqFUAW5DNiwxn5wy2AOzNrGLDUW0rlEFwdKltZz1ttGTKRd/nJ4QIjPHvKHvc1aO1bFR5rOTal+ydA130//BUWdGyAQb9LGrR99m/xzRqZmnsu8zJNgOPZ6RHY+WQQ9TB6bDt1hBYUtr2kusWg2r4uG5A8eKiZd9JY1WyKPVY8MbvBW6ZCzspvLD/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJAkpN6NIEZB7YQ7I+1RuVIZNi41yHhQHxBec9BF57Q=;
 b=pmaEBEUCyhQW31+mLD2ue6tayF4haMHjPYoMRDynCMF6tnNSkBJ+2POwKpHmcblmKR+jkDhVZuUVOKZVVKfgqXLyJ1mXrAYhD5HE4nK+tMF2W8bv85qVaYgsfu8eUCHSN6cV6hgWnwX/3Lp2GzCDJCxmmLvEQiOs/fBu6vockXGfZuv/ONt2JwVWT8cy3c461aRBQ5NzBckVkoQSLtq9S6ZeYsjTXXiUkE+TnQySf6CqkZFcUptooHMoM6HyjMqiuBFGr40ipp526GWNleRIFQaqPLaaKwO57Lz7y5mQSB5vpmXqbNpAs2471IGi0UVUdP0Gf2yTrL49rMBfptiLdw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 05:47:06 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:47:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 14:47:01 +0900
Message-Id: <DMKHKRWJ68ZW.1YZHCXE1NS0B9@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: cmdq: ring the GSP doorbell
 from the queue memory
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-3-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-3-f2befbcd8ba9@nvidia.com>
X-ClientProxiedBy: TYCP286CA0105.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::15) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 939fbd7f-aedd-41ce-2ea4-08df38a4b98c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10070799003|11063799006|4143699003|56012099006|261021121427099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uZXe76Zw18s4wzuZwIEUmg43l/0uAOLJ72E7ZbkKfRxXyGKRzSq5I81/PZhS7V8H9983Ik3TGgiIMUH5JX8shDRZC49aHwvdJ2aNTr2WSy2XgT1czubzmgWQSvqsoUgyBz4TZIGJ2WaDNYBJC9lbovYGxpwiVdwPz5eB1owlSdTu+rDseC3gGEFi4CXPp5D3zDSp92wwYdMyB0QX4Mz5e9xwOF7qQkBCeKNjIoj/CinpMDXd+47EyTdsAv2xgqqq0EGSTYcAQIV89YgTFW2BYHFyE1kQvZhfcuNSBuxllHGb/d5xuW0OVPLg1isVqZQyuLyY1s9twXMsxbRSZcJ1dHjfeE3uy+sFBAMFnbSHaUXHmwCVHY9/e31C43R+zeSmi55HZMHeDuXc/B4cLqeE2cbpE+1qEs6kSPZP+mSwEhY3VquO27DjP0kgulYikviah/PJyUb65enzLBmVkH5sVhXuqrGF9KdDWUfnbA55bnOYwENvJgfopx01zrm+w8F+NziC6yLnjPrQQL7pz4KU4nMXN4LoCN2yKJC31YaI0m4hFhl+uvUImOn5CX6BeKnKXwMHJGvhC8wpm4Y9KMiZ1BGdUQLg0x043brRMuwhSOs9NXYbAnzYRNexyK5VeKQgaKV0ttfBgQq9+bqpM6zs2UXDi/sNHdZ132kPbI3QGUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10070799003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261026121527099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRUMGZERmpQVmcrM3ljcEZueUtobDIrSXRIUDBoWTFocUQ3ck9xWWpGSmFx?=
 =?utf-8?B?RG5CUW9DcStac0R0VVJHelZyek52YWxFaEN3Yll6MENUYmZZK2tKZWxJOERB?=
 =?utf-8?B?ZDdCZGlTNVVhRGQ0ZU5qL0l3MkxRMytCdmNxSHd3d1NsL3lOLytOdzhTNXFW?=
 =?utf-8?B?OUUvT2xmNWQ2OFowQldPRHNFV01kTVdZSWpWYllpS2xaYVE4TUk4RkFFOWZI?=
 =?utf-8?B?S2tVc3dYL0lyZjcxbG5IakN6SDlLZDd1V1V2SUxoUXZ4TnJZd2Z6Umh5U29k?=
 =?utf-8?B?amNuOGdjSWo4cVpsc2V5NzRhN1NtOW1HdWRLQ2hoZGVDVnpIM013c1FaSWpT?=
 =?utf-8?B?dnhIZ3hUT1R4Q1c0RG8yUUR6TVBFK3IrNWtuazNwbW41aDRuTlJkTW96SDQw?=
 =?utf-8?B?V2hvYTV3NFNHSmdkaUpPMG51aE1RSktjenFDeUlFdnF6YmtydUlvV3ZCRXpj?=
 =?utf-8?B?REtuRHh2dHdFSCtnWW9VUkR5d2ZNYTk2d3JKNlRpZnRDNkhxeks1a3hOaDdI?=
 =?utf-8?B?aWhmOTByYzQwYW5nbVJDemVCcm1ySFAvUlZIYnd4RHN2MDY2bThCbktuNUsw?=
 =?utf-8?B?TUd3T1NLVy9Bd21UcFAzY1FEdVhGNENpSTk2dDRRWEFMaGlaTGRTdHQ2bkRh?=
 =?utf-8?B?RkJpVGNmcTRTZjNnTnRHWk5VTktQdDlwRkkyS2NkSk9YQXpPK3hMcHo5Q29W?=
 =?utf-8?B?SDhraG5Lc1Q0S0dId05OOUsxRndSK1VmNGhSV1c1eWtxRm4xYkdNazQyV3Mx?=
 =?utf-8?B?MGo5ak1QMWhYejhQTFc0c24wQjBWaHFrcDQxZGFRbWpMZklXOGhEL2R2bnlj?=
 =?utf-8?B?TVViSHdEdTNOdFZOeEt0NGwycG05VkdidTJEU3lZUUtBblEvT3FldTlmaVpS?=
 =?utf-8?B?dDNpcHlwUEpackdmV0kyaUdoUTFVSm9PbGVKSmlVSzh4Wm9UNTVoNis1QWtp?=
 =?utf-8?B?WG5ydlg5ak5yNzg2eHQ1WERuL0UzQ2F6UDdidmVXQnRKYitLWTJMYUlldmJn?=
 =?utf-8?B?UUZmT2FsZ1RYdVJVMGxjNmdSYVdUQmRlalpVMGQyVEJBdWM1enhoYlVXcWY5?=
 =?utf-8?B?SG0waEJGQmc3UmxmcEVDZkh3YlhHYnZuV1JOWHlYczBBaHJYeFhoTFJ5Mllz?=
 =?utf-8?B?TVlVczY4WUN5aXU5dTk1U0ozeFFvT3g2UStnQ0dNUXJpR2RxZC9mQUExb0Mv?=
 =?utf-8?B?dkExemVUNDlzVlhva2VVZ2xySUVtTW55Ylg1UWYyTVlSOHhCVXJkV3lCTys5?=
 =?utf-8?B?VGdjYktkM3ZFbW14c1UvcEh4THNCSHdwamhEWndyVW0wWjlrRUxDR0Z5S0FO?=
 =?utf-8?B?SjF4UENoeXFtQ1ZsR1ZYYUE4cDRsZ3ZLZENPTTY5UDNVdTFlT3pZZm1sdGF2?=
 =?utf-8?B?Qi94ZWI0TTE2VlVDd294MDJWTldPc3ZKcDl1VFN5T2MycE9NUjlkdS9uK2gy?=
 =?utf-8?B?S3l4MEdGeTdvQ3pPZk5hUDdRT2hqdEcvWGNWQm1aa0FxOXNWV3ZvbWQ4TzlM?=
 =?utf-8?B?U0FqUitXSVVvSjBSNzI4ZGc3blMva1kvYU1BcjkzTFc3c2NTQXRuT3pESW1z?=
 =?utf-8?B?Qk10MWxTMkJqamFMandzMnRjdjBZcjdWOEJEajVkWER1OTFIZU5NT0hRMWR2?=
 =?utf-8?B?amhnZEpGZ2d2L2t6Rjhxc3VsN0FjQytBZkl5SlVJZEd3ZmprRk9QU0JGK3I2?=
 =?utf-8?B?Ly8vL1dhNE9hY3dyem5MUmsvaTUvL1habkVmenVsLytsQUExbVRQN0R5dGEx?=
 =?utf-8?B?RHhQanNrbHh2RTVlMERHNlM1ZTNKb05kWk9jUmJ3RjhHM085WXh4NkhKZVVi?=
 =?utf-8?B?Uk1hcFpIQWZPcThGZndJTm5JM3pHbmV3TkNFR2NOREVFNElsaGJXbXpUcXM1?=
 =?utf-8?B?cTNuUDVxa1lna05MY2NIWlRCRVBWTjdPaisyczY4TEExazVTVVlZcE96YXM2?=
 =?utf-8?B?RG9OeVRnU0tEd2Zmc2JYYVorOUhmVEJ0cS9zYWJKdEtpUGIwUEt1S1lQcERT?=
 =?utf-8?B?MUp4VFR6TFpwdDF3dlZ3ci8xM2FDRUtmNG5RdFhWU1B1QUNkNlNDb3B1Ri9u?=
 =?utf-8?B?dkJoZXA2bEZ6Mng3MDN1UmVBMG1lOGQrRUVGRVB1ay85YkFHYjJpT0tWanhX?=
 =?utf-8?B?SUp3bDhCeEc0TlpNcG9vZVNadms4RHNyb2g0MjdCWXZtcFlVQXRGOW4xdHFE?=
 =?utf-8?B?QjJWTUkzdm1Xd3hQL2tpbWU3ZkcyakFVZTVnSDhhMUpNaG1nUllqNzN1K2wy?=
 =?utf-8?B?SnpjVHpPZVZqQmEvVXUzblVLV1lIcVI0R09GK21VVkxENUZ6aU0rOVZzd2xQ?=
 =?utf-8?B?USttMEltUjdQL0hNVTNtbnhnMjBrbm1GR2lDQ0QzYVh4VDBWbE5IbHlCNG5t?=
 =?utf-8?Q?C7sFPoPhxTB2khXs+bTMz6y2l24+nxMLYuqxQmcCrMqbo?=
X-MS-Exchange-AntiSpam-MessageData-1: PtlNymhkdnoTqA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939fbd7f-aedd-41ce-2ea4-08df38a4b98c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:47:04.9821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6SuIEgPm0lzdxfZ0TJlspc5b2q+gRuMMT3UyfOnMtiytomqyTqvH8PwLbe9biBkOCL5aseGlwfGV0nL9KDCcSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

On Fri Oct 30, 2026 at 4:41 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> A command reaches GSP-RM in two steps. The driver advances the command
> queue's write pointer, which publishes the command, and then writes
> NV_PGSP_QUEUE_HEAD, which interrupts the GSP so that it reads the queue.
> In msgq v0, the write pointer is in the queue's shared-memory header, so
> the two steps are two writes. In msgq v2, the write pointer is
> NV_PGSP_QUEUE_HEAD itself, so one register write does both.
>
> Nova-core split the two steps across two types. The queue memory type
> advanced the write pointer in shared memory, and the command queue type
> then rang the doorbell through a BAR0 mapping that it held for that one
> purpose.
>
> Move the BAR0 mapping into the queue memory type, and ring the doorbell
> at the end of the operation that advances the write pointer in order to
> prepare for the switch to msgq v2.
>
> No functional change intended.
>
> [ acourbot: slightly reword and trim commit message. ]
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

