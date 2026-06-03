Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389052F12AD
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 13:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493726; cv=fail; b=H+JVkKcnnh+ef55e2kTeFhNX7zTPN0KCtDWF9ErvFrXOs2k/Glpzj9SmPi6a8nF2iGHJj9QKMYAZb3H+8ZEeTJugEXmo4IaxQ/ABu4MGYnwbAGm475hQgWb3bia+nl3vYoDMhjPm7SxB13MncjvLPa+vZpyPomYGco3PGXwLKCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493726; c=relaxed/simple;
	bh=+BPG73jY2fSuZUfGhHOUOIGau9ha03urpdfFL5eV2LQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Za/4nXYpKNL/vV4GMfxxPrjMAsiFTVXyCxSH5P0yAhVc6damToYL26S2WFhAVPSAPiZxSvWDSpIkKjeZjyFZdcuE5J6+LDJ9TqLVAsqkFUVAqgs21GiVk83zLC6cFyjQ+wyAWDo1BQIbGJ6doG8DBxyjLQl8lwIeE//ILPY6/vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JwCWlMoi; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JwCWlMoi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG8/gPfJAErvBsKdeSc4bQtrtu/GcubDeyk11MGrhchi58dTsyMSpD6Kme+KjTrc3YZAwn6NsD0ZQ9u2I4a2QhUHMWDE47cYjOElp537fLCq8Oo+gQlpgayF0/McGt8VSLWtgrwdJQxKS8AbdbUy3cEoef/g8NvDsA9Q+bUmbh9mizYGv9RnGDdBtme6cRw/lho5a5IM+aUSSIbtV1NlirkhgtN+VKCDGVSw8D8RKDuCJAwVoQpI4jEtAoYMtDzK0QLB42lpmNeh17wA73fV7HyQAD0CRTz6Vbnfp/akA/Jw5UxzTddbTfs52gwxmyU6gxO38wVvijZ6TVrMMb2jvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qtWQ4gJPSbNGLk+u2hZsEPK0clzgYoCjzGPduEWV3k=;
 b=bFoH2XbBV/+s4/mPKzbeLXtzulQeZ9pNGDn6SgDKEqE91HmIf9/hlq5HCHsewf2iOugvxRcBS8QpEVFDMpW7ew/C9C5NHfiWAqIy0M+Uu4M/Os7m2cUY03gm8+k45c3pKukc75RoorE6jEC7gZX/xIlV7ujP2f14McNlPIBsC7DbhCGxVVumzYP5y3zqz32g1VCVG0yKS6Ctqb+hssYNwnZ4Wl8ilEDt+A68GtNqFTT3bb+GblNM3aA8FBrQGHyoR5oIoNXUUPyTVGrHlUZO9sqrW09BOh3ERkxFkZD3QlgoswLFr6NXJpOmOAVlQHKpJH3U+Nr5hRg2/XEUMucsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qtWQ4gJPSbNGLk+u2hZsEPK0clzgYoCjzGPduEWV3k=;
 b=JwCWlMoiaWnXmQKU0r00FLGT4rAp9IFq2LKOJUjJP+QDnoHLo5zBn6kvKU3n6XkTp5afF9+Yb21xUTSwidiwLr0P1SMMm/BXvhSzXPd3lwynbL0YsFH8yH/1NAsUWj3BRJGrnDKvjeYTFARYYnk+yQsLZl68/nGtYIjGwWL4DLq399CuKZ+pjQ9LQFfVA2Wnwaz54mSucORx8gzydF6ggpT4ISrDFKDsCg4CSt6hMaJETktA4dlLrHbrjueoOoH0JYwnb5BQg5FkL1w/PbbFhTUCE9f8gnrgVR6I+H3w875foWCVaLXP/WSe9Hz/Ulkrtj/KkEkEWJsHdUlWrGyRMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7139.namprd12.prod.outlook.com (2603:10b6:510:1ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 13:35:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 13:35:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 22:35:11 +0900
Message-Id: <DIZGCEZRJZNN.2G2A9HFUIDBOU@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun@kernel.org>
Subject: Re: [PATCH v13 6/9] gpu: nova-core: Hopper/Blackwell: add FSP Chain
 of Trust boot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-6-d9f3a06939e0@nvidia.com>
 <DIZFC4HD8M35.36YODW6I2HAMK@nvidia.com>
In-Reply-To: <DIZFC4HD8M35.36YODW6I2HAMK@nvidia.com>
X-ClientProxiedBy: TYCP286CA0072.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4187f83f-549b-4ce2-069b-08dec174f14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|1800799024|22082099003|18002099003|4143699003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	2bogZr+MUGylsGqXDxZ4a/xvd4vtv/+Hid0h+74j6pyDQzOZln8Ddmp5TarqTNGQEQ9SSI9F+4wpWNctgPXzXazrmfwckOUuioBXvT1io+SHdi8qAkTQUF9SVE3V0YvG/NrSi02t4GMD0tpbbMh6tEuBjH6/FHf71gZ2PVjhA6jgHLTWOEb6clmL9+gvTh9iZ2LnTf7sAQMgDJFU99wvBwRfjLlZCpfTNJ6ZoACPzkUjEtZr54BSJ7i3Vpd1TzJKLriZtm094SMff/jiCdBc4W4HVpt4186xb7eSA8tNjPpn14VYfq/WVldJNCc3/SOdgyZFwCpSp5/pTTXprxIFXBmFk9fn+oR6vHxMHHVaLK/u1iQstoQIwsUIdfr+wboOwMvUmp/EtMbiQpP0QTWKUtTOwGzqwAqaxhU2a+CURSRyRSgx1e5vurMWEHRcWEJHAPr7uQ5H2/9WyqXcsD95G0eY3+9oM9r5pTO59wlMkVWxfjRozAJM1sK1viN/Cc9MZ3J8sI+JOD7gRM8d0BBXZJb1SVe8seuoQuwWv3mGypV91E4me4BT3oLHGQwCPY2wA2T5paBW1npYw5mfWBvXS6Hwc3nR7NTH2GjQK45YDshUFdBqU90dEB+HBOl3Da63IOFubQP39kohiHywFHeb2rCu1g/OONnBp7UW78320MNggOwn0AtsJ0qMP2SgbWHN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXVMVHZMdlE0ZGMzSlFTVFd2L2U0ZzVoZzI5VUo3WmxYTThhNHpqMk92b2hh?=
 =?utf-8?B?WEE3elVzNm8vditiek1oM1habE0yZ2dFVldpYTdsa1JESDlhSWNlVTh3dkdW?=
 =?utf-8?B?VERuZkZobXVEL0hXTW5kVnRJRlZYNDlWOHdMK29TaEhBSm02OTdJd2VPcGwz?=
 =?utf-8?B?M2J6dDFzMzFYOEJVZFR0RWlrWHF3T3pWSkI1NDA1dmM3SDhDQjlyaWpScGsy?=
 =?utf-8?B?a2JiemI0blBMejdpZzF5eC90ZnB5dG5wYXRQdzV5dm9xZlpFTXBzbzQ5SzVu?=
 =?utf-8?B?UVFRUWxrd2pOZUZzY3JaV1hZbmYwOTNjRFFWb1VVUGZzTFhRakJtbGdhc1pY?=
 =?utf-8?B?WWVRVHZjbUNQR0t0alBwN25IeEQrbUZuQ3VmalBVUG5qcGdrb3JjU0d0dWVN?=
 =?utf-8?B?QVFpL0Z0SFU0dHExTWR5c3ArUzlJSjJSZlVKRzdWZUFyY3NzYkNUQ2NLMmc2?=
 =?utf-8?B?Q0N6Y0pJNU5oR1RXSTRrTE5GTXh5UHVoN2NLNjRMS1FKR01LRHpDMS9uYm1t?=
 =?utf-8?B?UkIwY0xKWkR4RXRvRHppYVRUSXhtdGpVQnlVV2YvSUVUZ1ZyekEyaXBpeC9k?=
 =?utf-8?B?VlJZV3R6VmdMTzF5UkhITUVWZTN5T0FMWW02S1A5ck1VUkRrVDBiZDRRSU4z?=
 =?utf-8?B?ano2blVsN2Q1bDZzczVaMUc5OHQ0eFMwTGRCNGh5eG04VFNLbFVhUlJSbU9T?=
 =?utf-8?B?ZTJId1ZPbWpINmVSS3B3ZlZDeitIVG40N24zNzhLZjhOaStXN3g4SVVVT0tm?=
 =?utf-8?B?YzY1ajFpY2xyVzJBY2VXWERNVmF0WXNIcVloMENpZGNUUGw5Q3hSditDVldB?=
 =?utf-8?B?OHdoYUxocGpLUG5weVQ2Z2N4Q1VTVlp2djM3Nkw2SFRrTEltV283VzVXakth?=
 =?utf-8?B?dkx6NUxEYTZLV0FZVUt5dGYwZG5jRjNsT29TUm5wcW5yZkZWK0R6dXh5d1B4?=
 =?utf-8?B?cDZDWlNWNWthUU5XTm1uTTZKbGZOSmJtQmlWLzFiZERLS0VVUzA1UjFUdUdC?=
 =?utf-8?B?VlJXZFVTY1M4T2VrRmc4N1pYNElKMGV5NDFXZm5yR3pFMXZBYzAvbm1KNk40?=
 =?utf-8?B?VjhQK3kzeXhOaGt2bkp2SE01bnluSXNUTGdFL0FHNU1EU3lzOENJcjJDZzA1?=
 =?utf-8?B?bitrUHdXU2J5d0Yyc2p1WDFaZDJWcWdRaTUva1BLWlhJU04rZUNMY2RNc0hK?=
 =?utf-8?B?Y1lVR1d0c0xhaXJpcStJRVFUQzdJZUw5VlBlREloMDhJVXVZYlA4MFN1VndF?=
 =?utf-8?B?aDdPZWEyTXk2UG9zaHBDRlk1OXRFRFk4SHZnVVkwTWN3NVRUYWpEd1pDTUNS?=
 =?utf-8?B?Ukp3eXNqT2czaHA0L3ZVNklVNlBPS2ZCKzUvaW1FcEZjanh1OFdOdjVIbWhu?=
 =?utf-8?B?NDVDcTdoWmNDQ210QU0rNDNMUWluUDNma09naXU3QTNPQWlZcHl4VkxVcUhN?=
 =?utf-8?B?SGJPUUhWeUZKWUVnWUlJK2dOOHVGaGpkeG11cWE3bW40YlFzWGlZM3RBRE9h?=
 =?utf-8?B?c2VtRnJRVlE0ZGY5SVB3aWJsbGJSVXhiY0pHNGZmUVQyUHZRQU1LSWx2T2VP?=
 =?utf-8?B?MEsyMEVsTXNaYmlzNzFmRGJLVktsanUwRyt0UjNmWXJOUXBMM1hBTjVlTDV1?=
 =?utf-8?B?TlYzaW83R2w2a3V1YlVuOTRBZGY2bjAwLys2SXJQMzdyZUtXbVphVnBlWWJP?=
 =?utf-8?B?UlZQTk9HZ2NrRE13bmNJQ3kxTmNSTDkzeHEvR051cXVZc01HdVRXaEFuRzEx?=
 =?utf-8?B?NmNjVFgraDBtRWFJR0lWczhMSElwUlVGS1VBUUNzOWlHeVhrK3NTcDY0dDFY?=
 =?utf-8?B?RUZXNUVZdGtlRENaald6VTl5d2VLMzhVbUZBSFRnamlsR3BLZXhPcDhuUWdW?=
 =?utf-8?B?NWZEVVRQUjVJdE1uOFU2ZUM1T01PeVNYN00rWVQ5VkIwVEg4S3hMRDc5b1pY?=
 =?utf-8?B?QXFSUXhPRGZMeVpqaW8zaUxYVytrTWd4c1p5U3l2TTRhaW1GVGUyTEJ6dk04?=
 =?utf-8?B?QnowMVpadGhSbE5KdGNlOGhnbW00SXgvUlBFdm04S1BGL3JIZ2VtUTRPUnJh?=
 =?utf-8?B?c2dQbUhYaFhpT0RhRFhGcVo5dFV6UC9QUlF2K0h4VFRGOEZ0OGRRYW1sZ0Jq?=
 =?utf-8?B?MjJoa3dQcW16Um5tTWJ2b3dMU2huMlRVODhnTVNCckVvVGlCNUJMRFBiMFFU?=
 =?utf-8?B?U2JvSVZudkVBcll2NjFMNUdFVnY3ay9EdVVvZ3IwMWFjMDJxQmtod1JsWTE4?=
 =?utf-8?B?T1JhY1o0eWdTcDBPNzhWRG9rNEZYaGQ4QTFucXgvKzhJRERRd0tBT0lmUzFj?=
 =?utf-8?B?dFN4eWM4dS9rbHJkRjdMYlBYd3FVenpTMVJ3SHpJejVHQ0NLTHBnMnk2YnRQ?=
 =?utf-8?Q?undzA/kQXQiakhFFHJQf1uOXxpsnOSAL1fz9rdzGGXY4j?=
X-MS-Exchange-AntiSpam-MessageData-1: 6sOCej9zdhrQqQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4187f83f-549b-4ce2-069b-08dec174f14d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 13:35:14.5687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zx2OrMe/gtLx5jMSzdDJ6T2nypSktMCLh4JxE1fbql+RptAnxMMbH91Lg6RH6nfkU9502lrVdoioPeRUIuwrCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7139

On Wed Jun 3, 2026 at 9:47 PM JST, Eliot Courtney wrote:
> On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> Build and send the Chain of Trust message to FSP, bundling the
>> DMA-coherent boot parameters that FSP reads at boot time.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/fsp.rs             |   2 -
>>  drivers/gpu/nova-core/fsp.rs                      | 145 +++++++++++++++=
++++++-
>>  drivers/gpu/nova-core/fsp/hal.rs                  |   1 -
>>  drivers/gpu/nova-core/gsp.rs                      |   1 +
>>  drivers/gpu/nova-core/gsp/fw.rs                   |  65 ++++++++++
>>  drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++++
>>  drivers/gpu/nova-core/gsp/hal/gh100.rs            |  23 +++-
>>  drivers/gpu/nova-core/mctp.rs                     |   2 -
>>  8 files changed, 308 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-co=
re/firmware/fsp.rs
>> index 9b211426a75a..6eaf1c684b9d 100644
>> --- a/drivers/gpu/nova-core/firmware/fsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>> @@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
>> =20
>>  pub(crate) struct FspFirmware {
>>      /// FMC firmware image data (only the "image" ELF section).
>> -    #[expect(dead_code)]
>>      pub(crate) fmc_image: Coherent<[u8]>,
>>      /// FMC firmware signatures.
>> -    #[expect(dead_code)]
>>      pub(crate) fmc_sigs: KBox<FmcSignatures>,
>>  }
>> =20
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> index cedfea173e50..883ac4f8b811 100644
>> --- a/drivers/gpu/nova-core/fsp.rs
>> +++ b/drivers/gpu/nova-core/fsp.rs
>> @@ -9,8 +9,14 @@
>> =20
>>  use kernel::{
>>      device,
>> +    dma::Coherent,
>>      io::poll::read_poll_timeout,
>>      prelude::*,
>> +    ptr::{
>> +        Alignable,
>> +        Alignment, //
>> +    },
>> +    sizes::SZ_2M,
>>      time::Delta,
>>      transmute::{
>>          AsBytes,
>> @@ -24,13 +30,19 @@
>>          fsp::Fsp as FspEngine,
>>          Falcon, //
>>      },
>> -    firmware::fsp::FspFirmware,
>> +    fb::FbLayout,
>> +    firmware::fsp::{
>> +        FmcSignatures,
>> +        FspFirmware, //
>> +    },
>>      gpu::Chipset,
>> +    gsp::GspFmcBootParams,
>>      mctp::{
>>          MctpHeader,
>>          NvdmHeader,
>>          NvdmType, //
>>      },
>> +    num,
>>      regs, //
>>  };
>> =20
>> @@ -66,6 +78,114 @@ pub(crate) trait MessageToFsp: AsBytes {
>>      const NVDM_TYPE: NvdmType;
>>  }
>> =20
>> +/// NVDM (NVIDIA Data Model) CoT (Chain of Trust) payload, the main
>> +/// message body sent to FSP for Chain of Trust boot.
>> +#[repr(C, packed)]
>> +#[derive(Clone, Copy, Zeroable)]
>> +struct NvdmPayloadCot {
>> +    version: u16,
>> +    size: u16,
>> +    gsp_fmc_sysmem_offset: u64,
>> +    frts_sysmem_offset: u64,
>> +    frts_sysmem_size: u32,
>> +    frts_vidmem_offset: u64,
>> +    frts_vidmem_size: u32,
>> +    sigs: FmcSignatures,
>> +    gsp_boot_args_sysmem_offset: u64,
>> +}
>> +
>> +/// Complete FSP message structure with MCTP and NVDM headers.
>> +#[repr(C)]
>> +#[derive(Clone, Copy)]
>> +struct FspMessage {
>> +    mctp_header: MctpHeader,
>> +    nvdm_header: NvdmHeader,
>> +    cot: NvdmPayloadCot,
>> +}
>> +
>> +impl FspMessage {
>> +    /// Returns an in-place initializer for [`FspMessage`].
>> +    fn new<'a>(
>> +        fb_layout: &FbLayout,
>> +        fsp_fw: &'a FspFirmware,
>> +        args: &'a FmcBootArgs,
>> +    ) -> Result<impl Init<Self> + 'a> {
>> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END =
- frts_offset
>> +        let frts_offset =3D if !args.resume {
>> +            let frts_reserved_size =3D fb_layout.heap.len() + u64::from=
(fb_layout.pmu_reserved_size);
>> +
>> +            frts_reserved_size
>> +                .align_up(Alignment::new::<SZ_2M>())
>> +                .ok_or(EINVAL)?
>
> Why is `frts_offset` calculated using heap and pmu_reserved_size rather
> than looking at `fb_layout.frts`? If `fb_layout.frts` is the location we
> are meant to have the frts in then why use a (potentially) different
> location?

Conceptually the current code looks correct, but the naming is indeed
ambiguous. This seems to correspond to the CoT `frtsVidmemOffset`, not
the absolute FRTS address from `fb_layout.frts`. Will need to dig a bit
deeper but it looks like this requires a different name.

>
>> +        } else {
>> +            0
>> +        };
>> +
>> +        let frts_size: u32 =3D if !args.resume {
>> +            fb_layout.frts.len().try_into()?
>> +        } else {
>> +            0
>> +        };
>> +
>> +        let version =3D hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?.cot=
_version();
>> +        let size =3D num::usize_into_u16::<{ core::mem::size_of::<NvdmP=
ayloadCot>() }>();
>> +
>> +        Ok(init!(Self {
>> +            mctp_header: MctpHeader::single_packet(),
>> +            nvdm_header: NvdmHeader::new(NvdmType::Cot),
>> +            // The payload is packed, so we cannot use `init!`. Initial=
ize it member-by-member using
>> +            // `chain`.
>> +            cot <- pin_init::init_zeroed(),
>> +        })
>> +        .chain(move |msg| {
>> +            msg.cot.version =3D version;
>> +            msg.cot.size =3D size;
>> +            msg.cot.gsp_fmc_sysmem_offset =3D fsp_fw.fmc_image.dma_hand=
le();
>> +            msg.cot.frts_vidmem_offset =3D frts_offset;
>> +            msg.cot.frts_vidmem_size =3D frts_size;
>> +            msg.cot.gsp_boot_args_sysmem_offset =3D args.fmc_boot_param=
s.dma_handle();
>> +            msg.cot.sigs =3D *fsp_fw.fmc_sigs;
>
> I guess we are leaving sysmem frts unset for now since we don't use it
> for anything hey

Yes, but let me add a note so we don't forget to come back to this as
they will likely become needed for systems without VRAM.
