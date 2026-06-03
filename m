Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011042.outbound.protection.outlook.com [52.101.52.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A192B47D93C
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 12:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490885; cv=fail; b=rHReSMF+U3JC8KN6fyPqim19ZoHwAsWz3bUYy2bQ6DsxyHeh7rvsCQfI+nyzXVhQ6qxF26mmGTb+kNcYBsoBL9jrjl+jU7qS+itao2zTpo3mhU9cBX7ZDOKw68eEeJx7WR1/UcfF/TsQ8wEYncjVXG2wns0qEy7gwh7nQQKEXYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490885; c=relaxed/simple;
	bh=S+WwKMObkyHCRhz8XTqHtXDGFvRGhDTe1QAkXwOuOq8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Khll1inpK3Kss6w6x6N+AS9S3Ho5/igxb14TeiigTM6NLrHNikK2fL1O/iu7FMf+ezhW2GxF/1EH0CQWvfqqIzp9RX4ysIePxMUdzypnFfT5n/m8lglJcdv92dkQpTWiUqQ1Ka5aO9pb1kO6ikifAAGj9OU2iSG4kelkXQHmfCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jdhItzIj; arc=fail smtp.client-ip=52.101.52.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jdhItzIj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ESc8K34ZKnS/OM0Dfip/ipXn9H/iYi/tkAFXKm+RqjZDmbDiUYUDAN8/NMGjGCOjRNle2/2QhTYRLvrbqSP7NngYgzOdwlcvUZXhTaITA0cBh9AwFd5lpMxgImvj7mSPYHSN7bRsu+j7Aue5SUaZ45wvRJVEP9me6tM7gt+idJYhhHqVqJzPofbqAVDjDPCQn3tHQzkvCh5W5Qv+CeSi83Htty80gzQRF86s5fqu/aNHyMT40cB/OGEHd7ui9cu7CjG0LcXva8lUUtBL2tedEF0CFSM1ger3vf0y+m5yUmcDgOOXy/LL7i9IuF3raJUAMeOSAUQLe8ozK2RD00hlnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyTMjkTpG5IoWx2MTtNR5o7SeBFzLh10HiI6NWhbrBo=;
 b=YqQEKSqHxj2Ql+Q/rFNGAgdCjtVxxh3n2RkhCPrfLBNcf9FcaRTysApFvQI3gS1d9OYKvabsCBmka46+VFRuljrNMNsTwcTxkozfbH2dl67uaEq7Ubwt0CLm5cBCdhNGaO1ICfbvAasCPcP4szgH5PXJ7ecTK3SEUmyo8/leWLElF/JA9x7PXndRm/kT+7TxGN7GdzAIGa7vvpJtUGCsA/9r+FZ8hHO4uw04K8Lu4hvuJIP9BKenhj73alvqgFqTINbjqbQCbEMr1oaarPEHjg+v7Y3Wx3XHUoxtwTBVZY4tNcnIoBbNybaX9wzDWiK63/4wIPZLIuqykgNY7Ick8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyTMjkTpG5IoWx2MTtNR5o7SeBFzLh10HiI6NWhbrBo=;
 b=jdhItzIj5aeVCtwkK9aUIIUjvlu1AFFEJBRx7nCjXwzjwYmGq52V6ZSs3VW8SgGKYNVaPmGopw2PfS8CNkvYr6+bmAEeRqpVcIwI2gwQMNN+99r9T1hVD/SfHUSgCgRU+FUpbs5QqFNvW53ip8gzePGRyAf8MSh3ayQv6rNbYohtQCfBI8iMvu0OGj2dZzXFTLin7r6xQ9113NOwMir+2/afmCgSXmT5qfReru/LJlNVTnj+3a50dnsA+SQ+ZaimioNBxXpXDrD22sZ/drtaqJpTKGUUQZWUgQsCXN0ySGKDdCA91bHXQuePDCiDh1d8bYT+SIRm50Uh/MW99DioFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 12:47:51 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 12:47:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 21:47:47 +0900
Message-Id: <DIZFC4HD8M35.36YODW6I2HAMK@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 6/9] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-6-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-6-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: TY6P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ad1392c-4016-4208-5c60-08dec16e52f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|10070799003|1800799024|4143699003|11063799006|6133799003|18002099003|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	+TO4Qz0NwNT46RYPmDsBQcHCqlAkayvIA/Dig7xzcUgSiSm7BYR7Uo8OfBuKk2mDgdgH4i8GaRdp3awWrOpTw5eiz3EzcBedsAjDNROBLO3ZSAOdYjnqqf6D+Z7aOFnCJKg1BLGUjs4Ev9ErGmw7JY42518dno01UYseVPXZpFYYv4z9jsNRnTwEsw54f1wzVpYLiCZwsDmCPqsVk4bXoJSEaT5CWjREBi/PaHua77u4yVMJQMKFZO1OKcuyO1G/xgt8tAyX2xeaJ6iX46CqT+Kuk9t0t5q4urKidUH1v8fc0kwm+x4GEoqfQCvDnH46elNf1UsIFSDJiqEn5oN/Qyfq8hN7M6HfTPnUrOD/JkbatWNiwrYldfwnw+cs7ZBlz1zFyIOGXqxoFgyQpokpkKXIQuXsIMcaRYGeFLdTZQUscNeOJXKt0JJAAoWBCD6/RLjGjaQhJXhqm/Smb3u6SehhEAJr7Jzka4tLE3U8y5BuV/iflLUCVmR7N+SnDSA62/+Oqz8bZwRxdMs5ElIdjy+k9ziJhSHb9G4Knut9fTM5EWOKcQzcnUYK9XqKISBk0THuviCutRfjLHm6ml/ByXl5D8HrrfzOLgqjQrMDBQIHKgJPlFN5OPdj00coJLTZHnpu2lejkTFW0+f0sY0A/Otfa0WU0f5WJGOVEJ6s3x/6ds4VfBiAKhosgooDZek1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(4143699003)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3dtYVBvSE5HakFGMW5JZzAzTWVSanhoODNrNCtNVGhoZld6L05GR2JzdkJN?=
 =?utf-8?B?VkRPY1Q2ZU91SnNjbGU1SFdJMHJYTUtzSTlYVkYvanEwc3FFQmw5ZXpkWit5?=
 =?utf-8?B?bFpnRUpUOGV1MUVybS9NRGw3NGRuQk50T3lnQ0JaMDErVDArUUVxSmpPMGlt?=
 =?utf-8?B?aHY4WFVXM3dhQ1oxSjU0M1pjRHZNcEpZWG1FTzBIaGU2QzRFK1d2OUNlQi9l?=
 =?utf-8?B?dGxtVjBsSmV1T0dwcTJITmR4d2pBdXZVMHVXcG1YU2h5emplSzAwME5yTW1m?=
 =?utf-8?B?MllhZVFtWjY5VG9xSGFiWTZZTXgzTjZmU3BUUjZBRkpKWnBDMlhVS25zRkxz?=
 =?utf-8?B?VVl3VlVaT2RwaTdaUGhKRDNtVEhRNHVMa29vNU9sTWNiZjczWnZVRGdTNmlp?=
 =?utf-8?B?N2Zmd1JEOWZOMVdYYUh4ckt5QTdjY0M3dHdLUGhwWlp4bWxUSzczTk1HVlJ4?=
 =?utf-8?B?YWlMZzYxQWFxeFBuWlNzRW9JRGJLdC90NFcvc2lMZlNUeVJZNGx4QitETEZt?=
 =?utf-8?B?aTgzOXQrUGxSUktMRjBmN0U5ZGMwZzdVZ2hadlJZTy9OajRobmxnMEl3dmoz?=
 =?utf-8?B?UEJpMU4rRnozUXpuMUU1R09UUUNoRFVLWGRLSHNudEpOWmt2YlE5RUhqaVYv?=
 =?utf-8?B?QUpvdTU0eVFRMVJRWTJTZ0VUN1BoS0xYSXZvQ1gzNlJDZktJVVIwdTI0cjlz?=
 =?utf-8?B?OGJkT1hWaEdVNDRwVndGWS9iNU5aM05nYVE3SEVyOFR2QlFLczA5STJDcU5F?=
 =?utf-8?B?TGg2bk1oMUFyL3FQMzVzWDdPMzl3eTdLUHJlUFYrUitDMktFZ1dDVW9QTVV1?=
 =?utf-8?B?dnJxdXQ4Q0svK01zVzArYmV0TTFMS0hLKzJzVGhrQzFDdjN1d1lLSG1VUmEr?=
 =?utf-8?B?Q1hwV2oxSHQyR2RSMFo5QTdyNzBZM2ZIZHN0QmlqcEpCTUhyN2RhQXh0U2hh?=
 =?utf-8?B?aHVvd1NvbjRMclBrejBXbE5Sd2ZCWDNVR0hUYlAwamZhRUNIWnd0WS85TFF3?=
 =?utf-8?B?TFRxcmNmeTVrYjlncVFTRU1tVkpWUjc2R3FxNnNoT1Z2am1LL1prV2REdEQ0?=
 =?utf-8?B?VzQ5eFd1MzJkaFpMVXRmUVpSNmRpMjFvam5ZQk5UUTlybHZZOUdkSVkyTzZ2?=
 =?utf-8?B?ZG9HSnBmZGc1RG42Q1kwUnQyempSY2JIMGhINzh2TjVqS015SDhNWFVwa09p?=
 =?utf-8?B?anZGUW8zK1V6RllSZVRhSmM5ZjRZMFBBOWRmVzdBY0Z0U3RBK0dOSjNwRGlL?=
 =?utf-8?B?TWtFT3VHcjFrUTkrcFhLWVlnNDRORzl1OHRITGRqdXRXOWNJdUM0T0VJemRF?=
 =?utf-8?B?VnRkSC9xNXlaTTdzMzRVWFVCbXIyRS9DSktkaHlETzFnN0dmdjJVbHRJUXZZ?=
 =?utf-8?B?endBSEpCL3Y5dzlZU05jR00rbm1zcThCT1hMdWRJVk1VMVNzRTVGdmpyZVpN?=
 =?utf-8?B?My8xMkJrUm13UDQwY1JQeXRNZnF1aG5HR2N5VUQxcnZ0U3hLY1V1RHdVNldi?=
 =?utf-8?B?c1F4aGNQbk9PcHQ1dlFURmNyZk1zcFhCSW1MSjN3ZlRjM0FCeUF3Vnl4ZHp0?=
 =?utf-8?B?WHlhQjI3SE1SSnRlRlFPZXcxM1ZTa3JWU1ZBUSttNXJyRElaQldUNC9oclQx?=
 =?utf-8?B?Mk52WUxISE5xSzJjMTlTYUR0b2F2THRzZkZoa0YxcVhidDRrdWtLV0dQQk1T?=
 =?utf-8?B?OExFTXNFbHBtdVJPV2MwUkZlaDE4Rkh6Y0psbEZrUlNmTlpkRTBYZmNpVnVS?=
 =?utf-8?B?VkpxMlllWVpqMVVtRDNsMHFjNDdRZDZLNEp6MFJYQi9EN1NNRG1wZUtkRWJZ?=
 =?utf-8?B?OFY0MmVuSDZWdWZnQVROMEVvQjhBRktrcWpDaDVqNEZzWityb0VmVUVSWjdk?=
 =?utf-8?B?U0taNUhiQm1XRDdHd25Ub0k5bXJnc0RtOTAyZXRjcEhXUlNrNE5IUk1tbFJV?=
 =?utf-8?B?SHJYUUVpaG8rNXJlZXk2M3ZBeTd6c25ueTdWY3dqLzVzT0QyUVpKVGhhYW9y?=
 =?utf-8?B?SW16RWRLUVg2WEdWWWFGbUR5OGRPQkRJM1g4cWNBRFVRc0ZxNnh2R1N5LzFh?=
 =?utf-8?B?b085VE0vVjI0blE3MGRKNGRlNUNXSmQwNENMcGFINXp3RTFNOVdRK0crUmV4?=
 =?utf-8?B?OVJOc1pPQ2FuSW9XdlVIUmR5QVc3czZnazgwSDVKNHQyWVpNRWJ1T1pUalV0?=
 =?utf-8?B?eTluMTdJMVQ0a1VSQ29yZnNEN29CeVpvampoUmx1b3kzU2Q5SHA2bmxKeDBT?=
 =?utf-8?B?NVRETTVpcVdyZjZQNDl2RlN2RzZYd1lpRWFIdytwZW80Z2VZc0FIS0hLSkR6?=
 =?utf-8?B?NHg0WHV0VWNGQ1VPNDFwdG10NE42VXRhdEJhcnRuZkRmT0ZqZ29HVXFJRWs0?=
 =?utf-8?Q?d6Ze8RlqhYmL3dwhZZNuhNifiVshHEuh5di73tTQ08uRs?=
