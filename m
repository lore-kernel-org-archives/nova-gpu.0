Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012059.outbound.protection.outlook.com [40.93.195.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8703A544A
	for <nova-gpu@lists.linux.dev>; Thu,  9 Jul 2026 05:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783574739; cv=fail; b=aIQM7jjsIzxS7ULfU3Vwkr3JwYSISQAW99YZtJQghuvWnGrv17ekSSOQfmTBFI9Ax/2aSnytxhPzZSzRub6tDIo1w97USFN7mGvFOM4Od69HKCVFfnfNqGIxQIuajECx+IovZRIohmwgQoxRDuvg6elTvrpZXMfavzkQbUbrQ08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783574739; c=relaxed/simple;
	bh=JwVBydvww2YayhltwaVSIHvCPx11ZLxJS75eM2VOlrc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=B+m9uBecr7b9YZ3XrqaTPlciiVaZalTlBPdGthkMBhL1Oa9iVO54zKw8TqE6YyKWoL+cnyWZkrkYdJ2tWuEVDcnVHmMkM081O+JLcnw7f6OlDTQ9SHumzaKDlHVEtpKWjHXOwqWQoiEjmpS5paojkrXUT5Nxup3BwbktrcWlzQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F/7aeprz; arc=fail smtp.client-ip=40.93.195.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F/7aeprz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn6p4csGDmTmoMsk8dZF4w6sxsgJ5NFNYsWEThbultymzuXbi2w2yrxKNLEfFKwcElRjU7S9/wfGnHnp3p+vH+MwOIabY33aIqOqMm0SpIX6JVTLOvuXE9rRbE2wGXkovzPhGpcY6lqJ0/RX7trLXdeVrWBSEUOmutBKOXue7XuxApxaD9gxuOHd5Ti+rJCoIxvsqSqFRFBLY8dAejtV51orKKbBqgprZs+kjKWYxItpkDdXTO0xhaiCCl0CHFLuqcrvdBabfXafGEGDpJI9ibS0jMhA3CQxyUkem6A1BAjsWmFq5UnmpO8kJbY9s/FtHzVgwjLp/Nv6rcX1I7btbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cCj86GGujBPAEXEA5Oar7vjrvDm0WYUBUk+9V6P6aw=;
 b=iOrtWIGk9Q2qjfyNdQI+ZA9xjONXFYBU4ZIG4SM8wgypsIL8WJJoF3+heuXATJ5v1sueYBKJDNci7PR3yJGLpOWJipEjqjluPkBVhMh9+PAMe09K6qtpQUc84P+qN5xqgw2NWZZUco16W4zS5J8Fzt4kflCpaeT7jCAZk+f5wFjmpmFkvCY7oK7jjebbMCvklr4Cci91mwg8Pj9VkkLmeE0yPrugp8oNi1WeA4afP6zR0VCL/G4J2NopcBaX4LkmOh6iFf+t6oUH1bucBuS6O4yKbutEg/8hFrknt+6Vunb+9EiY5hlWWqsPvRtsbDAxBDemF1B+kc1ehCeQoNC0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cCj86GGujBPAEXEA5Oar7vjrvDm0WYUBUk+9V6P6aw=;
 b=F/7aeprzmTjMOlxnRKg/RjE03uUTiILQ5gl8R5Ko/8CyXyiQOasUex1X5LYFUolEXBSc1N9z6IY+3kmh7Y20xH+ClePZQOqIN1gVrDR6eiKyZhObLDlQuCNywYQlxtk/dz6MiLDruMfYwCcIX9+TthzMZMSnd7PQjGFKiQb/Q6wDvLwaCj7TshR6tSYxSBdn736Aj+s1AArpZovrSOTsC69Y2HxgcrMsAQMTe/CAg6QMgGSz7dSwwIpl3mdujBi6kJLShZOQyjdfBIxCDOfSDig1JGU4Xe+93lzRrEh0UidebomTgqOWfqVgvYr0yFMKSXcyEO5iHOkizPojhB1cxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by CH3PR12MB8879.namprd12.prod.outlook.com (2603:10b6:610:171::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 05:25:30 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 05:25:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 14:25:25 +0900
Message-Id: <DJTSH1KINGX5.2LY0DQTNX8DEU@nvidia.com>
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
Subject: Re: [PATCH v3 5/8] gpu: nova-core: add vGPU preludes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260701062622.3499033-1-zhiw@nvidia.com>
 <20260701062622.3499033-6-zhiw@nvidia.com>
In-Reply-To: <20260701062622.3499033-6-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0076.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|CH3PR12MB8879:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7f430d-ea06-4646-d061-08dedd7a7d33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|10070799003|366016|22082099003|18002099003|3023799007|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	zhLj2iQJf47aiIWn0JAnc09DK3z6KBIWii+3wYajlc0DZvuO97Ixf27M6ixMWoLkHqcQEx6tRW1WWs8PELl/E4p135MGaNntId0dp2RmcdUV2hGbqVOis26g1F9AZxVMO2NbelsghZAitRJD8X3ZkRHnIaKRBi61PRROYhEGAKoOXo9VvWCxNodx4l9+4wPfjQYX22MC32+uwIj9Zdu+DiuetnT1PRdfVeinc7mfz5vjZRVRkA6NG/2+wcvMy7yj6l0EZRZnw02nT6czHr74wKyr8nU94rRjqsfwlTu7ANa19PpPvgtwA+aq7ONBZrVlavAcrLGubGHhtAjXTGk8z5+ynONwOUd7yF+YE6i/oo/hmx6AET3+q94rPKh8ACMwJptMkgwJ+KhtoM0SiznGTm+Ga0Z5LFJXbzXX2j3dvoGh5OmqA2Ml4PuOKbWi4i6He+t20ORbe/zf6bTH5HRrh+MPjF+yDEjf5TDke/fo+Tzk9eYQ+Ln96sFOOaF+WYU3lqSQZaRAGkgdmgY4WXA0VNBYxFt/N6BAnIM0M4DROf2IPOr3VtmbeDevaNfFoJrEAHqaJB0ovXqhFuDr7N0VRmv72U/Hl5c9bjRoD5KvusqVqL609emfTOsP6W+LPO3nALnD3StdHlgrKOFOjQOtX1iA4VL7EJsIRZ7m0vVKTIM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(10070799003)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUlzb2ZodGhKUXJTZGQycHB6MkoyY0p0RUhzdFlTTk5LQmVtN3RxMFhBR0dM?=
 =?utf-8?B?bkxnSXFTbTFXUU8zNm5tYnN2Q2hRMUJIWVhSVjNKOGg1TEFHSi9meDBlMVFp?=
 =?utf-8?B?eXpya1NxdG9Yay9GbkhCd3IyVlFqSW05MmVDVEh3N09QeU1NTlZmcDBzbnpD?=
 =?utf-8?B?SEwrUUh5T3hmRE8vc3NRL0toRDhNR1U4MlluTnBRMlc5VTBCMVd6NmZ2ZnFF?=
 =?utf-8?B?T2ZIUTQ5MWNwNGRoT3VIY2ZFb0UrZHErUWZDRVhESHhuU3c2MFBNUmFnR214?=
 =?utf-8?B?NDZWTUNyeGlKam40M25mdEp4OXpUTERMeGkvWjBzcDFPT05ib0tkUjhZeEU4?=
 =?utf-8?B?TmwzUmdGZzRBZEZrWVY2MnphcnI4aTVXek1rejZpT0MzRy9EYjRvbHNESlZP?=
 =?utf-8?B?dHZLK0lrUmcxbFgxbzRsc1JBQS96V2p6d0h3K2tPaExxbDRIZ3JIVTVmbm1K?=
 =?utf-8?B?dCtCTnAwUGpNS3lNR1FWMFFuU3BCc2dZbHFKMDJWcEE1a0dDYWVmdG9aZEpY?=
 =?utf-8?B?ZU93T0x0Qm55TG5RdkkvZGZtRHdDbGNEMW81alM3dXg5NGpvMGNZQzRzSHYv?=
 =?utf-8?B?WERIc3BiZ2FFald4Y3lBbmVsWllFNHY4dnpyNWo4bmVObnJyUE9XOCtJejEw?=
 =?utf-8?B?TG40WWFpWk95Q0xhMGt5S3UrU2V3UnNQb0FWQUkzc1kxd2Nvd3RFV2NBWFoz?=
 =?utf-8?B?MlNveEJUa01valZXZFNJai9rUmVYTGZNUDBxRUdsdWVZbzNUaEYrYi9ld1Vj?=
 =?utf-8?B?cTI2UWpYZ3lVcXlFWTd6aG1JQ21BNzZxR2o0cjJXNWlNVlNjbFcwbGQ5aTl1?=
 =?utf-8?B?RUVCVEd4OFNyNXNiTXlNYm10WHpZaEZSdDZ5TGJ6R2pQaU9EL3NUQVUvMHFn?=
 =?utf-8?B?NlppYzdleDdDTE5SbFJmWFo1ZFhkOXFRVWR2L240ZzhqamZMVHFYZFYyN2o2?=
 =?utf-8?B?d2QzM1A4cHgxbm9mMjdJNFI4MHNxQzVPd0pienhJQmw5OG5QMFoybkx5SkRr?=
 =?utf-8?B?UXRmNEZDcEhmNmxKL280R1pNcjc2VGpSbkYyNmQvTDF4Ylg0clc0VGZrNFNR?=
 =?utf-8?B?Ykl5cTNocjZKdm1mOFhHREgxTlMvOGxDdU5IZ2dDdVo3UFVJZ0diMjZUZ3FK?=
 =?utf-8?B?T2hDbHNNTkd4VUJoYTlxS3g4MEdxa3BGNytFNHlOa2NlM0xzMHk0RmFTbE5R?=
 =?utf-8?B?NDB4SmZyZGJaUVpuYVprSlZndXNJUzllRzgzNlZHNW9uK045Ly93VDJPWk9C?=
 =?utf-8?B?Z2x4ZEkrTlVyTEZMNHBFY3g2SzducTdmQTZHak1kbStWV1hGeGlqVFQ0aE9r?=
 =?utf-8?B?ZGMwWDMrelQxYnd5aVRDVzBHT29hblJhalB0cHJzRTg3Z0FLcTQyY0Z2cktV?=
 =?utf-8?B?TTBNczRpbTZXUkRNb2ViNzZOWUVxek9FWmwrbjM1aGVobjdjalRvcjc2bmxi?=
 =?utf-8?B?ZGNaL2pIdC9XMjB0S28rRnhQdWh0eDFKakVtZEpWSTh2QWhsUUF2MytGejNC?=
 =?utf-8?B?a0xBbExOQ2lIWVFiaXBHUDdBN3duRjVZZmdQRWUyVE1oSVBZUUFEQ2tveXhx?=
 =?utf-8?B?WHhyc0o2Mm91WmJnM045eWtkdjZrVDVjSXhwS0tkR0tpUGdsb0VhSUgzbFpw?=
 =?utf-8?B?dWlQZkV4dnBxMTRWclp0b2pVVTBjbDRjL0lmMEpzRCtFd2ZGQkFyKzU0ZW80?=
 =?utf-8?B?TWVjQlgvYWQ4dWxja0drT0JxYUZHdkJoUTBFT3cwRVNPblNoUmFXc2szYzF6?=
 =?utf-8?B?R1dSSUR5TFVOUFF1UlQ3SmduQnVPWFFhZTk2Y0x6MUcwdXZXT0cya2xMcUFD?=
 =?utf-8?B?cmphU3dMek03dUROYnVmREI2M2tlUTFsMFhQQTdmb0JGNGhHYWNKbU1xZjBk?=
 =?utf-8?B?SlpNelk1OHdFMW1VMXZ1TXhVK0ZuK0tXYkhMU1I1YTk3L0NNZzQ2NlpCLzRi?=
 =?utf-8?B?Q2pXTXptbTd2a2llajB5TFJqMTcwOHR5QWdsRGVUTjgxblFtbCtZV0hHN091?=
 =?utf-8?B?Nno5UFFXOWxrMU13eXh1SzdadWNhSmVTYnJ6ZCtrUEt2TWRzdDN2T0p2UVdp?=
 =?utf-8?B?VUxIRG5hYm5neU1pUGtMQkZTbHNWYk1iTmpORDFuaVVnb3JZcEw3V0o1SEx2?=
 =?utf-8?B?S0pXaWMxQVVPazRrQnpQZmljbjJDTlFFRlR4cUNtNTcwV01iMUEwalpVVWox?=
 =?utf-8?B?djN4bEhpR09mc3ErZVlvNnNLZSthVkFIektwNXJ0djhMOERvMCt1SEFZL2k0?=
 =?utf-8?B?RE43NStDNU52VkQxaEVLd3c4bm1MWU4vK29ISW5paExPSGtBWnc5RDE4WmhT?=
 =?utf-8?B?RDFHNVU2UTJuMjNyL0tSY1pTdGVieFRydmJGUkY1djI1VmxMdjBYUHJsM3pY?=
 =?utf-8?Q?m7pHB+DnRX/6XY8qYk3OC1hcOZ7y57i7Oj+9KiI+zlzOB?=
X-MS-Exchange-AntiSpam-MessageData-1: vE2q2SzXJUh9hQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7f430d-ea06-4646-d061-08dedd7a7d33
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 05:25:30.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2Yv7AjZEv5bWM1KOOPQgx7slNtgdKpN8P9Tko7uLFL+SdkE5C9cj4+VnLH4R5Bg8hkLAF+qderUU22APwJInw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8879

On Wed Jul 1, 2026 at 3:26 PM JST, Zhi Wang wrote:
<...>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index c347558aa8e5..5abab54639a4 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -26,6 +26,7 @@
>          commands,
>          GspFwWprMeta, //
>      },
> +    vgpu::VgpuState, //
>  };
> =20
>  impl super::Gsp {
> @@ -48,6 +49,18 @@ pub(crate) fn boot(
>          let dev =3D pdev.as_ref();
>          let hal =3D super::hal::gsp_hal(chipset);
> =20
> +        let (vgpu_enabled, total_vfs) =3D match ctx.vgpu.state() {
> +            VgpuState::Disabled =3D> (false, 0),
> +            VgpuState::Enabled { total_vfs } =3D> (true, total_vfs),
> +        };
> +
> +        dev_dbg!(
> +            dev,
> +            "vGPU enabled: {}, total VFs: {}\n",
> +            vgpu_enabled,
> +            total_vfs
> +        );

This whole hunk is dedicated to collecting debugging information that we
most likely won't ever display. Can you instead derive `Debug` on
`VgpuState` and use something like:

  dev_dbg!(dev, "vGPU state: {:?}\n", ctx.vgpu.state());

That statement would also be better located in `VgpuManager::new` imho,
right before returning the constructed value.

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
> index 000000000000..d2f311a8b2d5
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vgpu.rs
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device,
> +    pci,
> +    prelude::*, //
> +};
> +
> +use crate::{
> +    fsp::{
> +        Fsp,
> +        VgpuMode, //
> +    },
> +    gpu::Chipset, //
> +};
> +
> +mod hal;
> +
> +/// vGPU state detected during GPU construction.
> +#[derive(Clone, Copy)]
> +pub(crate) enum VgpuState {
> +    /// vGPU mode is not enabled for this boot.
> +    Disabled,
> +    /// vGPU mode is enabled for this boot.
> +    Enabled {
> +        /// Total number of SR-IOV VFs supported by this device.
> +        total_vfs: u16,
> +    },
> +}
> +
> +/// vGPU state manager.
> +pub(crate) struct VgpuManager {
> +    state: VgpuState,
> +}

Just to confirm: right now `VgpuManager` is a wrapper for `VgpuState`,
but it is going to grow further in the future, right?

> +
> +impl VgpuManager {
> +    /// Creates a vGPU manager by querying SR-IOV and the FSP PRC vGPU k=
nob.
> +    pub(crate) fn new(
> +        pdev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        fsp: Option<&mut Fsp<'_>>,
> +    ) -> Result<Self> {
> +        let state =3D Self::detect_state(pdev, chipset, fsp)?;

Do we want to return an error (and make probe fail) if the vGPU state
cannot be detected for some reason? Or should we prefer printing a
warning and returning a `Disabled` state? I don't have a particular
preference but thought it is worth pondering.

> +
> +        Ok(Self { state })
> +    }
> +
> +    fn detect_state(

Let's grant a short documentation to this method.

> +        pdev: &pci::Device<device::Bound>,
> +        chipset: Chipset,
> +        fsp: Option<&mut Fsp<'_>>,
> +    ) -> Result<VgpuState> {
> +        if !hal::supports_vgpu(chipset) {
> +            return Ok(VgpuState::Disabled);
> +        }
> +
> +        let total_vfs =3D pdev.sriov_get_totalvfs();
> +        if total_vfs < 2 {
> +            // The current vGPU path does not support single-VF SR-IOV d=
evices yet.
> +            // Treat 0 or 1 total VFs as vGPU-disabled for now; single-V=
F support can
> +            // relax this gate once the manager handles that topology.
> +            return Ok(VgpuState::Disabled);
> +        }
> +
> +        let Some(fsp) =3D fsp else {
> +            return Ok(VgpuState::Disabled);
> +        };
> +
> +        match fsp.read_vgpu_mode(pdev.as_ref())? {
> +            VgpuMode::Enabled =3D> Ok(VgpuState::Enabled { total_vfs }),
> +            VgpuMode::Disabled =3D> Ok(VgpuState::Disabled),
> +        }
> +    }
> +
> +    /// Returns the detected vGPU state for this boot.
> +    pub(crate) fn state(&self) -> VgpuState {
> +        self.state
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/vgpu/hal.rs b/drivers/gpu/nova-core/vg=
pu/hal.rs
> new file mode 100644
> index 000000000000..e6fb6cec2599
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vgpu/hal.rs
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use crate::gpu::{
> +    Architecture,
> +    Chipset, //
> +};
> +
> +trait VgpuHal {
> +    /// Returns whether this chipset can support vGPU.
> +    fn supports_vgpu(&self) -> bool;
> +}
> +
> +struct Tu102;
> +
> +impl VgpuHal for Tu102 {
> +    fn supports_vgpu(&self) -> bool {
> +        false
> +    }
> +}
> +
> +struct Gb202;
> +
> +impl VgpuHal for Gb202 {
> +    fn supports_vgpu(&self) -> bool {
> +        true
> +    }
> +}

`Tu102` and `Gb202` should be in their own sub-modules, even if they are
small.

> +
> +const TU102: Tu102 =3D Tu102;
> +const GB202: Gb202 =3D Gb202;
> +
> +fn vgpu_hal(chipset: Chipset) -> &'static dyn VgpuHal {
> +    match chipset.arch() {
> +        Architecture::BlackwellGB20x =3D> &GB202,
> +        Architecture::Turing
> +        | Architecture::Ampere
> +        | Architecture::Hopper
> +        | Architecture::Ada
> +        | Architecture::BlackwellGB10x =3D> &TU102,
> +    }
> +}
> +
> +pub(super) fn supports_vgpu(chipset: Chipset) -> bool {
> +    vgpu_hal(chipset).supports_vgpu()
> +}

We typically don't create functions for each hal method - let's make
`vgpu_hal` and `VgpuHal` `pub(super)` and use them from their caller,
like the other HALs are doing - `fsp/hal.rs` is a good model to follow.
