Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8852C11D9
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972812; cv=fail; b=f52yrQ4J9mcnkT391TGVUh2kLHuwiOH8N2ojxlYUAYkTfJrjdL70b9CmreNOdsNbcUffitdYRjuee+Q4sH4+8inKQQnOw9+LHSFRj+AUkoKhPckr8ZHPAxMHDLw6NmRIAjNRsia2SzMnfvbYql7lQchiA3e2gtjo3OkGo9FLOPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972812; c=relaxed/simple;
	bh=/bCww1pxGOzHN6svpk3pBxNvlTmdM/XzL9c1i3eUXRc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Pf/0BCElM6r95J4MzFdGeYqVNdHM8ORkf9HNFRm8bWme8dBamJaXEkf1r0zDfE9JpHdRYSEyyYnQQESA1EdhFa/w7xnHKJzr/dkn2OL+M/jPgTGN/r8Abpnrx6iMELMY83d+2UoX1ve5kmiA1OIU3sXst9QZSej1dM230SYxGY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MPJBqdim; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MPJBqdim"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxv0imPiFqdwRkKC91fFmGXAAq7b++8NwGC3b1wcTlrPDLimA8HwwNneIhJp0z+j1YWITdcyhECjLLtiOrvJI5yqlf+FXnuMqqY28OaDGoBl5nwqIftqvjfrJZ6ba7+JV4B49cKpHN/tG6z0YFBI79mSJVpZrwYGf4fWgXm6jeCgaY7qbux4Rw5eGjqJtz5oXfRZZHz5SZCRv1bKxN+o+0qI+Fs+g986ArQr9KnIMCcvkHl76qxMtr6IrQR3D3jOdV/J8J3P+RxY5hr64AJCq0RXp6SBQou4xXj9FybEzRDQTbxADwhJ3ZE+kkkgAF5u6IaM7KqOF0LHS/cqzKUA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdeAAGse0b6/xxjTyLUka3cPVXqYZvXs2bGnBWqdrL4=;
 b=kS2/OrOX14GSYjSGzIpF8jh0Bf1YIipEIQP1CLOvIsM0sdBMo2RwpSlqBujZEGRYQ6Qre/p8Gw3OmvICkcfcaVpQI2gPZPTGp9JWDW3vMnVfTozcjcclyvdDubGBs0N5uDHalzNbEZNb7M7ZOCXxnDwr8lJLmczM/ghgWoYl8rEuS2HIdgHNc0YJm6y4PVDQvZ4CQ9bCteoJpzuaTHhHWTwol2iuRCOjmU3t4Ao4g1M87X5z+iIg4UUdWJqlMH98jFiANJ8ntWmYBAugHWmATkGUrlkEKNfJtQBoy16MG3FKxM1Tmk2FmVhJIBQxwsf7sl/UhyIVC58LHlYYBLJQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdeAAGse0b6/xxjTyLUka3cPVXqYZvXs2bGnBWqdrL4=;
 b=MPJBqdimTsW4CCh6eCb0sdshkaJPS5vcu9o9IfaeE41cF6KKfpqdsxZklXHmtqjHtSue6sB71b7sSwEzGO9dHnUGtaBWFNoXQQ1i9sGQIhKJufVvT66qicY06DzK+P4bGEQOTpro1v6y5fykwO6oF5xe4+lEWuvtlPUUhz1lM0dnRWv1Q8aCk/os2/ExI5kezYTFzYkwv11cyK2cBIL84jEtqsUlfFr19ifRsqOjx5z1alepXVR7dY8JITvZXipqhmwKzoQSmLDKHpQCg2NarPVx9zkKaFQlMrlyLjw9yOgXkjkMUMyCuddY4asnYl54iDCk6kiIptEktY8J1ibY/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:38:00 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:38:00 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:37:56 +0900
