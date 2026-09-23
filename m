Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361A3248F64
	for <nova-gpu@lists.linux.dev>; Wed, 23 Sep 2026 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162317; cv=fail; b=Wk6dwDzKNB0UJ6cLUrDC3jFnyGYnwy9o3cMi/PED+GqQ+DEGhmPljcTwLtq3tQUNMmh/VuCqxIaWVfaCOKn5MlO4Ay/pNftwpfKs5rtfzDetktrMKyYJDZo79X7WTBVTGn7fmNtBww3Miw4yug8WWurxvDTcMbIBKH5z4M0bHjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162317; c=relaxed/simple;
	bh=zbHwaaITYlnx03LIruykDehVDU48ElyqH+y8NqYT9+g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=eaubEpX+WEkWJgBXJjnxaD2IB0rzJoVos7Byzj4QNV1HvyOOXKMzzK6QoAGI9+BMME+BXMTiaRXd4b9jVhe0d69Fve1XQfBYugU4ID9XUBJGtjcdAfJ8bCQX0Orji81sSKC5NrANF3JS8kwK65c1amU1Z9N8ajfMKZjJmyR4aE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ALchgZGj; arc=fail smtp.client-ip=52.101.57.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ALchgZGj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkA1kHMnlxSHtULkpRvNAH0SbX4UMqWMZuKdYg72bt7HS6jSP8y1Lh1hDRbicvPfzJ+co8uxMYY/5Maagbw24b2+E0YMEJ0PQhCnvfsfJpjoy1MhiOyHMKQuJ1j749K3SXRrLYEB37UXDwwvIzsxEhdBZ/uqDvUqa2ZI07m9yx0ePW803EQxjm9WBb2SSoz2HJ735uAMb09lhJi1rbJr1d+UKq3+L+zK4glrfeIrz5ntTEpofMYR1EsdBF9dNi/skABiLC8CQshqH1lnxDzePnuuiSZxyTlfgqzJfm6xiD6FFXubtX0HNIuzqFeeJlAVPbq9rKDhXS7xcJILJvGE0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRIwlt3tDf0I0Y1PIoiFIL+hAMKt5fcd+gHoOvlevrs=;
 b=Rn5jsY2PsTAouvMcvL1fuWFw06zVVnoao+e7+sVrVVlb1pQmtpasXwxNrRHvwyDVXVJoUYuRrmE2CTP0BRA1vbu51dir25HCO37EhaSZxy3UymeZCETwuskQwF5Vh3HPZIisBzvwp2DKxNUgGGioRKvBs7YZKRRk00ihOyaf1jlUrqscWdPsgqOGPXc1KG8E7SLhNxdv83FwVW9BVJ6DsPSXHCmL63d1HpNDbznjZXjtPbvdaDtV73TboBQXDyK7BbLZVZs9O57qBuVC31Rbzree9m7XgMEt8tzC1R8UKPYJNeGU/9JtgYRp61Ln9t7kVgLgyPr41EqygbouuKP7Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRIwlt3tDf0I0Y1PIoiFIL+hAMKt5fcd+gHoOvlevrs=;
 b=ALchgZGjZ71utZgFyjUPDknD1AKifGv+I/VSbTLnLCZKbfX7wNMe2eCdW48icqggDyjIQo20lWbD1/TFVMesbf/+jwS67cn15wxerV6zZCNrLgFl9CGr+ezBa181HLVEKeEtc1X2V5KuNKydGOQw3QPCwv93iB7mPLQCyMUVX3+dnrwthmpJ1Z+SRmLS+rISYjbICQjPcPQDoGx1LGv3JGRFqGm9KSO27DlxoNb5I/2JfyBWjzSJfv+e3ahfu0Dp4rLNRK927EYoMLVa3G1mq/u05VG011dx/VIipMZRGANvvFQZ2LOB+7gN3S/SyoAayrWKe/OGOuLklw5OxoiVCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV8PR12MB9665.namprd12.prod.outlook.com (2603:10b6:408:297::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 11:18:29 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 11:18:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 20:18:24 +0900
Message-Id: <DLMNKPICH09T.14GE59LIB5QKQ@nvidia.com>
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
Subject: Re: [PATCH v3 09/33] gpu: nova-core: add GMC API message types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-10-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-10-jhubbard@nvidia.com>
X-ClientProxiedBy: OS7P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26c::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV8PR12MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fc719f-9ee6-492a-9614-08df19646418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|23010399003|6133799003|18002099003|22082099003|3023799007|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	VmXdC1hbQdOdNvxR6QLEuWLfb/WW3rZCz4WTgIB0HHhYG8CMBB+AyxBfb3D888rDPr+ljY+2RRqw8s5JiRhtZIJgzgf0rA1+xbv3hdOWIw9SeepGOkQkXBomQ54Q66EMo8hC+oIAxv+JSCF72LMxPdZZLq7AP88/7JWSao+oKIOC6THmUpk7ru/s+1nn87aD0WKEX14KBtyoKuzlinBm9n4u9P9upQEDT+hzHpHvfubpC7LoLw3eVd50H0JzwjQ9RTpskL2L/2aQCpZy+8/wBJ1+zgBdpqgKMTNeue1pedG0KP1ucNX15HbGNsLdYeNg8L3bwLpqKs7cOA6sZIukqMq56as7Uv1OwqWX8DBI3x8mIJgXyjQRU+SJtHxi1lpykIPDNgANadch0ZCwCRILl6kz05R55wG9l/XtQYutezAP2f97kMYIA0kWjaoC/pe11Y+b7aGKlQQQrG8ZRt9WkLp2anTcMCHDMHHmkslGps9oP3N9sXZGyinAzMJl9Nm7TUiwkntLjPC7CjRNFFjvId0uL5Iu+XrYXkH84Jzc7Q6SIa5EvKlkQ4mP54S7Kpg49+pB5PgoxHcCSfcxeKyWedFxJ1EB2oY5kdbxRNsPURPjdzLKM+zOE505lDFjyvd5VYpk77C42kZ8u8TcT6Ee6ieuKf0BSjYw4waTV/clGEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(23010399003)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3BPcTVLbklJcTRLVytRRkF2blVKUmEyakFBSEZTL1E5SlRaY1pXQmRFSDFr?=
 =?utf-8?B?NUNEZkN1RFExQmNCbWR0bE4zc3Y2SEd3WEZVZXhvQXlQc2FiWVBtUHVpT3Zw?=
 =?utf-8?B?TDhZOTFMUWgvSWdvbUpha0tlNjM0YnhScWN3SGVhT3BMdVhHQW90M2dSeUVT?=
 =?utf-8?B?L0NJVHR4N1doeWQyOWFDRnpyMDU3Y3VuOFNHSjdNajQ5ZjRjTE4wNWMwcnpa?=
 =?utf-8?B?WHEvbjBRQ3VpQUdjUncxTkJGazVGbkl2bUpQR1I5dS9WaW1FQnpFYW5iRStH?=
 =?utf-8?B?Z1BpOXNKZHF4dWNvSjJBNE1iWkpDYTFGRm1wM0cxTmxjaGdFNzAzY3pWZG9z?=
 =?utf-8?B?dXl5NlU0dnl0L0orL2pNUzJ0eFQvcmVvR0ZPcldjTC9UR2tWbm9UeGhOLzJQ?=
 =?utf-8?B?dnFxVytNOFduck1KT1RnZW96M3cwQnhiQXZ2eVo0NDF1OGwza2h2TTBPNXd2?=
 =?utf-8?B?a01nYWtHNm9JN1pKUXBmVHBRNDBhUFhTeUJyM0QvdmZaSXpsZ3JUZ0JzQU95?=
 =?utf-8?B?UE1Jc056SE13dzcwN3A2VjRKYk5HcmZ0Y3B3YkdXSHJRSXdKOHBPZXdpQmJE?=
 =?utf-8?B?bUxFdnZtQysyR01KTXA4TW9IaWJDVUxTQ3NYQW1SRWJ2Rko1M0Y4eTI5a1lr?=
 =?utf-8?B?M2taNEJMRmIvQ3hpczM0bG9GSmlvd3p1SzlBcjlpVE5oUlVzZmw2bmlKZTNt?=
 =?utf-8?B?T21BWCtXTWg5YndLazVLU3BGZ1o3TzgyUzh2ZnBjVFRVcHJiOVpjUW90aDFl?=
 =?utf-8?B?MjdhWWI1SVJ0RU5zZExhQmRZdTRSVEFSRjNFbmRlWWM1ektwZTNaN0ZSQTkz?=
 =?utf-8?B?dlpvQ3pRVVpOZWVabHh3YlJiRVE5cTZhdXJaaDJ3SWNQUDAxNmY2cUFDZlI4?=
 =?utf-8?B?UFdDdEJ5VnNJaGoxRCtVVlpqVzhKLzJGWUJQbXlVUFFXRFhiNnM2b0EyV3d5?=
 =?utf-8?B?RUxCZjRrenNRVmt1YmhqT2l1VkNmdmpvSU4vL2Q4ZzhiM2Rmamwya1cvNE4r?=
 =?utf-8?B?R21SbW1uakg4cW5mZUZWMndtR3RwOHA2a3RkMjhZWll6RHN3Y21jb0pLR3Zt?=
 =?utf-8?B?SG1HcVhpUmFHcHBLTlVBajBNN21pbzEzUXo0eUM0Nk9ib0JOMFhOZFVJT2ZQ?=
 =?utf-8?B?Rkh0NytXdGtoejlYdVY4OFBGanZLOVNPSTdhTDhUVXU0S1JtUnU2TGdieFRR?=
 =?utf-8?B?bWpWclpwQ3o0eFlsbXF0bGUybnB5WXNwYWZZR00vdUorOUlwQ2drcFo0NVNU?=
 =?utf-8?B?WUptaU0wZUE5VVdVWmJRS3VzZHlNQnJ2cGNlY3QvVEZrWFFZRFBtSmU2dG4r?=
 =?utf-8?B?WDBDcXVSdEpYb0JGWVhLVTJGdnk5MjBGM2RpR2NWajFMQkFTeloxdjF0d0Zw?=
 =?utf-8?B?RXR1czcrd1gyQkRONGJTNm9PalJ6bzByL1FqWWdIemhydHBEM1YzTUVWV2xW?=
 =?utf-8?B?cGt6Q1ZvdVFNRzBiREwrd3phd1BVdklUUzV2Ry9nQ1FmQ2h3aXFPMDRQa0NZ?=
 =?utf-8?B?RkZwWmxYU0lwSGZjUmFQaTJoRUtiUkdUMGVtR2xQZmxvNTVXc3BqekdTL28v?=
 =?utf-8?B?Vy8rc2RVRCtyTVk2bDhnaUhWdC9NejRhUVpwTXNOK2pkTUJ0djd1UFdpRFgy?=
 =?utf-8?B?WW5XTHFZTlpsUngzVEsyWHZKRzNaU1NtOXk1WVFieXgxLzFBSy9WaGJPMjEy?=
 =?utf-8?B?bmhHanVRYjg5azdCYW1yVXExZDFHZmFrUkZhQktFZFVZcjVBL3h0OG15bmdX?=
 =?utf-8?B?cDlmanR4TngrdVpLSTRkdWtwRDRvZXh5YVl2eVc0dFpPTWExeG50WE1PWmZx?=
 =?utf-8?B?ZFRzNFR2anB0S2xldDIvamJqWU13ViszVjlacDZoRDNseVowejNYNy9zK2wy?=
 =?utf-8?B?TlUxeFZUVjhOR3B5YVBHalRTTFhKWnBsakpEUmdvY0tzZEJmMG1idnNyUTlw?=
 =?utf-8?B?WE5jYklrb003cFFMUWNaTkpGSGhkNC9MdDlCWHltYjZoeFIvWTZod1d5TTNS?=
 =?utf-8?B?cy9qbHl1Z2VQRW4vU0hLRERFTWJ2d2NJNFl1VmgxSUJrOHdoWnEyZGZXd3Vn?=
 =?utf-8?B?OEQySGZ3MzRDekxxWTdzNUcvMVd6bU43bXhmSHhUVldlV1RLRmQ4NktqSGl0?=
 =?utf-8?B?U3dXOXppV0ltQStFd2dwR2dOU1hkem1PRmNTNHR1WEN2Snp1VUEvMWw5OG54?=
 =?utf-8?B?KzVQZWxrYzFJajN3OTFaZ1liSGwvSjNoN3BBNVd0dmQxRXlSMk91YjBNYktO?=
 =?utf-8?B?QVNQbS8raEE5Q09vcEM2clo0cW1MRHRjekJTTHdrbGtadnY4M2RsdnV1a0ky?=
 =?utf-8?B?aFFBVE11Zjd5YkJSOXFnRzB0d3BpajAvNzhod28yWXJlYnIzMHY1bWhyL2kz?=
 =?utf-8?Q?s8h/5MCH+x6z/lymtj2zolLdRIQZ0onkwNkRdz+5Z/VZh?=
X-MS-Exchange-AntiSpam-MessageData-1: 69LnxDbY7HDyEQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fc719f-9ee6-492a-9614-08df19646418
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:18:28.4634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiJ2GutxPTkBcm2pBbGMg/ayG6XRi0Jycj5+a5KgMfNYXsZlPuqF4VxexCEv6AfBIZfPFR5aSA0kHhI+rUIupA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9665

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 285c23cea771..1aca5ca82764 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -50,6 +50,11 @@
>          cmdq::Cmdq, //
>          GSP_PAGE_SIZE,
>      },
> +    mctp::{
> +        MctpHeader,
> +        NvdmHeader,
> +        NvdmType, //
> +    },
>      num::{
>          self,
>          FromSafeCast, //
> @@ -889,6 +894,221 @@ unsafe impl AsBytes for GspMsgElement {}
>  // are valid.
>  unsafe impl FromBytes for GspMsgElement {}
> =20
> +/// First word of every queue element: `"MCTP"` in ASCII.
> +const MCTP_MAGIC: u32 =3D 0x4D43_5450;
> +
> +/// The queue element header that opens every queue element, whatever ki=
nd of message follows.
> +///
> +/// It holds an MCTP (Management Component Transport Protocol) header an=
d an NVDM (NVIDIA
> +/// vendor-defined message) header. The NVDM type selects the message he=
ader that follows: the RPC
> +/// header or the GMC (GPU Management Controller) API header.
> +///
> +/// ```text
> +///     +------------------------------------+
> +///     | queue element header               |  QueueElementHeader: magi=
c, element length, MCTP
> +///     |                                    |  header, NVDM header, mes=
sage length
> +///     +------------------------------------+
> +///     | message header                     |  the RPC header or the GM=
C API header. The NVDM
> +///     +------------------------------------+  type selects between the=
 two.
> +///     | payload                            |  command-specific data
> +///     +------------------------------------+
> +/// ```
> +#[repr(C)]
> +pub(crate) struct QueueElementHeader {
> +    magic: u32,

Do we want to mention that the expected value is `MCTP_MAGIC`?

> +    /// Length of the whole element: the queue element header, the messa=
ge header and the
> +    /// payload. Open RM calls it `mctpPayloadSize`.

We probably don't care what OpenRM (without a space :)) calls it. But
why not use the same name, so the relationship becomes clear?

> +    element_len: u32,
> +    mctp: MctpHeader,
> +    nvdm: NvdmHeader,
> +    /// Length of the message header and the payload, the queue element =
header excluded. Open RM
> +    /// calls it `nvdmPayloadSize`.
> +    message_len: u32,

Same here. Btw, reading at the comment, it sounds like `message_len` is
always equal to `element_len - size_of::<QueueElementHeader>`? Or am I
misreading?

> +    reserved: u32,
> +}
> +
> +static_assert!(
> +    core::mem::offset_of!(QueueElementHeader, magic)
> +        =3D=3D core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mct=
pMagic)
> +);
> +static_assert!(
> +    core::mem::offset_of!(QueueElementHeader, element_len)
> +        =3D=3D core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mct=
pPayloadSize)
> +);
> +static_assert!(
> +    core::mem::offset_of!(QueueElementHeader, mctp)
> +        =3D=3D core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mct=
pHeader)
> +);
> +static_assert!(
> +    core::mem::offset_of!(QueueElementHeader, nvdm)
> +        =3D=3D core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvd=
mHeader)
> +);

