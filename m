Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DE410D38
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825714; cv=fail; b=F4f5f77V0rB6Wq8RP4tjGIi+GVnd4iuMqzFyUtwidn7meMdQ3Sy5Sf2K1TiuBvf24aakY8Cpp89SIy8ITnGEXgZsKWVArYT9/FkxMbt/yQM0LT8uIIg+EVOoiqKGw74V4Ri0/Akp+T1RydvRoTL9z6JKnMAiReRkGOoFWb25EIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825714; c=relaxed/simple;
	bh=xhjRk3+nyfyStOORnzQCvJcgCD8jd2AuCIHe3BCYc74=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=VojPXqYiBV9qRVhB7g+x48cPkT4euSlMuKbDWt05PFck3m6a+lup/AkTjf5ZOWHBdgmAFzVha/OMZYZy7a9lyoRG9ccaDs1VO7bjoR1DOuiPhRb96nlaZWF7M7qKuIMDuyjNO/NDnoNu4LbwqO97+QKGBPJF3uBwy5aE1l9UFOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b/lQgMVw; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b/lQgMVw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzTkOOyENrzwBtFL+fOwlgw0ptw54hYSgVEWFzcT3d2WVWI4XhHLtteGIWVtXv8hPhBxSAyoFKuYY2S7Ja/A9wfW7oHMepZFm4accnBUXrbsF/hJ/LxZiwTpY+4dvtzLKpqQqPUmJKIwnUHF+mXntutzC5hS3o7s/CdRa73FgqQa5Z7HQQhEFZbhCP+80X6flSb9mTjqOC4oOcjvBuNQo5UTmyaW7pAkcTqCQ/tGJpFfDBgmANww0ylVsb1GxinNB+PMsocYaMXSLSUT4iAcOnHZ57nfGdq+Pf/1i6fCtIW2IbLgxES6vWw1kUW7yoV4MHl6jRgplyC8UGlq0FfzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hfzlh/8cITOw7394wShlSHp7CakUf+/XPqEj5vJ5aAU=;
 b=a2e0BhyKFqSGfgPr2b563LvUY93erVWdwfDZ3bHNsgNKhvvjd1eBKoqvHcyh+wxamFWGiLYLnP4Fr/KMIOXb9HxYA87lLPQb1qljhWwTvGAI3qALwzf1I4iF37U5G/fnSx7sXKlfCjgX5J/mzzVSKlhboJAYu9oRz9eq+6ZmJh3uuC4+op70uASSdA6ThAlwo/qb1MsuFudEEPGSg8gwG4iDjJVfWN0ukLOCQnMkf3VA+Swj5nwU1kvNSdqDQXlZLJHpQn8RF/l9keKAa+Rv2PuaClYBWt+XIpIJ8/fL0Zm8gZKf5fYdzjxuz2GUzENSTkm+CiKTejUGwXPxgSt4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hfzlh/8cITOw7394wShlSHp7CakUf+/XPqEj5vJ5aAU=;
 b=b/lQgMVwtzc+JkfCzq/6aESuRqdPK8HmR1o5AEkETvLJ13qdfSYU+bYwRNbrDhhAN8Tl7Ey7bBfWxpmAPQSgabuzphDl1LDwdJDytGz6qXUHPNu4AiHX5Oghf42suCKOBIubIicIaG1T4vXreqmr/kc5jdvh7NxMh12wZNVS0AGAcLKCp3tQ7DLaTvbQEeV7u/kees7sVW9mAu4AoMwRx0c4QMKZ0A/yr6Z1CbGxElhzxo4/VHmBwYysu2ykwKawITowLvTHZxh21WH9Q50JI67a31hhlQ9rErQIoDqzSPd02OSWYTfcvcF30gu4J0LDduL90xCXbKb6GMsphrHwfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:21:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:21:40 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 22:21:36 +0900
Message-Id: <DJMEYQBBBD7D.3G9I5PBPLAKFD@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH v2 4/7] gpu: nova-core: add vGPU preludes
Content-Transfer-Encoding: quoted-printable
References: <20260622194353.1308872-1-zhiw@nvidia.com>
 <20260622194353.1308872-5-zhiw@nvidia.com>
