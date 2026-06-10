Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021114.outbound.protection.outlook.com [52.101.100.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1960C3D34B3
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 10:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087045; cv=fail; b=MN34v0KuaA+z1aR7+tMxcA3F1UU8Hx8FavP0dEGrEALn9NGleUqVoGGQLe2HNkHrWUelQb+INSFE4gOvmpKq3RkKWmTPVZlZf7+IqZofMTmEElbRocTiIjWP2kKDgpWVVBKKH6zcdyF7yl1D3OWCqGKiHgBEfrjlBhD76xqA7cA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087045; c=relaxed/simple;
	bh=Yzi/NNGfaduXqtm2Uc1mqx0p9gRJKeVcWafvWRSl498=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=a2R4Q25OhR4TnY7Jn1zWFOoaPaO9Inn8fyz+VqZty9WAhUtDG6jzTMZ03abbJWAGPcZbPSucbfFZYKV+ajEyDCwI01rfy+PJF1cjFnTTyePn7GnLA0ftejv+4yn6umB+k4wrvwuXoiof6moYwm49xKiHJ8RTLOWoKX60nrTj6VM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DwLmT7ed; arc=fail smtp.client-ip=52.101.100.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DwLmT7ed"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykrAgEIMw3ulXM3unVVhc+1fgFE8CKvlnQ3iwIZVquZeTYL9PqKjM2SBOSH4O4o77Yp2vM8tvjAeS991+1poQZIVjoMPLGHVXZDAytqHXg8xRakcOOEGylhmxtZaXQYDRcooxVorvv6z8fpnnO1Hqyx6uC6r19mWTm6D2+iCsd1Y0e6sw+sUFNfWpyuZejGDEJPDIbUF6B15qo7TRaKGnEHgm3NJL9yb+ep9YDLHNcHuxI2HvmwjL0HmegK/IGvfmUBpvQlStDH3qKZ5mAaDafpLri9YJ47rTuS9qJs+b+5kl+5HccVGrg7qQJsAiwf6s5mwCQ0C5tnR/WkC3NLMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjxScthDhBZfo+1nY8OsFhI0BUyJ1rwJmX50/XC/nU0=;
 b=OqAwYaiWp4sBZHEZvPjIsldkaQoI4R4F8q2mZglAcRQ/BLBJDtPGY4361DwAMm8cBZfLv718M/Ic5PF0062Fb1U/2dxzVYjLKLHNNzIUpOkWzpSpMZXmLqx3XuSHL8gf6t6EXgaOO97g9rpenmnPdEYqcLkgcst2V92aei4QhtEq18O5h7uJBEy8AFr3FZDzeI0Ml9bQ7yOidJGHsQciDF9Q8sJZRc0kYul58eqEPux1H7P06vvkFrcmTkMzO9vw9rwfKo9C00yRof3RnP6imtdGfi30itIJXgrtgAy2KHymknI2Z37DkSZmSScjsw9BlN0sD/czRpQlXIY8YxY2Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjxScthDhBZfo+1nY8OsFhI0BUyJ1rwJmX50/XC/nU0=;
 b=DwLmT7edBVegJbOA9Rp05+MpnCj49xiQ+uMBoqQtADkndKgtcDlWb8v+kf+C3UfB9CbV5YA/8dR3jKuTnkjcSc4FQhtnA56GwxcFjrQNpI7ecN/ApoYC6g8CnTAfwrbsdE2n1CglaEprQ4320NnppMpnrcnyvIkwbDeCRN7swD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by CWXP265MB2024.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:86::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 10:24:00 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 10:24:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Jun 2026 11:23:59 +0100
Message-Id: <DJ5ANU6OL6X2.D8ZG3LV755I8@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: Extract usable FB region from
 GSP
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260609-boot-vram-v1-0-d9382610507a@nvidia.com>
 <20260609-boot-vram-v1-3-d9382610507a@nvidia.com>
In-Reply-To: <20260609-boot-vram-v1-3-d9382610507a@nvidia.com>
X-ClientProxiedBy: LO2P265CA0509.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::16) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|CWXP265MB2024:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b63658-c669-4892-167b-08dec6da62fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|1800799024|366016|3023799007|22082099003|56012099006|4143699003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	K3zGzDgrdbxAKpsFvQ+oC7iurkQ0eAUdzh69CMLia30vWyB/+OelMsjFbmnxUc6bS+ux3Q2XdqWJOsYGvfl7WKBWLp2zylehaEcwa6Nnr7cXHUs4sVLiUlEjX/K6Q7JjJSKTOyH8cBquefXjHNBPw3OlM8kppMs56U49fDRUHjU+bWaxcNu0MZWlEZR0oHZCiLy+HsdzmJXnRgodLh8U9tW13WPG2NgFZjBZWWXGZr4ynYLs31K4IOP1vaiUZT8d1oNOrN/CltnseCWZtx5WhDYmjt7MIPyat6P65p/+5gAU4QOodemCSeQj4f/CfziASJ1Tf/k6weefQQAtKEzLD5/cz16TyQARedfWFTXrw9X5CKACK6OiJWbcly89oFOncNAnbvzcx2OKDxxwBrzIWrqk05LFbBBkzgMCWi+9H9U6wnB9om4twHFWT0EK+myHY4NZclkKFbMxiTT13fU56/PnJgpQwuS7gpE3wTMfU9Hj6ctOaIt2LOFQ2xWLXiCPJ0qQcy2NE6mce1HpjRe5GsvgwTjyJyrczJFAdth8Iujjae8lt3Z1ZwiuM8VaKbvAsWYL2Pbt93Bv071/znyhSWO5NhdIGYu8PQVlpUKUAxmaVq0fbmaRLRsC1v3aM6gHLojysQbvBOkIuuz0DaleGC2r7BOHve22iUGLKfWynM4ofVbrKhpG0r9Ja+GzCy2g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(22082099003)(56012099006)(4143699003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnhtK0o1Z2pZeWp2S0ZWYnptY21HV3lNY2FmQ08xYlpjYlNMTit3Q3V3OXI1?=
 =?utf-8?B?K21VTWdzVC8xSE9ickpWNXh0UG1NbUpBRUN2L3Zac2ZPeUY5Y3dxeHlObmRB?=
 =?utf-8?B?SUpGdHpIM1FwYXo1ditGR2dJblhzZFVNMWJmcDUrMVVmaEhBUUkzM3ZZZno1?=
 =?utf-8?B?RXQzQmx5QWY2TkJraWtoYjd1TGVSNWRHZ2UxM1RYQ3IyenBlWUptbUhJQVUz?=
 =?utf-8?B?bjFHd0hLV1JXczA5VmcvcUxhK2ljOERjdndtYlN6VVVhNWJEYU1xR3lXM0hl?=
 =?utf-8?B?WlptcDBFaVNFZktCWDhWRUhNRTIzQnhUdERYNzlsVWhnNDREa3dwSUxsZ3lu?=
 =?utf-8?B?WHNMS21VU01UNFNMV3VueHlaYy9jcTBGYTlKMDZMdURTcUhvT0VqcFRzTXhB?=
 =?utf-8?B?aXVxa2hCaWVwbnZkaEYycElQR3lUUi9FS0wyT2Z0RUZXQXEvRGVVKzlEQ0J4?=
 =?utf-8?B?ODY3dU1TbnpiL2Q0VXlFUzh0QXY4QUZyUkdIT2J2V3RIeW9HVTFtN1dUcGVY?=
 =?utf-8?B?TzQxYUY4aU1jUjVpcTlJbUQyNVVDTlhpRWVFWUxKZEdIZ1N0S0VIa1Q1SXFG?=
 =?utf-8?B?ZTRIZWFGY2R6eUZJenhxZlJ4MnR0SWVaTVI1REVoQVp2aytYM2hiWjVVd0Jq?=
 =?utf-8?B?SUkvTkYydVBnSU1xS1ZHRHFFNnA0OFd6a09Ra3ByRnd2ZnhOc005bFNaWERq?=
 =?utf-8?B?ZC9DOWhDZzRwcmxXbjNqRVl0S0N6Zk1qbWtUc2YvTHlTUFM0ZXg3bmZPWTlG?=
 =?utf-8?B?RnhlZlhCZFdEa25HZ0FETnkyblJaZ095REhCYzVIeHlHNHkxYzVzWHQyM0FS?=
 =?utf-8?B?bjNBcWQxSkFMaHpINjRkRkh1UWhiWDFZM1VOZFRmdHRYeTI1WC93NlRteEtF?=
 =?utf-8?B?S2E0UXZLcVR1bDBxeUppQkZYbkc1V2tvOTd6SGFUcXdjZERybFNHbUppbUtY?=
 =?utf-8?B?aVFJbi9uVXNGOVhsY01TRVNmWW9XRG5CUmZkcitWVFVvbnU4ZlM1Q0Y4dlV1?=
 =?utf-8?B?bFE4M2xyOWVmc3pwQklvTW9VN05ocEFLV1BKT3FQajNFRHRuNDZVWVZwQWYz?=
 =?utf-8?B?QnNhajVFVVZ4aTNvY2NacUxGRXE1Z0F1enZjeGhRcmtZcFNEb2RJaGZkWUdH?=
 =?utf-8?B?TTNBNVZHQkRFSFRtNnNXVUpiSWhYNjRPMU5ocEZEWUM1YXY4RHhmUkN4TzNH?=
 =?utf-8?B?U256SGorUGRsMzFsUnRCZHhnU1FSa3RvRmVOcnJuWDBSeGVibzFlVkJaYzJ3?=
 =?utf-8?B?YVZQT0lzV0VRS2ZiYVpURGNLZVhka2dVK083YU1aM1JlcXZxZkVVQ0ZVMTFv?=
 =?utf-8?B?aUtDSk0zQUdrVU5LVHZvN3ZtYUZwbzZIZlNNSThFcDI5SFJielJTb1g0MllL?=
 =?utf-8?B?YXFsWVJRdWl2WWNUYWVCbWVvd3V1aHhoQnhZYmhKSDQvWmY5VkoveVpyUkQ0?=
 =?utf-8?B?ejhjWUxJbE1MQnU3bDNBREUzUkVvQUhiYWRkTitMdDZQc1VQUVBGRmlLTTVj?=
 =?utf-8?B?ZUhwQ3ZhaHd0MEZLMlJiWVpIYzhpcHUralRHUE5pNXVmZ0cyUTM0Z0xuZXpy?=
 =?utf-8?B?TEZRbnpVNU1zb2czOUxUbWtxbk1LU1pUOGhySS9jenBMNzI3WDdtL253cytM?=
 =?utf-8?B?RHI5K1BVbEtaUUlhRk1ETUJuTVkrZXA3SVFhSVl1VVJORzE4Nzl6R1lidnhR?=
 =?utf-8?B?bEk0ZVd4UDBybkpjbCtxTFZBcW5mNG1PSUk3WWpieXVrRDhLdWExSDJBTTBi?=
 =?utf-8?B?ZFRBZ2tOamRYWG5DK0RPbEg0QllMa1B1OUdSaXVsQ0s1eUJQWHhpSnlaaXFz?=
 =?utf-8?B?R09STlNNY2JjMW9INHdaVHg5V3VqK2lVRm5WK21ValdJN3hPVVV4OGJqRUF6?=
 =?utf-8?B?TjZqZzNsMVBkNDNyajN3OGhOVVhnUXZiVVZnY0wwSkZKdkdDK0lqUDBrcVBn?=
 =?utf-8?B?UEhycHJBcVFTYWl2cnRFYmlWZEI4aTdxeUJtaVcvUWVYR2djb3hGTVRZMjRM?=
 =?utf-8?B?aWhyWS9ONEJjcEJkRzJ4U1orejJQV3ZFbmo0eFVka1BCQ3pFcUFnbU8xU2tm?=
 =?utf-8?B?MUQ5M0MrYUhWMWN6bVUybjYxMTFXMlBWdmJkdDhUSDhRaG9oS2ZLa29OM0Fu?=
 =?utf-8?B?MjVvNXljWmpNZXFpV25TNnRoa09ESjFhT3V5eVF5VDFwRGRxM3YySGFSeUdB?=
 =?utf-8?B?aitEbFhPVmJVcG8vdG1NT2d3eEVrSUszU0E2WjFIMElqSEowZU9sNy80VU5p?=
 =?utf-8?B?dnhiM3JPNDdTekJTY1ZqUG96ODBkbm11dThTcmdtTC9QL1NLTVpkQXZaWVor?=
 =?utf-8?B?S2NpOFREZjJ5LzhoaEYwL2sydHVCTGZSNTJPVTlUYWFtSkpmbG0xdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b63658-c669-4892-167b-08dec6da62fb
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 10:24:00.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m2DwRHE+zt7F8Kn8MrUswDnpFw6Ik3PCH2RZOmM1d64qR4QsEMJsRlj2Wwo/rzTr2/kcm/xjgsp5xFYjDBqhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2024

On Tue Jun 9, 2026 at 9:04 AM BST, Alexandre Courbot wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add usable_fb_regions_iter() to GspStaticConfigInfo to extract the first
> usable FB region from GSP's fbRegionInfoParams. Usable regions are those
> that are not reserved or protected.
>
> The extracted region is stored in GetGspStaticInfoReply and exposed as
> usable_fb_region field for use by the memory subsystem.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/commands.rs    |  9 +++++--
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 40 ++++++++++++++++++++++++++=
+++++-
>  2 files changed, 46 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index f84de9f4f045..d955f52a93bb 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -5,6 +5,7 @@
>      array,
>      convert::Infallible,
>      ffi::FromBytesUntilNulError,
> +    ops::Range,
>      str::Utf8Error, //
>  };
> =20
> @@ -191,15 +192,18 @@ fn init(&self) -> impl Init<Self::Command, Self::In=
itError> {
>      }
>  }
> =20
> -/// The reply from the GSP to the [`GetGspInfo`] command.
> +/// The reply from the GSP to the [`GetGspStaticInfo`] command.
>  pub(crate) struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
> +    /// Usable FB (VRAM) region for driver memory allocation.
> +    #[expect(dead_code)]
> +    pub(crate) usable_fb_region: Range<u64>,
>  }
> =20
>  impl MessageFromGsp for GetGspStaticInfoReply {
>      const FUNCTION: MsgFunction =3D MsgFunction::GetGspStaticInfo;
>      type Message =3D fw::commands::GspStaticConfigInfo;
> -    type InitError =3D Infallible;
> +    type InitError =3D Error;
> =20
>      fn read(
>          msg: &Self::Message,
> @@ -207,6 +211,7 @@ fn read(
>      ) -> Result<Self, Self::InitError> {
>          Ok(GetGspStaticInfoReply {
>              gpu_name: msg.gpu_name_str(),
> +            usable_fb_region: msg.usable_fb_regions_iter().next().ok_or(=
ENODEV)?,

Does it just essentially require a FB to be present? What would happen to G=
PUs
without display support like RTX PRO 4500 Blackwell Server Edition?

I feel that this check should be done by the user of `GetGspStaticInfoReply=
`,
the firmware doesn't reply with an error.

>          })
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs
> index 7bcc41fc7fa0..d025167927df 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -1,6 +1,8 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
> +use core::ops::Range;
> +
>  use kernel::{
>      device,
>      pci,
> @@ -13,7 +15,8 @@
> =20
>  use crate::{
>      gpu::Chipset,
> -    gsp::GSP_PAGE_SIZE, //
> +    gsp::GSP_PAGE_SIZE,
> +    num::IntoSafeCast, //
>  };
> =20
>  use super::bindings;
> @@ -129,6 +132,41 @@ impl GspStaticConfigInfo {
>      pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
>          self.0.gpuNameString
>      }
> +
> +    /// Returns an iterator over valid FB regions from GSP firmware data=
.
> +    fn fb_regions(
> +        &self,
> +    ) -> impl Iterator<Item =3D &bindings::NV2080_CTRL_CMD_FB_GET_FB_REG=
ION_FB_REGION_INFO> {
> +        let fb_info =3D &self.0.fbRegionInfoParams;
> +        fb_info
> +            .fbRegion
> +            .iter()
> +            .take(fb_info.numFBRegions.into_safe_cast())
> +            .filter(|reg| reg.limit >=3D reg.base)
> +    }
> +
> +    /// Iterates over usable FB regions from GSP firmware data.
> +    ///
> +    /// Each yielded region is a [`Range<u64>`] suitable for driver memo=
ry allocation.
> +    /// Usable regions are those that satisfy all the following properti=
es:
> +    /// - Are not reserved for firmware internal use.
> +    /// - Are not protected (hardware-enforced access restrictions).
> +    /// - Support compression (can use GPU memory compression for bandwi=
dth).
> +    /// - Support ISO (isochronous memory for display requiring guarante=
ed bandwidth).
> +    pub(crate) fn usable_fb_regions_iter(&self) -> impl Iterator<Item =
=3D Range<u64>> + '_ {

I think this is a bit too verbose. `usable_fb_regions` should be okay.

Best,
Gary

> +        self.fb_regions().filter_map(|reg| {
> +            // Filter: not reserved, not protected, supports compression=
 and ISO.
> +            if reg.reserved =3D=3D 0
> +                && reg.bProtected =3D=3D 0
> +                && reg.supportCompressed !=3D 0
> +                && reg.supportISO !=3D 0
> +            {
> +                reg.limit.checked_add(1).map(|end| reg.base..end)
> +            } else {
> +                None
> +            }
> +        })
> +    }
>  }
> =20
>  // SAFETY: Padding is explicit and will not contain uninitialized data.


