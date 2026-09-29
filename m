Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF92798F8
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 21:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717688; cv=fail; b=GrRD/TY9UFIXjhTq3ugCLAQAT0o9Xw/o6DnLkHpLMbYVjCj3nA9UcmCFLAO6tsnLt+1zuRchaTMibuJbuFG13wn26QrHVuO5njKRLG+mUimKS9bWdiJ83plVtXgnA34tY29V7yjV964eHod/CZyhkqNEvwxM03x4KKKNcXYiH4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717688; c=relaxed/simple;
	bh=mPxyndvaK255WVkzyDU8Fhj7mdHgoi+owmA5+2NEYuk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sZPUprsvdG0zkx144nVpdoM0r5p/rL1ZHFnkb7KfCrBkjER89K6Bbi+24C+O9Dm76uhhPyo17pgdPhBp/Np5Y7tllmTL6QuEyfHuvdXgWz0oRWDjg7kDA+EFcuxJBaTE+MxSOjVizTTKJUFyNMXwWnAnTttEM0TWDXt8IwMmwV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F3tg9LuD; arc=fail smtp.client-ip=52.101.48.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F3tg9LuD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWbYJ8x/RNU8w6yfCVfLXB3WTgiQus+Z9oZSIkbUZBo54HhuXsgoqcPpXgXgwovRjf63NtwE6maPNzjLHhs+WRRgRMTKnshbwajIhr6iLTv3ROIu3katorUpAMAc+0L09dLSwQuDAfKfi+cZIpUiLRIS+EUKTU2Ehju9J3mT5lQ/o+nAAtjX/WuPD9sWxOlHF1vdnVsdvLqCBzlxzQm+nAj7x+b8kclY9Wsooc0GGFcSBxp5owL4bVtKvPxtgdZkUE9+DP2Dh9cEBiKm+uuL2ouDNQ6nUw219P32H8Q0ofAuz8Ag5aVMQqO+VGBHeI4votcOJ40flXBk0kvonWwZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+TwAtjcJ20sCbu7rM9VaiGKLWwv19eWnQZushAAr8c=;
 b=qbbZfNFcuKiIIdceeAWs+CDJOSWI0BW/CF0m53mSvir1oTIsh7s0MK3Me+Qv6BH26SYE/W9S0i2DYMSGQyqilcwpxztztVmRDgqKoNVwN5qP+jIvUX3DL/6jVfkyb+ReWbepK5+NEL/sDDky9bfnqU9mFitExy8JTu5KCSxbBx2T/rbx1zc65lYHQlbvhF3fjiK2+Qe0vu54JrwaQ4mkrW//3kWY68uQfQ6p9Q0ZA4V7NFiwUzNRLsVjBB/0X2ZCIs6EkB2n6u63zCepxCuo76M5UWbS2rdjaUeW1jWZuG4DWwE1NX+5nv8lNZWR9LyZSTGBzCWVWRfPeEgnGuZb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+TwAtjcJ20sCbu7rM9VaiGKLWwv19eWnQZushAAr8c=;
 b=F3tg9LuDtTfOYTgFoEwAKpSGPCmCed1vRoTdNFwR69ej3xTLQ0VX/XuZd96ZleDO+qim66JKgce2psZ/9XWUvGaOqyRIjcNf4ez+SUMrnVe3KC5HLfKw/RBppwUVQc89Xgpf4alGlF4KSPkoksPys+1YCPTlwo6UzboWkphz61atR2ZvYJnU2Ouq7MwckjXpTXCEJY9jFqAwVvF2Ql8HIW8Cq5vDe1imNwliMv1EoBBnNE8StzW9L1TyTbk21e4sOp089x8A/XUMj1/MyJGrp3y0loSI13iHZvZ4NX8R3L7+svNmvTQKh2WUXLo638DPDnFzDjfY72vlj5v7FvHCPQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB8819.namprd12.prod.outlook.com (2603:10b6:806:32a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 21:34:42 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 21:34:42 +0000
Message-ID: <65f49657-175d-43f1-b172-62efe5cceb28@nvidia.com>
Date: Tue, 29 Sep 2026 14:34:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: nova-core: restore the "Probe Nova Core GPU
 driver" debug print
To: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260929210749.409380-1-jhubbard@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260929210749.409380-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d3da5d-62fc-4562-6c01-08df1e717928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JXGWoZ0SVlFYKq7Syjib+McjeJ/NigMkP+33JATAR4SLxTCxu6WncME11qo1fK0RI+hQou4xu2GHWZpIJs8PaCY3GpEOkVf6HmTzrBfGCn8LqVzra8HE4tacme/8YMCAfsWMrMujkxS16SgNntDEaCJz88g/XjbccsUwnPjkkGLFPNVmVQ8nvLlOHUwidi3p66RjIs1d97W5hs7R4XxOP2yTh87dsj31wvJRWGYzCQm6GdnitvQo8hQKUQ+g3OTBhWJRbRlI7IrK7/KWvbs3JHZh3b7ekeMnxJuKTe+gMUIC1tBvbnHUeRLCC+vo5/rwcAv+BlhOupQd6afgaUNCWQvR/TT2VZeZ1YlqrOh8/z+fgXaGiUGkDeuH4laujOVxW6ic7qS4HrnXbl4bfbM/eGL3OiUOMZYtZ4c8/slUtYZubp90xNLRBGHyzpqu+FmjzJ9hcQyD3/+bTLAJURiT7ZOBy3+ONbw/JeSom/zH6yEhZUTbSner92yvjLql/KZwy+EhjhZHJWkEfn2LnX22tEngWdmaJrXpXxWxr7IJtQqJozm6S84VZM1jTir6+hqOE9Cn5eGT1L+z9YIF4Le+j39ao1jwxIQ0/dKiYP+VVbH4cKRfxBHbX6yQFOEmaHc+V9dVWmcQCAwDlX6dCvrI1v8RkOs5nmMiIIULtEFjJQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TTEzUXRGaW9udDlMZVU3ZmRsR0Jvd2c3VzdUUjlsMzlMTkk2QWoyaWdCaDUz?=
 =?utf-8?B?VmxwU1c4Zk9YMjg1WFR6YzNhTm1McjB3bHU4MnJFMVNabWtVcDVxajhtMFJ3?=
 =?utf-8?B?SjJCSGZoT1Ixc1NyRXl6VkFqM2pUWkxoOHM3b21ucGZ4ZERJb3ZId3llNjlk?=
 =?utf-8?B?MHphZFZmWUhYck5sYlBIQlYwdXZzL0J4dnZVdi9hb3pEVHhwTEdhME1MOVhl?=
 =?utf-8?B?djFsQmp1bWVzMkl0ZG5WQWRKd1RwQitIYlFSWkFyck9DZEJLMFcrYVczZXNM?=
 =?utf-8?B?Z1BQYk1LSWxQT2p5SCtGWnFkV3ZOUEF5ZTF1Z0hjNnlRYTNqck81amduM1FT?=
 =?utf-8?B?T21yOEJLWmVTZzFRMVkxTnBoYTlMUUc4UDNEUFp4MkdpYjRkRUxOS0o2U2lS?=
 =?utf-8?B?NXFOZVBZWFdTSkFGSXBidlllYVBGdFd6b0VId3dnQmVHc20xcmovd1NOM0hu?=
 =?utf-8?B?SkVWYTB2UjR0VGRxZlh6Q3JOWU81M3lseGdxZnJSZGN2RDRBQ3hIL3JzTGx1?=
 =?utf-8?B?WEZVUndLRVcwM2s4TGZiMXYxR1VvODBRdVdEM1dVS0YyUzNQbXM3bWZoUTVS?=
 =?utf-8?B?ZWtzV0pTY0N1ZFlXM2xuQXl3Zk9oSE91THpJZVlhMmlTK0NHTEp6SW1DQ3N5?=
 =?utf-8?B?aG1iV0E3WmZzV0EwZ2tLbGdXU1RZMUc3U0x3OTdLOHZteW1rOTAxWEpPaTd3?=
 =?utf-8?B?K0J3TkJlL216Y0hrQURyYkptZmxnK3dzbWJCY3lPSUtWVGVWcE1sQSs1ZTNQ?=
 =?utf-8?B?Z09LajN4ZSs3dUlIOVRJd3RCRkdvYXdFUUNUZUlhNzhQVTZ3bGs3MFcvRnBH?=
 =?utf-8?B?d1hUTjJkdStBZ0taMWZ0ZzdscnhLYWJmRDB4Z3BYOEtTZ3RJbU9KbDRTN0Fm?=
 =?utf-8?B?K0E4YUdNYkswSWpsdzE1ckw4blJ5ZzdMektMSXZkT1Blb1ZnQXlzbEJuemVE?=
 =?utf-8?B?NjgzT043Ly9jTTV4UGNsUHYyRE5ZRk5EWVRPZWdkSHZRUHdPL0xDZWdFdFBx?=
 =?utf-8?B?cFZMelpka2g3dXhxTlNPL2QxLzZDTG8rbWMzM0FyU0RZOXcyTndpamJ3eWkx?=
 =?utf-8?B?OFN6bGlDaFdRVmtEa0JBMzlkRHhubGthUzJYZlFmSHJ0eStsa2pTYU5TdHlT?=
 =?utf-8?B?Ykpzb0ZVcDZmWnpYRTdLUHNOSFNTSWgvdmlNUlFkcG9ieC82THVvVWV6Z1Ir?=
 =?utf-8?B?NWxPUGZYYU5VdDFUN2ZzenlrS0FRN1A1a09Sc003R2ZveDFveStweCtybk5y?=
 =?utf-8?B?bnk1aGV2RUFnMzR4SzY1SUIvQUNpMVhDYWRRZzRJYmRWUUJYenU1bWZ0ZEN0?=
 =?utf-8?B?M0xxNnNwTTdiZjdQWXZFMTMyT09oZWhGMzdtNnMxcURhMUdNOE1NUFFOOFMz?=
 =?utf-8?B?eUVmbmpZRmJad1hhR0MvTis3VEdwdGxCcjNNQmtNanNPVWtoNWRHUURSb2V2?=
 =?utf-8?B?WGJleDVtRnFPZ2xoN1l3bUIzeGpXZHU1cTNHWVpIUjlzZE90MWgwcWNGWE5m?=
 =?utf-8?B?ZXF0cFozaEdCcFY1ZEMxU1liVFVvL0I3NE41MHVycDhrNFFZT0w4Z0tTQ3g4?=
 =?utf-8?B?SFJxVDJRenZYUGQ4bGFxQjQ5NXVTbXM2eDRxWmhsdUxiSG1ONFllNjllY3JV?=
 =?utf-8?B?NmV2eHBBN0JyZFJsNnVURk1UUkZmSDkwYXlpR1JNZmZDQnlVMDBGZE5XQkNm?=
 =?utf-8?B?UG9pNXJURlhaUlpCTHlrbTFIdk5Fc3F1Z09Yams4eGV3OThRczdzOEFyR1BU?=
 =?utf-8?B?UGVTeDdRejRJcEo3VWVJbUlLUkdXZzJEb0txcndNVWI5Tk4zREgzbzVNSUtZ?=
 =?utf-8?B?akdnaUhDSjR6a2l0WTIyci9uUGc3a0diM0hGUEVnTHFyZTBDWE5IZmVvRU02?=
 =?utf-8?B?ZFN0akc1UTBpdDRuRVk0YWRaREwvcy9WeEZXTDZXakwxUE5NcXZLdjdRanRK?=
 =?utf-8?B?WTNpbmxIOFI5NDZ3ZStYQytWdENYSlEvTHNVMm0zeUtGNXBaeDdaeUlOUzB6?=
 =?utf-8?B?aDM5Wm9ocnBoQ3hvZ0s1djBuS05mWEZKbkl4WDZnUFVEL2NGOUtBcEpCQnZC?=
 =?utf-8?B?Mzd3MWw0Wk9xK0tSMitBTHVBK0kyQWpGNlFIMjlpRC9Sd0ErYmNYVW9tUEhR?=
 =?utf-8?B?ejRUQlhuaHFJWXllTWY5L3pXYTY4ZHppK2tMeHZCcCtMMXY3c2Z2c3BsNWxw?=
 =?utf-8?B?d2YzNFJ3bm5TMjNKRjJUc24vdm1xcTVvWGpxMUV1TjNFZ1cwaktVSk0xdVBs?=
 =?utf-8?B?ZFJpL09BRVdwUVEzZldCSzBIdjE3OTdSWmdnNlNmcGZWSHJxR0dsbUMxbisw?=
 =?utf-8?B?S3NEOEJFTGw3aC8xNTdTVTVXVkViSTJTNXJ1Q0NaWWdObk91U21UZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d3da5d-62fc-4562-6c01-08df1e717928
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 21:34:42.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LU2LfLT1uybVtcvdcUn8TIpHTIce/coWS/BtIK4lS0MaanIhvkrUsCbWpqfJT0LXuckNpRl/kdKHLOAAu8aIcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8819



On 9/29/26 2:07 PM, John Hubbard wrote:
> This is a high value thing to print, because it acts as kind of a
> bookend, showing the beginning of trying to boot up.
> 
> Cc: Danilo Krummrich <dakr@kernel.org>
> Fixes: 658c5f0042e6 ("gpu: nova-core: use a single try_pin_init!() block in probe()")"

There is a trailing " at the end of that Fixes line. Even though I
ran checkpatch.pl on both of these patch versions, it didn't flag
it.

> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> Changes in v2: moved the print statement outside of try_pin_init!().
> 
> 
>  drivers/gpu/nova-core/driver.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 291a047e4d86..623d59dcde6e 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -100,6 +100,8 @@ fn probe<'bound>(
>          pdev: &'bound pci::Device<Core<'_>>,
>          _info: Option<&'bound Self::IdInfo>,
>      ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
> +        dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
> +
>          try_pin_init!(NovaCore {
>              _: {
>                  pdev.enable_device_mem()?;
> 
> base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d

thanks,
-- 
John Hubbard

