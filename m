Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B8448BB8
	for <nova-gpu@lists.linux.dev>; Fri, 11 Sep 2026 06:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789109487; cv=fail; b=Lw1JjVexuIhiTAH7TiXMFi5i5cvxEaTpgDNVW6EXnTNQCWG5HMUBYNvgh60r4+cYUHz1VrpnOiXcbVqUuP9rK6V0dftGJXfeD8besh8tFSgLURQpDOw+gHVqH+0NtxH9xj8ksZZJsaMkcx6VttAcf4kCGd75wsHV0QfXnrv/5Ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789109487; c=relaxed/simple;
	bh=aN/wGbImOAKQbqMWmHRmOUQLbBk3oIcP9ZdqIUt7b5E=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=VJ8m+nRqPgdT6dLMG6o77PyWOfPKu0hyg8qUdSyscO/DQzBqhJf+oOjnoZU/FOfh5kx7kEf61SacxD3Wd0j4ofmEyQxvzX4mXpzU8KJi+tpzK/Ps4dF+dWDsqRiJUf1fKzqE5/+VZ2MI91s6L3bw+S/6JmwWRKFRrILEdrkHlmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R3NIcWD9; arc=fail smtp.client-ip=52.101.52.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R3NIcWD9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWO67h/JAoBlZhZIslitpbIIDkSxS1gTMKCIw/cS334Nxa97ngrUt+mPEyxR6phGePmehZ5gjAokg8MHZogAgO9hS0wMFrdzRlxjDWIPHma6q/fjmO2lfYiX6MJcskbtt+x5gPHkm8uLxgc4fLW+1yfd1QQkIqeOJe08wCihQtiNCTJiEA0PApIN13vhiJmg0AOq4qW0nZJd8KjlYR/IMTz9PHpylUSc9PH8c+4RswXro3CXa4HI4U/gT4ep42sOzPuqTE9hT5X4FFsAtvf70GpulkQ+G1TFfl7D8+dM774XeXvBgaWZlT1uVTfQYMlUGPbOhawXzIZofJ9hSg4IuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqoHHL2OyXVRkLJ3p3++4YdzbJsH6Irijmy2wBmnl7g=;
 b=D6h5+wGb+zOoK7FgC3tfVply24nSos8jpWhOpMDka6Joc5ZyqZ+ywevpJ0LRBr8Gy0JAS+GNxo53crQWZr/8dyiulLggpOMbWPBmPn0eA+ATAtj4DCJHUcHdBgzg3mAd6pMBL3E0/9rVN+Myi0pNe3mNMRUftG0WVJJnjZqvf21v9TOUKuBw/KDC1NWhVFcCVwjMAdWUJrzmmG9lZzoZE5Xcrw2iazbNA5Ihr7W0x9LXdOpu4giP7OQeqnVIsbxQ2ZDjCB5G33nifrY2+lU1XuAkTBoefVicbyMbw0lKooumxGACWFQUTQZ65WqBfvJNYk2X5ltW4j0D2cefwAuH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqoHHL2OyXVRkLJ3p3++4YdzbJsH6Irijmy2wBmnl7g=;
 b=R3NIcWD9cdzKIDrN4cpvXcs8PX5g1+bOK9AWZXCd2T0wsQAj7VG7pnZ96EwPgYNqE5FYR1khWkJNf6oL+BfjR/D1SFyrpxsaFyrn3UAzkBZem0eO8+OQsUO986xAEwXTYMUAMPGVaxo2R8yzeakoNJQFrmeoy0TnjEyx0zmOhrWkbHT1jWl996yF0FSMqZ+w/TbTffjJq5dSyOxEi5NO1zX0J5o3qeaaOT5A9A43ka9yEPmrlWlf89zMDxcACDIgr6L5lRaf+T4ZAbBu+RTeywCSQpkJe6Dea5Q0Io+zFsLSZrBpdfjhfevLWVFSRrcwmQiHu1DAiwavnF3UM1I7ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 06:51:05 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 06:51:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 15:51:00 +0900
