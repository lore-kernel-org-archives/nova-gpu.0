Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDD336F42B
	for <nova-gpu@lists.linux.dev>; Tue, 16 Jun 2026 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619208; cv=fail; b=Ti90H+kGN0JPfm2eCxfWcyHoVY+f6uNcJk4UOdP/HHw+seMsLJB0OV7FYQcGkTBGmzc8IXnZJXZdjMvu4Fh0kUxsXhkMBJwtCWMr6uVwS4A24VFBQjipUxtfOVSP04QqA8v14VMSVMBWMmOMD7MT+KkpkBfdexuVxwWvAYJsJEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619208; c=relaxed/simple;
	bh=WZFtGFqcTynFPQokDYKq1REB0pqtu3ZNkC4ENNjNK6I=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PLYCpCGlzNixtj4WQpC0wvzGsFpf7XB5Z25+EWGLr2rK2idOs/oO4K80t/xtr3vzzsegfndV6v6aH1TXUCd2Gu6ODJoevO75rqelN2j9RU1OR1blnme3FFmcc2l5NSzAIQNp3eSxG/AanLGw2EwFDlU1Dr7qPUNAgyyMCgjz1P0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yf4E7LRx; arc=fail smtp.client-ip=52.101.62.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yf4E7LRx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMdh6Up7S4YlU/7M9Wh/bOS9zzA/Ol5domOi1lwXYCWKYK1+rQsYF5juUpqphaI8uo9x9ddfqzd+y/0kicjELQgLrEx6cYzq558qIzJcp0Rvek81p3GgYRJRn73ybfMSnwY/Wqj1v1K5iTQuQBeA/R7D+ChGsICSvuFd2pC26fsxs8jMxtkigW7WtqBpnqkF8gj8cDGe043DrC2PbUr0lB2G3eFHr9Rrob07vDKNRpeyk2jqja0ZI9RcizpiFyn7CgdSgyislXmlOz2XW8N8LHHswHzwEuzopVN/ysurmAwJ0jPB4wew4wk5FUQpw6gV/NDo32LEfdSCnGmRuAILJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9jjru9qlD0ZHSUFrIiOjvxnWGoAX7xgrrUS5990lD4=;
 b=EDR0TGyslayGKsDsmuwqcQePwe2yYDjlBay7rd0AHhvddWYCq/xcKryFjLUCYuXd9KOrm/j5f7p03ZCLUOfJH5ZL7jbv/uES9jvcV3KwftRqD6TCZOt/JvNCVvyDwSg8uPkMYJg5qn+6taP1F/5EQNJy3imhQIwzoAjlw4vljZUykeKMEUF9iCpExivtT9/4P9lxMFDdzizN5gJTVA+9tWQhmfYiYOqSbuIoJDhfzwpKKQ5XpX9LEu4g+obyyoyd2i1u/DnVm8i+YAY15ddis7jbIfH9oegBLHue77GqTptwOzhgipaG0ZuoZbapZqJGd0dYQR02VIBx9u0DixREaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9jjru9qlD0ZHSUFrIiOjvxnWGoAX7xgrrUS5990lD4=;
 b=Yf4E7LRxhcdX7BcrSazPgiLjIoF1ZgEY/9XDtBBqqahj1otyIr7+EHbm5vWftp0DqdZ/CKEiaPxxmbEdhff4JmJdqCArFt7ombAE3abT78ktXT+j/wRTdHO5rOuNzqiAHiH2sy4ReMTzTxhtAaIn5tp0I7Za82Newzyy79y70TIroBgtfOOL6SqedjaYmJWzSW430omg/XJoV4T82A986FPpJxRpfs6seS3YlLqL6oowhTkhZXDgspesnK/dndbV/H5ZGHgMVCBDT1tLJtmdkeCqyyNfGX40+w9bTpAfW9z0tjxstBFRAlZviGlJqF53RoL9k1QWtODVT7TtqL8G0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Tue, 16 Jun
 2026 14:13:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 14:13:12 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 23:13:08 +0900