Mmm, that's not great. Basically we are redefining a new type that is
mirroring a binding-generated type, and relying on these asserts to make
sure the two types match. All that because `GSP_MSG_QUEUE_ELEMENT` has
too long a size due to the encryption support part.

This is something where I would like to ask OpenRM to revise their
definition so we can leverage the generated bindings properly, and end
up with just

  pub(crate) struct QueueElementHeader(r000_00::GSP_MSG_QUEUE_ELEMENT);

But in the meantime, I guess defining our own type like this patch does
is the only viable route. Let's add a (short) note explaining the reason
for this though.

If we confirm the layout at build-time though, we should also assert the
offsets of the members in the union - which IIUC from your reply to
Timur you already did.

> +
> +#[expect(dead_code)]
> +impl QueueElementHeader {
> +    /// Builds the queue element header of an element whose message head=
er and payload together
> +    /// take `message_len` bytes.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EOVERFLOW` if a length does not fit its 32-bit field.
> +    fn new(nvdm: NvdmType, message_len: usize) -> Result<Self> {
> +        Ok(Self {
> +            magic: MCTP_MAGIC,
> +            element_len: size_of::<Self>()
> +                .checked_add(message_len)
> +                .ok_or(EOVERFLOW)?
> +                .try_into()
> +                .map_err(|_| EOVERFLOW)?,
> +            mctp: MctpHeader::single_packet(),
> +            nvdm: NvdmHeader::new(nvdm),
> +            message_len: message_len.try_into().map_err(|_| EOVERFLOW)?,
> +            reserved: 0,
> +        })
> +    }
> +
> +    /// Returns the length of the whole element, the queue element heade=
r included.
> +    fn element_len(&self) -> usize {
> +        num::u32_as_usize(self.element_len)
> +    }
> +
> +    /// Returns the length of the payload that follows a message header =
of `message_header_len`
> +    /// bytes.
> +    fn payload_len(&self, message_header_len: usize) -> usize {
> +        num::u32_as_usize(self.message_len).saturating_sub(message_heade=
r_len)
> +    }

Passing the header length looks awkward and error-prone, and as
discussed with Timur you then need to manage errors (which was done in
the "add GMC transport receive path" patch rather than now).

There are only two callers of this, one per header type, let's make the
caller responsible for subtracting their own header after they have
matched against it instead of unconditionally subtracting an arbitrary
amount here.

> +
> +    /// Returns the number of queue slots that this element occupies.
> +    fn element_count(&self) -> u32 {
> +        self.element_len
> +            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
> +    }
> +}
> +
> +// SAFETY: All fields are integer types or transparent wrappers over one=
, with no padding.
> +unsafe impl AsBytes for QueueElementHeader {}
> +
> +// SAFETY: All fields are integer types for which all bit patterns are v=
alid.
> +unsafe impl FromBytes for QueueElementHeader {}
> +
> +/// Header of a GMC API message.
> +#[repr(C)]
> +#[derive(Zeroable)]
> +pub(crate) struct GmcApiHeader {
> +    /// Command id in the low three bytes, flags in the high byte.

... then this should be a `bitfield` type. :) Especially since I see we
are doing some bit-masking in later patches. Commands can then be a
nicely-defined enum used for the relevant field.