Message-Id: <DLCADFTC0H2Q.36WG0J0WN9NKP@nvidia.com>
Subject: Re: [PATCH 01/13] gpu: nova-core: vgpu: add post-GSP-boot vGPU
 initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <alex@shazbot.org>, <jgg@nvidia.com>,
 <yishaih@nvidia.com>, <skolothumtho@nvidia.com>, <kevin.tian@intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <jhubbard@nvidia.com>,
 <ecourtney@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
References: <20260905081116.106613-1-zhiw@nvidia.com>
 <20260905081116.106613-2-zhiw@nvidia.com>
In-Reply-To: <20260905081116.106613-2-zhiw@nvidia.com>
X-ClientProxiedBy: OS3P301CA0026.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: c339540f-85a5-4223-45b3-08df0fd10c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|7416014|1800799024|366016|5023799004|11063799006|56012099006|3023799007|10067099003|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KsyFhWUA8eDQlFFb5TUM/jQ+iXq83qz/An1pFrPuonah4BAn2IsZfoZOvsYHjxh6MW4yy2II9QWYT+MOftPZHcoltkCzTsoCcVGh6OstWz0l3ErPbO4U9uh11LRVWZd60Zm37g0fZfw4oC+Dh9riiWTarlYKjaL36YDEji3AdPToExZnfUhY7fFTBXHQCLrkwsdVxbbhlm+3bjknaUVotNsh0HRUPIeB+zN8ujJH7JIbkufWEeRFoxwRgmEHTVyY3t9XPlrkK40/lL3lKKBjla8HGuhXMARRNDf9/qdA343QBgenhxBEjxqdpFAkF3BMu3MaqgiW8jJcq9H9KqGy3gkT2met3wvv1enBNLLI/dpNuQ1zTOgREZg/9A8cgg6AQ1FpVZVk4qi6bxukMPxZ4gGoMPOHd2O97C3m6XI88/o4a/V5mMisX+qdyxfZMLZ/V0kmyM2xOB4lJc8USx04goEYGcPi9aDPqGdm8H2uw8vFOpVKOHvRv/m9C94TOqYPBvS9e5SbyLSehLAgXhSmQlm/rgHxPZQ4lNXCZR+xsJ5ESdanl0t3mHQoYCgoS0dqIVF3Tav8oxLNZIcLZQVA2vgnT7/4AH7Vbvuiln2lZZCtADHrIKnfa/ujEsCuk/rmkiKRLcWxreYU8QXxr2t1JqEPp9c/arXYTGdAe6lGbjI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(7416014)(1800799024)(366016)(5023799004)(11063799006)(56012099006)(3023799007)(10067099003)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVVua2hjNE5lSWZlNmFtWTMzNFQ1QnBBb0x2QU9FU0tPbFRYcERPNnRaN0E3?=
 =?utf-8?B?QUFOZmNDZ1NvSkJZY0xlUlo3V2dTYm1pNURzSG9laExoaWF6NzA0OWJFQnFz?=
 =?utf-8?B?NW9pZXc4cUVTTFVDWHlqMVZLNGhvVzZTZ2NSYzdocm5zdng1ZGM3NTI2VlJY?=
 =?utf-8?B?ZjZOQlZ6YjZ6VnkrYlRvQzBtQU1VOExoUFZySmV2NzRqTmpuLzgyNllFall0?=
 =?utf-8?B?Q1FmRmhHSURITGZFQWlRS1pOeUNqaUM0MTV4OG1UMktjTlhvZkxBSHFiMWVX?=
 =?utf-8?B?QmFKQ0Y5NTNyODdRa3RKZUJTMG5abXBoTXMyTXBlT3kvcGhwaUJLeHBxaERy?=
 =?utf-8?B?TllKK20wUVJkMEwzZFlwcmJxUEo2anV0UXhMN0dwK1FiQlNlbUwxaGZIRW1N?=
 =?utf-8?B?QWZGSURxOTE1T2xNQ2ZqUHUrSzBjMmVUM0V3YUFYbWdpcThEcHpYL0diT1c2?=
 =?utf-8?B?bi8yOUdKbnhnbGNLaW5jM28xR20rM2h3d2dvUWoyVkpEa3R5SE9XKzlSQ0Vz?=
 =?utf-8?B?aUhYc29KUUEwU09vYk9oRDhDN1hTcEdhd0tCb2Y3RmZjb0h4UjhzM09Na2pV?=
 =?utf-8?B?a00vYkdsaWRZeVZTQmJsa3FHVEd1Z0IyNDZ3NWFkRzM1VUJTcElaOFM1SGxH?=
 =?utf-8?B?dHVUckMzU0VvM2twV29DSWN4bVdkYXNyaXU5SEc3ZmNZT2hqS0x1dXdLTlAw?=
 =?utf-8?B?WDFqQXdaT0xGU3FlRXlxek9GK01wcUt1UUJmc3RWTXVNZDlCR3NER2hrWkc3?=
 =?utf-8?B?WW5pdHJmTEZhU3lWcU1tdzNLRkgxQUdPVDZtQU9GcFlhVFJBbXFOVnA3UTlO?=
 =?utf-8?B?VWM0bkxTbEJnaDU2TzFINWdKUWdRYWNmNFBFWVZJaUNFdmFGQWpjekl0RnlV?=
 =?utf-8?B?dy84eXlIVmNRNE9yR09sNjJkbUJSQktZZzJIc1cybnlzNWhhYmw2SlNubTZI?=
 =?utf-8?B?ZjBqRVd3Rk9ERVg2V3d2K1dNajZRTXZLVFdaNlJBV21ZR29QYlVwUVFqVndx?=
 =?utf-8?B?WVR3THFQS1JPR3AzSlRLZzlkbE9rbnV6dFdiTDdQNlI5dEpXUDVKWGtGZFBh?=
 =?utf-8?B?ZTBBZ0E1QXN3OFlDTVNHL3ZSN2VBeHBXQUMzMUhlTHlUdWFCWHNoeG13ZzVy?=
 =?utf-8?B?S0NqLzlyVVg2V0VXQ1dZc0xHT1dmdzBlQWtoenJIejl0SzVSU2phdmhha3dq?=
 =?utf-8?B?VGRlK3oxLzgvRjRkYk9yVksrZUlUVERLT2ljb0Qvak9EMDVZOVhMU2xUYWxB?=
 =?utf-8?B?clJMM2p5V1Y4NWZqbU1CN2paalIvdTMwdWVwTDRkb3JzYjNpTjE1Um43SGEr?=
 =?utf-8?B?Y2sxc3hlRGxWMlU0aTNFQkg1eGxhZk0wdC9HSitlR1MzbUs4TGkvWjhpazlE?=
 =?utf-8?B?Q05laUs4L1B3VkhuYXBqbGtBUmNtMkJaUnpWdzY0b1laODRySlRqMXBzNit1?=
 =?utf-8?B?MFpqME5oSTlwQkdsZE1IR3lTQ0VqZGxCSzJsNmdRVGhrckpQVlN0dVY3QTRl?=
 =?utf-8?B?ZWt2bUYrWWNXQnRJRTlzL0JyZFptYk9LdFdwQ3dpWW81MUVvS2JWdGprMGNn?=
 =?utf-8?B?ZXJ0K2kwTzM3NWRiWnFiNDlhbkx1QURaUnVMVk1MWk9UbkdneC91VUNYbzE0?=
 =?utf-8?B?RXJSZ3FacHJNQkhGVkFWTVo5ckRPMlZSUHpqLy9jT3hvSmF5RG5Xbld1aVdW?=
 =?utf-8?B?QXNTa2FBcTdqUFBZS1lJU1FnYmd4eDZFei82S2gxR3RJWjI5Z0MrSmVsUnkx?=
 =?utf-8?B?SjRqcS9FblhrczB0M3dRSGdZQytxTWs3ZldQVkVCcDRza01NQ0xuNGpGRWxh?=
 =?utf-8?B?TG5CRlptYWgxWTZIZmZmd0djYTV6L2lVSDl2b29CVUQ3by9VVEFIM1o5a0p4?=
 =?utf-8?B?S2tMeC9Uay9DUFI5eXJGQkVlK0pUdkx3cXJEYktRUzF2YTVtY2FPOHFQSGdh?=
 =?utf-8?B?RisrMXBYdDZEUEdhWUs2ZVk0Q1ZhNXVhUjN6MitORk5QM0tuQkN5YUlzdVF4?=
 =?utf-8?B?N0xjU1JTZEtFQ3BoWVVSQjEzOUlxdGRlY3RJRnB3ZlRrWXlxeThRdDdtV3Jq?=
 =?utf-8?B?S0kwQmY5aGxiQThZa2VaT0ZkR1pQa3JQU1dnZ0d6bWZYNENyT0N0YmZFZXVE?=
 =?utf-8?B?UGJQVEM4a0pNL0ZmM1kvZ21YaXZGQnBPWVVoQ0MrTzBhNmVnR1kxTDE1VUhz?=
 =?utf-8?B?czdkLzg2aW11K1NyQW9JclNrV0NHOGFjRHJMNVlrYXlHNVFsQlNDaG9kRDY4?=
 =?utf-8?B?TVJhUEZCYlBCWWhRdjNpNnRoOWhMa3lsYW9tRTZocGhpZ0pLTWtyZHRTU3Bp?=
 =?utf-8?B?VnlWalduTU1DaVQvY3k2VTVCTFJvWnh4Qmg3LzJDYjk0anFzZDNsSGhZeWxJ?=
 =?utf-8?Q?g1/W+QAAQ8bfOVgit/Ijc3mfFZH7KOWH+GSrGrLGAa7/Y?=
