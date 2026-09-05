Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010049.outbound.protection.outlook.com [52.101.193.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A52C0298
	for <nova-gpu@lists.linux.dev>; Sat,  5 Sep 2026 01:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788572369; cv=fail; b=cD5z/9ud781EQ6uQ1qaps3wEPtqQImJG3zKGUMNKa4u2xlucGuZgdlH8wUVwaefBDsAj/YUxePsldSVgnwN1YaCqLCO/zCYNvuX/QgaEZ4ex4vh4fRhTMikOuDDA3wMwlwLVQwX5D6HSZCmZk4p4Wfuuwvyg55VYR0REwj+jCag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788572369; c=relaxed/simple;
	bh=TnHLs+lu9TE9l1uIIRWtQuvAPOvdC8fx6bJCOGN5jyE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Qa59/pswUKX+RPSVqeobx1lDDaQsQKqJSIWizeXi20n4rwLGEjUBBtaf8mFxoxTuA7xpJ5ViWOC/HegnVEtxLGffltCTEoQ0q0MzqNbHwJW/IZC8NLoz/XikEryB/87ck52UfrJicSOMmFTgewopeGvpYAl0IPwb8r6qB2DoivI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oGCU4juW; arc=fail smtp.client-ip=52.101.193.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oGCU4juW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTFMLF+z6upIxisXHzDwUdfumQp1ZUwwv9eO6i9uqkVakNinusHBww/UzvObG48go3Kx9wX/zF7g5wGYoq2h/fwjGkcrmBMYf7lRfSJK8fv+w1HWhVnLZfvIkS+uHNknj3dEsYq3MJETY5RHnGLSxlbsY3aZSQTL5tDL/4B/Tb+ijjEDZqcIlAG+WMZuD29hoW+g4QUs428EFKFgAbWok7CT4jpFE6b/a+CPiVNHeDtgIGw/pnh0K4aWN+i9UYx84yvZktcvwgIFdyD6vnriLvH7LqVHBmBnVZfmJh1rrxudi51r3S40cWEUXsHr7fP7H21iGP0UwtA3+DcmysCtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZTJyq221QdHqx6h90lmLvRZf7orJH49jM2Zs+iJlY4=;
 b=vSR5MRLZ/f2qYdk0OlBtp3/t+5mx8m1SA3J8GV8x4g0nHodshFT6G3g9ro/+41fMr5jwi8UukGQxJZtBJTjyuiHZjwiXeUz17r16JeLGk46dlm6BZUGtKJ8aqiU6Q5ERw6JtqDMsjLez5+HLsU8d1+hjCrWIAitzr7yZTphdU3G9eZGjVwnxys2kfMyctADZwcoM1rm/+ePlRug6bAvA3r9TXoVgzuIY7SSGFaqvNO5ldGdx1WZkn9Yg8+OoET/AUCBIwMCq0dCEQ5Lt1h6bM/CGsfW9yUgD8ZeWptZNEFeip791RdYUICdMVftO+2HaGHbd5fVDYDCaizZx8k4nTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZTJyq221QdHqx6h90lmLvRZf7orJH49jM2Zs+iJlY4=;
 b=oGCU4juWDlYmirEj9ft+ip5ul0K140KjMGD3svcyOdkEkGbD1DTU89ZD5/5OH56dHIIXvXlldpVSYBEHH3kNzr5MW9rBv/lsWTBAVXJ3iJ0AWUhB7cb5l6GYiXakZaIDVj876cKsanuuN3jz2DF7rhwj6whqp1Dhy5Z8Xgz8VfpGRyVlYp3JCTxA+eve9H8VeIhf6T9pmWYWwspEIPnB7wwF1X499c7wSQ7Uf6OPuqr3AyWg+sEIjC26RVhWvSCSt7QL8j3NFdENv9PwLB5m5sRsXQ4lx279tS+L5b8gGz6A8STJYS7UaKRLbkR+CRpcCfLPBBwvKrADHTRuSSoMqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 01:39:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Sat, 5 Sep 2026
 01:39:20 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 10:39:17 +0900
Message-Id: <DL6ZZI0912ZG.2AY2OE6P0LIQZ@nvidia.com>
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
Subject: Re: [PATCH v3 03/14] gpu: nova-core: add the GIN vector and subtree
 newtypes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-4-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:405:379::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 672499ad-013a-441c-106f-08df0aee815e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|10070799003|366016|4143699003|6133799003|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	75AG+GdHa2iAmq3hLxZFOmfL0otWiGlGwkt+G88wIvD5BvmdYsqfZT0ZUcHPFugZiNuWaQzFAEqI/QvyLD1bdi5somvoe2frkxQOtT9HIQKa2UgdHtsaP72UMgkHOIOyXdp5GW3BQQ0N2HwLppcLMM8MSvoLZOGmH0+5BgRczuLzvOiYmq8ynLJusi7/WFYAr0kRHahRjjCKJXjuOSOiYs5Ia+aV6xqaOKaNUzAGnoAqtsM65+8wzdyNdoXSN8v5ZRYzDdn4yQCsgOxLO8US6MSxFEcpZYAXRsLLt7/x07N7zLN6K8clXZr+CCP+AD63TjzycTPm546yb4gCQn9osEizT8GYkhA5G0qm8adFYRWms0b+of+FPfasPhlvtMud9Xfg2hnO3trRHqn3v/bbDVPFqnEWBbWl0D+HN28vCKNrJ3Ek8BspCRk7MGVK4y0kxhBXGSULv0x5W3c4OpKf2wSaEFsw8NSnIqayv5HDoWwI1v81yiZQzflPEKMHlrd0H5EryvTn3lomICiEw30/KFzQxXacdtGufqCfQI/Do94OS+ivyx/OM4yMTmjg9TQopr0Uhx+M9jVApwzguS1ZOagEuUE1MO2bi9CLHZ1/QwpQD1QQ38TbjJALOp6s8bDFYWWe+o7MtL5HSzMNzvhSYyW+D/8l/AoIShy091L/MB4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(10070799003)(366016)(4143699003)(6133799003)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXdtclZpc3VLZW1oNzY0QWhyR25aTFN3QnBWWXdha043K3pFanMxRlhybzZN?=
 =?utf-8?B?UiszRVZKK2JmbTJmbEZKL0h1SDBMbnkvYkVmSnJmK0RVVjFRMmFzb3JHeGZP?=
 =?utf-8?B?M3VUUDR0d2s2L3had1dQa2prdjZWbW45ZUFZTHM1N1ZLS0RISnFGQlkvNjZO?=
 =?utf-8?B?QTA2QTgyM3U1V2ViZVkvUHZ3Zm0xRURqNTFvajJ3dU5HZFNlSk5VMm94OUN4?=
 =?utf-8?B?ZlVPWVhOdS9MREpnUllUZlRrdHpqa0NiOWw5Vmx4MlZuSVIzSWk5RFJhejh3?=
 =?utf-8?B?TXpXTm1KbXZmUjhGelViN3F4eFlNV21DRXdiU2lscTRkZXBLaEkxWDE3K1l2?=
 =?utf-8?B?RTBUQ3ExYmU1L0t5WEVLTVJNREphNXJvUGtEdjd2TVJ3TjRMZEJRSkpRUEt0?=
 =?utf-8?B?c200eC8wazRZR1NRWE45TGNRRWsvVGZWdHZ4bVlBSnJuNE1QOXJQRGpiZmRx?=
 =?utf-8?B?U3RVWWgwK05SeElRZTRpRHRZT2Q1K1NNQjNuVmVBK0JhUk41c1NSOTRJS09L?=
 =?utf-8?B?b3kyT2hGQkRLQ21BaGFzMzN2U3FpY2ZJUzFhMkNhdGl6dlY2Nm02a3prNFlP?=
 =?utf-8?B?QkY0SDJOY0dLZHlPT2U2Y1M0STd2Q2E5TnAyZUtuUXlRdzlzekRtcGs2VW9I?=
 =?utf-8?B?RkxicEJ1SzNNcHphb0UrVnZDR1B4YnM3aE1uMTJGTFlVRHo0N0F4MFlsVjg4?=
 =?utf-8?B?OENVN2RXazUwd21yTU1MU00zV0ZoSmtjVVBSUlJrOXg5QWVoaWlHQ1RFSGtX?=
 =?utf-8?B?bHdzanAycUpvTE52Sm5sVk1zOWRJOThPSmt3NDgwZEhOU3gvZzR3b3hjQlFZ?=
 =?utf-8?B?VnJ6Q2NYa3ZRak1jQmE3ODZuTy91Y25XUWNYZEZhb294ZkFSa3Y0bUY4dzkw?=
 =?utf-8?B?QnNYTmNNckhLc09rZi8vSWYzUmNCNEdvd2I0UFUySm9meVpDWjdkK1p3U05N?=
 =?utf-8?B?UDJaeVRWdnRKblNONWFybzFiT05oNmVJeXV4OXR3d1Z1N2hHMGpPcEE1Wko5?=
 =?utf-8?B?aFNORS9ZcVN6bWIvWVRPMXdQUjFnWkdlaDdoWmRnQlB3RHBmQjlBN2k3d3V4?=
 =?utf-8?B?QmYxUlJPR2grZUtRZ0xJOWtaTWpsZzhyU2lFaXJWZkdCdjlyR0JtRnB2MWwz?=
 =?utf-8?B?UWdFaGNHNDhXZjdFRzhrSU9TTUV0ZTRmVHFDT2JTdVJ2QTBhK2dCTnVOdTRD?=
 =?utf-8?B?WktVNzNTOExMdnRVUkpCbTNnNitEY0JmRkFpMWxpbElQbWFSa2xTNkxnOVo0?=
 =?utf-8?B?YkhYME5raDBBWkZFa0JWaU8wZFVRb2JNbStraC9zZWk0YVVwalFsTUVpR3RS?=
 =?utf-8?B?a1lUbjhvTkx1L2VJS3FzbHBHdW5reVVKUHNpTHNrSWEyWTF3SEwva3ZjS1Q3?=
 =?utf-8?B?QkpCUlhrVUlzZllzOXZGNVBKRDBUbTNVdHRWOU1NK1lJOVBLOVVRWDVBNTQw?=
 =?utf-8?B?Uit4d3hRSGFkaE52Q1ROZjNNeC9ES3UyeTFJeHdya1JzeEVjVUc4ZTB6VUpw?=
 =?utf-8?B?dDR6KzUxelBFUWNqamwwYlR1T015cnlQa054WDZ4UStrTTBUcmRyNEtoaDJr?=
 =?utf-8?B?S2V6U1RVc3pJaVRLUDJnSTJDeUhvbnFPdmV5ck1XNnZEUkcxUXo2Szg3d3R5?=
 =?utf-8?B?S2JmYUIzTENrUld1TWNIc0dROXlvV1RtNHp2K2NDTXVtMUMxSGRrMzg0emF0?=
 =?utf-8?B?dnJCb0dpYm1CQ2M4VXRIanVkY3ZSM05DRWE2UkVvbGJVT2xlcFNhb3FteUtW?=
 =?utf-8?B?N3Z1SWZUV0pFakhRK2lmcS9SSWdJbFBFWXJEeTZFZkFjemJkL203UEc0YnBz?=
 =?utf-8?B?ZEFSTkt0ZGtTaWlPZjQ4WUVsM1BnSGptQjBXQVpiaCtwTjJSdXZ4SnpiYjIz?=
 =?utf-8?B?N2hmWnByVHhOVWxWOGVqRUhic2dsWlcvTFJKVStsOVJvSUVHb1kxU2cvYnNw?=
 =?utf-8?B?NmliMjlFa1JMTDF3TDQzSkVVRHQxWkNEMWJlOFR4dkJjelc4QVJnWGR6ZC8y?=
 =?utf-8?B?NGczSHJVTklSRWRVK25MMzI5TGQwU1draEMwNnhTRWM1dG0vbGhibG0zQVdm?=
 =?utf-8?B?d2dUandUd2N2NHRjMis0clUvTjJNTDJ5cWMxbDJZaWlEUHNKNXZzTEpRbHkv?=
 =?utf-8?B?bkhSVjRwYU0vLzBCakU3eTJRYlJmM1RNc0FoeHQ3Q0FDTkVVeEo0aTZEZThn?=
 =?utf-8?B?dnU1NFpnNEFNaThqRTBEZ3ZLRUw3UkdBY01WSmZYMm1XOXo2SGFkeEZ6OWo3?=
 =?utf-8?B?b3Ztb050aXBPa3pNOXNxM2h6QkRTYXBqQXhuMjE0aW0xdmpGZHkwUnVRYVdW?=
 =?utf-8?B?TmhLa3lkUGVyQ09YMmhGWHJTTVdUNzd5QSt2NTEzL2lWVlZxdENacGpTdG9N?=
 =?utf-8?Q?RbcCp19zPibOl1yjIyVbSpDjA2GLkDlgBF8DOx5Cnie2Z?=
X-MS-Exchange-AntiSpam-MessageData-1: LSfIutbCa3ZT/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 672499ad-013a-441c-106f-08df0aee815e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 01:39:20.0929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sLBhucftwvzLRgDTNMVbIcy1R9wX23lsGqOKJ7bv92MoRNU1iwRQqTtSJ3EBb0vqXAn89OD4VUJ2ncYL6U/Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> A GIN vector's number fixes its position in the interrupt tree: it
> latches in leaf vector / 32 at bit vector % 32, in subtree vector / 64.
> A tree implements either 8 or 16 leaves, which sets both its subtree
> count and its highest usable vector.
>
> Each of those is a bare bit pattern, so a leaf mask and a TOP bit are
> interchangeable to the compiler.
>
> Add a type for each: a vector, a leaf index, a set of vectors within one
> leaf, one subtree, a set of subtrees, and a leaf count. A vector
> converts to its own leaf, bit and subtree. A leaf count yields the
> subtree set it implements.
>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/irq.rs                |  11 +
>  drivers/gpu/nova-core/irq/interrupt_tree.rs | 242 ++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs          |   2 +
>  3 files changed, 255 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/irq.rs
>  create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> new file mode 100644
> index 000000000000..f27952ff747b
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! GPU interrupt support.
> +//!
> +//! GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt=
 controller: a two-level
> +//! tree of pending and enable registers, one tree per PCIe function.
> +//!
> +//! See `Documentation/gpu/nova/core/interrupts.rst`.
> +
> +mod interrupt_tree;
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> new file mode 100644
> index 000000000000..5aa447cf0ec4
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Vector addressing in the GIN CPU interrupt tree.
> +//!
> +//! A vector's number fixes where it latches: leaf `vector / 32` at bit =
`vector % 32`, and that
> +//! leaf belongs to subtree `vector / 64`. The types here keep those thr=
ee views apart, so a leaf
> +//! index, a set of vectors within one leaf, and a `TOP` bit cannot stan=
d in for one another.
> +
> +use kernel::{
> +    num::Bounded,
> +    prelude::*, //
> +};
> +
> +use crate::num;
> +
> +/// Number of bits a leaf index occupies, covering the `0..16` leaf regi=
ster arrays.
> +const LEAF_INDEX_BITS: u32 =3D 4;

These constant declarations are a bit inconsistent - we are using number
of bits here, number of elements there. Let's harmonize on number of
elements and use `ilog2()` to convert to number of bits where needed.
Consequently, this constant can be removed.

> +
> +/// Index of a leaf register, bounded to the `0..16` range covered by th=
e leaf register arrays.
> +pub(super) type LeafIndex =3D Bounded<usize, LEAF_INDEX_BITS>;

Let's group this together with the other types (for instance, before
`LeafCount`), and use `Bounded<usize, { MAX_NUM_LEAVES.ilog2() }>`.