X-MS-Exchange-AntiSpam-MessageData-1: CigxKB24h+nZ0Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ad1392c-4016-4208-5c60-08dec16e52f1
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 12:47:51.8061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j7cNcXDbzd1brgzzT8HfUatjpINb+LU0XeehweWylqA4PRvU/X6PIJIsO/EZlm5/F02lAcaVlARBVCLqI61Jyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> Build and send the Chain of Trust message to FSP, bundling the
> DMA-coherent boot parameters that FSP reads at boot time.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fsp.rs             |   2 -
>  drivers/gpu/nova-core/fsp.rs                      | 145 ++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/fsp/hal.rs                  |   1 -
>  drivers/gpu/nova-core/gsp.rs                      |   1 +
>  drivers/gpu/nova-core/gsp/fw.rs                   |  65 ++++++++++
>  drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs            |  23 +++-
>  drivers/gpu/nova-core/mctp.rs                     |   2 -
>  8 files changed, 308 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-cor=
e/firmware/fsp.rs
> index 9b211426a75a..6eaf1c684b9d 100644
> --- a/drivers/gpu/nova-core/firmware/fsp.rs
> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
> @@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
> =20
>  pub(crate) struct FspFirmware {
>      /// FMC firmware image data (only the "image" ELF section).
> -    #[expect(dead_code)]
>      pub(crate) fmc_image: Coherent<[u8]>,
>      /// FMC firmware signatures.
> -    #[expect(dead_code)]
>      pub(crate) fmc_sigs: KBox<FmcSignatures>,
>  }
> =20
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index cedfea173e50..883ac4f8b811 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -9,8 +9,14 @@
> =20
>  use kernel::{
>      device,
> +    dma::Coherent,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
> +    sizes::SZ_2M,
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -24,13 +30,19 @@
>          fsp::Fsp as FspEngine,
>          Falcon, //
>      },
> -    firmware::fsp::FspFirmware,
> +    fb::FbLayout,
> +    firmware::fsp::{
> +        FmcSignatures,
> +        FspFirmware, //
> +    },
>      gpu::Chipset,
> +    gsp::GspFmcBootParams,
>      mctp::{
>          MctpHeader,
>          NvdmHeader,
>          NvdmType, //
>      },
> +    num,
>      regs, //
>  };
> =20
> @@ -66,6 +78,114 @@ pub(crate) trait MessageToFsp: AsBytes {
>      const NVDM_TYPE: NvdmType;
>  }
> =20
> +/// NVDM (NVIDIA Data Model) CoT (Chain of Trust) payload, the main
> +/// message body sent to FSP for Chain of Trust boot.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy, Zeroable)]
> +struct NvdmPayloadCot {
> +    version: u16,
> +    size: u16,
> +    gsp_fmc_sysmem_offset: u64,
> +    frts_sysmem_offset: u64,
> +    frts_sysmem_size: u32,
> +    frts_vidmem_offset: u64,
> +    frts_vidmem_size: u32,
> +    sigs: FmcSignatures,
> +    gsp_boot_args_sysmem_offset: u64,
> +}
> +
> +/// Complete FSP message structure with MCTP and NVDM headers.
> +#[repr(C)]
> +#[derive(Clone, Copy)]
> +struct FspMessage {
> +    mctp_header: MctpHeader,
> +    nvdm_header: NvdmHeader,
> +    cot: NvdmPayloadCot,
> +}
> +
> +impl FspMessage {
> +    /// Returns an in-place initializer for [`FspMessage`].
> +    fn new<'a>(
> +        fb_layout: &FbLayout,
> +        fsp_fw: &'a FspFirmware,
> +        args: &'a FmcBootArgs,
> +    ) -> Result<impl Init<Self> + 'a> {
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !args.resume {
> +            let frts_reserved_size =3D fb_layout.heap.len() + u64::from(=
fb_layout.pmu_reserved_size);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<SZ_2M>())
> +                .ok_or(EINVAL)?

