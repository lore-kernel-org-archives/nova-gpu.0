Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A083FF1AC
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274476; cv=fail; b=taBCb2iUQrX+oa4jeLqVb3Wk6wjrlX8M7fa5wLKAA6+b76hXONrlsxSK531JWwRa//tBOBoLA7G82vPNbxd2XRsl5x2wAl+V+X7yWpBmKHObd0O4rvnL0FKxIZC2ovpFJloDxHXB4AP/pgsNoFUmsb5uwx24QQWXkLgyluKvtiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274476; c=relaxed/simple;
	bh=KrNoK0UxrPgdECe7bg5yF/KJeYtWJZ9mD9sB6FA8fUw=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=HgKkdXAjIE5/llM4O3qySMrqKIiGLRdYOmDNWalL5dC1cwIp8a1/ngtE0FX9pa0mFbp3//5A6C6sU3Bw+Nxj3R9AYIcQqLxqIuPIs3PTbx1JyE+GIr0ETHeD70k+ijS8Od/ahlm1qhzjmeutxyyyAC7ePldxPk3KtakoEjsBfNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g1FsApq+; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g1FsApq+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg8gtaXpI5FQkhhCnHN+EOPGABetL4JKVkTqeum2x0KifTy8xps3PxS8BkCpe1eL3u0Y4ur7Ld5+sT+L1QxhKd86ZcO8nJsrOeMjp4GhCBocBP6ptCNKWVuO05iLQFga05Bya3Cw49D/ugF1Q+UmhHTkthjmaOyCI1d1SYTrzzwaF/Li6RSSyHncv+rXAzf6OWdJLP9GPV8nRhavfIgUBuYVDkYv2hukYJkaZ2kIhlFMWjcHqd8OU1u2YU3jEzE4gnx2gbcNSW+3PFUbjD3Uajkd+oLFYZJppjPWDfcPSxW3Ew9iUM6iEnloR/l9XRoautQSjK98bEwKml5vuztqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8VdqqJqJcengHXwzKJBC7CpTkvIzDxqDW4ygIn7BFSQ=;
 b=lSosYoBU3Fs63e8Nr9f0c/Z2PKkSo+LXJTLm72TppiQF+XBCSEvrpgDAa52J5S1qpQCQi0uEeRXeudVt24sdY0pQxOT5Hh2bcibVy7Ji6AOYOGloCRZ5nei8zWwVHPkHHpw1Lbu0H90g7fG/tZ/uODQiHGuGf0CqWx5OZoLySC6h4um95UzsWp4ZieZnfRc+FztKNohX1gDce53cEcBhdWtVo40/uGGSSsGTL7C2xBnKZhz8EOFSTw0XldJeKuyG/abrFzN8djRvJ4IPfE+wvoBO5DgOcuilabY5ydLCbtoGZVZarQsOFOAKv/AmaaVeuLH+tsHMt6RGeezjpNYfGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VdqqJqJcengHXwzKJBC7CpTkvIzDxqDW4ygIn7BFSQ=;
 b=g1FsApq+UFxtPiObySEc4tQYRB5q3cufW0cE9VmAmwQI+UG2oTpPzonzbA9s04Ytv5bmebWX1PRm/cwwUe6fqJgxNnBj18KmqxuYw+LeEM4SNxgJtlvvcBonPB6XTTc0gxW2rkiIBLaJCzKff+rB7Rn9Y+FlfLgggIDRCxMqQCAE/5aN6aVzSuSQKbwsnA/FkmYa2JBmeNsO+oWlPvCkXL+1oyZTZTNyZwFZ25PiKjBAKEqhuwCvbPxksX6fZrhpO3TPS8Qe22CpEwQ8Zknw6AdxXgpgAjZmrAkawe8LJQNwDa6Ky1Bseg8Sx52VRCYhM4vpoBpWm66VNPDnyLDCUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 14:54:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 14:54:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 23:54:22 +0900
