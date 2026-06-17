Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301F12E7F25
	for <nova-gpu@lists.linux.dev>; Wed, 17 Jun 2026 03:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781665695; cv=fail; b=O9g/okBC9owEU0ujxp25/YANGbdy5ewCCowiCPie97zXIs3+ZwBheEqfNnk5p6aPeBbrBfitZZMH9QMMclWJB6q71l4DV1XSnMDRStt0E7qvHT0l4LUtnIuMQhTLEXoLW8t52E9/l5GEOjjK0q2JOnJGUs3AXvtN5ItiAr5QNfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781665695; c=relaxed/simple;
	bh=u//9pPqXBGhgDvCYIxnVdtvtu2EVjZyVEENaFP2tupY=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=c7IaOevYRAnovvc9d0mhbk7G1YZNj3CsxS2TTLP+h6y6/u4OVovPRIrXClVVGVGP/ma/JyPDoFzyheHuTiHhhzsVC+7yaRGoquqQUmuVId05e9ehmuWCUgN6yuRGKay8j31mHTq2yephCRuKQ5LO/TocM4VibOSrinaEeoiXalU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EpKwBkL1; arc=fail smtp.client-ip=40.107.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EpKwBkL1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb6UAdNwy8cG3hec7FeOxY5Xm3QS/ZraMEw8vuH92Vt7XsXWI+8NMXATcvDcdc/1Vsx0fW2DgoLU/NNh0fkFEoAb4VvPicJQelCuq/rklFo9xOkY7lEDAVHGzIC1xGTHdSuY5mMPb2p1hSEBkoQ2EcnuJbiazBOMK0F3Tecg3WpwZgy3JC1Xv9A66ybcYxHsgZfiH3QehqnjqNuQFkECoMb/nywCd8BnbO9GpHmeeogkqNCdCj0QoknQUaWFgb9Wf6EqCdMd6s402VE0lYzolnfpLzt+zCOO7kH63CldZLAuPvqXT3sLvms7iZRjnD2AJkganZT0US4ZQSwF96zS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe4+HRLDXnnWdwOpt9NfpLwAP03MBWYyBLEAGGaycuQ=;
 b=jb+8oa2Si9jpC/U0shCCZAgGbC6AY/2hb0T2JxycIQfUayN4emugJMQVnSvrvc8FOEPM1AbutCCpH/TywrjzegAVasU9JNwXNZKGkzt3U72KCEhtm2+MQ06Xx0TxRp0e0s9dHB6N92wG2m5anpnUPaUYxsbSNYm74HPLgwl6RbGQnQByFW1GD+T4AHTYx63XnwMHRLprH2Dk8hwYz3LIi6Ib6yT+b4igo140qhFumibDjkqz5ewjU3ROScyysDKRF9FWf85GoOntDKN01Orfkj/b+O03Kv1YBN74pwTsoNFE2Ef3IXJyFiV9C6T8X2P+q/GOztSkExSMCeJiFva/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe4+HRLDXnnWdwOpt9NfpLwAP03MBWYyBLEAGGaycuQ=;
 b=EpKwBkL18BED348q+wh1iAhKzngEnGvdT8UuEXnYyLiu2RnJE666EVG2I72LBhmtkvb4Bb0EZuuHGSAL81dxVSKtDVmxUIHctR1JKhAcxbTj1T6HHy4HlyL5LBAdLGGYBlrMy33jUvY2pOL95yFWk3EF8XMAHFHA4xuoZkElqLTp1H6A2lZkgvlarj04gXG7VByaf5XxboO1ta68b0SrUTpUk0XmJGLDuE0O/8YJ8x1BcnR/6DV94WhmZ6fS+Df/iaMV2X4EsTBri97sZjGZaR9voNSYyDf/UXWuuj9sxYP0RCE1vAk741Gs1Iw1mOLr68l3IJPlThYuKH9YoHU+Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8922.namprd12.prod.outlook.com (2603:10b6:930:b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Wed, 17 Jun
 2026 03:08:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 03:08:05 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 12:08:01 +0900
Message-Id: <DJAZRULU1QHZ.2NSTR1ZPOQUSN@nvidia.com>
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
Subject: Re: [PATCH 7/9] gpu: nova-core: add vGPU preludes
Content-Transfer-Encoding: quoted-printable
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-8-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-8-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8922:EE_
X-MS-Office365-Filtering-Correlation-Id: e09fd6b9-49f4-4978-d29e-08decc1da67d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|10070799003|1800799024|6133799003|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4RmkNeJr3AkETNWpC7zXB3XY8pszjpkm96nbJaIzCdfJYm+O//pc8Jkx8pp3PIEwwKSS2+A+avs5vZ0edJ6iyf8K/SV0q/UlXwsRpc8HHnhNgUIz0o2FfrLpkyPjUly5YGXrHlj8DkKsy6MBPCSQMAU1aozWtLmEY9GLBTUGv850ZoYLWwPjbkT7f9Aoy4clSaA0Vs8/Q+E/iiZVcjDyezqUZdkWqosfByymjCR9Xt00syv16CciRqgWk49IJDuYRxPLwNaqKf4IqFKqsj0rU+knllgantl2SlkCql3pUyh0rt0z5RLd5PBZB36nOvgUTdgeLlLmdVWtsmWo1g0gdylsxdb8a1E+57sxvGXseRxRXPczhxGyhLanVCeTAElq+cGOC9HQ7cgYQdrIwfaoLOgVIw83LUpYsKA+nh7e8KujIOFWC+NHB0Hy5+6AMsEQyzI+ebK3bTkCL12btLs8oLmilG1VqjA3h69+9sx9tfEiLMiTkvd9sdksKvDaLaG0oD5hyvV0y+BxVA0Akg3bC0XXJ+RDKcdOY6AXdiQEFeIs69MxjpMZS38ak67A51H4oAwYNoDV+gjNsOe2jrIU9MtpnzLdd5rkK9DOePLB5aTst+CkTiGH5b8JoNrG5UbzVP0ZQPT0vqC7O+4WbrYd97nNFp5V5Fkqc8527t/G3hXcQnzbEXxcJ13PeIf8B1vV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(10070799003)(1800799024)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFBPRmovQ0U4WFJlYU5yK1h5QVEwRkZ0OWtRQkRxZ1N5RXBoMFN1NG8rMkJD?=
 =?utf-8?B?bEMvdWJ3Z0ZEOFVPWFJIZmlSV2Fuckp2bkZ4R2dhUnFqK1ljVm1QNHhqYzNm?=
 =?utf-8?B?MnMzUVR4Qk9IdXBvVFhrRVIyMHh2SWFnRWFFV2hENnQ1cjljNXltY1N3QUk4?=
 =?utf-8?B?Y2x5dHJPTkpBeXRseEoyNW5ScTdvYnVnOCtTOUJITXlXTm9SMGF2NFdFKzhT?=
 =?utf-8?B?M3hMb05qdVlHZFE5a3o1YUxhVGhqZlVKSzQxUHRLL213L1RKcHVCUWpUaExk?=
 =?utf-8?B?Y1RPQUs3QUVsSUFlU3RNQnBKb3paN0RxTkMzdlF1alFTTjZ1cjk4c0hsek9Q?=
 =?utf-8?B?WE0vYlVVdFg3NzE0L1RzUjY1ZDgxVkEvU09PZ1phd2x3VjdTR1dNL3NRTDFZ?=
 =?utf-8?B?RDl5Mms0K3VBQjFBSFlROUdHcVFWaFRUQ0h1bndNc2t5YzREOGZuaDQrUkpk?=
 =?utf-8?B?Y0VZdFJXTzVSNXNSUzhjdVdnaE1TM1AxbFQxVU1qODJxNnVYUi82KzZpOFBG?=
 =?utf-8?B?UEtoYWxmMERtekFOekdnYzRlSWZFaUVHazZRNjMyWjY1MEJaS3kzc2dDcms0?=
 =?utf-8?B?djMwcW9GRWVYTzJQdnd3dUE2TUVKQXZiVEJPd3Q2aVZJUHpTZkU0QTBrTkgy?=
 =?utf-8?B?VVNpMzF3UXNBWjZINjk3S3pmLzFCR3daamhENVVhUjhFWnhacVpkRnkxYkNv?=
 =?utf-8?B?VXR2MjFyWEZlWEpwTGJJbE9jL3JQTEo4dWg0NFMvQTFyT3pEMzhOZzZDOVZM?=
 =?utf-8?B?MFhUWVdEU0pjVzR0Q3RoVC9MSnpUN3VXY0ltYjRreE1Vc0N1RS85Q3FrMGhD?=
 =?utf-8?B?cUYyWjBxdmpjMFJKS2E0dDF4ai9sRm5CSnRkMXJNdUlFSDlxRnFUbmtRNWNL?=
 =?utf-8?B?cUxpQkdMdUYzdVRtRzgxZGQ5eTQ4VFpWMjU3Nk8xRWlMTWpiNGovVHZyUFdy?=
 =?utf-8?B?Ym5hYVNpNW50VEpHamlRTkhXUTZiUHIzSGszMlNaSmp2d1hJakpuM2tEQ2Iw?=
 =?utf-8?B?RnBNUVdSTTErdE5vd21ESGRQQmlPb3IyeG5ZbTZ1ckMrQndTTlVVaVlhT2ZO?=
 =?utf-8?B?c2xpd2d3ZEE3UHRmeUJJNndJYjJPMkNra05NeDZCYVpUbGNxT0NRMzh6c09h?=
 =?utf-8?B?ck04WTZHQUlMOGdvNzFlMU8zOHBJK3ZmMDFNZU5HWUg5L3liTnYvUjlFdkdD?=
 =?utf-8?B?bmJGQ09HNnpiVDh3UmZYQlFWa1VNRnJUSmlJbVBJbU1Xck94MHRKSnRCOTJx?=
 =?utf-8?B?VXZJbTl4WC90Znd6OW1WYWVvZmtmN255di9YdStVaU11b1BwSnQ2ejF0d3Zt?=
 =?utf-8?B?TllIcjBmVkkya2FOWTNQcG1wMzRzellrYUNybDJxcE1va0E1QnY1UnZRWUhQ?=
 =?utf-8?B?R1FOTkF0dzBFVVp0WlhxMFVkSzQ1emRJUWJpT09PNVBnMmQrZFlOQkNiYlgw?=
 =?utf-8?B?UGlOSE5HWTVHdUg4VjN5OHNYUEdzd0dkOFBWbHQxS0JwdEwrdTJwd2t1cmN6?=
 =?utf-8?B?WEgwRWR5Wm01UUJ6aVJPR2tjOWdxT0pEdXFGK2JrYWgydTdGMzk1Z3p4dXlx?=
 =?utf-8?B?WDdiRnhQampRM0MzRDdrZE5PUEJRcGVXWWN1UFVRVW4yb2tXL2NHbWp2U3Jk?=
 =?utf-8?B?VFZ5VXRXSmJNWWh4MjE3WnFvNXdHeGhpbjF5cVZrVlhFVVlaUGpjdC90TEE1?=
 =?utf-8?B?TUdKZW5jM1VQUndUQTI2TU93UElPWWI4VW8wQlM0ZDQrd3BRVm80bW5FVWNa?=
 =?utf-8?B?K2VRT3BrNU90cUdxU2IxTUFvUkRuZ2hCOTl3eFRPRnZpNW0xdDJoNVdpb0ZG?=
 =?utf-8?B?RmNEdC83ZUpDbGZwN3Y0ZkY5dVBVN1hjRDRyZFE0TWY5VHdHaU5WWHI2QTFq?=
 =?utf-8?B?RHkrTkl4d0NmR1pXSlNQZmMyR0JDMXFOMWFDejM4UGFpazhzWGd6TmJ5KzlZ?=
 =?utf-8?B?MjRXR2xCWVZoU1RQd1pybVh4SFJ3cEt0VkpkU1pKNFY5dWV6ZDkyMms4NTlV?=
 =?utf-8?B?UkZhUThSRU4waElLRnVyNmhZTnpOVlg5MndqWFJIRG1mbjNCaDNodWVrdXhs?=
 =?utf-8?B?NU9laVR5YUM3Y0ROS1VjNnZIUXc5ZFVtV1NiTTRsdnlVeFhjbDA4UWRmamRQ?=
 =?utf-8?B?amxWaWFiTnJNMEVRbXlxRlphT0xjeTBpTDJ4bEJZMzFTUFN6cnl4MDM2Z0Mr?=
 =?utf-8?B?REJEK1dWRk01QWc1NzYwZDhWbzJXbEoxdzBIcjhDdWMwcHFXV0JzUXYxUjBE?=
 =?utf-8?B?VjU3Y1ovSk8yNWRQeWNFakkxdi9oeDBoVmdKOHhycEhXRTU4ZWQ5WkxCeFZy?=
 =?utf-8?B?Zzl6S1NGb3kvK1ZZdEp0ckN5MUFDc3BONmFCMzB2TnBrOUxCMnpPbVA4Z3V6?=
 =?utf-8?Q?58YgimQ1yub1Czeg0Bi9LIdaRCKNE70okB07Vfr8rW56K?=
X-MS-Exchange-AntiSpam-MessageData-1: 2igs+RxObAhUnw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09fd6b9-49f4-4978-d29e-08decc1da67d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 03:08:05.5187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1BwVlFBNDv8xlx8vBGuMsMCRkmW46ih9TFFR20NTuAWWs5LBrEJuEuVH+Zqx2umkpcXLl3JEZ2fC4+TTvatYXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8922

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> The driver needs to detect vGPU capability before firmware loading so
> that the GSP boot flow can be adjusted accordingly.
>
> vGPU capability is determined by two sources: the PCI SR-IOV totalvfs
> count (whether the device advertises VFs) and the FSP PRC (Product
> Reconfiguration Control) knob (whether vGPU mode is actively enabled
> on this boot cycle). Both must agree for vGPU to proceed.
>
> Introduce VgpuManager to encapsulate vGPU state detection and tracking.
> On creation it queries totalvfs via sriov_get_totalvfs(); during GSP
> boot the PRC knob is read from FSP to refine the initial estimate.
> Extend GspBootContext with vgpu_requested and total_vfs fields to carry
> this state across the boot sequence. The FSP PRC read is performed
> inside the GH100 HAL boot method, where the FSP falcon is already
> available.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs           |  1 -
>  drivers/gpu/nova-core/gpu.rs           | 24 +++++++++++--
>  drivers/gpu/nova-core/gsp.rs           |  5 +++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  8 ++++-
>  drivers/gpu/nova-core/nova_core.rs     |  1 +
>  drivers/gpu/nova-core/vgpu.rs          | 47 ++++++++++++++++++++++++++
>  6 files changed, 82 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/vgpu.rs
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index ce11efeba37e..c775e12c5451 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -329,7 +329,6 @@ impl Fsp {
>      /// Queries FSP's Management Partition for the active vGPU mode knob=
 value.
>      /// Returns [`VgpuMode::Enabled`] if vGPU support is active on this =
GPU,
>      /// [`VgpuMode::Disabled`] otherwise.
> -    #[expect(dead_code)]
>      pub(crate) fn read_vgpu_mode(
>          &mut self,
>          dev: &device::Device<device::Bound>,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 69569e218d9b..6d8e60dd5292 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -9,7 +9,11 @@
>      io::Io,
>      num::Bounded,
>      pci,
> -    prelude::*, //
> +    prelude::*,
> +    sync::{
> +        new_mutex,
> +        Mutex, //
> +    },
>  };
> =20
>  use crate::{
> @@ -27,6 +31,7 @@
>          GspBootContext, //
>      },
>      regs,
> +    vgpu::VgpuManager,
>  };
> =20
>  mod hal;
> @@ -180,6 +185,13 @@ pub(crate) enum Architecture with TryFrom<Bounded<u3=
2, 6>> {
>      }
>  }
> =20
> +impl Architecture {
> +    /// Returns true for architectures that support vGPU (RTX PRO 6000 B=
lackwell Server Edition).
> +    pub(crate) const fn supports_vgpu(&self) -> bool {
> +        matches!(self, Self::BlackwellGB20x)
> +    }
> +}

