Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5537132BF52
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382450; cv=fail; b=TnRngzVmAlePJHQVZIVkPctg0m9ggMebk+XkI2InLP4O/Ba7tvb20wpL1ZeuAJ+Y5IJu4ALfSWJmG2D4tPK7XGU9rde0t0wKxmWvzAk5G99mkOO2mZqUO7uQ6aiulacCdDc6ZJDDVl4aNRrUBvXYfrAKCiBACvaUCQHRRa7w8q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382450; c=relaxed/simple;
	bh=/DpPLfoAjfimlK5UDtssnn8s7m7S114yf/JJyj13F3k=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=uLkjS8Zg1EHjSUGkqyESz67VUPmXt71Z7hHCLz8Sy/7tKU0cA9hfi/960A2f7fLKk3bxEblB7xkN3SP7crYkvrBIHmQJu142T8Aqe79AOz5jDcPzlSOyicyEtab1Zy34f6RI3ldxGUoy6U2I5+Fa1rLfh5AvVkQ9kIeojt8T65k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QlZueQGU; arc=fail smtp.client-ip=52.101.201.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QlZueQGU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cmk+293sIYXdCOqwcc5MklmA9x7gfmNly+a2sJQTjJWi/HtytulvKiDLnJmCm7wJiX2jLl5/z4nvvkLdrvESqpyWAaYYZ1egtVrnMYU4pHFfArM+/n65oqnsHqaKqjcSB9AL9DDj8+XPADjFaCi/JtWCzIJY1ZawE4HrajM/+MBONQ8Bmc2SykyfjdNmIP/n8yZaukRj1eGNAw363ivFESTNQo4e6PuSXx49Z7nsCktFNLHvuQJ1e5RXkXYklwNXHk5zgTkUnRj5FmiJt0/od/kIANs1wTd0CawDaBngVhMc4x7oIcIku9fEpJzjPDV0W60g9Rznvqt1nSjF/wlw+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DpPLfoAjfimlK5UDtssnn8s7m7S114yf/JJyj13F3k=;
 b=DdRPxUI/jsrnmEVPnOashkTWjCIGUn6igVxUelNPFNld6e7+/RUZ1wQq5uTs2DOT4CbaqmUT81A9sY7zWMyXuXXnSFdioGimdv6KSO3xwGL5ytvV+yJW3aIHkbTD+CAKz0S6MHyjc1jKXT2/me1LVmz3mGVLC12SwfqEzEIHxutoz/v5NFe0OBbmhTa/wD8raS2oaHIDTP6CNdOlBd1Pbt91MQKaUbDQxvfWlWDmDws2se0cyGFDap4/Q1cGz7JtS5ILfNj56QoaumoCY4QfLSht6T1akuM4RRSGFsh5BJx9Af3TMPRiE4JiP+MKh52LV7xL0JY7xsc8JfztOXJ2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DpPLfoAjfimlK5UDtssnn8s7m7S114yf/JJyj13F3k=;
 b=QlZueQGUgAIrx/IYioUcIx/H18pwVuePaVKWEiW0BTU/+kWPGICNxhKGccDfduU1dnbEJ49y9r3M7x7VGPAobXVAwPooZBxnWKNLKrAHvUTUW2dqWIgf+vl3MewBlg0ljM9AhysT9rSGuFGcglYfogOruXG73zpQiidN+0WK+odxAOuRXYPQNhdo2ZFRB3ssQJ+NA1X0HlV9iLQXTOiXgqCwAwWIHXHNf0cq+lXWgp0MZF4/Qg8uGwFfg+OyQygHAwGxUeQ0DLBh4ESWVGOht+riode2uFIFCd6t/xaW41Kb+SxJQHbc3eN2pRbRveggc8qpZvRwlWpGlnvYa/zFDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 2 Jun 2026
 06:40:43 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 06:40:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 15:40:37 +0900