Message-Id: <DJAJAKA0TXSG.C1AYAKDAWC11@nvidia.com>
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
Subject: Re: [PATCH 6/9] gpu: nova-core: consolidate GSP boot parameters
 into GspBootContext
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-7-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-7-zhiw@nvidia.com>
X-ClientProxiedBy: TY4P286CA0103.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: e97f2f77-d72f-4e68-d946-08decbb166a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|23010399003|6133799003|3023799007|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	k2f5I6cEm5JEzpJ1eGeOCxAHBMsmbqaMMjsVPNX5AeJ7Jm0zg/P5NligF/lNCzRIw5U4kaAmYmqCP7pnBEZhLOEJWNTOvFXVPDH4FCm/5SEhUvzwoS/lCbJMyB8jlOIhI4vJbebLG+cC2jTUe9ilblJg7gdF0Nb6+TpCpCWEXklRde1jLe7yTCu9cfl9++SFr29ROMRvBEzrdRDajFm0cjyyiLqpK/6t5ImNG3jcWDQ+NSixFRpS55NCFy5jyvpoaUdYWLm3a/92vAhMpr7zYY5bCtx5LfA3yaToKKnQIQ28zV1+0U28HPRrvFM73mHnUTKzQ1GW23C1r8Qec+4it2+BzdUe1ef/NB5dvKLUsJCDFqk+akwUSICVCNIw+TzHvwkbPJVBhoV9zG35eyrvx8J8g93dFaGhrGUEJhFK/59W2eRi2xqo9b/+1nUPeX0ISJ5YeyWTJ677edeAw5pAydXQJRVeaMs2THWb+cfDvELLTkeOe3giE8ohMKkCbFbNSpg/K2vJQsMM7zuDpZtoY2SoqZHKimzXhPTLtZ57UsB9UkgCuGMHMGJHYNzjxAsleg5hXisHpsc/BYTyx9txgJWlvLulA6SWUZvICaJNqphkYyP0YVPGq+KCsXHNDhsXuXJM9H8Q+WYEFeRQKq/kjrRlmawl8TkLEwDx/1d89OsDXWVvD42GjTYymdfg4/G3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(23010399003)(6133799003)(3023799007)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVJ3aEx1bXFUbjVnYTFjZFpWS05tNTVQR1F6eUp3ejkzVTFhRm9ua1dHMnp1?=
 =?utf-8?B?d1VoV0ZDN0lyODYvVWNlbjdPS2pWaUVJL3dWbEx1dXJzcmNOa3A5WnFQTmo2?=
 =?utf-8?B?MjlRYTAwTDc4a0tRVWIvNkdmMDJQeDJ0eWQ2RWpnY05pSzFMTmZOdllYdDBT?=
 =?utf-8?B?TDBFU3d4ZzE5c21NTTF6LzZNZGRsRGlOajJkWXFkaUxXY3hvS1o0WGloa1dN?=
 =?utf-8?B?a3hpbXVjTk4wY0N4Q0lWbUFLZmZOMkpjYndnbHBiN0NoLy9CWVRRWXRScmVI?=
 =?utf-8?B?WjNKZ3E5L09KNGV5Z0t5MjhFV3BZT3FoaUpFVTMrdVNoclNWb2txZDFZRW83?=
 =?utf-8?B?c21WRUFTd05nbHdKQW5jVUs1b3hBRlVOYmxVMU9uQWxldDR5M0h4RElFOTRU?=
 =?utf-8?B?WnN1akFGVlA4WDlXZTNGeHYyT3lKM1A4RVBoZ1huQ21NdW81TkRuZkoyT2gy?=
 =?utf-8?B?MGhCdHN5YmszV1dDMWFwN2RtNTFWSFVvczhmSkM4aHoyMFd3QXBhWU9NUlVT?=
 =?utf-8?B?T1Q3L0tlcG9JTWljVTdIbjRRMzNQREk3N1VFWXp2bkorU3E4VkFjdm9xc3Z2?=
 =?utf-8?B?ZXZ0cHBQUFJJQUFVbzZncGNWVExnSHY5TUNTaDUyTHNjYTJVeWt1elJOUGkr?=
 =?utf-8?B?bXg5SG1DVXFOWmpMUzlRSis3VWFhVlRrVkc4bmtqN1Z0L21xRS9uUWRhczhs?=
 =?utf-8?B?NDNRUitoSTdJRVJBcEk2em0xT1VyVVBPaFZWSnJUditEVVNsLzRRdXNZU0V5?=
 =?utf-8?B?V29PTEs2dEZSVUFGc25pSUJwcWd1bzhSRXZnTkRoR1dsbzNKa3VtZ0wzYzdZ?=
 =?utf-8?B?YU5YZHdxSGs0TVIvL2Ewa3dNcjFHZVUyTHNaNkRJbi9QUUk5dkRJODZ5bGhV?=
 =?utf-8?B?M1VTRGNMQ1lRZ0FQLzFKc1drb1hZOWk5N0RsK0FlVU1WcDU4TFd0Q3p5V3I1?=
 =?utf-8?B?TnQxZGs5MldzRWF4QVVsVGVWZWFPSkI1NXJSbFhLVWdBVGZhcHhyMlExZ2k2?=
 =?utf-8?B?Rkk4SkoxY3NtaWRhV1NWZ2I2anQ2bDdvL0t6TTRlaWYySU1zOUlGOHRPYmJZ?=
 =?utf-8?B?OEM0V3BXRlQ4VEJnVnlIMGkvWG9sQjBMU29oNVFtSVRBOHhaejdlV2xLVFUz?=
 =?utf-8?B?Y1JqWnNsQUh2Z2xsb0RhR2dRempYTUZPK08ycU1yYlRJNlJpZit4enNtMjRK?=
 =?utf-8?B?bmJmUTFnbTlRdlgraUlKRzRsZUdoZ0k0ZFNnYit0ZmN6ZDZ2UDdEN0I3Zjcz?=
 =?utf-8?B?U0hzR2c0NEhodGdCd2o3dk5xWDVXN0dlUDc5bldIYjhyYjZZY2VlUjMveXU1?=
 =?utf-8?B?R1cxTkw3ZUUwUzl6Z1VPaGdNWkQxVnpLRFZkRU1ybGtWUDFMNEFvbkhpZklv?=
 =?utf-8?B?UGFuVzBqM25jWDg0dXZNaXRVSThyK3JRWnJRU1FmTDBwZXgxNm5ZUXZkcDV5?=
 =?utf-8?B?Unk1Q3JVeXpTcXdkUmdCaWFUN0M5MmhNR1dZcFdDSUNtNjFSS0IzZjArbGFR?=
 =?utf-8?B?NmpqSDBkV0c4VVV2TkdKaW9hZHcwWUxOUzg5L0E4TUFXQ2RMV2UzaG5uTG5v?=
 =?utf-8?B?UVFjZFJSNjVKNkludVRQTGZDdHBMalZad0p0TFprRTQzUXJoUktSVkdnV2ln?=
 =?utf-8?B?U1pkckcxVmlLQ2tMNEpRQzl0VDVMMU4wczFqMmcwclFTM3huQlBDUFhSVUpO?=
 =?utf-8?B?MjhzUzdpci9KK1ZQZDFjRG9ISzJyNFVwYzZCZ3g4eUY2MEVkenVaZW9tNE9R?=
 =?utf-8?B?ZGlmNzgyaHNKc2kwZFFpUy9nVS84Z0FPcFc5YlBmUHJIN1VOTGk1RjNSTVlG?=
 =?utf-8?B?SHlXeTd3ckk0MVhMN1ZHWjArbjRaV0NvcEovWitvMnhSeE9EaVIxVTE3aWpp?=
 =?utf-8?B?U3NnNWl0WGRJSWhVK3FGYUdSUUlLdnJsR1lWNE9lTXVZVnVxOTc3eGhORTBj?=
 =?utf-8?B?cXNraWdFTHdENVFWcngyNnJDT29lYlVsT29PQ09HUnREclc5c05MbnVHdGtZ?=
 =?utf-8?B?RDI4ZEZ5QW1hU3VVa1pJYkdlbGo0bGZjSHpLNi8vcHlKd2ZEL3dTSEpmVDNl?=
 =?utf-8?B?dzZDeXY3Nld2WnhKaGcxZFBpSWJ6Z1RTaVExTjlYZzd5N0xBQ3dNOXhKMXNF?=
 =?utf-8?B?SFpIT1NxaHpuZk9XUWpYdEpzZjZHRmdVMW5yRHFDbkNVaE9kenZBUzJhVWda?=
 =?utf-8?B?OUV0cUpiMTNPdHZYdnhHcTZuNWhhS1BSOGY5TStPSTFnNldqSnVmbko2UjJu?=
 =?utf-8?B?M2RkM0xTamtCRXI2OXl1a3hLaWRnanl5RWJVVDFtZ0c2VXFLa2dYcmVRYk15?=
 =?utf-8?B?MU9uam13dldsL0RVdHIxa2VMekI4ZzFvRVc3WUFVeHArOVErbW9NWjZ3R2Y3?=
 =?utf-8?Q?hwQWvfulroCBFEx3sYWz61i2BsKlMSs+gELHs8KCaQD6t?=