Message-Id: <DL42E2ZJ3I44.1KOMPGIKIJY5S@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v2 12/15] gpu: nova-core: drive GSP events with the
 SWGEN0 interrupt
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-17-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2867db-60c0-4305-a7af-08df0838ea98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|7416014|376014|6133799003|56012099006|10067099003|4143699003|11063799006|5023799004|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XzlVxK2mdPV3eJpYFrqbNPAQnxeVGgZTM6vj6fybBnG4EWDZ2Exvh/kuW08/QINZqm5nh93oC9Ak98E4wADRwSGOnSUcC/d1Y1A+qy4nBeXQay7VuqN8wFgMV5UxLjRGOwrGZsHFBlSYqtodlhuXrkDPydRr4X99GnoN65RG34WlIrzVX4XPM9O2Xro5/bowh1cz+oWBR7KCqgY76eJO1trzrGwHtXAL8Ml+ICsUv/1S7Ek0oiLFTgv8uQkb38GkKet824GRDtD+jB/ecHc/n6m/dXKyfnb7qeHnQ+4fuMWN+PxM5TJNSakKQ9JfHA79QWbOgm1rz0Kv+3ycTZn4ijPStu/vcgLRvSxfeekdeHjqiY8mrl33nSd+oFK3majCSvYsb47htykWradSAWKBp8QZZcLoWmKvCZuMYk64R12Q/Zv9PAox0IjbhRN3MOopkVKxp6bTejNFPuvUWyNxuP0V0R6g/8I+Jf9eq+3v+rC9axJRmFeDhuFZiHomWOtPlL2cwe5kT+rVNzbE0cqfVZwaxpzoGQQFbqYBXVJfg6i05P2Kild/LaQ0x78icMwTq2PLQ2ZnwThnbn08CDILt5gDfoVjo+kUBvJpnIHSKLtuOqRJDZCmU+ubJMBH9x0EMaMWzDZDd4B2rQYDDT6lik5degXOSjUXkLqy/XwEGqE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(7416014)(376014)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkFTVDhVRFVMWkduZEJBSmJ5eEFuM1ZZZkVLUEo3VnJrM2NHWFZxMnFVRldn?=
 =?utf-8?B?OENRQ2NsUHVBK1dORVFCeWVVNkxHOVoxYUJHMFE1aHA2bUVXOThWWkoyaHg5?=
 =?utf-8?B?Nzd3dWFtOE1MTDlZb2U4V2I1RHUyMCtVOEEvUUlMK1kveFZlU3JvZEJrUFNR?=
 =?utf-8?B?b3F6YnF4OWtqQVZpVW84V3JUM2F2N2w2S2tjNDhPaWxLMVlQcWtTYUxjSEY2?=
 =?utf-8?B?UHZoZFREc1VBdXFSaGw5ZkhuTW90elU0NWRMdG9NNVdjeC9WMHFXWG8wR1ow?=
 =?utf-8?B?M09MR05XeWZlYmgzQXZra0s2R3MrMkJuY3RKdlk1Z2Q3bytwOWlNKzIvRTJj?=
 =?utf-8?B?SnBCM1dHWVIxNHRpOEw4QXVPUXN3MTg3RzB5SnB5UGNRYU5Kb25nRVRvSWJK?=
 =?utf-8?B?REVYaDNKS1hPWnkzUjZvOEhvS3dvc1ZxRDZtTkhwbTlmSmlja1NYV0VVa28r?=
 =?utf-8?B?bWlyVXMzdTN4L1dOUzNqY09xL3ZDdCtYcjdRakRxKzBkaHFXS1lNSzdIWHVp?=
 =?utf-8?B?MSt2N3hvQnFFNHIwcWFoMGovemdyNUV3N2dRSHVRa1VPZTQrb01SWVFBdDN1?=
 =?utf-8?B?NFc1bkdxb0FsdmlwcThzRFZkUUFYTWU3dTV4YjhTZ0JaelpPVythcy83RnRt?=
 =?utf-8?B?NlRNdkp3SEZHRC9NMlFlZG5YS3VYbXMyUjZJZlljdVcvNy9WQ2ZTU3l2cE0v?=
 =?utf-8?B?SkxIcFgyZmlMRnA1VG5haklBWlppOUwvYitELythZENzb0FoSVdYTlpkRFBa?=
 =?utf-8?B?TWdCaWR2YjJIdUNNUDFmOWlQMldmZW1LZ013SGwvVjNOcjBGSnpqSzhyUW91?=
 =?utf-8?B?bXVKTXJYOGF0ajZzRlN6QVZ0dXppTmlDQlQyQ3pyV2t2NzRvdGM0M2tpY3hD?=
 =?utf-8?B?NEZVdjFkWlpLUURaT3RnN2JSdDkzM2hyNmdtOVY1Q1IxM3ZkbWtUaXB5TGxO?=
 =?utf-8?B?WEdJdVlSNHh6Z0ZEVnFQVVp5RWU4SThuNUJsOVhGc1RoWk1wQkg2S0xjRWtw?=
 =?utf-8?B?N0g3cXVWYmdCNEc4MWg0WHRybnVDbU40b3ZGYnhvOHJpL2FscjFwUnhVd0tL?=
 =?utf-8?B?WFQ5RVpnaDlCWEdONjVTNFFidGFrNWR2N0RURWZENDJEVmJIR2VkREtxR2RB?=
 =?utf-8?B?dkl6VDFoYlBQWWRqa2dFckJLWHlQUkNLei85QVU0dUFDTUttejJzcHFBWlZQ?=
 =?utf-8?B?TmF4aFBkMWNPcDBQUTRHQTQ1R01mSmxRbGErdGlabmVQVUw5a2dSQTZEWE9F?=
 =?utf-8?B?TWJqVjMxaVA3Tm56MDNTTFkvM2NHN0xsV0ZSVFhzV09mdmZxb1lwZnFyY1VT?=
 =?utf-8?B?b05DdXZkLzQ4Y2JWV1d4M3BxQmcwSnJBdHE2alh6VE5ZKzB0Mm9QYmU0Z1g4?=
 =?utf-8?B?WHlKOHI0TlJ1blB5c0NhcXVMZ3UvbWcybFYzRHRzQUpIOUZva252U2hjYTQ5?=
 =?utf-8?B?UmJHbHdDbmhmeEhkWU1PcFhpYVpETDNNR0JUZFpybkY1YmhDMjdKdEYyY0t2?=
 =?utf-8?B?MFJ2dVJOZUFJT2lWTEl6bGlTVG5tMnc5MEpncVRnRTNVVGVxZTQreGU2K01N?=
 =?utf-8?B?b25uaTBabDl3OHRIZnloOHkyT3VZNHNOb2FramZTeHBzMGlScnpueDQ5Rm04?=
 =?utf-8?B?L28vNG11MXhSUS9hNG5vM1g0dUdnZmtHaWhuM3lLQUhJRE52QXlOaVo1c1dy?=
 =?utf-8?B?UG41UXgwTU9qazV2ZHZlWE1wR1F0Wm52cnd4WGZTWFZiajkvaDhpd0wra09r?=
 =?utf-8?B?bmFvR2NjYld2eFp6SnRPUkx3Wkt0dkRaeUM0MDFxdEloT2RlblpUdFloTUNX?=
 =?utf-8?B?NDVJYmttK0xKb2NYR0J2TzZsR3RHcDBENXd6eFcwQWVXQ05VYUk2a3hOWkVU?=
 =?utf-8?B?U3M0K3g5R3gwMTJzTGUvN3JublNKWUJIcy9peWR3YmRYZFlaRWlvWnFtR1Av?=
 =?utf-8?B?alpEMWdTWWZ6bE9maWZrNUpWTmY4V3FkV1ZZQmtiQ20xUmsxU1JlOENlR1Nk?=
 =?utf-8?B?TlVPS3VWWURSOTNOTEp3RTE0ZUFiOGVvV2EzdlFHaEt1eUFXMmRXSTJDQ3J2?=
 =?utf-8?B?V1VUdER6U3FjSk5qcFF0c0xVS2dXb0twOEJiSEtLTSsyQTF2ZHFUYi9yTE5i?=
 =?utf-8?B?b1JYT2duRzNhWnZwZ0FiZXo0M2J3dG1HQ2xPcXJXY2dJWXc4NWgzY01WTTEz?=
 =?utf-8?B?eG1zVTZTZTUxM3JoemtJSk5sMHZtNmNkdEV4NkRFWVpNNC82YXBLK004Q25F?=
 =?utf-8?B?cnhPQSsvUmZoaHlLdVpDK3lsOFpPbjFxaDZjUWQwYXJyeUM2NU0vUEFMbkc5?=
 =?utf-8?B?NkMxU1RIZm5JZVBmRXN2UUJrZTZHbVBuQTZtTm1OYUxXS1duUkJJVHZseU0r?=
 =?utf-8?Q?Ci3uWTfecd4ME1nn8wmO7fDnHGSyzipuearifTzJRYRB9?=