Message-Id: <DIYCWGGTVSQL.2QNBSSAH15ZFV@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 01/22] gpu: nova-core: set DMA mask width based on
 GPU architecture
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-2-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6P286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 415cd2d2-04be-4388-be53-08dec071dec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bvy5T9SY2WGBF7jyqKorYVjL4cT3YwDLzd2W9Ih6pwIZjMSh08O5u84GkerPBZHJhWJBVM9czOp+QjwxQs3fpHYrVg94uHikHi1H0mFQDFZLw8FCFKlk6FhQ97uJKFAsE1Yp8N3D+y0zon5cRyUa7UebKul/+N8l71hmdHV2s4fAauxcg+xEcyGBhuXJ5KcB7wil/R9uxKr2Wbn7eR2B4Pj3ggxbdqyMwZginWs6z5gKWy0FqY9uuiJVV9yZrq2TK03Y2a1Djue8kVtrgOvXg/rPt+JdVKNEVq6w6qaV5hiUj1Mdg+Bkmviv8MxTZjWYowdu5V/xX7BPl/KFTH6TFEejVr8l3X0bCtUk4DADQVFtux+r8t6SltVT7T72dicv+U9pG2jTOi0E7V5izPtz8tJ9PupNAs+gSlrYCLHEJhD7n+eBxTTAlPXiIBWlw+QfQaW3UcrQZqbawVGjidUuf82aZCDFWxvkwfpL5JdFKStb1Frk2ksur9Wc3WHXTNKjh6A7xws6WZcjSzI1KETSO1lRqDuIjrSMXEym2hlEhCPOsvq8RFQfMrlG/ZUA+7+vHqfRPm1hDKg5pPoeZ/R1QWG2QN5NXHpD1VeqYcyzxiKpn/g4p0+8/RPdVnQuTRrcySEyuHx2TdKYVCBpVvp7dFiddaBi3+1oPBO85a5INPq9ulcL/Vo/rrF6z/YU9Ie2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUhZQXFNcjU3MC9TTVBQUHc3ODJrMThLbjN6OElEc0lSbi9kUGlJZjFnNXVJ?=
 =?utf-8?B?bkpjTFA4QUFQb2NUMUJ2WDExaFc0aWs3dGppNFRhVWJIdEoxM1lhZ0hSZXZS?=
 =?utf-8?B?UE1iTy85WFRPR0VBYkh3ZXRJcUo2TGM0N1VENWIvMHFwSDRmYVdvYm93dHdo?=
 =?utf-8?B?dHQvYTBsaVVVOGlIUWYvbnhUdFFJQ0hGQ0syZG5LVXFMSG9ST25hdE4zY25B?=
 =?utf-8?B?OGN6YlJ2Q1RIKzIvcVRja1JwV0JaS0xNUis3ZXUwUHBzREdxRHNsWXF6eTZ4?=
 =?utf-8?B?RWZydjNGZlZzcEFxTDRMc0k5NmQycXJna05GVWJmZytpdkNKcEZOWTB6RzlV?=
 =?utf-8?B?TzJpdkl1MjAwY2REMW0vSG50K2RIKzkxLzlJTm9lQXdxZEpDRHRXR20zdDFI?=
 =?utf-8?B?QXdPWEE4K3IvWVRKMloreFlSeGtvTTNqbkkrOGpoV09JeFU0allJa0N3Z1l2?=
 =?utf-8?B?bXpzK1ZYZDlBMTk3ZEVPNTlTc1gwMko1czdld3A0c3VZYUdSbk4xeDBWVy85?=
 =?utf-8?B?MUhKVGhPNmMwUXZuZ0djbGJBcTRVY3l4aXZDcSs0ZDFIU1ozb2hvOFM2OW4v?=
 =?utf-8?B?ekVaUUp0eWZnWFh6STFLK1NNYndkbCt4dlBKV3FLYytxNWI1aUltTktOWjl3?=
 =?utf-8?B?NXcxUjd0VTNZeW5kS2pjMk5UbDJTbGxlL0ROQWxQcmJvYmFWMm5QbGR2WDR1?=
 =?utf-8?B?ZUtLdE9sdmdYcFhRTjFDcXdNRzhBeXorYXNwWmxjUnpGZjlZbTZmWlduaXA3?=
 =?utf-8?B?aEp5V1NIYTJEa21HUFJMVnFhSlp6U0xZdktPMTFFYXVuU0JodkhhMVcwSnB6?=
 =?utf-8?B?c3FZZWhtdHlaaDJIZnJPL0hRM0QzNlVERzFnSnZ2QzhGc2E3T3FiRVE4cktO?=
 =?utf-8?B?N1FEbFJocVFBQld6MWhqV1Q2WWtGNmg0aHA3U2Z0NnZycmVBcDl3S2dVMDVp?=
 =?utf-8?B?RVJYT01BVitSSE5XRjQ5YStTc28wQ0ExaktkUFd2M1RuYmtkcmNodVl0S1Bt?=
 =?utf-8?B?SldKcVNaSDV4RTB4cXJFMW43Q3pENjVGUGlobVZUbnpXeGpvQzdCQy9OcEhj?=
 =?utf-8?B?SjFCWis0dDV6RGdTU09KdFdrekxzcGU4cGZKRHhsQWdoL0FQY3hsNFBiMEw2?=
 =?utf-8?B?ZTF4c210ZnluOVplR1R5MXBxZnpSYjZ0c2xQaWxJS1V2MWtURlY1UVh3ODI4?=
 =?utf-8?B?VXk0ZVdkWEp6djhkWU5TaS9EZWFzZHkwNjJ6VkgwUFBrdnJzUDBrVnBJRTQr?=
 =?utf-8?B?S1k5RWVkMlY0cFB0cjVVdjZRUFZLT0czOFpmSzQvRkp1M21QbHJQYnFHTEJt?=
 =?utf-8?B?Nzg4c0h1Q3dBUk9OL3ZIVW9nbzhsTmhSQmlYK3NlNUI2Ykc3cjgrY0k4MTda?=
 =?utf-8?B?RGJRY0VCclgzL0RWdTJnUTdSSVRqWFhOeDc3ZWoyZjM0bnJjS1RmZW9kVkRU?=
 =?utf-8?B?UnRLTkhDSXNDTEI1SEhXWEZRTVVPNUNUTEdNcWR5dm05R3hTa3MvUktlbmVu?=
 =?utf-8?B?cjRNZEtFNjFUS29aYWhaakxKZjcxUXp2QXhsVjRCa3lvbnJVSTd4ek93dGJW?=
 =?utf-8?B?bHJWTTN3aG13S2JDamdRYXZSaThlUkZpdEZxcFNGU2V0UG9PK3hJY3NMb0N3?=
 =?utf-8?B?YXBrVDhGdXRPZ2xOa1FFTFV2aTl5d0dkb3lSbTI2N29ZRGt0dWlNa1RCNkE2?=
 =?utf-8?B?c245eVA2Q0ZzRFp4dy9kK1pKMVJ0QjU0Tk5NM3ZCSGhhRE95a1YxcGpyWXRp?=
 =?utf-8?B?b1QwVlNtSU9nWnNCVTk5cExnNGt1ZC9zc01qYTd1UXRvcGFseEI0ZjVVT1NG?=
 =?utf-8?B?OHdkOGZYRnJuRXlXSG9NMm43MFJYdXRFWUdsczVnQmhaUUpEamNWSkFKOXhS?=
 =?utf-8?B?dmFoaktnN0I5b09BVlEyRGRMYUMzUmtDd1plU05zUFRPN1dkSFhPaGMrWDF2?=
 =?utf-8?B?UFN4TDV0L1ZrWnBocEkwbjZVM3VabFdRc2tlRXBiWWNnWVA5Qm1OYU5KalVP?=
 =?utf-8?B?NkYxL1J6WnJoaThjdHYrZWJKbHN2OWpzZ3VQU2JjUjd0VUltZk1TOENDV1JZ?=
 =?utf-8?B?cFpMN05kRjhWRjNOajk1cXlEWUxuVmtQY2dzdldjdkdVd01pVHVuNmVLOEJL?=
 =?utf-8?B?UnMvZ0Zwdk5ZNWNOWDBjT0Q4bEZScXB0dVFkUk9UNzArNFNJSVFxS3cxZWt5?=
 =?utf-8?B?MmpHN1I5UlZ5RlJ2YVEwTGFLYkNOVnM0K3FUbVc0U1Zia0RjWFV6b2o0NHg1?=
 =?utf-8?B?T0hPMnJIVFBIVkZhcnRtOWFWaFBBb3FkYk54ekFmU2dZQVRrZGV0aHBGRThY?=
 =?utf-8?B?TVE2b3JKN3NZelZkOTV5U0JaT2VXSVR2WmlvNEpLeTZRckVPUWYvTkp5eXV6?=
 =?utf-8?Q?XbvAH5CnLd4UJ+TVvYhZXdf5x/eDpuOvwRkXHIUFVLL3N?=
X-MS-Exchange-AntiSpam-MessageData-1: xblZIYeMY6pJig==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415cd2d2-04be-4388-be53-08dec071dec9
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 06:40:43.6474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAkx1/7ImNCcYNKBE5/Awl1AipcdRd1k4t8qPCxFtxRrzatNwVBAU/wYKxt7enIi/VE4R6BCy5w6Bm3YP+OFbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651

On Tue Jun 2, 2026 at 12:20 PM JST, John Hubbard wrote:
> Replace the hardcoded 47-bit DMA mask with a GPU HAL method that
> provides the correct value for the architecture.
>
> Set the DMA mask in Gpu::new(). Gpu owns all DMA allocations for
> the device, so no concurrent allocations can exist while the
> constructor is still running.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