Why is `frts_offset` calculated using heap and pmu_reserved_size rather
than looking at `fb_layout.frts`? If `fb_layout.frts` is the location we
are meant to have the frts in then why use a (potentially) different
location?

> +        } else {
> +            0
> +        };
> +
> +        let frts_size: u32 =3D if !args.resume {
> +            fb_layout.frts.len().try_into()?
> +        } else {
> +            0
> +        };
> +
> +        let version =3D hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?.cot_=
version();
> +        let size =3D num::usize_into_u16::<{ core::mem::size_of::<NvdmPa=
yloadCot>() }>();
> +
> +        Ok(init!(Self {
> +            mctp_header: MctpHeader::single_packet(),
> +            nvdm_header: NvdmHeader::new(NvdmType::Cot),
> +            // The payload is packed, so we cannot use `init!`. Initiali=
ze it member-by-member using
> +            // `chain`.
> +            cot <- pin_init::init_zeroed(),
> +        })
> +        .chain(move |msg| {
> +            msg.cot.version =3D version;
> +            msg.cot.size =3D size;
> +            msg.cot.gsp_fmc_sysmem_offset =3D fsp_fw.fmc_image.dma_handl=
e();
> +            msg.cot.frts_vidmem_offset =3D frts_offset;
> +            msg.cot.frts_vidmem_size =3D frts_size;
> +            msg.cot.gsp_boot_args_sysmem_offset =3D args.fmc_boot_params=
.dma_handle();
> +            msg.cot.sigs =3D *fsp_fw.fmc_sigs;

I guess we are leaving sysmem frts unset for now since we don't use it
for anything hey

> +
> +            Ok(())
> +        }))
> +    }
> +}
> +
> +// SAFETY: `FspMessage` is `#[repr(C)]` with no padding, so all of its
> +// bytes are initialized.
> +unsafe impl AsBytes for FspMessage {}
> +
> +impl MessageToFsp for FspMessage {
> +    const NVDM_TYPE: NvdmType =3D NvdmType::Cot;
> +}
> +
> +/// Bundled arguments for FMC boot via FSP Chain of Trust.
> +pub(crate) struct FmcBootArgs {
> +    chipset: Chipset,
> +    fmc_boot_params: Coherent<GspFmcBootParams>,
> +    resume: bool,
> +}
> +
> +impl FmcBootArgs {
> +    /// Builds FMC boot arguments, allocating the DMA-coherent boot para=
meter
> +    /// structure that FSP will read.
> +    pub(crate) fn new(
> +        dev: &device::Device<device::Bound>,
> +        chipset: Chipset,
> +        wpr_meta_addr: u64,
> +        libos_addr: u64,
> +        resume: bool,
> +    ) -> Result<Self> {
> +        let init =3D GspFmcBootParams::new(wpr_meta_addr, libos_addr);
> +
> +        Ok(Self {
> +            chipset,
> +            fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP=
_KERNEL, init)?,
> +            resume,
> +        })
> +    }
> +}
> +
>  /// FSP interface for Hopper/Blackwell GPUs.
>  ///
>  /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only return=
s once FSP secure boot
> @@ -73,7 +193,6 @@ pub(crate) trait MessageToFsp: AsBytes {
>  /// Chain of Trust boot.
>  pub(crate) struct Fsp {
>      falcon: Falcon<FspEngine>,
> -    #[expect(dead_code)]
>      fsp_fw: FspFirmware,
>  }
> =20
> @@ -109,7 +228,6 @@ pub(crate) fn wait_secure_boot(
>      }
> =20
>      /// Sends a message to FSP and waits for the response.
> -    #[expect(dead_code)]
>      fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg=
: &M) -> Result
>      where
>          M: MessageToFsp,
> @@ -170,4 +288,25 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device,=
 bar: &Bar0, msg: &M) -> Res
