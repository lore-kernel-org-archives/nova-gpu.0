Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012001.outbound.protection.outlook.com [52.101.53.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13044A3F0
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186296; cv=fail; b=d02BhJySiNfSbrO6iNL31CmWrBoF1gLu5ZxyReeL6yJTm8xwQ/bgW0RPA7GO8MCWj641XKMy+sLq0MFTR5qccvCIlySztOA41dJ65FiNp6wIMCWtVBdyhHmAiNAwnCowCoZ3MpGUOThqhBu262Fse5x8MwCb2sir9bQG7W5p9so=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186296; c=relaxed/simple;
	bh=jVoDPIHvlgSH26O5eJFzDtN8+FAaWiw8wbrvweclQMI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=dpdwfrHBb/xQiCFq34RjVd6cgWaOax46VEw+hvlFjwLLNb9ALP2lwOcQSHXs+Hu/L4+n7RCiSCyMreHeu1NO2ErhKlYMlO4U77gHRCCYO1K7Px9Ol/8m9telRUZFCGtZe8VDdguL7fMHIKAs+d5ucprX63SVd6HVZRRyeRiEd7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FfHBZSfT; arc=fail smtp.client-ip=52.101.53.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FfHBZSfT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YR0lJmoC9zL72vm/bDB1X5y7niLFf2itko3JoaYDDL774JZCDs2aadqGc2FAqPSQFnAa3XLkUKcs13k24PRXHqty01R+peUjYPYSe/IHJ8pqbQ4QW7Sho/2jUzGvoyYTG9chDXZtpqICBCwas4P1Pqe7jGhZSw3Q1kVmF/J6XCrpY0quQpvBl80PCArcL6mCNfsT/PRKOUxRqs8yy8mXruhsBtZ2iQ2FGAyDOLcr49L1+y+c6fMTb1TcWQLtLbmigxO7djct1DfxAZgHbcktrDO1Z2GRWwfS5RztFc9Xot3ZH/ffaldaK0x7oGuvCKC26kKJehGGJ30b7ehufwlYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWnqV+/MGnRZwJ+mEJrRSUWACS/Nx+QhdOCfAHcN6vQ=;
 b=SHBKgIuhnu8/1McQ1F+B1sXrhTfq9WyOClgUhJ6xpjC60iyuFE3Uz+8/ezi4Cj4TT1PobHDNJcfFHKyfpchf35fMzogYL8DQokuNJd6BxtbrJYrFvL9Buv/ahsLR+Vefv31ASSUtlPrnWehoVw+gEpOgfVDTIXOm5A+Mnr/31lG9PbTdKrgpv0Hl+Ate2dDJGAMxayz53VYr7Rl6DAZFsJFNMUHEItF4/opeFhlLQljhj3nPD/y9Y0sfzjwWjc4w8fUFMbgSfGcb0v5Eml8MDnDFm20ol5/VS72y3DHhe4wbsd+TxOd8YCPQ6RSx4ysLZ9VSvyNw96HIAlkYaXVFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWnqV+/MGnRZwJ+mEJrRSUWACS/Nx+QhdOCfAHcN6vQ=;
 b=FfHBZSfTkJzOedNAfhkGmYiwWZ0+mFXTu+YTEV74QA/GkO3e2TFuk8mE2sQOEgTJwqHQubWcWmhzvM0RNl4HYW2riMocFjdYXY1cotMkhgZcs4VIvlFmYUpuo7U6tIJS7W7ZpRGFxnNWsrOSkVVAig3wwQ3d0odWF7AgJrXW6TP3QkVLrHSOq0WuSzgivo6140B38YmD3O5yx1W/Fe5oqSxiEbDh0jTPiJBrG5kg9veRMMQkeMSE5hKZ62mjGOiXVf8A6ntIRxLzWs0hHaoi4OvWjBtkknL0J1kSz0wH04KDv22FxJtmRXgahpbCDjKFfdam23YoG7VOaRe8S4a4KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH0PR12MB5632.namprd12.prod.outlook.com (2603:10b6:510:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:24:47 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:24:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 23:24:43 +0900
Message-Id: <DL374U51MZO7.CSIUHVRPH4VM@nvidia.com>
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
Subject: Re: [PATCH v2 04/15] gpu: nova-core: add the GIN vector and subtree
 newtypes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829012243.496697-5-jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH0PR12MB5632:EE_
X-MS-Office365-Filtering-Correlation-Id: cca23f97-1109-4a62-d65d-08df076b9bd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|23010399003|376014|7416014|18002099003|22082099003|56012099006|6133799003|5023799004|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	BGinWGYAn8+xGxjA1udjHsryyzCbpLIELUhmtse1hRbfkHvASLljDuCpQHSD4okn1c0o/06CqMJTkKIZRRRhsOeQaXN1W/LAfTTP5tT/YLiNkdhKTEZlql/9qz+KkiiueVy646AUdH5ciH9MApNolsIEb7OSk2RH1bwNkrCxlrhXyT3vMtrDUaMn+KASy29gdv/4pjICjuhIucjH5O6oWuaI10NQ6b3/7gHQFqBPZMpSvLa4uYiuZgQMEbhe0cTAu3ooCQTDcPuwcMZ7hg26wCjn4IDBhFJQcFbcDJSQopOBftpieNiaqrRTaPhsGTEp4edE8D3QgNGcGHr5irfUtglibjOBAcYKnxz69NrU67MIzfE+RNMWAwXOsCz8AQsko/EiPewAFI/33DK0FGJ+uTRzJRx05JZBSyMfra3jBt9uouMoPrrS1pMjqgUMAcdiPKdRCIIWoLnc0DXZK+uoVVr7QKsBtLNBObHAhaa84doi0uZqv4cv1XiIiweJGfsronXys7lHzw5KDZzN1PGkUIhER3A8rzF51Mb0lQW0wJ5z1BBD4o4tzuctgSM/6MHOl1a1o/K5YhJCT3iGUCU7/RuT+DXQhSq/lnUmmIcjjcqgX0KpMdhdKJeNy/YKEpjBxi6JkJuR3YU7NUux23+2t0njqebR1F3iQhMyfXolIxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(6133799003)(5023799004)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXowY1AvS1R3d0ErYUJJcGRwZmd1T1YvSUc4b2NHSlFhZlhKTm9DclB6SHl6?=
 =?utf-8?B?UVpvODVrYk80cTN6L3hOVzRkcWVNZVVxN0F1NTF4UXFIRU5GLzdybmpadlZY?=
 =?utf-8?B?VG41TTZjOFhleHRCTTBCQTF5RHk3Q3pzVHpCbFhNVkZ2emoxWUI3UG9RZHFL?=
 =?utf-8?B?Q3ZlY0d0YjV4ZXhTQVduYkZnQ2EzeVN6MS9VM3hEclR5Tm5tTVRhSDFDdjVD?=
 =?utf-8?B?dTZ2QnRrbDRaeWRva2IvWkJPWmlEYkhTNFRpN0ZkL0lFOW4xY3I1bndEZXJj?=
 =?utf-8?B?ZmdFSDFKbE1Id2tWdmx6bVY3dDdoMHRxMWNvZWpYTVVOSEFiRmhnbWN6Q0Zy?=
 =?utf-8?B?R0FDMW9GbmVVOUVaVkxmTTBwUDZqRFBFNldoYWRsTUlleHJEOW1rYnlNazJK?=
 =?utf-8?B?M09nUHlVbG5EbExrTFZNOUoyZE9xcU1kWkl4TzZIT1RKMWFWTWw3eXdHbXNj?=
 =?utf-8?B?c3RHZk1sdHR5UERWcEFNcktnb1RjR0dBaENOWGZWOHNuR2VRSWhrelVvemJh?=
 =?utf-8?B?Q0xyeHg2WXNseTMyaFdVWlFuRkV6M05QbFBPVm0zQlh5SmtJaVJkV2dCN1FM?=
 =?utf-8?B?Y0w1eXZSYk8zZ05XMnl5anpiR29SKzljRkV1OGR3SzAxcFIyS01TdHJzWGkv?=
 =?utf-8?B?TFg2WHBUTlZBcENWRFB5S01VdktKVXVlTGx1OFhFK2czRkJtRk0rQWJHV0R1?=
 =?utf-8?B?clB0MVJQa0sxM3ZKbUlsb0E5YVE5Tkt6djlVUjhYTHZSY2ZJU3ZYQTNhRllR?=
 =?utf-8?B?TmtJMzI2c1p2RDhZdEU1ZjdDMVR2SU8vc3A2WGlBUWxoT0ZHR3V5ZHNhc0hk?=
 =?utf-8?B?b2FwcThTYzEwamw0alFmV1FKOXpWNXBJeDM3SU1GaGVmRytPWVhuZ2ZjWThM?=
 =?utf-8?B?c28wZWhBend1d25oUzRYVWhEZ2NLVDVWU0RQR0hiVlAzV3I3L0diYkxLME4v?=
 =?utf-8?B?dS9qU1hVQnkrWmFlUU95YXE5bXZabkZlbkFzcGpMUnIxZ1dVNHg4czRyYng2?=
 =?utf-8?B?ZGt6VVJSY20rWlR5NTVER00zSWJGNnkvVnRVRXJNUXRKUmtBd1B0ZEJTQ0M2?=
 =?utf-8?B?akVnOGpKVDl2U2FNcHpsRmkybnNVbk0rdzZSTStjYW01Z1QyVGlVN3hZbEtC?=
 =?utf-8?B?Zy9zSTBlMWlvZ2tCanVIa3FvWTBPaWttTlRFR2hHdjhEYUZ5NVZpRUlBSjZv?=
 =?utf-8?B?bit5SmJXdEprR0dHYnpyOWozVDRURlprd2FucXZienFVaTExVndUMkgwVVd2?=
 =?utf-8?B?KzN6ZnlhczZUY01QdVhNRTNBSTk4MWNlakY2aTZ2TXo5aU83eTJGMXdxKzJI?=
 =?utf-8?B?NHUvRGlQRW0reklVUHFTRnA5R0xvVWR1S0tvUGVyQ3lkVU1BRTBld3pHMi8z?=
 =?utf-8?B?eHNFQkEvaVhrd25DTDhlSXpRQ1krUHl3K3oxODh0K0MvN1hZZDJldy9vWjIz?=
 =?utf-8?B?VWpoRWFtemZlVGk2bU0zRnhYSWlhU1M4QUVtRnpCOWFTZ1daTGVSOElXVHN2?=
 =?utf-8?B?aFk5aG1wb21qOXg1Ny9GZ2xyZTFWaWJEYkdRTGVoV0VYWFhpb0tYRjhYbG9Y?=
 =?utf-8?B?YXJha3VNRXl6ZjNCYllWWm94OHh3aVVLUVdkdFF1ekFsTDZPOGo4NFhteWxI?=
 =?utf-8?B?OXdRVGxMbUpXTmR6YUJJSzAzbmhBeUd3REtGT2RjLzRuOWJadnl5TUoxM2tG?=
 =?utf-8?B?emVTVDlrMS9xdHI1YWZMb2JrSStuQzNZL3pVWHFaSldLYlFCTlNEM1ZnK2wv?=
 =?utf-8?B?NnNJdVp1dEJOd1RZU2FzU0tZM2lEWjZzVWo3OGlBbTZXdUVXYlNRVWJqKy9C?=
 =?utf-8?B?eEhpV0ZCOXllTDVDMEFOT3R1OWdLOWZpSHFYL2VWeUJ2N25sdUFXV01vS2lj?=
 =?utf-8?B?dzQxV01CaDRwL0NvYXVwSlpranVTTGNYZ1QxRlNEQkdFa1RHZ1pjOGRPSVQy?=
 =?utf-8?B?bTRqN2ZkTFZ3dXdCTkRCbGVBMUpaUVVxc080eGdyODFjamVaa0JjOFBpVm4y?=
 =?utf-8?B?WmV5Mnp4TWFkY0FGYVpIRERrbmF2VTZ3L2lDUnE5bHhrbHJJeEFFU2NYSWZh?=
 =?utf-8?B?VUV3YldOQ0JBUFpWbzgzWjNUV2VRMmRCNWkrdEo2RzZ3aVNLZUJYZ1NjUU9y?=
 =?utf-8?B?V0IzNTh2aHFtS201ZW9GVmF1S0lrd3Y2QkhhaUJmM3ZPMExRRDFjZnV5TEZC?=
 =?utf-8?B?eTdmUWJZWERJVEJEVFJmVVFocG1xb3VMR2pHWXFKZWMycVJxaDZva2JhSjUw?=
 =?utf-8?B?Y1V4TkM2MFk4b1RvRzJPczdVY2tydmZvekhqQW1yYUY0MkJDeWRCRVJpRGIx?=
 =?utf-8?B?WHdkR2c1WGE3djkrOU12eERjb3ZJWko5R1BJM0g5M0I5RUFNSGNOZE0vOUZm?=
 =?utf-8?Q?SCy9YH0SakZfAkLu5exdfHxl19mMpbGyUAYe0zITvBSWn?=
X-MS-Exchange-AntiSpam-MessageData-1: FwA92491egVYiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca23f97-1109-4a62-d65d-08df076b9bd9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:24:46.9982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVtTqOmYIpTWYDhm+q0vo9Xfw7tNws0iWcvr/lvDfbUd1XrB9ZHh4KrPZr7Fd/B9jP0RRrk7ACqjWvB/Op6tKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632

On Sat Aug 29, 2026 at 10:22 AM JST, John Hubbard wrote:
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
>  drivers/gpu/nova-core/irq.rs                |   1 +
>  drivers/gpu/nova-core/irq/interrupt_tree.rs | 209 ++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs          |   1 +
>  3 files changed, 211 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/irq/interrupt_tree.rs
>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index 6656a1a23d59..3066ceeb850c 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -8,4 +8,5 @@
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
> +mod interrupt_tree;
>  mod regs;
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> new file mode 100644
> index 000000000000..da24f3d35893
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -0,0 +1,209 @@
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

The dedicated types are really nice. Looking at the full series, I think
we can even push them further and unleash more of the guarantees they
give us. I'll comment on the relevant bits of code in the patches, but
one obvious instance is that the registers defined in patch 3 could use
these types for their fields, instead of having to convert them into raw
values and back again (which partially defeats the purpose of using
dedicated types as you can write e.g. a `SubtreeSet` into a register
meant to represent a `LeafMask`). For instance:

    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF(u32)[16] @ 0x00b81000=
 {
        31:0   vectors =3D> LeafMask;
    }

    ...

    pub(super) NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET(u32) @ 0x00b816=
08 {
        31:0   subtrees =3D> SubtreeSet;
    }

This unleashes some code cleanups in the patches ahead - I'll comment on
them as I come across them. But basically this means that I think patch
3 should come *after* this one, so the registers can be defined with
their fields from the get-go.

This also means you will need simple implementations to convert LeafMask
and SubtreeSet from and to `Bounded<u32, 32>`, but they're as trivial as
they come, e.g.:

    impl From<Bounded<u32, 32>> for LeafMask {
        fn from(value: Bounded<u32, 32>) -> Self {
            Self(value.into())
        }
    }

    impl From<LeafMask> for Bounded<u32, 32> {
        fn from(value: LeafMask) -> Self {
            Bounded::from(value.0)
        }
    }

> +
> +use kernel::{
> +    num::Bounded,
> +    prelude::*, //
> +};
> +
> +/// Index of a leaf register, bounded to the `0..16` range covered by th=
e leaf register arrays.
> +pub(super) type LeafIndex =3D Bounded<usize, 4>;
> +
> +/// Number of vectors one leaf register carries, one per bit.
> +const VECTORS_PER_LEAF: u32 =3D 32;
> +
> +/// Number of leaves one subtree covers.
> +const LEAVES_PER_SUBTREE: u32 =3D 2;
> +
> +/// Mask that bounds a leaf index to the leaf register arrays.
> +const LEAF_INDEX_MASK: usize =3D LeafCount::Sixteen.into_raw() - 1;
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
> +    pub(super) const fn into_raw(self) -> usize {
> +        self as usize

`// CAST:` comment needed here - it just needs to state the obvious
though. :)

> +    }
> +
> +    /// Returns the number of subtrees, each of which covers two leaves.
> +    pub(super) const fn subtree_count(self) -> u32 {
> +        self as u32 / LEAVES_PER_SUBTREE

Here as well.

> +    }
> +
> +    /// Returns the set of every subtree a tree of this size implements.
> +    pub(super) const fn subtree_set(self) -> SubtreeSet {
> +        SubtreeSet((1u32 << self.subtree_count()) - 1)
> +    }
> +
> +    /// Returns the number of vectors a tree of this size carries.
> +    pub(super) const fn vector_count(self) -> u32 {
> +        self as u32 * VECTORS_PER_LEAF

And here as well - maybe we can have a `into_u32()` helper that does the
cast, and then `into_raw` can call `u32_as_usize` on it to avoid having
a `CAST` comment itself?

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
> +
> +    /// Returns the set as the value the `TOP` enable registers take.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +}
> +
> +impl From<Subtree> for SubtreeSet {
> +    fn from(subtree: Subtree) -> Self {
> +        Self(subtree.into_raw())
> +    }
> +}
> +
> +/// A GIN interrupt vector.
> +///
> +/// # Invariants
> +///
> +/// The vector lies within the widest tree any supported part implements=
.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct GinVector(u32);

Since the maximum number of vectors is 512, and as
`NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER` is 12 bits, how about
storing the inner value as a `Bounded<u32, 9>`? This enforces the < 512
invariant using the type system and saves us one `try_with_vector` down
the road when we write `NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER`.

> +
> +impl GinVector {
> +    /// Returns the vector numbered `VECTOR`.
> +    ///
> +    /// Fails at build time if `VECTOR` lies outside the widest tree any=
 supported part
> +    /// implements.
> +    pub(super) const fn new<const VECTOR: u32>() -> Self {
> +        build_assert!(VECTOR < LeafCount::Sixteen.vector_count());

This can be a `const_assert!` as it works with a generic argument.
Although I guess we won't need this anymore if we use `Bounded<u32,
9>`. The `Invariants` section of `GinVector` could also be dropped.

> +
> +        // INVARIANT: `VECTOR` is within the widest supported tree.
> +        Self(VECTOR)
> +    }
> +
> +    /// Returns the vector number.
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    /// Returns the leaf that carries this vector.
> +    pub(super) fn leaf_index(self) -> LeafIndex {
> +        // By the type invariant the quotient is already below 16, so th=
e mask changes nothing. It
> +        // is what proves the bound to `from_expr`.
> +        LeafIndex::from_expr(crate::num::u32_as_usize(self.0 / VECTORS_P=
ER_LEAF) & LEAF_INDEX_MASK)

Let's `use crate::num` so these prefixes become just `num::` as there are
quite a few instances in later patches as well.
