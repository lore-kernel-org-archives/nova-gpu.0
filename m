Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010016.outbound.protection.outlook.com [52.101.201.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D9F3B585D
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499090; cv=fail; b=fM7LZNeZlyPE1Bof8W/Vu6ajxaoGD9Wf/sXSd38GaIeBlGm3bdybjvca6+XFTkwm6vnOFYT3gPQagNmp21OIhexPyZ7e/UcIp7ct7QG6u20U60gAOZOh01UL7bdPY8n8gE5ducpNyArAel2JlAczk0ZKExtE0VBq4AZTIvfl5f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499090; c=relaxed/simple;
	bh=o+BLCQuPMHpmvsEDr7KdCFbIsI6MzSRhiBHQBkY3xpI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=r21KEXZV60lwJtSeZ1tBSdqOk4AspEJ+TmRCyxFWGgmvHUblYoYjze3KIOF6PAxrak5C+pAFq1DjkROPOj/BEYShz9kmw9LRVjN5TeKYlZGloJX3uKNOm84VuXT31nQmaoeBD1saVDyVUMduOFJE37TSO2HcCsr1Jss/CwimRPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OxNO2akG; arc=fail smtp.client-ip=52.101.201.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OxNO2akG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNtcOE3Vpc2RMvdW967vAnnyBl2ZH/f15psfIUoGrs0zsBXbZNaXvU2TylB22lcc71kjjKtcU3i2Umz2+bgAtNp3jeb84O0nAkqw1jUSWJr1Gw3ICeB3X8ac81C9QLkKNQPYvL3PFYX+f1kgmeHQed+L2Ak/SzxbrSqLkgM9w1bA6lRx9QRD26bVPHTrrcTwQjvv3+J3Aof3ZgykE7pdrpwr/HLDIwEUGmH2VLvjyTbiuV74QvylVpglwRTZ6M3BtDUxsonPWAP9X1aT5IQ0SvbM756rx2VnG6j/Q0tg3ztFA/8fFMR1uIF058BKRjY60Xo71lT8jL+E4HWgVkQEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HACS3K/31mYJ38pCk6RCKbWDCSjTBdCtyhlltSjKuw=;
 b=kqNedWEZdGaoNwxum7yRy1YwBb49VK/7horacfnr00Uk7EP5g7FqVeGtcrc1YOmkYpQ3ZALSCGM8M6fsNe5NzCU7nY33tiQq8Q84SKxwtohLvMvC0ldTtZI1bwbiWiBU0VFv5R538kDxfpfAgkRBnoeVnoR7Jds/LOc71hzd5RyHIQDu0a1RpmTcKXIrYuVH9CuIOHqcjFM+INUjleJmHG30GcpAL+mse5M5SOvHP6PXXzbjXBLyOV2KMCtyobIczXJNP1grVzdpy5NwIER+M/E1timcoZsGBroTIKUIFXIJGEjntMCsN5EeeFLmfY5JQUyk0SZY4nEA7kEEtCGYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HACS3K/31mYJ38pCk6RCKbWDCSjTBdCtyhlltSjKuw=;
 b=OxNO2akGVxiOELHRAjp0H33E7QaOw3WNSq0bFn2mgYTijEMebpVKdFi5OSctzYxdWwdCB2b/yDOiSQ2Gv1q7Q+2dC+NpTiLOWk8+1sDkEbo5ar5G8nCwELGUs+WT3WSUhQtrSDzAulFW7vWzTNpsfc8pX/0hf1ppUQIHmB9YVoNyMzuN+6sefl5isI2UgJLGL1IMYRAVVd9++QXDHDLusZ8IePgQ3QuHF7UFdBRa6OmECxaSO4jnp6tsN+w+uejdgdmuBaIDGXw6aAnGVntVywnKX5T3MnZrqmJrEokPj9HR9C11ZNmUTshtFoSJrHZ5INM5VgE6xfFEYZ8cHTvo6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 15:04:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 15:04:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 00:04:34 +0900
Message-Id: <DIZI8UTS00KG.2T8XR2LIE54EF@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 0/9] gpu: nova-core: Hopper/Blackwell support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: TY4P301CA0070.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 6807e457-cacb-4423-2bd9-08dec1816e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sbg6vciIDv/3bHPW3FkDeqpqi33jqfcZXSXtm1smcrdnfQbsJMli+I9DPqOwdNGS5RpkwgzfjG72j5rLXip4uYfA1tOMDov+HzNNxwoMPJtp3oiRfrTTqMDCb1JQEPPSXjFdQzztAj18TSvHGXU+n12ZBIplaoXFkrVsOz0xhQJeO3sMJ3EB1XD0YbLhny9eG4j2rpOu2hAzU6MztP0tylnY+ql/EKTzLzHvuV6iqpnTYH6lCEj+rxyOHLMsm/lNdWoNFk/JFElk8ryLpMLVjwB8jD+XF4n9qjunv/MsxqNSJrwHVdH6KI5qrOJ4/jWj5Vfg3TI+OL/IeguI7YdwicKrPqjZ59p//HsV6Td6ZKCsreCrrzCFhxUHifQROEdqurUGDL0TbrvX/50FZhM+EpbBQKSa4wns++e5VLwFxXVr9KefrujF2Avsb4eo/kOU8CVl4sJWxcSidiU6f7sdxEkoaYmpOsEJa6cpZhwZzFNvQXCUE30PQkXYfAVptQ/YukGsl60EqZBoEuU+AjmnlqR/bcyaJxKTUAhKkpY+lkLHlQPAu+49BEaaO0CrPo41ukPpYdE1pZtr0Ya+YQsCRNHzRAatzSIsk+SfI4FFVFPaJT4TC4iOsphBIQh07MjLUKLX0lvZmTzFEKWECKIkgl3Xdp/H0BvI8T69km1Hh2pCqj02hyu7CJKsg6Q+zKvm
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmFuYnFkTmhaTzN5QmNWNGh1amlDQ3B5UTkyWjFoamtSTXdTZmt2TEdaUktp?=
 =?utf-8?B?NjN5MG10TGlOUlZ5ZVYyQnlyTE9FNVNaT1dHTTU5VmhYUnhPMERqajFFQXhq?=
 =?utf-8?B?VE1YdlF0Y3F6Ky9GcW1HYSszemx2aWs4ZXZrYW85MUFaNDgxQjYwUzJjekRK?=
 =?utf-8?B?a2VpbllJS0NWZVpHNThzREZPU3JvdlhVdjI0OExNYmxRblVQL0VrcVhkeTFD?=
 =?utf-8?B?bWo1UjQvN3diZldyQ2dnNXJBQWd4Y3JGdmtjbElYYU04VStudko2V2h1TXpJ?=
 =?utf-8?B?Y05Uc2xGQ2cwSjUrU3lGcVp6S3lkMXZFcVYzS012NUJIaDM3NHFBRFB3cC9Q?=
 =?utf-8?B?d0FBQ3RuVjFPNkw3Qmp5RmFNOExyNmkzMjNzRFlaclNZV2lsU2JzcFFjbEFp?=
 =?utf-8?B?YlY4Y0Z1V3lGZ080SWVyN1RxSVVoaURSaFRLaWdoQmkveWQxQjBtNExTRTdy?=
 =?utf-8?B?Z1ZGcXhsYXJLM0R2WEZNQ2hqWVp1MHRvREZpZ040TGtLUCs2TksxaVlxRVZF?=
 =?utf-8?B?NlQ0dDVmNkFDVGtnWG9jRGVnNnBhSmxQUkQ5QkdmV1A5K2pMWFhXVGlxdEVE?=
 =?utf-8?B?SU1RcUJ6aVdjT3lHMTRibTdWczMyRWpTNjZnVitrRDFsMi8yc2lIVmF6dlVB?=
 =?utf-8?B?d2pxWDN1TmhHL1VPYmRoWlBDQmxOeFhuQjNXV2taU1grNGRlYjUyL0cxazkv?=
 =?utf-8?B?RWVWTjFBY1E2cnJvdXNPTCtlRU0wZ1ZCSlY0Mk5xUVRvbU9veHR5RG00aUdr?=
 =?utf-8?B?THFMU21mbk1qM0VVK1gydEJnbGt0TjlTeHVnY3M5U0xhbnJrMmhyMkxYazZZ?=
 =?utf-8?B?RlN1T0g5NHlaUUJ6VkcweHg5MHA4ZUgwOVFRaUM1aXBFdmZMYklkcldDWkJ5?=
 =?utf-8?B?b2JOdTNjRjJtaWNRcmlubVlRaFNubmZXaFpkdjg5M2Fnd2NhN0d5alMvUnZn?=
 =?utf-8?B?MTZoR2tjYytBWEJXSlVUQSsyMXpLcThRSXlmUHJpeEFRTTBrSnpMTHRJVEpk?=
 =?utf-8?B?Si91ckNkSFdSOUZoOGlpRlRNSlBDSXA5MXNZTnd5bVQycFcyZUVGVFB3cWpR?=
 =?utf-8?B?RzdLTjFROHZ3OVp2L1RlNXdQd2RQZlNaWnJhNXRhS1FYSkpNcXorMGFrb2F6?=
 =?utf-8?B?UCtPZEZMTTFlYTVZcFZ5eElUczJLU3lQOGpCZndadjdGblJ2UzZJR1d3K3BR?=
 =?utf-8?B?T25DdzVMR2xmSkY4eDQ4UitnSVJoSE9uSzduUG9ib1VwSHZ1T1RtWEdXTHVD?=
 =?utf-8?B?Vk9iQmhCZ2NHK252ZnZXeWR4b09iL0N0U3RvdDhYTXBZaGh1OVJBUThRaWFz?=
 =?utf-8?B?bEVETGdiNEV1UkVaT2wyU3lBU3pNVFpjSjMvRG1Wd0ZTVCt6MElCUDZFQWkv?=
 =?utf-8?B?NzRoWDRTTGdVVEh2Rkszdi94a3B5Q3J2R3l3MGUwcUZXeWNXaUk1L0RCbnU5?=
 =?utf-8?B?aG8zWTZ4ei9WdXZmTUUydGFRazVYZzFpSk1BUDZSTUdMbkt2blE0NUdldVVF?=
 =?utf-8?B?NVNUT08xOTZIRE5ERW5VT1JhMEVBNkZ2YjAzZlNFYUcyWGpKaFU3M3pIMW4v?=
 =?utf-8?B?VlNRU3lQNjRvVGhRRXdrdHpYUEkzZEt4QUNZSVY3MXU4Z1dWYlRPSENVVnM3?=
 =?utf-8?B?ZkZra3YwaFJMQkZIOTl3NkVWSE1Ec3VXbGZZR3VMTEFjL3VQdHdxYWl3TXk1?=
 =?utf-8?B?MHNyWmNVWktneEdGYnBLVUVtaWhhelJ0NmNKRVFDOUJsNFRaQmpjbUM0SHpS?=
 =?utf-8?B?Mk5SZFdoeEp2TzBMNFFzVkxMV2lFS1FVWGlEUXBoN25FVDBSVThNbEkzbXh3?=
 =?utf-8?B?VjZ1UlBqVlBiUFBaMTBjYVp6Snh0YU5iQUNnbFV4cEVva2JtWHk0aUkvQTI0?=
 =?utf-8?B?UXNLMjdIenNzZmw0U016U1dDRGltTjgrNnV5c0hPYTM3K3FOSmlSdVUxOS9J?=
 =?utf-8?B?MTBLM1V2bzk4aStCR0haOG5lZmRkN3lTWm1aby9XVDQySDRpbnZPZk0wcVhn?=
 =?utf-8?B?ZWpuQ0Y2bFhGckM0Q3ByUDFsbC9ZeFl4T2xFTDJXeitkejVBMkc4dnNMUjVt?=
 =?utf-8?B?ZHJtVlV1VTB2WmZDMEV5YlRteGV2WnJoVWhGV0xkdm9ZQWdkU3JlRTFIclh6?=
 =?utf-8?B?enN2YmV4SUhhd0F3M2x2M0ZsR241L2ZBclBZdE9tSHpsNWNkWmpoc1dNczMy?=
 =?utf-8?B?TUtJZGJWc256cHJWRjFuTGZiWVRFaGVUbkFOdVJnNEFoZkcwQTg5NytjOWo5?=
 =?utf-8?B?N2hvb2YvQWp1cFdwbkVzaDdzMVZTUG1jMzhCbzJoa04zbzF0QlFrRHFmTFlU?=
 =?utf-8?B?d1hWdGw0L1B0RGZOVG92S2d0VDc5SDVpdjNvVTE3Rm9YNE5DeG9XMXBuVDVq?=
 =?utf-8?Q?M6LrVlYs0qN7j93QuW33VzhHllKci3oWmU9XUBIg9Fyhh?=
X-MS-Exchange-AntiSpam-MessageData-1: 5NHMy2KInze1Wg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6807e457-cacb-4423-2bd9-08dec1816e39
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 15:04:37.9284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CULxa+Rn8H4/KjBQVLTzK93NtFd3nwaIHCqaalodJrbuuh0mGm+VpxT6/WAIIfDqr6dE4rv7qBZURZLuN7PsRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481

> Alexandre Courbot (1):
>       gpu: nova-core: gsp: enable FSP boot path
>
> Eliot Courtney (1):
>       gpu: nova-core: add non-sec2 unload path
>
> John Hubbard (7):
>       gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
>       gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
>       gpu: nova-core: add MCTP/NVDM protocol types for firmware communica=
tion
>       gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
>       gpu: nova-core: Hopper/Blackwell: select FSP Chain of Trust version
>       gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
>       gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling

All patches pushed to `drm-rust-next`, with some last-minute fixups.

Tested successfully on Turing, Ampere, Blackwell.

Thanks everyone!
