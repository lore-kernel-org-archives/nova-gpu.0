Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686143F0A92
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 04:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790139497; cv=fail; b=RuGU7dpv6gCYbq8WOiX7LQZNcDRmBJ0zGvtog9JtojgcUNOtRoHoGJCnTX3g5DFyPQhjBxUo5ez9UKsV5zrSRp74Ar6jvuNq8oAhTVlhVxBW79NJ3NKYpta37Ja4qJKsppLQzTNq9LCv6ZMMGOeYNehNMbIg8XsYFSADRjrTLCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790139497; c=relaxed/simple;
	bh=XL4YCAoLcIXtZMPZ/Anpn5YJVsHgJOhqaS0KPVmEir8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NTEqzJW0zjyGrjQh8sSbdijJhUQfOOeWlmMYzxUJRYav4VcoaJ32gFjHrVywgHPidNKcstk3Yjvh3bUMAX9/KUpxJBDobwocBOOKSLQ2zGDApOxEFZU5+1WFRvpiTgJB7biyphaZZMQR7rmKJTKnSmwDVvH6+zJTA4akndGxtW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ELQ6eLw9; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ELQ6eLw9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiGJeRNJytCCZ9/Uofiewf1ZrZ8/sMiBBO3tqGY89W3PyojJ5+m/1jdMe7E6AbJpXonkL3Ao+vjCmN7nC2fSkX609X3Z9nmyDD0IV9F/MIWvpYPr+NvHFr0cDIpx7XF+//h2exXsXjRanBZY+aWULczqP1+AIJxI05SAbvmEtkS86dDhizXYRVKei5k0e4k+4wU72o5ZBMxVNXeExX7FdQ7SKfxTNJ88RGWQL8Xu9AejJWWYBurHT3qHs916wsJ++6PQ+6688MOBxQfiaUFHST2+kH/KHQ9MlvmkceOnoLmCHYnQuZ8tmu1pGW5P/apt+gKUaT+RWEA303xVA1yNPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+JJ8+q8l6jng8BCcaeOVzg7aEhtzYrDvMIje+3KZyk=;
 b=uylZ+dy43duFTQU5eiCn3Khkm3Me/qbX0hUdmdwDyU8GrP0rXyAqyfxfpKUX9f9cOxDMlPQiswXVQUnURwoiL4b30i8jmuuIOr+WSGDs5QyTfe2zGYYAU6JxNRUJkOl/O9AF0Pnu8NlJ59Tw21CIx402kDrsZ8riKSswCIcsyvsR+l78ovMWMRyxR5iC9skXmO2nzty1EJW+Bvni6jRpAmzVKukOcARTD+vtFig1pOx/T5sXmDzZeAXbk9GkahVkRcqe/xWA0E44RVaB+jyKKfx/O8TPDkwcZU8vL9RfmdLmM6Dwd/JDXI9azGzVlClTl4nDiqlTP/k7ge1N0bi4aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+JJ8+q8l6jng8BCcaeOVzg7aEhtzYrDvMIje+3KZyk=;
 b=ELQ6eLw9b5tDrUxQ5j2OToZbDNUSn09lJLrc7Ss2nESjd2I7mrV/4OAXcYHimKf5119PCCDNcGsAQkFJTNhO80X+OkMJKXnogcw136RjqnonJ17ItPdhM2rW0BaybmnjrKqGtJ9AoC40w67FswcuBwn5iCHDPQ/bykV+U/Ym61c8KhXQXj5ZP4S3ZCbo1kFlNOxzVAFnGtwHzT9F6Ly1R5Fnu2tkTRhfLBwCxy6TtBRKsIctLc75gyoXTZKMAfOXzbTbtPFuuiP5KmNUJ8BqQaWs2txN4JBdK5pAfTO/Yl7PiL62LWHiY1ctERB33q3Q2ksr4sEcEqNVAXdpkZldSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB9042.namprd12.prod.outlook.com (2603:10b6:8:ed::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 04:55:50 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 04:55:50 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 13:55:42 +0900
Message-Id: <DLMFFOSI9SZ9.2ECOM8X8PA147@nvidia.com>
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
Subject: Re: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions
 from a count and a slot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-9-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-9-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB9042:EE_
X-MS-Office365-Filtering-Correlation-Id: 968639e3-e08f-423b-5fa2-08df192ef059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|23010399003|56012099006|4143699003|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	kzcqenk69AtnEoTJvrk4DGekTH4ch9FFKd9WxMxvNB9+1hEqDgBUtqJd9TdEYx4yXWAgXssaJ98mNGwkekiWKQzW5nGPM+Fn/SCurkmJYX0XNsNZibhYRw6d/4PZJUSkAsExYwv4JUdIc7WDBzrqiImPfFOMrDh+ZYVvXfQ90vhWI+HiiLvPFmnr8tAUsjVS3ncaojkdo4QBOZ0cVPODHVrCt9WgnhObstnbAflCMA03ZDP1i4d6frpftUsVlh5chfD3vcj9XbAl38Djxf9BmxHXwJrCb8y95BO+jP/gsjFDbTTLuKbp3u5Q3Uk+BGkXvePTGgFT8RqX7Gl16AzjOK8rAPGv20tD7MxNuSKQajFSGQ4JRIjGPbTsuXtbJCok5KiV+ns+W1u06RhW2w662kPbb2aM8jJ0yKuRkQtBgSoAJssPt2iSm+1dKyzkdzyNW0nEVfCStnaPNRWyZvHoJK/ppEFoisxpFP1g+0Iw/A8mgl0nnlivTpVl9ntxS2980I39vvhaUDM60Xfk5qtrvyTF/7FlhxPf18i9QxEhRezSG4edy4ajENH7s4ImP/fnRQx3UBvm+yrinqJSATIqSxfjdVmNwsQL4ZMXV5FsRyu/m1OGE/h/KxXl1E+dkvxSvJKOwBcS77h+V8KWbOSH27hmp9rFa55M+xLQQ+EGrQ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2Q3bVdJSlcrMEZmeVFDRmtOS0V0WlFVUVdmQVBRekNpL0lqb0Q3WG5nekhJ?=
 =?utf-8?B?WnV1TE56T1dvYW53RGFKQ2MvOElzYngvL3kzclhPWlQwWjBNVFYycDBBQUJN?=
 =?utf-8?B?dlcyNlpFbFN3TFN3UnNvSkU2cnJqZkx1a0IvbnpjeEs4TW85UU0rWU5wMGp6?=
 =?utf-8?B?WFpWK1A1dExDQ0dLZjVCSGxoSHc4dVYwdS9vcnVNam1tRHFlL1FXSmowTE03?=
 =?utf-8?B?Q3BYR2QrL2tGK0w3ZjFRRkxQdUxGL1pPUmtSMlZBT3NPaXJLa0JrL3Rpd1Uw?=
 =?utf-8?B?K29oVm5ZVldYcVFmWmVwclBCc3NCMjlUNisrUU91aHEzZ21qaHVHdGJOcVVa?=
 =?utf-8?B?bVFNZUVjT2dvWjdUZXRWZy9lUzFWTmljYkpxWE5wemdEeFRrK2RCVER3Nmxx?=
 =?utf-8?B?Q2hraDNieUZlSmVJajRkZjhoWUtHeDdzN1NHbDgzUi9zYXI1dVFHNUlxaTEr?=
 =?utf-8?B?SWdSQWhxU1VLeE0wa0Rhd0daakpJZmpVa3FyU1BKNnpxUDZTVkVhdTRhY0xD?=
 =?utf-8?B?dUF0QkJFUmxpK0V2amJubXVDTktpYkI2T1Q4ZVB5M2I2ZHRIbFZXYWZETndV?=
 =?utf-8?B?Q254cW5hd3NXcktWUXVDN1pmaFRLazJHYnR6R04wU1A4bExnRXd4MEZnY2hl?=
 =?utf-8?B?dHhVV1lRbU82cmlqRVJlZE1iRnZTN2hFamVrb3dzSnJRTm8rVjc2OUI0OGo5?=
 =?utf-8?B?Mm9tU0lmN0JaazM2RGtPSnczc0tjQkZkMlQycUtMbXF5RXBDeFRYWEowWHZJ?=
 =?utf-8?B?Z1JzTlhqdlVvQklhVXJmckZWTGVnL3oyYmdMVzdiZGJHSG92ZWsvMWdEbjRw?=
 =?utf-8?B?eVBCSWlkd3NxUVJ3YzNKc1ZOOEFEazgvQXpkL2VVdURMR3BZUUIzMDR4K0JO?=
 =?utf-8?B?czZXSkpyeEZRVkZweG1uRHUrMkhKSTQvT3JzRDNZdUVvdmFyeXE4K0VUQVhi?=
 =?utf-8?B?Q0tYQkJrQldIRno1R1Rxdkc2UXk3YTVlTmRxSzN5NUZFR0R0bzh0bGQwMnVk?=
 =?utf-8?B?NDdVV1RhZk1zSzkzaS9DVlMyN3lGbWsxalJWRWZON1IzcUpUTFJ0cCsyeGND?=
 =?utf-8?B?ZjRnMjFGRll2MmpvUVVRMlV2bndjZFpMM0JvRWl3anJkbEI2M1JaN1l4UXpw?=
 =?utf-8?B?WjJKSlJGUmQzZGV3bU16MFg1L0xUK1FlU0g4aFpxM3FCQjhhRXRWb3l4cGlV?=
 =?utf-8?B?N0tRa2VpaDNCWER0QzRFMWpOOHJaWlFKTEZCYmdSckRSYTNYVE1OQ09FQjk1?=
 =?utf-8?B?SlBWdFB0REN3amdodStHL21kRnVNbkkyZzNPdG44alF6dThzZ0twdk54V2dJ?=
 =?utf-8?B?TUxYbkRkV0RjOW5yV0FuSklXWGhYdnJqSVNOZXZ3UFNyMkNEbVZ6SENEcTZU?=
 =?utf-8?B?QnIwUDJhZ0dPMWZUNERkKzM0TzB1ZFhWZU8zV0RjZXl3TytiaE40c2hzWGln?=
 =?utf-8?B?aUdxSHdZbXVHK25DREdDRFNKeDVBVkVIMENvWHdTS1NuWFN0eEM1dEpPNXdQ?=
 =?utf-8?B?NFNNeTBMYnZRT3huVEZ2RG5CT3IyNUNDa3p2aUF0S2ZLSWRNTzVTeWVIcU5q?=
 =?utf-8?B?alpNT0kzQURLZ3pkZ0dma0RoMFp3bHlwd2x5aGpiTk1hd3oxMWtpRW1EWGw2?=
 =?utf-8?B?WGpZTENnd3U1T3NrMmV0cUQyUStZQXZTTGJEZTErZlBqKy9ZK2NnMXM0TUtz?=
 =?utf-8?B?NzlJL2QzZGNZMFhKN3NBM2wyL1dVcUY3L2QyazMxYjFpaDFxdWord0JmeWpH?=
 =?utf-8?B?OWlITDgzZ0o1RXM1ODhTN2Viem92RzNCeVJ2RXEzNDFzTXRXWjRSLy9leWVC?=
 =?utf-8?B?ek9RSVpxLzZCSCtvcDN1ZVVhWGdEUm1HV0tpRDB1WnRBTFlSalBJaUE4STVV?=
 =?utf-8?B?U3dJNCtEdzJ0ZVZ0QUVTcHRNdTRzaDU2bXVlL2NCSFcwaXd0eDk1UStkZngx?=
 =?utf-8?B?LzA0NFRGYXZPVEFOSnFwTXRoRzJTQTA3bTY5RVBDQTJydWpLZjZVU1dJalBY?=
 =?utf-8?B?VzhXMXh6WjAyK3Z6cWhZQmh1NlpLZ3dKNW5ac2lEYlh6dUErQmpPSms4azJL?=
 =?utf-8?B?K21QSzIvc2pVa1ZRTGtOV3lMRFBONWJRUWlSd291ZVFocTV0dWlhUG1qaWI2?=
 =?utf-8?B?QUJ1UEs5K1lNN2FjYzBhRG8vdDg4TDl3V04wai9rTTFJTUZMZUhvYitraEMr?=
 =?utf-8?B?SzFoN2MwY0xZVHJndnpuWGtnU0lzNmg4NHQ1MmpaaHd0Tk84Q3hrcHJReTNV?=
 =?utf-8?B?QlZhNS95RGw5Qk95T1RGK3BrK254ZG5ycmFGb2s5eEhNUUp6MFpDc2YzajJr?=
 =?utf-8?B?UHFMNUYrZnJpUHNEbmN1TWF6TWNSQi9wdHZZR3F4NzlBclJRNmJyaVM1Mzdz?=
 =?utf-8?Q?OvMh87Vi1H4hMYSmEGN6GffQK6WGprq5kgvl96Te7LVfP?=
X-MS-Exchange-AntiSpam-MessageData-1: vKANOADsy6jJDQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968639e3-e08f-423b-5fa2-08df192ef059
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 04:55:50.4259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY5D+OAkq42NKfKqwGR8Dye/MjWCxmBHE6qqutZkSuNXYmxiLfvBodZBvd4QeuUJgYvOjElF/HJlz7g4+l5cnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9042

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> The r000 firmware uses msgq v2, the queue layout that keeps the queue
> pointers in BAR0 registers as counts that do not wrap at the ring size.
> The r570 firmware's layout keeps the pointers in shared memory as
> indices into the ring. The two layouts differ in where a pointer is
> read and in how the size of the region that the driver may write, and
> of the region that it may read, follows from a queue's write pointer
> and read pointer. Splitting a region across the end of the ring is the
> same in both, and whether a region wraps follows from the order of the
> two pointers.
>
> The functions for the writable region and for the readable region each
> branched on the order of the write pointer and the read pointer. Each
> branch chose where the two slices ended, and the function then built
> the slices with open-coded pointer arithmetic. The SAFETY comments
> argued the slice bounds branch by branch, so the switch to msgq v2
> would have had to rewrite the branches and the argument along with the
> pointer rules.
>
> Compute the number of slots in a region and its start slot once, and
> split the ring at the start slot. The first slice ends at the end of
> the region or at the end of the ring, whichever comes first, and the
> second slice carries the rest.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 120 ++++++++++--------------------
>  1 file changed, 41 insertions(+), 79 deletions(-)

This looks like an improvement regardless of the r000 switch!

>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 80e6e79c5f3c..a1c9b7cce255 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -262,107 +262,69 @@ fn new(dev: &'a device::Device<device::Bound>, bar=
: Bar0<'a>) -> Result<Self> {
>          Ok(Self { mem: gsp_mem, bar })
>      }
> =20
> -    /// Returns the region of the CPU message queue that the driver is c=
urrently allowed to write
> -    /// to.
> +    /// Returns the region of the CPU message queue that the driver may =
write to.
>      ///
> -    /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
> -    /// that case the second slice will have a non-zero length.
> +    /// The ring wraps, so the region comes as two slices, and the secon=
d is empty unless the
> +    /// region crosses the end of the ring.

There is a recurring pattern in this series to drive-by rewrite comments
when there is no real need to do so. The new comment is not even
marginally better as we lose the temporal nature ("currently") of the
borrow. This creates churn restating the same thing using different
words and disrupts the diff, so can we avoid doing that unless the patch
actually changes what the comment describes?

>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut=
 [[u8; GSP_PAGE_SIZE]]) {
> -        let tx =3D self.cpu_write_ptr();
> -        let rx =3D self.gsp_read_ptr();
> +        let avail =3D num::u32_as_usize(self.free_slots());
> +        let w_slot =3D num::u32_as_usize(self.cpu_write_ptr());
> =20
>          // Pointer to the first entry of the CPU message queue.
>          let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq=
.data[build: 0]);
> =20
> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
> -            // The write area is non-wrapping, and stops at the second-t=
o-last entry of the command
> -            // queue (to leave the last one empty).
> -            (MSGQ_NUM_PAGES - 1, 0)
> -        } else if rx <=3D tx {
> -            // The write area wraps and continues until `rx - 1`.
> -            (MSGQ_NUM_PAGES, rx - 1)
> -        } else {
> -            // The write area doesn't wrap and stops at `rx - 1`.
> -            (rx - 1, 0)
> -        };
> -
>          // SAFETY:
> -        // - `data` was created from a valid pointer, and `rx` and `tx` =
are in the
> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_=
ptr` and `gsp_read_ptr`,
> -        //   thus the created slices are valid.
> -        // - The area starting at `tx` and ending at `rx - 2` modulo `MS=
GQ_NUM_PAGES`,
> -        //   inclusive, belongs to the driver for writing and is not acc=
essed concurrently by
> -        //   the GSP.
> -        // - The caller holds a reference to `self` for as long as the r=
eturned slices are live,
> -        //   meaning the CPU write pointer cannot be advanced and thus t=
hat the returned area
> -        //   remains exclusive to the CPU for the duration of the slices=
.
> -        // - The created slices point to non-overlapping sub-ranges of `=
data` in all
> -        //   branches (in the `rx <=3D tx` case, the second slice ends a=
t `rx - 1` which is strictly
> -        //   less than `tx` where the first slice starts; in the other c=
ases the second slice is
> -        //   empty), so creating two `&mut` references from them does no=
t violate aliasing rules.
> -        unsafe {
> -            (
> -                core::slice::from_raw_parts_mut(
> -                    data.add(num::u32_as_usize(tx)),
> -                    num::u32_as_usize(tail_end - tx),
> -                ),
> -                core::slice::from_raw_parts_mut(data, num::u32_as_usize(=
wrap_end)),
> -            )
> -        }
> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries o=
f the CPU message queue.
> +        // - The returned slices cover the `avail` free slots from the w=
rite pointer on, which the
> +        //   GSP does not read until `advance_cpu_write_ptr` publishes t=
hem.
> +        // - `split_at_mut` gives two non-overlapping halves, and the `&=
mut self` borrow lasts as
> +        //   long as the returned slices, so that no other call hands ou=
t the same region while
> +        //   they live.
> +        let data =3D
> +            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_u=
size(MSGQ_NUM_PAGES)) };
> +        let (before_w, after_w) =3D data.split_at_mut(w_slot);

This creates a reference over the whole ring, including the parts owned
by the GSP, which breaks the `Coherent` safety contract that the device
must not be able to read or write to a live slice. So we'll need to call
`from_raw_parts_mut` twice, with the correct sizes, instead of
splitting.

(also `split_at_mut` is panicking and should have a `PANIC:` comment
justifying why it cannot, but once the point above is addressed that
call will go away).

I wanted to try it locally and ended up with something that seems to
work, so let me share it to save some time:

    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[=
u8; GSP_PAGE_SIZE]]) {
        let avail =3D self.free_slots();
        let w_slot =3D self.cpu_write_ptr();

        // Pointer to the first entry of the CPU message queue.
        let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.da=
ta[build: 0]);

        let in_after =3D avail.min(MSGQ_NUM_PAGES - w_slot);
        let in_before =3D avail - in_after;

        // SAFETY:
        // - `data` was created from a valid pointer of `MSGQ_NUM_PAGES` en=
tries.
        // - The `in_after` entries after `w_slot` belong to the `avail` en=
tries that the driver is
        //   currently allowed to write.
        // - The `in_before` first entries belong to the `avail` entries th=
at the driver is
        //   currently allowed to write.
        // - The slices do not overlap.
        unsafe {
            (
                core::slice::from_raw_parts_mut(
                    data.add(num::u32_as_usize(w_slot)),
                    num::u32_as_usize(in_after),
                ),
                core::slice::from_raw_parts_mut(data, num::u32_as_usize(in_=
before)),
            )
        }
    }

It has turned out quite short, which I like! I also opted to work with
the original `u32` until the very end, as it results in less conversions
overall.

> +
> +        let in_after =3D avail.min(after_w.len());
> +        let in_before =3D avail - in_after;
> +        (&mut after_w[..in_after], &mut before_w[..in_before])
>      }
> =20
> -    /// Returns the size of the region of the CPU message queue that the=
 driver is currently allowed
> -    /// to write to, in bytes.
> -    fn driver_write_area_size(&self) -> usize {
> +    /// Returns the number of command queue slots that the driver may st=
ill write.
> +    fn free_slots(&self) -> u32 {

The method name should specify which queue we are dealing with here,
"free_slots" is too generic. And for symmetry the read side should
also get the same helper, even if `driver_read_area` is the only user,
as it makes the code easier to parse.

>          let tx =3D self.cpu_write_ptr();
>          let rx =3D self.gsp_read_ptr();
> =20
> -        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invaria=
nts of `gsp_read_ptr` and
> -        // `cpu_write_ptr`. The minimum value case is where `rx =3D=3D 0=
` and `tx =3D=3D MSGQ_NUM_PAGES -
> -        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - =
1 =3D=3D 0`.
> -        let slots =3D (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
> -        num::u32_as_usize(slots) * GSP_PAGE_SIZE
> +        // One slot always stays empty, so that a full ring and an empty=
 ring differ in their
> +        // pointers. `tx` is below `MSGQ_NUM_PAGES`, so the subtraction =
does not underflow.
> +        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
>      }
> =20
> -    /// Returns the region of the GSP message queue that the driver is c=
urrently allowed to read
> -    /// from.
> -    ///
> -    /// As the message queue is a circular buffer, the region may be dis=
contiguous in memory. In
> -    /// that case the second slice will have a non-zero length.
> +    /// Returns the number of bytes that the driver can still write to t=
he command queue.
> +    fn driver_write_area_size(&self) -> usize {
> +        num::u32_as_usize(self.free_slots()) * GSP_PAGE_SIZE
> +    }
> +
> +    /// Returns the region of the GSP message queue that the driver may =
read, as two slices
> +    /// because the ring wraps.
>      fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PA=
GE_SIZE]]) {
>          let tx =3D self.gsp_write_ptr();
>          let rx =3D self.cpu_read_ptr();
> +        let avail =3D num::u32_as_usize((tx + MSGQ_NUM_PAGES - rx) % MSG=
Q_NUM_PAGES);
> +        let r_slot =3D num::u32_as_usize(rx);

Indeed, with a helper like `free_slots` for the read side we could get
rid of `tx` and `rx` and spell what the code does more clearly, so I
think that'd be a win.

The helper makes us read the CPU read ptr one extra time, but that's a
negligible tradeoff for better code readability.

> =20
>          // Pointer to the first entry of the GSP message queue.
>          let data =3D ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[bu=
ild: 0]);
> =20
> -        let (tail_end, wrap_end) =3D if rx <=3D tx {
> -            // Read area is non-wrapping and stops right before `tx`.
> -            (tx, 0)
> -        } else {
> -            // Read area is wrapping and stops right before `tx`.
> -            (MSGQ_NUM_PAGES, tx)
> -        };
> -
>          // SAFETY:
> -        // - `data` was created from a valid pointer, and `rx` and `tx` =
are in the
> -        //   `0..MSGQ_NUM_PAGES` range per the invariants of `gsp_write_=
ptr` and `cpu_read_ptr`,
> -        //   thus the created slices are valid.
> -        // - The area starting at `rx` and ending at `tx - 1` modulo `MS=
GQ_NUM_PAGES`,
> -        //   inclusive, belongs to the driver for reading and is not acc=
essed concurrently by
> -        //   the GSP.
> -        // - The caller holds a reference to `self` for as long as the r=
eturned slices are live,
> -        //   meaning the CPU read pointer cannot be advanced and thus th=
at the returned area
> -        //   remains exclusive to the CPU for the duration of the slices=
.
> -        unsafe {
> -            (
> -                core::slice::from_raw_parts(
> -                    data.add(num::u32_as_usize(rx)),
> -                    num::u32_as_usize(tail_end - rx),
> -                ),
> -                core::slice::from_raw_parts(data, num::u32_as_usize(wrap=
_end)),
> -            )
> -        }
> +        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries o=
f the GSP message queue.
> +        // - The returned slices cover the `avail` slots that the GSP ha=
s already written. The GSP
> +        //   does not write them again until `advance_cpu_read_ptr` rele=
ases them.
> +        let data =3D unsafe { core::slice::from_raw_parts(data, num::u32=
_as_usize(MSGQ_NUM_PAGES)) };
> +        let (before_r, after_r) =3D data.split_at(r_slot);

Same problem of ring ownership - we need to call `from_raw_parts` twice.
The pattern used in `driver_write_area` should apply smoothly here as well.
