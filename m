Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012006.outbound.protection.outlook.com [40.107.209.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6982E2EEE
	for <nova-gpu@lists.linux.dev>; Sat, 25 Jul 2026 13:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985866; cv=fail; b=njtTvrAMmDSTU1KVTFK4xmm9KEUiJq5Xi/kNWtQKCYbmz71uxtWIv2eGlY+FZtIP8ChK2kswIFxtKjS98Wje9FLr4BNFzQqXZF7hY/O1rXwzo4t+5Tg+vh+v1xMiZacRynHoMRVSOdv2Csy3vkMgCLbar2WKl4Lk19h+EiEOL8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985866; c=relaxed/simple;
	bh=uVCywpxCfAGCWpmv3IKQjQb2emaMYbxlEVZpmj467XA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=cEdpH5pyJrG/QcTh5YSS3pni1qGXhSgZqjrtHMd7GOPims/onvl0awNfU5Str/axUkCDs7zH6Y6JYyr9+BgcW7GlEyU/NusI/1Z9XR3X2zvIsir+gCSO8tm/b6FepmgMtVWvpzaKtQFnqHolrpYt0S0pBMXUUkgc/n1caxZBKII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P94EeTPy; arc=fail smtp.client-ip=40.107.209.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P94EeTPy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL/Hj9NP3CnpofPw1sR0MK2N65gbCugbwMpRJXGJ99G4CUXia0wPn0luqXmJGnqDoJMEq60u/Vcb+0ohsJfULCv4WXILrF6uhn/Iks8TErnyiFLrxVMQjGBZkq3KseLjIlpnSaWq24ShJSWGNOMsS2iEuYjAIwWOfoNgYvYXzMIQPZtXeI+mbRJbiq3WJa+jqqJpO+lwbMD2lrdYCqVujeT/+i0vQViX/eo+8d+vHX/1diPkFaigjoQCfY57xpzd523bijPRxofflkwVM4tI8mCP7ZXatu5LoJqHmcZaatezL8YiYSjCVHaISdDCtYlBpjB3Ad0upUXkYy31mXaJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKFj0WI60K8qSI6LnJBIcw+gQtVGXwbCVr6RwUTTds8=;
 b=p59TXOcI+i1z1b4zZ5k2fsHr4uW2srqBwt/sO/pKhKyGxBa+NNtC5X/A6FQkT1hy4Bc15uqJHxWHMrJ/BsaPTVyr7zoejykrkS2n6WRCJeGDlgDaUwikTYclNLIHnjKNaob8sNdN5Df4CsRASUNd0ALA15+ybn4025ZI5l92fPnaICTgLlCnLjW2FHFdwcO0ZDb/DRYEFTPsdsaM3ttAo5fbJqJ9/17Enu8BBvfDxy/je+516TrCaUANDbWRWUV0CxP/wVwAtnEcA/bqAXyek8KPkOiS4nNhLfPZ1YLdY2RFpSU7KQb36jkB7zXIaB58wyfBUht35Otzruv+ZAD50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FKFj0WI60K8qSI6LnJBIcw+gQtVGXwbCVr6RwUTTds8=;
 b=P94EeTPyg7f4H+S/Z2rOTlQFiO3cFZ3ye71dLo05LJ+C3dG1iofv1FYgFXUSgqtM4z0hFGVVfQPasLBda4o1OLFioYeOQqlr4GKrbwjzV7KHexiGdqT7dsXnz+qeFg6U6W/ZBKNgRzWd0MJzSLKiH10gPsog5RSVrfcy0A8HhQxABkVokuULMN3mtBpwdcQb/eYCg6YV3gzOL9NWTfMUz7taPq7kTtxFD9spxl/gyZoOtJURUAuJl28pvDpCE+hr2nmvFeV8z9apM3cFuF0Jd7KYLxqdFkZFtWBz5b4pAAMExD+XvLGEhqX6zxwdFdsYKjnwrmO6Z5DFejv7TYuPLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 13:24:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 13:24:15 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 22:24:11 +0900
Message-Id: <DK7OOBTQZKDQ.QOMIKY35YTVP@nvidia.com>
Subject: Re: [PATCH 1/3] gpu: nova-core: Add function to query WPR2 range
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Antonin Malzieu Ridolfi via B4 Relay"
 <devnull+dev.nanonej.com@kernel.org>
Cc: <dev@nanonej.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
References: <20260721-nova-core-regs-split-v1-0-384fa2a42244@nanonej.com>
 <20260721-nova-core-regs-split-v1-1-384fa2a42244@nanonej.com>
In-Reply-To: <20260721-nova-core-regs-split-v1-1-384fa2a42244@nanonej.com>
X-ClientProxiedBy: OS0P286CA0071.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9f::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ea0b76-a396-4969-cb62-08deea50060d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|10070799003|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xZ36OBbM/NPV4/dPH2cPxtW8Wfc54CSD+f2Oe3jHf230BYFIapSuz7tuYVoARLAFvtCBHOZya+1AUj59JwrAMwTrmaE+4I22+XUi5rza4csaBW38QmrlbT6mDcwnpuTkNn8dgefWkQzPYk5JGCANutQx0cJQAcLJN1Okucnoju/1fBz9cisFOHW6ophrJkTtbOiA6nBQxN2v9Anwz1ihII0V/yhaBcIa8S1xRbDb95k0D5Tv+Wx/Zy2iCbaJgD0KTF//VYCs6qRpLghvdNRsHsb5XrioSC7wrn3iZ3/nJUNFJmMWZLqkArYNhIVTaalZi1i1kR4awi1vL8uH86lDd2kzwkRE0aKPILx0bAzUve9lnU1LYModBoGzMaD6Ynhthy3ylz5My//il8jLaPRh5Qxel9V/U9dxvhh4xmzrLJd8UmVT+0XaOyAK4w4O2fDHrqDaZS9zZajepIbkPH0P1RnTPf8eZkRBJ4E6SxDo3JaALNUUj+ubLIVLEln2zsmMlh5tgf2tko/IPOSCcoPjmiKYGe4eUmic+AsD7BuW4YAwQ4pzT5Y9sDF4TCgv0t8nUqDP/JaM/SG98tVbmuDiA1kztLrLdUoCIuwbFUEW7VwD3AlPbhlPoqaNpN5mIGeWIqKXpIdKIGD86QxUHxPVYcemw7sS4onBIAEk4j8ff/A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(10070799003)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b3FkRnN4a1lqVzZMbHl5dXBRVkVIOEVmcjE4c09GUWZUdGVrc3dtNTNlVXNq?=
 =?utf-8?B?MmNXRVhycHJPREJvdW10SHhWQ2JQQUlxRGlHK3Vkc0YxOWlhWmcxSGhjbW5w?=
 =?utf-8?B?dUFRRnBKQytmV08xcS9JWnhIaTI2aHRaeHJKY2FCdll4L01EeHhHTElkVmpC?=
 =?utf-8?B?STRMWE0xZm01a1Z0MkpCaUdXUEJlU2h4WlBvS3o2c1FwSWtDUXJqSmFabGJR?=
 =?utf-8?B?SzdIam5HNzEwVHAxTGpZb3NiVm9SS3EzdWRTSldaV2JyUVBMTUJKL3dCaXAr?=
 =?utf-8?B?cnM1aVo5MThNNGNPOE5zL3kxSUVLcm5YU3hmaU9GWlBDOEZTK1B0RisxTVk5?=
 =?utf-8?B?NTdJazNVZ2p5a1hQaVVHUGV4VkZ3QTlrSGNGbys3NU51ZmJHankrcTk0UEJ3?=
 =?utf-8?B?aDdkVTFraWZSOCtyWU1QbXpTSEtEWE10V21NZ1RHZVJiS0R6VXB2K3Z1R3FY?=
 =?utf-8?B?N1J4QTRadjlJQ0NMNWZYR01DTE5HRkxqbElmakNOc0F5alFpdmdKUC9HcnVH?=
 =?utf-8?B?Zys2cnpPK1c1VENZOVJWNWpKQ3lhTXB4b0xFMFJta0pSM0Y5c29MTEdYSVNO?=
 =?utf-8?B?NWFHNThyMDBBdFUrcmU2QXF3cGhOdms5YUsvU2ViTXpDRjg5QWltZHN0aXkw?=
 =?utf-8?B?TWtndnAybS90ejMyaFRVMG5UZlorblcxc0luKzVJT2ZteDVNb0ZjMG4yTDdo?=
 =?utf-8?B?T2EzR2I4K0FBT3Q3NkxJZnhLeURnV2pkVG5DNzN1dy80cThQK2paMXFkMGEy?=
 =?utf-8?B?Ym9ERGhFUjk2aVE0em04Nko1Yjd5UDhQQlBKbzJRbS9nVGltdC9RQVprYWRs?=
 =?utf-8?B?MTgvc1UwbXRzVVJQUnYwSjRGeEhiQlI4MGdSVWRWNzgwRUQ2TVJFdXJtNWRB?=
 =?utf-8?B?djhqT00zQ1p0RVpJbFJ5MFhjcWl1WmFRM2ppN1FqKzRTZkk2VWdVVkFiei93?=
 =?utf-8?B?ckFMUEJmUUFhN3BNTWJVOWJnRGFNcHA0WGI1RnphNUpjWVdlNlJ3UUVBWDNv?=
 =?utf-8?B?WnBXams4Y2ZrNTNmRW8yWHlJUHZZaEJNcE82bTFFRWRqamJxenZvRlAyWGRO?=
 =?utf-8?B?K2VvaFI3ZGNnWUNtVWpFdzNjWlhrVjFQdENiOXd2Q2ZaWjFFVzY4aHhEOFdN?=
 =?utf-8?B?Z1phNUdncGNmOWJCalRkRTRkWjJ1V1RBUnczNlJvem93UUhJT1FoWkk4eGR0?=
 =?utf-8?B?R24vSWR4QzVORjFqbXhJWTVLQlIwai9CamVQU05FZ29MVVY5Z25qZTNmZUdn?=
 =?utf-8?B?a2ZtbGFUY0UvRWxJM1ZMVk8yNlZYWWxlQWpXbVF3SCs0NkZ2TnpnZVg5MjRy?=
 =?utf-8?B?VXlWQU5nWFpOYTdtTkdnRFM2ZUxSQk9pYkJhU1EreFBXUXpxMnMwR28rdHBu?=
 =?utf-8?B?VjhZTUh3ZGxrQitmVU5JNElIVzQ2cTR3SjM2SUxrbktSclp3WHYyeFhYUzJ2?=
 =?utf-8?B?azcrNHdsalVQblo4VXNJRCtFYWdOcnFNR2hxcEhJOVZJdmNiRldUelQvNW9m?=
 =?utf-8?B?aHh0VlVDUDN6c2w3Zzk5U1crNG5yZ0gvcExROHRQTkFxQlFIVEFvN3ZFekd0?=
 =?utf-8?B?WmI1amsxeTdUZE5DNC9sdVIvK2JlYSt3VURXM3hzR1AyaFg3UnVUM3NlTm5O?=
 =?utf-8?B?dkZrTWROZjZpUTh1UUxTSnJVdEV6N3hQOHllbkp3NDIrbmpQdDB4eUxhS2Jx?=
 =?utf-8?B?RGRFZUo5TlNBeG9HVnRZVW5xbVRYYUZvaGRGREN5YXRNL29WcFl2ckpGOU8z?=
 =?utf-8?B?WkxVc2dWNFc1RGhYQWhhSTFhVXlwZ2dXTythV01URkpoYzhGcisydHZGWm9K?=
 =?utf-8?B?bWphMEN0cjN5K05ENStNcGRhaUQyeHBXVzVBQlc0d3JYNVJDMVAveU5oKy9F?=
 =?utf-8?B?NkV2cERad1NwVlBxVzFlQWQ1MWpsekZ3emZDZFFTU2RsZVo3a2dOZnZuRXlr?=
 =?utf-8?B?dVY1NkFIOXpJWFFHNmtLMnU3RXRIRzBtY1F0bExDODU1ZktGZ1RRTDhUSzFF?=
 =?utf-8?B?SFg4UzBtb1ZYdVlJMlg1V001RHpnZjRhQ3JYZ05hVnV1dHUwTGltbnh4eEZq?=
 =?utf-8?B?VUppR3VRWTJJREFjUk42RW53b1dwcEFzV05FZWh2MTdlOUtTZVZMenBHazk0?=
 =?utf-8?B?UzczY0xtaHFNR0JkVzcvYlNoNEMyZmlvcHBhVUViR3NHSlIycVVKMVpQUmM0?=
 =?utf-8?B?Z1hPblhUNFYrbFh4LzFDMFd5TW1WZjYraEJhUXlpQi82b2VMRy80UXFjRm9a?=
 =?utf-8?B?ZjBrWGJiM3JhR3BoNDZhaTFJS09FUWd1ZjE0RUdob3loRE1RVnFLMFFiaUx0?=
 =?utf-8?B?TnZvYi95dVRhTW9TMWpVLzduOFBPNVo5d0I4MzV0bnFvWHRzeTFpbVB4S0Fo?=
 =?utf-8?Q?hf7WGHLYRhGtTN/MdjDyvyjeB/N3lzDv4zirFQbv/Sve4?=
X-MS-Exchange-AntiSpam-MessageData-1: m43jlDTF0MZA0Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ea0b76-a396-4969-cb62-08deea50060d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 13:24:15.5581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dv2AL0leUfpnxco0q5Ybo5GVa3nNhw8SLrStrrwNVbSQQuewmBQyypnd5xJ1iMtUaJHNaG8yuvcrKv9+aOP4Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

On Wed Jul 22, 2026 at 12:41 AM JST, Antonin Malzieu Ridolfi via B4 Relay w=
rote:
> From: Antonin Malzieu Ridolfi <dev@nanonej.com>
>
> Create new function abstracting WPR2 region range query.
> Refactor gsp hal tu102 to query the WPR2 region range using this new
> function.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
> ---
>  drivers/gpu/nova-core/fb.rs            | 15 +++++++++
>  drivers/gpu/nova-core/gsp/hal/tu102.rs | 58 +++++++++++++++-------------=
------
>  2 files changed, 41 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 273cff752fae..864a34ca20b8 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -270,3 +270,18 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, g=
sp_fw: &GspFirmware) -> Resu
>          })
>      }
>  }
> +
> +/// Reads the WPR2 memory region registers and returns the range if set.
> +/// Returns `None` if the WPR2 region is not set.
> +pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
> +    let (wpr2_lo, wpr2_hi) =3D (
> +        bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO),
> +        bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI),
> +    );
> +
> +    if !wpr2_hi.is_wpr2_set() {
> +        return None;
> +    }