Message-Id: <DLKSCVLGW5PA.292BBGGSCF6VE@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v4 14/17] gpu: nova-core: add the falcon interrupt
 registers and their HAL
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-15-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-15-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:604:220::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 43e97870-45d9-4ce0-dbe7-08df17aae11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	rYqXozQuG2BAoR4XK9LeDjvqb3J5sDcarzoHJjXzRUpugSGEubA3bRjeJHjEhM9iuCucv4Q8bD9s0yXY+9QiWFLZ/IWS3oZ6NbngfcGmYAhB5cSW50zxqJWje5y9yTcN6NvV8Na9x5W6WG6/rWxVnTHDY8BwdnF2dDoK8PAdS5DLKTZ9PlwZII+U0vSoEFjez2z5uw+H5CRHczefGlu7pDGy9g35DaHAA/hpSDGgKygWiIASCKKwlSIvm6FQ+bF7DUzStCEWRjTldxv2EUSEgc7VI9gi7Bew1XAQYz31emfuiIkE6Uvsfi2QAPq9XpGEDepDrM6fFSS8HnJOjCzN9FoSpf9AZ2hTXqkYujZgjrLTQaAw8TpwZlYwVN3WBuA2JFdxnfNqSCR2sH+Dgcc379qi8rpVCw63MFWbsEuiXy+jaNS5dD84aovLaao6yHD6zxWUmVHqsrBATgp/d83K8Sk17L22F+Y8JPSJxp6i0bJEoS1ihjb0XM2Q89wEU3TtDEsbpFrsG17eWDN5ybFLsIciEpQLlZ+paqU3y2Q1za6+oeGVzC6L+Dt+JFXucMeF6mIJBTgeVh90J68eAT9LYTS6kbbTbSs7CYy8brJUP1AsgndXJAcMwwLRW1dp8KgWK/WftjsucesQ2OOD4laiMzItMfMkSN5I0wsRrKcf6VU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDBtRjcxYzdhZThFVW94b0o3SzY4YldKY2kvRUVFZCtqRmo1TnAzRHQ3TXho?=
 =?utf-8?B?bFlpelZndkQ4Y0YzM05TNU16a3AvZkVXdUF5alpOWktzVUhvc0Y5bTBUcERK?=
 =?utf-8?B?OFRsUjFFT0tFZlZDWTFLR2lQU2J1MjNESEtKellyeGl0Y3lQLzhvdGd0R2Z0?=
 =?utf-8?B?Y0hDNTNDYnVwSUoxK0xuUjlXcHd2c1ZXenhuMVJzMVpFL0xVNzhlZE1CU2VX?=
 =?utf-8?B?cmlzL3ZvNGtrZDVKdTFiWE0ycUNJTWNuamxlRVI4WjZKNGV4M3k4KytQdFpK?=
 =?utf-8?B?NkRGd1NyNzJhMk5HbStNWk8xbXA5OWZ3MWdPNG4wanVjWWlheVJDM2ZNd2Ju?=
 =?utf-8?B?NVMycWhpaFRrNUNTN1RkU1ZGVUNrcEtSUCtJS3VkQ3VCcm8xdlJ0elg5d2ND?=
 =?utf-8?B?Nk9MSUtFSmF5ZFdVdittL2JtdUMxek9VMS95M2FscTNXR3hpQ3RZUW82clp3?=
 =?utf-8?B?bzJpcjloa2hSNTBrVHN3Y1NoUkRhOWF3enA3eGxZaktBUVB6MFB5dHZUZW1D?=
 =?utf-8?B?UFZncEUvUmE0SFp0QjZkOFRhZDBIRVVlTnh0K1dteEJJNVdCcjlacFZXSExO?=
 =?utf-8?B?Tm1YRVlNTFVYWEVrek5nM2RnbC9DQlRqTG5CbjI4SjU4Qi9wUzNnaWFhTTFt?=
 =?utf-8?B?TWNLcDFMZmEwTTFwZmd4bElZMmc1TEpiR3MwWTZEcDE3N3preEUvZ3AvQmJy?=
 =?utf-8?B?NnRHM1lUTFNka3VHRU9Bd1VmZlFaWm5RVkRXb1NVSjhQOFEvSGdvdjlwRDN0?=
 =?utf-8?B?NDdNakk1MUdvY0JycjVpUVNBdERSVTdOQnE5d1VtWEIzRVBvVWsreXA5V0Qw?=
 =?utf-8?B?YjVIOUdTOW4vV2paMGhJVjkzRnJsVzlpQVRqTE5aL3JtMjY1QkY5ZWRSRGpN?=
 =?utf-8?B?cnhjR21BcVdKQWgyMks0TExrMFJ6NXlQR1ZTcGdueTBKTitxSExwWWVWUlJK?=
 =?utf-8?B?R2gvWUg5K2tCVUNQYVpoUDZkeWdXbGpmbmF3THB2VUxrNE9ydHR1SzZnRGR3?=
 =?utf-8?B?aUhkandUNHpHMW5JaFpUOWQvMGtySGd3RHNEYnZhUnBlSU84WFRLS3c0Yjk5?=
 =?utf-8?B?MUhGT2I4c2JxSG1SRWtKT0pvYUNaODQ4TjVDcDY3U01id3M4bkRuNnl3WGV4?=
 =?utf-8?B?blp2OFdGYXJ1WTZWYlBuck9NbEVrTzVnY0hScDNzcndkazI0YU0wSWY1N2xa?=
 =?utf-8?B?dFZ3Tk9jSzFJNmhKMnpRRXAwN2tFZlYxNFBCR0xucnQxcHhGc1FudDUxcXBV?=
 =?utf-8?B?L2hWakxWOEk1emJKaE1pT2VZaE1IcGpFNWpRc05rNGViTWkxdDRXekpYL3hL?=
 =?utf-8?B?czB1cGZLOWE0VE94YXp3NXJtZGxaM0xwaWRuZ2gvVTUzc1VsV1NocHhQRGVm?=
 =?utf-8?B?RVg5UFQ4dFZ1M0pJTXpOSHpMbFNGMDdja1BwbGZFQ3VzMlZFZGFGQWE2TWk2?=
 =?utf-8?B?Rm9HYy9qY2FwUDR3a00yNlFES3YyUU5lT2g4aWFFK2JIbXAxbEg4bUNCazZh?=
 =?utf-8?B?cUZaV0lmVXpQZU10WmFUUk9QS2kvbm1SK29JSmc3ZG5DZnBFQ3hibFFPWW1o?=
 =?utf-8?B?bi9QYjRPdjFwcHdlbDFucENhdU9kOVhaZ1B2ZFJydHhMSTNpTC9ObHpidlN3?=
 =?utf-8?B?c2hscTdCZjAwWHI0aU9BNjdKUmcyYjhNa0hoUWZWVy9KdXlJTTNLSGUyYVNG?=
 =?utf-8?B?NFNtMFNMTGJlamkzdW5GeEZ1MlF1Rzg3SlpCWFNrbkJ0ODNzV0lkWFd1RUVm?=
 =?utf-8?B?MWk0ZzEra1draUVoUlZSQkVRM3RWTE1uU3hEVnNPU21qMzIxVU9zTnlIenFO?=
 =?utf-8?B?WjE0SzJlc3ROREtYa0NyUkY0OGx4Yno5VGhodTdwVE81Z2Vwb3crUVRvc3k4?=
 =?utf-8?B?UTBaQzNkL3hkQlBORVhqRzVaWTlWc01iemJZYThLMVN1QWE4Tmw0Z0E2M0JD?=
 =?utf-8?B?Tk5ML2tFazdibndEVU9COVBEaDQrb1U0Y2E2NnVqS1UwVVhIM2J4NWZGWTJk?=
 =?utf-8?B?dVNxMml5WTJ0ZjJPTGw5ODVTOGlwUWpXMUhTcGVEN3o0NzY5Ylh3cEQxc1ps?=
 =?utf-8?B?YVRQL0dqZFA1VXQvMEY1RWpVU1hmNE04VTlKVG9NUER6MGxxR1Y3VmhtRTNN?=
 =?utf-8?B?NkMvQzVudXU4VlZHZUl3QjRmV0NnM0g0WmxtRGtUYms2TldQOC96cE82RHE4?=
 =?utf-8?B?RW82OHlKU05HaEd6a0lnQUg1Mjd2b2tqdEJNN2h4UGFhVVRJdXVFYTJHVk1X?=
 =?utf-8?B?TVlwR09ZbmpFZmtEejI3L2twT09RY2hVWm1iQ1grUGp6Z0JOSDRBK3hUc2w2?=
 =?utf-8?B?Z1NLQUJmUzc2MzNaQnRGa0EvSGJFYlJ1akhlNnpDL0NITFlSVW1LekZteXNL?=
 =?utf-8?Q?pJiIzRTQxks5+mBhbKB0vnpD5kaaVDFj0H4Alms5RBz4o?=
