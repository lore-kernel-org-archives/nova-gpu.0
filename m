Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010019.outbound.protection.outlook.com [52.101.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0144D3B42FE
	for <nova-gpu@lists.linux.dev>; Tue, 16 Jun 2026 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781597863; cv=fail; b=LUMGVzyA8osVnILLgpHYOab3GSDfmjODZVe4NZ17goGkzhmcYosGDFxEG1MfEX+phKebfOJd5Z3fT8B1ijOIx7oh7XPcUaJPYWFwlOCA2vpxSuDbZoaZcWeat3Z0IXzesjUZBkDpK4k1cHraoNYlbymEnRy1GPlPTWaD30iY5aM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781597863; c=relaxed/simple;
	bh=ST70nadbVuYEC2kqtUQUMsSv2auLVx3unx4meY7+AL8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=r4EoZIPfCdKHVoYQywYr/tXXOgQJR9sNE1vkFL0yWA4Gzgc/juHW/TjHDMZSe0NV4wBLo69vxtWeWXgvBr33cTJyX0vOrrZwQTHrDAz05sUW6NKroDoJazh1I08j6KnteLIJz/gZUR2m3+xEj/bM72jE2QawiT6ZJuoMCn2XGPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=typEXFCE; arc=fail smtp.client-ip=52.101.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="typEXFCE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1EP1387A1mXYkUGZMNuOmcce3y1U2wbAEQFDVTCtiKLwhrEubMr4UrkQMrD5Tum0m3yT7AahgY3wXkx0MkOQXZmcQDVX+/lmFmqdaNC6W0fTddkRZf3alUjn5+duKMBkOcB3xg1ld+hzoMazwBO1IIm0gJtWTq6abUh2RjG5VzAfY0Sc7rokJ9+9EhTHF0PkGfBRjd9jOwG2mGse69Doj0YUQOxIvshY3JT/bwlsbq3v+U+5Tildy7uC2TqDXCHditDb0doK+FGkBuoXaI2IWHHKll4lV+OzGpmwYZaGzvjtM1DCXU0U/TbpS+NBJ5C28C5WHIYUxCjSvVaKnp1EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnqwDuE/v+NklcSOpQBMTO2f9A+o1lOMYLa300D6fs0=;
 b=IV+W9nIv/prIq9XSiwRdwWORy6ukyZnJR0k8LBHMzSL2XKkT8MYJQORd6CUT7WNXsiuIrofCCUV6NZzksu7ZQDdgRaIjFNCO9tHoR6+7FFbULiHUu4l3q1Zu5PGNcij6N/aukUw1dpmXvSmpDavVK7ptH+B65kOBOiFJoewIuTpPz/yhx7rhFzbwuzmquCQXNaoTnZlHl4coh6Xt0gl3AyXLmVBQE9plkOWTg/vziGroF7FBhkGSBxBC3lJj0ZMUeDXaRvzGzQ+GUwphcZhyDTATf93f/NOYrRzInc6KyubbrtScviPD/x92uMPDBYrp0eqftgjDonK0/IdHnRTdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnqwDuE/v+NklcSOpQBMTO2f9A+o1lOMYLa300D6fs0=;
 b=typEXFCECdtLLBctE5kqjYxZ/HL9gA4xzOPOPDRxPzVuOgY0A83BVrmYMbZxQnCXhIWRw12eLXz5H0eN1B4UEzyMaFh4ibFF7JkN9eESoK0VS17NqHdXr267vHm8uYGu1l11JsRgmq5Zzssln4wbIOZoiFtYawLaNsRThpIyzSOvXloSavr1I8ZfpR8J/IoCy5REdELiKzR9t+CaDIAsYTz9rFYpb/inp3kCz9yf2OjelwMaWnh04NEcYs+hTogot1Ig+i/AIflgsdvd76IkMVHJ/zbFC+4ryg7sA+DF7py9ZriBGD/X9eTExMBsHrpkUrry4W1kWcANkPr+udJ0Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV9PR12MB9759.namprd12.prod.outlook.com (2603:10b6:408:2ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:17:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:17:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:17:34 +0900
Message-Id: <DJABQBFVXDZW.T9Z7B76WVMXL@nvidia.com>
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
Subject: Re: [PATCH 5/9] gpu: nova-core: add FSP and PRC protocol
 documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-6-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-6-zhiw@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV9PR12MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d0712d-89d6-4db6-2247-08decb7fba4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|6133799003|56012099006|4143699003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	/Ipdu7NrfyjxolcGRec41qqTvNMAnV3qLgf3YpjZILZ56a6eBFZ4HB5UcSltjvms2+Z5aw0DMuZlzvQw+/lYApbTVMAj5LJ4ptaSwbelkufqka62rMUO3Y/MI8YuubWQ0kNyMHurMEKP7PTButveXQI9WkdDXrWm96VB4qsdx+tsSeD2XqxQPXqsoQmSzFleXQhw+amRM7TaZr7oSAKCEa1p3y6tEK5YlU3WUoGIdJYLfRBn6eFaT0Eat41rZwwaqBgzBJ6b8F4YNuR806DE7a5g2L6tV/8NG8zJwY71Ca2LAZ1tczFF0ASVztwB2EcOTIQcvNZmep6lR3YSZityI3TajZf+rp7hgULM7N5SQ0/Mgt+ppPpYLVutA8ZcqzO6yZeqYFL9SXqfuFcZpJUonxDUKz+dgVqXByEl7woyiMpQbMNBSIDTwkaaezYn1c06uBoiHNLNAszqwXASs+cGNma7v2AYOP8FbPB5ceDKrbXP+om5yWUNuuNFuZ9sOddjD7oLn1mibkWx2Z2dWnVhAHCMZMQpWGl7HtTnuqTqOXcY43ptAtIm+XE0XSGzO7QFeWEMayYhZUwRGKxM8lzZ/92VsxC9Yk3cEKOrg1mI+SotPzdRUS2KAv5sfwSudJx96ps8y7dEalq2k4HvQtkbkqysb+Ary2ss35FXBJo9gtG0jQXWV0xJin0PVy47yGCh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1BvT3VrVU5oNkhvWTIyN3J4alFPc3Q4WUlyQzNqNFJHQUtHbFQvOGFkdDZ6?=
 =?utf-8?B?U0EvbXdDVmhVNEREWGRKbnlUYUwwRFgvZUNPclZLYWVhNEpaQ0twVjVzdDZq?=
 =?utf-8?B?amRpcmJWNHp0QVhrUnM2bzFoYTZ4Y1ErRFVBblZZdytndVBWZmZSZ1NDeEg0?=
 =?utf-8?B?d0ZITEdOb0NYQkVGamhPaHlhaDFkWDlXNXNKMWFGbFRuY2ZjTHROSlVneW5p?=
 =?utf-8?B?S3hoR1hPYWM5ZTl2VUJNdm1OVWNUakdCTHdPN0tnQWVVYS8zdCtmS2g2STE1?=
 =?utf-8?B?dFFWQTVWVVF3Zm9BQnhYejdXR1l0OXFsdWpta1d6RHdMK2ZITFB0WHM2cDlU?=
 =?utf-8?B?N3UydHNvcjAwUVl0ajlJckI2RFRrQWt3Q1BwTUp5T1NMMmNoTjRsQjB4NVBM?=
 =?utf-8?B?ODRZd3d6VEJlRTRIU3lENXc1YXRlNWpjRE1EdWVJcjV2dGY0RkNoYmZsTlkz?=
 =?utf-8?B?NWRkQ3hWUXZFS2pmck56YTV0aDEwa3FuYnBIQkNxSFpNMU1TQlhJT0ZUdTNx?=
 =?utf-8?B?Q3dGV2NHNzVuc3NPL1pHTHRGMllISWVPMTlROGZqZjRqelZBMDRCWHIwbjBX?=
 =?utf-8?B?TGdCUVV5NVFSMWtiQlN0a1NSaFBHSXpINzRKNU5VUGNWR0FYNEZ5N2RWNDMz?=
 =?utf-8?B?aUpwTzh0TnJKOFowYWx1bW4yU0E1MzEvU0xaWnEwKzJBWmMrRUdVWjlWR3JY?=
 =?utf-8?B?QUpndE1DZGk5QzEzaS84YmlReTRhQ1hQaVMwM1BEaDE4MVgyWkZTTWZxcnZw?=
 =?utf-8?B?VXRXNk1OaGRyT2RnVXBqOS9RNU1HY3pCenFKL1ZTRnZBN3RpWkVyeXA4Nklj?=
 =?utf-8?B?dTJGY1laZFExUXdiWGt2T1FrcnA1YkZOYnhVUUFNaWVRQXlidER2WVo3TmNQ?=
 =?utf-8?B?QjVnUFI1RGdsQzlDVUpSTzFyR3RtYnFXVzNTc3I4M080UFJWOXhnK1lYWDRO?=
 =?utf-8?B?M0dFbldhRHBWbmwzK2RwdHVIaUdmSkRPeEg4ODdKWWlKNXdZRzVjQk8ydGlG?=
 =?utf-8?B?ekVMWmdjcVBVcC9DMmY2R2NGNkRTWDZ0REY0YXBoRkFCbzk1TGZPbWp2OEdQ?=
 =?utf-8?B?TmhPb1B0Q29Rc1ZqTWJrNW85QVV2a1FmMDVWZGd5YTF2QVBZVmhVUkwwVFdT?=
 =?utf-8?B?N3JQenpvOVJKQjA2Q2hJVVpKR0FtWWVRaSs2anlWTWpoTXFQcml6UE5Cd0hG?=
 =?utf-8?B?VnY1enpIdmtkc2tjL1MvSDQwVE5wSkttZGpOQ0tZVGpCMmMweDV3OWp5MUlT?=
 =?utf-8?B?WGlMS080VXRJSkZLS1dDbFFNSTVJNzB6Z3QwWFhjYjl6YXpRdEhpUEZvWklE?=
 =?utf-8?B?eUdNWm9WWDgzK3NiVUFZSEp3Qm1obHJ2aTBsSGo1aDEwcXlFa2cwbFFBK3VV?=
 =?utf-8?B?SFBjamJCay9JOXAzcWswZ1c1THRrZzI1VlZUeVFaSE1rcjBUVFpXSkZPVmpn?=
 =?utf-8?B?YjMycGowVW5BamxhS0s5QzE3bGdWOXZYb2NlbVk1Tnk4MzlQc2E0Z3hBTTdt?=
 =?utf-8?B?ckczUVF6dHJuKzZvMng3S0FpMG9JbE5VMEcrSEQ5SkdjODA3UmppTzFEdi82?=
 =?utf-8?B?OHRDbENBaVdiOGNWWlQwc3RJTVF6SDY4MkY0eWN6Y2JiV1lGRmgyaHpub2tl?=
 =?utf-8?B?aXkwOFAxVzJkYXVOeUVQQ1dPbURXTXo3ZkROTVFZaUNIMnB0aDViN2hGdHRi?=
 =?utf-8?B?RG95b1FiZ09DdUFDTXJCd2VUanFRemY2cFlySW1uVHFGQVZ1TDhyM3grY3Z2?=
 =?utf-8?B?QVI1STQvUGpLSVcxUUc1RDFMeVduRVBQVVVnZnAya0Q3RzdxWWdzOXZDZ1JO?=
 =?utf-8?B?c0R3ekNEYVdZQ0I3aFF1NUJVMUhPb0NVU05SQjI3MU5OT2R0dzFza3lDSjla?=
 =?utf-8?B?UlFYTTdEc0RrWjJkR1ZUV0ZjVFBqbWQ1dDA1ZW9xZ3FGMTNVTERHSFVmYnY0?=
 =?utf-8?B?UU51V0JxcjZFTUNZWWNuZUNlM3FITXF3VkMvTjNweHZ4ZW94anBoTWpvNm1u?=
 =?utf-8?B?ZkVoWUxRbm81aUF2L1VMbjRoS0FXWlZDR09HZmtJWE1VUFFhYzFETklrNzZ2?=
 =?utf-8?B?Y3dJc2lSQmViMUpHdmdtTTBzemc0WXoxK3J4enZOT0RvV1JpYzIwWkZIb0FL?=
 =?utf-8?B?OS9Ja3hzdXo0enNSWFBocDcydVdBVjIvL3pWMjVKWEI0MVp3Mk9IWkpXMkNC?=
 =?utf-8?B?eGc5WDk1UTJHZ04vbVRGQk5DMnRvdzZpbVYzVnJnRUhEditTVTlVMERvUm03?=
 =?utf-8?B?MjVpSy9CVHFpM3Mva3NRSE5LdUdlem5LQk9YM2svaHZIeXh0SCtLMkQvRXRq?=
 =?utf-8?B?enFtalYyaVR5dmdNS0dIaWFsbzQzcmdiREcxVFRYUnd6cXBJZi81b0REWUpp?=
 =?utf-8?Q?iR3PIUXqdhntuYK1oogN8tGP89n7FRms/IurgaBqWCuDX?=
X-MS-Exchange-AntiSpam-MessageData-1: FKi2oidSgdKjQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d0712d-89d6-4db6-2247-08decb7fba4f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:17:38.3202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTBhdCAh9x+vkb+nxjtWyZ/6O/zCkq8WPTLxz1UdE7Ezc9ssjUrybW3ZVDokHcrBGrnPeK/sMdgR+tv17/Pi1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9759

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> Add documentation for the Foundation Security Processor (FSP) interface
> covering the simplified Hopper/Blackwell boot flow, the Chain of Trust
> (COT) message protocol, the MCTP/NVDM message format, and the Product
> Reconfiguration Control (PRC) protocol used to query device configuration
> knobs such as vGPU mode.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

This is super useful, thanks! One question below:

> ---
>  Documentation/gpu/nova/core/fsp.rst | 142 ++++++++++++++++++++++++++++
>  Documentation/gpu/nova/index.rst    |   1 +
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/gpu/nova/core/fsp.rst
>
> diff --git a/Documentation/gpu/nova/core/fsp.rst b/Documentation/gpu/nova=
/core/fsp.rst
> new file mode 100644
> index 000000000000..52d618d22bb8
> --- /dev/null
> +++ b/Documentation/gpu/nova/core/fsp.rst
> @@ -0,0 +1,142 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +FSP (Foundation Security Processor) and Secure Boot
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +This document describes the role of the FSP in the GPU boot sequence on
> +Hopper and Blackwell GPUs, and how it differs from the earlier Ampere bo=
ot
> +flow. It also provides a brief overview of the PRC (Product Reconfigurat=
ion
> +Control) protocol used to query device configuration through FSP. As wit=
h
> +other documents in this directory, the information is subject to change =
and
> +is intended to help developers understand the corresponding kernel code.
> +
> +What is FSP?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The Foundation Security Processor (FSP) is the GPU's Internal Root of Tr=
ust
> +(IROT). It is a dedicated security processor that boots from immutable R=
OM
> +(Boot ROM) inside the GPU and is responsible for establishing the Chain =
of
> +Trust before any other firmware is allowed to run.
> +
> +FSP runs independently of the host CPU and starts executing as soon as t=
he
> +GPU is powered on. By the time the nova-core driver is loaded, FSP has
> +already completed its own secure boot and is ready to accept commands fr=
om
> +the driver.
> +
> +Simplified boot flow (Hopper/Blackwell)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Starting with Hopper, the boot flow is significantly simplified compared=
 to
> +earlier GPU generations like Ampere.
> +
> +On an **Ampere** GPU, the boot verification chain involves multiple Falc=
on
> +engines and multiple ucode stages (see falcon.rst for details)::
> +
> +     Hardware BROM (SEC2)

Is this referring to FWSEC-FRTS? If so, should this be `GSP` instead of
`SEC2`?
