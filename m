Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011065.outbound.protection.outlook.com [52.101.52.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8CE36B061
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789972533; cv=fail; b=L2TBgLbqJPYbhXkQRE26Ge42dhC6dGQfmlKqGmASGIU0YGSxKBUMNa4X2lMODoNjO+O3Eaq0eYQ6f0y7E3XFikCoUQLtZa07nY2ruoOX+A2FDMEulqMJGOavjPTJvDvKC1ISRoAqlS5cRlo+cKdXOFHh28UDVrBQaydQnOJqpkA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789972533; c=relaxed/simple;
	bh=1e+hyzExDeimMtniHzvulsHbHGFlsFe0V8L2qAwutZI=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=q5EkuX63ZoozBrP1t91NNckJjtOlT0iyfjjUq79ICH9B1nkTI6fOppBCD6Guvm2NhHfW2gPx/NWxYoyQVTb0+EAlmTBXf5JSKnaT71w/mlrrQ0SC8Vwa3WFixv90WzsHZuwwOFejcmCq4OLMO5tNhCg3iw1dyZWaEygdReBOY9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=blmBEt+T; arc=fail smtp.client-ip=52.101.52.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="blmBEt+T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4aTPpcAzFOHddgwiEeVotDKmutQ1Nc00A+gPoDJH6Quw90zhmwd+aUwurvPr/yL4eDyS4nb21xp3PrpsowffPDKk+F5ZpDKk9GdmzKghKbsyoYkguojzowQAcWrrgpmX4r4HQnBaO3IcWloufLcUm6kkzWBj2PZ5wMk4bj5RN+k+OeJF2THRqIGpsMBpJj2gRTvXtH8f+M7CsVFHJUQbLrIB9narCW8swzdlb0r6ECr8LYQBtDu7kS8Zu7o3QjZ+xzdw0Kh0whsqPHeEppfn2eabfPhFCOYfcHlk/cPxJpbll0j03M1x1695VgLXFLNwu+m5UhPr8FbDlm4/x7Iuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAbNwCmYUj3sOMAk1b9+yfK9e8Aabb2nw4n/EEqqHrg=;
 b=kgu9tXFpI+SKRZS73rEnaVvgHpcfbsDMFtt338SGep/jCfpfVcO3P3cn/jqmZNX+fPRjojTVf2zMK5tZ5y8lgNZ+9ihmnpVv9zJVRvpLYAqMBJN5P7/TMiFwsVcT79w41Ay4P6Ab7HLLrjSk51o90g2aAhXXIs+cWb3mD2hCjfcCPwWyG8qkqSmvHPjW1Oqt3taF+9kTKwLQW7xZewMxV6h2zJtHIMUaTi4YHHoTyrH5yEcE+iCxFt5RWoX+yQMJQnIwvsNmMFImaW5KuUMR4l0RePaxgp6kNCmtXn6C1jtRK26j8kOYDynLcze1mllQotE/PKTKWpMxW8oYr0LXMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAbNwCmYUj3sOMAk1b9+yfK9e8Aabb2nw4n/EEqqHrg=;
 b=blmBEt+T5GonJHjUGuptYxsfksHljU3e2Jrk5vagTdkMgday8rR4gCNy4sb+t6EGIwRebCd+f24IEDgih8skAsRa7oc+oDweCFzDLU/IRsEba7JWu13ZiU1fCZIYV8w0NXrv8wGQAnyAenqX9/mzxFmqQhLGkfBNTEf3yWk6f42AGJDpQSdBpoqk5vn6Y1K3gDXKv/qAIKhD1ufcqhu2qAHk67fzTs/ntR3xLmbfFtDvfNtxinR9OvIZ3BCI8l/5/jpNNB/Ik+y49xFR7bOPNhelcjllS3tic2XRC9+cRZZxgcw6kpjIu2MyWbT+9ecenU8NzlNV+9+TY9QAFM6uAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:35:27 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:35:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:35:24 +0900
Message-Id: <DLKSAXXE7I14.177GTLDCXTBR2@nvidia.com>
Subject: Re: [PATCH v4 07/17] gpu: nova-core: wait for GFW boot in probe,
 not in the Gpu constructor
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
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-8-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-8-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::6) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV5PR12MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: f048fe6d-830e-40a9-c33e-08df17aa866a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|23010399003|56012099006|5023799004|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	PfyCLOxMAYT/SnPQUt6+l7JUqICI4rnG+gn0lZRjln9CWqw25NvBE3MVXYzhGHomL/62bN4/OqsDndMuaCIQ4U8fUjnpPAb00oXaghaDFvVkGTJh0V2RiHKFxz/fF9b0QtxB3iHsOcgpXtTXS7TzHzFegja0rFOlvQVDy8oKH3TXcppr4XH1wiUgLjcoe1buo6+keWle+bR6X1g3dKgtwO4WMr9olO66R+DYuj0FZWrgF6Uxp86hRJNLH/pEthz9T8xHJpq2WPOjg32u2z5uy9EOVeZmTqeAZn9MNOWUQ0t9/jD2n8Yg0h/3CH3oO4eEdspQE5mBceNFWIWHKPC1b3EfFMcSo9mXnWZXpsJOg7WZFXRuHOExOV++C5FP0Mm9WqE31Vxw1T1gnQoo5NNb+X8G05sFlm/3Y0oDP74C6np9lWCwazR6wmLk5T/MLCi0L1zNMUq/wgDedpj/99wIppj2O+RGffyXbYfE6g3QOXmoJJadPwYjp6UyUtxGveUgWEXwOUb6sfWm/J0omV5MauO4rSxACy5x48NCFS1YCJA4bRBtPyAIyzhy52rB5jFhX1q8mvp0ZQ6/AZx4e41+6MZib0xuGcN9jQcFW199L62pBw8sirRF0KyNB1jBQxFV/8kQqKiSXyGRiXUki/AuQWH/9Rpa/23rf/EVLw6HdWQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(5023799004)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzJVREhFTzZBbkl0dGF5TS9KVGN5Wm1YOWI3S2IwNkhDbmVHTXpTOFlwWHBF?=
 =?utf-8?B?SFZvL3VJMXZ1UWVxaFRLZGlVUVd1NzNQMHcrZVZDNmdFU3o1Q0FsUGRJSVdx?=
 =?utf-8?B?SkphWU9iWjFyb1k1ZWdla1BKWEZNaE1UUGpHc1lSYXRZeFF0N09IK0tLSHZS?=
 =?utf-8?B?QVR6NTZRMm4zMXZvYVRPQXlnYkQ2SzVvRWtRK25rc0ZHUkI2c1ZMU2VBSVU5?=
 =?utf-8?B?d3VOZU1Ldis4T3BLdGdwcmV4VXAwMjNFb2lhSG5EYVhreXY5K0U4dXcySjI0?=
 =?utf-8?B?dVhZY0dlbFJsOUxwNmJuYjFDbllUYmtJSEN3NUdJRHQxSFRTSWFWV29Da2xr?=
 =?utf-8?B?MEtYZUJCZlQ0dnpZSHJ0S1RPUFVIWFFlNmJ4UmNQaXUwZ25LWWNzNDNYaUJk?=
 =?utf-8?B?d0JlZjl2eHNZUDhxb2V6RWt0V0VpZm0wTVl4NXltVE1UczJxZ1J1REtVRDVZ?=
 =?utf-8?B?MzhPOGtvWFJCb2J3V3luT0NpSW1XeXl4SlNTY1JKQ1B2NDdybHhnRXpPY1B1?=
 =?utf-8?B?RVdTekxGNkNGdUsyb3VrREQ1Vk9PNVh1dHdKSFJtYjhSNE9FUHRBNmk3djJM?=
 =?utf-8?B?Z1hLTHZLR1Z2OGo2Q1Fpb0k3ZzZKSUFRdUIxTzJERlgvRmdQSDMwcCs4ZWo2?=
 =?utf-8?B?VS9RYXF1dkdLblh6aDlVRWplbFhyai9jSk1pdWpxSlg1S3QrQm1uQWs1dXN2?=
 =?utf-8?B?bldYOU9RS29WMlZlOUtaRE5keXZvNGlvYks2T09rY01JVXkzRnZoM2ZuL1dO?=
 =?utf-8?B?R2VEMVhhakRnbm5FTDJYbWk5UDM1NEhCNHF0TjNuRWpWUGpWMlorbDQ2TDNG?=
 =?utf-8?B?d25xVFhPaEdYSWhmaEtiV24veUNLdTZjSXdjNkZwc0VSOE9aRU5IUDArclZs?=
 =?utf-8?B?b1BrdzdSSmEzUXZnd1BDcUFQODNBUlFCY00vUWc5MUwzUkJBNEJXTTVNaFBu?=
 =?utf-8?B?bU9mRXUzZ2xMcFd3N1A4eGE2eUlBbGFmQXJHNjVuc0RwSmNEbkYwRGRzdXBu?=
 =?utf-8?B?eHJuM3R4NmlZMXoxY2RtZXBuQmN4SWdzT3JBcDRTekF3RUt6U2NONUlJZitS?=
 =?utf-8?B?a3NTVXZLTUZ2TFFZTG44ajIwUlFEcVZNV1UzZ2JmQ1k2VUtqckFRYXVJc1Vn?=
 =?utf-8?B?bmRSV2JDWTNIVU03ZWNGekkwblFITkNWV2M5RGhUUlc1TzBvVWlXbkRTRXkx?=
 =?utf-8?B?bjUwcmQ2V1hPeWtraHVMNDQzbmo4c1MrWUpsTm1YcHluVHRPSTdmb2tKWmJ3?=
 =?utf-8?B?REtGVWFUcWJ6cUI1LzEycElxbkxyWGJCczEzR1YwTU13NE5YMjVpOVZmcll5?=
 =?utf-8?B?bmJDbk5aN01yVUM3SWRhaFNFT0pBUjZmRWsvYWVoTXo2NG1EUmZSUGFnUnpO?=
 =?utf-8?B?cURVODBZQ093UmJvMjIyUkhKakYrL0FwZTNHWE1PM2pleUxUd0ZTeWQ3WG5o?=
 =?utf-8?B?OS96MVdHV0NsSW9ZMTBIT0k3dUpMY3ZIeGdJcE5QeHlEbXFZbFJUNytTMzlw?=
 =?utf-8?B?c29QWHh5S1JuM1pXR3pvZmZJTXV4L3RHU01qOU1MRzdTS281eURONHZtQ0V5?=
 =?utf-8?B?VkFCVE9ZWmxUY1Nhakh6UXd5TjNnNnptQVExdHVBVWZaaFFNOHV4VGp2Kytv?=
 =?utf-8?B?ZGF4Vk1QanFtMWp5MHE5MnpyRE1uaWlYOXpBSTEyaC81UDA4T2t0OVA4emt6?=
 =?utf-8?B?NXZVaVVUcncyRmJFWURWWnVJb2tOTEhBMFovTSt4YzJKWDZndlhxb25jK2FB?=
 =?utf-8?B?MUpLZW1CVVNNMENiY2RHZk1EZEtWekk3V2RHZUtPeHZvWTJnT3ZYTXBWbEpE?=
 =?utf-8?B?eDVsNmJYcWhpbnpPUndGam1sdG1UZFRRbGlSTVYwSmFwNUF1ZGFMZm4rTTlv?=
 =?utf-8?B?Z3cyTXBLY0cvRkVEN1Nvdm9GZ1ZFcERIeGdxU0IxVTZOVHRPUHNQSFEzWkwr?=
 =?utf-8?B?WjFhNHVxbXQ2THZJSVl0Q0x5MGIxL0FCaWlIdUxvNklyWXU1cmtsREh6d1BO?=
 =?utf-8?B?NFJHY2txV3NlT2RIOUJKV0grS3lhWGt0M1dBTlRpQ3R0WUxWb3pQeGFLWmdr?=
 =?utf-8?B?b0ZRakMzdHJTVC8wcThNRWpoV1NDN0M1c0VBQUNmRTRsUENtS2pidS8zeVpY?=
 =?utf-8?B?cy93Q0hXcVJmWDJCemhIcUs0VHc3T00zTFhqVTU5NmxzUklyM3p0a1ZIYWkz?=
 =?utf-8?B?Vm4vZWVVellHRTZvZTJXWXNBR3ExSEF5UWVOa1JKZXBUYnZRRkZpZG9vQzFl?=
 =?utf-8?B?SDdhUkM5d2VoOTYzQkozU2RCSUt2K1NuZ2VUbExpblpTa2VTWlgrQTk4WGQ1?=
 =?utf-8?B?QkRDRmpGTEdHNUxSN25pci85OUhTZ3QrSnh6WFJrTWhFMitSN0pOVkVGMTZh?=
 =?utf-8?Q?cNm07LNCV+XlOcVcpH2ASGxrar00j4cT40iHI15PHbKTO?=