X-MS-Exchange-AntiSpam-MessageData-1: wPOuD3HLDng7gg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e97870-45d9-4ce0-dbe7-08df17aae11d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:37:59.9863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmJzcxiN96kl+UWQft1tHM+XMdZ+BBgIStwevow2GBEUFeY4psFT9Fx6gjB6A65vBxiAQpnXBCJoT1pwmYgffQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 5:43 AM BST, John Hubbard wrote:
> A falcon has a set of interrupt causes, and it latches each one that is
> raised in its IRQSTAT register. On a RISC-V falcon, each cause is routed
> either to the host, meaning the CPU, or to the falcon's own RISC-V core,
> and IRQSTAT holds the causes of both. Two more registers say which is
> which: PRISCV_RISCV_IRQMASK holds the enabled causes, and
> PRISCV_RISCV_IRQDEST holds the causes routed to the host. Open RM

nit: OpenRM. Let's be consistent through the series, I suspect there
other such spellings.

> intersects the three to get the causes that the host has to service,
> and nova-core does the same.
>
> A falcon signals the interrupt tree only when its set of host-routed
> causes goes from empty to non-empty. A handler that clears the tree
> leaf while a cause is still latched in the falcon leaves that set
> non-empty, so no later cause produces a transition, and the falcon's
> interrupts stop arriving. INTR_RETRIGGER makes the falcon re-emit its
> host-routed causes into the tree, which supplies the missing
> transition. Turing falcons do not implement it.
>
> IRQSCLR clears a cause's latch, but it cannot end the source behind the
> cause. A cause driven from outside the falcon, such as a fault
> containment or ECC error on Blackwell, stays set through the write.
>
> Add the four registers: IRQSTAT, INTR_RETRIGGER, and the two routing
> registers. Record the IRQSCLR limit on its existing definition. The
> routing registers go in per-chip modules, because their offsets move at
> GA102 rather than at the Turing-to-Ampere boundary.
>
> Add a HAL for the two properties that follow, the retrigger register
> and the routing offsets, which split the chipsets three ways:
>
> * Turing falcons have no retrigger register.
>
> * GA100 has the retrigger register, and keeps the Turing routing
>   offsets.
>
> * GA102 and later have the retrigger register, and their routing
>   registers moved.
>
> Keep this HAL apart from the falcon boot HAL. The boot HAL is generic
> over the falcon's engine type, so obtaining one is a heap allocation,
> and the interrupt handler that needs these two properties runs in hard
> interrupt context, where it cannot allocate.

