Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83A2345CD3;
	Wed,  3 Jun 2026 05:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780464219; cv=fail; b=Hq7UGsyRC34GiBaSm6NNGP5xjv2CJXKVv1DHIHfkGkNpJBbTNrM4ky6lvQTCP1VoN52S7W9cXXg8U/J8B3S064KuJxQgDFFjXSfKftAnBnkeON/hJk19skOKjmVf9q3i6+kJkAypooj1Kaq0lHzGKJQ44KqFuXNHKTUFyoUWEmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780464219; c=relaxed/simple;
	bh=wPonn6aoV7JxYwfHKkA6iVGFD73nF+UjhOuWevQvJcg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=JiDDsULBo9fzjZpeWEHGo54dWtln7BK+G5tXulVKK+COP4U86clxn18Vn8qGJlNG+4KX39dkqSVZOdoQHaVU8hB5GtXzw39f2bX9jdIetSd9okkVwbMGRRIYg7zsGwQJIH0zVvunpO7KoVf3jR23wGRwtc+Ew/MJ2Yd2hIsBPH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qymTjhTp; arc=fail smtp.client-ip=40.93.198.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qymTjhTp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1Zp/kxk1y8qCfWEXE6Bs4GbYNJGCFjJoWusQyKfZ5eLWc6//nmNhIPbQszSzaeRl9Nkq5+VHaa2v7jv64ikCQSyErWfigOQj9H6NB91/RJLlVBekT62r9WFfHFgQQP04py+rzobC3FqmfP9ixHdaJFGeWgNDU2wFo8ITKxV+NgKq28Na4Uzx+pxYDqrK3G8nuXew6LLkhOH++zt9lBXXEnx2Z4YqgGBmbZfp0VdaNHQ6s7qo/eQ1Ng8r4xP0LAYGKZGOt5T0DLk+M/dcNisdbb3FehzordeuH9ZZT+LNPXkHYY54Ohdl+6HjSxVLl8RnbESzJya4vo6X+9BODqVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFgfj1OiqysyNWjVL/SmdS3XXNAdGHpVPtuIQa/YMw8=;
 b=qcZHhvdk3e+4azIuRAQQhiWP22mJ6bQKrLJgZk6DwsWSbHMGU2egXCQutX8KsKJ1MTQ0f8NuCjA7wqntpkGHPumpw9FgK2iyjb+4QsJ97dWIWl4vGwfXb+Q6ZgX8w1a9TB5+z3ezodQiWfkVXiTvYwD6o2jdn6TXzV82mx48PEF/8wiotJHf3Ds5gvzLKBSKRdf35El02gj9hSetgvpZBGcufHj8CpPHDeYkCi4q4BglZU/CKgYGdLVEsfpCsFantuK2KHAqZv7qlETp783J4p4NhfyXcPFmU22trtwwb5dCDdkaqMZHBT53vOipLO1zK/7n7jqtJLQ6zKyZM7wT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFgfj1OiqysyNWjVL/SmdS3XXNAdGHpVPtuIQa/YMw8=;
 b=qymTjhTpa6yNgVEKfJrj+PAiBCT2Mhls3sIWhTTxG5pG/0XtQbMqJ27Vg8cu+ig7rvzZ61ZSMHITnxiWL6E6A0VAP3lXLI2kqAWG02bTpwRdQWREybl1sjXqT1o2kvvosQZhpO9YLwC9clRxlFwDuxpiaeyQuZ+yja09EaeYENUAwb3tPsU4rtMMA8Y+sgEdH/G5IH25WvmWNZ19XAKiKh8rlbSIpNjTTks+loNvdT1eVqWskCeWhOvHiJRWpZMQ82wZMNtIPXGlTNgu43rVfE0e0Ac8Y6l4rXL/p1cElUz+S4+KK1UzMU71BqITXbN988yl24OHKCRIXIYzKMa8pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Wed, 3 Jun 2026
 05:23:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 05:23:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 14:23:28 +0900
Message-Id: <DIZ5VXHHKNPN.2ZZGLL12FHVH5@nvidia.com>
Cc: <sashiko-reviews@lists.linux.dev>, "Danilo Krummrich" <dakr@kernel.org>,
 "John Hubbard" <jhubbard@nvidia.com>, "LKML"
 <linux-kernel@vger.kernel.org>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Gary Guo" <gary@garyguo.net>, "David Airlie"
 <airlied@gmail.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alistair
 Popple" <apopple@nvidia.com>, <nova-gpu@lists.linux.dev>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>