X-MS-Exchange-AntiSpam-MessageData-1: fc2bYmW9e15yFQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2867db-60c0-4305-a7af-08df0838ea98
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 14:54:26.0810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euUogJ3Dee0uKY82Q02Gu0KLTyQX03W2jOUIyzNOXMHRSN/OFvONkV8CeaUvfv+CgF5mmP+OIZYw3PaxL3nFOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

Hi John,

I am still looking at this one in depth, but wanted to post what I've
found so far before going to sleep.

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> The GSP posts events, logs and error records to the GSP-to-CPU queue and
> raises the falcon SWGEN0 output. GSP boot polls for its own
> notifications, which leaves the latch set and pending bits in the tree.
>
> nova-core drained the queue only while polling for a command reply, so
> an event sat unread until the next command was sent.
>
> Service the queue from a threaded handler on the GSP notification
> vector. The top half runs in hard interrupt context and touches only
> registers: it clears the GIN leaf, takes the falcon's SWGEN0 latch and
> rearms PCI delivery. Draining the queue takes the command-queue mutex,
> which can sleep, so the top half wakes the IRQ thread to do it.
>
> Quiesce the tree, clear the latch and rearm PCI delivery before
> registering the handler, so none of that boot state reaches it.
> Pre-Hopper MSI rearms through a configuration-space write that the tree
> drain does not perform, and an interrupt delivered before probe leaves
> delivery un-armed.
>
> Move the vector allocation out of the self-test and into probe, because
> the vectors are allocated once for the whole PCI device rather than per
> handler. The self-test and the GSP handler each take the vector for the
> subtree they service.

