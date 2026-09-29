Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81653AFD18
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 20:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715110; cv=fail; b=ka35iY2hVlo1YJXXsVrCYXGhd95rurcHcVgMFPyKn5oSO8IkRGVE9mG/FBLsamL4YbIIaN8n9kQNldR/0vr3LrldjgMDkoNkrj74CqkdwyWYCO8bjfpk83DzcVdzNbjifFvisN27rCJL3mp0j2A2a1XVQHf3TNGbT3d5F2DCXT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715110; c=relaxed/simple;
	bh=jaacehOBWMUF96ys54o2xHaM4+sXfB+NvdAqVXJKZz0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DQNali+pZTMMUZl9tDKOwMKpErPFfDs1HnutCgiQjHyx89n+eczgJWxTDCPaYyWfCX8PqMelOVm47BBMdADl3XUBbNEBQoGbwihOjX1z/4H2SwzkNlU6CIjVedrkDfmQCN7Y1hw57zUcXxtvrliiuAasmZonb5wPeZLYd9OO4NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DSstgoNn; arc=fail smtp.client-ip=52.101.53.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DSstgoNn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/AyHsGC7pvmCgujg+aZppLtT2ihTnAw0a7fXIBS+GSBYgP5+Vx7L0VOJxbYdr8yys4Q+j9wQOEFm51gK8HXpNl6mdhyYGNuTbzEjIhwRhd9R4L+OPmqFj7BhpHQXEvo5s9aCUdPHLwVmnX5GGvg6ttZoltEOl49Ee0HvidR75m3OUDbkoD7i0yjtLQ1/wRvJbdLqo1zyYelu2PqmdBJ6gzoHGTCtFqBEEb27undvZJvcZ2iEijp7Ua+bw/T+QSe/hZCf9ELoN+3CH16OvZNGzT655WhaVTpcoHU+Se3HmE4SEe9izgTlePDd4vnJdOCjvMPkruQHBn6Bd9zYqsdMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy4a6WaJzS3y1eIVObOAKSnDr39f16N8mll0fMJpaVI=;
 b=Hpziv07Kx3l3EOc9dC0r5cjmZa2XXtCbB1cdpLvFAEOoiGbHKtdCigGS6YPqmmrOCYr7gSpFrL9l1opE3vF5FLsvcvyffMWVQDIDB6Sug9aQXojYgAGWDm1+DeXq/jFUDhL3/LobPH9eZQ9nmRQuB1TxwG9qXbXO75n/aBQhnlCGvyBmpLIMoE4GJtpAr1t4M1Z5vgtG6rjKbp4DI1ZpiimN/y8XOgldIGIINBct7km6W1Gwgw6R3ljNDye4V+BgHEN1RJG+GpftOkrD5sI4xRv4uX4r1aGTb9d+9X73ddmDotNLp1XwELn+WCQur4sOs5m26rTOI2Z4znlBHIpIvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy4a6WaJzS3y1eIVObOAKSnDr39f16N8mll0fMJpaVI=;
 b=DSstgoNn3FbJE/J8n4ABKymftrE7PTXPBAn/KnzMEERzV9utlVxKG1uns5/pk46r4vaBHuruF11XXuTHCu1qo6yNyeIEuplz6Wknf2xtbvuuczsSCIDT2gpJ3kpr/TzMVTHeMid3FT3N2R0cR/54g+dLheknMm7SyUnXGBnDp+ZcQ4gF4rXrf9ltyDE+cRdIkhFYlNo9pWpCJwTtFDtPXSOchZ2+5WBtmrHRXOCGXHY/7BCQ3JIHahmV+TOcuacajQLaKU0g4+uiFxGS353u4K2MsvzZpiCqaKek4CoSOoGvCa8SVrOPZUidPzrx/LB0LYLx2vPbvPb976hZFVER3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LVXPR12MB999198.namprd12.prod.outlook.com (2603:10b6:408:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 20:51:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 20:51:44 +0000
Message-ID: <3971c5db-118b-41eb-b39c-2c327e0127bb@nvidia.com>
Date: Tue, 29 Sep 2026 13:51:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: restore the "Probe Nova Core GPU driver"
 debug print
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260929204334.368569-1-jhubbard@nvidia.com>
 <DLS3I2C50V88.1YA81R37NW4JU@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLS3I2C50V88.1YA81R37NW4JU@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LVXPR12MB999198:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e01a8a-6868-42ff-554c-08df1e6b78cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2/SMcg3h5jUrlwjqnbWXInihUsAJtlWLuxFFzEU3sBb9PBBeuWULoKIyjB5GvMKKkekN9pe5AdBqx52RLAlduwV08yewhqnecvla7CoB9NATmNIoohifCV2n+GdATCrYRu74eBfpy0E9KVYG5pwTEgcgXZlEdVTVYJfn2ilfA3nQ03mPH47ScPQids7Sh+MsyZYAhXfiuawvOnLVvJkFWjTPRqEp40vEjEkL9U/xwrcDpou4RQHzUUNsBXmjzD56bgkgCnImggU/8UgiCJNfoF2V+b9HxYX3EVvd48sTRV2SAA1aTl+FO8Xu6VFaiyUwYZB1IOBuvl4+WcbpFK5LrDeCdaCNGmDEDjqqMmKcNtDT7fWrPbG3TcjEkXTdjYufX/PhyZaFLd24exyNhHQkqFRipw0QIz+j5vpLvAbFP+O0JJgnwSuRKJ/NVOaqp4avoaFxIRAzJ7Jxk0m036zkPdnOTkAnY/u+6nGFhzI9CNJ2EYLB+bQbrrnsQG3634EbvMVHVYyAzrXw2qDLWVMrScKqiQPesZJ+giDVVybFTWPBHt5dVUZ5WMjUq/lu6v+aDM/a1QvXVBb3R+XmbAVtO7zSjW/sw/vCn1p2a7DVTUTPpOsdB/xUVPV7oo+56QpFbwebt0ZzOVCvjLzJQiB3T+pFrt+KT7FY1B0H+vFvQo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0xQNXF3TGhHb0JrZWIwQ21UelRORmloaldzd0hLNFdRZ0JKTGp1MHQ1UUdE?=
 =?utf-8?B?T2t3WlVsOTBWYk9KV3pqR1ZSSWhVbElSUzdRcUZ3ZmRhSjdrbm1DRElnc05I?=
 =?utf-8?B?NGZVNnN4Nzl5aU43UGNEZGRiN1dXM1dzZXpGV0RSa2xPNDV6S1lMcitIWkcw?=
 =?utf-8?B?UThBRStoWUo2SkpSSkZVSVNXVUdtb1Jmb0ZVMFBpejN5d0RoNjJCN1h4NDhK?=
 =?utf-8?B?WGVMUktYRmZsWE9WVkxiWFRJSXd5QTFRU2RjTWxYMFpZSS9ETDFiM2V2N0lE?=
 =?utf-8?B?V3BwMThHYlByZVNlUHFrRTJKSXlmSWJ1ZlM1VzYvenFYMk1sY1NlWmtmZGw1?=
 =?utf-8?B?RWtEOEdpMVFuVDM5UWUrblEweUU2NUZQZDd4NkNFbDMwN2s1T2VHVytvclNN?=
 =?utf-8?B?MXZ4OHpQam9ueklUUHBUNm1WYXJ4b09TVXlZTnl5RENoeHFKaGZjK2tEam02?=
 =?utf-8?B?bUoydUZyUGJKa0lLaVh4T3FwbkhVbXJGUzJmaDdPNWFuSFg5QnFhakJZZUoz?=
 =?utf-8?B?NEk0RFZIK3F6eGJBSW1CY1RzdWhrcjFyc3cvTU9jQmc3MmN1NXZFeFh3UWxN?=
 =?utf-8?B?Q2JZU2RndWdoNThJbDJTMWh1elJ2MjFtcnREYW1ab2lYV01yVDdmWnl5T0Qy?=
 =?utf-8?B?NFVvUWlCOExkMjl4cFlVbE03bGpTdE1Vd2xwZlk5Q3lsald0Y3NvQ29ib2xL?=
 =?utf-8?B?MVk3VVlRUDB3ZmJWaEFhOVQzU1haclVrQ2dVN0h3S0UrV3JVNUpPdmZTMHk5?=
 =?utf-8?B?Y25aQTh4RFhLajZPTW1kd0tqeHIwTVR4R0RTVjFvMFB4VlNFMWJ3bVBtUVVi?=
 =?utf-8?B?K1pHVTRTK1RUV0VZWUljUWc4OE15amxoZUhRYk42Ty9NQzlseTR4aTQxN2Qx?=
 =?utf-8?B?RVpKdEprYmwybXI4YlRTTy9UaU5rUWNMeWlja0xzZXFWcHdQSGRNZUNwcldK?=
 =?utf-8?B?QUh6SzV1UjgwRGpsMHBnRy9CVytxSFpEQTFoU0cybkZXQXIrcWEyQitENDNM?=
 =?utf-8?B?ZjBXMVhJcHlKT3ZmSi9ra0R0VThzYlVCTzBnR2duZUdiV1l1Ny96QVlnNkFo?=
 =?utf-8?B?emM3bkpuVnJJUGJrRGtUOHlBRjk2VDJhNEpMVlpHekFNY0toVUVuT1E1cjV5?=
 =?utf-8?B?dGZRaFJ2Z01EelVUUEJmbm5EYmUyODFjNmYvUzh1d1lLR3RNQ2xpVnZXeTM5?=
 =?utf-8?B?T0N3ZjdRTEFscUwyNHB3RzlWWWIzVXN0cHd4TU9XOXdONENqS3hiOFAwYUR5?=
 =?utf-8?B?amRlTWJtdDUxU3pqdnFFQTFHY01xNW9VUnBMb2Q0SURHV3BNRG1rZlp5L2Q3?=
 =?utf-8?B?d3J0UC9aVXVnYnV4cDdYQm1DbStWM2QrNG5RSmlMWTl2aS8vS09lRkY2SFNo?=
 =?utf-8?B?VGlkU3dzTkE0WDYxaDNmZnVLUFN3M1dUNzJTMXdHWEs4dERjd1dWSktvOGNl?=
 =?utf-8?B?dFh5ODQrSXd4cnRvWUV3WXFIaFY0TFlKWThIeDRKYmRoZzNnSDBLenBFR0N4?=
 =?utf-8?B?a0N1SWFtbitTRzNSZmVBWXFHMkxqcmxRWmNNUFNId3ZGSGlkTGpDdXNEbTVX?=
 =?utf-8?B?TDNFWUUwaHdkYWJyLys2cFk0VER0YlJuR2lrUGFFVHlXc1pRVWYyQi9IRnlN?=
 =?utf-8?B?dDNTVkFCQWUwNHNhenczL1JjNktXc2JFVGZvNjEwVHVzM2dVbTBOY3lqVExC?=
 =?utf-8?B?bm1kQWtDaGhOV01zMHloTloyOWUyRlUvQ3N2MEtLV3BMdTFpenprV2tqemU0?=
 =?utf-8?B?czVTdzhzOGJYTkhvMFEySHd5VjcrcHM3M01tUkd4MXI2cE15TktENVhPck94?=
 =?utf-8?B?OFRKWVZ1OEtnSnBCZnBuekFEZTlKN0p0Q0dlUzNiS1ROZzRsUlJJRUdHd1VP?=
 =?utf-8?B?eVJ1Z3M5SFNITC8vZUN3MHRaaXJacVBwWGpkMjF3bGJZS2RCL1R2eEhGSWVt?=
 =?utf-8?B?SlV6RFJTZVFYU2IwaG5pdTZiM1kzc2Juc0tzUk9FQ3lhcEg4UXUyQ1ZzdTVF?=
 =?utf-8?B?QlJJRlFZdUF6cm42bUNrRUIvVFIwejR3Z29MVysvMWdoZ0QxSWE1MDJRMEw2?=
 =?utf-8?B?bm16aVdBcHpLcDlQUTBiU2dMdmJ4ZHEzU05rS0E2bWx5d0ROK2VRR2NIN3NL?=
 =?utf-8?B?YVN6dUdXQnJOSzRqZnhOWmp6aXRqZ1pYd2NnaTdYWWpFMVM0ZnQ2SldKRXF5?=
 =?utf-8?B?TFV4U3l6WStFdnNXZ1FLd0JEeHZFWDJ1TzlsajFjbk1SQkNDcFExbXR2Q1dD?=
 =?utf-8?B?em9IbURLMDJYdm14TkZjZHh4S0VKbVQ5UTJrOVBZdDA4ZW9OMU1FWGt3aC9n?=
 =?utf-8?B?dUY2Q3l1a2pGbHhCdDk4M3ljcU1ONE9mYmNtclZ5NUFQUmVBSzVCQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e01a8a-6868-42ff-554c-08df1e6b78cf
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:51:44.8569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jZx5eT+IzGTKpxnfnurmvzjkT4oagvyRIVSTlAu7ZJgW17gK2LS/WBPxu1u9wM6tMKspLMbWPHitlb3dKUYLgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999198

On 9/29/26 1:50 PM, Danilo Krummrich wrote:
> On Tue Sep 29, 2026 at 10:43 PM CEST, John Hubbard wrote:
>> This is a high value thing to print, because it acts as kind of a
>> bookend, showing the beginning of trying to boot up.
>>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Fixes: 658c5f0042e6 ("gpu: nova-core: use a single try_pin_init!() block in probe()")"
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/driver.rs | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
>> index 291a047e4d86..96f2638d6400 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -102,6 +102,8 @@ fn probe<'bound>(
>>      ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
>>          try_pin_init!(NovaCore {
>>              _: {
>> +                dev_dbg!(pdev, "Probe Nova Core GPU driver.\n");
> 
> 
> I'd like to keep it outside of this block, as it will transform into a field
> storing a pci::DeviceEnableGuard soon.
> 
> Let's put it in its own _: {} block or before try_pin_init!().

OK, will do.

> 
>> +
>>                  pdev.enable_device_mem()?;
>>                  pdev.set_master();
>>              },
>>
>> base-commit: 658c5f0042e6e897338dd04330a363aa7022c85d
>> -- 
>> 2.55.0
> 

thanks,
-- 
John Hubbard

