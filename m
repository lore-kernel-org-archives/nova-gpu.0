Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013001.outbound.protection.outlook.com [40.93.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71BC530E10
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876004; cv=fail; b=S6qECQOUuMjGQp+i0LUONQVYRIEtDv76Wm9B7DLlVAL9djo4glSdkPTn7eaE5Qb0nJXXMeIl4vWaoJlL0wS3X/0akvkIzGEedm7n7SuQesysU76uTgm8+0ZL6V36BKeh4xqaIp9KK8a1npVIdd1LeV5AE8Toa71ImDAZJtE4b+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876004; c=relaxed/simple;
	bh=FwQ/bRTuKBRCVU7s3wg2KepjpGcaRX+BWh6qgQVuG0c=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Paa0zmhK4f2h98eIH5nHzUdDGEQmvJ7CW9M86PUFCne4JAw/gnJR5Gr6n1kYM0oIWu6bTAIWXc7uFw5Ct4rfaienERb0gSRmP5t5I5uT6U1nyWxlwaG/hu9wv0xniBvSmFnCzgoqut4Y0SJQE3/u1tMlLbwV7bPxCs0bEXjZk8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VNBRDFzd; arc=fail smtp.client-ip=40.93.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VNBRDFzd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDLAQcfHbzflcrM9zRLcnEXxkwgp4rUYETd87X9qYSOxknuZJ07VLE1RYgvBcZ0C8ndlqbZAiOyQHtZPO960nbCdYj0Tblu2NLnq66zM16QPCLJjMndLMQXjwKFiwRbSTpO0NsZlkBCH11+T1/fu8tCIr9NqbkKs8/ipW6E8e/girgr4o0mEJfIYE3shtwYSS2OAN/Zgq7HVlwJZqaCiaMghHKWDfqOS411/Vr7YgFEMPHEp40cHsj1XQoi6BElrZEBKwdhXIxkh6wkslDLmE/xJu6HMaSgRibhr/VEhsoD68NkTDC6Z8l4MvaQga6KezsRfRhQrKLKFFiyqEHgYoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwQ/bRTuKBRCVU7s3wg2KepjpGcaRX+BWh6qgQVuG0c=;
 b=EFsIegK7S+kSOoCdMM/uA+SL2OCRpKcyVYUHReTqvQ1R9Vm8s893l9nRRzdt7YMn8o+mEiumWX80bKhz0tdFQ+76/aZsQCqhU/wAIuMj0ds4fh75ZnyvphuTd1htW/dP1IqUP0dNCjHrrFiVx1hqh/HGLcM5erOO1xnOtNsuDx5ypalxAefdLs++SlhPOunU54OtG+tOGQ808WyYjGWpNyf0ec20PhFesDbIHSiRnxjW1iZLS8CiG7ovf5694mNfzhvflz95jKIg9FWN5Q0beJLAMn3q/mE4SePHRnFC6n4wveMIwENdUPuQo6BSVD3ZgYmoXH21wCyp9Xw4M67skw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwQ/bRTuKBRCVU7s3wg2KepjpGcaRX+BWh6qgQVuG0c=;
 b=VNBRDFzdvHfIdNtsKu95JHsR2yXEl4/dvIKQTN1n06Nc4KZ0IO4kdMGJL3LoHhRTWDExvPgnxnm4+AWs5wHI5qJjIgYxUDA5x+7VskOHr4LNAxsW3kUA3zTUIQFP0bG1Ke1VFvfo1DAVRnzYYHBkssgqoQObVRFRohmQKoi5h306+t1UXTKI9kLxEzyCwEQ4gvZobWokrnk6hEKobYptk5FoMXqRbORn3le04MYx4Brw3WJoDwmOdlwKYpsW+I86zMCQhbzrDuhes6SlX4X9GHEjl42WEMYspfvbspsVXbDtViRNjmDF8dTHU0lMY6TYR4TBkokwPJZ53Vg8iR+acw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 13:59:31 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 13:59:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 22:59:28 +0900
Message-Id: <DL9ZLUVDKRGT.2RN154EKHPKEJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v2 00/31] gpu: nova-core: boot on the r000 GSP firmware
Content-Transfer-Encoding: quoted-printable
References: <20260822015448.238214-1-jhubbard@nvidia.com>
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::15) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: b2958cd7-f7ec-485f-1775-08df0db167e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|10070799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UkrqAn61tI+wdTrZl/mtv6clpn5nAx5RRhJyuk6R+mRsKyL6hpG7b/P+49UfVbnpsUClTm2QWYOXX3JDhF+ucOaHq5tlM0ekd2ombIjE048ZAPSAg0naVhM/X7sMzqd86cetitX2ydWgkEXoI4uNtwYSqWZfYKQ7MEVt9J/m4i4P1Ki68ycRE6jXwxXpp9DVRuP0CN3N4bNpckeyAAN6BXeD6I72K85weEZTaX2Jpmt4ZQsBuKtQ4UVzMn1AtQ0c4SIu3uXJRfTZKvI8gkpK4Wm3/60uoC2Gfo7LuX4HpD1vK+qexr+faaQ+mXz7T6E5QjSGAG6xAFEQgvgg9S07/jvXYrW9t7xe0iNuz+OXYmLNuysgA8d7Yt7EwF/uKfxF+UhxAn6v+S/YHPSq0l3YLMXYKUgrOF2T64SPHVIBSrpiSMhOUfaIey5WX5jegQp8BiQZ3ZZ1ZUMjsDlcJlQMx2eIKL7KBkfaARMauAZsxENzwo35Us0wOy6SDKOFdKCvQgI4zTH0KQ4d1ihUTf2/kvL/BOvjD1oIDmi8fsoW3HoRTOVw+F5WF7BFDIJdE1HARiJHhx5KXVzobMQEIOCHRWb7LB8xC9DRX9303S/bY9dozae+fDJXQNSJmo2K5ms8pA362pr7Obu+2S9puafG2ZDZl5hPyGN6eVgE53+xZ+Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(10070799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUN3STFYR2pXS2RlNHFsZzFJaFZLQVNDV2lNcGFka3dpWDRZWUlZSDEyKyt3?=
 =?utf-8?B?NXBGTGhWc3l6NHNCS2JGUkNEcUtuZVNCQm1ZcUhMc2p0NkNZT3crcWZHVU5l?=
 =?utf-8?B?VlVRaGR6aCt2cHZVQjdPVk11RDB6dDRUMmlxZ2JxWkwzMm5jQk5wYloxZUlW?=
 =?utf-8?B?bDdVOTcrL1pqRGcrcFFDM3pHTlg3cjUvK2JpeTRlVmdsR2FxSmtFVFgvUE8w?=
 =?utf-8?B?OUJ2TFpNamVHRllWWHFqVkwzbU4rMGY2eGZ3U0thZmNRWUhuN09DdGxFUEdx?=
 =?utf-8?B?YUptY1IrbHhZMmcvUmFsajUxdzN0ejZoQ09XMVduZ0lhMHpSMmFKVlovRHVM?=
 =?utf-8?B?R1BOQVVwYXc1aDhEeUNyQ21nU3FYTjhoVEQvYXBPVnpYbTJWNHkxZnJMMGlQ?=
 =?utf-8?B?R01TYWJnQ2tnNkZxL1lPY1RMSGRPZmNNeWpWb1JUUzFRaUtwOElYdXI0VHlH?=
 =?utf-8?B?emkzWEdaLytybVk0VnkydTI1ZTIxUDREV05JVG1YSjJrQTFiQ0J1bllLL3I0?=
 =?utf-8?B?NVdNb2srY3ZhdGJGcTh1SmRiY0duTzFnUVRiNmx4M2huNGhLNEc5V1pkcWs1?=
 =?utf-8?B?K1FoMWlHMVBNR3BwaUs1ek5EQnpZc0lFbUVEK3BNbitjYkRsYkRRc25EUE00?=
 =?utf-8?B?aGtuUEJiandYRTgrbmxnR3RkN3ZxemxEMFcxMDdUN2tRSzBNTld1d3BmWjhm?=
 =?utf-8?B?NEhEb2ZiSE4wc3BtdUsrUUZ4ZVBXbzc5eGV2S0R6dm9IQUNFSTFVaUUyTlMr?=
 =?utf-8?B?VHlIMnBmcnlkaG9FVUdLcm43cjVNYjNyRktwL1NYTERuU0o4TGpHWXhMYloy?=
 =?utf-8?B?NzArbXRQVjYwaHNTdEsvL2t0R3dDM0luNTduZXFnRS9WNUMybFU0eldFSDRY?=
 =?utf-8?B?L3k5Y3kxK2lVMlRPYWh0NTNKRVdab3J4ak1TUWFiUXppYkovVGdTazdoSW9W?=
 =?utf-8?B?eW50clMzREpiRjFLNlc0ZDhhd0FDOXZDcWcrdDhsWTdaWCtPbms2V2JvcVdS?=
 =?utf-8?B?NnJCU3EwZ0R1azNMVXl3azVlSk5UUWxDR2MzRkI2UHJQWjFNQ1FKSmszN1dk?=
 =?utf-8?B?NG9kSzY0RlNoRnZodDJPWWg2MTlETk5tVDhabDB3MmN4SDltZThVQnM5VmlM?=
 =?utf-8?B?elh3eEJEdkZpQUNIVGphVkJma2FKZ1RiVmFFRlhUV3lWQklMV3ljczU0UHZX?=
 =?utf-8?B?UW1laXE1ODBxUjdLbmUzUXgzSjVmVFhGWnY5RGN6QXNZRHNvZkkxSk5TcHE0?=
 =?utf-8?B?WjBHMzFjZWsraHRaZVNvcitYT0dVVkowekxodDljMTVXUFgrbjE0Ri9DZTN1?=
 =?utf-8?B?MURFM0QxQWpua0F4U3JDZjJUK2dReERJcERhNldrZjRGYnVSQXRpMGo1T2hV?=
 =?utf-8?B?Y1hOaWZqaytrbFdaNW04d0pYNmpORUJyOEJER3k5NUVsa1l2WVBrMW1zOUQv?=
 =?utf-8?B?QWNtZGEvb0xGV0YxYWMzaTlmMGRLemdxd2RBazBSYnhYMzVZak1UY2JvUURX?=
 =?utf-8?B?ZVhMUEpoYzNWTVZNdlZ3b0gzd2xzcnJ2WkpHeEZRUktNaWV4QSs3bXpibUV1?=
 =?utf-8?B?L3F2cmxYdzhXTDZNQUowdDhmUHFjZGh4QjMwZlZhUnZiOTZGaVp0Wk1nTFE0?=
 =?utf-8?B?am0wdEo2NGJhS0lxcEZCVFNCRVdCNFNQcktoL1RwZVJaV0k2cFJPby9WK21I?=
 =?utf-8?B?MHUyM0N4WXowQ2piY0NLMVZJS3c0NEluSGtGbmE5MFVWM24xVkNFK21VR0VW?=
 =?utf-8?B?bWFHSTNLWFBpUjI5YjhCTSt4cnl4dG9XaFBpTkxGL0tLbkdtS0JxdXVNZHNT?=
 =?utf-8?B?SFBMcE85dVFQK3VqUUxIRkhLMWxiVDErdTZaMUhsSHQ1VXFQUWk3bmVaOW9U?=
 =?utf-8?B?QmhPT240NGpqelBZYnIvZCtUSG5BQVRZZDZrQ3dHL2NyU0NhSVFyK2cwLzlK?=
 =?utf-8?B?MU9KY0ZkZGRycHEwQndEUnRGdkVwN3pwR2pncVlVaXlXQzJvc0JFK09aSTUy?=
 =?utf-8?B?VDJlK2hKdFdkTVdlVk9uSEZVMXYrVEw2NUFQNU55alk2ZTFZQ0RVcnJCK2tW?=
 =?utf-8?B?ekNwOU5LOXBXbmRXV09yUjlIS3lOVUZNb2tkNXBMa1hjR0krSXpjK3k2VW11?=
 =?utf-8?B?eVZsTXZCOXkxc3Y1TWtqalF1RVZLS1lOZmJOZFVSYzZZUXF3OER4MS9vSEpt?=
 =?utf-8?B?NDNNZU9FZ3lxanEzUGR2RG85bStwS1FFaThDRmxJdEN1bGRRejN1WFl4eGQx?=
 =?utf-8?B?Y21xblJ4WVRsVmJkVEZvN0FQWGpWRys3MEVrbUFNSWhQNFJXc2tKWVpGZVpr?=
 =?utf-8?B?dUg3Q1ZNVUtpdzNnc3k3b2NxcW1HTHZiOTlUcDd4ZVU1b1RsNy80aW10YVh0?=
 =?utf-8?Q?b97rqVSlm2tQ45wYXdMP1yodDXawORERMKjr0zAmc/Xuz?=
X-MS-Exchange-AntiSpam-MessageData-1: jgyhgJtu8lA/KA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2958cd7-f7ec-485f-1775-08df0db167e8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 13:59:31.5868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0B0XWsvIHe66TqMnFM47ipWI3XyGJ+AAl2wwFzyBc8B09x/l5Dl9YKBx+ZhHtOcgjWB4AY4hDpvZ/w4szQWMKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213

On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
> Hi,
>
> I'm sending this just a few days after v1, which is soon, but Timur Tabi
> and Zhi Wang reviewed the whole series in that time, and that led to
> quite a lot of fixes and lines changed. So I think it is helpful to
> provide a v2 now, so that future reviewers can avoid rediscovering all
> those issues.

I only gave this a high-level look so far. This needs some reorganizing
before it can be properly reviewed. I think the size of the series can
be reduced by at least a third, maybe more.

First let's keep the series focused on r000: patches 7, 10, 30 and 31
are dealing with debug logs, not r000 proper. I'm sure they are useful
but they are technically a different topic from adding support for r000.

Then there is a lot of churn. For instance patch 28 removes 351 LoCs of
bindings introduced by patch 2. They are not required by the end of the
series, but kept as dead code after patch 26 because (IIUC) their RPCs
are removed later. This is one of the few cases where it is actually ok
to do two things in the same patch: were they removed during the switch
done by patch 26, their bindings wouldn't need to be introduced at all.
Actually that's how the sequencer is treated; I have many issues with
patch 26, but *that* one is ok - a bunch of deleted code is the simplest
thing to review.

The msgq v2 part also looks more messy than it needs to be. It tries to
keep both versions coexisting at the same time, even though only one of
them is ever used at any given time. I suspect it would be simpler to
implement the changes as part of the switch. Or at the very least, let's
make the cmdq generic if we want it to handle both, and place the
differences in sub-modules. This should also simplify the receive path
considerably.

Patch 26 does 5 different things over hundreds and hundreds of lines,
that's more contexts than a reviewer can hold in their head. This needs
to be split. I strongly suspect (more an intuition than a realization)
that a good part of it is actually intended to land in the
already-existing preceding patches. Other things can be simplified: for
instance `Bar0` arguments are added to many cmdq methods, which was
probably the only way of doing when the series was first developed, but
now we can store a `Bar0` in the relevant struct so let's do that.
Actually the `Cmdq` is probably overdue holding one.

I'll give a deeper look at the next revision, which I expect to be well
under the 3000 added LoCs (famous last words :)).
