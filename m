Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010041.outbound.protection.outlook.com [52.101.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA2D2356BE
	for <nova-gpu@lists.linux.dev>; Tue, 16 Jun 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619655; cv=fail; b=PdnlPhwXxFNSY4ITYc4hrFzbnwXAU6Cf3jQ6vLckYnp87/24SQIVpqjJWZn4Wnoz2Hxq4SYC2YgwlnkBw1jNYAPd569N4VvLc2T+w8A7Yar/0rNtCaB9kkGJTpOaVBFsom4/mY5I8Z/fInyzlfg+eF2CHvb661GRNFOeR3G46tQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619655; c=relaxed/simple;
	bh=y3AzaYIHm/pEokdkyKiwZ58gCMTRpCRiEvn4gHKGEo4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=JxbPHkdxjLtwQiPfVLCW8fQDn5sORISt1TnTY01+jXfNi0DS6TSVataN9npgq5MEPzZA+D5Lnux2JhiF5R6P/gZtRRtkHLbu6VHYzjCoUYnMqqK6MCW3YPIacUe5j4DCjU9U/bJACawv8LJrotIfYe1ky0ARsQ4DR/T6xVIIS+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ES0YgcEW; arc=fail smtp.client-ip=52.101.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ES0YgcEW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nv30ZCjTBJaTMLH1S4IKFwaW9Wf858fMI9/OkcS0ga6CIJ65xCYysdEO0KSY7rK/K+EMFedkMpWYEnkHklfSKwxaeFqlG9UvOT1wD8KeIIajQjCVI6M9QQJImYvZBUy3307XtJlopJDl1Ey0Omlx/m8wSE0IQBRIy6bLqhlZcQlFhUIByhjNQNOA1/lqxJhaMT+8kAXVb/ouLRIudvqRyyl0TQm0xcC+DUZthqvTBLyR6S7pJelbv9S4Nj1y1g/99zTvNbwhE2Ggw0uleqLxFGd+sbB/N2XREoyk+N1rLm2G0GfnNqx6ekV59CFeP3JOyyLQtDpbrwxL8KsA5oe1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrlggujLlrPzRxcbhlQedOWOny2zo0fGKpe69UH8lb0=;
 b=PitRZtwHchzYazjZjsytRMCKEvZSclK61yBKorxDLHVqZDlmMeBTzWzbAUTOqQjS/uPh3mkAadw5KzPItVX9pWAcZWNHdTaKLY5eEp//ekoCsF8kECXtwwLBMyhb5uILPO+OGEMIHgtJ41BH9GZKQXPtxhPaN2eyKyeShKmOPbZWnG5ktkjeB5AMfoBLrkF0QbgvjOEcI+ZkxxYC4ygMFmNJ4wuKhPphWcRtI5yH9JlPOoxsBL5iphP0Vd25Q94Zg9dm7kmxIJEE6vsUa5/IykT/M2jvo8KK9vM7JQA1AkbWdv8Z574tww6VInHrhOzUrpCYPyH+eEgAkeAvtL5tIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrlggujLlrPzRxcbhlQedOWOny2zo0fGKpe69UH8lb0=;
 b=ES0YgcEWtq4PoIHD/+zDCZ2E7t78rl/a8/Gh/WqEplJL9+6JNluQEIho1OoQhNmrcoCYzZhdgBEurH4y0rKfFlqYL7uv+mZZbwTy29w6q1cLqXZU4HDEXx6G0xf0KCqq8epw3r8swVXtHzou5v9R64ErXHEhPkQG+uIC1WWz77HQZXQGfd7TDg3iWZb9ursSx4pCaPoCLSkEHlvr/pHABuQfEhsIvx3yNHTAZmOs5Ak9OU56OpT2bUH2UHDC2lnHNVQMtUxBEujf5HdoBq+fLGEZi3K7JgchAJw31j1ZBzWKVONjPJihuLNTsNBzQujY9dVAjL2pW2K78VtAMXFZPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPF916D632A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 14:20:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:20:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 23:20:41 +0900
Message-Id: <DJAJGC4LLOK3.YAX75103O00O@nvidia.com>
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
Subject: Re: [PATCH] gpu: nova-core: reserve a larger GSP WPR2 heap when
 vGPU is enabled
Content-Transfer-Encoding: quoted-printable
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-10-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-10-zhiw@nvidia.com>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bba9ab3-d8ba-480e-4fb0-08decbb2741a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|1800799024|366016|376014|7416014|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	/v53DmZGT0d0ADhho8QlYFL2IT2JO5HGn0hC6NTVD42P/vjGPxYFXDcAU6Yc41vV4kMGVy5j9IU7lUWeE+aokru08inTiX06BOcYceU3zGZSucgi4M6aiiuBLmfDl2a9uNrobUZUTfms176XbmtDtNGn37gpSfLzqKkOByhNcqXZ00G2INmQacoszuhHcMLheKQvD5lsmNs+zdVkF+bFnCBSZHAnstM/ZYcm7Exzu7BEyWfh7xAyTswk1uM6JL4pttLoPi3e2Oa+7CHvpCGOkPQ8K26/FlBtP/roLQQj+XkXbP9qGKMUGG7lHPgT9iRgC4wS17bcf7ak05o8jB9Xz+IeK7zXmk0W+6nSXt9XtPnSXpu7skEVeg8F3EGjGqM2P7hxrqspTrWnIfluIazGK64DvvEfEDU6jHFv1usaun2/hrUx0ZzAq9Pr6moso0b+8SSeON0JXhKX+AWjOJa5aNAfwVja5v23d9uoMBkwwJL86z2smmF1+bHkI7SzxirPyIp6k/bjcQYCaQKGw9VfyL690p33w9J6RQKdAw2NNe2BHnW1cXXfpqPpfnrO3WVYsaQnCMKAzx/JqtgD2LphcQmWXIxIt2hmIj4SW12QuRjTKwL7sOZ+wvs08eh24aadMyW9QI6yY/1c+PigbfVp9fQE53dlaHBqpZ87G8ILLIborZtz+hT537BuDD9hEoAN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(1800799024)(366016)(376014)(7416014)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUU3Tmlac3YvdG5MWWsrT09tQnNibHU4YzliU3lOUENmZkpyT1lUMng0dzJE?=
 =?utf-8?B?SVFSdXlucGtJUjluaW03eXRXcWdVdXRnTWQ4M0hsUzZ4QjJpMjlLYWlvclhH?=
 =?utf-8?B?UUhjQVdHeW1QWjdJaXJNODRIcTUwVnZTVmlJa0FKREI4YnJuU1p1NnZEMXFW?=
 =?utf-8?B?VVExWG1FNUxpaTdFZTJ3cFR4SVRQdUhSdzgrRUVsWXV5S2cvbno2bFhVNzU2?=
 =?utf-8?B?emJrMnUzR2pqM2NLcXlld05KUVgwRGQxT0NiemwyNzhWRnRzVHMzUXdrWDd1?=
 =?utf-8?B?aW5hdTJ0alRkbG1BSVkrc0lrTS8wdU52ZkY3R3hTUEJERmZDV3hEV1ZqZFdX?=
 =?utf-8?B?VmY0Q1JNem8yZzF6RmVURUZEOTNuVXYrdW40KzBjaENmN1ljeHJLZFdaZ0NR?=
 =?utf-8?B?ZnE3SGVSQy9MajhUdEFJaWwrbEQrQWNiMmdETGI4TndxSWFmdkViYjE2NnFU?=
 =?utf-8?B?SjZtd0E5MXhXTFB6T1IyODhaejQvdmt4a1grOVZUdW1aRTZOcytHVTBDK0lJ?=
 =?utf-8?B?Uzlyb2c4bnpuaWhHQTI4SFlmNjRpcWI1YmZGQW8ra1JlQzdlanFJTE9IWUpz?=
 =?utf-8?B?NFA0U2plSmpuZkcvZEd3TUhKZDVvRzBQbGZacFBKREpTbmpUT2VxclpUV0xH?=
 =?utf-8?B?RGowMWZRMTJ0UzFHNXFROTJUVUVERW9GUWZLNS9HUjR6cGgrSmJWNkluU2tE?=
 =?utf-8?B?ZGNNVzVjR0hhS1d1dlBhTktMSzRyWmNBRXEwRnBzOUVoVjZxanVMVXp6cFVy?=
 =?utf-8?B?V3ZaUFVFemFtY2pIeHVOOTlJbDZXN2M2T0s3MGpyWGg3L01RVWVSRGV4NXdM?=
 =?utf-8?B?QlArS0lqOHZSa1pwTXB1Q2VXd1M2eTlBcWVOQWZ3VzY5ZDdVOXQxUHZTTjVF?=
 =?utf-8?B?NDIxVUc5ZzZENTlJVXYyZGRqR1lnUUk5bWp5SWd5QWVMTnZlNkZhTFVIZWV2?=
 =?utf-8?B?VTV3a1VGL2MxSWRlMUQydFJPN3NzM1gzaGNlbklqT1ZJZUhBNkNSSFFMa3c4?=
 =?utf-8?B?NW5JNHM0a3Y3eWtJSUloUFRrTU54MWdFc2JsSk03Z0d6YnVaNUZvUUMxMjRo?=
 =?utf-8?B?cUkwcFVkc1gyMGxVK1k0aEdIR0xjaXNVUmt2R2Yvek54VVlHRTR0dWZXQU43?=
 =?utf-8?B?VDI1bm0rV1VCVEVRb2ZEa3FvZlNLU1FTZUhBL0l2RHN2OXNnRjhGR3liNm41?=
 =?utf-8?B?OFdSNGU5T2dGNUhGOXBTQUZaYk1qRVZVZnZOTWRBWUpWbWZmYmRHWHIxSUJH?=
 =?utf-8?B?U2dnT3RFVVUvTmVFWXlkaHN4M1E0T3lZNm5wenV1c1haUGVrZHVyNUxOK1Mv?=
 =?utf-8?B?akhmL21jdHYxSWVDYk9vMXozOXFISVdnRGMyQ1BxMHpDTFIrMkpTQnd5OW5h?=
 =?utf-8?B?eTMzb2RUTHBFUWVwWWRRWjFMK1pVa2JDM0NUakl0QW15dmVpWkhZTi8wdDkr?=
 =?utf-8?B?M3dQaExzNWEzUjVCRUJPb1d2NjFINUlSMVArZWhaNUQ2M1NoSnNZUWkrWHNV?=
 =?utf-8?B?bXdQczFGV0oxWHJDUXB4SVFJeW1SRkxGMXM2TWFjZ3Z3c3IxNzJkVWdCeEZN?=
 =?utf-8?B?R1Rkc2s3MEQwOTVja0JRMDNETEl2VzVFWlhTMXo3NlVNT3NObG5Ud0hmNzVk?=
 =?utf-8?B?aUZxU3JRTXVuZ1JVVXN2MVlpeWNKVlNLcExiMCszeldrU2thdG1xTkFTdkRx?=
 =?utf-8?B?bWFJaWxDTHhmVDlSSCtCTFh4MjVXRG1HUlFUbG03N0Y2ZmhSNE9HcUNwZjU5?=
 =?utf-8?B?RXp4a3Q5cjVvSHBoRnpFNnF5NHQ4dUM3QXNTcXZuYnpiYlpUQ2FIZTh3YXZt?=
 =?utf-8?B?Q05MWHVOaTNTZnZzWm5HUGxHWldEV21ieXhCMFFGZzVFQTY1TCtiT0w4eW9Q?=
 =?utf-8?B?QjlObktOYUZDbEpOM21GVkJFWUg5Z2txVmV4L3BiWUF0eFJFQVI5aDROWFZU?=
 =?utf-8?B?TXRVTkFSU3dPN1Fia2NiUmowR281c2NaMkpnYkVNZ2crVHJPaGNsTUJvemlk?=
 =?utf-8?B?NnRiV0w5TS9YYmVPMzZ4dDlwUmk0clV2bVl4a0l1Z21KWTQ2c2VRbmRrRTFk?=
 =?utf-8?B?bkdyMDNUemhmcGh5bk9LRkFNcE9jN3ROWTc4aEdsUy9zVXFRNTRrL2g0bEpD?=
 =?utf-8?B?dE53NGhyOFdCWEZLUnVMdmJtd2k1dTdKYURmQm1KT2lqM3VkMm5XSVJRYTY0?=
 =?utf-8?B?WXJGTFlQSWowYXBxWndxMjlKOUt2WHRWVW9ONXZFc3BDaENzWlF6Mnc3T3RX?=
 =?utf-8?B?Ujk0M2s1OEc2NWJCa3F3d3NteW5xam9yeFltVm8wOXpXcXNvUGIvejdMcmcy?=
 =?utf-8?B?NG5wTnpxT1dRZ3h4N1J3cFZhRlJQa1l4dW5UZjBCNXFuSll2MmcwZnBYRHRh?=
 =?utf-8?Q?sWRr256+i5exyg9D5+/9ynkJmduD98nTedk/L0wQlwajz?=
X-MS-Exchange-AntiSpam-MessageData-1: 6o1o5UkKYVvJoQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bba9ab3-d8ba-480e-4fb0-08decbb2741a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:20:44.7968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sr/ePj9Q16owNfD4LIyFFTZBJI1SH8hEasp8c7wjj632H6g/zAUKw5JD4Sb6MA1nXzsZJb41y82fPHdnWRtjUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> GSP-RM allocates independent RM sub-heaps for each VF partition inside
> the WPR2 region. The default baremetal heap sizing is far too small for
> vGPU instance, causing GSP-RM to hit out-of-memory failures during VF
> initialization.
>
> The host driver must reserve the correct heap size before GSP boots,
> because the WPR2 region is locked down by the hardware after boot and
> cannot be resized at runtime. The firmware determines the per-VF carve
> from the gspFwHeapVfPartitionCount field in the WPR2 metadata header.
>
> Select a pre-calibrated static heap size based on total_vfs (174 MB for
> 1 VM, 581 MB for 2-32 VFs, 1370 MB for 48 VFs) and set
> vf_partition_count accordingly. Extend FbLayout::new() and
> GspBootContext to propagate total_vfs through the boot path.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs       | 17 +++++++++++++----
>  drivers/gpu/nova-core/gsp.rs      |  2 +-
>  drivers/gpu/nova-core/gsp/boot.rs | 14 +++++++++++---
>  drivers/gpu/nova-core/gsp/fw.rs   | 12 ++++++++++++
>  4 files changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 725e428154cf..fb4e6aa9fda4 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -171,7 +171,13 @@ pub(crate) struct FbLayout {
> =20
>  impl FbLayout {
>      /// Computes the FB layout for `chipset` required to run the `gsp_fw=
` GSP firmware.
> -    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmw=
are) -> Result<Self> {
> +    pub(crate) fn new(
> +        chipset: Chipset,
> +        bar: Bar0<'_>,
> +        gsp_fw: &GspFirmware,
> +        vgpu_requested: bool,
> +        total_vfs: u16,

`total_vfs` is only meaningful if `vgpu_requested` is true. So these two
parameters would be better modeled using an `Option`, or maybe even
better a dedicated parameter type for vGPU settings? Something like
(please pick a better name if any):

    enum VgpuRequest {
        Disabled,
        Requested {
            total_vfs: u16,
        }
    }

> +    ) -> Result<Self> {
>          let hal =3D hal::fb_hal(chipset);
> =20
>          let fb =3D {
> @@ -236,8 +242,11 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, g=
sp_fw: &GspFirmware) -> Resu
> =20
>          let wpr2_heap =3D {
>              const WPR2_HEAP_DOWN_ALIGN: Alignment =3D Alignment::new::<S=
Z_1M>();
> -            let wpr2_heap_size =3D
> -                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?;
> +            let wpr2_heap_size =3D if vgpu_requested {
> +                gsp::vgpu_fw_heap_size(u32::from(total_vfs))
> +            } else {
> +                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?
> +            };
>              let wpr2_heap_addr =3D (elf.start - wpr2_heap_size).align_do=
wn(WPR2_HEAP_DOWN_ALIGN);
> =20
>              FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOW=
N_ALIGN))
> @@ -265,7 +274,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gs=
p_fw: &GspFirmware) -> Resu
>              wpr2_heap,
>              wpr2,
>              heap,
> -            vf_partition_count: 0,
> +            vf_partition_count: if vgpu_requested { total_vfs as u8 } el=
se { 0 },
>              pmu_reserved_size: hal.pmu_reserved_size(),
>          })
>      }
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 94cd4a784b79..921b92c9eb92 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -27,6 +27,7 @@
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> +    vgpu_fw_heap_size,
>      GspFmcBootParams,
>      GspFwWprMeta,
>      LibosParams, //
> @@ -59,7 +60,6 @@ pub(crate) struct GspBootContext<'a> {
>      pub(crate) gsp_falcon: &'a Falcon<GspFalcon>,
>      pub(crate) sec2_falcon: &'a Falcon<Sec2Falcon>,
>      pub(crate) vgpu_requested: Cell<bool>,
> -    #[expect(dead_code)]
>      pub(crate) total_vfs: u16,
>  }
> =20
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 2981d02d15ad..7c1f3f962fbe 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -111,7 +111,13 @@ pub(crate) fn boot(
>              GFP_KERNEL,
>          )?;
> =20
> -        let fb_layout =3D FbLayout::new(ctx.chipset, ctx.bar, &gsp_fw)?;
> +        let fb_layout =3D FbLayout::new(
> +            ctx.chipset,
> +            ctx.bar,
> +            &gsp_fw,
> +            ctx.vgpu_requested.get(),
> +            ctx.total_vfs,
> +        )?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
>          let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> @@ -138,8 +144,10 @@ pub(crate) fn boot(
> =20
>          self.cmdq
>              .send_command_no_wait(ctx.bar, commands::SetSystemInfo::new(=
ctx.pdev, ctx.chipset))?;
> -        self.cmdq
> -            .send_command_no_wait(ctx.bar, commands::SetRegistry::new(ct=
x.vgpu_requested.get())?)?;
> +        self.cmdq.send_command_no_wait(
> +            ctx.bar,
> +            commands::SetRegistry::new(ctx.vgpu_requested.get())?,
> +        )?;
> =20
>          hal.post_boot(&self, ctx, &gsp_fw)?;
> =20
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 14424a2c2d83..2f3cbc5d5114 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -101,6 +101,18 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coh=
erent<GspMem>, count: u32) {
>  pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D
>      num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
> =20
> +const GSP_FW_HEAP_SIZE_VGPU_1VM: u64 =3D 174 * u64::SZ_1M;
> +const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 =3D 581 * u64::SZ_1M;
> +const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 =3D 1370 * u64::SZ_1M;

Do we have a source of truth for these values? I can see definitions for
`GSP_FW_HEAP_SIZE_VGPU_DEFAULT` and `GSP_FW_HEAP_SIZE_VGPU_48VMS` in
OpenRM (meaning we could generate bindings for them), but cannot find a
reference for `GSP_FW_HEAP_SIZE_VGPU_1VM`...
