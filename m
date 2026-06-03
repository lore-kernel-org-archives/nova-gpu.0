Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A147A3B47CB
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483764; cv=fail; b=A2NSJ4ZHpyhZ/Ry6YMhTvZ7VfC3LjB9KrDGdALrGgvr4L+MNrhv5UGh2h2nV7cAk+jb4srxEaTNUpUUIwqpHAsEu2uUeXreX7U4SH0UDitok+duG5uIgPA8is5m5TQstgo8qyw/80LGOuvQEOHknNfcTo9K0pRY2N1ynryQq//w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483764; c=relaxed/simple;
	bh=ai+Y5fOuvEu9wBRdceGMd/Awzy/df5ee6H/zSbCuoqs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GyboNquSQZlcqbLgEPgSIvTSQL8p0F6t5LjyCqJw+wZNAj0BmjOXLNo0z8uWZYHn0s2p/cDBQeI0smwoniLHG5PLjOnlfnYfnnyEuIz3un/HRyajcyP8YtNhYXZiqe9GmEHGYTCm3ePF+YGDN3Rts3CmQHXS7iNCfijZo0B74Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fcmb2UU7; arc=fail smtp.client-ip=52.101.53.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fcmb2UU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHMMeOwpYXhgH7f1fEC9eL+n5YZFtsVhtKaC646JcoxUG/P8LVfbHO8t+m3X6r4FafGgwf4ZJvKUCWk25hmez0imAtisz9ZT+lYOQEngqs2Xq23xF9G+CLsLklGTn9H738RWoaav6FZUu9xYKE0kLI6jiyye/E3HuYWe3qO/WSBG0xoeyxZmhQoj8uqUmdx2zdaTUiT/myOjYgT7kVasjCXji99PyAI+fFtbEh9mgIVT4mMq5fw3k23jKwBiLs3UPhve95B5x7Gtjejrw/E7z3cmMp5UUEoab+TkBlSlEdryKoy6UEqqRb+Irm4+hIUdXV2HZSQncASVoAgb3Z31zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai+Y5fOuvEu9wBRdceGMd/Awzy/df5ee6H/zSbCuoqs=;
 b=wwJ60dcBDL3/U+8HeOJw3vtlZhr/Bf/mnD7HtvJySpP9Vfn8rfNDrPKCH5DpRocWz+9EAOmMCFyAXplMwNAU50G4JKwFLvv3YZDScwqgi47B4nuDsW9AFZTF+8zaBHu89m2b08KKvMk7NHWsjN4mZDe6QAaKIa8iZDnRXxEHdvoUvLzXLaPSVQfQXa9RSGnK6vPG2qFnvGvhlFNimwfcCEIb0uMUrfBlYBwITCNA/bbLyTG4hqjTctohL33DDgUUmLEhaFZrsW95ez6+r+MX1GvKeIPUzOoIzILfSk1rUaUdevWQPD4+WoN+NfOZ44ZYDky+Q7n3pw/289UFu9HeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai+Y5fOuvEu9wBRdceGMd/Awzy/df5ee6H/zSbCuoqs=;
 b=Fcmb2UU7Nca65pi1sME4SnB01Tzon9D+EiwmlfUgHkP8cGLEMokwOr3bC/KdPb8ZRBBrtw+QYKzwIUcqn+K/dR370RDsuZ9jfkajj+IS0zqZTfOvQ/y+NDN59FmCLanwLyxxDc4AAgC1YxhyV+NepX/EODuSRotZZDg8uMF563R6faJcZhiWgu6nuU4AsRDviV0noF+ik+VTavq6CSDGx3OpmPKikrdGcP86fL69CDQaULC6B2dOfmcyDGCDi3TG13F6zAhDPaybw24Od1r3fIlwz1+TweCDJZvcd3zX8kL8i0SbmnR4NywYd75qiollu8lLh8zb3hWc6Uyh+acRlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:49:16 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:49:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 19:49:09 +0900