X-MS-Exchange-AntiSpam-MessageData-1: c0MX/PSlLG26mg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c339540f-85a5-4223-45b3-08df0fd10c9d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 06:51:04.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8McLHlp4/GKeG+QfQ4TzDgbKT60eTvTOwUmeaiwz+kcBpuyHWfij3Zhaw7kmDqNba1qnaFSDH2tzw3YB7RApg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

Hi Zhi,

On Sat Sep 5, 2026 at 5:11 PM JST, Zhi Wang wrote:
> GSP-RM does not expose the parameters needed to divide resources among
> vGPU instances until GSP_INIT completes. Before this point VgpuManager
> only knows whether vGPU mode is enabled, so it cannot provide the engine
> topology, VMMU alignment, or channel capacity required by instance
> management.
>
> Decode the VMMU segment size and ordered FIFO engine table from the typed
> GSP_INIT NVKV response. Retain only host-driven engines while preserving
> hardware FIFO order. After a successful GSP_INIT, initialize the manager
> with these values and the 2048-channel capacity, but retain them only whe=
n
> vGPU mode is enabled.
>
> Move VgpuManager into Gpu and let it borrow the pinned ChannelIdPool.
> Create that pool with the same channel capacity, order the Gpu fields so
> the manager is dropped before the memory manager, GSP resources, and its
> channel pool, and pass it separately to GSP boot so unload resources do
> not retain a manager reference. Keep a copy of the detected mode in the
> GPU-owned GSP runtime data instead of passing it through the HAL calls.

The commit log reads like this patch tries to group several things
together. The diff below makes it even more clear:

<...>
>  drivers/gpu/nova-core/vgpu.rs            |  91 ---------------
>  drivers/gpu/nova-core/vgpu/mod.rs        | 139 +++++++++++++++++++++++

This moves code around while adding features to the moved block, making
it very difficult to understand what happens looking at the diff.
Typically when you need to do what you will want to split into two
or more patches: one that is purely mechanical and moves the original code =
to
its destination, ideally without any change, and then the changes you
want to apply, one per patch.

In this case though there is probably no need for the move at all: even
if you plan on adding sub-modules to `vgpu`, the main module can stay in
`vgpu.rs`. Sub-modules can then be named `vgpu/foo.rs`, `vgpu/bar.rs`,
and it will work just fine. Actually I think that's the preferred way of
organizing modules in R4L.

Generally speaking, let's keep mechanical changes, refactorings,
plumbing and only then new features each as separate patches. Not only
does this make it easier to review, it also will give you a better
perspective of your own code and make possible optimizations/reorderings
visible that are not obvious is everything is clumped together.
