Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1335E1AD
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972507; cv=fail; b=drAtMqKSZUwDap8BqPDKqku/mUxE7tcn3AqGbf5TWeGjSX569VaEZVXfZCOLgblRm3A+w3vw59agVne703uCzc/S4jEGPKHA/flSqV/2AZdXwqoLYdZFbCtd3HLHviQwC3atijYQgqbxBjvlhmv7s/lUPI/ZstueqLsGN8RJQi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972507; c=relaxed/simple;
	bh=7TbaGLhegkBz68oJt6jlgabvuAhj8jNJ0c+vh7aCRhs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AMrJtNWeEAIPNfo1nluhAJUKtLldXH6GWw9rAQs0mbhPtBzNWVHFO5cbJg4njWrzbvZWIGnmS2CksxkILoeb4OrHZFgOG/KH3vJKDXW6WFNLNUHkCeUWbR5LyY2PuSH2b3uSNO5q6d1qdLrGRlagiUGHVbMblmF3t7c3znM4Ftc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mBXmiXaj; arc=fail smtp.client-ip=40.93.196.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mBXmiXaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMS2pZluoLoX6nRuCv2lqdhElqXAFsmiazZered3aL8YUkPH3RGrvoUM+unQ0HMOoTYBtM0p1l4yh2M/7oO6uuzvEUUuqS2mgO/3RudnSZj8OmyDX/ld5JXSBphanFMXqNILhG9ZuiifN6d8se4CBwVcbHMCXqIkrUSl/IVKM/LnLxkixMbJXDAoUgKJorbhg7gYib9KKYk8wU1my+0V66IVEC0LgTMt/RPsd3pIvhnrBcECR9GTt9XlDizdxij5yXIq+xERF9ZdoepEqiIXiWo8MB8sVevN4lv564CBWHho7cdiUyM4gLZ4ea7LPgYkVXG/yPCD7wpOtCdbXBLDBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVPSHqgl9aCOQANFDtWMj+i5iVOfTUt6jAA/VDaKvRs=;
 b=wRcRWoFerpWk1GZ83vDsh2C6ZqMbgsN2AaVKnjlb5OPuXixpIXsCynIdhRQcVlwpRfUgGdB8RsOleJwxyBwBEKmnmIc9GtILmaUhJ9a78QbrvdX7Lg+1OtrRvCRQb9/Rfb+IwVVK6oh54D0wlWaIzSrWNgkYkzTz8THYIbkva+zBUtuiYf4B6tuykKtjEJQDYIn4qrb96uXa2F/dLqOPly2IITyo3YJHrR1+uY4BqVb18zMDdTjIUpw9dj47fquu7QSSV2btcdPsHCJfLW0Ph4Vf3Ar73LEeSNSJca8o3n/WA6nrV73SEqUzZ5BqRODY3y8p51YNQ3rEuwBcI8gaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVPSHqgl9aCOQANFDtWMj+i5iVOfTUt6jAA/VDaKvRs=;
 b=mBXmiXajw1opaflDiXZxenbwgNUkOfhaTLWdGzQpL5i8CdCZROaSqojWQDpGY8jEQw9bBGEsxUmmZzeq7alsPHJ9MS1Xlt3rjtOsprgRiIwmTIdnSYXYsz/+IH3fk1Fs/eFcbQ6FQOltzSBASgAv+4jWtrPhiE1OyuLravG/eikwKfWED9BZsa6TFT0tjhRGBHbcglyCSelRrUyvUERhAHlTJdmo8LacAwSa2ZN/Cj1KedSxpjcr2kYIe6Lg30VBrI2d4kofJU98AIht2s6mNUap8tVKtOkPG2My40kV1rtnPpJbEWdb/I7RlXtbsKicQFa+f8PFDlNUHjolpyrcGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:01 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:01 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:34:58 +0900
