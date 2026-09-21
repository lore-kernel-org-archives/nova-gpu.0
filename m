Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012036.outbound.protection.outlook.com [40.107.200.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA9A3612EE
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972526; cv=fail; b=Td2Mz8ljk4fOPaY7OX4pZgzn5oXcTCOWo/pmZgNq0OHOZHBn2mp9eSHaSkLyWn7pXII5M4LHJRcpFzmHIjXY16ShTEScLS6W1hw2DuHJddGfkMH73kHfdT3VfNj1K/cKe296iS6JH3SxHS6cgwj6tSnr8zjhGCRITqANWiRp83U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972526; c=relaxed/simple;
	bh=Hw+T9xMa3tHgDuyz97mFW77YsDg3sjs0YJWXBs8h2GI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=PiLBZL/pxOoy334oYPUZZqCVbGEIohQfq5y4TpyBTQEfyuzGQWuEs8GZkVHji5C1aHE8cP2rhWn744q7X5bLGBlGSUbI0Dk0NwPS9344Mn/TjwqRIQSED2g/hinJck8t9ewHaS7ygovl033zIKJxtW6kHTUH0exbVKipJzGaOtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tPTQgzLc; arc=fail smtp.client-ip=40.107.200.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tPTQgzLc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/6AqeBQVQC8bBIi9NZ7by54sYbQkKhviD+JL/VImgVR6yFXixZ678ApNm/mKiE93wrVbb2CghqlhNeDx9rQQtlCrZlLQX4bBSo1ykPpKp2nRQ8KudtzygzRt7OWIrfh84weLTzIgaMyb63xuWp4+4wn60gq82tuNkJkSVu1UaQiEhfFAhc8fbqo+/PqDkNR5FqONbAflBXeHmCmNmlBS3PgtS8s01xjOnCxFVOxQUefZZgjmCf5Fzp+9P79miExTeyAMR1Qreqh/6XkpDc/fgg3vqxu35Ad4TWAU0sistuTk1nzIKvz+fB47/ZylrV5u9bTjpoRO1iQva6pR70cYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydEhaDXj+J8SB7dGeR0loYyXO2n0fUg8sIf/GV+dKIQ=;
 b=H7ouysm4z/GhPObyozQ7fPm38au9FNLCUJpQobZTqynrwP7961LxxY98U6bgxsek9Xtm4J+WlQae560Cf7VcZ9vnOVYOvou8TX3iYuF6AlhVs1YEiFml5zvCVpoYb2v6/GgfjOKcuuWeweYAKVyMo7CVSU826UcVONI1BB5YG3+ESAlVMM8wDuZDqJ8QG1b5Nu+rtPDVfK4cotK1H1aJ3YHGBVQ3/Wm49sj9wLamwQGfJgTmvBk9QedwCii4edGFOOIheHXzkM2/Oi51P2YDuANtjGMznqYYpuB2+SDd+7aMt8ZVnkxFETANxeOIrgTLMzDSOlkvAjIZ/YAp2zDpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydEhaDXj+J8SB7dGeR0loYyXO2n0fUg8sIf/GV+dKIQ=;
 b=tPTQgzLceZ2Pkq0QiQOjxEkW8jzU+UzjUnJYavELDqtcZnLd4V4swaemMgxXaP+aPoDmZrmpe/6AwkJzH1RA2yb+UIwyj5ELVdOh4Xj1OQ6BqzWga0IW3ESGGmnqhoUU0562oLWxryY7jaA4URXgDB6RB4VxoTsmVos4pYC63j7+LWf9bmnN4GNLbtZ/6t0Mi+6Y5xDvmZNDX6/BQAyV+4nlQ4+z9ym8TyxUzkUWc1TRZor73Es2Uet/kt18N9i8SYhUMVEwcmdZ9Z5k1kfO6Tb7QBg34eweukCkFT0AJbevaclz2hXTE6qbFMfa2dRLfP27LxCPqkBhKOaixlwmlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:21 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:21 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:35:17 +0900
Message-Id: <DLKSAUKJVCZ7.D3HKSTNEAEUM@nvidia.com>
Subject: Re: [PATCH v4 06/17] gpu: nova-core: add the GIN interrupt tree and
 allocate its vectors
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
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-7-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-7-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:226::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc86b39-d08f-4d03-971d-08df17aa82b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|6133799003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	K/Jmx08mT91KNxBodVtI5iJj26zEhwB9Hpm1RMNOxwihg21duFD+9uPtEZ/mF26cyLXy+pANSgEQapVZN57SdZ4YJKNT8WK35fRym7KEvp5ptg5LMt4gLkqzQZLZqeyjxl33JSpGQCjrpm1pc427CzWRF7jskfySTh9SO+IfuNvl0CSljdNYvdrvuiY31Q1rwM1VLibxIXdJie21cVKBva4KktPcfDlOqrfpI1eldFPqfk4VMSd9l+FADecVjMng/RLRFLQPPkLjqctTlJ/AlGukmrKVgavSDyBuurUQYy1lEOqzg7RC50lZ+mBmrnIJx7JpnlMeTTeisjJs+Znuntv8ZEaFoWEQYtMCY5TaJO1IJ6r5ueTUhDKFDApOo+R36U8o2zyO6JM6nrL85xAyMJMniPH2qq92HhNvKVyvtF9fReYBeaOQ3Oe2CncDo2GYKk3mc3GjSlULkFHzcl7mpNkz3DyhZ1vR0CNe2MXZNaQAm5Vx+5StYVUzlITkyIbYmh6cyX/qIyyeooh8HZ0glb/IqkwhpUkz/UeX5FMhpd/hHrYB2ho/mkzE8Wh3Bi5ma5whJTO1Tm1LAmsd+k2p7iyMLq3MCFM+8n7RFzYAxyh+aYluR3UjV4npPyFt/qkDEjNnPrfG97Lti8/zL3BDKobPK74sEFztjsmB2Wm+0Gg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW5KT1YrRlhTRER5WTVIWTFJaDNVdkFFeHcyZUp2c3BrM0VlWjhlVnBkR0Vj?=
 =?utf-8?B?MDc1Z0loRU0yb2lnYVVxL3lDZElwS3J4UzVPZnNaTjR2WHpKTnU5aUJ6NDhE?=
 =?utf-8?B?RFJFUElEcW82QVEwd20rUFdNSXVKZi9mRFR2eWFEampxY3ZOZnV3cm8vTDhT?=
 =?utf-8?B?QkhPU1VzeTdBbEtqc0JuTEV2VU1wVGdKYUlCa1kyQjNXQmtkaG9iY1c4WkEv?=
 =?utf-8?B?SVNHL0VURlJOc3ppS2ZGZFFlbmdaaG0vWVdzK005Q096VU1YY2lZYmhhRnhj?=
 =?utf-8?B?UDczemJFSmFCbEN2eU1MOVB2Z2RnWW84U2NGZGxkVVk3ZjlOY2cvVzZiZStj?=
 =?utf-8?B?OWJMRWhTeURxNU4reDd3MmVHVjNqRnlMV1BDTDAyZWlBM3llamVaMDZwS00y?=
 =?utf-8?B?Mk5YSDZQYWg4WWxpU0lMWUZOUlVVdzY3YlFBV0wxMmhYb0htMlFub0dNcjRN?=
 =?utf-8?B?NXd6WWFuY21xZDRoRGt6WDZDZkpOem1jV0hZTnFLM3lpZHNLUEZQOTNUUDZM?=
 =?utf-8?B?WVhIcHkxZmJTUnd2aGh1K0VacGNEQzczK0JBL0JZREdSTGtjeFcxeHdTU0kv?=
 =?utf-8?B?N3FFb1hhTUtRMzdJeUFiSUp1VEdUQVlaUzRLdHF0NGRKS1hmNTM4WDNpR21Z?=
 =?utf-8?B?bCtoUVBOakkvSldTV1kzSXlTOEhVSjJGUDdDWU9qQitKbnhnSWFCWE16WFF4?=
 =?utf-8?B?TS9HeUxaVC9BNUFHTy9DK2JsY2p2bzdkUGZydGVjNkllVlkzc2FYWnc3bFJ2?=
 =?utf-8?B?bmN4YnZFUWtsZllteGgrZ0o1aU9XTDF0RG40M0dOdUhyQXNxci9ja1NiQVha?=
 =?utf-8?B?S1ZRZHZQR1NLQ3NkNkxqUSt4OHB0cmE3bi9NY21JRVdTa04xZ2VLVStKK1l2?=
 =?utf-8?B?cVdmNTUyRC8yek41aG5RcVRNTlE0MC9SZDhod0hMaHFYdjFsd3hxZmtFSlF4?=
 =?utf-8?B?Y0RtMU9jdE9pajlxMzVTdDhrWVFzaGFPdzFXb3VDelJNRklWVnBISi85emRO?=
 =?utf-8?B?OUg4MjJJdVFWblRHRW5JaDdoMGpmbStpbmpjeWw5b0lKTjFuNUl2ZXgwRjNa?=
 =?utf-8?B?Q3B5dnprZ1MreThqa3ZzdmRyTnU2dWlUYnRvOWJBeGNUcTlzQngvUk9RTWZH?=
 =?utf-8?B?TWNDQVM4YjhacTBOZnBVVVBWbXU0dkRhMCthWWw3aWxXY3FjRFlGcnVIaE1y?=
 =?utf-8?B?YjJsVUdLaVBBbzQ0dWRDVFRUbUFNWkk2SjRlZjloSjAxR1RDZTlFUVVLaThG?=
 =?utf-8?B?YWxpWUFIaXEzY1Jlc1dSMEVPa0F3MG5iRFRQWk1ST25aL095d1BZU0pvYnZ1?=
 =?utf-8?B?aDREa2pKZytCcDM4eU83UnM1SEFuSUpxamhYcTlVZnpRMURVbXFvQ2E2QU1W?=
 =?utf-8?B?R3dDYVF2eVNZcGVTenV1UnpIL1V6eXpCeVZWUEFLNHgyUWh1ZHc4QlBYWEU5?=
 =?utf-8?B?eGtOR3N2aTRUU09lUHVoblFsamU1R0xNOHBQT3Jlanh6R2xYTlphWDdXV1VI?=
 =?utf-8?B?bGZpaFhPNGo5bnZ2U0plUFhDQ2d4aUFKbUx3ck85SWlSbzcyMndadkRSL1Vi?=
 =?utf-8?B?MFpTNzBScml6OWhGZTRMM0JoakZIS2JnWTVnMlRDMVJhY3EzWFpGeDFpMHN0?=
 =?utf-8?B?eUhPWVhYcWhKY2hkV1ZZOTdKbnVmeEE3NmJ0T1VFaU1jWDJ3WTJzZjhDZDBv?=
 =?utf-8?B?QVBwRnJRUytSNXZjNWx6MUhVdkxTeUZ6c3pwZmI5d2RuQ1VqTXREY2RmcTRD?=
 =?utf-8?B?YWhzVEtOQzhYb1ZnZ0dBSndIQVJoeFlCVjlPNm1ybzJEZnpEdkI3ZEF6bXBB?=
 =?utf-8?B?TUpRUUtwbmVLL2NJNWQ1U0dUQ0pzczNKSUJnTkx2NUc5TnF4TlBSMnhLbzll?=
 =?utf-8?B?SkVFMjhPUnJiRXRvVWVnUXRZNi9ScXE4OFVXMUVmakFkTVNXZm5sS05KZmV2?=
 =?utf-8?B?RGs5bU1EMk8yN2t5c2t6UDFqU0l4dEdkd2U0K3hyZGRNUk9BYTFyVDg1WG9s?=
 =?utf-8?B?Nk1iQ3FMNEhJaUNyKytWK3AzRktzQ1R3eklyUDVIMTJOTng3Z1FDQlNDN3V2?=
 =?utf-8?B?dHkyRzRoWm84K2xxTlh5TWdlQlNKdDBtREZnQUxVTGJhcHUra0E2b2NtZVkx?=
 =?utf-8?B?RUJjTVB3eFU3QncwdUN5N2toWWdHVm83WmhBZkU2SGJYcFVxZXplaHVNeDZ4?=
 =?utf-8?B?QTJESm10YmcyZXBHR2hhZG9LYXpEb1dVZXFYZWo0S0NFNmZCYlkxUjdmbUoz?=
 =?utf-8?B?S1J2MEFiWVJUWFhKK05zT0Rzb1Irc3ViSGRZbnJoaEFxZ0NBZkNNTnZsbThE?=
 =?utf-8?B?aWJWYllLSENvUW1uUnl5dVVlWjNQRHlNNitiQmNQSWVKdDhaQ3M3YnZxQzQ1?=
 =?utf-8?Q?8KXan1a+smFGI6+kZqWZB5+TX6BorlI8tYsmDQDmn1Rz1?=
X-MS-Exchange-AntiSpam-MessageData-1: qvjqtHzxx/H60A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc86b39-d08f-4d03-971d-08df17aa82b1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:21.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wC6JXjM1jvaMnTyVpOL7ap6/oqzra+m904Q/obDp2HsOIC9QGkE+IbAbvrwpj1wpgg3v9rygusctLIrJlqtf4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 5:43 AM BST, John Hubbard wrote:
<...>
> +/// Allocates the PCI interrupt vectors for the subtrees in `serviced`.
> +///
> +/// Requests MSI-X entries `0` through the highest subtree in `serviced`=
, since an allocation
> +/// cannot be sparse, and falls back to a single MSI message for the who=
le tree.
> +///
> +/// # Errors
> +///
> +/// `EINVAL` if `serviced` is empty. Otherwise, when neither type could =
be allocated, the error
> +/// from the MSI request.
> +pub(crate) fn alloc_vectors(
> +    pdev: &pci::Device<Bound>,
> +    serviced: SubtreeSet,
> +) -> Result<SubtreeVectors<'_>> {
> +    if serviced.is_empty() {
> +        return Err(EINVAL);
> +    }
> +
> +    let entries =3D serviced.span();
> +
> +    let (vectors, msi_type) =3D pdev
> +        .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
> +        .map(|vectors| (vectors, MsiType::MsiX))
> +        .or_else(|_| {
> +            pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())
> +                .map(|vectors| (vectors, MsiType::Msi))
> +        })?;