This paragraph is not really accurate. We create the HAL in the Falcon
constructor and store it inside the instance (because of course we don't
perform a heap allocation every time we need to invoke a HAL function),
so the HAL is already created when interrupts occur and no allocation
occurs. The HALs could perfectly be shared.

The actual reason why they are split is because the interrupt handler
has no access to the Falcon instance, so the HAL must be queried every
time. Which, in this case, would indeed trigger an allocation, but the
fact the HAL is heap-allocated is not the root cause for the split.

Actually it could make sense to have the handler hold a reference to the
Falcon from a design perspective (to prevent e.g. loading a new firmware
while we are listening to the current one); I am just not sure it is
practical in the current state of things so let's keep things split for
now.

>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs       | 80 ++++++++++++++++++++++-
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 21 +++++-
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 36 +++++++++-

With the "split the chipsets three ways" bit I would have expected 3
HALs files to be touched?

>  drivers/gpu/nova-core/regs.rs             | 69 +++++++++++++++++++
>  4 files changed, 202 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 7e532889a1f4..052610c4a4da 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -1,17 +1,25 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::prelude::*;
> +use kernel::{
> +    io::{
> +        Io,
> +        Mmio, //
> +    },
> +    prelude::*, //
> +};
> =20
>  use crate::{
>      falcon::{
>          Falcon,
>          FalconBromParams,
> -        FalconEngine, //
> +        FalconEngine,
> +        PFalcon2Registers, //
>      },
>      gpu::{
>          Architecture,
>          Chipset, //
>      },
> +    regs,
>  };
> =20
>  mod ga102;
> @@ -72,6 +80,74 @@ fn signature_reg_fuse_version(
>      fn load_method(&self) -> LoadMethod;
>  }
> =20
> +/// Offsets of a falcon's RISC-V interrupt routing registers.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +#[expect(dead_code)]
> +pub(crate) enum RiscvRouting {
> +    /// The Turing offsets. GA100 uses them too.
> +    Tu102,
> +
> +    /// The offsets from GA102 on.
> +    Ga102,
> +}
> +
> +impl RiscvRouting {
> +    /// Returns the causes in `latched` that are routed to the host, mea=
ning the CPU, rather than
> +    /// to the falcon's own RISC-V core.
> +    ///
> +    /// The causes routed to the core belong to the firmware running on =
it, and the host does not
> +    /// service them.
> +    #[expect(dead_code)]
> +    pub(crate) fn host_routed_causes(
> +        self,
> +        pfalcon2: Mmio<'_, PFalcon2Registers>,
> +        latched: regs::NV_PFALCON_FALCON_IRQSTAT,
> +    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
> +        let (mask, dest) =3D match self {
> +            Self::Tu102 =3D> (
> +                pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK).valu=
e(),
> +                pfalcon2.read(regs::tu102::NV_PRISCV_RISCV_IRQDEST).valu=
e(),
> +            ),
> +            Self::Ga102 =3D> (
> +                pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK).valu=
e(),
> +                pfalcon2.read(regs::ga102::NV_PRISCV_RISCV_IRQDEST).valu=
e(),
> +            ),
> +        };