X-MS-Exchange-AntiSpam-MessageData-1: JRLFQKV6xUTQ4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e97f2f77-d72f-4e68-d946-08decbb166a5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 14:13:12.7687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nQ+4RQCzn2310FXbC5KQemV94Nw+fsSJLUsfbvQ+7teCMB7zZedEfi+E/UBII+cVunpr+o1yd8SxLl4DzjdNBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> The GspHal trait methods boot() and post_boot() accept a long list of
> individual parameters (dev, bar, chipset, gsp_falcon, sec2_falcon) that
> are threaded through the entire GSP boot call chain. This makes the
> signatures unwieldy and difficult to extend as new boot-time context
> (e.g. vGPU state) is introduced.
>
> Introduce a GspBootContext struct that bundles the common boot
> parameters into a single object, and refactor the GspHal trait to accept
> &GspBootContext instead of individual arguments. The struct also exposes
> a dev() helper with proper lifetime annotation so that HAL
> implementations can extract the device reference without reborrowing
> constraints.
>
> Update both TU102 and GH100 HAL implementations to extract their
> required parameters from the context struct, and simplify the call sites
> in Gsp::boot() accordingly.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs           | 14 ++++++-
>  drivers/gpu/nova-core/gsp.rs           | 22 +++++++++++
>  drivers/gpu/nova-core/gsp/boot.rs      | 55 ++++++++++++--------------
>  drivers/gpu/nova-core/gsp/hal.rs       | 23 +++--------
>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 14 ++++---
>  drivers/gpu/nova-core/gsp/hal/tu102.rs | 31 ++++++---------
>  6 files changed, 85 insertions(+), 74 deletions(-)

I think this one is also good to take independently, it groups all the
context required for booting the GSP in a dedicated type, which is
something we might want to do as the SEC2 and FSP paths require
different resources (and thus could use different associated types).

So I'm leaning towards merging this early as it is independent from the
preceding patches in the series and makes the first step in that
direction.