> =20
>          Ok(())
>      }
> +
> +    /// Boots GSP FMC via FSP Chain of Trust.
> +    ///
> +    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], =
sends it
> +    /// to FSP, and waits for the response.
> +    pub(crate) fn boot_fmc(
> +        &mut self,
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        fb_layout: &FbLayout,
> +        args: &FmcBootArgs,
> +    ) -> Result {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipse=
t);
> +
> +        let msg =3D KBox::init(FspMessage::new(fb_layout, &self.fsp_fw, =
args)?, GFP_KERNEL)?;
> +
> +        self.send_sync_fsp(dev, bar, &*msg)?;
> +
> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
> +        Ok(())
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp=
/hal.rs
> index 8aebe1800a64..86c595d70c8e 100644
> --- a/drivers/gpu/nova-core/fsp/hal.rs
> +++ b/drivers/gpu/nova-core/fsp/hal.rs
> @@ -18,7 +18,6 @@ pub(super) trait FspHal {
>      fn fsp_boot_status(&self, bar: &Bar0) -> u32;
> =20
>      /// Returns the FSP Chain of Trust protocol version this chipset adv=
ertises.
> -    #[expect(dead_code)]
>      fn cot_version(&self) -> u16;
>  }
> =20
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 1885cfa5cb38..69175ca3315c 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -25,6 +25,7 @@
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> +    GspFmcBootParams,
>      GspFwWprMeta,
>      LibosParams, //
>  };
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 0c54e8bf4bb3..4db0cfa4dc4d 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -934,3 +934,68 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
>          })
>      }
>  }
> +
> +#[repr(u32)]
> +pub(crate) enum GspDmaTarget {
> +    #[expect(dead_code)]
> +    LocalFb =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
> +    CoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_=
SYSTEM,
> +    NoncoherentSystem =3D bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOH=
ERENT_SYSTEM,
> +}
> +
> +type GspAcrBootGspRmParams =3D bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
> +
> +impl GspAcrBootGspRmParams {
> +    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> =
{
> +        #[allow(non_snake_case)]
> +        let params =3D init!(Self {
> +            target: target as u32,
> +            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMet=
a>() }>(),
> +            gspRmDescOffset: wpr_meta_addr,
> +            bIsGspRmBoot: 1,
> +            wprCarveoutOffset: 0,
> +            wprCarveoutSize: 0,
> +            __bindgen_padding_0: Default::default(),
> +        });
> +
> +        params
> +    }
> +}
> +
> +type GspRmParams =3D bindings::GSP_RM_PARAMS;
> +
> +impl GspRmParams {
> +    fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
> +        #[allow(non_snake_case)]
> +        let params =3D init!(Self {
> +            target: target as u32,
> +            bootArgsOffset: libos_addr,
> +            __bindgen_padding_0: Default::default(),
> +        });
> +
> +        params
> +    }
> +}
> +
> +pub(crate) type GspFmcBootParams =3D bindings::GSP_FMC_BOOT_PARAMS;
> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.
> +unsafe impl AsBytes for GspFmcBootParams {}
> +// SAFETY: This struct only contains integer types for which all bit pat=
terns are valid.
> +unsafe impl FromBytes for GspFmcBootParams {}
> +
> +impl GspFmcBootParams {
> +    pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<=
Self> {
> +        #[allow(non_snake_case)]
> +        let init =3D init!(Self {
> +            // Blackwell FSP obtains WPR info from other sources, so
> +            // wprCarveoutOffset and wprCarveoutSize are left zero.
> +            bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::=
CoherentSystem,
> +                wpr_meta_addr),
> +            gspRmParams <- GspRmParams::new(GspDmaTarget::NoncoherentSys=
tem, libos_addr),
> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        init
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/=
gpu/nova-core/gsp/fw/r570_144/bindings.rs
> index 1d592bd3f9ed..ea350f9b2cc4 100644
> --- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
> @@ -883,6 +883,88 @@ fn default() -> Self {
>          }
>      }
>  }
> +pub const GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB: GSP_DMA_TARGET =3D 0;
> +pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM: GSP_DMA_TARGET =
=3D 1;
> +pub const GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM: GSP_DMA_TARG=
ET =3D 2;
> +pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COUNT: GSP_DMA_TARGET =3D 3;
> +pub type GSP_DMA_TARGET =3D ffi::c_uint;
> +#[repr(C)]
> +#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
> +pub struct GSP_FMC_INIT_PARAMS {
> +    pub regkeys: u32_,
> +}
> +#[repr(C)]
> +#[derive(Debug, Copy, Clone, MaybeZeroable)]
> +pub struct GSP_ACR_BOOT_GSP_RM_PARAMS {
> +    pub target: GSP_DMA_TARGET,
> +    pub gspRmDescSize: u32_,
> +    pub gspRmDescOffset: u64_,
> +    pub wprCarveoutOffset: u64_,
> +    pub wprCarveoutSize: u32_,
> +    pub bIsGspRmBoot: u8_,
> +    pub __bindgen_padding_0: [u8; 3usize],
> +}
> +impl Default for GSP_ACR_BOOT_GSP_RM_PARAMS {
> +    fn default() -> Self {
> +        let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
> +        unsafe {
> +            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
> +            s.assume_init()
> +        }
> +    }
> +}
> +#[repr(C)]
> +#[derive(Debug, Copy, Clone, MaybeZeroable)]
> +pub struct GSP_RM_PARAMS {
> +    pub target: GSP_DMA_TARGET,
> +    pub __bindgen_padding_0: [u8; 4usize],
> +    pub bootArgsOffset: u64_,
> +}
> +impl Default for GSP_RM_PARAMS {
> +    fn default() -> Self {
> +        let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
> +        unsafe {
> +            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
> +            s.assume_init()
> +        }
> +    }
> +}
> +#[repr(C)]
> +#[derive(Debug, Copy, Clone, MaybeZeroable)]
> +pub struct GSP_SPDM_PARAMS {
> +    pub target: GSP_DMA_TARGET,
> +    pub __bindgen_padding_0: [u8; 4usize],
> +    pub payloadBufferOffset: u64_,
> +    pub payloadBufferSize: u32_,
> +    pub __bindgen_padding_1: [u8; 4usize],
> +}
> +impl Default for GSP_SPDM_PARAMS {
> +    fn default() -> Self {
> +        let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
> +        unsafe {
> +            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
> +            s.assume_init()
> +        }
> +    }
> +}
> +#[repr(C)]
> +#[derive(Debug, Copy, Clone, MaybeZeroable)]
> +pub struct GSP_FMC_BOOT_PARAMS {
> +    pub initParams: GSP_FMC_INIT_PARAMS,
> +    pub __bindgen_padding_0: [u8; 4usize],
> +    pub bootGspRmParams: GSP_ACR_BOOT_GSP_RM_PARAMS,
> +    pub gspRmParams: GSP_RM_PARAMS,
> +    pub gspSpdmParams: GSP_SPDM_PARAMS,
> +}
> +impl Default for GSP_FMC_BOOT_PARAMS {
> +    fn default() -> Self {
> +        let mut s =3D ::core::mem::MaybeUninit::<Self>::uninit();
> +        unsafe {
> +            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
> +            s.assume_init()
> +        }
> +    }
> +}
>  #[repr(C)]
>  #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
>  pub struct rpc_unloading_guest_driver_v1F_07 {
> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index b25970dd4561..f41f3fea15ff 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
> @@ -20,7 +20,10 @@
>          fsp::FspFirmware,
>          FIRMWARE_VERSION, //
>      },
> -    fsp::Fsp,
> +    fsp::{
> +        FmcBootArgs,
> +        Fsp, //
> +    },
>      gpu::Chipset,
>      gsp::{
>          boot::BootUnloadGuard,
> @@ -39,17 +42,27 @@ impl GspHal for Gh100 {
>      /// the GSP boot internally - no manual GSP reset/boot is needed.
>      fn boot<'a>(
>          &self,
> -        _gsp: &'a Gsp,
> +        gsp: &'a Gsp,
>          dev: &'a device::Device<device::Bound>,
>          bar: &'a Bar0,
>          chipset: Chipset,
> -        _fb_layout: &FbLayout,
> -        _wpr_meta: &Coherent<GspFwWprMeta>,
> +        fb_layout: &FbLayout,
> +        wpr_meta: &Coherent<GspFwWprMeta>,
>          _gsp_falcon: &'a Falcon<GspEngine>,
>          _sec2_falcon: &'a Falcon<Sec2>,
>      ) -> Result<BootUnloadGuard<'a>> {
>          let fsp_fw =3D FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?=
;
> -        let _fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
> +        let mut fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)=
?;
> +
> +        let args =3D FmcBootArgs::new(
> +            dev,
> +            chipset,
> +            wpr_meta.dma_handle(),
> +            gsp.libos.dma_handle(),
> +            false,
> +        )?;
> +
> +        fsp.boot_fmc(dev, bar, fb_layout, &args)?;
> =20
>          Err(ENOTSUPP)
>      }
> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.r=
s
> index 90e289d4c3fe..482786e07bc7 100644
> --- a/drivers/gpu/nova-core/mctp.rs
> +++ b/drivers/gpu/nova-core/mctp.rs
> @@ -7,8 +7,6 @@
>  //! Data Model) messages between the kernel driver and GPU firmware proc=
essors
>  //! such as FSP and GSP.
> =20
> -#![expect(dead_code)]
> -
>  use kernel::pci::Vendor;
> =20
>  /// NVDM message type identifiers carried over MCTP.