Subject: Re: [PATCH v12 19/22] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <sashiko-bot@kernel.org>
References: <20260602032111.224790-20-jhubbard@nvidia.com>
 <20260602034042.7C26E1F00893@smtp.kernel.org>
In-Reply-To: <20260602034042.7C26E1F00893@smtp.kernel.org>
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dba591-c675-472a-0284-08dec1304031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|7416014|1800799024|3023799007|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UqwRLawKwvky6ueiGkSRJg1zSjZzP5w8LMTTCE/pBVOAhFl/VKaeQa/ayZZ224Qu++4GeYym7AYJcG1Kp602Gx3AztZXv8dLG3y40k8LvpN2T9YHpRhfqHtq0SfSh5R5HtbyTYBzYmGF5e/6QfuyXf7As40CTCW12tYSv/k1sCiOSoGrMZTjR7ySRQmGW1MFz327KgO317vUxaOv2qxT+Ew8Hhjuy39dDIFe/UJVL9V52PDOWrUUsCydV4AIm7BerlmloFZxqAfzvgVUDaahHx4M4Fnk+0h1njNyNTSIpj/Vuu/GEui6rp/0s5qLfS4vFX2dg7bPmCvG2RGXF05Cyr6/RvJqgU/HNseUj+YdlrNa1794DfjdeGvK2PruRGMubtE8xU7HiK+PVeUEWWRCimj2kdCARoMqOlLtmqsDgcUJaVs7BslMmGy1lAEG5gvNER9lZGBra7MqbqXLV/uq4W1/XQMBXznFK7kEXwyiJWcCcVWMAqJ1fvRPeyzZ1EmzcilxugrTnOxjG+JRDuC57WelGpKC8qSwYUGiY6toY43v2KOoePYzdBCJ8rvpH5ww8QkP4/xTErK/HHlj1wVxyEFyGLL0VtxOwxEEbN/Hxm/v8ErX6fCX1WvxXUhPzCR5hkSCduHBzGAljqTpShqsRC+hmCVyUi+Db+WiUYvgReUOqKBoVY7N1qDpqLQ0sST/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEEyYUE0NlVacUErVkJjTjJPUjRoWFdoTW41TmxhZWIyU05TNG84L0dpeFBj?=
 =?utf-8?B?YjRIN1lvLzlkNDVoWmRNM1FjckFiZ2ZCRnk2VE45WVFoT0FybkhnYWhUYnpo?=
 =?utf-8?B?TzY3bHJraWtTMGRETFE5R3Q4dUZobTIvd0RtUzR2NE1vZnI0czJhVzh3OHBr?=
 =?utf-8?B?dmhSZDQ5TmNVWE1uSUtwV0NoWGxReHhvdkhuV0tsaVlUVCtveTBYRXpyY3dw?=
 =?utf-8?B?eWcrc2ZNVWpWMzg3djdEc3JTOHUyNUtPWkhjTkphU1BPZXFzVXFadTJjd2dP?=
 =?utf-8?B?WjdVWlRoNjN4a3lUNGNLQ3VIc2lVdWpINWpqMzZyR0Rjb3hHS0NQYW5NVWVZ?=
 =?utf-8?B?MlF4Qzd6UFpFaW9SS0dXTDNhMGxyaXR4NmEzd21YeTJhSU5HKzRkbFptSXhY?=
 =?utf-8?B?dnBMcWtNZWUyQjNwemJDNmxMQU5GTGZqZDhZbTJpWmRwRDlob1R0TnNxR0pT?=
 =?utf-8?B?ZnFlcFg4ZzY5NHJTZTdjSzg5RDR1aXRnRU1VMGluZ013aUhWSUIzQWVSVmQ2?=
 =?utf-8?B?bUgrdHhqVlBmSHpXRk9LVlIyOCtwTWhGa0xkOWo3NktHR3hOSCtlVlFHZVVD?=
 =?utf-8?B?cXFjSEo2U2pqYXQrSndlaVFrMFBuT2k5ZmxaWkJLSHNTdGxyelNDOFVZQmtq?=
 =?utf-8?B?QXczNitZUFY4eTVQbldHZEFpVzRVR3c2bmxseGk2RElKWmx2SDBLM25PVHBM?=
 =?utf-8?B?eXUyOWJwU1c2amxwQXRKdmRhYzRnWVRoZTNaaE1CK1FuT2RIV29SL3djZCsv?=
 =?utf-8?B?WS9BMG93VzEvMFlyelFEUDlMalZTNFJkYUd0Nzl4Q0RyNEtWT2dhWTVNeDhm?=
 =?utf-8?B?elJVRUh0WkVrUUx4TTlzNDdaSTJBcjlEb01uZncrazlWWm1DNER0b3k0eDR4?=
 =?utf-8?B?THNzYWJhbFkyeThUMkU0eVdnd1JIKzBOblM0aGY0MmdmOVpZaFB2UCthTElY?=
 =?utf-8?B?MThSbTJyRmkzTldJVytSZFBlZ3JGRzFlak5NMnpwRWtiNjRSb1M4ZHpURkx3?=
 =?utf-8?B?K2RFYTFZSzNsc0NQQXR2QVNuNjZWRmpud21Sb2tVZTZEY3RmQjNBOVU4Ulcv?=
 =?utf-8?B?ejU3UmhtL0xCWmVoMTVzdVZzSXJLSHh3QlVUZG1DUnJEaVJsZ1BVc1N3VS9h?=
 =?utf-8?B?Tmoyc3RLbVl2ZVFnMlliSVBGdG5QRmZMd0tqRzFXTi8yZ3VIN2F3aWl1dWVQ?=
 =?utf-8?B?TUl1Y1F2NGxpTXVKR3ppVGU5TFlrd2ViaHFWL05oQ3VWUTBWckliSytiYW9O?=
 =?utf-8?B?Um03ODFXMENveE4ycDBGUVV3dno5eHZVMi9Oc2J3akE4c3Z5L2JyY1JMWVZE?=
 =?utf-8?B?Sk1Id0d5TWZzTk9iV1lOWGVsVW4zRDRhZHpFZnlCMWlOdGh6cVlJMEFnakVx?=
 =?utf-8?B?OXowRFNrbFRXNUtPbWdoWngxL28wL2tiT1VNdjhSQkthVzVQU1JlQmFjQWJH?=
 =?utf-8?B?dDBxS0FlUnJzZlZXSWxGU2JvSDJONTIxeXNBb3IvRXQwMTF3T1B2UjBybGQz?=
 =?utf-8?B?M0ErMUVDU1lUSjlVVUhpeXVycXprbFRzeU90L0hObk51Mll0UzVudXhYRFhE?=
 =?utf-8?B?RzZLZTRNUVIyS1Mxd3kwcW5aTVdzejFlQXZ2T0IxL1ROb1FsdVFBc2lROCtJ?=
 =?utf-8?B?MEU1SEY0Nk9aZjhici9yZXZhbVMvN3RoWkpYcjJTbkhiaGFUMEMwWHp1Rkxk?=
 =?utf-8?B?b251ZzVSd202Tzh4Wnl0Yklmb0k1WnVyeEZDVUFFVEdlQm1NS1VXU2lWTUY4?=
 =?utf-8?B?d1diMlo5cVdYR0RuZmJTc2hHUktSb2Z4U0FGRStDa2xsMUVqbzVCZmRId3dW?=
 =?utf-8?B?ZTZUVnI3OWNGNG5LK0YvSTRSZjFETDZIZzNuNDg5ZjkvVEY2aGNoa1YwenB2?=
 =?utf-8?B?YTEwYzdvVnBqVFhFNUJKWE1JOS8vU04wUk92SWNIQkRITkFpaks4R0hVem55?=
 =?utf-8?B?WnpCMUVZalhCZ1RNaUdienpSdkJYOGZHM3RGN2ZIeEVLWElkUWU2VWY0VDFT?=
 =?utf-8?B?Z2NpK3Z2Njd6Wkl4ekJpbGQrM2dnWjhzWEF0VXJQcitBOVB3SHgraGVmbVM4?=
 =?utf-8?B?ZWpqMDhqelJlenpKVFdjbzJoNk1vbjhMNkRtb2h0Mmk4aEdHZlM1d3dUa0Rn?=
 =?utf-8?B?c091UVFXWkt3OFN0a3dFSnI0RmNWQ2VKZ2JwekRaWk5iZWRtL0F5OEZPTkJL?=
 =?utf-8?B?dExSTlVnYlNZdUIzN3BpNUM0VU43N3NEVC9oYWNzMkdNQ1FBN080N25nWXRG?=
 =?utf-8?B?R0Z4ZWZ3bmhVZXE1cjlwR28vVHpHMmNqclBIQm9pa0hyVC9qWE0zeUFDWnla?=
 =?utf-8?B?Z3JIaUNadjlYSUJqWEhoSjQ3MGNiVldNWkNGVWFleWJ1Qjl6dGs5Tldkc3k0?=
 =?utf-8?Q?PJ12fKhA8yRdX9apzHgFiHRDTAorNHoZ453//GQhSHHAw?=