Message-Id: <DLKSALWQJPTD.3GB5J9TR4JUBQ@nvidia.com>
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
Subject: Re: [PATCH v4 03/17] gpu: nova-core: add the GIN vector, leaf and
 subtree types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-4-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: c69e6d5c-c45d-40e9-822a-08df17aa76c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	EyMkTN+jMVNGdkgrvbM9Xrhtx05LZI0ULUeMGWrB72mC23QidNjyu2rsGeusjqwk5mSvAAQydpDWRJ+PuswyLUGMDrs6bsbnuU0pGdR7xuJtoLz+3J0y/hk3vU8FsMeNq3bI3BI9RkaCgr+jAOwtIb2e9apiSaOLtFmUo6Hc9+vtR2yYFBzyBAsIYjz+8HzQndFL2cjJhB2NjjOUzSK7TP2oQA9opGpVUx8xYR8jAn4E+xOtjFoouQqO+nOcUZ1P+rSJqKDWm9U0QupTk2ZEKChpdMP2J/PbMIw38JZbh3elwYwUOuW4q/oycU0Cwi6xqH9/A2Xy0EeTYbtSUnO7tS3Su2mIsZsfJScWsI2e8AtKm4VWvqib6iLXJUJ7VB70lX3NsSPJ25xIIyeaJC9YIr1GXw9VJaDhq1vck3XsHmd0cOH+ycFwoFpqBstPRIq1YgxmpOEyYXFLPdE71z3hvt1oOhJsF132jRSx+fgVIM2neQq1Ox0krgcTllvWIidTX79XWYNYQNZsU08REyjAKDLnhkW0ZCAkyPZKOzi1Uv3cZ0tg8PUPKWGCkIYidH1gSWDwyUMOyuosaHOMct1CjRGs7uLiFrMLZYcrOCtjWxVD4bNuR5i2ghFQ4WUmEMTqVHrOywtlwdQF/Q7Xs6ljGWyGTTw1jkT7A2rNmZyhwTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEErL25uTjF4c0RIVTYyNzNwbUdKYnpPMzNjdHk0ejcxc0g2UU5ZVGhZQSsv?=
 =?utf-8?B?RGp0RVh2Vit2d01oNWVyL0xtVUp1VnRCWnVVQU55N1JZZm44Z1dXUllWR0JU?=
 =?utf-8?B?eXlyZGxCSHROU3N3eHEzdTl1MXhVVUEyOUppMEd0SDJKRDI0UjBqaTRCa2hX?=
 =?utf-8?B?MWtYVXV0djlqbFZXcFYwYVMxSVdaaEwzZml4VDRDalNZaFBsQXB0azJWNmlM?=
 =?utf-8?B?b0dud2xGWGorWk12L0Z4MnJRYzlSemFWTjB5U0didHFZcTRtRWZPUjY5ZDhr?=
 =?utf-8?B?M2ZTdkFiRmpRNmZXYjJ5Ym44R2NKc0NLVXZ5ZjF2RFpKZU42d3VoU1J3R0hq?=
 =?utf-8?B?cGJMQTB6U2JBTXNRckVwSEZiMHlhRXBDQVF1aHdOWlVOTkIxUSs2N3FSYStw?=
 =?utf-8?B?aVV2ZDdVckZOZ0xnUWY0WXNsZmpRcFI4dDU0MllITGJ5OFk4bzZ6MU04WFQ0?=
 =?utf-8?B?V2Z4OVA0V2hTallVTGlZZEtnYlFGZHFVYnd0UnFFcXVFQzkyZkpiU09xNFBy?=
 =?utf-8?B?QkdLdXNmNVI5TXZwdThpa3o1amNwK2hnejRqWStwOW53WkdNUGpQTzBUcXBi?=
 =?utf-8?B?b2J1RVVnaWdTRzVKSGt6NytzYTN6U3M4ME1HQklYQ0ZGNGNiTXZKQ0twc29D?=
 =?utf-8?B?VGZReDEvaEhTaldBU0FVRWN5OW9QQndacGNkbHQ2WTAvWGxIR0hpa1pKYk1o?=
 =?utf-8?B?OVRnY1FvSDNtKzJqUFR1Rm1WSXZxL010MnRKeTUvNkRNbVBEUDZjK2h5UkRt?=
 =?utf-8?B?cHNzRTlzYitLbC82ZXZaV0Y0UEg3MTNEZE1qWnhvUStlQ1gvenNETER3ODJB?=
 =?utf-8?B?Qk1OTTdEd2plaGRVMHNHa1Q0UkdNaHJsRXRIaWdmZlZhYmc2SWVRd1NFL01F?=
 =?utf-8?B?SjRDWGsxU1ZHL2VaREFDd29VelJhcmFncmtKNy9vTmFLNHB4enJYaUo2cmV0?=
 =?utf-8?B?SFBqS3RvaVBLdGZyc1BvRFVkMm5CQXBNeFpwQjB6S2JlS3JVUjJQc1JMdzBW?=
 =?utf-8?B?NUlUeit3dmhXS3hZcmpBM1dFKzZ0Y0dOaFBvdlBqM1p2U2hGNzgzUUZYNEJC?=
 =?utf-8?B?S3hiU3VzY2VvRmIxc3R5blhpbDJ4VTBjek1IZWs4bjNJbXFiVTl5YklmNkdy?=
 =?utf-8?B?RUUzbVR3YVIwa1hjbzJpdHBMR2RtbnFYdUNQcE1vSjBhWmNhY1JyWTE5bTNq?=
 =?utf-8?B?WmN6Z0lhaFRySm5TTDhxUkw1Z20raS9SVjRnK0pYRTVXalZRZXR3akpHQjVm?=
 =?utf-8?B?VjRhS2JFdUZqb3ZTK2IzVzJWN3Z6QXRUUFZ0T0grREFiOElZUFFHNHdJb3Fs?=
 =?utf-8?B?R0JTbDhQczJsczA0NVVCK0ZRNUJLRnRuOVJvcytaVmFPV3c0cEozVE9TR3pW?=
 =?utf-8?B?SHJqb1NZeStZWFdncUppSTd3cFdOVlNzeU1XYmFTNmNzeHdQSitrRjlERC9F?=
 =?utf-8?B?OW5Yem80ejN4RW1ZcjdPQVhHWS9lOWJ0Ri9YU1dNbWdqK3lRTlNPM3FUTEpl?=
 =?utf-8?B?djU3ZWR6TlBxellNYmd6b3lqZVFFaHBCcXFQNHBGZDdwUW5pbU9YQ0hpZW1o?=
 =?utf-8?B?OVdFUTBrSFRSTmlYTnhIYXZ5b2tGQ3JzUDBMYmI1aCsrR2VSd1dZSGFMZlJh?=
 =?utf-8?B?dXY1M2hFMlhOMDJDVXRyWXBnQndFZ3MzSjAxVVh2UFN4RTA0SG04ZVN3T2F5?=
 =?utf-8?B?bFRuTE1IT3pPNHROVEhUQzJEYVcxR1liTTRvSitrMkRGTjdQMWRpenRjTHZk?=
 =?utf-8?B?Nk8zaHYvZG54MVZRRUFyVWphazMzd3o4QXdjdXZ2ZVBIRHU5OGdpZnN4RkM5?=
 =?utf-8?B?VVBscG1MZStMemFZYnF1RndkVWhxZmJOVDBpOS9YSjk0SEtlQ051ZnE0eG5M?=
 =?utf-8?B?MmZaQjJxZHJ6OVFRMjRkSlp1UUpTenovZWE0ZWhvQXYwd05ITTFVYjZLYjdx?=
 =?utf-8?B?R3BkRVhTSnNXaDRvdXZvSzdtdTFRNlBjRjlDYkhQVjJ2eHdna2F0RVN4TlhP?=
 =?utf-8?B?SU12TFhTd2Y1bWovRmNOSzBQRWZxbXRkS2RkeG1jZkZkMS8wR3ZNMzZSM3p2?=
 =?utf-8?B?bm9yYXhNN2lMWTVDcUp0blBNME9qQ2pRY1REdDQvYlY2bnlJSklwY2oxN3E1?=
 =?utf-8?B?RmZrMmg4NSs0N0kzNVFBTmozSGRlZVNKZ3lkMG04K2dYZTduTHlta2FvZDFV?=
 =?utf-8?B?aHZpdXcvZ2tzeDY1UllpME11VHhOU0VtQ2V3QWVHa1ZxUEY4VlBPc2ZUaVMz?=
 =?utf-8?B?R05qY2Z6VE1YNXh3NXZFd1ZRV29Nb2dnOGgxc2ZqSFgrTnFhVjArNUJwU05R?=
 =?utf-8?B?VmZQaU81QjVkaURuSVpZTDR4N3RLSG1GZXZoOFVoREhUUHcwVFdEOUVHRVlu?=
 =?utf-8?Q?NFdgzH5hx6BwVs1cMZ7xgVDN6jbCJvaM0KltrGRyq0NjN?=
