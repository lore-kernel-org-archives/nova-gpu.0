Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010036.outbound.protection.outlook.com [40.93.198.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D3C299A82
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 23:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133802; cv=fail; b=XpREjuzVThK33niqI/h9gozABum2XCNunMVYlQbFJrjjifpYmwklNNfYF+lrPnqhEiF4HVYhH7yQRON6H3G75F3jyJHwNrDCM1LN4QtDia74NDpMeI1lexiMj3H4rItIvaEqM/zaNvvgfm2ey53MVKSbPB1QEJ+5A2PfVAiqkzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133802; c=relaxed/simple;
	bh=BT76Tt1jmtNvVno0WDwaO6XUqznJRMegXLueeZRlcwc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fI2rrxQ8o7Jn+9tAbPRmsnFJwQ0lgRpD1I//z1qqJGYTKgHvGyl9mUx8Tiu7/h8yhRTKgGmYhFdr9Gg2gu7QZdY/nnkHTQG0EjrRo5TC2IWlXq5Kb5g7prmUl19D4jBq1FZPpQuhOqjstlPERiQsAHaw+yVRFFCUKlxq08/WMZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pi0W5kxi; arc=fail smtp.client-ip=40.93.198.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pi0W5kxi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXAygyn49M7PSs5xmnaWut9KLT24qx02qwyEkIVFd+f6YDuqZ0t44GrygipCuuSI2TCkNtwNSs+yds+vDMwpMnZH22t2cRGvsETZ3JBhTKEfWG2BBGcrxIat5t6XZarZXFmzhFg7b8nEbxbG2YrJwFLggCU9NlmbGAiJyFZwHh9UZNtOLvrX89p6Ye8oLTNkYFkBnZkrw6gcIQQTCW4jXKDTs6Wsgqm/iMarwE/fqsEIbhy3xs17Ss5PxvvSbRE4aUDhoVBouy/znSKmXb0oStM9o5EEPI1hFOyj5aqv+AlubuG4JXXdKTnaCKQFqWNhPoxaufF8oRjJGZn7iyN9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHZu+aZFPq7lM1UIbzbYNotxR7HmRkHwbf5mC5MHMS8=;
 b=jbdJGAsOSuytbQUC+hilNlHoASEXKLvXMJmWBKPxUn74xKyOGGbqENvQ4XbcNiAA/0YMTnkHB0dIRrXmo5+QZqLxwuPSrv16iMLouQgb9AFpCF6SKKK0AwbjqZWSXAnX437fq/xtW48/HeXNBHo0yBAesyoIyZ6ctT626hwabrPepR8wyYKhu/7rtdg4v4CpEYbds1yz1ASpbZpvukdiIrCVhdXVXCE5/1hf0rOsgYEqLoI/u2BGwfaj8fYcVCM096MmhyMErRvOffhX8R2mlvU+cfKDAByIB2QVhF6PFnoz8KLaRZhtzeUg6r6TM3kdrXdGU0wNnjhjAQyxKbCXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fHZu+aZFPq7lM1UIbzbYNotxR7HmRkHwbf5mC5MHMS8=;
 b=pi0W5kxiHK5HNtZv2DHsUe7FgTG5im5/iaJcbFpl+9WofD+AkMEe1WfH/+Fxp7u8KMvZHLHhl8CfXKLQwP3vKlOyaBudlMVntAzX7PZ7nquvaBLb+WvLQtkXYCYq8z2EySFIkfNoGLlz/NpdwQmo7K3LWHGrwwAE/fQJthc6LMLVn6Y4PyShAMadwMFNTzciOkTEgiwKgvZDVkrXuC8eELbgsBGMCou+ghtf9IwVnxR0zk4n0MjQ6nuVfVEqfWVAlGLz02dSS9rtSMV5e7QX66cn3zx5JlxYi/Y2xd0Gus+Whr1yRdlitUfMLKM2sgTlFg3bUwFLKsqZV5rHO4Qurw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 23:23:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 23:23:13 +0000
Message-ID: <1022c9e9-7d90-498a-b420-64b945f93c74@nvidia.com>
Date: Wed, 10 Jun 2026 16:23:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 Shashank Sharma <shashanks@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "tmgross@umich.edu" <tmgross@umich.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>
References: <20260607230539.144382-1-jhubbard@nvidia.com>
 <DJ41FNJHLCJG.4YW9GS4MDX2C@kernel.org>
 <2ccadf609a4bcb9b4aad5ec6b6998fc352dc2f12.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <2ccadf609a4bcb9b4aad5ec6b6998fc352dc2f12.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0025.namprd10.prod.outlook.com
 (2603:10b6:a03:255::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcd22f1-fbf1-491f-f99e-08dec7473e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	8E8sLGDUzbuUrZpY1/0rszqq6DkvZ5PuDFfF1eigM81QUIf93oy7rZsljPnrEdFgOA7NO3NuiAZwjTL8jvNaMhRfKL59juf2ddVDgg87mU9JG4uWAP1jbHfqO4WZTn92EXARSiMHRzlNGUFBT4lsi+6qLkpD7X47UG56ahYoe5H3B++SVjv4Wze/vmTvc/xZIUqUftdsI6b5KDwnIk+NPxnOiddbvOP7ojwhNWUAV2Y6DbflnE0gDH9UMH6n4Az70bNcm/ovfEIai3G3aMU181bAKvEVEqTbkZVz31PcrRp3XS0qzAi0cB7cxzg+9VsAa2UO5UR2pFQ5bMWqNIF8NikjmCutSTYklg8LvV3jOdDFWVG1oR0n3m3U+lArlqBLtrc1h8R2c+0FFAMSRNJNjylprzZuOxz3qPs0yFrZ/r4ArwRb697hjWECuZ1x1ROpcmScKeQjDGdz9dlPTdpZvkbusTddREgLVoUbNtlUqaWrc097DzBuqIbeGn6jvxAQ7VFB+4104T/UOUpgbvKyN7Dp7WKQ8pfwyK1mRQ4rG1uHUvPOJ8wgQ53IZt/at8lek6ZXru06Xo/D1yEA0yYSaqbxWQeL6tRwS5kg7oTD+ofzVVMOh/sbCPHDyJNzuu27QMEYx55NabVAoCvfYLypOUAlbkt7bIQr37VJUKpvosHGi4JDmW5Y9IKLDeUY+Xqj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWhlT1I4SUNYdk5pSmh0ZU9DMmFpMFBSZU9KdlBFZWJGM1Q3MHZPR0NQQWhm?=
 =?utf-8?B?MXFFazN0WXVhZnd4MWwwcFIxMmNXZkpHd3p3TVgwZ3RJMWh1Z2wySHZ2bVFz?=
 =?utf-8?B?SWFzUVJZZ1RTamhwU2lrRElKc0N4a3BKYlBUZ01Lc0NNMDBrQWY0L2pRRzFR?=
 =?utf-8?B?UVBDeGxJTzQ5UDZSVnllZ2NVKzRHR1JzRytTcjhFU3V4bDAyRUlJMWNQbCsz?=
 =?utf-8?B?V3l1K0VJYjlHZzlMZTBGeUpmT3pvNUFuRmMySFM1RHNjM2h6Mm5ZVkxQekVh?=
 =?utf-8?B?RDMxZ0h1cW01MERWVWowaTBhVDFFckdwQ2hVdW8rbXlRUzlTOFFOeDU2Z0pk?=
 =?utf-8?B?bVlxaU92VkZuM1JzWTZSdS9rcXhxTjR2S2RMeEZscGdmbHpHRTJqWVd1OU1p?=
 =?utf-8?B?SmJUZlFYWTU2cDBoMVhTSHFXcTlRRDJCT1dzdTBzSjVkRXR2eE42ZjZaUXRS?=
 =?utf-8?B?cUlUNVJRQzMwQXVINktyc2pvZHJoSVVlcit1MXg0eWlFT1VBRjlsTjFmdGdF?=
 =?utf-8?B?RjVpSFVxUmN6TEZhL1B5TnMxalczaHBQQXpTVmo5c2tDOGUySFZYR0N3K2wx?=
 =?utf-8?B?blAxanMraHJPRlJXdk5xM1Z2RWJDOEZ4TU5Eak85Sk5iSjlQSFhjb1N1Y0tz?=
 =?utf-8?B?bHVEMFo5QldDNkMzakV2WnA3bnd3ckZaQ0VqdzZNd2NSR2NlNHNEdTM3dEl3?=
 =?utf-8?B?QktSNE5wSkZHTFZWRVhTWmY4S0dIbTBSSWx3Q2pkR1RpRmxZTmgrRzRlMmVw?=
 =?utf-8?B?T3M2NXdDY1F2U0REK2J0RHNLeVl4M251WFhNajlaZDBLSDlwbHdKREJxVWMz?=
 =?utf-8?B?ejg2OFpzWERFQ3V5Skd0czB4M1FoczZIN2Z2TFlDbzJCdCtuM1poYjg3dllT?=
 =?utf-8?B?d2t6Q01PK1JKRFhHcmwvL0dvOHRhUExxaVZ1cGE1TEZTSURUdHcrWmYwWjJp?=
 =?utf-8?B?RzFUdExsNFFaNlpBRXFlN0NyS2ViaEpTREk0SVZON1lsQXR1c0lmV1hJaE1R?=
 =?utf-8?B?U0dGK3RNV2ZvZk9HSUpHRDJCdUl2M1YxZ0R6U1hqMmJUVmIzb1ZwcDZaR091?=
 =?utf-8?B?Y2VTYTMrRzFHV3ZHQmhyYXphVTgvcDRyaVQwRDZmY21FTHMzN203cUdjaFJE?=
 =?utf-8?B?RzV3enVBYng3MkloRHpGOXZuSXIvc3doSGRHQjA0bVMvMXVVMk5mVEZlWGJZ?=
 =?utf-8?B?ME01ZFoyUjVBV25qZ29oNEl1L0o4R2x2aEVpRTlpTmYvalI0MnlBN2dLYmtN?=
 =?utf-8?B?MlpMR2xkTDAyeE52WXNNVTlwNmdPSStNRkR2TDZNQm1uajRDWDFLckxybnBV?=
 =?utf-8?B?WlRSSXd0T1QyeTArY2FpSDVNUXFkcDZsVmoyMndIRit1YkRlQ3ZpZTV1NHU0?=
 =?utf-8?B?QjFOYzFOcXJpRG9NdCtiMnVFd3ZOYW9CcE8xclN0cVJTdnl5eXcvWHpUQVFh?=
 =?utf-8?B?MVlRcVR6VHFVVnhXaG9COUMwWEtTQ0cyTG9FeUFNVzJEeVJyMlRVVTVQZFBS?=
 =?utf-8?B?R2NJY0FnbXNDUVBLYXcrOXIvVnB4clVjV041ZkRQV2VkVDB2Q0tOM2dPMUZ4?=
 =?utf-8?B?SzkrNnBCczRyTVA4QVJBdlFBMmwvQi9TaE1XbVI2Nm85ZFRZUkhSMUdMT2hW?=
 =?utf-8?B?aFZiMmZFaWxOZW91UXAranNYZnh3dXh4UFd2dzY3RzNsSXhKeTV2NG1VNGN4?=
 =?utf-8?B?M2h1RmhtbU9za3RPMElLbk9MVVE2Z3JDazZjZVlmWE1LdkRNTnNNY1FZc3hB?=
 =?utf-8?B?QkxVWkZnRW5VbExUQU90RCtteXEwa281R3k5TzVMY0lSUkdIcHpYY1VJMGli?=
 =?utf-8?B?Tm1NemJTMWQ0ZkNpbzVXWE56b0FYdFcyYmVSeStxSUFtZTJ5S2xaOUJRWSs2?=
 =?utf-8?B?WEhMb3JTcjJNNVRLZVZkazEvVzNMVGRhTWdBb1dDclpLcWVpM0Z5WWlvODJM?=
 =?utf-8?B?UEdQczhTSk5YV05ReGxFb0lJRHJSSFVBRzRyTEVQVzZ2aVU4N0E2eUlWNmJH?=
 =?utf-8?B?dElySzdqa2MyeHRVWHcxelJEWnhsK3VyZHJqcitUMm1LR1RzK1hEakt0LzM1?=
 =?utf-8?B?VXlHS1Q4Rkx5L3F2VkUxM1E3aURiUmFYdERPTno5MUo4ZU54Z0xFMkYrcFla?=
 =?utf-8?B?YVZ6aVgwNXBNZ2hWelBOUGVVS0xKVm00SEx3Y2FLUjF3UFRwaHRPUThFZVZz?=
 =?utf-8?B?aUlqZk1WbFh1OGxXY1BUUmhtVjFaekpTd1RLSnVRdHN3c0NrZkRvK1EwTGZX?=
 =?utf-8?B?Ym1CWEZRRFgyWUhJMG85SHAvOFo0Ly9MNXdOQngrNEw0VXhpRSs5N3ZZeGlp?=
 =?utf-8?B?ckRnQjlEL2Nad2xkK015R0lIZDNsYmpFRUswdGJXQ1dLSkNOZUtEdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcd22f1-fbf1-491f-f99e-08dec7473e2c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:23:13.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zz/NDMRoiRIrgTKE1sT1q+JQyHaQUIE0cykzMI8yeVx+Ldsm7PIJ+KvoNzN2qjZhQlqf7Lyeusl9RWDKiuFxYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353

On 6/8/26 5:00 PM, Timur Tabi wrote:
> On Tue, 2026-06-09 at 00:57 +0200, Danilo Krummrich wrote:
>>> +        // FSP-based chipsets (Hopper and later) boot the GSP via the FMC image
>>> +        // loaded by FSP. Older chipsets use the SEC2 booter instead.
>>
>> NIT: This is slightly ambiguous, since despite technically being the same
>> generation, by architecture ID Ada numerically sits in between Hopper and
>> Blackwell, but does not use FSP.
> 
> Maybe we should add a comment to the define_chipset! block in gpu.rs which clarifies that even
> though GH100 has a lower chipid then AD102, we consider Hopper to be a newer architecture than Ada.

Yes. I'll send a tiny follow-up patch for these points.

thanks,
-- 
John Hubbard