Could the vector allocation have been put at its final place since patch
7?

<...>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 589b4b210a22..932e39e012f0 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -10,7 +10,8 @@
>      num::Bounded,
>      pci,
>      prelude::*,
> -    sizes::SizeConstants, //
> +    sizes::SizeConstants,
> +    sync::Arc, //
>  };
> =20
>  use crate::{
> @@ -25,10 +26,12 @@
>      fsp::Fsp,
>      gsp::{
>          self,
> +        cmdq::Cmdq,
>          commands::GetGspStaticInfoReply,
>          Gsp,
>          GspBootContext, //
>      },
> +    irq::SubtreeVectors,
>      vgpu::VgpuManager, //
>  };
> =20
> @@ -323,12 +326,27 @@ fn drop(self: Pin<&mut Self>) {
>  }
> =20
>  impl<'gpu> Gpu<'gpu> {
> +    /// Returns the chipset this GPU was identified as.
> +    pub(crate) fn chipset(&self) -> Chipset {
> +        self.spec.chipset
> +    }
> +
> +    /// Returns a shared handle to the GSP command queue.
> +    pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
> +        self.gsp_resources.gsp.cmdq()
> +    }

I would expect that the interrupt rework series by Danilo would allow us
to borrow a reference to the `Cmdq` for the interrupt handler. Is there
a hard reason we cannot do it and need an `Arc`? `GspInterrupt` already
borrows `Bar0`, so this should not be different.

If the `Arc` is really needed (which I doubt, but still going through
the code), the `Arc` refactor should be in its own patch to make this
one a bit lighter and easier to review.

<...>
> diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nov=
a-core/irq/doorbell_test.rs
> index 3fd8b26e135e..c9712fa1bd18 100644
> --- a/drivers/gpu/nova-core/irq/doorbell_test.rs
> +++ b/drivers/gpu/nova-core/irq/doorbell_test.rs

I would not expect `doorbell_test.rs` to be affected by this patch -
please see if this can be squashed into patch 7.