In-Reply-To: <20260622194353.1308872-5-zhiw@nvidia.com>
X-ClientProxiedBy: TY6P301CA0019.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3bf::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 28bcde67-5279-4e04-734f-08ded6aa8516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016|23010399003|56012099006|11063799006|4143699003|5023799004|22082099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	3UzfeInzXAKRZ4rIum96H6M17Xcenf+AGP8YIiFVeHBjRc+XOVsqhX/ZORZ2KN8u9DeC+gEYUZ94AxaoSAbjsG+E4KM0aM+LsiWqI4e7YqyIOepTxRkufJpkmeoJVp7dJ246yfqmoHj2wzo02W0gbqaaUl6+wtnGKSONgoYZnuWlnMb93ChqLeLIZjq9DXAqNcFAa7RPlceEHXrJQXva3P55F5RqbkOGcoKULZG4wLDKz6ZlKiG/+TxdRU/7k1EVT1L5SO0PUKYcI1moxeasIB0feI9UpXAuOa4Sb17YFoimXcMzD0c4VInGt6OGXCvT5+CMeaf88JsUUZIuufWLOSJUJlPU/brDMy/oo0FyFhXDvZSFrD+mvSWTXMfLPNdpa6jjMlH10jey460itIRDO+8ARPF5IpfUIw61t6VXxSf4c+H8uC0Ml3MjIb0K25E+s2rzfI21RTJODDDfn9oZ3j3RqBJt9c1lJG8tDhA06oCScgA4gNzaOPMzshXQcW5sMNK+dmERCDvJZBJIM+ZNpOAVQ0f2nc1ti4r0Takt7VSmTVHZNNXgw3eazBVZMW2bALML+TSwyNBZvb4gz1t9erAKbUettag9A3syzMHT+om9p5kXDJes/LrAD0VlvZn7r3jrbTY3seEQX8Cpcpmz2Jj6TaE8vDGmlNgYfiOPtk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016)(23010399003)(56012099006)(11063799006)(4143699003)(5023799004)(22082099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1poODc4YmorNzJDRVJIZy9INnplK1dYUXVKRmtBRHB5T2o0dndXU3BRc0tZ?=
 =?utf-8?B?YUhucXRudGs4bWxiZ0x5RjVKRGNya04yeW96NHF6RFNRM3pBZTlaWU1XcTVj?=
 =?utf-8?B?eVZiK0Z0RzFtMERLNDJ3NHhrSXFGdmdvRGk1QUtTWFQ0UkhJUmpoemE5S3JE?=
 =?utf-8?B?NlVQVVJKeUtaR3BLdHFDTDZJL2xNSmtwVmd3Rzl3UVdSUHVjOHp2VCtma2l6?=
 =?utf-8?B?NWlsam1PenlyL2JRaEUrK3JtMnV1NWdRaFdnMSsyL2NaZndBcTBXUjJvV1Iv?=
 =?utf-8?B?ZE5iNHVCaHEwa1J5RGk2QS9OVk9VajRKZlJvZDZuaXNvVGRpZ1BuOFJSb1N6?=
 =?utf-8?B?UUxHdGpnbXI1bFJydVprQ0hMMGpuWktvdnRuTGIvejMwNEdIVnliWksrakpv?=
 =?utf-8?B?NlA4SFJ2SWk2a3RGcHRBR3VKbVF1SE42b3cvR2hPVWI1VmlpaGhRak9UVlB6?=
 =?utf-8?B?b3VNdUVsb0YvcUphRnJYTGpCSlZsSDYvS2xhT2prUFFpRmR5aWtOajBqb0Y3?=
 =?utf-8?B?UjAvZlh3eHhMalJZR2Uvb2VLQ0ViblI5WXpCdTlHZnZXTGVwaUNhYjRxbGxT?=
 =?utf-8?B?dlRvVERwMmIwdE9vM2ZBWVNSZy9VelB2a1RqWnJBemluMDYxNmhFU3R6MkpV?=
 =?utf-8?B?T2hEcmxGNS83MWJ3RXVQcGpnMGREVmQvbUgwWnRtd0FaZHNtNXVTZm5aUVUz?=
 =?utf-8?B?VVpOYW5yb08wc3BLL29VdFF4UHhGR3JSNjBnbzhFenZoYkNLWWk1V2xQRFVl?=
 =?utf-8?B?MzdPb0xXTVFJUEVST2FUcHRQN25JSU1WaDRqQ1lWYUh4RWtRSHVNbkV0aHVz?=
 =?utf-8?B?bmZCcCtxZmJDeXNpenQ5MnVmSjU0Zyt2aEJxeGxQb0dmdjBLREFNaldjeXJo?=
 =?utf-8?B?amZaNWltVGZHRldKcE13NWxJb2UxN3BVSnZqOU5GNVpxQTVmRUF6R2pFMTZi?=
 =?utf-8?B?SGNNOTZPK1FMTnlSMkVTL2xuYWRRNlVGUy8yRVArT2I2dHlJd1FiRG15TzZL?=
 =?utf-8?B?K0NFOS8vUWZlU3RYVzkvRVFWZFE3MXU5YnNHaXhZcTB6QUEyM2Rqb1F5b3Vk?=
 =?utf-8?B?S01VYW1HRnlpRmFpSVJGOVR2R25QdThZd0VRLy9wQ1BIYnVHUWhjV1dBQnBv?=
 =?utf-8?B?TTZVOGM2dVd6OGRIeThhb1pSNmhWM0VCVUpDb1hTN0s5VnZYTzNnY01wT2xl?=
 =?utf-8?B?VGFONUxyNWF1Uk5yVFdhSXM3NGM4RVRIb25nbVJRVFo2bTRadzNscHZQbjdt?=
 =?utf-8?B?c0RaMS9zZy9nenp6V004S0pZSVFpeVpURGxoL1AyODZnRG9FSlJpWFFxL1Jk?=
 =?utf-8?B?cnRJYlU2SjdOTjhkMU9oYkQxRmxna2ovaUhWaE5yNDFGMW9waExFaUozVlhB?=
 =?utf-8?B?R2NYM1JHZXhoRk9mL0VhZCtuNkhmdGw5VFBzOVovbnE0NitObDE1S3FIN1d2?=
 =?utf-8?B?UEU0aTgyaEFLdkNVM0o3WEFKbkpicVVlakdTY0hncUlNQWt1cmdXMjJyTHBq?=
 =?utf-8?B?aXV0VDJ4Ui8yNXltK0hKbkU2UC8xUXdOVHdtNkVmNmVMSlN1U2I1S3VCVHh5?=
 =?utf-8?B?L2dLSlVFazAyTnppTzNEYjJvRytZdElCM25nMnNTYktOTDJXZUJXQjhtcGpR?=
 =?utf-8?B?UXFTNmxpT3NvZ2VkWjFVaitwNmdsLy8rSS9oTGdyY01GNW9mRmpKUk9QMWxm?=
 =?utf-8?B?NGNxQzE2TlBUdmxoWHZmNnh6SjJMMHdpWmI0WDlnb1hRNFlyNlNRZDRGbTNY?=
 =?utf-8?B?ZHhlWjRwTDZtSHdzNXBISi8rY0UxRXFnTGU2Q2FZVjRHVWM3Nk5OUmErcUhi?=
 =?utf-8?B?amhFT1pBZHV3emIzcWJLR0pReHhLSm8vMm9sY0xjWlluQXp6T0FwZVJQbUUw?=
 =?utf-8?B?QytMZ3lWYWNhU2lrY2FJRFZNc2NmSnJWdWN2MGhIK0ZvdEtyMzAvMExhUnZC?=
 =?utf-8?B?TThkRnFQb3pmNnlpSHpCbW9HMnUvZmlnZWl0Q0lmVkZIbUFIRTBCQVVuRlZz?=
 =?utf-8?B?NG1QczBrV3JDZnVPMllJaGEwR2E5TTE1T1pwMGdGb1ZYNnZ0a2NqZ1B4Z1Nv?=
 =?utf-8?B?dy9pRWpoRG5qWEYyc2dnSXNZZ3FudHNtaXZVUWFMdnN2Q3J0QmNUU3ZZV3Fy?=
 =?utf-8?B?eTdHcERJaHhibFM2RlBLa3Ruakk1aHN2cC95bHZyQVY5N1VqcUpnOTd3d1Br?=
 =?utf-8?B?aW1FdXprL0RlWENrNWl6K3lHV3pjSU9Nclc2M1dIYTU3YlBJeTRiOFYxOWdU?=
 =?utf-8?B?TzF0cENyR1U2aG1pclVlVk40TldMdGNhVWlwekc3Y1FxMmcwbSthSk8wd29V?=
 =?utf-8?B?NElZd2lhcWYxWGVRdlluR2FKNmRCTGdLSHAzV1JaeUFsc3d2dkt4Zll1eG9x?=
 =?utf-8?Q?Ck0y9j6Pw8q9O1Ai4A3sEZa7RGvBtumRJgoRgzzYkjP/h?=
X-MS-Exchange-AntiSpam-MessageData-1: c8H2ktcsHTlaOg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bcde67-5279-4e04-734f-08ded6aa8516
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:21:40.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +UV/Fc7yxoj2ZUi0pNNlQpPPACWRJyQjsOp1vXjhCSZwXc4x4gM8ZiLy5qcAUCp5r0lAJRbtarYM5m1CiLDxJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449

On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:
> Detect vGPU state before GSP boot so later boot steps can consume a
> stable view of whether vGPU is enabled and how many SR-IOV VFs are
> available.
>
> Introduce VgpuManager to keep the detected vGPU state. The manager uses
> a GPU HAL capability gate, pci_sriov_get_totalvfs(), and the FSP PRC
> vGPU mode knob to decide whether vGPU is enabled for the current boot.
> vGPU is considered enabled only when at least two VFs are available.
> The state is read-only after construction and is referenced from
> GspBootContext instead of being copied into it.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs           |  1 -
>  drivers/gpu/nova-core/gpu.rs           | 12 ++++++
>  drivers/gpu/nova-core/gpu/hal.rs       |  3 ++
>  drivers/gpu/nova-core/gpu/hal/gh100.rs | 12 +++++-
>  drivers/gpu/nova-core/gpu/hal/tu102.rs |  5 +++
>  drivers/gpu/nova-core/gsp.rs           |  2 +
>  drivers/gpu/nova-core/gsp/boot.rs      |  7 +++
>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>  drivers/gpu/nova-core/vgpu.rs          | 60 ++++++++++++++++++++++++++
>  9 files changed, 101 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/vgpu.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 2bf01c2d1175..3b5006750693 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -469,7 +469,6 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, =
bar: Bar0<'_>, msg: &M) ->
>      /// Reads the active vGPU mode from FSP using the PRC protocol.
>      ///
>      /// Queries FSP's Management Partition for the active vGPU mode knob=
 value.
> -    #[expect(dead_code)]
>      pub(crate) fn read_vgpu_mode(
>          &mut self,
>          dev: &device::Device<device::Bound>,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index e5ebd79c9020..646eb6c63c21 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -30,6 +30,7 @@
>          GspBootMethod, //
>      },
>      regs,
> +    vgpu::VgpuManager,
>  };
> =20
>  mod hal;
> @@ -138,6 +139,11 @@ pub(crate) const fn arch(self) -> Architecture {
>      pub(crate) fn pci_config_mirror_range(self) -> Range<u32> {
>          hal::gpu_hal(self).pci_config_mirror_range()
>      }
> +
> +    /// Returns whether this chipset can support vGPU.
> +    pub(crate) fn supports_vgpu(self) -> bool {
> +        hal::gpu_hal(self).supports_vgpu(self)
> +    }

I noticed that this method is only used in the `vgpu` module. How about
moving it there, so vGPU functionality is concentrated under that
module?

You could add an `impl Chipset` block in `vgpu`, but since it becomes
module-local anyway I think we can just create a `vgpu::hal` module with
the `supports_vgpu` method (instead of having it in `gpu` as I initially
suggested) and call it locally. We will require a vGPU HAL for other
things, so this is a good way to start.

>  }
> =20
>  // TODO
> @@ -267,6 +273,8 @@ struct GspResources<'gpu> {
>      // TODO: use different resource types for each boot method, and make=
 the relevant Gsp methods