There is no need for a new type and dedicated dispatch, that just
negates the purpose of the HAL, which exactly the issue I pointed in the
previous revision.

Also the only reason `RiscvRouting` is used for outside of the HAL it to
call `host_routed_causes`, so the HAL just needs a `host_routed_causes`
method, with two different implementations, and you get the end result
without any extra steps.

> +
> +        regs::NV_PFALCON_FALCON_IRQSTAT::from(latched.into_raw() & mask =
& dest)
> +    }
> +}
> +
> +/// Interrupt properties of a falcon that differ by GPU family.
> +///
> +/// Separate from [`FalconHal`] because the GSP event handler calls thes=
e from hard interrupt
> +/// context, where it cannot make the heap allocation that a `FalconHal`=
 takes.
> +#[expect(dead_code)]
> +pub(crate) trait FalconIntrHal {
> +    /// Returns whether these falcons implement `NV_PFALCON_FALCON_INTR_=
RETRIGGER`.
> +    fn has_intr_retrigger(&self) -> bool;

Here also there is little value in asking whether the Falcon supports
retrigger, only to do it on the caller right after. Let's just have a
`retrigger` method which is a no-op on Turing and does something on
anything above.

> +
> +    /// Returns the offsets of `PRISCV_RISCV_IRQMASK` and `PRISCV_RISCV_=
IRQDEST`.
> +    fn riscv_routing(&self) -> RiscvRouting;

And as mentioned above, this should just implement `host_routed_causes`
without another type in the middle.

> +}
> +
> +/// Returns the [`FalconIntrHal`] for `chipset`.
> +///
> +/// GA100 has its own arm: it has the retrigger register, which Turing l=
acks, and the Turing
> +/// routing offsets, which GA102 moved.
> +#[expect(dead_code)]
> +pub(crate) fn falcon_intr_hal(chipset: Chipset) -> &'static dyn FalconIn=
trHal {
> +    match chipset.arch() {
> +        Architecture::Turing =3D> tu102::TU102_INTR_HAL,
> +        Architecture::Ampere if chipset =3D=3D Chipset::GA100 =3D> tu102=
::GA100_INTR_HAL,
> +        Architecture::Ampere
> +        | Architecture::Ada
> +        | Architecture::Hopper
> +        | Architecture::BlackwellGB10x
> +        | Architecture::BlackwellGB20x =3D> ga102::GA102_INTR_HAL,
> +    }
> +}
> +
>  /// Returns a boxed falcon HAL adequate for `chipset`.
>  ///
>  /// We use a heap-allocated trait object instead of a statically defined=
 one because the
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova=
-core/falcon/hal/ga102.rs
> index f9a8444cf840..ff97983f22fe 100644
> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -28,7 +28,11 @@
>      regs,
>  };
> =20
> -use super::FalconHal;
> +use super::{
> +    FalconHal,
> +    FalconIntrHal,
> +    RiscvRouting, //
> +};
> =20
>  fn select_core_ga102(pfalcon2: Mmio<'_, PFalcon2Registers>) -> Result {
>      let bcr_ctrl =3D pfalcon2.read(regs::NV_PRISCV_RISCV_BCR_CTRL);
> @@ -170,3 +174,18 @@ fn load_method(&self) -> LoadMethod {
>          LoadMethod::Dma
>      }
>  }
> +
> +/// The falcon interrupt properties of GA102 and later.
> +struct Ga102Intr;
> +
> +impl FalconIntrHal for Ga102Intr {
> +    fn has_intr_retrigger(&self) -> bool {
> +        true
> +    }
> +
> +    fn riscv_routing(&self) -> RiscvRouting {
> +        RiscvRouting::Ga102
> +    }
> +}
> +
> +pub(super) const GA102_INTR_HAL: &dyn FalconIntrHal =3D &Ga102Intr;
> diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova=
-core/falcon/hal/tu102.rs
> index 7fc6e83c2566..f79aa85e6a62 100644
> --- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> @@ -21,7 +21,11 @@
>      regs, //
>  };
> =20
> -use super::FalconHal;
> +use super::{
> +    FalconHal,
> +    FalconIntrHal,
> +    RiscvRouting, //
> +};
> =20
>  pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
> =20
> @@ -80,3 +84,33 @@ fn load_method(&self) -> LoadMethod {
>          LoadMethod::Pio
>      }
>  }
> +
> +/// The falcon interrupt properties of Turing.
> +struct Tu102Intr;
> +
> +impl FalconIntrHal for Tu102Intr {
> +    fn has_intr_retrigger(&self) -> bool {
> +        false
> +    }
> +
> +    fn riscv_routing(&self) -> RiscvRouting {
> +        RiscvRouting::Tu102
> +    }
> +}
> +
> +pub(super) const TU102_INTR_HAL: &dyn FalconIntrHal =3D &Tu102Intr;
> +
> +/// GA100's falcon interrupt properties: the Turing routing offsets and =
the retrigger register.
> +struct Ga100Intr;
> +
> +impl FalconIntrHal for Ga100Intr {
> +    fn has_intr_retrigger(&self) -> bool {
> +        true
> +    }
> +
> +    fn riscv_routing(&self) -> RiscvRouting {
> +        RiscvRouting::Tu102
> +    }
> +}
> +
> +pub(super) const GA100_INTR_HAL: &dyn FalconIntrHal =3D &Ga100Intr;

Yup, that's what I expected: the LLM didn't want to go through the labor
of creating a new HAL file and somehow decided to put the Ga100 HAL into
the tu102 module. The kind of stuff a human would have gotten right from
the start.

So this HAL should be in a `ga100` module. Thankfully there is no need
to duplicate the `FalconHal` (a nice side-effect of the split).