The logic here would benefit from a comment explaining why we only need
one vector in the MSI case, or a reference to the documentation.

<...>
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> index 5c7829ea3bc5..2583b006019e 100644
> --- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -1,22 +1,40 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> =20
> -//! Vector addressing in the GIN CPU interrupt tree.
> +//! The GIN CPU interrupt tree for one PCIe function.
>  //!
>  //! A [`GinVector`] names an interrupt source, a [`LeafIndex`] the leaf =
register that latches it,
> -//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] o=
ne `TOP` bit. The types
> -//! keep the four from being confused with one another.

Why remove this last sentence?

> +//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] o=
ne `TOP` bit.
> +//!
> +//! Servicing a leaf requires reading its pending bits before clearing t=
hem. Only
> +//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`Leaf=
Pending`] clears a leaf,
> +//! so the wrong order does not compile. Nothing in this module serializ=
es access to the tree.
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
>  use kernel::{
> +    io::{
> +        register::Array,
> +        Io, //
> +    },
>      num::Bounded,
>      prelude::*, //
>  };
> =20
> -use crate::num;
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset,
> +    num, //
> +};
> =20
> -use super::regs::*;
> +use super::{
> +    hal::{
> +        cpu_interrupt_hal,
> +        PciIrqRearmMethod, //
> +    },
> +    regs::*,
> +    SubtreeVectors, //
> +};
> =20
>  /// Number of vectors one leaf register carries, one per bit.
>  const VECTORS_PER_LEAF: u32 =3D u32::BITS;
> @@ -78,6 +96,11 @@ pub(super) const fn subtree_set(self) -> SubtreeSet {
>      pub(super) const fn vector_count(self) -> u32 {
>          self.into_u32() * VECTORS_PER_LEAF
>      }
> +
> +    /// Returns every leaf a tree of this size implements.
> +    pub(super) fn iter(self) -> impl Iterator<Item =3D LeafIndex> {
> +        (0..self.into_raw()).filter_map(LeafIndex::try_new)
> +    }
>  }
> =20
>  // `VECTOR_BITS` and `LeafCount::Sixteen` are written separately. This a=
ssert keeps them in
> @@ -130,7 +153,7 @@ fn from(vectors: LeafMask) -> Self {
>  ///
>  /// Exactly one bit is set.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct Subtree(u32);
> +pub(crate) struct Subtree(u32);
> =20
>  impl Subtree {
>      /// Returns the subtree at index `idx`.
> @@ -151,7 +174,7 @@ pub(super) const fn into_raw(self) -> u32 {
> =20
>  /// Set of subtrees, one bit per subtree, in the layout of the `TOP` reg=
isters.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct SubtreeSet(u32);
> +pub(crate) struct SubtreeSet(u32);
> =20
>  impl SubtreeSet {
>      pub(super) const fn contains(self, subtree: Subtree) -> bool {
> @@ -250,3 +273,218 @@ fn from(vector: GinVector) -> Self {
>          vector.0.extend()
>      }
>  }
> +
> +/// Disables `vectors` in `leaf`.
> +fn clear_leaf_enables(bar: Bar0<'_>, leaf: LeafIndex, vectors: LeafMask)=
 {
> +    bar.write(
> +        Array::at(*leaf),
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR::zeroed().with_v=
ectors(vectors),
> +    );
> +}
> +
> +/// Disables the subtrees in `serviced` at `TOP`.
> +fn clear_top_enables(bar: Bar0<'_>, serviced: SubtreeSet) {
> +    bar.write_reg(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed=
().with_subtrees(serviced));
> +}
> +
> +/// The CPU tree of one PCIe function, and the subtrees that nova-core s=
ervices.
> +pub(super) struct Tree<'a> {
> +    bar: Bar0<'a>,
> +    leaves: LeafCount,

naming: num_leaves?

> +    serviced: SubtreeSet,
> +    rearm: PciIrqRearmMethod,

naming: rearm_method.

> +}
> +
> +impl<'a> Tree<'a> {
> +    /// Creates the tree of `chipset`, covering the subtrees that `vecto=
rs` services.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `chipset` does not implement every subtree that `vec=
tors` services.
> +    pub(super) fn new(
> +        bar: Bar0<'a>,
> +        chipset: Chipset,
> +        vectors: &SubtreeVectors<'_>,
> +    ) -> Result<Self> {
> +        let hal =3D cpu_interrupt_hal(chipset);
> +        let leaves =3D hal.leaf_count();
> +        let serviced =3D vectors.serviced;
> +
> +        if serviced.intersection(leaves.subtree_set()) !=3D serviced {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self {
> +            bar,
> +            leaves,
> +            serviced,
> +            rearm: hal.pci_irq_rearm_method(vectors.msi_type),
> +        })
> +    }
> +
> +    /// Rearms PCI interrupt delivery to the CPU after servicing `subtre=
e`, the one subtree that
> +    /// the calling handler serves.
> +    ///
> +    /// A handler must call this before returning, or it receives no fur=
ther interrupts.
> +    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
> +        self.rearm.rearm(self.bar, self.serviced, subtree);
> +    }
> +
> +    /// Enables the serviced subtrees at `TOP`.
> +    ///
> +    /// Each of them must have a handler registered on its PCI vector.
> +    pub(super) fn enable_top(&self) {
> +        self.bar.write_reg(
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_=
subtrees(self.serviced),
> +        );
> +    }
> +
> +    /// Disables the serviced subtrees at `TOP`.
> +    pub(super) fn disable_top(&self) {
> +        clear_top_enables(self.bar, self.serviced);
> +    }
> +
> +    /// Enables the serviced subtrees at `TOP` until the returned guard =
drops.
> +    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'a> {
> +        self.enable_top();
> +
> +        TopEnableGuard {
> +            bar: self.bar,
> +            serviced: self.serviced,
> +        }
> +    }
> +
> +    /// Enables `vectors` in `leaf`.
> +    pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask)=
 {
> +        self.bar.write(
> +            Array::at(*leaf),
> +            NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET::zeroed().with=
_vectors(vectors),
> +        );
> +    }
> +
> +    /// Disables `vectors` in `leaf`.
> +    pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask=
) {
> +        clear_leaf_enables(self.bar, leaf, vectors);
> +    }
> +
> +    /// Enables `vectors` in `leaf` until the returned guard drops.
> +    pub(super) fn enable_leaf_guarded(
> +        &self,
> +        leaf: LeafIndex,
> +        vectors: LeafMask,
> +    ) -> LeafEnableGuard<'a> {
> +        self.enable_leaf(leaf, vectors);
> +
> +        LeafEnableGuard {
> +            bar: self.bar,
> +            leaf,
> +            vectors,
> +        }
> +    }
> +
> +    /// Reads the pending bits of `leaf`, and returns the handle that cl=
ears them.
> +    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'a=
> {
> +        let pending =3D self
> +            .bar
> +            .read(NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF::at(*leaf))
> +            .vectors();
> +
> +        LeafPending {
> +            bar: self.bar,
> +            leaf,
> +            pending,
> +        }
> +    }
> +
> +    /// Latches `vector` as its own source would.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if this tree does not implement `vector`.
> +    // The interrupt self-test is the only caller.

Why this non-doc comment? We don't annotate every method with their list
of callers (and it will become obvious with the conditional dead_code of
the next patch) so let's remove it.

> +    #[expect(dead_code)]
> +    pub(super) fn trigger(&self, vector: GinVector) -> Result {

Let's add this method with the doorbell test so we can avoid the
temporary dead_code.