X-MS-Exchange-AntiSpam-MessageData-1: zwtObTPfB9RNiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69e6d5c-c45d-40e9-822a-08df17aa76c7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:01.6059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pa1KiQNGQVyze8aQDQ9ZGXlqsuxIx3icsH1sWV8mkSgLZnQXiZE5S98LQJiMgBV4Hg8UUtbPWdjf8/0A7VAguQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 1:43 PM JST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> new file mode 100644
> index 000000000000..24976a3146be
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -0,0 +1,238 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Vector addressing in the GIN CPU interrupt tree.
> +//!
> +//! A [`GinVector`] names an interrupt source, a [`LeafIndex`] the leaf =
register that latches it,
> +//! a [`LeafMask`] a set of vectors within one leaf, and a [`Subtree`] o=
ne `TOP` bit. The types
> +//! keep the four from being confused with one another.
> +//!
> +//! See `Documentation/gpu/nova/core/interrupts.rst`.
> +
> +use kernel::{
> +    num::Bounded,
> +    prelude::*, //
> +};
> +
> +use crate::num;
> +
> +/// Number of vectors one leaf register carries, one per bit.
> +const VECTORS_PER_LEAF: u32 =3D u32::BITS;
> +
> +/// Number of leaves one subtree covers.
> +const LEAVES_PER_SUBTREE: u32 =3D 2;
> +
> +/// Number of subtrees the widest supported tree implements.
> +const MAX_NUM_SUBTREES: u32 =3D 8;
> +
> +/// Number of leaves the widest supported tree implements.
> +const MAX_NUM_LEAVES: u32 =3D MAX_NUM_SUBTREES * LEAVES_PER_SUBTREE;
> +
> +/// Number of bits needed to address every vector in the widest supporte=
d tree.
> +const VECTOR_BITS: u32 =3D (MAX_NUM_LEAVES * VECTORS_PER_LEAF).ilog2();
> +
> +/// Index of a leaf register within the widest supported tree. An 8-leaf=
 tree implements only the