> +    pub(crate) command: u32,
> +    /// Payload size in bytes.
> +    pub(crate) size: u32,
> +    /// Sequence number that GSP-RM copies from a request into its respo=
nse.
> +    pub(crate) sequence: u64,
> +    /// In a request, the largest response that the sender accepts. In a=
 response, the `NV_STATUS`.
> +    pub(crate) max_resp_or_status: u32,
> +    reserved: [u32; 5],
> +}
> +
> +static_assert!(size_of::<GmcApiHeader>() =3D=3D size_of::<r000_00::GMCAP=
I_HEADER>());
> +static_assert!(
> +    core::mem::offset_of!(GmcApiHeader, command)
> +        =3D=3D core::mem::offset_of!(r000_00::GMCAPI_HEADER, command)
> +);
> +static_assert!(
> +    core::mem::offset_of!(GmcApiHeader, size)
> +        =3D=3D core::mem::offset_of!(r000_00::GMCAPI_HEADER, size)
> +);
> +static_assert!(
> +    core::mem::offset_of!(GmcApiHeader, sequence)
> +        =3D=3D core::mem::offset_of!(r000_00::GMCAPI_HEADER, sequence)
> +);
> +static_assert!(
> +    core::mem::offset_of!(GmcApiHeader, max_resp_or_status)
> +        =3D=3D core::mem::offset_of!(r000_00::GMCAPI_HEADER, __bindgen_a=
non_1)
> +);
> +static_assert!(
> +    core::mem::offset_of!(GmcApiHeader, reserved)
> +        =3D=3D core::mem::offset_of!(r000_00::GMCAPI_HEADER, reserved)
> +);

