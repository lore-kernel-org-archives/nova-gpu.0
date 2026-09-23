Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022127.outbound.protection.outlook.com [52.101.101.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC11055D860
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790182045; cv=fail; b=eqp/SgsTyjqFbYBx9RGcc5YaAI+d2lXB+hlgN01ljg3mux5nvYYFOe640WwzFJdDwS9avvtk0CacE9huOBZ4CEZmf0sTe5hLTW7uODelfrAAetn/ZXxpSAj542MbBz2XQUGrn3sjLTyfemxkIWa/WakUXL2DKUlqqr+Z3H7L8zw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790182045; c=relaxed/simple;
	bh=sDQ6GMxXak0YDfceh+sjOzAeKfnidSAVY7ZoSmkcN7k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pt8+epziIaaduVegi5RHm6uTXO3bWJXN5ZIiLRhXJNqyJZcx5wUL57HfKG7WD51UU1FVrG5dj/351bCOXNOo//sQktTYP73/4i7P5O5s2k6xZEDn5FzX7P2W/o3MvJ4cLCNYzUohw2KdWzb11WCq+zgnZtBAtaCgwJEMpGyOrkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=jazPfo6S; arc=fail smtp.client-ip=52.101.101.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="jazPfo6S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6GchP4cT1Do1nV4JaSj+r256nwTK4P/RLJZLkMvxJVE2DrnJ8uX7ck86QlEj3wsk7i2mOX4abA60C98uqXToTZpxouSJKrEPkkPU2MFJejf/sgqYUL2OD/UaC6CvKcD02Uv3C2LqCi5oS8J++jtPNvLVUBYEEaK3pk1gGgbBUPe4Y9hTUNsRRqZG+Ug8rxRverjFsdw0UZvyB2DfrbO82XBLREtKOHHF3b62Lty1dcyEsTj6E6HIA7BuqxPUydh/LVh8bXIMMmBqFpDk2a2ZPgxtSKyhx9m9VmAaqa+46oOKuXxnwp41fzNgEQEc9OoIZzsVfv48v3+4xeo7yt+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S16zuhR5Vwyw/I8pmdJSZlCM09CHQsiJaalMfLUWTsM=;
 b=dsLe0T/ncSX3lsLQtSSUBXVM+Bc7YQgBPCNeoU29jNShgjEDBlxoj3ml5mujyqGPbmUgsxVIQgB3wZyxrA4DuVWP8Fa9h6u6ThmcXUeqnseKK2HQJbqtvkvTpnNj/St4/RrEAYwlnDqAhJrtuhCFweYycQnTeJfMSH75bM8OPnSVAP9iPXUzAoczH4t7ahaFr+gLuvPXmGatouhu4BAZpQ+mjuRgOJ6SuEWOF0VGGdAnRAdJq7Wm7MY0Gt1+0hZ3Lxv32dLVMp2LeKFuaC+Ni/YHLsBXnhHRZcqfEbyk+AmYTWeb4Paauu4taVeFtcLKktuWKw/Gil5EXNn5Ee+N1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S16zuhR5Vwyw/I8pmdJSZlCM09CHQsiJaalMfLUWTsM=;
 b=jazPfo6ShinodtWsx3U0WIpF2CedskgcR9JdIHJ9kCDUKJ1DdUbRuySa74OIUtAoKpsCWGSKjp+etKkcky3XRz+9iFsKbO1xM4ZmhjIUaRi5Nb7KbCH4dWUqo7KALLYgxqGE3FPFjm4eW3TG4mZNN7ERL9gCW8p1JwN9UykK2Io=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO2P265MB7202.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:32d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 16:47:12 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 16:47:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 17:47:10 +0100
Message-Id: <DLMUKFL5CAZ5.2ICMKG94JXP52@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions
 from a count and a slot
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-9-jhubbard@nvidia.com>
 <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
 <DLMNTQWLGXJA.39Z56H8BZMBPR@garyguo.net>
 <DLMQ5TVNFSC1.2AGU37ACR0Y9Q@nvidia.com>
In-Reply-To: <DLMQ5TVNFSC1.2AGU37ACR0Y9Q@nvidia.com>
X-ClientProxiedBy: LO2P123CA0084.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO2P265MB7202:EE_
X-MS-Office365-Filtering-Correlation-Id: d479c290-9f98-4947-d2ad-08df19925064
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|7416014|366016|376014|1800799024|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8f/rEyN5VT2ZI5BpTU4gXa35y5xAmFqLxNBcSg0fNmGr2dQxkw/UoRszpdf+39yM1s09VkSbuA4+NIZgyCeS13StXqNWDOGHWai+2PbV/HUdhZuCL7bIKWTC39gDfKDmbpi05LwhH9aJkF9leHC2NDSj8YBI8McV4X04fScDpL9+I980+GCfNuAsZDfy1nGZPRiAfDuIvUJTPbzCfUGzPMAJpRNEuW7OJEncafjRr8Lf9rpaYaMrjS9hb7B/7jkkf2EEZfDMScVu+TxxKGjLPjU/Cxk6BZvIMmgMatJvUR1yAVMSlOBahlWp+8rzbU748SahaWaMNYD0DE9rJ2dlil7+l1MukLyoze2/5YiVV97VmwgD1XPZz7nHt/CLyVZF/3Fh62ke8GcDh04RyRVbh5PnsqO2tYC2Me5x5uCNvn7m4qk7kUZbzyuxOlnSk/oplwaTiP0tfWZCmKpLmrLr6UoxWzt8QbkxBF6Cl4lD9K81Pv8LJL1k8jU4bSaa9pNX1fM83WahljkcxLqWKbRS1VmzBrLrSUNlwwxkO+IFETaTGuq2wWQgBeGlcoOeMGpk9fp6S7r65rFY+SyVypwocJmigRTORJz8zps6qca4e0fWGc/G6mhm89Yfw3Ti4MxON0izQ9vwjlUvjFJh0x1TvNwMStyaWJYqSM5c8O0OuBQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(7416014)(366016)(376014)(1800799024)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emJ0bks2d3ZFeS83dHNJTHd2UDIxTENqMHluY3lMTXR0RjRBbC8xczE0Q1J5?=
 =?utf-8?B?ajNvRmRTQmJZMk9JTmFZKzhGWXQrOC8wUnp1cTZ1L1ZvSE4yditHQ3pxTUJ2?=
 =?utf-8?B?d25lYmxzNEloa2JDbTArYlpRdTNqbytKTWY2MHdjbGhTb1JzdVhFRmthZ0RD?=
 =?utf-8?B?NXVmb1JlL1lqdjFGTTZYN2ZXMnlhendLTDNmUExWR1pGbXcxWFlBMnA0TmUr?=
 =?utf-8?B?blFoSXY4MS9Tb2dKbko3b3FobThObGdOeFdsZGlPOGczTUtXay8zaGNhQWhJ?=
 =?utf-8?B?SjZ4U1cvTWlLdFFOYjRoRXNhaVdzUUxuK2t1ZVU4VlRjNm4weFpIV2ViV2J5?=
 =?utf-8?B?cks1VzR1SXNPR2lxRmJyc3lIa0VvY1dUTDlXV3paL09ZUEh6OUM3cUlUL1Fr?=
 =?utf-8?B?L1c1N1Ard1pmOCtmK2t0bHo2U293a2xvNTNZQUdzMFp5NTdhUUxGd0srZnlB?=
 =?utf-8?B?ZERLZXROZWQ2V2VvRWNLckNTVDJHNmpoVkczbFY5aVFLbEFTakJJS3VvYnhq?=
 =?utf-8?B?RkxRMVNVazc3SzJSUE8ySjg1ZTVRVGxDRjIzWGtmWnJtMkphU05uU01FN202?=
 =?utf-8?B?aHhRdS9FSXhMNE5oOHFrelFVVzR4czIxRkdHbWl1ZTNLZmVDV3laMXczRzFx?=
 =?utf-8?B?VlloeEhCa1ZYVGFiOXZ1eW5ZaEtJVUtleVNVbWZTNG1BT015c3pYOS9zZ1FR?=
 =?utf-8?B?UXVnc1BJbEoyZFJMMEkxcU8vSGsvRGkxT0FZQ05mWVRGdDdtMGlaYUY5OC9K?=
 =?utf-8?B?OW0wV0hPbnc5QjkycS9nZVdWZmgxNTRoc1ZGcUpSRmM2b0VrZ2ZMTzRVbjRs?=
 =?utf-8?B?S25aVWJwaXlCaG9YNWpkenI1MUQ2S1daZkVScXlTaEM5VVRiZ2FmKzJidzZx?=
 =?utf-8?B?bEM4WUltb0tJenQvUnN2L1gra1UrR2tQaWpNT0FKLzNrM3RaZkpJUjcrNmUv?=
 =?utf-8?B?UUxBR3IxbGovZHN5b1BaVEdCS2p4ak5EOUJjWXlIbkZ2Z3RCQVYwM09MNGQ4?=
 =?utf-8?B?U1g0SEFPeVlISmNmS0MrcW56bVBjWFhzWHNmMHVhZ05JZEJlR3dwTHJJM2Rr?=
 =?utf-8?B?bWVrUVVnNnV6OUR6NHdzZ1Q0Q21kRVNZZncvUEo5aDBxdUNkK1F2QWR3WkJz?=
 =?utf-8?B?NU5ROFNHUFlIekNncXdvQThUaFpNRUJsZ3hWZUhmY1Ntck1nTVBoNWpyVm1y?=
 =?utf-8?B?cVgzYzNYMmRTc0NTNndTRTRuTTZZb0pBelNidTBsd3pURU9td0J3OUxPaTdt?=
 =?utf-8?B?V1F4d1l3b2lBdzc2RHp2c1NhUnNWNUtWbUxIUzdCZGxSdUVCbDhjYWFGejIz?=
 =?utf-8?B?bGdscUoxRjBOVFFLdzBRRUFvdHA2a0pTb2NXbFZaQlgwV25pS1dDcytVQ2lT?=
 =?utf-8?B?dE9UbG9jeUJRYVFOSTdyeG8vYVgzQ2hPeXcvVkNMUndyNGdaWUJXSnJGVUNt?=
 =?utf-8?B?clpvbyt1K0FFWHNBLzEzNGsrb2phZ0FOdXFieE5kWXJjTUl1TG1tVGZxYmh5?=
 =?utf-8?B?OTdJdTB4Szd5dVR1eEU5azlUTk5JcDJTQmgreFp5V2poWUlleGo4NE9heThH?=
 =?utf-8?B?d2hHaVo5V3RZQU1pSUVicVIrbFlxVVNpb2htZEowUzg3ZWl3dm5LOG5GMUc5?=
 =?utf-8?B?TGZHb0N4VUYwWHo1TnloTHdqOHVHdm9ORTl5Q0lsTWh4bTk2eFQ2bUNDZU1v?=
 =?utf-8?B?cHBiR2g0TUZLQmptVUFEYzFoRE5iNGVCdjA5WXRUS3JKTWZYZnRGU3dkUE11?=
 =?utf-8?B?dHZlOXgwb2dLc090czJGcHhJZHpTVE0xWmRjT29oQ1R4N0p0ZmRFK0xYNXNH?=
 =?utf-8?B?RGFQeUZHVFM5ajhWVkUwUnhNaG44ZC8zOXRXQ2RiUWNaTkR5NndyV1NEUmds?=
 =?utf-8?B?eGVIMXZBTnlSWld0U2dQU2s4YkNSczUzdXE2REhtMWFkSmo1QWNHOEFzK3Nu?=
 =?utf-8?B?VEtBN041bFNVRlkzV1lBenFUc1lQWkJrcXl2L0dhcm5PWUdFbG82N2pyR0pT?=
 =?utf-8?B?Qm1pMUhmV000VHJ4aTB0bzRNNnIyc1JqbUNsV28weDhCb3pnSjJCRFlMUWtZ?=
 =?utf-8?B?eTFMeGFnOTVvblpJYlEybWRqcUVtZGdvbmNGSGNoZHl3UnZ1V091U2wwNnBD?=
 =?utf-8?B?M0YrQ3c4ejhEQ2gvN1JtOVRnQmdHSTUrWkRIS2kvQnRQT2xXVlZjTE11dk1O?=
 =?utf-8?B?ekN0blFnYmlLcCs4UFZzdlRGeWZrY1JIRlFKZTFFc2VacDJaSnFvQm5kL1Rs?=
 =?utf-8?B?Nm1zdEZnTk5QSlhiUmhGZlRmTGYvWnBTMU5Md3I3SmVnUks1WHh4OWNqYjgv?=
 =?utf-8?B?Ykt4SEZQTzBtQjRKaVZSK1hlOVVjdnh4SUdhQVBEdGtQYXNsQUc4UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d479c290-9f98-4947-d2ad-08df19925064
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:47:11.6319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zY2ko6J4D5EUHo3SoOF2nH2crmmgTw+dnon0zFg9L1Ole+RdOYmODm8/qUKtoNolHm+B1hGWCCzibrMV7uxlBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB7202

On Wed Sep 23, 2026 at 2:20 PM BST, Alexandre Courbot wrote:
> On Wed Sep 23, 2026 at 8:30 PM JST, Gary Guo wrote:
>> On Wed Sep 23, 2026 at 5:55 AM BST, Alexandre Courbot wrote:
>>> On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
>>>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &=
mut [[u8; GSP_PAGE_SIZE]]) {
>>>> -        let tx =3D self.cpu_write_ptr();
>>>> -        let rx =3D self.gsp_read_ptr();
>>>> +        let avail =3D num::u32_as_usize(self.free_slots());
>>>> +        let w_slot =3D num::u32_as_usize(self.cpu_write_ptr());
>>>> =20
>>>>          // Pointer to the first entry of the CPU message queue.
>>>>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.m=
sgq.data[build: 0]);
>>>> =20
>>>> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
>>>> -            // The write area is non-wrapping, and stops at the secon=
d-to-last entry of the command
>>>> -            // queue (to leave the last one empty).
>>>> -            (MSGQ_NUM_PAGES - 1, 0)
>>>> -        } else if rx <=3D tx {
>>>> -            // The write area wraps and continues until `rx - 1`.
>>>> -            (MSGQ_NUM_PAGES, rx - 1)
>>>> -        } else {
>>>> -            // The write area doesn't wrap and stops at `rx - 1`.
>>>> -            (rx - 1, 0)
>>>> -        };
>>>> -
>>>>          // SAFETY:
>>>> -        // - `data` was created from a valid pointer, and `rx` and `t=
x` are in the
>>>> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_wri=
te_ptr` and `gsp_read_ptr`,
>>>> -        //   thus the created slices are valid.
>>>> -        // - The area starting at `tx` and ending at `rx - 2` modulo =
`MSGQ_NUM_PAGES`,
>>>> -        //   inclusive, belongs to the driver for writing and is not =
accessed concurrently by
>>>> -        //   the GSP.
>>>> -        // - The caller holds a reference to `self` for as long as th=
e returned slices are live,
>>>> -        //   meaning the CPU write pointer cannot be advanced and thu=
s that the returned area
>>>> -        //   remains exclusive to the CPU for the duration of the sli=
ces.
>>>> -        // - The created slices point to non-overlapping sub-ranges o=
f `data` in all
>>>> -        //   branches (in the `rx <=3D tx` case, the second slice end=
s at `rx - 1` which is strictly
>>>> -        //   less than `tx` where the first slice starts; in the othe=
r cases the second slice is
>>>> -        //   empty), so creating two `&mut` references from them does=
 not violate aliasing rules.
