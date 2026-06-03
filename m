Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011051.outbound.protection.outlook.com [52.101.62.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A783822AA;
	Wed,  3 Jun 2026 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780454517; cv=fail; b=WjZEcCH0JeAVMu2ubBHVDd18ktVdiWc0Yf+wRxGCNzbHFNb6gTzivfPVr+FHfNjAXoffY5GcJoPjPr3jG6BlMMrwD5eGnaBvjhDGPYZpBTbwCDymsKYd8iquviUg+Wa71/aEsJnStpICHd9RILDsTkt8svANBe+rnNl1siDf2T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780454517; c=relaxed/simple;
	bh=jl4d1OpBDQnWatDf+OZAVU+d32uyjCTzoLzksvIdz14=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gFqTW9FSRaG4Prg7BQPjls1L7sPl1OC/4mlP+0oK+0JG9CohGOzmzwL2928brgGVWcofb4z3FGFf56NshtsG/inL7AZ1qvPa7yQs59eJnJwYZrGLAvSifYeWhpAIiRWhSzEF3KAYgR4iI70NP6HMsL5tYSafWuOi5rN3GRGq8Yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dNr6RbsL; arc=fail smtp.client-ip=52.101.62.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dNr6RbsL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpiziYkHpcZy170YHJRg2LfmH6smR0tH8zoXaGJgp+EIs7FSG+7wFZi7kq9A0RYXYNPPse8dO525X8WoZuIS6DoKpH3QagIqeoLfIO9BPH3nrHyEzsxLppdgfF+lk/7byyzl1jdB0+onW6NjxS4KeXa+UOMwlmR1WZIvrzEIhjfcs7mC1NzHOjsUnU9hAepEJpEh+DLg6Ix9YjX3Vcc/KrcTRPMcCkMSGT9SjrTaWBsEwq0lm2dfELANT6TjxcnTPKLkTkHrQBH/okaIU53uFZDJ32DEs+NPUEEBeJ8ZpqNacZserIp8cn325ZKecgHFmmaJ6Ugagi36dokoDA+Q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jl4d1OpBDQnWatDf+OZAVU+d32uyjCTzoLzksvIdz14=;
 b=U9a31sqFFEaohS+UBqOeX91t9cJI2FGX3hJkkage+3HYRHAr4wPS/aCrBFHvR+VQT+OM0fOuPvzqmO5mNiND91r9EZxdgpWKlSSuwXGy9edl5JeopO1NGv06noSPGSmHcW0SHJgpvmGGvTtBpHaAUZe/w+n3obGMJ382HMqL/+XgiLODcTJcy7pMj/ay8SBZuYgrhIPwi8gzRhJcVa3K1yg139km+0MNICW2DBjLYTZW3yYHt+iG+0J3ZVLV22CCxOxEsdbLJhtDRxpZw0T9HNj9OiF7WE5PY2iHL3ONoDk3lgopXHnh+6HVqmITwyqTIAVn497/low5sMKXGFYKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jl4d1OpBDQnWatDf+OZAVU+d32uyjCTzoLzksvIdz14=;
 b=dNr6RbsLuk+CJGoleoIEy2rBr01ZO2iM8IyzcrZFyGcSxys5VxTGAitDcAWrdCv+xXfDxirlK7Y1Wa8zX7UIhsGxyUFP9UJm1XTKDwyHo+ea9ucv2dy8CT+hTODjJZAv6bdlG0RgkGl4vejp/RgkFn7razfM0g3OyvXetAsVYTWy6jVopeFwzawz8uP/Fcxj3XirULu30LxTfJ6Eqdx5k940RnJ5UFtSQPrbD6Py3C/d9/5t2DfN/CFYMnoakqd/2SJp1P75pRi1RO30EvwrCraZAIFywOLLPenxxIClV9ULsgQhfBYZThaqZV52t8z+TYUUqShELJ5ImLqs5TQuZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8905.namprd12.prod.outlook.com (2603:10b6:208:484::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Wed, 3 Jun 2026
 02:41:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 02:41:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 11:41:42 +0900
Message-Id: <DIZ2G2Z9FUY1.3TQDUMTWV2ES0@nvidia.com>
Cc: <sashiko-reviews@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, "Zhi Wang" <zhiw@nvidia.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Benno
 Lossin" <lossin@kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>
Subject: Re: [PATCH v12 16/22] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <sashiko-bot@kernel.org>
References: <20260602032111.224790-17-jhubbard@nvidia.com>
 <20260602053640.CD1DE1F00893@smtp.kernel.org>
In-Reply-To: <20260602053640.CD1DE1F00893@smtp.kernel.org>
X-ClientProxiedBy: TY4P286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8905:EE_
X-MS-Office365-Filtering-Correlation-Id: 87acf13b-ddd6-45c1-5acb-08dec119a77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xcGMxmoKvbZqgAtA3LChbLeapISQWKTPxwK6tC2xAI37OupARuC+jPFQ2CnRQaHIer0dO6Lpm8FGAxklz+SU+nu7mbAwIQXKgzm6DYMoHtOP5+jqNzctf+3jafX9F9/7NpDVy+l4jUeaMKnzVpg7GEb6QXRSTjKUgb9oJKFd6CyDczihpIPdWpDu/534vENPQKJHVomK1v4510p6yMMTt746+kwoeYW6cXNd1HH6sMHSllhv1xsbJcnz8VqxasBmcaD4f6nUhjgw9OdLxysSbtaGMyOiZdx+BeagRKtQvavIeUUayqrM68DtzGfpPATKWga+YBhir6Bo87y8muN1+2NzBjU/wNB9skbEfEY5ucVM+Rn6a94w81R2Q0WT9fBMmX8wK02vSdNgiyPNmkbj8bE+p35lgm9MXQ1GUneynaf8zTqf0LQsvGPC0OAJWPeNC0Oe4lAZbW1jlfd0OyAUd+f41M+7fN+FLNpAZz2/81kvXL7KAOpcukKc833FHzq9DkSW2s/Mjyan8oRBdFEKYxEtkWJcqr9zdSh9A99hIoVpYPPvq5cLZLlveFsrX7WwF48z6re76p/Xajj1t64zMxS3qJwCBeywLsijwDBeqqwarKPOqTGzT0a8dA38qcmWZ5TKr0fd5aGyL1J7+SLp8eYI2og/y4A2oW1oxmqExV+/hOOEGk5zGgMc7dapib4R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RJdDVpVm50SzZJNGxibDlSMkxUdk9nWUkrVTlneDdiL3lEcnQ4MGRwbEh2?=
 =?utf-8?B?Zzl2eUxiWXpGa0EvNG0wZUYxOWlMSXY0UG04U1AvTWFyc2tZWTdxc0ZZMm4v?=
 =?utf-8?B?TkIxdmZHc3ZmR1J0VEUyRmZHZjJvUTN5UUV6bGNPUjlFRE56N3EvVVN6N0s5?=
 =?utf-8?B?M095UHZWOW1Fd0pGWnZhWStlRkloNldPV0FYQlk5ZElmM3poeEU0SFRiaW1T?=
 =?utf-8?B?MTAxb3h1OFVMZnZBN1FHZ2VYaVR3NTlXcGdta1U2RXM2UUxDWTc1SFNWb1h4?=
 =?utf-8?B?N3BmR1JORDJia0ZPVFQ5NGtnWTVUcGFrNVU3Z2R6dGJ5cmxRQUlyejZwVlRM?=
 =?utf-8?B?N3hSZng4VUZBaVJ2Y1ludjE3SVliQ2hsVUUrd3dKb09tb1pTbkJ1dWo5amNU?=
 =?utf-8?B?eStXZWd3YzhJWEhCTS9zRXVMYkdsZ3lsUWdKTzVBUy81RXA1NU43dW9qV0d0?=
 =?utf-8?B?bDJmc0F5ZVlUb09aay9BRUtwSDcyQjkvVTViRlJZL3hUZHQyNWZDdTJ1bXE3?=
 =?utf-8?B?emExUnVSNGxBdGhacFViblZhQThBTS9pcWNKVTVzZVlFZXZmbDdwaTJsNjJy?=
 =?utf-8?B?cDRDRkJPanp0bFd5aEM0U2s2M0o5ZHFPQncxbnRKVjg3K3ZGc2JLS3ZnQ3J3?=
 =?utf-8?B?cDNhOXJQY0FtN0pML01xNG1aR0xjT241TnlCNW9QM1BNNE1yRXRMM2REZVZ3?=
 =?utf-8?B?STV1ZFFqMWU2MTN1Yy91M1Q0dEFFdDdxdUNaQXBteVp0T3ZGMmc1cUJacUI0?=
 =?utf-8?B?YkwwckNZVG1DVHVnV3cvcUhVZTlkckNOY2JETjNjTjQ1VnBDQWxmemVWdlFD?=
 =?utf-8?B?ZG5weU5kOGw2RG81NVZMMDRGcUNxRTFHbms2eFJ3Y1lBWCtUL1pMZVRKM3dD?=
 =?utf-8?B?UG9JR2pEbFBqdTdheTh6ZzZkZGgzT0NCcWJ2dElESWE2VGRsY0pySDZrOE1m?=
 =?utf-8?B?eDNmVXNRc0JaNDFYR0lHS2c5dTB5NGs5cWhJNmg3VU82SEJIanhiQlNNL0tY?=
 =?utf-8?B?REFzeUVQM3lmWnA5d256YmFFUjIyVnJyVmZrWUFlRTVXSlpYL1VjRmZlZ1dk?=
 =?utf-8?B?bkh4bUdrUFc0ajJMRUN6aUNpQ2xoOUFNb3VHYU5tb282cHU4VFBLbnM3MkNZ?=
 =?utf-8?B?SHIxNEVuU1dhQTZXdG9pc2pyQlpWQkt2Rk1qY2czY3VyWlIvb1B3VmdyQUto?=
 =?utf-8?B?dlNqdVE2UkJ3QUx3SEduTmVNQ0FQY1EwV2dQQkt2Y2tlVWJFcTJZcXl0VEZT?=
 =?utf-8?B?SlMraVptSDdMc01uV0E1S08vVnNDTTh4MXNHZnNxMTBCa1FCZGxuRStOalZh?=
 =?utf-8?B?VUZmSkdHMzdidkpGZEEycWk2WFMxcG00RUIvb1FBdlJqbTdqUm1IbkR6ZExU?=
 =?utf-8?B?ZGJqL21xTlFkK05ReVdza1dzcE9kR01TUEZiY1NzMXc0cnExWDE5cUFiYmt3?=
 =?utf-8?B?Mkk1WXlwK2NSdVBrc2EzVEh3UXMrUzNUcStvQ085UFNnc2VXMW1yZW5CYmsv?=
 =?utf-8?B?WWJ1Umc0dUNiT1dyRGRLVGlnbUttSGdNTFJhZk9KbUxHYTRPZGoxZW5xNEx6?=
 =?utf-8?B?Y0o5c3A1TWZlTWtFZ3dmRUZRbzNnVDdQMkgxS25wYUNJdm82V1U3NDJsb2tk?=
 =?utf-8?B?cjMxZFFvU0E1UkNPazcwQXo0RjdaTWtOZlIxUXpVS29aVFpUODBPTGVyVExn?=
 =?utf-8?B?R2tEbUF3K3VyeXVZa0ZsNzZTUjdwbVE0aVZJRnZVRWpkZzVJenl1MjJQcXNI?=
 =?utf-8?B?ekw5c01XRGVwenU0cHdYT2RsSjNaMldOejdLVmplVHg0L3FoZEJqT1RkYU9C?=
 =?utf-8?B?SnZZVm9OTUJQTzNLb2lVWmM2ZWQyZkJ6TCtFUTJjdm5obmRVZVUxSXhiMWdC?=
 =?utf-8?B?V0Z2Zm9vUCt5dXVXbU1qMlVHUjJZTjNPQ1EyYURYeTYwdUQyQjJyWmJBampF?=
 =?utf-8?B?NTIrbi9lRUw0VmZSQW9zRFpBc0h5QnlmMmh6RFlmMCtCZC9HQ3JvN0Z5UkJM?=
 =?utf-8?B?eU9NMkw2M21IV2FxY3Vta3JvYUVyWnBxeXlOOC80eTRMVXVwRjVzMG84OU1m?=
 =?utf-8?B?QTNCVzEyRTBCbWVqUG9iemtWUlI0b08vbzBuNXdRNUl0NUFlOUVvS3VZV09m?=
 =?utf-8?B?UFhicm1vV25tRk5hTkNLQWFMSzM2WnVkSmFEY2JSVW1BYy9QS29JU0dETUpI?=
 =?utf-8?B?UnZWb2xTVjIxcmFFWWtEdGNJWmpUbE16OUtYbnZGZU1BZnJLdGpZcTQ1V00v?=
 =?utf-8?B?RVE1Vi9kMmF4ZWxKQjRrd1N3SFQ2SnluamdmMms5YjAyRldRU3BUK3hQY2JD?=
 =?utf-8?B?Znl4czY5UlRHMmtUYU1qQzU3OEJHbmhrVHFtcEoyUERUaXZLT1UrMXFGNTE1?=
 =?utf-8?Q?FW31tLCe0aWyOmjGAjmHGJovzsi/Bi4nTSRYkBUtfD+bG?=
X-MS-Exchange-AntiSpam-MessageData-1: Gwi8TkG//FsFTA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87acf13b-ddd6-45c1-5acb-08dec119a77c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 02:41:48.4842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hh5DioEPj5/nIuzwyTvz4r0zDPbnzV0JXzpgeVvZ/PF4aD4WYvKHWbLFCzE1PD0NZ7yOsO07Dw/ZTM6/UavCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8905

On Tue Jun 2, 2026 at 2:36 PM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Wire-format protocol headers are defined using native `u32` inst=
ead of explicit little-endian types, causing incorrect byte-order on big-en=
dian architectures.

Nova being little-endian only, we can ignore these.