Is this needed at all? It is only used in `VgpuManager::new` to
condition the call to `sriov_get_totalvfs`. But `sriov_get_totalvfs`
should return `0` if the device does not support virtual functions,
which is the value used on devices for which this method returns
`false`. So unless we can have virtual functions without vGPU support,
it seems like we can rely solely on the result of `sriov_get_totalvfs`.

Another potential gate is `read_vgpu_mode` - if this always returns
`false` on architectures that don't support vGPU, then we can also rely
on that instead of hardcoding supported archs in the driver.

In case we need to keep this method, it should use a HAL method (see
`pci_config_mirror_range` for an example). But I'd rather just remove it
if that's possible.

> +
>  #[derive(Clone, Copy)]
>  pub(crate) struct Revision {
>      major: Bounded<u8, 4>,
> @@ -278,9 +290,12 @@ pub(crate) struct Gpu<'gpu> {
>      gsp_falcon: Falcon<GspFalcon>,
>      /// SEC2 falcon instance, used for GSP boot up and cleanup.
>      sec2_falcon: Falcon<Sec2Falcon>,
> -    /// GSP runtime data. Temporarily an empty placeholder.
> +    /// GSP runtime data.
>      #[pin]
>      gsp: Gsp,
> +    /// vGPU state (SR-IOV / FSP PRC), behind Mutex for FFI concurrency.
> +    #[pin]
> +    vgpu: Mutex<VgpuManager>,

The `Mutex` should not be needed - afaict `vgpu` is not modified, and we
can get a mutable reference to it while we are contructing the GPU
anyway.

>      /// GSP unload firmware bundle, if any.
>      unload_bundle: Option<gsp::UnloadBundle>,
>  }
> @@ -319,18 +334,23 @@ pub(crate) fn new(
> =20
>              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
> =20
> +            vgpu <- new_mutex!(VgpuManager::new(pdev, spec.chipset.arch(=
))?, "vgpu_manager"),
> +
>              gsp <- Gsp::new(pdev),
> =20
>              // This member must be initialized last, so the `UnloadBundl=
e` can never be dropped from
>              // outside of the constructed `Gpu`, ensuring that the unloa=
d sequence is properly run
>              // in case of failure.
>              unload_bundle: {
> +                let mgr =3D vgpu.lock();
>                  let ctx =3D GspBootContext {
>                      pdev,
>                      bar,
>                      chipset: spec.chipset,
>                      gsp_falcon,
>                      sec2_falcon,
> +                    vgpu_requested: core::cell::Cell::new(mgr.vgpu_reque=
sted),
> +                    total_vfs: mgr.total_vfs,
>                  };
>                  gsp.boot(&ctx)?
>              },
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index f0901bf86258..94cd4a784b79 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,8 @@
>  mod boot;
>  mod hal;
> =20
> +use core::cell::Cell;
> +
>  use kernel::{
>      debugfs,
>      device,
> @@ -56,6 +58,9 @@ pub(crate) struct GspBootContext<'a> {
>      pub(crate) chipset: Chipset,
>      pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
>      pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
> +    pub(crate) vgpu_requested: Cell<bool>,

I think we can do without the `Cell`. Since we own the `GspBootContext`,
we can pass it by value to `Gsp::boot`, which can them modify it, and
pass mutable references to it to the other methods is calls. But it
would be even better if we didn't need to modify this at all.

The problem seems to come from the fact that we only build `Fsp` in the
GSP boot code. But vGPU would ideally query it outside of the boot
sequence. So a better design would probably be to make `Fsp` a member of
`Gpu` (behind an `Option`, as all GPUs don't have one) so we can call
`read_vgpu_mode` outside of the GSP boot sequence and get the definitive
enabled state of vGPU earlier in the GPU construction.

I think this is going to be needed anyway because patch 9 also wants to
pass the vGPU enabled status to build `FbLayout`, but can only do so
*before* we query the FSP about the PRC knob. So it doesn't necessarily
have the correct state.

Another benefit of having the `Fsp` moved to `Gpu` will be that you can
then pass a reference to it to the `VgpuManager::new` and have all the
vGPU stuff done in `vgpu.rs`.

Once we have that, we should also be able to add a reference to the (now
read-only) `VgpuManager` to `GspBootContext`, and get the parameters
directly from the source instead of duplicating them.

I can work on a patch to move `Fsp` if my suggestion is not clear, or
let me know if you prefer to do it yourself.

> +    #[expect(dead_code)]
> +    pub(crate) total_vfs: u16,
>  }
> =20
>  impl<'a> GspBootContext<'a> {
> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index c9fdc8cacedc..e133a92fb67f 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
> @@ -24,7 +24,8 @@
>      },
>      fsp::{
>          FmcBootArgs,
> -        Fsp, //
> +        Fsp,
> +        VgpuMode, //
>      },
>      gsp::{
>          boot::BootUnloadGuard,
> @@ -174,6 +175,11 @@ fn boot<'a>(
> =20
>          let mut fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)=
?;
> =20
> +        let vgpu_mode =3D fsp.read_vgpu_mode(dev, bar)?;
> +        dev_dbg!(dev, "vGPU mode: {:?}\n", vgpu_mode);
> +        ctx.vgpu_requested
> +            .set(ctx.vgpu_requested.get() && vgpu_mode =3D=3D VgpuMode::=
Enabled);
> +
>          let args =3D FmcBootArgs::new(
>              dev,
>              chipset,
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 9f0199f7b38c..6f55a9242027 100644
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
> index 000000000000..c8f1b74037c7
> --- /dev/null
> +++ b/drivers/gpu/nova-core/vgpu.rs
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device,
> +    pci,
> +    prelude::*, //
> +};
> +
> +use crate::gpu::Architecture;
> +
> +/// vGPU manager.
> +///
> +/// On creation, performs platform detection to determine whether vGPU i=
s
> +/// requested (PRC knob + totalvfs for Blackwell). The `vgpu_requested`
> +/// flag may be further refined during boot (e.g. FSP PRC knob read).
> +pub(crate) struct VgpuManager {
> +    pub(crate) vgpu_requested: bool,
> +    pub(crate) vgpu_enabled: bool,
> +    pub(crate) total_vfs: u16,
> +}
> +
> +impl VgpuManager {
> +    pub(crate) fn new(
> +        pdev: &pci::Device<device::Bound>,
> +        arch: Architecture,
> +    ) -> Result<VgpuManager> {
> +        let total_vfs: u16 =3D if arch.supports_vgpu() {
> +            pdev.sriov_get_totalvfs()
> +                .ok()
> +                .and_then(|n| n.try_into().ok())
> +                .unwrap_or(0)
> +        } else {
> +            0
> +        };
> +
> +        Ok(VgpuManager {
> +            vgpu_requested: total_vfs > 0,
> +            vgpu_enabled: false,
> +            total_vfs,
> +        })
> +    }
> +
> +    #[expect(dead_code)]
> +    pub(crate) fn set_vgpu_enabled(&mut self, enabled: bool) {
> +        self.vgpu_enabled =3D enabled;
> +    }

This method doesn't seem to be called anywhere in the series - let's
remove it if it is not needed.
