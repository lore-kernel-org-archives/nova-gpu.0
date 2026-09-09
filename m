Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010002.outbound.protection.outlook.com [52.101.85.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBC93515DE
	for <nova-gpu@lists.linux.dev>; Wed,  9 Sep 2026 05:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788932812; cv=fail; b=Tf1gh8ITjYOBx2OEpB5/RbRPWS9yGFwjUJH/3VZJfQDSFI6cPSAN1K4IXqgfxLcwibCF/uERVCplEnBTzzxFXxPIkjywMEhAOVNJCgbJUlIYbR8Wn1lJXNzQZJdF5vhSNWftv+JX7dR35mR/Z5l4RB/FgFHAgratkTe93EDGjE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788932812; c=relaxed/simple;
	bh=Q4RFTQWwDbIWHmHmheyo35Ciz8ZrPyUgfukXsGQhf38=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ogLphRF6d8eWPgubLazlYKwo52sp53jULIL22NqYNf2ylLsTuPfwo1DXPccJGcUtYVLpqzy+OI4y+/EUU3FgVgZoFIHCIXs/mAuyD05B7focH1yLUaCoD9dq6MwC5ioDzKSCBJZrSrwfJWCtwJ/D5HGwrMNvNccbkLgGsaOG/OQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l1URTTwD; arc=fail smtp.client-ip=52.101.85.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l1URTTwD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCFLkBlWtpKgBH/c5UIlcPWEBlkfKJ7I7vMHeBeikWuscn0vR1O6afjkAjWp6CWDcFq7Ei8Qs/451NZjylntRsRr115lohMIG3H2l6+P++qC6FkCHPjSz3jD62ZIjDYCOjwZ5+Sx6ke9Xys6CnOz38FGuXG452x/LRHPVLRvA06S5P9EGgcq8i3wEDbnv6+uoozaPaxo6EvtTdIP0HDV06JNOWXbBOuFYyqpv1fGBR2sR7mAfm/iMVgQ1+ikYHqPM1bCmgdGUqT+koddz+It0HWW3Y1YrR3K+XBjNxyP6Yj5VIsh9+erZ2NWWJS27juphNUD+7y16gb/pu/lAeg3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUe8RwkqP7NRd5zP27k84X36bXWud3L/UhCKC4fAnCI=;
 b=TnFy6N4cWPyGrkD9RJl3FAg7BFKIh6JtVj3T4G0Ok/EmpfmuidrQ58btbT4XDQhCsJ+sIg5WljWmpWUGec3TdzBI4ofoYoQ1t8QLPAoRSKAhqLaGp20TDx7ueWg0N9Tizkhg3PwD2dPlStY1vnZK0nyijwrkietuSRLNenaVuD4oLa1k+GdfPcVe8vK+C374d3EvZUKJntelzhC+ChTdXVL459OkiMLuQFPbiXwUbmTqGhUf6Ntm/EuPfJEIyTI9b9r6O01K9WP3t/Jz0nBZj3G/h6qjaPQ7JDhyA8GJfdW0e1JZNQIBFaYmSoG0ql/O7uR38drd4YDyfjfJxlIxOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUe8RwkqP7NRd5zP27k84X36bXWud3L/UhCKC4fAnCI=;
 b=l1URTTwDdYHwjcG2gEnI9wbYu4+qnikQsJEYbJYmAUsMWz6BmyKhRzqXtooDpNDqEiGGcvzyq9v3m0Bdj83dCSwxtHNrVLaMCbitQOEJXJpZWvFM83viTnt/Vhednwjtb48/vcHnLFDk3UONZVBUZkaKu0hKCGRrdJbCwKt7vk4qZ/I1INVUR+4eYgboiK6sCXf6gAp1SpL/QRiOKeWtjLgTe5w9kKiurieyslN3eBbHZ6oCri7lJU1Rk31YpMuOiZTyTmrZgEZxClrBg77lQ4qi1YjdUaqb3ez+kXOEWWybbsdYtewMpHlKqg42hOQwBFRGjcH8SUbESucKBmttsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB7898.namprd12.prod.outlook.com (2603:10b6:8:14c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 05:46:44 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 05:46:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 14:46:40 +0900
Message-Id: <DLAJR36BG96C.2GW7VDSAWDR1U@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 13/31] gpu: nova-core: gsp: add msgq v2 internals
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-14-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-14-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0335.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::13) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a2cfca-28fc-45cf-f33f-08df0e35baba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|10070799003|376014|7416014|10067099003|6133799003|3023799007|18002099003|22082099003|5023799004|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1ymyTSua5HK8N+6jtcKLJJGTnBUzey7HNvG2sqTrZYWCuBvgcUfJ3hTh696d36z6txg33t+r8gbuUjggBAQKt54VYvcKNGOktpfBeOiKg5hHuiLMc3UsBFza3PpzhkEOLDSHuC+5TtaXqfvM0wrCc//eGnBtCrGmpF/yXo8mu/s8hR1qhXjJ4wugN31Lm3GQaUKLJjUdWDUD0jViGrD721YN6g/2Rdy6B4wXi3xHl0M2KyS4DhFmZN/9NI0cP29PaGQGV5nbg2fYJa2eB4D5FWrN5Xr9+upiYi8O5EIqow97QwRr81Mf1Na2JmLvUVIK4ZVVppo1Wj/uO76bd67FpXdC1mZ9pZFumT3IXGA52cr9qK2rAIq6yUcmnQ7zZVcWf0hs1toy2NBdV3g9K/8Vf0GeTDMU5wDs/bdCwi8GblyyVoAi2iKKwpECBC+xhmqxMAb1bpaKZzyw+DGrNHdqFYYH+ERen1iHIzFW6R8SyQBaHk+BcA1NsPRnYY4KVjNbNGvD7fJETCXCLTSUPqicnAn25Dyavoz1XULv2os/YzeJ4+3iMBqwiE6xYR9zstkHONgX5xHvdbW5VdNk67+3AHY397xUfvRa2t2ozPz8wGJKfNNWtjZyAMSC3dGX9NdM9o011uw+mPcS3xtjiBOlbyoalzg3Oe4U2TRvNDMoRZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(10070799003)(376014)(7416014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(5023799004)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXpjOXJaZGtQbVhJNXdhcmo1VVQ4Z3JXYTNDcXJwSEUwUDFzendKNGJ3dFNF?=
 =?utf-8?B?UVpTZFZybGRhM2VXZTM0M09zNnNCa245dFF2RC9aalR6TlBsK05VdW1SdkFy?=
 =?utf-8?B?anNNVmgwQTlOMUo5OWpTUVhvUEVKVm9SOXlUTWhnLzZPemVTZkdCMC9QblNM?=
 =?utf-8?B?ZDQvSDdWblRTcHBWcGZzeWtEaG5ETnlnQkJqbHpHNzFuY1kvQjhsTlFsRnU0?=
 =?utf-8?B?NFdmVmJick90THVlUUluSzJpelRzU3N0U0QvYytQLy9NTFBwZFFnK1lEK2dZ?=
 =?utf-8?B?UGJSS3pmYzFVTHdEWG1rYS81QVRoTTk0QVBrNm13c0krOEthWGI1d1F5OTE3?=
 =?utf-8?B?NnFIU045T2t2YWQ3RE9uUklhOEVJK2tLNlZ5TVVyMmhrMWdiU3dCTUJIV2Q1?=
 =?utf-8?B?SjZ1czFnOUNWWE5aamR0dkJnNmhHNWcxUCtWbnN5VVRUMUUwMW5vQWJFQWs3?=
 =?utf-8?B?RlpmWTNuM1VUYngrUklGUWpRdVRmK24yOW8rZEJqRUh6TkdEYUF5NFhMRTV6?=
 =?utf-8?B?eWpMV09OZ3VuVWlaTDUwMlR3dk9TVVZUaTZ3UGFHOUcxWXpnZ1BrSXM3NFhh?=
 =?utf-8?B?dE5FbXB2TFdkUTFDblEyYWk0M0tvVjhNVTZLendLTlBhTWM4ZzhoQzhld3I0?=
 =?utf-8?B?eUFkVmxERXpBRXRxV0MwMVMzUVFpQ0F1TXlZYnd2R0EvK2tYNFBzNVZFTTVo?=
 =?utf-8?B?N3Roak1zZEhZWlRPZzhtcVc2WSt3ajcyaFc5cDI4dTE4MzlVNUxibjRjQ3Zh?=
 =?utf-8?B?c2ROd0J5NXI2bGxZTytiSWNpT0RYNUw2K2MwK2Iwd3RDem0zY1V6SkRxb3pS?=
 =?utf-8?B?UGdqenJhcVZUMUgza25oWDYxanFvbVNnZjg4c1ZBSVZWcnM1b2VHK3psWWoy?=
 =?utf-8?B?UERlQ29rTVp6Qk1PbXl1a29TY2Q3ZExPbDBTZXAzZzZxbDhFSWR3RDVKOHdH?=
 =?utf-8?B?d1ZEMU0xZHJmdmN4NjEyOG9CQTJSSzg0dE5RYUk2RlB1aUQyL21JdVFwcG5o?=
 =?utf-8?B?aUdiNk5nUm5lSnhGT2l0cUVzSlBSY0ZoQW9pYm9sa3BIS1pUQzNRUzRyOVIw?=
 =?utf-8?B?bll5cHdYWERxVTBOZ1JETFVpV2hPK3Vhc3NWSkU1TlloUjBneWR3clFWcUVk?=
 =?utf-8?B?RU0xTWJ5TnVzTjJnRkxnV0VycG9UeFJzTlZ5RGl5eWFuUGlteW8wZFQrdDRL?=
 =?utf-8?B?QTl3b2lFS2dBbEVMOWdPb3VMUDJBMldZRUdRdkpBYU5pT3J2Z1hsQnd1R0h2?=
 =?utf-8?B?UDY2Z0ZZY2VjU3hYbFdLVUlSTEYrcUNBcTZCU2ZsZ3U4NWxoN3FYNklEanl0?=
 =?utf-8?B?VXdEQ1pPMXZuVXRkb3BFY0Y2MDY1bGMzVHNBYk90WURMUm8zTjdxOTQ5MXpw?=
 =?utf-8?B?S3pqaGxKYTUxNjl0amQ4bzMrelU3Y1ZNZG1jOGw0T21sSHpla0RBYXY1b09L?=
 =?utf-8?B?SjVaVkJRU2grMGNmdTJrWDUycG9GVjdsbk8vOHp0MDl4QlViQW1XYTFVd2FZ?=
 =?utf-8?B?RVF1dHFMaWZBRjhub0ZUSG1IUEd1ZmlkcTVQd2YrOXpCNmgxZVhFZzdNaS9t?=
 =?utf-8?B?UGhETHdCN2dyRUlKVUFtU1VmMlhOOE5vN253T1VENkFnM3pQYXN5Z2l5MExY?=
 =?utf-8?B?SDRQa3NtUkFSaG9YZ2NpbjNWS0FOL3prZmZObE1uZWlIbWI0T0JpaVJ1ODFV?=
 =?utf-8?B?dHNaRi9UYzhFYXFFMk1CK3JkVFBtL3F2K2pPVnNEcDg4dVdGUFBhVVBMZFpC?=
 =?utf-8?B?bnhqVmJNcTVVcUlIWXpMcWFZNldwLzBIY3RrckxWSVlVZmVZdXJNQ0E1SlY5?=
 =?utf-8?B?Um45WXBiRldxWHFwY01xbjlhVHZRY1VJc1BobEYxR29mb2hEcWMxeEE0U1JM?=
 =?utf-8?B?RUZmZ2xiajQ1UXQ5MkZycU5QQkNrSzhyeEdRdklPa1MrL2F4Z0NVbk1PTmE5?=
 =?utf-8?B?Y2t4TmQ0NGtMWlRzSzZXdVVXWHcwYTdYVGNacVZ5RWhEZGlDMlYxbVhTdDNP?=
 =?utf-8?B?UWNpYm1sd3doUlE4bHhIanVmQjBUSzVMT0FIRTFuaS9JdG4wdjIxOGxRUWZs?=
 =?utf-8?B?akhWTmdCRjNaa2JoU1g1M3lmMEhOMVhGZmlwdXNQaHFJOGw3K3NuYXdtaGpw?=
 =?utf-8?B?YWZGUjZiTFpPRFVacGRlekFvL09qeFFoOC9ZTHh1Nm50OTJ1MThTMG5xQktI?=
 =?utf-8?B?RmhlUHdYeHZpVkM3bGdTS3ZtYk9KTXNpOTE0Ui9MUTdsamJGNU05U0lJUHBO?=
 =?utf-8?B?VTBvZGV2Qml3MDR0RmVKbS8zRjR6SmRiVENLcFRwSHk3QlBNKzZaeE81N0Rt?=
 =?utf-8?B?UWZNbXdkSlNzWGx4cUNHdXBrUmpZMUNBb0RORjdRRTRUbVkvcTVNd0VlK0Nw?=
 =?utf-8?Q?ZCFS42tm2/YEfsWW4rBCc3SsIZs3ikO8Qj8kQl/QK3YSM?=
