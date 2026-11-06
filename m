Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793957904;
	b=fD9H+NuN93qLHY+7F7DzXACZxmM78K/F7IHa2eiUXsMZNWImfiMHMDH0P7YVgkzn2dVz
	 UJqfxJ6eTvlHiFs7hehIUJf2y6/24VfqSxEWV1SIEddM5mjHSnuEWBeJ9NCnrEzOt16MI
	 Zsq1Tyad1kWy20AcaQsj6zMWNtDfeuNeL3mQbw8Ukm7ygPM/JheQ1Hc/bUy4JOJS5uwEJ
	 iSN9Ri5cE8Vqi0G7B/O/VvQpQEmF1mOKtefy6XhQOVqMJ7NHm52Xg4Z8oTA2wFGDDkaCK
	 kyRob17bBqQXyPXA5jDJ5qlghdUfeFETHDZXa+ByGr3IJm0biTzKSLD4XFEGqW1U1Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957904;
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
	bh=4pASeczsfAPIXt3nPtfeQvSr5gwCz28MiNnaRIHWAkU=;
	b=K9xw8A8COJimT5sZFnqOu27bm/KkdSpDgG474kxoT2gPrg3iLifLpvEmFxr9Lg1KXL/g
	 aTRCLDID0EH1PgmEXOvom3tm0J1OKAX4AEmMwj1/WlD7oIlCGsEgvFhp+Z1u9JGfJuNXX
	 icP0Nf9jQYVQlseQnm3FQ3tWljSl9zwBDRukcSH8KAHORA0a/o1EBYqYTUfnNTN48NeUz
	 NA5chkNUA9udhekj9dI2Wz7+8+bw2vrBwBympfGTYD/JGA0naB801EPQGpnLu49b9QhkQ
	 x3mHQY9qBIjg/PI+ChS9jlYOaLOS0t6eP7vHQBr09AArX8Vl4nwSFqZJ7EkaBsY+SHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n+Ue+unc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.57
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB81606EE8B
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 09:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB81606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=n+Ue+unc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQ//saiSZcVcWZ81XktXp1Z0bhww/gWQNojTgBs9tozOWWvNnhMqpmaNvCjhy139GTnCBUr2b8q51Z2RkcRTYPVwq3CxEMHiNMC/n7xHO8S4BskeBfB8scpZWklw0BrRhSQUv3sogIF0+FoOZa+sm3NtzvmPoW2gJ0yQo0kbhnnoYGjySLViPZdtr2J2B1qCzpiGcEZuFgOVXYr+A66gJPYzUhM0gL66ywREb2hQrhfnjUj6Y7RXjCfZtP4vIIPNnu5fwK/1CViBBCvaO3CMKcQ0XQ9CyVSZ3ikP/nqrCTyDvHMbVu7TbivI34bn9Re2TZKr93RlAtRa9aw7DGWJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pASeczsfAPIXt3nPtfeQvSr5gwCz28MiNnaRIHWAkU=;
 b=bUDkTC/ENU2K3wQVeNXybYUliVo5X/krRQvuIERSxI2tpKorV5LBkIiLmQM1mo1w3pTDcxRRKLvzkX4npWPFDI95B6BXWLPET34h8hgIs+FBTpQipeF9GoLFT7kvz8y1XvM7t5BUHfqG7Bq/VhP/wVI9VF++4qHgYYSVklhB5wuwfl7qdt1GQ5MgiDnRTQJionphQPummfBRVct6+wWnPLesLaQbEqO8PmYIlzaKjevBXqU2zJtokXKAEZSUBLwF4zOLjBGp6RHAuRZ5iYGCT00eBUFBucYclOFPeDWfZrSgBmqrnTcGMZIz6cMCkRsNAgi8RK6g6qlCXgtS7ZnXoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pASeczsfAPIXt3nPtfeQvSr5gwCz28MiNnaRIHWAkU=;
 b=n+Ue+uncndruaCdXegigw8oQ9/SGoPriDO5ruDi+sd7bQMbqosJ1swzPA/1q6WRXL4Rv/6BUnsSssfSa5bUcNV3P+jufRhKJceGPjsd+7glWDwzrkHSdx9qKHv4J9+wPhxlb/cjAovWdnzwnEJ7ymM1yjOVayAOwAKSHQvp0ZkOmF331OXYp16yqHZge8Ou3+L9UmHAsTi3fnWqXZNMTNvvPyOtIy9ko0O06Ln/MgMfa2EpCjxeHTahfsH3b8JlVRMdgmAjaIuXUgPLheK85uIhEb5MBAYKkd8nZn1lmB81ioKx+cmuC7+KmjptNQuae9f2hEcmdBKDvzEswGq4H3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SJ0PR12MB5636.namprd12.prod.outlook.com (2603:10b6:a03:42b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 09:38:19 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 09:38:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 18:38:16 +0900
Message-Id: <DMO1007F9PCN.X7VPTFMFVQNL@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] gpu: nova-core: gsp: cmdq: add the GMC receive
 path
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
 <20261106-r000_rebase_on_cmdq-rpc-v2-6-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-6-e481ea2168ef@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::14) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SJ0PR12MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: f3172b73-22a9-4fb2-1f5f-08df3be9b102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|6133799003|10067099003|22082099003|18002099003|261022105027099003|4143699003|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261102123227099003|261026121527099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1wH+BkjFz0xE8ZCv4x9OVHPX50xFvVBjGzJuiEZtqi1SbMJKXyw70Zed137mAA6PItUvVbaVpCtKQpGniCKauof79m9jpIWUvLJcG+4ZfL1j4aaLnaGMlFPwkwa4OPFFJWX2/fICH/7XB2H5Hkyp6rWDIZBLMK+SXfRFPN6yCscBGo7QXKH16CMQ2A0D+AWLcAxGv5Zqo7bz91zbFwTVkG/+Z/KXrbZdUrJO4spzz6FQ6aGNauBlefAPgmiHuUmQocIAUsAEHU2E+8eIUmZWWIvHoxAvZ6hkU7+/fnd76QoxJnauOdtF06Hb31a5b3EEhCEJuJ62PoFtqeqAli/dnnSUSZ0f/UIrIf3lmFdBDI5B8LRe6lQSUWKCq8I8LICBPX9UL1dn/xZhoBtqRVctixp03dB9ws59nMqgxlsPb7WlLkfAg920KvIyRSCpqHWGpBvo6V/AGrLMdc5PPhLI00waPxXJYNv3oh6/GjlxDdUk1wsjATIILVmR9Wty/9LAi7M40kfTAtDGMKlxdz7Xpey2togF6CIsIk+tifqDuE5eaLR3Z5Tslylc3oTEo1MuIcaB+y4X7OZ588LClRNciwdO6S4JSv4PRgVQNz/kx31OERFTppti/QMb9t6vIEOVj0DPDril+XkvRVpaPa0kRrqkHPafNdkrIefRi2dAljg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(10067099003)(22082099003)(18002099003)(261022105027099003)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261102123227099003)(261026121527099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UTRpVXZsblFBK0w4MEtLTFI4SkZvcVAzTXdvbjNIN2tSR1lsSGpLUFY4eVpm?=
 =?utf-8?B?cG85ajJXalBjdW9wb1kvQ0NISjEvNmF3c2JnWCtTUEpsbHYrYk5LMTdZR0Rn?=
 =?utf-8?B?MFZGTXdzdlVtR3NacGdxZG9CZmY2ZGt4WlcxMmd0ZGdFblhCekNkWkJtZ0xu?=
 =?utf-8?B?SDNwWnZNL29LUCtrbWErTjJiY2UzRUVKeW5lVWVjeWRVSytuQ0kwS1lvT3dZ?=
 =?utf-8?B?Q2M3RXlLVlRVSmFSMGd0OU5RUXNzSG5WYU8rV1JqcytaSUFaVVorblVCeVRo?=
 =?utf-8?B?U3BkZU5YOEtIODE2WVYrOVhhMkRudlIvSEhxUEZuMHpBVm9zVnN2Wnk4RnFz?=
 =?utf-8?B?ZW9KNXZBQzJKdDZBNHZXZ05TL25janFQc0t3dEx6U2JiQ3oxRjNYVkJudWN5?=
 =?utf-8?B?dkJqWHp1bFAyNlBUSi9IcWZPWC9uT1FlekcvN292Q0xVR0wzTGh1NThHMHl2?=
 =?utf-8?B?UFlpZXNSVk5FTE9GSHdOL2F1R3BtSGJ2aUVjZVhkSDZRbGlGdUNOOEJERE5U?=
 =?utf-8?B?ZHVhc0JBOElKWlpFRk5DL01iZit6d0ZFWlZJaytVSmRiNG56QUxOUXkxOE5D?=
 =?utf-8?B?bWkvSTdJdGs4MitNL1RQb3ZNT2ZVSzlVVjRvQzliNnA1a3ZkbHBOSWtMVzJU?=
 =?utf-8?B?dW1oOFFXRnl5MWtyd0prSnJKdlA4UWhjZDBWdEkrMnV5dm9pcVBlV1BEeHEv?=
 =?utf-8?B?VUl2c2NCb0lWTG1WaUJpWENQRE85T2ZhYlBlVlpXdXB3RnZqMDZ3dm44QVZl?=
 =?utf-8?B?elI5bUlMbzduUVcwRHNYbUVXRm9MbGtFZElwR2hkbE5OUnFQY0tldEZNaEFW?=
 =?utf-8?B?YU9VallHTnNRaGI1TkZsbi85S3FrRDVCUk1VQkJOamplUnFnZ3NqanBTK2NO?=
 =?utf-8?B?SDN1enFlK3hoMXdxNHhJRWNjdzY5NGp1cjJNMUl4WWg0ZE41QzB6RlhlYzVn?=
 =?utf-8?B?a2J6QTlUaVdXYUhER2hzQVhHaVBTdWN1VE1DMjJjNkFYclVIdEo0elJOM3dx?=
 =?utf-8?B?RCsyNEN4K3ZiZ3pZSFVYZHovaWV5eWo0ZHZiMFJmeEpzRk0zdjQrWlFXRUFN?=
 =?utf-8?B?cHlyVHE1dXNEZDczRVBmb01ZYUFOSVRJZ3ZKSjlFRVhlUXlSNE05Q0VvV2E4?=
 =?utf-8?B?WFBQY3hoTDZoUG9CYVN4eUJRNGJNRmdNbXNRcjB1M2FUdGt1djlEOGdYbjZ1?=
 =?utf-8?B?bUxtd0pxZTNhdGRKU2RLenR1VnJCOGNYSi9KVmZqbjNMbUhORDJIZi9MVGZz?=
 =?utf-8?B?MjNya3NmSFVFd0JZNXJJOTBBdzY2MjQ5U2U4QVhpUjBzUDZzK1dmQ2ZiM0N0?=
 =?utf-8?B?aFRQNERwYUtaZjdqdnZHS0JjQlBHUGFYQS9UckQrYXE1M2E5ZkRjdG8rSlBr?=
 =?utf-8?B?cS9ZY2ZVbjVkckI0S203VWNCUEQrYytFZ0R3Unp2dzlyQ2E1U1kvb09iNEl3?=
 =?utf-8?B?c0RlK21Sc1BpSm1vaU1YTnZzNCtMaENsYTlYU0FVWEo1eUMzcnM4a1JhMEZD?=
 =?utf-8?B?K2ZtR21scW9hUFlvQThkMlRnSDc4MHpzdDFrQ051ODNobnJ1WTg4TFJ0US9F?=
 =?utf-8?B?M0JlSGtiL0dRaG9ITDBpU2hjc3F0dVF1bGRXeTVKU0hvOFNWVkVYY3pIeDl5?=
 =?utf-8?B?MlV2dzVsSjh1T1BaMklaVzhsVmZJY2ZnbWlsNkw0bDRDemcyengrWlRNLzFm?=
 =?utf-8?B?cWN5dERwTlJBK3Y2b01nNGo5NUptU0VNUm94N3BKeDVITkVjU0gya0hoMVVY?=
 =?utf-8?B?Mkphak5nVmhkQ3MyeVpzWk9Vd0ZqcEpCWDlmUHQ4elhHQmJudzVBcDJibUpr?=
 =?utf-8?B?U3VGbnhKdUg3RVF2MUxCVlFOOFJCVmlGWXlMQ3NjUmt2VEZnbnBWT1hZTzc0?=
 =?utf-8?B?QlJBOWJiNnVaaHFsTllLRTFlOXlIS3dOelpybFcvVGFaNDZ2T2NSbEdBclRq?=
 =?utf-8?B?TjYySk9kRlB3d2R1U1pOekE0VnAyaUpLQStRR2k3OEY4VGdCMTZQZnd2K0F6?=
 =?utf-8?B?K1VYalNLRElNMWR0RW9IZGZjeWNFUnpyTEdwL1dhVFIyNVlhQVo2RGlWT0xD?=
 =?utf-8?B?RU1hL1hwK3RzVVcwOGNhS1lEK1lHTC9tNFRYZ2wxZllHbUw0aDdUdzg3Q0cx?=
 =?utf-8?B?aXZveUtheFI5bUZZS0s1T2ZqOEE4ZFNzTmFGdzljbWRLUGZ3c0tiRmdHVElP?=
 =?utf-8?B?WmI4V0M1MlhjaUtMMCtEeVdGdzVNZm43RzFGcXl4a2VXQWRpMTU0cHZXWVRO?=
 =?utf-8?B?NzNkMDJuSWJmSHkvSjE1bDh0RWx5SFJ3RXhFT3hwdERxQnBCU1BhN094a21k?=
 =?utf-8?B?eWtyTmdNazFTaFh2d1VxM2tKTjdSbWVBa3dXUyt5OGwvdHFhR0ZJYktESWRZ?=
 =?utf-8?Q?ocZOJ+D28kQaojEwFpW2Y+HYLnCE3NGjqsBIsPqN3XGz3?=
X-MS-Exchange-AntiSpam-MessageData-1: 1UNtnUcxFbyY2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3172b73-22a9-4fb2-1f5f-08df3be9b102
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:38:19.4908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7TYk2ZEOcQ0gxel+DGIaeqFffROwA+CdUq/p7QZnAW39c6/K5mwfgPPCtq/T+VlWz+fvxjuTyr2ejmGkAI5Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5636

On Fri Nov 6, 2026 at 4:06 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> GSP-RM answers a GMC request with a GMC message whose command word
> carries the response flag and the id of the request, and whose sequence
> number is that of the request. It also raises GMC events, named by a
> command id. During boot, the load-and-execute events arrive while the
> driver is waiting for the GSP_INIT reply, and GSP-RM only answers once
> they have been handled.
>
> Add the receive side of the gmc sub-module, mirroring the
> already-existing rpc sub-module.
>
> The transport cannot produce GMC messages yet: the r570 queue element
> header does not carry the type of the message it transports, so the Gmc
> variant of GspParsedMessage is only constructed once the switch to r000
> makes the transport dispatch on the NVDM type. The RPC receive path and
> drain() account for it by logging unclaimed GMC messages.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

> +    fn await_gmc_reply<C: CommandToGsp>(
> +        &mut self,
> +        seq: u32,
> +        on_event: impl Fn(&GmcMessage<'_>) -> Result,
> +    ) -> Result<Result<C::Reply, u32>>
> +    where
> +        C::Reply: MessageFromGsp,
> +        // This allows all error types, including `Infallible`, to be us=
ed for `InitError`.
> +        Error: From<<C::Reply as MessageFromGsp>::InitError>,
> +    {
> +        let dev =3D self.dev;
> +
> +        self.await_msg_with(|message| -> Result<Option<Result<C::Reply, =
u32>>> {

optional nit: add a TODO to say we should make and use an NvStatus enum
instead of u32 here.=20

I had renamed my original nvstatus enum I sent ages ago, here's the
original [1].

The previous concern [2] for landing this is that when the bindings change
we may forget to update the enum. Now that nvstatus is being returned as
part of a stable API surface I think that concern is less strong,
because it'll have to be both append only and backwards compatible, so
we could get a nvstatus value we don't know about from newer firmwares,
which we'd have to handle somehow anyway (so forgetting to update the
enum necessarily can't cause an issue).

Anyway I say it's optional nit because I think it'll be a long while
before we want to differentiate behaviour based on anything other than
success/failure in nvstatus.

[1]: https://lore.kernel.org/all/20260227-rmcontrol-v1-2-86648e4869f9@nvidi=
a.com/
[2]:  https://lore.kernel.org/all/fd010f7a-6d0d-4faf-bdea-23bac608f03e@nvid=
ia.com/

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