X-MS-Exchange-AntiSpam-MessageData-1: nHyMM9/gfL4l3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dba591-c675-472a-0284-08dec1304031
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:23:31.5159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGwl0r7bFqQSa57Nd3MP60t/El+qldJK5z0TarenVYPYhZmV1R+cx0kahfyjZoLjcuHcnxjVQZ7/u4Y+ZDodkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412

On Tue Jun 2, 2026 at 12:40 PM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] DMA Use-After-Free of FMC boot parameters during initialization
> - [High] Missing little-endian conversions in hardware payloads breaks bi=
g-endian hosts
> - [Medium] Kernel stack overflow risk due to large struct passed by value
> --
>
> commit 42c5f0e39c2bb0bc87a3f8df25554d04f00a3e69
> Author: John Hubbard <jhubbard@nvidia.com>
>
> gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>    =20
> Build and send the Chain of Trust message to FSP, bundling the
> DMA-coherent boot parameters that FSP reads at boot time.
>
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> index 67cf83aba83c6..352ef7683cf2a 100644
>> --- a/drivers/gpu/nova-core/fsp.rs
>> +++ b/drivers/gpu/nova-core/fsp.rs
>
> [ ... ]
>
>> @@ -113,8 +190,65 @@ pub(crate) fn wait_secure_boot(
>>          Ok(Fsp { falcon, fsp_fw })
>>      }
>> =20
>> +    /// Boots GSP FMC via FSP Chain of Trust.
>> +    ///
>> +    /// Builds the CoT message from the pre-configured [`FmcBootArgs`],=
 sends it