To preserve the current semantics, let's read WPR_ADDR_HI first, check
`is_wpr2_set` (and early-return `None` if not set), and then read
`WPR_ADDR_LO` to build the range.

> +
> +    Some(wpr2_lo.lower_bound()..wpr2_hi.higher_bound())
> +}
> diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-co=
re/gsp/hal/tu102.rs
> index 29bb17171f56..b3242aaeea45 100644
> --- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
> @@ -17,7 +17,10 @@
>          sec2::Sec2,
>          Falcon, //
>      },
> -    fb::FbLayout,
> +    fb::{
> +        wpr2_range,
> +        FbLayout, //
> +    },
>      firmware::{
>          booter::{
>              BooterFirmware,
> @@ -90,9 +93,8 @@ fn run(&self, ctx: &mut GspBootContext<'_, '_>) -> Resu=
lt {
>              .inspect_err(|e| dev_err!(dev, "FWSEC-SB failed to run: {:?}=
\n", e));
> =20
>          // Remove WPR2 region if set.
> -        let wpr2_hi =3D bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI);
>          let booter_unloader_res =3D (|| {
> -            if !wpr2_hi.is_wpr2_set() {
> +            if wpr2_range(bar).is_none() {
>                  return Ok(());
>              }
> =20
> @@ -110,8 +112,7 @@ fn run(&self, ctx: &mut GspBootContext<'_, '_>) -> Re=
sult {
>              }
> =20
>              // Confirm that the WPR2 region has been removed.
> -            let wpr2_hi =3D bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI);
> -            if wpr2_hi.is_wpr2_set() {
> +            if wpr2_range(bar).is_some() {
>                  dev_err!(
>                      dev,
>                      "WPR2 region still set after Booter Unloader returne=
d\n"
> @@ -144,9 +145,9 @@ fn run_fwsec_frts(
>          bios: &Vbios,
>          fb_layout: &FbLayout,
>      ) -> Result {
> -        // Check that the WPR2 region does not already exist - if it doe=
s, we cannot run
> -        // FWSEC-FRTS until the GPU is reset.
> -        if bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI).higher_bound() !=
=3D 0 {
> +        // Check that the WPR2 region does not already exist -
> +        // if it does, we cannot run FWSEC-FRTS until the GPU is reset.

This comment is reformatted for now good reason iiuc.