>      // generic against them.
>      fsp: Option<Fsp>,
> +    /// vGPU state detected before GSP boot.
> +    vgpu: VgpuManager,
>      /// GSP runtime data.
>      #[pin]
>      gsp: Gsp,
> @@ -311,6 +319,7 @@ fn drop(self: Pin<&mut Self>) {
>                      gsp_falcon: &*this.gsp_falcon,
>                      sec2_falcon: &*this.sec2_falcon,
>                      fsp: this.fsp.as_mut(),
> +                    vgpu: &*this.vgpu,
>                  },
>                  bundle,
>              )
> @@ -366,6 +375,8 @@ pub(crate) fn new(
>                      GspBootMethod::Fsp =3D> Some(Fsp::wait_secure_boot(d=
ev, bar, spec.chipset)?),
>                  },
> =20
> +                vgpu: VgpuManager::new(pdev, spec.chipset, bar, fsp.as_m=
ut())?,
> +
>                  gsp <- Gsp::new(pdev),
> =20
>                  // This member must be initialized last, so the `UnloadB=
undle` can never be dropped
> @@ -378,6 +389,7 @@ pub(crate) fn new(
>                      gsp_falcon,
>                      sec2_falcon,
>                      fsp: fsp.as_mut(),
> +                    vgpu,
>                  })?,
>              }),
> =20
> diff --git a/drivers/gpu/nova-core/gpu/hal.rs b/drivers/gpu/nova-core/gpu=
/hal.rs
> index 3f25882d0e56..2116c71242ec 100644
> --- a/drivers/gpu/nova-core/gpu/hal.rs
> +++ b/drivers/gpu/nova-core/gpu/hal.rs
> @@ -27,6 +27,9 @@ pub(crate) trait GpuHal {
> =20
>      /// Returns the address range of the PCI config mirror space.
>      fn pci_config_mirror_range(&self) -> Range<u32>;
> +
> +    /// Returns whether this chipset can support vGPU.
> +    fn supports_vgpu(&self, chipset: Chipset) -> bool;
>  }
> =20
>  pub(super) fn gpu_hal(chipset: Chipset) -> &'static dyn GpuHal {
> diff --git a/drivers/gpu/nova-core/gpu/hal/gh100.rs b/drivers/gpu/nova-co=
re/gpu/hal/gh100.rs
> index e3f8ba0fab33..8e18206961ae 100644
> --- a/drivers/gpu/nova-core/gpu/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gpu/hal/gh100.rs
> @@ -7,7 +7,13 @@
>      prelude::*, //
>  };
> =20
> -use crate::driver::Bar0;
> +use crate::{
> +    driver::Bar0,
> +    gpu::{
> +        Architecture,
> +        Chipset, //
> +    },
> +};
> =20
>  use super::GpuHal;
> =20
> @@ -28,6 +34,10 @@ fn pci_config_mirror_range(&self) -> Range<u32> {
> =20
>          PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MI=
RROR_SIZE
>      }
> +
> +    fn supports_vgpu(&self, chipset: Chipset) -> bool {
> +        matches!(chipset.arch(), Architecture::BlackwellGB20x)
> +    }

The HAL already provides us with a way to match against the chipset, so
let's use that.

If this is moving under `vgpu`, all you need is a `tu102` HAl returning
`false`, and a `gb202` returning `true`.

>  }
> =20
>  const GH100: Gh100 =3D Gh100;
> diff --git a/drivers/gpu/nova-core/gpu/hal/tu102.rs b/drivers/gpu/nova-co=
re/gpu/hal/tu102.rs
> index b0732e53edea..1e2c7bbdb4ad 100644
> --- a/drivers/gpu/nova-core/gpu/hal/tu102.rs
> +++ b/drivers/gpu/nova-core/gpu/hal/tu102.rs
> @@ -32,6 +32,7 @@
> =20
>  use crate::{
>      driver::Bar0,
> +    gpu::Chipset,
>      regs, //
>  };
> =20
> @@ -94,6 +95,10 @@ fn pci_config_mirror_range(&self) -> Range<u32> {
> =20
>          PCI_CONFIG_MIRROR_START..PCI_CONFIG_MIRROR_START + PCI_CONFIG_MI=
RROR_SIZE
>      }
> +
> +    fn supports_vgpu(&self, _chipset: Chipset) -> bool {
> +        false
> +    }
>  }
> =20
>  const TU102: Tu102 =3D Tu102;
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index ff438506070a..6821008d48d9 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -51,6 +51,7 @@
>          },
>      },
>      num,
> +    vgpu::VgpuManager,
>  };
> =20
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
> @@ -64,6 +65,7 @@ pub(crate) struct GspBootContext<'a> {
>      pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
>      pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
>      pub(crate) fsp: Option<&'a mut Fsp>,
> +    pub(crate) vgpu: &'a VgpuManager,
>  }
> =20
>  impl<'a> GspBootContext<'a> {
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 1e0d4793e96d..0a33cf4dd975 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -47,6 +47,13 @@ pub(crate) fn boot(
>          let dev =3D pdev.as_ref();
>          let hal =3D super::hal::gsp_hal(chipset);
> =20
> +        dev_dbg!(
> +            dev,
> +            "vGPU enabled: {}, total VFs: {}\n",
> +            ctx.vgpu.enabled(),
> +            ctx.vgpu.total_vfs()
> +        );
> +
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset, FIR=
MWARE_VERSION), GFP_KERNEL)?;
> =20
>          let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 735b8e17c6b6..2df2f773ec8e 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -26,6 +26,7 @@
>  mod regs;
>  mod sbuffer;
>  mod vbios;
> +mod vgpu;
> =20
>  pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
> diff --git a/drivers/gpu/nova-core/vgpu.rs b/drivers/gpu/nova-core/vgpu.r=
s
> new file mode 100644
> index 000000000000..08fa37d80b28
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vgpu.rs
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device,
> +    pci,
> +    prelude::*, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    fsp::{
> +        Fsp,
> +        VgpuMode, //
> +    },
> +    gpu::Chipset,
> +};
> +
> +/// vGPU state detected during GPU construction.
> +pub(crate) struct VgpuManager {
> +    enabled: bool,
> +    total_vfs: u16,
> +}
> +
> +impl VgpuManager {
> +    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU k=
nob.
> +    pub(crate) fn new(
> +        pdev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        bar: Bar0<'_>,
> +        fsp: Option<&mut Fsp>,
> +    ) -> Result<Self> {
> +        let total_vfs =3D if chipset.supports_vgpu() {
> +            pdev.sriov_get_totalvfs()
> +        } else {
> +            0
> +        };
> +
> +        let enabled =3D if total_vfs < 2 {

I know my previous feedback questioned the provenance of the value for
one VF, but it is fine to keep it if you have evidence that it works and
is useful. It just needs justification. :)

If we prefer to not support single-VF configurations, let's at least add
a comment explaining the value of 2 here.

> +            false
> +        } else if let Some(fsp) =3D fsp {
> +            let mode =3D fsp.read_vgpu_mode(pdev.as_ref(), bar)?;
> +
> +            mode =3D=3D VgpuMode::Enabled
> +        } else {
> +            false
> +        };
> +
> +        Ok(Self { enabled, total_vfs })
> +    }
> +
> +    /// Returns whether vGPU mode is enabled for this boot.
> +    pub(crate) fn enabled(&self) -> bool {
> +        self.enabled
> +    }
> +
> +    /// Returns the total number of SR-IOV VFs supported by this device.
> +    pub(crate) fn total_vfs(&self) -> u16 {
> +        self.total_vfs
> +    }

These two methods (`enabled` and `total_vfs`) are good candidates to be
fused into a single one that returns an `enum`. After all, `total_vfs`
only makes sense if `enabled() =3D=3D true` - if vGPU is not enabled, its
only valid value should be `0`, but we have no way to enforce that with
the current method.

Having a

  enum VgpuState {
    Disabled,
    Enabled { total_vfs: u16 },
  }

Would make it impossible from the get-go to express invalid state.