>> +    /// to FSP, and waits for the response.
>> +    pub(crate) fn boot_fmc(
>> +        &mut self,
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &Bar0,
>> +        fb_layout: &FbLayout,
>> +        args: &FmcBootArgs,
>> +    ) -> Result {
>> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chips=
et);
>> +
>> +        let fmc_addr =3D self.fsp_fw.fmc_image.dma_handle();
>> +        let fmc_boot_params_addr =3D args.fmc_boot_params.dma_handle();
>> +
>> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END =
- frts_offset
>> +        let frts_offset =3D if !args.resume {
>> +            let frts_reserved_size =3D fb_layout.heap.len() + u64::from=
(fb_layout.pmu_reserved_size);
>> +
>> +            frts_reserved_size
>> +                .align_up(Alignment::new::<SZ_2M>())
>> +                .ok_or(EINVAL)?
>> +        } else {
>> +            0
>> +        };
>> +        let frts_size: u32 =3D if !args.resume {
>> +            fb_layout.frts.len().try_into()?
>> +        } else {
>> +            0
>> +        };
>> +
>> +        let msg =3D KBox::new(
>> +            FspMessage {
>> +                mctp_header: MctpHeader::single_packet(),
>> +                nvdm_header: NvdmHeader::new(NvdmType::Cot),
>> +                cot: NvdmPayloadCot {
> [Severity: Medium]
> Is it intentional to construct this ~868-byte FspMessage structure on the
> stack before boxing it?=20
>
> This also dereferences and copies the 816-byte FmcSignatures structure
> (sigs: *self.fsp_fw.fmc_sigs). Doesn't this bypass the optimization in
> FspFirmware::extract_fmc_signatures() which avoided building FmcSignature=
s on
> the stack?
>
> Could this contribute to kernel stack overflows? Might it be safer to
> initialize it directly on the heap using KBox::init() or KBox::new_uninit=
()?

Ah, I've just flagged the same thing in my comment. Very nice that Sashiko =
is
able to catch these.

>
>> +                    version: hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)=
?.cot_version(),
>> +                    size: u16::try_from(core::mem::size_of::<NvdmPayloa=
dCot>())
>> +                        .map_err(|_| EINVAL)?,
>> +                    gsp_fmc_sysmem_offset: fmc_addr,
>> +                    frts_sysmem_offset: 0,
>> +                    frts_sysmem_size: 0,
>> +                    frts_vidmem_offset: frts_offset,
>> +                    frts_vidmem_size: frts_size,
> [Severity: High]
> Will these native integer types be correctly interpreted by the little-en=
dian
> RISC-V FSP/GSP processors if the host architecture is big-endian?
>
> Because the struct is laid out in big-endian byte order on big-endian hos=
ts,
> won't the little-endian hardware swap the bytes when reading, resulting i=
n
> incorrect sizes, versions, and DMA addresses?=20
>
> Should explicit little-endian types or byte-swapping (like .to_le()) be u=
sed
> here to avoid breaking driver initialization on big-endian hosts?

Non-issue as Nova is little-endian only.

>
>> +                    sigs: *self.fsp_fw.fmc_sigs,
>> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
>> +                },
>> +            },
>> +            GFP_KERNEL,
>> +        )?;
>> +
>> +        self.send_sync_fsp(dev, bar, &*msg)?;
>> +
>> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
>> +        Ok(())
>> +    }
>
> [ ... ]
>
>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp=
/fw.rs
>> index 0c54e8bf4bb3a..558b37863f00a 100644
>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>> @@ -934,3 +934,67 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
>>          })
>>      }
>>  }
>> +
>> +#[repr(u32)]
>> +pub(crate) enum GspDmaTarget {
>> +    #[expect(dead_code)]
>> +    LocalFb =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
>> +    CoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT=
_SYSTEM,
>> +    NoncoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCO=
HERENT_SYSTEM,
>> +}
>> +
>> +type GspAcrBootGspRmParams =3D bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
>> +
>> +impl GspAcrBootGspRmParams {
>> +    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self>=
 {
>> +        #[allow(non_snake_case)]
>> +        let params =3D init!(Self {
>> +            target: target as u32,
>> +            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMe=
ta>() }>(),
>> +            gspRmDescOffset: wpr_meta_addr,
>> +            bIsGspRmBoot: 1,
> [Severity: High]
> Similarly to NvdmPayloadCot above, will these native integer types be
> correctly interpreted by little-endian hardware on big-endian hosts?
>
> Does this struct require explicit little-endian types or byte-swapping to
> avoid accessing invalid physical memory on big-endian architectures?

Ditto.

>
>> +            wprCarveoutOffset: 0,
>> +            wprCarveoutSize: 0,
>> +            __bindgen_padding_0: Default::default(),
>> +        });
>> +
>> +        params
>> +    }
>> +}
>
> [ ... ]
>
>> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-c=
ore/gsp/hal/gh100.rs
>> index b25970dd4561d..f41f3fea15ff2 100644
>> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
>> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
>
> [ ... ]
>
>> @@ -39,17 +42,27 @@ impl GspHal for Gh100 {
>>      /// the GSP boot internally - no manual GSP reset/boot is needed.
>>      fn boot<'a>(
>>          &self,
>> -        _gsp: &'a Gsp,
>> +        gsp: &'a Gsp,
>>          dev: &'a device::Device<device::Bound>,
>>          bar: &'a Bar0,
>>          chipset: Chipset,
>> -        _fb_layout: &FbLayout,
>> -        _wpr_meta: &Coherent<GspFwWprMeta>,
>> +        fb_layout: &FbLayout,
>> +        wpr_meta: &Coherent<GspFwWprMeta>,
>>          _gsp_falcon: &'a Falcon<GspEngine>,
>>          _sec2_falcon: &'a Falcon<Sec2>,
>>      ) -> Result<BootUnloadGuard<'a>> {
>>          let fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)=
?;
>> -        let _fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
>> +        let mut fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw=
)?;
>> +
>> +        let args =3D FmcBootArgs::new(
>> +            dev,
>> +            chipset,
>> +            wpr_meta.dma_handle(),
>> +            gsp.libos.dma_handle(),
>> +            false,
>> +        )?;
>> +
>> +        fsp.boot_fmc(dev, bar, fb_layout, &args)?;
>> =20
>>          Err(ENOTSUPP)
> [Severity: High]
> Does returning an error here immediately drop the args variable, thereby
> freeing its DMA-coherent memory before the FSP finishes reading it?
>
> Since the FSP is actively booting asynchronously, wouldn't this cause a
> hardware use-after-free of the boot parameters, leading to IOMMU faults o=
r
> undefined behavior?
>
> Note: I see this is fixed in a later commit 'gpu: nova-core: gsp: enable =
FSP
> boot path' which changes the return to Ok(unload_guard) and properly hand=
les
> the required hardware delays.

`boot_fmc` is synchronous, so there should not be a use-after-free here.