> +/// lower half of the range.
> +pub(super) type LeafIndex =3D Bounded<usize, { MAX_NUM_LEAVES.ilog2() }>=
;
> +
> +/// Number of leaves a tree implements.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +#[repr(usize)]

supernit: since we use `self as u32` below, let's make the internal
representation `u32` as well so the cast becomes an actual no-op.

> +pub(super) enum LeafCount {
> +    /// Turing through Ada.
> +    Eight =3D 8,
> +
> +    /// Hopper and later.
> +    Sixteen =3D 16,
> +}
> +
> +impl LeafCount {
> +    pub(super) const fn into_u32(self) -> u32 {
> +        // CAST: both discriminants are 16 or below.
> +        self as u32
> +    }
> +
> +    pub(super) const fn into_raw(self) -> usize {
> +        num::u32_as_usize(self.into_u32())
> +    }
> +
> +    /// Returns the number of subtrees a tree of this size implements.
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
> +// `VECTOR_BITS` and `LeafCount::Sixteen` are written separately. This a=
ssert keeps them in
> +// agreement about the widest supported tree.
> +static_assert!(1 << VECTOR_BITS =3D=3D LeafCount::Sixteen.vector_count()=
);
> +
> +/// Set of vectors within one leaf, one bit per vector.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct LeafMask(u32);
> +
> +impl LeafMask {
> +    /// Returns the mask with every vector set.
> +    pub(super) const fn all() -> Self {
> +        Self(u32::MAX)
> +    }
> +
> +    pub(super) const fn from_raw(raw: u32) -> Self {
> +        Self(raw)
> +    }
> +
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +
> +    pub(super) const fn is_empty(self) -> bool {
> +        self.0 =3D=3D 0
> +    }
> +
> +    /// Returns whether every vector in `other` is also in this mask.
> +    pub(super) const fn contains(self, other: Self) -> bool {
> +        self.0 & other.0 =3D=3D other.0
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
> +/// One subtree, held as the `TOP` bit that covers it.
> +///
> +/// # Invariants
> +///
> +/// Exactly one bit is set.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct Subtree(u32);
> +
> +impl Subtree {
> +    /// Returns the subtree at index `idx`.
> +    const fn new(idx: u32) -> Self {
> +        // INVARIANT: shifting `1` left leaves exactly one bit set.
> +        Self(1 << idx)
> +    }
> +
> +    /// Returns this subtree's index within the tree.
> +    pub(super) const fn index(self) -> u32 {
> +        self.0.trailing_zeros()
> +    }
> +
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0
> +    }
> +}
> +
> +/// Set of subtrees, one bit per subtree, in the layout of the `TOP` reg=
isters.
> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct SubtreeSet(u32);
> +
> +impl SubtreeSet {
> +    pub(super) const fn contains(self, subtree: Subtree) -> bool {
> +        self.0 & subtree.into_raw() !=3D 0
> +    }
> +
> +    pub(super) const fn is_empty(self) -> bool {
> +        self.0 =3D=3D 0
> +    }
> +
> +    pub(super) const fn intersection(self, other: Self) -> Self {
> +        Self(self.0 & other.0)
> +    }
> +
> +    /// Returns one more than the highest index in this set, or `0` for =
an empty set. An MSI-X
> +    /// allocation that covers the set needs this many entries.
> +    pub(super) const fn span(self) -> u32 {
> +        u32::BITS - self.0.leading_zeros()
> +    }
> +
> +    /// Returns the subtrees of this set, lowest index first.
> +    #[expect(dead_code)]
> +    pub(super) fn iter(self) -> impl Iterator<Item =3D Subtree> {
> +        (0..u32::BITS)
> +            .map(Subtree::new)
> +            .filter(move |subtree| self.contains(*subtree))
> +    }
> +}
> +
> +impl From<Subtree> for SubtreeSet {
> +    fn from(subtree: Subtree) -> Self {
> +        Self(subtree.into_raw())
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
> +/// A GIN interrupt vector, bounded to the widest tree any supported par=
t implements.

"part" is new vocabulary and might be confusing to the reader. "Chipset"
or "variant" would be better imo.

> +#[derive(Clone, Copy, Debug, Eq, PartialEq)]
> +pub(super) struct GinVector(Bounded<u32, VECTOR_BITS>);
> +
> +impl GinVector {
> +    /// Returns vector number `VECTOR`.
> +    ///
> +    /// Fails to compile if `VECTOR` is beyond the widest supported tree=
.
> +    pub(super) const fn new<const VECTOR: u32>() -> Self {
> +        Self(Bounded::<u32, VECTOR_BITS>::new::<VECTOR>())
> +    }
> +
> +    pub(super) const fn into_raw(self) -> u32 {
> +        self.0.get()
> +    }
> +
> +    /// Returns this vector's leaf.
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
> +    /// Returns this vector's subtree.
> +    pub(super) const fn subtree(self) -> Subtree {
> +        Subtree::new(self.0.get() / (VECTORS_PER_LEAF * LEAVES_PER_SUBTR=
EE))
> +    }
> +
> +    /// Checks that a tree with `leaves` leaves implements this vector.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if it does not.
> +    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
> +        if self.0.get() >=3D leaves.vector_count() {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(())

This is a simple if/else case, so:

    if self.0.get() >=3D leaves.vector_count() {
        Err(EINVAL)
    } else {
        Ok(())
    }

is more idiomatic.