(see below for `MAX_NUM_LEAVES`)

> +
> +/// Number of vectors one leaf register carries, one per bit.
> +const VECTORS_PER_LEAF: u32 =3D 32;

Let's use `u32::BITS` here.

> +
> +/// Number of leaves one subtree covers.
> +const LEAVES_PER_SUBTREE: u32 =3D 2;

And with the following two constants we have everything we need to
derive the rest:

  /// Maximum number of subtrees.
  const MAX_NUM_SUBTREES: u32 =3D 8;

  /// Maximum number of leaves.
  const MAX_NUM_LEAVES: u32 =3D MAX_NUM_SUBTREES * LEAVES_PER_SUBTREE;

> +
> +/// Number of bits that address any vector the widest supported tree car=
ries.
> +const VECTOR_BITS: u32 =3D 9;

We can now derive this one as:

  const VECTOR_BITS: u32 =3D (MAX_NUM_LEAVES * VECTORS_PER_LEAF).ilog2();

> +
> +const _: () =3D assert!(1 << VECTOR_BITS =3D=3D LeafCount::Sixteen.vecto=
r_count());

You will want to use `static_assert` here. I'd also suggest moving this
to after the declaration of `LeafCount` (since that's what it tests),
and adding a comment to explain why we do this integrity check.

> +
> +/// Width of the vector field in the leaf trigger register.
> +const TRIGGER_VECTOR_BITS: u32 =3D 12;

Let's also derive from the register's constants:

  const TRIGGER_VECTOR_BITS: u32 =3D {
      let range =3D NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER::VECTOR_=
RANGE;
      num::u8_as_u32(*range.end() - *range.start() + 1)
  };

This would need to be introduced in the next patch since the register
doesn't exist yet, along with the conversion to it from `GinVector`, but
that's actually the right time to introduce these.

> +
> +/// Number of leaves a tree implements.
> +///
> +/// Every supported part implements one of these two counts, and the int=
errupt HAL names the one
> +/// its architecture uses.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +#[repr(usize)]
> +pub(super) enum LeafCount {
> +    /// Turing through Ada.
> +    Eight =3D 8,
> +
> +    /// Hopper and later.
> +    Sixteen =3D 16,
> +}
> +
> +impl LeafCount {
> +    /// Returns the number of leaves.
> +    pub(super) const fn into_u32(self) -> u32 {
> +        // CAST: both discriminants are 16 or below.
> +        self as u32
> +    }
> +
> +    /// Returns the number of leaves, in the type that indexes the leaf =
register arrays.
> +    pub(super) const fn into_raw(self) -> usize {
> +        num::u32_as_usize(self.into_u32())
> +    }
> +
> +    /// Returns the number of subtrees, each of which covers two leaves.
> +    pub(super) const fn subtree_count(self) -> u32 {
> +        self.into_u32() / LEAVES_PER_SUBTREE
> +    }
> +
> +    /// Returns the set of every subtree a tree of this size implements.
> +    pub(super) const fn subtree_set(self) -> SubtreeSet {
> +        SubtreeSet((1u32 << self.subtree_count()) - 1)
> +    }
> +
> +    /// Returns the number of vectors a tree of this size carries.
> +    pub(super) const fn vector_count(self) -> u32 {
> +        self.into_u32() * VECTORS_PER_LEAF
> +    }
> +}
> +
> +/// Set of vectors within one leaf, one bit per vector.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct LeafMask(u32);
> +
> +impl LeafMask {
> +    /// Returns the mask with every vector of the leaf set.
> +    pub(super) const fn all() -> Self {
> +        Self(u32::MAX)
> +    }
> +
> +    /// Returns the mask holding the vectors set in `raw`.
> +    pub(super) const fn from_raw(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +
> +    /// Returns the mask as the value the leaf registers take.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Returns whether no vector is set.
> +    pub(super) const fn is_empty(self) -> bool {
> +        self.0 =3D=3D 0
> +    }
> +
> +    /// Returns whether every vector set in `other` is also set here.
> +    pub(super) const fn contains(self, other: Self) -> bool {
> +        self.0 & other.0 =3D=3D other.0
> +    }
> +}
> +
> +/// One subtree, named by its `TOP` bit.
> +///
> +/// # Invariants
> +///
> +/// Exactly one bit is set.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct Subtree(u32);
> +
> +impl Subtree {

Every time we build a `Subtree` we need an `// INVARIANT:` block. Let's
add and use a constructor to enforce the invariant from a single place.

  const fn new(idx: u32) -> Self {
      // INVARIANT: a shift of `1` leaves exactly one bit set.
      Self(1 << idx)
  }

The constructor can remain private.

> +    /// Returns this subtree's index within the tree.
> +    ///
> +    /// Under MSI-X this is also the index of the allocated entry the su=
btree raises.
> +    pub(super) const fn index(self) -> u32 {
> +        self.0.trailing_zeros()
> +    }
> +
> +    /// Returns the subtree as the value the `TOP` enable registers take=
.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +}
> +
> +/// Set of subtrees, one bit per subtree, in the layout the `TOP` enable=
 registers take.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct SubtreeSet(u32);
> +
> +impl SubtreeSet {
> +    /// Returns whether `subtree` belongs to this set.
> +    pub(super) const fn contains(self, subtree: Subtree) -> bool {
> +        self.0 & subtree.into_raw() !=3D 0
> +    }
> +
> +    /// Returns whether the set holds no subtree.
> +    pub(super) const fn is_empty(self) -> bool {
> +        self.0 =3D=3D 0
> +    }
> +
> +    /// Returns the subtrees present in both sets.
> +    pub(super) const fn intersection(self, other: Self) -> Self {
> +        Self(self.0 & other.0)
> +    }
> +
> +    /// Returns the number of subtrees counted from subtree `0` through =
the highest one in this
> +    /// set, which is `0` for an empty set.
> +    pub(super) const fn span(self) -> u32 {
> +        u32::BITS - self.0.leading_zeros()
> +    }
> +}
> +
> +impl From<Subtree> for SubtreeSet {
> +    fn from(subtree: Subtree) -> Self {
> +        Self(subtree.into_raw())
> +    }
> +}
> +
> +/// A GIN interrupt vector, bounded to the widest tree any supported par=
t implements.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct GinVector(Bounded<u32, VECTOR_BITS>);

I was contemplating that maybe we could turn this type into a bitfield,
since that's really what it is and its methods do bit manipulation, but
hit a wall due to `const` requirements that cannot be met. Just
mentioning it before someone else spends their time on the same idea. :)

> +
> +impl GinVector {
> +    /// Returns the vector numbered `VECTOR`.
> +    ///
> +    /// Fails at build time if `VECTOR` lies outside the widest tree any=
 supported part
> +    /// implements.
> +    pub(super) const fn new<const VECTOR: u32>() -> Self {
> +        Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
> +    }
> +
> +    /// Returns the vector number.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0.get()
> +    }
> +
> +    /// Returns the leaf that carries this vector.
> +    pub(super) fn leaf_index(self) -> LeafIndex {
> +        // CALC: `self.0 / VECTORS_PER_LEAF`.
> +        self.0.shr::<{ VECTORS_PER_LEAF.ilog2() }, _>().cast()
> +    }
> +
> +    /// Returns this vector's bit within its leaf.
> +    pub(super) const fn leaf_mask(self) -> LeafMask {
> +        LeafMask(1 << (self.0.get() % VECTORS_PER_LEAF))
> +    }
> +
> +    /// Returns the subtree that carries this vector.
> +    pub(super) const fn subtree(self) -> Subtree {
> +        // INVARIANT: a shift of `1` leaves exactly one bit set.
> +        Subtree(1 << (self.0.get() / (VECTORS_PER_LEAF * LEAVES_PER_SUBT=
REE)))

Here I wanted to use `Bounded::shr` as well, but we would lose the
`const` and we need it... Can't wait for const ops traits. :( That's
also why we cannot turn `GinVector` into a regular bitfield.

> +    }
> +
> +    /// Checks that this vector lies within a tree of `leaves` leaves.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if the vector lies beyond the last leaf such a tree imp=
lements.
> +    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
> +        if self.0.get() >=3D leaves.vector_count() {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
> +impl From<Bounded<u32, 32>> for LeafMask {
> +    fn from(vectors: Bounded<u32, 32>) -> Self {
> +        Self(vectors.get())
> +    }
> +}
> +
> +impl From<LeafMask> for Bounded<u32, 32> {
> +    fn from(vectors: LeafMask) -> Self {
> +        vectors.0.into()
> +    }
> +}
> +
> +impl From<Bounded<u32, 32>> for SubtreeSet {
> +    fn from(subtrees: Bounded<u32, 32>) -> Self {
> +        Self(subtrees.get())
> +    }
> +}
> +
> +impl From<SubtreeSet> for Bounded<u32, 32> {
> +    fn from(subtrees: SubtreeSet) -> Self {
> +        subtrees.0.into()
> +    }
> +}
> +
> +impl From<GinVector> for Bounded<u32, TRIGGER_VECTOR_BITS> {
> +    fn from(vector: GinVector) -> Self {
> +        vector.0.extend()
> +    }
> +}

Let's keep the impl blocks for a given type grouped together.