X-MS-Exchange-AntiSpam-MessageData-1: PDaM82vOtVN2NA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a2cfca-28fc-45cf-f33f-08df0e35baba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 05:46:44.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DH2uEAqLRcp8K6T5WmZfsGR9bqC5tqMELoaMVT8etS3RlzQ/myv6G2IxC+oJP6ianwK3FaqOqMc4srV/32jfmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7898

On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
> Msgq v2 moves the four ring pointers out of shared memory into BAR0
> registers and treats them as monotonic counters, so head =3D=3D tail
> distinguishes empty from full and the ring uses every slot. The pointers
> can also be out of step, because a GSP reset zeroes them while the ring
> keeps its contents.
>
> Add the v2 TX header and the v2 ring helpers in parallel to the v0 ones,
> so the flip commit can swap call sites without writing new logic. Read
> the queue as empty while the read pointer is ahead of the write pointer,
> rather than taking the difference as a page count.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 140 ++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/fw.rs   |  36 ++++++++
>  2 files changed, 176 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 1eeef2120b6e..a46d8927da1b 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -467,6 +467,146 @@ fn advance_cpu_write_ptr(&mut self, elem_count: u32=
) {
>      }
>  }
> =20
> +// Msgq v2 internals.
> +//
> +// Msgq v2 keeps the four ring pointers in BAR0 registers as monotonic `=
u32`
> +// counters that wrap on overflow. The slot index is `ptr % MSGQ_NUM_PAG=
ES`
> +// only at the point of use, and the ring uses every slot (no "leave one
> +// empty" rule, since `head =3D=3D tail` distinguishes empty from full).
> +//
> +// Register-to-role mapping for queue 0:
> +//
> +//     CPU TX write/doorbell:  NV_PGSP_QUEUE_HEAD
> +//     GSP TX read:            NV_PGSP_QUEUE_TAIL
> +//     GSP RX write:           NV_PGSP_MSGQ_HEAD
> +//     CPU RX read:            NV_PGSP_MSGQ_TAIL
> +//
> +// A GSP reset zeroes all four counters while the in-memory ring keeps i=
ts
> +// contents, so the two ends can be out of step. Between the reset and
> +// GSP-RM writing its counter back the read pointer is ahead of the writ=
e
> +// pointer, which `driver_read_area_v2` reports as an empty ring.
> +//
> +// TODO: suspend/resume reset-recovery is not implemented. A power cycle
> +// loses the driver-side counters as well, so both ends have to be
> +// re-established.
> +#[expect(dead_code)]
> +impl DmaGspMem {
> +    fn gsp_write_ptr_v2(bar: Bar0<'_>) -> u32 {
> +        *bar.read(regs::NV_PGSP_MSGQ_HEAD).address()
> +    }
> +
> +    fn gsp_read_ptr_v2(bar: Bar0<'_>) -> u32 {
> +        *bar.read(regs::NV_PGSP_QUEUE_TAIL).address()
> +    }
> +
> +    fn cpu_read_ptr_v2(bar: Bar0<'_>) -> u32 {
> +        *bar.read(regs::NV_PGSP_MSGQ_TAIL).address()
> +    }
> +
> +    fn cpu_write_ptr_v2(bar: Bar0<'_>) -> u32 {
> +        *bar.read(regs::NV_PGSP_QUEUE_HEAD).address()
> +    }
> +
> +    fn advance_cpu_read_ptr_v2(bar: Bar0<'_>, count: u32) {
> +        let new_rptr =3D Self::cpu_read_ptr_v2(bar).wrapping_add(count);
> +
> +        // Order all reads from the message data ahead of the read-point=
er
> +        // update so the GSP cannot recycle the slots while we are still
> +        // looking at them.
> +        fence(Ordering::SeqCst);
> +
> +        bar.write_reg(regs::NV_PGSP_MSGQ_TAIL::zeroed().with_address(new=
_rptr));
> +    }
> +
> +    fn advance_cpu_write_ptr_v2(bar: Bar0<'_>, count: u32) {
> +        let new_wptr =3D Self::cpu_write_ptr_v2(bar).wrapping_add(count)=
;
> +
> +        // Order all writes to the message data ahead of the write-point=
er
> +        // update. Writing the head register doubles as the GSP doorbell=
.
> +        fence(Ordering::SeqCst);
> +
> +        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(ne=
w_wptr));
> +    }
> +
> +    /// Returns the region of the CPU message queue that the driver is c=
urrently allowed to write
> +    /// to.
> +    ///
> +    /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
> +    /// that case the second slice will have a non-zero length.
> +    fn driver_write_area_v2(
> +        &mut self,
> +        bar: Bar0<'_>,
> +    ) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
> +        let raw_w =3D Self::cpu_write_ptr_v2(bar);
> +        let raw_r =3D Self::gsp_read_ptr_v2(bar);
> +
> +        let used =3D raw_w.wrapping_sub(raw_r);
> +        let avail =3D num::u32_as_usize(MSGQ_NUM_PAGES.saturating_sub(us=
ed));
> +        let w_slot =3D num::u32_as_usize(raw_w % MSGQ_NUM_PAGES);
> +
> +        // Pointer to the first entry of the CPU message queue.
> +        let data =3D ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.d=
ata[build: 0]);
> +
> +        // SAFETY:
> +        // - `data` points to `MSGQ_NUM_PAGES` valid message queue entri=
es.
> +        // - We will only access the driver-owned part of the shared mem=
ory.
> +        // - Per the safety statement of the function, no concurrent acc=
ess will be performed.
> +        let data =3D
> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_u=
size(MSGQ_NUM_PAGES)) };
> +        let (before_w, after_w) =3D data.split_at_mut(w_slot);
> +
> +        let in_after =3D avail.min(after_w.len());
> +        let in_before =3D avail - in_after;
> +        (&mut after_w[..in_after], &mut before_w[..in_before])
> +    }
> +
> +    /// Returns the size, in bytes, of the region of the CPU message que=
ue that the driver is
> +    /// currently allowed to write to.
> +    fn driver_write_area_size_v2(bar: Bar0<'_>) -> usize {
> +        let used =3D Self::cpu_write_ptr_v2(bar).wrapping_sub(Self::gsp_=
read_ptr_v2(bar));
> +        let slots =3D MSGQ_NUM_PAGES.saturating_sub(used);
> +        num::u32_as_usize(slots) * GSP_PAGE_SIZE
> +    }
> +
> +    /// Returns the region of the GSP message queue that the driver is c=
urrently allowed to read
> +    /// from.
> +    ///
> +    /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
> +    /// that case the second slice will have a non-zero length.
> +    fn driver_read_area_v2(
> +        &self,
> +        bar: Bar0<'_>,
> +    ) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
> +        let raw_w =3D Self::gsp_write_ptr_v2(bar);
> +        let raw_r =3D Self::cpu_read_ptr_v2(bar);
> +
> +        // A difference wider than the ring means the GSP has been reset=
 and has not yet written
> +        // its own counter back, so the read pointer is momentarily ahea=
d of it. Report nothing
> +        // readable, which holds the callers in their poll until GSP-RM =
restores the real value.
> +        let pending =3D raw_w.wrapping_sub(raw_r);
> +        let avail =3D if pending > MSGQ_NUM_PAGES {
> +            0
> +        } else {
> +            num::u32_as_usize(pending)
> +        };
> +        let r_slot =3D num::u32_as_usize(raw_r % MSGQ_NUM_PAGES);
> +
> +        // Pointer to the first entry of the GSP message queue.
> +        let data =3D ptr::project!(self.0.as_ptr(), .gspq.msgq.data[buil=
d: 0]);
> +
> +        // SAFETY:
> +        // - `data` points to `MSGQ_NUM_PAGES` valid message queue entri=
es.
> +        // - We will only access the driver-owned part of the shared mem=
ory.
> +        // - Per the safety statement of the function, no concurrent acc=
ess will be performed.
> +        let data =3D unsafe { core::slice::from_raw_parts(data, num::u32=
_as_usize(MSGQ_NUM_PAGES)) };
> +        let (before_r, after_r) =3D data.split_at(r_slot);
> +
> +        let in_after =3D avail.min(after_r.len());
> +        let in_before =3D avail - in_after;
> +        (&after_r[..in_after], &before_r[..in_before])
> +    }
> +}

I think this is a good candidate for a trait, instead of using *_v2
named functions. Similarly, think we should also abstract out sending
commands (later in this series) with a trait.