<...>
> diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq=
/gsp.rs
> new file mode 100644
> index 000000000000..6366380eef98
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/gsp.rs
> @@ -0,0 +1,215 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! GSP event (SWGEN0) interrupt handling.
> +//!
> +//! The GSP firmware raises SWGEN0 when it has posted messages in the GS=
P-to-CPU queue. That
> +//! signal reaches the CPU as a PCI interrupt through the GIN tree. This=
 module provides the
> +//! threaded IRQ handler for it. The top half services the GIN leaf and =
the falcon SWGEN0 latch,
> +//! and the IRQ thread drains the message queue.
> +//!
> +//! See `Documentation/gpu/nova/core/interrupts.rst`.
> +
> +use kernel::{
> +    device, irq, pci,
> +    prelude::*,
> +    sync::{
> +        aref::ARef,
> +        Arc, //
> +    },
> +};
> +
> +use super::{
> +    interrupt_tree::{
> +        GinVector,
> +        LeafEnableGuard,
> +        Subtree,
> +        Tree, //
> +    },
> +    SubtreeVectors, //
> +};
> +use crate::{
> +    driver::Bar0,
> +    falcon::gsp::Gsp as GspFalcon,
> +    gpu::Chipset,
> +    gsp::cmdq::Cmdq, //
> +};
> +
> +/// Fixed GSP notification vector.
> +///
> +/// The resource manager pins the GSP SWGEN0 notification to this vector=
 on every supported chip,

nit: "GSP-RM pins the ..." for alignment with the rest of the docs.

> +/// so nova-core uses the constant directly instead of discovering it at=
 runtime. The leaf and bit
> +/// serviced by the handler are derived from it.
> +const GSP_INTR_0_VECTOR: GinVector =3D GinVector::new::<155>();
> +
> +/// Subtree carrying the GSP notification vector, and the only subtree n=
ova-core services.
> +///
> +/// Probe allocates PCI vectors for this subtree, and the GSP handler na=
mes it as the subtree it
> +/// serves, both when it takes its vector and when it rearms.
> +pub(crate) const GSP_SUBTREE: Subtree =3D GSP_INTR_0_VECTOR.subtree();
> +
> +/// Clears the interrupt state that GSP boot left behind.
> +///
> +/// Disables every vector in every implemented leaf, clears the falcon's=
 SWGEN0 latch, clears the
> +/// tree's pending bits, and rearms PCI interrupt delivery. On return no=
 vector is enabled, so the
> +/// tree delivers nothing.
> +pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::Ir=
qType) {
> +    let tree =3D Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into());
> +    tree.disable_all_leaves();
> +    // GSP boot consumes its notifications by polling the queue, which l=
eaves SWGEN0 latched.
> +    // Clear it before the tree drain below, so the drain clears the tre=
e state the clear sets.
> +    // Messages already posted raise no interrupt of their own, and the =
caller's queue drain
> +    // covers them.
> +    GspFalcon::clear_swgen0_intr(bar);
> +    tree.drain();
> +    // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cyc=
le methods, but pre-Hopper
> +    // MSI rearms through a configuration-space write instead. An interr=
upt delivered before probe
> +    // leaves delivery un-armed on that path, with no handler to have re=
armed it.
> +    tree.rearm_pci_irq(GSP_SUBTREE);
> +}
> +
> +/// Threaded IRQ handler for the GSP SWGEN0 event.
> +///
> +/// The top half clears the GIN leaf and reads the falcon SWGEN0 latch. =
The IRQ thread drains the
> +/// GSP-to-CPU message queue, which takes the command-queue lock.
> +#[pin_data]
> +pub(crate) struct GspInterrupt<'a> {
> +    /// Borrowed BAR0, for falcon register access from interrupt context=
.
> +    bar: Bar0<'a>,
> +    /// The GSP command queue, drained by the IRQ thread.
> +    cmdq: Arc<Cmdq>,

As mentioned above, I strongly suspect this can be a `&'a Cmdq`. Which
would be great as it would make the whole `Arc` refactoring unnecessary.

> +    /// The GIN interrupt tree for this chipset.
> +    tree: Tree<'a>,
> +    /// Device, for logging from interrupt context without taking the co=
mmand-queue lock.
> +    dev: ARef<device::Device>,

This can be a `&'a device::Device` (tested locally).

Will post some more tomorrow but this is what I have so far. :)
