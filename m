Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010061.outbound.protection.outlook.com [52.101.193.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC925228D
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 12:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599061; cv=fail; b=ulR/pPkyn7PriFFFD2l84RemzQmsM49MIk4OqAbUdMn4uiasP0OObQTL+EnXIMpWphWIHhEuy+Oo7PLTS5igcxJtkzW7C5G/NmKTjfx/Yyukbteu3x0b6z8zc6v+W4Rt4w1CqYtxwNjlGhUGKMatYDkhF0rljYNuGUIwnbTDHt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599061; c=relaxed/simple;
	bh=nCT5cEJAFO0pq9y7ror5QxIagvHuNyQm58430I17IPw=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YcSCqNCwtKwsBhu5NOqobo2gNuRgSf6cWuqPqONdBI/JS9gvCocuzB4k2+MIZoj4Myu6W/6vkLt2YkJpRh2VEwkqVRlDI4Uo1kePErLcFcUVxN73d6U5mi94EGbgeEqj3LiEh0LeWrAFgY3imgzJeomN9w9iOx84nGOza0VVvpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=K73NmA+p; arc=fail smtp.client-ip=52.101.193.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="K73NmA+p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHKLfXpdpy6EcTzpXHV1QMjsGoWSuWMBuylAOnURoWvav1C52IOAjWFuf3RaVncx8BkbPTtftoLUEpXolN7dKI1nIxfDyOA8YrwOcNlIHrd1Qq09XCBV5lwRzNg4wDxUtivPC4R96Cg6gInR12KiL1U62s/3AW+K4azR3/+uuMtX95TtlhI+tzhE/oF0zI3xky6ptzSfa3lTjBmPSEmIi3DpZPZkWhERBCdjtj5cvr8Jlyy2gNqV7zaT3JsCYtD1jgUJoqItyexQcg/umTj9Hr/W6BU2pghK+cgSSthef5XKs75822W3lr+yTNn9nrw+CFARnn4LykHZDd89Pigd/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCT5cEJAFO0pq9y7ror5QxIagvHuNyQm58430I17IPw=;
 b=AXbvKfgGRmN8V5ROBZzWdztGKkwElxpJAc/mJcMT/34xKWiDleTPkD9o1JrH9bFA2Y+EjYLZCwb7b/Ctp72q8zd4+sPtaqDXYyevVbTihIq23rAUhquSY4v+48aJm2CWrW7jicjOUuEg54JTLlnPtHwpsBzGbW1od5N99o1uredvzcmyFOXtRx4HLEJggw+WYL5koHYlAf/qkMHq6Tfaj+ne1xw0nyIQLhuvD9TB4j2rbu/jkcg2c1SPm99z87ycHM+ckKMJjnOzAm1kAmN384XGXNW1SYsq/tR7I8iE2JyKJg4fgKASdoQ9ua90v+ZFwkS9C0j5L3zruan3Ex682w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCT5cEJAFO0pq9y7ror5QxIagvHuNyQm58430I17IPw=;
 b=K73NmA+pn+4ITMMyvdNKDlffBt+tP+LJlehHDFgh/OrvMphBUt+nNVGxbNCxjuCrIx9itM77dls3BfSjK/GUSs57Cwj7S60X8/ZpqGSHwGarR2sW2bjPdDIE05QYAiQhr1ipyzhNM+fR/5/Wqppp0szVkHZA6Hus/o4UA1xgecdQ7ZeMzuzQ8uCnuGfE5BMTNePFQQR8ulgRABbieeGLGzAcobg0qObtOTaaVjb/fr6GDtl1gx3NzZknsIULWPofZwSt0VJR7TuFAy0bJdVuSdQkp/8gcC+AU14fz2i662aWU8bMrtHiJVFDltFcQIk8NFlSbjGqjZHDBKmWiC+LSg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY5PR12MB6454.namprd12.prod.outlook.com (2603:10b6:930:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:37:31 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:37:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 21:37:28 +0900
Message-Id: <DLQYDYXWESOX.25VA3LP68Q2ZF@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 16/33] gpu: nova-core: move the bootloader DMEM
 descriptor out of FWSEC
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-17-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY5PR12MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e8a4f1c-19de-448b-0974-08df1d5d434b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|7416014|1800799024|3023799007|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	myBtapWbbrPeOCE1ZUU6gDcc4AuPP70zTcVnGyv12+D0J39h6FDRd2rkWkn+a1jrdV7rkRnc564rGiIcD/yQZAH+tXUiWVXWGPFB14zL8Xv7V6ZZB/+WO+aVwuB9NZWMehmVceWeS4giL5aSCIzOCbRkq3blDXxkjc3VpgzJU8czfC/+p/H9cpHOZMvM57RO65IC2CkE2qsyWscIBL4Jy5noroqMmy4dVZr6LwAv5QSIQsHSC30inyvr0AJvotAmNO7goE+BFmMgMsYht9RU5go8b+n/Vy8+vBc4btvW/oH8E4iY3FuQS+e4qiK36yz/D4hwlZrs46zPzifxALfeliOI/K2ADynqSdn8aoQbkH40vMV+IxaVxgXiRol4SrmfUmHqj7kONO7IVKMqrCpD8s5IujPCOP8S0FzjGUiiy3vNr3TyUhKbU0eTDu22ABoEzXNTYAvpLWhrTOsrW4hlVmJVTomUgsTy4VPsYUIMn8GCZAYvvN3Lm9N8VN5yTblmO3+BiM4zAu5DPlh+hs41yqfzVyUsIiKU66Uu6Vl1Fe3slyEz+sL6tLhF2yPXCRg9V203Apf7vSBKmT0h3Z8RMAdAY+FmzHv7sMEdsRmGwEOut2TDxYl67Z9dNbH88L1tgzWooWfvEDgx4Tp8Rcu/qPJzvf3EpoIw7H17BXfQfyM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(7416014)(1800799024)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anVNekczYlc1ZkFjc1pVNWdRRFZoK3VHTFVnOHM3QkV6ZTB5VTU4WTdyeDdr?=
 =?utf-8?B?cjVrbmEwTXd2aFY4UEZiQTZweERoSFJ0NWFDVTMxMTNjeW1qVjJVaTBnZHVI?=
 =?utf-8?B?KzRETDVJeGJ6UE9tRXRGWUNZVjA3SlpSZHBxRkRCZk9ZU3FWaEUvRXNqRWZh?=
 =?utf-8?B?bkhZajU2K05oM3BXa2tqdjlIaE81TFR1VHgzVWlHcUZqTUwrTzBJMkhlV0M4?=
 =?utf-8?B?aytQM2RWYVJIQzA5OGJTNWVJTUhWUnJRYkpMeUlHMVFqVWJ1dkhTdURaZ000?=
 =?utf-8?B?aTJwWXJkR2ZVUEd1YlEzOWNXL2F6UmF2YTZFTTJrbWJVSG83VWFNQitnNzY4?=
 =?utf-8?B?TDUyMkpscmEyTjBiRW1mbU9rM1NCSnVwd0JhN2gxTG1aeHhRT3pSdTlSeW5X?=
 =?utf-8?B?R1ZSUURZNkFUeFJkSzVwbC9JMDZPRzNpamlkTnVhR0dSRkVLa3NpL0dXVlpn?=
 =?utf-8?B?ZjFJaDZXV3NuRklhOHc0eGdhRmpSaHo0cW1Nd0J3cXdRTUtWUjJldjR0Nlpp?=
 =?utf-8?B?TVlidjlWMTI4bjg1eFhHWXVGY2NyRUdKV001ODJJVEx3RWNKNlUzam84dFM4?=
 =?utf-8?B?SzR6SWJjQjNsZEZJOXRZS1h0SmFLbkFQMWE1WkVqWm9wWGo1eEhUVTZ0NWhK?=
 =?utf-8?B?QlkyWTJSdCtwRmkxREpFKzhEZTZHTW15WXdqaU5TdUZicVhaK2lrRjNYcFJM?=
 =?utf-8?B?djJpRmsvc3AyU2dDemdZdDlNK2x3OTRVb3Z0VDVROE9ueGxEcXlySkgza2lY?=
 =?utf-8?B?K2xIRFdHSGdYRkV5TFlFcWVlZ0pLbmNpc3FqekFsZjA1aDRNblAyWjhvd0RS?=
 =?utf-8?B?NE1YSmVVUUxVT2FRQ2hjTWtLT0hRcFByT3lzN0tXMmlqLzE3QnVnMmdEZjdr?=
 =?utf-8?B?WkFsK0dlWUlsTGpQUGZhU0pDa3NMcVFRbmxYUHRJaWhaRi9KVkFza0NVZVlW?=
 =?utf-8?B?L3k3OE5HZ0Y0dXllYXhCMy94Rk94b3FZZjFpSUQyVmdheVhFS0d4dDVEdnVI?=
 =?utf-8?B?UXJ0UDgwUXdyYnB1OVhqRHRoL3QxL2FURndONDVCRW0vaFFPRDRxSmNQdm9F?=
 =?utf-8?B?c2VQbHo0RmFGQnFFdGJjcmFYTGs3V3p2MG52ZWs4Yzh2bm44dDhzaVJTekIy?=
 =?utf-8?B?QmRXZDVhWXRuUUhsMHc1cHVUZWxrYytSZ0lUbFFHbXRLMGNzeXV6MUVxbkJz?=
 =?utf-8?B?RXhaMDVMVGpiVlpFSHBTZjhDT3JmbjlINVJHS3Rhanl2UEVPVEJ3RWY4bUVm?=
 =?utf-8?B?K1JnOEIwVnAxWmlPdWh4NG1laVoraU9YM3lnN0tpRGV1S0d2b3NqZmpVelZk?=
 =?utf-8?B?bVQ0ZUJENzlmNWxVaDJkOEhRekhsa2RGd0V6NHVHYWFHWjBhdTB3dzYwb3NJ?=
 =?utf-8?B?S29RcWRiamp2MGxWcVhBYXhnV1JST2dMYjlnRjJvaW9KOVNETjhEdTJKNTlH?=
 =?utf-8?B?UmJsNldRTkRFV0VCdlRWcFgyZmxSMnpYZmEzS1FmSkpZWUpGOGhyWHp4NmhZ?=
 =?utf-8?B?TEN1UElvT2N3ZXZBMUJsZldYWHozajJ1Y2M3RS8raXVuTmtML2xweXI3VkxK?=
 =?utf-8?B?YURqcDRzL3JwTjhHV3ZmNTRZYWplV3BQUG1UanNUTEVqcWFwcEVubkJ1dE5Z?=
 =?utf-8?B?eXJtNWJFanZvR0pGWjBBYXJ4R0VDZTQ3VUdZcTNseW40UEpsR21nWmFTN09s?=
 =?utf-8?B?ZitsL1BwREtyWXlGcEt0bXQvc0dDbFEwdk14Mkt5T3dMWEdBZkRUdCsvd0gx?=
 =?utf-8?B?N0F0TDYwRWRGMnBkVjR5dzJZQmZMT1FrMmo5OGdoZ0hIelBFTzNFMVY5L3Fz?=
 =?utf-8?B?b09ZMjRlL3NzNzByTWhRVTlzVUFDcUNZaEErUnBBVDhSenFlUHNCRDRYY2w0?=
 =?utf-8?B?UU1mR3pxQW9keEFtS3lYYTE1emRwVDNvNXA1eDIyVTFNd1R6ZVJCUUJ1NWV0?=
 =?utf-8?B?SzNkSmw3T202Q0tiV1E3UEdOT0pJck1WQzJZeTBlUmtCN3hLYmhFZERPekJY?=
 =?utf-8?B?S3AySHptMWZuTmZFZ2lOeUJycnJHQlhQcVFiS2F4SVNNTDFsWWJoQjRkYkpM?=
 =?utf-8?B?aGtjbFU1Z0dudkVzN202c0VqYk1FTkxRdEVrVWtSL3ZmWnU4ZHBFNXNvNWl5?=
 =?utf-8?B?Ty9vWlhBaXBUWEZQN2lSeVp6V2NZVmRoMWJVMWFaclRHanZrL2t5MTNGNm44?=
 =?utf-8?B?VVRIQWVVallFd29hRHNsL3oxTzFpOGEzV1h3SldOd1NnWmFxSDFSRmtTTitS?=
 =?utf-8?B?dktMNDVPNjZRVWlxOTBvemVwUzdqaTlaazM2d05aQjl5V0JLWld3WnRZLzdR?=
 =?utf-8?B?eWhjeGxwcGc1SmEvOGJBZy9ybFlyaUJUdHJFN1owTlAyVkVKbzByUXhscS9u?=
 =?utf-8?Q?IExl8VCAA38BjRQ5d0vQ1JbbN6Aw/lwbjz+kzEs81k4RO?=
X-MS-Exchange-AntiSpam-MessageData-1: swqhbeH/XxNsRw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e8a4f1c-19de-448b-0974-08df1d5d434b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:37:31.1520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaMjAK8fIvct71Fej4LCaHpgpajFf/l3fvT9X89cN3eRadh6g5HNuBJA1QhCPyAHP7p39nmZ3NYKSjIBomhp5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6454

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
> The generic falcon bootloader reads its load parameters from a
> descriptor that the driver places in DMEM. The r000 load-and-execute
> bootloader event carries such a descriptor, so its handler in the
> following patch needs the descriptor type.
>
> The descriptor was defined in the FWSEC code, which was its only user.
>
> Move the definition, unchanged, into the generic bootloader module. Its
> fields become pub(crate) so that the FWSEC code can still fill them in.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Just one ask for this one: since the descriptor has moved, all its
fields are now `pub(crate)`, which is not representative of how we
actually use them as this visibility is only needed for
`fwsec/bootloader.rs` to build its own instance.

Instead, can we keep the fields private, add accessors for the few that
we actually need to read after construction (that's `ctx_dma` only
IIUC), and add a constructor for fwsec to use? The constructor would
just need to take `imem_ns`, `imem_sec`, `dmem`, and the code and data
DMA bases (the `ctx_dma` being a constant).

This will turn the move into an actual move, while keeping more of the
logic (construction) inside `gen_bootloader.rs`.
