Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D40C3AB262
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 18:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788805065; cv=fail; b=Z1klUMyXfrZIzuokfG24h5JSLQxIlTMUHGo7rxikiW9XioGCvGD5Es/lfJ+J6xCPIpL/4ygaKHvIvhtKq4zaTni9cmGevIRpbqvv4bd+NyI09l/u67+AwoLGXJBvNJYHIT4kJ7yzI/HXJanfxwM3t9RhaRU2kjnGbOr/DeXQgoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788805065; c=relaxed/simple;
	bh=3MJvXpDimfGyL9+cL1RDNw2HiEr2R5EbRf+x7JVeV84=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=b/ZKniCUdtM9FMgd0c4rpK6pgWWlcjfm3JeQ49hNqfU8vKxNJxOqYYyBCdba93EhcMh05PqotzmRUMzD4FlGMB3sN2n6zwLOGfDMXt1TFOZHeqQT6mfGQf1WGr65mqDBSOBiBLc6MjH4KwfBwPM9X692CfHeoSRCRoRmDjGFaQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XvXSIOdK; arc=fail smtp.client-ip=40.93.196.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XvXSIOdK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpX1+VUnfoyx6LbewVL2jLmxYp7zLw8bfifH9WGpaKCMyLj9ux1z8S9hFBE6Pi6VhHqhV92YVKZW9ZV43apMKteN80zvocHtlExYX9/tNHm6a2O5qDRo8AYIA/7Hk3qlgb5BJ2IazCCG2XDIM+3R5HgVdyp2UZBc+lT/shl9OkYBs9MBHovKxG0Z2LdgzVYqXbOXFIpHdE0j19Vb1XrKy/xzTB26wwUxyIFiq0+x/f4hHD/Vms3jpFPwEgxP1ho4crE2IUD9r5r25/SOAHFQCuUdmSrJ0D7s0DnWaPgqDRf1CRIC/bwJiCN7nKrexaWFMTZdu/mpXwFvvt8qt+ir3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1TTnQ6O4yU8z7rrO6Xwa7gxD31H0ezHN0y+nDRUKUo=;
 b=WoXA30EXCYUAxI7k9X/YnPubYHWBadx8ijyWBqwKqLHrQfUr+eRei9ZVw0MK4oaMay69h8UdLI3+hKvqaiK9lzGC/Ms/8PsH9+5p1J77NmaTRN+bhcI3boHNj7ICrUu7iSVDs6j6A19a9EtyylBHdaB/B9oyAYmdvdIe9nzuJJA7GMrK7eYkXLhQnEvZgOMQjwDgdI0CvGVorWD/4QMr2tLDE5rwZ45krtGrguXyUdZ4EtzUw3r7FDEVQYErm2heJzDifZQ/p1hZKI030i9SkAyUTu2zJ5d2VtdOfPMmB8Ei0YngPekklqN0uPOfVRwxdAW6x6TUpQ48/Az+34sWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1TTnQ6O4yU8z7rrO6Xwa7gxD31H0ezHN0y+nDRUKUo=;
 b=XvXSIOdKmfTyt4aJfV4qmirUHW2mUSPpVT2ceBENpFlHOk5gOEKWSFvQXpnNuX2xoLYF732DaaVSmZV/9Aw2HbX8Cn1pn5XQqcQmN9I3Vqqz9cQtEGE+pSMXORcuByvW1J4Jaiu3x9qHa0aXWDll8hVqq97Yy1jNuwx+Nav8VI3J5x4o71N/0u3E5sR8d0SKbLveEn6y287BxrTP3leqIuPI3MjQxFh1aerrR8Vq555tDE4tN1rM84DR+sWwkqtMr4Rx32Pdu7ZIJOuZlu+kld9V8Q1LHhgC82BwjOCYCQSw6Zr4efJqtUBP7k+2ekrd9YfMabk25JWyr42rkle8AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8153.namprd12.prod.outlook.com (2603:10b6:510:2b0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 18:17:26 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0382.012; Mon, 7 Sep 2026
 18:17:26 +0000
Message-ID: <eb0e388d-3f81-4c8a-bbe2-162783eb97ed@nvidia.com>
Date: Mon, 7 Sep 2026 11:17:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the SWGEN0
 interrupt
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 Will Pierce <wpierce@nvidia.com>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-13-jhubbard@nvidia.com>
 <DL8W1O8BW36T.2HVKESOX2KAWX@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DL8W1O8BW36T.2HVKESOX2KAWX@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8153:EE_
X-MS-Office365-Filtering-Correlation-Id: bc60bb68-c7bc-4d0f-4801-08df0d0c4500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DQvINnfvaZTolwfa5ztkdHfLXwf8ylsJBDTFxiGdPAhEkTCjYFLEG3bneDb7NZyWpB9/8h3ZsWTsv4BMlL9lQOQqpAmMCzzJIHjwYbfmt3HXjLIaMrt+vJkxmPEdMU9d+rBA+TuVPN2tuf885NP95u0fVJbLd468PtxdtTc9yankOg6f7Oo4oXidn725ptzoq/YS3qJ590zz1OSN48slruQPsnVpVV7PTg+PVo9l3HrYTY+zLOUeAYYBRdLqOxcR9iy7RWU1makD23m72SNmoZCB7XImo2IjvcLE4fORG3VbXGhIKVTGIkFUl3CfSOQZc6rze3q7NF8oFlRRfXj3DdmAVQshHcaAlBygkQJdyV+HZwLyea9weJiPMUswBmgNpv4Hvfpt62NT8YHzpI+fDQramqOqwvx/Epm+uGbkmbpOw+YrCGl772TB98+tvWQU/ZwW7C2i6ttxPawi1V/lBvvrYZ53WAh4T1cYw4EUneBP0ZJOqJLTECgWPuse22cvclsgKSDuAiylKVsWDgCXqrIjjQTlu3PQALLdrBhaTU2GjG4F+4+RK1crhuGBz7j+VY1Ys19kL+t2UH9LNVk89U+x4zJgSF/R1DQZ/OXSw9TV+KwnCLo5VYGmkRi0/FxvHLI4xx+Gevt9yJdXhgJTPcu9wGozcClcVLeb/cdTA4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVIrL3VuaXVxcjhJTzYrZlBMWVlLb0Rqb0N2VTMvYkVZelg2K0NvWHZSNkhm?=
 =?utf-8?B?eHV4TW9iUnhrNHhzdS9kYWRWODhTa0puRmJ0UkVrZUN0QndFRGh2a3dnSU4z?=
 =?utf-8?B?ZlV0Q1lwTDJpbDFXWHcwM3RtcDQrUFQ5bzNqd0V1dlBTdjBTYlE0ditKdXdz?=
 =?utf-8?B?MkxPNG5DSVk0a003dnZmZnV1QXRkalpZNEJRZHBQaU5hZEdweE94Y2pnUVg3?=
 =?utf-8?B?Y2pIalE2YmtyOFo2bTgydDIyN1kwV0VrLzlNNC9hR2F0MHMzODZzR2pLcEFk?=
 =?utf-8?B?OW52WjJlZDBhUDJxRllSc3BvQWh2K1pnc2o1YXpkSGcyM3YzODVUSWtFdXhX?=
 =?utf-8?B?TU01TkxKczhSRGZUR1dWLzdSZzZ6U0RsMjVjWHVMRk1SMGNVK1FHaGVIcjNY?=
 =?utf-8?B?WWRCcnY2bCtaQVdaRTg2SG1UZTJmNXE0TlkzWEs5OTJJaEtxNVNycURFSWQz?=
 =?utf-8?B?aEd6TXFBRXBHN3JKRHFrbGNoY1RDVlk2cy82Ty8rN1lXbXd3dDZ3SlNXVlBo?=
 =?utf-8?B?THJKSk95L2Z2NkdkRDlYNHBxdXpEOTgra3pBejBMd1dhSGMzRGtsN004d2s3?=
 =?utf-8?B?SURFalZZMWJTb1V5VUxMUTJ6WnhMNlZOTC9wRlFjTHhDUXA1NUtiaHNtem5a?=
 =?utf-8?B?WUVDQ1VBcVQyZlVRNEEvR2ppV0lsaVhnRHBUY2h2dTl4S0l4c2dFQXZESkp3?=
 =?utf-8?B?T3BuV0NqK0hBaUU5UElUdVhHb2RlVUVKa09nbzNJOVNUaUhWM1F6QUZMOURO?=
 =?utf-8?B?U2llSWNrNnpENTg0dlhuV3hDN0RETFRHN20xdEYxaEpuN1ZNWk41L3UzQXZs?=
 =?utf-8?B?c0ZQSEhURWxOQ21vdG1jN0I0MmpCSzlRSjluME5JVGxTU3lkdjU3MTJpUzdt?=
 =?utf-8?B?VXo1N2RnY3JlS2hjNGZLMUI1QmxOTW0rdDMwZW9FSkR1T3RvcXptVnEvOTYv?=
 =?utf-8?B?bE1jdXFJQjAyNjRKdW15M3JOYkR6VDB6anFlaGxjWDdkTVI1Q0Jpc3ovZk83?=
 =?utf-8?B?T05ubTFtT2xpdkFudTNIU0RSckE3bDQ0RmJuQU9DanZFZGpnSDYzSy9DaHh4?=
 =?utf-8?B?WFNHU09CbjBtdzJOVVNkR3pxRHNuNGdrZ0ViSkZCUWZ5N3hIUVJ0S3lBcVps?=
 =?utf-8?B?TjQwWXVTWjJqais4b1VFN3orZlR0cjZIUTlkQytGRXV4TTRVWkg5KzZsOW90?=
 =?utf-8?B?R0pobm5UNDhTcitJVU0zMzNkQ3lGTzF5R0wzZkV3bHNWd0lmTWR6S2RScVhr?=
 =?utf-8?B?SVpjWE8yWFY5SWlsR1RGdDBBTWN0WWgyYzBWQXc5SDF2UkxyUjdSbVBVQ01Z?=
 =?utf-8?B?aEtqYlkzUFMvbHZ3dXFQRkszb1hQdi9LUWtFWDJJQVFWWGs5SkFwUEhwMm43?=
 =?utf-8?B?WXR5ZXBXNFQ1dk01UUZPdlJuYmpZV1VIM203OTN0dVd1R01JQTI1a3VvOEJM?=
 =?utf-8?B?Q2ROMGdXYVREeGw4djBBanh6Tks3NXIxYjRlR3pYTm51RkRkMmdHUWhqdDNt?=
 =?utf-8?B?M1J5Z05wSjFRTThRd3AvMXppTjlGL3pTenl4WXlSaHVPbkdhSUx3UDJJaXN4?=
 =?utf-8?B?VThtSXpYZEl4L2hMTi9YelVXUlQyWC85SVhsRStrdWVrVFZLVkxEZnBaZGhY?=
 =?utf-8?B?REtyTG9yMmJBZ3NLU0MzMzAwakFJNk9kZGVMckQvSnVwSFhIQ09vSTN5S0d6?=
 =?utf-8?B?NFB5RmpLMVA5dE56aWxMOTFOcmpkNGlZTVNRN3E4Nm5KZjlPdnFGWTE4OHQw?=
 =?utf-8?B?WmR3SVdGU2wzdmcvdDZPM29LZGhWSkhIZjRqK0oxMkYrSi9DMTdaSjdJSC9o?=
 =?utf-8?B?ZElYVDZoTDFmYlo0K082QkN0V1hxdTg1Z1VIdWFuTnY2L1ZZN0xvRFVyQnVt?=
 =?utf-8?B?UzMvc0ZCN3kxNkViV0NHLytHZ2diRkw2cVJBYlpxWm5uekxSVWtvODRMd3dX?=
 =?utf-8?B?NmYxZnFRTlBraEg5MXZWaHRQVWFSaHFUbmp0TmVRaTFrenlSaVR2YU5jcGtz?=
 =?utf-8?B?V1dIM083dVprc08wNVB2SC9kM1U5UU9NVTAwVjVobUJLSk1wUHBXVFhkV0FI?=
 =?utf-8?B?UXl6OXZTNGdpQXZIaXJ6RGV3M25kVnNORzBLSmdlb3ByRGEyVUZtanFkbkYz?=
 =?utf-8?B?cmROeHREM1BmbGxsVWtPVHFVTFQ5T0thdyswb3Irc1FIVlZ6OFl1akovckRW?=
 =?utf-8?B?M2pYSWZQbjRsVmZjbDFPV0NKZllYaTFjcGhrK3VnMGVualBwci9GNUE4bFNy?=
 =?utf-8?B?VUxPSmVkcXR3ZEdsNjc5TS9HMWI3N2hMNkd1STR4TDNqNTF3amVCK3VIUVdy?=
 =?utf-8?B?OGJwMDhwekovaElLNERqWG81V0xPQXBoM0VTdFJqVzdWbzhNZHdoV1V2eUJT?=
 =?utf-8?Q?y49BrUcnR2tgzlFg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc60bb68-c7bc-4d0f-4801-08df0d0c4500
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 18:17:25.9865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXcvT77rnIAgP/163+fE5/E6QT7M4NsQkSRoZxw2z3Kk/PgAbDESLqDYqedAD0V3COxbBXaull6ScPc7DinYew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8153

On 9/6/26 11:59 PM, Alexandre Courbot wrote:
> On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
>> The GSP posts events, logs and error records to the GSP-to-CPU queue and
>> raises the falcon SWGEN0 output. A falcon signals the interrupt tree
>> only on a transition of the causes it routes to the host, and IRQSTAT
>> also reports the causes the falcon keeps for its own RISC-V core. GSP
>> boot polls for its own notifications, so it leaves the SWGEN0 latch set
>> and leaves pending bits behind in the tree.
>>
>> nova-core drained the queue only while polling for a command reply, so
>> an event sat unread until the next command was sent.
>>
>> Service the queue from a threaded handler on the GSP notification
>> vector. The top half runs in hard interrupt context and touches only
>> registers: it clears the GIN leaf, takes the causes pending for the
>> host, writes INTR_RETRIGGER so that a cause arriving while the top half
>> runs still signals the tree, and rearms PCI delivery. Draining the queue
>> takes the command-queue mutex, which can sleep, so the top half wakes
>> the IRQ thread to do it.
>>
>> Intersect IRQSTAT with the RISC-V routing registers the way Open RM
>> does, so the firmware's own causes are left alone. Clear the latch of a
>> host cause that is not a posted message, since nova-core has no recovery
>> path for one and the retrigger would raise it again.
>>
>> Put the interrupt setup on the GPU rather than in the driver's probe.
>> The handler is then torn down before the queue it drains is freed, and
>> before the GSP is unloaded. Quiesce the tree and clear the latch before
>> registering, so no boot state reaches the handler, and keep the subtree
>> enabled at TOP for as long as the handler is registered. Quiescing
>> disables the subtree, and under pre-Hopper MSI the rearm is a
>> configuration-space write that never enables it again.
> 
> So this is a mishmash of many different things which makes it very
> tedious to review. The falcon HAL stuff belongs in patch 11, the new
> `SubtreeSet` method in patch 3, `irq.rs` changes where relevant, the
> Cmdq::drain should be its own patch, and this patch should really just
> add the handler and wire things together.
> 
>> Assisted-by: Cursor:claude-opus-5
> 
> On this revision the AI assistance showed mostly in the tedious comments
> restating what the code does and the unneeded churn. These really take a
> toll in terms of time and energy (and dare I say motivation). We need a
> more thorough human pre-submit pass because otherwise the net effect is
> a shift of labor onto reviewers, whose bandwidth is very limited.

Yes, sorry about that, I have been doing that for v4 actually and
it should be much better there.

> 
> <...>
>> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
>> index 7e532889a1f4..5272b3b63ae4 100644
>> --- a/drivers/gpu/nova-core/falcon/hal.rs
>> +++ b/drivers/gpu/nova-core/falcon/hal.rs
>> @@ -1,8 +1,15 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   
>> -use kernel::prelude::*;
>> +use kernel::{
>> +    io::{
>> +        register::WithBase,
>> +        Io, //
>> +    },
>> +    prelude::*, //
>> +};
>>   
>>   use crate::{
>> +    driver::Bar0,
>>       falcon::{
>>           Falcon,
>>           FalconBromParams,
>> @@ -12,6 +19,7 @@
>>           Architecture,
>>           Chipset, //
>>       },
>> +    regs,
>>   };
>>   
>>   mod ga102;
>> @@ -72,6 +80,45 @@ fn signature_reg_fuse_version(
>>       fn load_method(&self) -> LoadMethod;
>>   }
>>   
>> +/// Returns whether `chipset`'s falcons implement `NV_PFALCON_FALCON_INTR_RETRIGGER`.
>> +///
>> +/// Turing falcons do not. Ampere and later do, including GA100, whose falcon otherwise uses the
>> +/// Turing HAL, so this is keyed on the architecture rather than provided through [`FalconHal`].
>> +pub(crate) fn has_intr_retrigger(chipset: Chipset) -> bool {
>> +    !matches!(chipset.arch(), Architecture::Turing)
>> +}
>> +
>> +/// Returns whether `chipset` carries the RISC-V interrupt routing registers at the Turing
>> +/// offsets.
>> +///
>> +/// GA102 moved `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST`, and GA100 kept the Turing
>> +/// offsets, which is also why [`falcon_hal`] gives GA100 the Turing HAL.
>> +fn has_turing_riscv_routing(chipset: Chipset) -> bool {
>> +    matches!(chipset.arch(), Architecture::Turing) || chipset == Chipset::GA100
>> +}
>> +
>> +/// Returns the interrupt causes a RISC-V falcon on `chipset` routes to the host, in the layout of
>> +/// `NV_PFALCON_FALCON_IRQSTAT`.
>> +///
>> +/// A cause reaches the host only if the RISC-V core both enables it and directs it there, which
>> +/// `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST` say. Every other latched cause belongs
>> +/// to the firmware running on the core.
>> +pub(crate) fn host_intr_routing<E: FalconEngine>(bar: Bar0<'_>, chipset: Chipset) -> u32 {
>> +    if has_turing_riscv_routing(chipset) {
>> +        bar.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
>> +            .value()
>> +            & bar
>> +                .read(regs::tu102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
>> +                .value()
>> +    } else {
>> +        bar.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
>> +            .value()
>> +            & bar
>> +                .read(regs::ga102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
>> +                .value()
>> +    }
>> +}
>> +
> 
> Why not use regular HAL methods here? This completely breaks the pattern
> we introduced for HALs. If the current HALs don't fit the routing you
> need, then we should introduce a new one.

Yes, will do.

thanks,
-- 
John Hubbard

