Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012038.outbound.protection.outlook.com [40.107.200.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442D4C8FFE
	for <nova-gpu@lists.linux.dev>; Mon, 28 Sep 2026 14:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604184; cv=fail; b=VHctgSG3DZCZy8JExgxEvF8KpDh2gBBI/k86JKeR+8iTASAroVHdvHvgUoycaakwyTaa+/hAMYl1lbBmDT8yvDRLLWINKIwHEpqGzfB3c8qp99hcy5famyZrZci5MHjUZriFTOx/p6sM1XB9nXFhGOw2JpNhjQv1a51YtXy6eWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604184; c=relaxed/simple;
	bh=gHaQGZA2C+n6S8xi1e5sLrzaLKinhBnDi8cw0oFbS0g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=tyylOjSjdSAItMllVvwT/8oDAujvgjpIdNsXZnDE3A74YRMGG3LtCyGivOnDvgQOCjFIksXFoOZFKy8G/L8NekhV2AosKSoecs6WG3N/G4gYeqTjZcgQbINSN8jQwm9WkpYxtj1wmjioI74NcFj0x7prN0f2AKxlT72VDxxj2z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XN1CuJvV; arc=fail smtp.client-ip=40.107.200.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XN1CuJvV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pqmf0H4xQiW3lNdF/3elwem37su89hxyqTTTZJLWqFIiVxgVHT9HonJw8pSIDtyaGKJcTm+5reeZPFGx5D1suDaHpkSQBIHST9otH5RX6hb5ZyjQlDbaXlGmrHZ5AVBZbdU5/9UF/EQ0FkXFhkpxbk31XM7Nr5lBCDIIeZOPTaoap5/6a7fU40Cq40idZ4r/NxbGEgWFzM8h3b64+HR8b6VauzxluV18bHXsVGOPA5lagbfiZsr49LJiQc3lNSDCiGNOkksSSK4iSKRU9JoKHUKDpAl0tGkMqsszTRfyyjqdo70Ya5fWOaRlnw1+GaLSE0JRI5CCnhymgDmoyuQdzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++igKyHBOzN+ldXyOFzcQB6Ed/laEuFez/iEkOtw8UI=;
 b=yCNgPU9NlRQDA0pQVWrHIw5zLKLEf/96CCS7C+SQ0WA1PgkucXdWOUqt66JAs357+fkZFQh4bQlNkSamiwFEFLPR8WSOyl9GemXm3P/xCBIubvIDUDD63pXz0QdHCKPudj1pWw2z1RZ24BLFBMI3iS5PIUP+B6+6nZYXIIaSI0oxSrjEh7aopNmFp6+TvVjnL1Is1sGuBivG25bb0VXmCrFdENhw9sGmo9jZQTznRq0ELupwcCGkvsCAWjJw5jHUsRkTeU9GOgf+91I3xDDqz7mPJS8Tv92JxskYmkBKl+fZWDO/yQnQe1JO7I9ukmwLDDX7YOTmj9VY/Q2LzruvWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++igKyHBOzN+ldXyOFzcQB6Ed/laEuFez/iEkOtw8UI=;
 b=XN1CuJvVoQ+t5TAeIqKGIi469udcg4SkCMX8xm5nSSwZ5udNi3HOyNZ3j5iJxH12g4i1nqWJwWBmcV7Hd2JXneCQpwu1QUTLIGJhkJpQSNQgutFEfrJqLyawGNTrMrtRA13Fi/tG9aIUXri/hQC26XHzEwVTTNAJonrINA1LFpzKcjvEs3xyovio8eRiseCSU6R3+3CnyiaPypE3rsl1l90FrHIYIWvH48C9BjDqXEuGW5Nf7uMYvqs71zzuexME4WP4fTeOu9Li6XtISq/0oUKcsBzKd22xEq2pxdc77qMGc4KXK6kLMIuvfWzNiqqe2JLdTiu2+Lq9IGMjByc9Sw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DM4PR12MB8497.namprd12.prod.outlook.com (2603:10b6:8:180::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 14:02:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:02:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Sep 2026 23:02:42 +0900
Message-Id: <DLR0783CVY0P.LBNMK1IAN3F@nvidia.com>
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
Subject: Re: [PATCH v3 14/33] gpu: nova-core: add the falcon DMA and suspend
 helpers for r000 boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-15-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-15-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTP286CA0064.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:226::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DM4PR12MB8497:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c66c282-308d-4903-06d8-08df1d692bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|10070799003|4143699003|11063799006|10067099003|5023799004|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	BbnHdCoN84SJ9RKaL14TyYXxrai01Knnq3qjod7Mj9VjsJJSStL5jKqEtlxA5aMmCqRqRoj1vhTWiBu/aIl8uHKvnK6G2AtpBLj82Rj1r6OmQqWOfYY/AuOwhALox+57RMSFN/VA0txPgQ/Pl+7v2tkKfc446h5zj9h560al4kIOPJQZ806Etcu2f86otVUO1pOSeXiERxCPazzFVhOcXqXmcei4wjfJPPXAL62Kk51Oy6oFDAqjflrG96JNC8s2BfGsjLvHjwqHfsZ0zqAMcMOJmm3rxPNWGqbqB/mGLnWCYbppTNkVFUB8GZGdG41/7NcyKacpmBMEYn84OcpVE8eQr40Gr9G8KjsjyErD3EJaweZau5zOW9iwQsR5fKAxeN3ypcNT39a03tmIR8oeoukaTABxQwz+w/Ii61WIXbA8LNK2wOgxGpYNbsw6U5i3kC2XvR3z4S7/So58IaoHQYvh5N2vLYx6sf0cRL0sHLCNxfwingcO03A0eQritDm/SNFf55oTeNK42umQIff0LXybNT7BtJ4ocQJ2M/tqvYhiD3uSXLtSxhPQK1D5G7lovtpBS+SB+r1OblbT9FIjPPb14oPgFvmWuwQuwHi0N/9p0Vy/NERItCJ9d9HbK3NWTv3JjBknfp4ZQpduq7ohaqhyfcebTZGBFZUfC1jg7Qs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(10070799003)(4143699003)(11063799006)(10067099003)(5023799004)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUNSS0dONVNIMzB3MmE4UHcwSGhRcHdNenlmbFFxNFlaRXJnSFhOSjl3cCt0?=
 =?utf-8?B?ME5UWlBqMTRMR2pLV3RaNC9kOWR1Mjg3QTR5V01VWEFuTGltWDRyZWE2M1Aw?=
 =?utf-8?B?V3krNVBicjJ5Wm85eXAzU2dGTGV6Z1lXL3laRzNIOWc5T2FqWWs2VnhTVGlr?=
 =?utf-8?B?UDQ4aEJXdU40ZTVrdk8rL1pRaXFtakJZQnZydWZnTEpNSGc0WHRiUUlGSE5F?=
 =?utf-8?B?UGloS0Naa3dLUmFucnJQK3JKMGRGQVFuVmhjd250UjJoNlluTW5mYTRkNkM2?=
 =?utf-8?B?R1pKMEFyYnVTcHp0NFpKMlZYWHpqU0Y0WnMwUjJMSzVjZUZ6OUpkU1crbE9h?=
 =?utf-8?B?ZXdOWFhBM3dzYWN5a3B3WmlFYkk2aUNsLzZ6L283RU5SWDdtUWZ1dURQVGJu?=
 =?utf-8?B?VVJQcjBpQmhNUE1WQXU1ZjlDb29DVWNnenhmZjdCYWpaL25mMVFRaXIrKzBO?=
 =?utf-8?B?cHR3Rm1GY28vKzJXWFBRd01OZzZkalZiS2FCTTdsZWpSOEU3QnlzakJGaG5r?=
 =?utf-8?B?QkVXODVteFhJc1lIYnBUOHg0OVdxWlNFblVDU3V1ZUFiWDltWmt2UzlKcC9N?=
 =?utf-8?B?TUNjMldRQ2VYZklyMzRtSTEwSURSaDg5VWgyaUpGTDFiNDdnbFVxdUVIRlhp?=
 =?utf-8?B?Wm4xREJhTm9iQ1AyWTRXd2NnQ2FhdlB3N1B0MTJldVVLTm5xVjZyV0NqQlU5?=
 =?utf-8?B?SWdXM3ZRRXpkeUlmSXdWbUgrbE5TK0F3QUI4REtOYUlQcU5vZDd4OGhNbSs3?=
 =?utf-8?B?SGhTL1RyTDhKRWJ5YWhaSEtkbFEwdi9Fd011eTNuWkM0bEYrNjJtSU5mRTh0?=
 =?utf-8?B?RUNJVWtOb0tFcFRXVDF2Y3N6U2xta2piWVczbUlXQ1VGOS9aYm1Gd1ZtdFhC?=
 =?utf-8?B?L2NFekRvQi8xUDNjTFUzSjQzTFN3QnFYZlA5Tlk3amRqYVZIRzVaTEFHc0p1?=
 =?utf-8?B?akQzR0F0M3JPVkl3YmdQRkhmNC85dCtKTm1pZzM0WG5kT1BzSVdwYVNhcXZl?=
 =?utf-8?B?NXJBb1phS3ZqUzFmVDNPZ2IrdHQ4NUxnZmlvZU5iTTB3TWxUaTZIbDg4cDg5?=
 =?utf-8?B?TWtVbkxpM3Q4YkJQbkZFUGt2NWlpNU1WT0M4NU1JbkdUeGZrNGx5dGxqL0NS?=
 =?utf-8?B?K1JTaU00ZDJMUnlPbGw4RW43d2tLcTFIT3UzZHN4UC81bnZVVEtqdExWRFFH?=
 =?utf-8?B?NEduTkk4WkxsNk1SUUFDSHJqazNWMTZHRmdzUU5saCtBbE1YY0QwNy9mL1FV?=
 =?utf-8?B?MWZGb0VIQjQ5RTRFZGZxczVPdXVEZ3JWRUoxVFFMWXhxMmNzcnhBOWY3WnZm?=
 =?utf-8?B?aUlxUld2K0F6c01VMDZJZWEzS1hJdjNHOUlUY01pWEJhNmJEOHlCUEVxTFZO?=
 =?utf-8?B?bnZXZm1EYVZDTElZNitHSTA5RVJVcHFDUGN2ZWREVVkwa29DdDZTVGZjYzBB?=
 =?utf-8?B?dGVXSVpiRy8yQ3k3dmdTU2dlSTVJeC8xM0tMTlNIVVUwdzE1ZTZaUEc0Y2hx?=
 =?utf-8?B?Y2w3QjY1VElIemJZcXJuTEZkcUVyOExmbEMrdGN5RVhEeVhOTGNjWTNaMW9a?=
 =?utf-8?B?T0FzQjZpVng1elBEN01jMW45aHBObkhsMFRkdG9PbVFhWlVxS0ZCS1BmeUVr?=
 =?utf-8?B?VVRtazltMmkvQmxudnVCZUNqYk4ycmkvWVJ0SlcrN21VNFI5cVJkSGdNT1lP?=
 =?utf-8?B?V2l2OFpMR09lV2JkbkYrZHJQM01wYjJhMTFFR2dwVTA5a00zcytLM2VVWDh5?=
 =?utf-8?B?WEpVUjVRUEtGK2xVbDN6ZXVUTG5lYkFWc0RtZVJPSU01bytheEh0NG1idFg0?=
 =?utf-8?B?aS91MXVJMXord0lyUWx6SXcrY0VKcytmNDY1eVIrTmFzZjRUaCtDVm9sYkV4?=
 =?utf-8?B?cU96aE8yNmRHUTl0UnQzWXYxekk5RStTMmthOS9BLzNpbmdvMXdHajFJR1Ny?=
 =?utf-8?B?ZksrTFZNczQ5Skw5aDhSaVB4MEIrK21ad0xZeE1hRDh2a1pJOFpncDdEMEN4?=
 =?utf-8?B?WTFYMmhmaHRHbU1nb1I3SUJiRHdWbEFvU0Jpd1o2NnlqWDVNdE5HcVh6Z3ZF?=
 =?utf-8?B?WW1iZTZ0RlpSZzdZd2xsWEtPVExQZnJ3c0lVYzBzZ3NwdXdkZ3F0d0oxYU9y?=
 =?utf-8?B?R1dvd2pSeFVGR20weHRqU2tRdU9vWDVSSkFDeUhDRVU4UlR0bHV4Q3R1Tzh2?=
 =?utf-8?B?MWJQdE9aRFFKWHlPNEVjdjRpTFRINUdYNzBXR3VQSVdlUFVmTW1lbHlreUJu?=
 =?utf-8?B?ME9KbERIcHJzSGZDK3JLcFVxZjBCSWJFRXg5OWVqUUEwTjJRQUdmUGd3TlFG?=
 =?utf-8?B?aHprcVlZUDEzMTRsWGdzQVNqa2NnVXMwdkpsNVV0MmRzTjdiUnJwU2RmdHZk?=
 =?utf-8?Q?bwfAKMP5t6u0KSTKVFWyAB+RspS/aGGMGCS5ZJIEJt2os?=
X-MS-Exchange-AntiSpam-MessageData-1: dcVErJiYI8CRSA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c66c282-308d-4903-06d8-08df1d692bd4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 14:02:45.5870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+HfjWR66Ab1deaQvrEXoZxBmnA2xfEoBrlvu1w9WyGPRYVrPGfYrAtQlz0D7F4kckLyRmDpAh1WmII7Dsxs9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8497

On Fri Sep 18, 2026 at 10:07 AM JST, John Hubbard wrote:
<...>
> +    /// Transfers `len` bytes from `src_addr` into this falcon's `target=
_mem`.
> +    ///
> +    /// `src_addr` is a GPU physical address reached through the FBIF ap=
erture, so the caller must
> +    /// program `NV_PFALCON_FBIF_TRANSCFG` for `ctx_dma` before calling =
this.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EINVAL` if `ctx_dma` is not a context DMA slot that the falco=
n has, or if `src_addr` is
> +    ///   not 256-byte aligned.
> +    /// - `ERANGE` if `src_addr` does not fit the `DMATRFBASE` register =
pair.
> +    /// - `EOVERFLOW` if a per-block source or destination offset exceed=
s `u32`.
> +    #[expect(dead_code)]
> +    pub(crate) fn raw_dma_transfer(
> +        &self,
> +        ctx_dma: u32,
> +        src_addr: u64,
> +        target_mem: FalconMem,
> +        src: FalconDmaSrcOffset,
> +        dst_offset: u32,
> +        len: u32,
> +    ) -> Result {

So this method is an almost identical rewrite of `dma_wr`, except it
works from the FB instead of sysmem. That's no justification for a new
method, and `dma_wr` can be made capable of working with FB: change the
`dma_obj` parameter to an enum type describing whether the source is FB
or sysmem, with the relevant parameters for each variant as one commit,
and bring the local improvements of your version (like the use of
`checked_add` and support for DMA contexts) as separate commits.

<...>
> +    /// Returns `true` if the RISC-V core has suspended.
> +    pub(crate) fn is_processor_suspended(&self) -> bool {
> +        const INTERRUPT_PROCESSOR_SUSPENDED: u32 =3D bits::bit_u32(31);
> +
> +        self.read_mailbox0() & INTERRUPT_PROCESSOR_SUSPENDED !=3D 0
> +    }
> +
> +    /// Waits until the RISC-V core has suspended.
> +    ///
> +    /// The caller must write `MAILBOX0` before starting the core, or th=
is returns as soon as it
> +    /// reads the previous suspend.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if the core has not suspended within two seconds.
> +    #[expect(dead_code)]
> +    pub(crate) fn wait_for_processor_suspend(&self) -> Result {
> +        read_poll_timeout(
> +            || Ok(self.is_processor_suspended()),
> +            |suspended| *suspended,
> +            Delta::ZERO,
> +            Delta::from_secs(2),
> +        )
> +        .map(|_| ())
> +    }

These two methods look firmware specific, and are only used in
`boot.rs`, so I'd consider moving them there to not add ad-hoc code to
this file that applies to all falcons.

> +
>      /// Start the falcon CPU.
>      pub(crate) fn start(&self) -> Result<()> {
>          match self.pfalcon.read(regs::NV_PFALCON_FALCON_CPUCTL).alias_en=
() {
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 4fb1b69ac9d5..8518248c9732 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -2,7 +2,6 @@
>  // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
>  use kernel::{
> -    bits,
>      io::poll::read_poll_timeout,
>      prelude::*,
>      time::Delta,
> @@ -94,10 +93,9 @@ fn shutdown_gsp(
>          cmdq.send_command(commands::UnloadingGuestDriver::new(mode))?;
> =20
>          // Wait until GSP signals it is suspended.
> -        const LIBOS_INTERRUPT_PROCESSOR_SUSPENDED: u32 =3D bits::bit_u32=
(31);
>          read_poll_timeout(
> -            || Ok(gsp_falcon.read_mailbox0()),
> -            |&mb0| mb0 & LIBOS_INTERRUPT_PROCESSOR_SUSPENDED !=3D 0,
> +            || Ok(gsp_falcon.is_processor_suspended()),
> +            |suspended| *suspended,

Yup, that bit seems to confirm the comment above. :)
