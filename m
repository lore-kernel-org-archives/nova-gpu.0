Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF44364042
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 01:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128276; cv=fail; b=JA6iA+b9BTB9xX68NGGIEtuI/wAoTfn4xrHqFtIRADOt2M2QVXkXb6tcFPATHLv59SlS/pCnE6zrZV81xCglTSOHYm35DteOIVxwag/RONMLO9smf1JzlfzyDUyw38/kdM6H86gTXGxz9oN0UQbFqb8nsuC/DQ+cA42CKJF/k0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128276; c=relaxed/simple;
	bh=Mw04ATWacmhppv2cfPvBhq2KB1lTe1L8YAN1f9XdiRo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=KTfOENhyq1RB2fJ/MyiNJ3CD1uqMxdkBmCMAsr0vMvgfENbf2q5jjozsL3LgNs0o2bOPu7Mpmfkc5nDj0IDBVAaMTwqD521mjEzSwQal3Ru1SDlNEZ8fdT5e7CqEpZPLTHIvbLEVctNDo8voEBY/2X7OCtpBC8CLGC1yp4Qn9+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ICG+SSNg; arc=fail smtp.client-ip=40.107.209.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ICG+SSNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxAUefKeOvEdSgo6uP2QbEHBYBC7xM4L8kXi+7cwtFOWwOQGq2jF2ZVJcWCSFH4qTfvlz2EV3WircYvA7/CxrbQAAL56+OuGhwG6modfheWWzCra35WwkhEIXr6pvjMCnH8LA31pvPsPY0kf52kw1fqDOIwAO5dTlMiYTBk7WAGH6Jk9aICqB9VGjzm0l7EfZv2Hoo5Re4cw2H9UcsrXzgbPpnqUa/6Ut1fa3i7TlT5lS3KmMnf+NXEppFTICh8THA5PyJPXqOKp7JNzwNNT181ovxYC9i7vmgRJ9LBRpFpObGsxzbMQuI+/jLhYhSW8+80hpvADG/LMSeKxUzRLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vMuZIPqYjaB3UqPI/FUs1UrfCYB3jIK9QtM6NJ+EmLc=;
 b=dgwI63OosE+JF27ewvNkXT3Q2qNs2nqdzsZQxh0y+Fycy0XBxgM9o6h1sdwiiQ+TyvCs7fF8VQewsMM04MKQH4lIzu27C7mYkt9gxCsWwxRWQFw+Vp4MV3G5FhIRfQ83G7Z6eFnWgcoqfNcEcSbS4bLRXJKMQTkFoO53EwK4kV/fruzO2TJ2by1dIH2F4UR7I9fH2kSI/frqD83EraeYp+MVXZgUyi/U+6amKAe4kxTuxpSRDrPsBCavYd4TNnKPG0/Sn3+T2g6N/HAt0+jVVmf/A4F+HrD1wPH6mo60hV/WMCiZTovux6XO4tuAvVfkALWXzffmzE2K+xz4IECHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vMuZIPqYjaB3UqPI/FUs1UrfCYB3jIK9QtM6NJ+EmLc=;
 b=ICG+SSNgi/C9PMyr7ZAo+/mW8l+KwnApzQd4PQ6ljYGP/ePSk2MqSYBbMGaSNZ9FEzioESER6pdIpOeUR/3itxUJ7gPH2ak2HDBgAWRXhGdScFKZsJp2FqpCgvRP/vOAzkwzESKt6A1SXtTQ/jERcb/4idzIl/4+oRPPPPtrEsbEghg1bsn4FqO4fYl3UX+FP7493b7hMGBSNHWRcRPMu+5/akaZAiQARb8xpEL1jn/7ke9v067qs+RJ1J0tqzsGxASAJQQjpghoyy9FQBi0slaXMHkS2cQevwESDU6BP3EATVBTiyz2aTwEU1TJ+cUQ7prLXcS9N9mjRIpI5m8fRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA3PR12MB9199.namprd12.prod.outlook.com (2603:10b6:806:398::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 01:51:10 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 01:51:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 10:51:05 +0900
Message-Id: <DLMBICBJD4RA.3L18UPQMNHMJG@nvidia.com>
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
Subject: Re: [PATCH v3 21/33] gpu: nova-core: gsp: add the GSP_INIT request
 builder
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-22-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-22-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0093.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::9) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA3PR12MB9199:EE_
X-MS-Office365-Filtering-Correlation-Id: 717eced6-a8ba-4536-ed18-08df19152366
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|11063799006|10067099003|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	t9vqXmxmD+Byg/EZPCnPzKfczeVueobU2i/GlaHSKfxOG87tmrZy/zeXr7RYTT2Pu+G1G1CAZexn9e69uranVYfri9sy9NMMzkw1VBRCihK0Md1BM38lYwoBE1aRVNfduuGQqNtJX85i582EE2YRU7RdjezUxmkavOHHDKITQ3WRIduupYvco30pmuovixmehC1/6owDD0/ZMvKw8jC7JNjTJldjoPBTPkGpj/SLx1/NISiCgmWHRjX8JumaNjgRuCvFXDAPMXQgb2Ug7ZUF3YsywDUGQo1Sg57IMBYdyRpMIHIXup894FXbwS1OuyfzQxJ2kxbg+8iRu1/W8HBlmuYHJzPpZlt4D7QZ1PPjX91aXXMpEJGOtsBeiJNNOb8b7ck6Tx6YSmWYGpFCS/ehIktgeI76xfOiqAADRgqBTBmLaB0z1A+Y5+sIMRO79JO95/FBsZr4sog2MZVZmgJaSQ39vfnx4GcqRNKyBfQFtLh2BLe+cYlNfXTSCAIl9o5t/m+DZMYVegUZaHQ0j52LULQeCaf9z9RnrND/aFutY4xHkE1OlfWTTuCnBaxM8Sm0K7qIDMOeEe1KAZ1P4FVY582wMNrDKCgJhZva3opSvw1pcBjQEa8vg5B0n2qJarCplPCyk+RK0FyC8c5K0MuuI/+bzxQ+BB7YsvGAD9dj9kg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R01sR0NsRlh3Q3ZVWDIzTnoyc1BoeHFZV1o2K3VXNHphdWxUOXY5bWVZdHhH?=
 =?utf-8?B?ZHQ1OGFFRlowdVdWS3k0eUZBVDUwVUZxeG5sajlaeUYyNGhGcHhML3lzMnlr?=
 =?utf-8?B?L2ljTW5aTnBiSGpNaDVZcS9hcmVmZ0l5WGZ1U0tFcnRUR2pTY1QyRjF0dmpZ?=
 =?utf-8?B?YVBqbTl6RHZjUitCVEIzZERmNThTTEZORldKSnR6N3l2c0RBbXNaaUpuS3JT?=
 =?utf-8?B?UVNHdzY5UGJyM0NGdCtHNzZFaGViaGxkYloxc1k3R2l5czRINDlPZ0x0ZkNF?=
 =?utf-8?B?Z3JTN3dHcytWaFp2dUJLREhlWHpYSVFDQWNXa3F6M2l6N2dFOU0rMVJaYlc3?=
 =?utf-8?B?ZnFSSDdjQVkrMjVNeXZ2dXNTNHp3Rlp5SGRPMDZ2UFZkNElKUWNlcVkxMmJw?=
 =?utf-8?B?UE1oYzc2STMveEUrRWYveHpxcUNBbWp1Y3NpOXI0VS9TRldnb0p4dStRR014?=
 =?utf-8?B?M3NGeXNtOW9IYmtpM0hoeXpOUVR1azYwZ0ZhZW1TNGJkUm90ajRHd3R4YkV0?=
 =?utf-8?B?aVk4czNYeTNITktpOFhESjExKzlzMy9relJyYVBSWWFKYWtubi9LcWtDTlQv?=
 =?utf-8?B?T0JYaUNWejZYVG9Ja00zdDlDSVdlODFsVHl6TmVSbkgzV1phVXQ5dVlmMnVM?=
 =?utf-8?B?TzlUYlNQSVJlQ1huTUZoc2d3emRsUFBqaTBFMW0xdnhmUkg2QTE2Z0pxbHFq?=
 =?utf-8?B?RkJaaUtiYXdOYVVEVmdvaFliTkxac2svK004VmNqNTBvYWxoTzIrT3g3b2g3?=
 =?utf-8?B?MytIQ3Iwb3lhU0dzUUJIQlhBRlFZdmdIRTRPWlJqSGFneHF5WHVNZFhrL1N4?=
 =?utf-8?B?K1FIQTlRSEE2dXYvaWJCMTVWd3VlZE5WUzJQSEorSVh5cjdFYXJuVjJPMEx3?=
 =?utf-8?B?QW16R3VCY0hsc2dXUGxvbFBHSUxNZUgvVUZIQ3ZaQUxhTng2bjNwSlE5aGhh?=
 =?utf-8?B?V0tmVzE4cGNCK2k1b1p2Mll2OU82WEx5RG9meGFSTldHZlR4amVCSWVNWFFs?=
 =?utf-8?B?NkNJdGRwNDJ1d3RhOE5UZHJJREFWRkhUVStFOEx1MVdxSGM1cUhwTVVSYTV2?=
 =?utf-8?B?VXRzWThqM293TWJUMjJtL2ZhM08zRTdMdEQ4OUM1OFhBT1MxUGZrUmp0TEpI?=
 =?utf-8?B?cTVWN0dYMVk4eWdXb1YwekF3VW51d1pTbUJFeHNoeDc1SCsySjJYNXpKRTBY?=
 =?utf-8?B?MVd0WHZTM05DL1lQYzVOS3dBSi9rOEwrWFYyRWJTV3ZYcUV6NHZHWWFERk96?=
 =?utf-8?B?SER6TFlNWDhxaXFyekpwdTZ3YUYvWnU2UVVyMUxtcGJsakw2bjNuSjRvMzhi?=
 =?utf-8?B?ZmFDWXBodnBQTHVvaG15bVpvNFhFeHRyUTVPQTlQeHZJS3VtYzdqaEpaTkRC?=
 =?utf-8?B?Y1RObVlZN0FnSlYyM0Zyc0ZET3dCR2ZKODNhZGZMUElRcHBhV0c3ZW5ERStz?=
 =?utf-8?B?OTloeVJhTlNpZVVLbE56SC8vL0J2emJrVkp0MG9mdkhKcWtJTXo2emFvVTFY?=
 =?utf-8?B?Zm5oS2hSTnJwV1VBcTRJTnJ0OU5TRFVWU3p2S2FHWWNkeSs3eVd0WmJBbzl3?=
 =?utf-8?B?ZWdpSVg3TXhJREZCalF6V05EN0VKdFQwMFBmcDJuL3ZqMzRlc1BuTkVQa2dp?=
 =?utf-8?B?WCs2OTZaSnd6Q0lrZno1STd2SUJlWjlQVjdsOFdWdWczNmhsNkIxV2p6M2ZO?=
 =?utf-8?B?NTJPTVIrRHlRYS9hMStKZkNQSUc0b0lvMnlLTm9vSWpqQVNNelVOWkk5cDZl?=
 =?utf-8?B?ZmFEeW9pWS9USHlQTm5CeUY0aUN1RER4YXZwQ09zL0tLN3JOMVZYcS9Yd3JE?=
 =?utf-8?B?WXUyT0dsTjhiQXRrTW42VGJvNGtGd0Jzb1pUUnd2OE1Kclp6SjlBdFZIWXpz?=
 =?utf-8?B?NXJqZXcvSXZDLzlESjBCcWQ2T0tVZmpmL2k0UDhGMHI1NjdzVHlYQVRQRlQ4?=
 =?utf-8?B?djlmRzdmd2VhcThKdStLdFF1aVMyOGo5Rlhna2dEMDN3TlRSNGlwTEdVN3ls?=
 =?utf-8?B?UlRNWVJnNmd3dG45eFY0NXFzMTF3NjJJcnoxVzZBaTU0VjJuWXkrTCtXRzlr?=
 =?utf-8?B?N1hhTE9Ua081Tm01UWtiVTFaVXEwQWJzTGgvYTNCeEszeGVpblNqVm5qWExE?=
 =?utf-8?B?ODdoWmdXMEtTZHg3RW9lVWF4WnNkMnBkVmhiZkxGSXVFTENvem9PcThuTGJo?=
 =?utf-8?B?QmVySXNadVNDVXk1NUpubHFkSWRuK0dKVDhNSFl4VG1wZHpkWWE0RGkxV0ln?=
 =?utf-8?B?bXhucXVibGdIdWt4R3RKcHBXZlY3emdTaG5lK1BxS01VaHBDK3ZPY1EyVVJQ?=
 =?utf-8?B?UVhtZ3pwaUswakk4RzFNK1dxQTZzTzJNem1rbVFndGNzeUpaenhwOVNpNi8z?=
 =?utf-8?Q?5j/FrPxdMNqbrNlUWj2aFd3C1as2Ue1jTI707QLMiGPMV?=