Message-Id: <DIZCTAURODIB.146BZJ8DFXN8H@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 1/9] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-1-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-1-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:405:2::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f10721b-c7d2-452d-8bf7-08dec15dc1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	K9epAFE3u7gNypoaQwW8XVBy2Jun1MCeN6+Fxa/JnnMA3sUkAmq8oYxOI6H4dPNSw+QyCPpjnoLGwpqg/l6+XOHDCpFyMabRUTsLfj3irqqOdo1seBqxgwE4dxfw2eCPmom7gMfqmoYiuHMpl97oSLlUL5jyI5JKNpvRX8fRErm6Ni1MXTnxFnOISNziNdPpPFHcp2iKibnGf0xFGTrswu9I3xQBPD12OAe0oJS77xm8nxx6ltcjCQJwRroPkYfUGXiOFs0FKrwDq1uDzwgGfasR2zWqGvvOcs9sbijxPpfLC14DmHa7ytbLUIjCQmaN8BqizhPQubrbybMSyUGH7Mk/2GWVJ0auncTKltMPlGgfU8ktfberg6DXfpTAJaHAnOlxNu+x+HkFxWvape158yp2znkX34CarbuN3cLwB8JmemDaVP1Sg8DNW4Wt+NLkMbtV6A9LYhOUJBQybNn2ICiUZFLP1Cz0VljsYvqaFoEJE27S2rWoB6Uh+XQLxQdnuWHakQGjIH19wogpwZhVGjnbYsuCxKP01f/9lL2eub0rKuhDGwCxMRofRuIXh9NzMi7IxwGs2yLrc4RFw4qsbrWhmDeMOIEkJOsZ/MR3/87ChrmKdvZja++0SHwkCe8qSdfsGBy4HgN9TZ95Ty5uexAyVgrwXqHB36g74m2pRUoSE1PPlMLye8ImsptmNos8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdHNzZHUnlIY2hOSU5XM0V6WVA1S3BOcmpvQk5LZldETTZ1RlJ4WWlOcm13?=
 =?utf-8?B?bTJEVTIrd1NkRmRTNnVjcnM4T2NJT0Y4Wlc5aW9YUE8rNlJkMjZwVkJmT0tO?=
 =?utf-8?B?QXZwUGh1SDNWRVluVkhueUVoalpiSHR1R0JMa0ZUZUl6ZG1tSjFuaDYyL2JE?=
 =?utf-8?B?Z2IvbElkUUhGd00xckV6Mk45V2N0RUhWa3FsRTNyWnFDVE5qMjRxNXBmK2Za?=
 =?utf-8?B?WmhPK3E1YnJNUEQzaXZQUC9MZVA4c2lwWk9ieHE5YllvQXpTOWhkMll0WGo1?=
 =?utf-8?B?dllyTEdHK2J4dGlkcnZoKzdMZWJLaEFhOXB2ZjJIRjNuNk1jN3dhN0lVeEU1?=
 =?utf-8?B?K2RydVhibStVMmcvMkhMN1FVMTVEelFsT0ZUdHZVZkk5c0lwcFhGRk1Kd3V6?=
 =?utf-8?B?amp4dThmUGZNNWpxcWN0cmZVakNxdjNKTUZBYk1YRHpyVTYwSXB5U3ZOVnJv?=
 =?utf-8?B?NUFLcVhKMlZlNVZBMTc3UEg0UGRtMjRZcmRKSlVGWWFFK1hpTWRzZlpYU282?=
 =?utf-8?B?VlNqbzJ2T0NNSU5UM0NGZXdXOEgrOGcvbmZ1aW9neTg5NGVFT3dyT0I1U1Rq?=
 =?utf-8?B?SExFU2NESldUN1Z1b3ZsbUxha1hRSVhydmF4WkM4T244anpEUTE0V1FrbVI3?=
 =?utf-8?B?eEVDTWhnNEhYUitiVFF4cUtvazdnTlhGd0h5V1hUT0ZoTFIwTXNJNVE1WDZk?=
 =?utf-8?B?VVkzdCtJcVA3L250TGNFdkt5RWFVSXY0d2RnSXdGSG5kS2lJdEFka3JVaExY?=
 =?utf-8?B?SEdObEI2aVFubWpaRVdOSnZwVXAzM0FwZ1FGSDF6d2kzYW5QUmtEcTlHRmhG?=
 =?utf-8?B?TG5LdXI2UVowdk5pcjVZYWpLUUtDa1FZV2M2Sm45T1IrVlgwMVVUT2xjeko1?=
 =?utf-8?B?NW83UERDeWI4eEpRL1VjV2RuazVucWMyTFhNNld3L3hMcU9xdTlkWCtaSE5o?=
 =?utf-8?B?Q0hpQTE0TkozZVJaQU1tVHVQTGVvU0FBTmI4U201dzlwWnNFUVVqSk9pWWZQ?=
 =?utf-8?B?ZHdKTU9NVDRGZGwvVmI3WHZDZTNMMHBJNTFiSk5VRFdXcHl4T21FeXYwQy9Z?=
 =?utf-8?B?Sit2enhHQ21lNW5mU1JyVVNSRFBCOEsyL2V6bkVNOVA3ZTNvNWF1TWVnMHp4?=
 =?utf-8?B?R2xoOWJSY2RVdXUzeGF4RkEyTm43R3orR2dyc29RRFNqRm1MQlpOU2cvTW5Q?=
 =?utf-8?B?Qk1GQlpDSzYrdytjTTRpMDlPNC9rWVI5MGNsWG5YKzVnM1R2dVY1QzNQSlZM?=
 =?utf-8?B?OGYxdlJ0eUlMMEl3S3FoZTlxdGFvY1Q0Vnd5SzdOYitwNnJuVytEMXNNK3Vq?=
 =?utf-8?B?OG4xUStZbTFyWit2aldlWTVOTUlWYzJuRU9pdXRFcllablRQR1AzQXZnMVpF?=
 =?utf-8?B?NCtoeWd6aS9qaUxLaWxjeWdNYnMzaEpwMEJ6cVprZTU3Q1dRRW84ZVMySEtH?=
 =?utf-8?B?Q2NDYURmSTlFS29ncGxWYktJYmI4TytFckxwUWp4THdDbXkra3dkZk5Wdi9n?=
 =?utf-8?B?OHhpT3ZwUmgrTk8rUGVxT0pwYlA1TXozM1NvRSsvZTk5M3lSWUVRVW1KTmxk?=
 =?utf-8?B?SENxY0l4UFA1UjQzUXV0MHlnNDBMSTRBSitqRVFXdmc3R09FNnE5WmNEZHlk?=
 =?utf-8?B?ZWUxNHZyZkkvWmFGVk8yOEM5RmdrYjQvbVB6b041UWE2Wlc3Uit1UTMyLzM3?=
 =?utf-8?B?MlRMdThpOFllektDM3ZYenZtL0VOSUVkL3VrM0ZmRTNJbjZueVBFdEgwZ2xL?=
 =?utf-8?B?M0UvYVNPR05ZZzU5emRnZzJYc2J4OFBlWmRxdzV2ZThHOGZSNG9Bbjc0aGkz?=
 =?utf-8?B?NkxQRmNhU0gyellSaS9xZXpkeWFkWVVzcjYyaUdrVXB4RGkwZlFYbjZtNzFK?=
 =?utf-8?B?R0dlVlV0MkYycTJTNVk0T0F5NXNjeVQ1aFBwRHhLSVEwK0ZTcDB1L3pUNWQr?=
 =?utf-8?B?akFUanhVb0MyazV1R05rYUpDZStvNEE4RkhaaTE2MlhLbkNRaC8vVUI4MllO?=
 =?utf-8?B?bWFEZHl2bGZlcjIyV3BLQ1lQQ2M3UFd2V1BnUi9YVmpsZjR1dzdZWm9BVXRz?=
 =?utf-8?B?TGtscTBaNDhqOFpDOEtTbkQwYnF0RlhCQnZidU1pMEkrMnY2dHltTHhSczVp?=
 =?utf-8?B?SEYwUzRlaGJCb0VrU0tsK2dxcFBURUV3OGg3eTc4dSthQnl0M01TcXlaRXFO?=
 =?utf-8?B?Z3Z1N2g0ci9md2FjSTZhRmplaDU1aUdhY0xMemxnMnRvU2RoUkhXVDFlUVlW?=
 =?utf-8?B?bWJMNXF2Zjc5TmRvSkV3eWZST3ZaQ1p5ZlNnc1E3M3JLTmhaTFlnV1FzUzY5?=
 =?utf-8?B?WXlCS2IvZlJlZ1ZpYXFaOXdQNG5LMG5PMXlwcGZkN05Lc2k4L2VqOW02OWdV?=
 =?utf-8?Q?gPjqsoGmKWDa47/LKMKju8loyzjr4OXxbimW/Fv2NPBPY?=
X-MS-Exchange-AntiSpam-MessageData-1: lmXDLQoj7AnvZQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f10721b-c7d2-452d-8bf7-08dec15dc1bf
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:49:16.2147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2ziG20ZO/q3eklPu2a+53p084R9wHFXzsOdpg6+2kohQ5UawhjmTnl/w8xe3E/pxvNAKxc7IEuf/yANLtL+/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