So for this one the story is different than `QueueElementHeader`:
`GMCAPI_HEADER` has the right size and a layout that we can wrap, so
here we have no excuse for not defining a newtype instead of doing this
tedious checking.

I understand there is an union and this requires an unsafe block to
read, but we would need exactly one, in the `status` method. Which imho
is better than adding ~60 LoCs redefining what we already have and
confirming what we already know.

> +
> +impl GmcApiHeader {
> +    /// Returns the `NV_STATUS` that a response carries.
> +    ///
> +    /// The value is meaningful only on a response, which GSP-RM marks w=
ith a flag in the command
> +    /// word. In a request, the same word holds the largest response tha=
t the sender accepts.
> +    #[expect(dead_code)]
> +    pub(crate) fn status(&self) -> u32 {
> +        self.max_resp_or_status
> +    }
> +}
> +
> +// SAFETY: All fields are integer types with no uninitialized padding by=
tes.
> +unsafe impl AsBytes for GmcApiHeader {}
> +
> +// SAFETY: All fields are integer types for which all bit patterns are v=
alid.
> +unsafe impl FromBytes for GmcApiHeader {}
> +
> +/// The headers that open a GMC API queue element: the queue element hea=
der and the GMC API
> +/// header.
> +#[repr(C)]
> +pub(crate) struct GspGmcMsgElement {
> +    element_header: QueueElementHeader,
> +    pub(crate) gmc: GmcApiHeader,
> +}
> +
> +// `AsBytes` below requires that no padding separates the two headers.
> +static_assert!(
> +    size_of::<GspGmcMsgElement>() =3D=3D size_of::<QueueElementHeader>()=
 + size_of::<GmcApiHeader>()
> +);
> +
> +#[expect(dead_code)]
> +impl GspGmcMsgElement {
> +    /// Creates the queue element header and the GMC API header of a req=
uest that carries
> +    /// `payload_size` bytes of payload.
> +    ///
> +    /// `max_response_size` is the largest response that the sender acce=
pts, and zero for a request
> +    /// that GSP-RM does not answer.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EOVERFLOW` if a length does not fit its 32-bit field.
> +    pub(crate) fn init(
> +        command_id: u32,
> +        sequence: u64,
> +        payload_size: usize,
> +        max_response_size: u32,
> +    ) -> impl Init<Self, Error> {
> +        try_init!(GspGmcMsgElement {
> +            element_header: QueueElementHeader::new(
> +                NvdmType::GmcApi,
> +                size_of::<GmcApiHeader>()
> +                    .checked_add(payload_size)
> +                    .ok_or(EOVERFLOW)?,
> +            )?,
> +            gmc: GmcApiHeader {
> +                command: command_id,
> +                size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
> +                sequence,
> +                max_resp_or_status: max_response_size,
> +                reserved: [0; 5],
> +            },
> +        })
> +    }
> +
> +    /// Returns the length of the whole element, both headers included.
> +    pub(crate) fn length(&self) -> usize {
> +        self.element_header.element_len()
> +    }
> +
> +    /// Returns the number of queue slots that this element occupies.
> +    pub(crate) fn element_count(&self) -> u32 {
> +        self.element_header.element_count()
> +    }

Let's provide an `element_header` returning the header which the caller
can then query instead of one proxy method per method of the header we
want to access.