X-MS-Exchange-AntiSpam-MessageData-1: wKwNYsq1pXX49A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 717eced6-a8ba-4536-ed18-08df19152366
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 01:51:09.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJaIXcHp78ubghxQcpWan1Iw1wpcUS+MWWcoIvO3ZHi+EcvzauaPm6dy32RosGU0jEkBDGj06Y7ew6i8PmoC2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9199

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
<...>
> +    /// Creates the request for `dev`.
> +    ///
> +    /// The registry keys are [`REGISTRY_ENTRIES`], plus `RMSetSriovMode=
` when `vgpu_state` reports
> +    /// that vGPU is enabled.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ENOMEM` if the registry list cannot be allocated.
> +    pub(crate) fn new(
> +        dev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        vgpu_state: VgpuState,
> +    ) -> Result<Self> {
> +        let mut regkeys =3D KVVec::new();
> +        for &(name, value) in REGISTRY_ENTRIES {
> +            regkeys.push(RegKey::new(name, value), GFP_KERNEL)?;
> +        }
> +        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
> +            regkeys.push(RegKey::new(b"RMSetSriovMode\0", 1), GFP_KERNEL=
)?;
> +        }
> +
> +        let mirror =3D chipset.pci_config_mirror_range();
> +        // `PCI_DEVID` packs the bus, device and function as the low hal=
f of a `Dbdf` does.
> +        let dev_id =3D Dbdf::from(u32::from(dev.dev_id()));

This makes the build break: `Dbdf` is not created by this series or any
of its listed dependencies, and comes from Zhi's series [1],  which
supposedly depends from this one - so we have a dependency cycle that
needs to be broken somehow.

[1] https://lore.kernel.org/all/20260914074907.1399629-21-zhiw@nvidia.com/