>>>> -        unsafe {
>>>> -            (
>>>> -                core::slice::from_raw_parts_mut(
>>>> -                    data.add(num::u32_as_usize(tx)),
>>>> -                    num::u32_as_usize(tail_end - tx),
>>>> -                ),
>>>> -                core::slice::from_raw_parts_mut(data, num::u32_as_usi=
ze(wrap_end)),
>>>> -            )
>>>> -        }
>>>> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entrie=
s of the CPU message queue.
>>>> +        // - The returned slices cover the `avail` free slots from th=
e write pointer on, which the
>>>> +        //   GSP does not read until `advance_cpu_write_ptr` publishe=
s them.
>>>> +        // - `split_at_mut` gives two non-overlapping halves, and the=
 `&mut self` borrow lasts as
>>>> +        //   long as the returned slices, so that no other call hands=
 out the same region while
>>>> +        //   they live.
>>>> +        let data =3D
>>>> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_a=
s_usize(MSGQ_NUM_PAGES)) };
>>>> +        let (before_w, after_w) =3D data.split_at_mut(w_slot);
>>>
>>> This creates a reference over the whole ring, including the parts owned
>>> by the GSP, which breaks the `Coherent` safety contract that the device
>>> must not be able to read or write to a live slice. So we'll need to cal=
l
>>> `from_raw_parts_mut` twice, with the correct sizes, instead of
>>> splitting.
>>>
>>> (also `split_at_mut` is panicking and should have a `PANIC:` comment
>>> justifying why it cannot, but once the point above is addressed that
>>> call will go away).
>>>
>>> I wanted to try it locally and ended up with something that seems to
>>> work, so let me share it to save some time:
>>>
>>>     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mu=
t [[u8; GSP_PAGE_SIZE]]) {
>>>         let avail =3D self.free_slots();
>>>         let w_slot =3D self.cpu_write_ptr();
>>>
>>>         // Pointer to the first entry of the CPU message queue.
>>>         let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msg=
q.data[build: 0]);
>>>
>>>         let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
>>>         let in_before =3D avail - in_after;
>>>
>>>         // SAFETY:
>>>         // - `data` was created from a valid pointer of `MSGQ_NUM_PAGES=
` entries.
>>>         // - The `in_after` entries after `w_slot` belong to the `avail=
` entries that the driver is
>>>         //   currently allowed to write.
>>>         // - The `in_before` first entries belong to the `avail` entrie=
s that the driver is
>>>         //   currently allowed to write.
>>>         // - The slices do not overlap.
>>>         unsafe {
>>>             (
>>>                 core::slice::from_raw_parts_mut(
>>>                     data.add(num::u32_as_usize(w_slot)),
>>>                     num::u32_as_usize(in_after),
>>>                 ),
>>>                 core::slice::from_raw_parts_mut(data, num::u32_as_usize=
(in_before)),
>>>             )
>>>         }
>>>     }
>>>
>>> It has turned out quite short, which I like! I also opted to work with
>>> the original `u32` until the very end, as it results in less conversion=
s
>>> overall.
>>
>> Possibly take some thing from the old projection syntax rework series?
>>
>> https://lore.kernel.org/rust-for-linux/20260415-projection-syntax-rework=
-v1-4-450723cb3727@garyguo.net/
>
> Oh yes, I forgot about this patch. Do you mean using `ptr::project` to
> create the final sub-slices, or am I missing something else?

I think it's possible to use I/O projection on `CoherentView` and then you
assert that it's not concurrently accessed by turning them from `CoherentVi=
ew`
to `&mut []` using `CoherentView::as_mut`.

Best,
Gary