X-MS-Exchange-AntiSpam-MessageData-1: +uUPpDv03GXApg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f048fe6d-830e-40a9-c33e-08df17aa866a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:35:27.8404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmvvlXifBe0Yt+TbGBe67UzpO1yTYviCkbT7RTi+PL/WskeOIWp91y1/RURBi4YwLGv4GpJogyUAU97p91n/CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9779

On Sat Sep 12, 2026 at 5:43 AM BST, John Hubbard wrote:
> The GPU boots its own firmware, GFW, out of reset, and nothing may
> program the GPU until GFW reports completion.
>
> nova-core waited for GFW inside the Gpu constructor, which also boots
> the GSP. Code that has to run after GFW and before GSP boot, such as a
> probe-time hardware self-test, had nowhere to go.
>
> Move the wait into probe, ahead of the Gpu constructor, and read the
> chipset there from a Spec that probe builds itself. Leave the DMA mask
> in the constructor, since it programs the host rather than the GPU.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 13 ++++++++++++-
>  drivers/gpu/nova-core/gpu.rs    | 28 ++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 0672a0707a71..15a44f9a6441 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -22,7 +22,13 @@
>      types::CovariantForLt,
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::{
> +    gpu,
> +    gpu::{
> +        Gpu,
> +        Spec, //
> +    }, //
> +};

Import format: use `self` to wrap the single `gpu` into its sibling.

<...>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index d763bc8d3827..3d796d6c7013 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -212,12 +212,12 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::R=
esult {
>  /// Structure holding a basic description of the GPU: `Chipset` and `Rev=
ision`.
>  #[derive(Clone, Copy)]
>  pub(crate) struct Spec {
> -    chipset: Chipset,
> +    pub(crate) chipset: Chipset,
>      revision: Revision,
>  }
> =20
>  impl Spec {
> -    fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spec> {
> +    pub(crate) fn new(dev: &device::Device, bar: Bar0<'_>) -> Result<Spe=
c> {
>          // Some brief notes about boot0 and boot42, in chronological ord=
er:
>          //
>          // NV04 through NV50:
> @@ -362,17 +362,12 @@ pub(crate) fn new<'a>(
>                  dev_info!(dev,"NVIDIA ({})\n", spec);
>              })?,
> =20
> -            // We must wait for GFW_BOOT completion before doing any sig=
nificant setup on the GPU.

This comment would still be useful in the new home of the GFW completion
wait code.
