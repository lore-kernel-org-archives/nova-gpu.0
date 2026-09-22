Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010015.outbound.protection.outlook.com [52.101.201.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC24388890
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044807; cv=fail; b=Aej73OmxZeDu/5fll2do1HVxTCCltXzZoKTodWaZFLprR6o4qnQDXJiQAJY2LvbV2HubGh52yf5MpXj7SMsv5gecMdFY5nruMoxVbJiyES9+rrid+R0vhOY5Rw2t7caB32TPX4dI5oV8jHFsEPgijFFM2N8p05OO/Az731jozY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044807; c=relaxed/simple;
	bh=QHGXTWrlknntWFuLeSDVH/sHCDLGbJ2kD/3Eg0Xwl7s=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CpryXvX9ILVM+DENDwD3HFbKbxjv9ohjUc7W3CTzJHbqJG+NDvwqj9cY+T37qj9YNpNJC1Od3Ducprblqkh14l3Qj0jWy2tOKkgAN5gx0sWS7BHRZN4Gsac+IqF1QYRkkMLFHQFh71LZpuTPU++cIXxiw/MkI0Zxvlax8GQX3Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JMMWZlqH; arc=fail smtp.client-ip=52.101.201.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JMMWZlqH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrqWptsDKPdnPAX98tBJEoZ/gnctH78t2mN6bk08km7MnArb3TLtV82tOIWeWFkX5vz7ngLuaJy1EuN3x8aL2LVWsv7ZGUkqh4y/H3gjh3bq/Gd9T2Jhl++9OQQYDvHrd91Hxme+CdxbEC7GyLt2ivZ3hRBo3kuSRl+OARvIXJvyqYqQK6UXzrHJDA0LwiQPzw8eeX6+2HAZ5QEtHW/ild3lnsL/pFiv87E3j844QbYjijz65d9Nn8XPW8eKLtXR0CnbkBQPBqJlrUA4AIhNY4H1P3idNG3m6UCl8kuvFRteSBgl8TnHcpM2Tk6Lkh7/bI9RihQ1dPsnHIJAmC6RXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgZ1RhbqbFTNe/zA9B1lxcMYnq9PWIQA/twxlfrAE+A=;
 b=f/Jf8+cxxFyNSm8eMiVz04vPeFyRse9AmmmHfBihM5QW+AzLOiGFUMNcpXUp5IMozur2dEAul1Gf0dMjuLe8w++x5mgHg5k6ZQloK4mvwXzvRJK4rCkQ5fVstS4uzP2TUukDzQtpQiwfQEIxv4IGcluvaypb4xMsxEylPS4snie7yfSBSIv3jY6J5DWp6T2Tb5Fj/knAUSDnk+iKBDuU4PPGfRNFUQFW7W+2WX01Ih9iWilo1n5Ni/g5MbmKesMnHDXgeOmDOensE2sG6jp5WBuQM+/ZokHwFYwTUksHOhOVPjyb3pXgHvjqS0CMrVkObUsrQ5LAT4MOdbs+99ufbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgZ1RhbqbFTNe/zA9B1lxcMYnq9PWIQA/twxlfrAE+A=;
 b=JMMWZlqHb7whlZFVclZ5cuCY2UVHoygLBHdQ3nMyHSrYh7BHziryDa8nbz+RfFR3ALs5nHHqb5TN0U1qDqDHa2+KZYe77mVk8B1lrRghQVeb+b0WFNELi5QbuKnq/KhticcV3YKycnBOmx3rgK4uNjHIl/ns5iVF924RLmVeyaYs1h7/4+n/dEKrvrU8PcHJGzj2hQ7w6pOHCUjzJLTrrrQw8m3oYMhqTFJsqVcAMS3GZ0AkbqDG0M/bnrI26gHReI7Ej/LvIDx94Sig8Q06hqrjag5ZobYl5HkyBJ8llUF0ySTQbdhAxWM+ihlNIdN7EtmjTugEgVX75v+ME4+sxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 02:40:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:40:01 +0000
Message-ID: <f5491c1b-09c5-4111-8e8a-b33786a1eb2f@nvidia.com>
Date: Mon, 21 Sep 2026 19:39:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/33] gpu: nova-core: add the falcon DMA and suspend
 helpers for r000 boot
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-15-jhubbard@nvidia.com>
 <e193be63f31c142580482323c9f6a75e0c73d0fe.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <e193be63f31c142580482323c9f6a75e0c73d0fe.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4a28ec-e91f-4e93-1371-08df1852ccbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	CW5oXF/DxViHt6MBceJx5Ru2VHlIfn23O4Q1HflICyaLBI+Uz/WrFxOgS3DYYJJuV/sMW6pvLaE8GxiN+aDzZIRIY/7R2eyL72mWlyvo+ElgVE7Rd7E19zQVCNJ7rAlLWeC7JEEU80XMSw+TlYQf/1nAgOSOiRfDIyNSvCvC5JhoHjLH2DVT8o43vGTG/1rcEwgiD9y3XhZ+6QUHdhDfL0Tp6J11v8exgYylZT/FpYuHlBim2ywJUPnno3clKTa1DRzb/Xfb7finw/R+gcRhb9Fmw7T/jO+GsX233G/ZkciWHPge+bYSizWVEh4RsV5IlZQb4kmv4i8BtiVoJuVzLoMkhMxDUK/0H6Cod/QQjErGgziYCuG3lqms4fKJdUcKx8Wkz1x1fkbBLpXXaDZwej7mqSR9Z9agQkrEDeHal2xbvaM4Mr/1gF0b48qECl5Kpe8Gy3HFa2el74u4H4Ffakj3H/L/TreYw+A1HBbSEt/uyh+iikd7uM3tORXH2Yk6AKofZJBpoFWo7O2ftQiZGaBwCjZW5+FLH4aupamfMV0xAs82rImXPn1wcyz9jRoeNglV6uyM4aVRuw2pAw+ABzInXe9Qly1vqcuQXS6YtVAz7S4iacc9sEJ1i2jPArNz7vHTIDUiDN/gUQ5bzzlomfvjPc63p34ohMaw3SLfLNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a1A5Vm9qWk8ramNyYnVhcUFOclN6c1NkeWVSUExIa0llcEczMFhSVXZXVTdp?=
 =?utf-8?B?U0g3RHo4Z2srcm1TVDltRkp3UDlzUWIvS0tVNExkckpEWURPTjVBUGxCdEMx?=
 =?utf-8?B?dGFCUXdhRGRiZnlrZHMwT0FQZHpPc2dTUUM3SlFXd0MzSVN2TnFEL2xyQnE3?=
 =?utf-8?B?UjFMVnA1ZHBySVlWNVhvU1pDUytRL3VPOGxPS3ZjckNMam5leHN0aVNjWjNO?=
 =?utf-8?B?cStMdWxac3MvdzVnV2RONUlZbXV3S1dWVWpNN3VxK1JXVEVGTmJCeGJkNno2?=
 =?utf-8?B?MGR2dDFRUEhsN3BQOFhHSzMrRWRNR1BtazlwKzcrdWpkVGk1UU4vSnBDMDZF?=
 =?utf-8?B?aVlUSXQ4VWoxZkltRlB4YWlmZkFlSlNuU2NSaFhKZlRhQkxNdjlTbHdESnJO?=
 =?utf-8?B?MktBR0RxMVpxMGlwYUJ4a2xMNGlldlBqQks0YWhPYkh0V29UYmFaM2swM01Q?=
 =?utf-8?B?TnFTUzlJOHArTUlzOW56QjFBckN6UThiaW4xRWxIT3ZxWitLWWREMkZhaHZv?=
 =?utf-8?B?NlNNWWcwcGlzaWVvb05OMndlbG5sY1o3WWZTaVJzS1RiRmJOd0tCQ3MzZmdl?=
 =?utf-8?B?OTIrWmQyeHVtdU9OYTk0NjA5dVR6dEo1amRmeWY5V0VSNnFIclE4QUpsL1Zy?=
 =?utf-8?B?cFdNMHB1anJ3SGxXeHErNi94TGlORldzby9EczlKUUJVU2JFZEIzWW4vVzZJ?=
 =?utf-8?B?REdZbDJLZHFaaTJhQnBxS08ybHh4dXJVa0xkKzlSSkVmWlRkTmFUUnpwdGRU?=
 =?utf-8?B?WTZMZHU3eE94dUdxNFJaR0luT1F1dThKL3QwTVlvNUtiNmwxbUlHVUJacmN3?=
 =?utf-8?B?T3lGUjhqOEg5VEhsaXVXZUlKQ3lURWxReTJBTEUwVU83bDJpWFluTG1ITC9j?=
 =?utf-8?B?U3Z0Q0pqRytma0RuTnVINXUxRlV0amd5R2llQXVScmpaUHBhdXZrZFNpNzRN?=
 =?utf-8?B?RnZiQUxJeW1pQldvbmNqWDVPUUl4YUhKVjZHV1F4ZDh3SGxJR0E1NnlZQ21V?=
 =?utf-8?B?UVk0S2Zzb2NGbndGTCt1UjI4QjhHSHBSTWpDQjVZTmx2M0RuQ05HR0ZpcXh4?=
 =?utf-8?B?SnVBZnpTUnhMME10NnRldjZuZi9WdENJK0hnNW9iSS9vKysxK0F5ZUc5cUd3?=
 =?utf-8?B?dnJjTUxXSWViVU10SFNnaVVVRlo4ZHZ6Y081cHVlTUl3TUJLNVhrUkxLR0cz?=
 =?utf-8?B?dlIyQWFWSjd5eXo4L3N0K1paY3F6WXBneWFFd0M3ZTcyaEE5NHV0bkl4ZWhZ?=
 =?utf-8?B?blR0Y2c1czZVcXB5RDZsWFdzRkVvdGJnYmRYMFFsMFNLNENVNm1JWUptWEZB?=
 =?utf-8?B?ZzVrQnpKSmlGVzhyMWlnVkFsMWN3Rkg3dnlzQVVpYkRCR2d6bVhlZFN2SUJn?=
 =?utf-8?B?YnJWWDErOURRMytwVnJhT1MyRURxUEdxYmoyM1dXTlhNbGtrL3pUTkxMS0pR?=
 =?utf-8?B?YVBFblJTakJhTFRiaVF2NUNMb0lKS3d4UHdGZkRJY3ZraFp1V20rdVFhUkRZ?=
 =?utf-8?B?aXJqSXhsazlscXZTbzIwT0VBUHBONU13cGVJNldmWHgzVFgzWldwRlQrTzNs?=
 =?utf-8?B?NExMZDBkeE9pZVJ6L0hzWFcvamdvZWVCNmlvNXFxdVhWUFJsZUJkY01OVUc3?=
 =?utf-8?B?ZDVJWUMzVnNvU0RoSnJxWEYvellwTjQ0b1BvbklwVHNVcFFvc1RRdk9zd3VI?=
 =?utf-8?B?OElMRVZPRm5UcEc3empsL0EwUzlCaWlnZGpBMlU1bWhDbG9uK3p1WkRRSXZV?=
 =?utf-8?B?bnlTR2UwZWoxaWRJaS9uMDYyT253ZkhMT0JQZzlmZnBOSEkwYVhBdS8rSGZz?=
 =?utf-8?B?OUkvdjNGSTJ4bDhXSzh6a3ZYeVhpelFCMytkTWc1dGJnU3RXUEVmNUFUaEJj?=
 =?utf-8?B?T0RkbWw0dGZnWVFBNWxUN1pxbXJkS0JHbGo4SzJDM1MwTHVWMEYvd1dQbU8y?=
 =?utf-8?B?VTVvSmRGTXlBaDV4UFhlU1VCUFhxRm5lZDBXNnpIWXZMR0EzWE1RVE5DRUdE?=
 =?utf-8?B?TG1YeG9ZdnhMVUp2Z0R5d0JaTHZXU0JMQjZ6VEFSUXZGVEJ4VHdhS0ZsaXo0?=
 =?utf-8?B?dkJ5OWJ6dHcrcUlWdWtCNkFTU1ZKNEN0Q1BOa0NWNFNhTGpEUkdpSkIyTDFW?=
 =?utf-8?B?U2xiM0xrTzZ0S3RER2xVdWZqSmhja2lGblVOWWI2VXk4UE5VR25uZzJGb0Y2?=
 =?utf-8?B?V2xwaG9wQ2R5bUV0NldpYjA2NjE5ekNScWpSOHJFYzBWMzl6TDlRTjluK25E?=
 =?utf-8?B?S3pGRzFSNjNaOU5OUWplWnRGaHhIR1FNd2JvTG9jMkJURmJkK0NXbEk3ZTc5?=
 =?utf-8?B?VWIwZFJHUjZGc21vdDE4UWdmdkxpSHZQWVlBTEVnN3dtNXF3c3dVQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4a28ec-e91f-4e93-1371-08df1852ccbb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:40:01.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3WKUey+OiFrOR3BVVScD5LE8KETeHKv97QxeywbFB6poBy/GtQdJeNt4ZGflkO/CA+0w+TSHOHX5xHTMCiWfEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

On 9/18/26 3:07 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:07 -0700, John Hubbard wrote:
>>
> 
>> +    pub(crate) fn raw_dma_transfer(
>> +        &self,
>> +        ctx_dma: u32,
>> +        src_addr: u64,
>> +        target_mem: FalconMem,
>> +        src: FalconDmaSrcOffset,
>> +        dst_offset: u32,
>> +        len: u32,
>> +    ) -> Result {
>> +        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
>> +
>> +        if src_addr % u64::from(DMA_LEN) > 0 {
>> +            dev_err!(
>> +                self.dev,
>> +                "raw DMA: source address {:#x} not 256B-aligned\n",
> 
> You use MEM_BLOCK_ALIGNMENT to determine the alignment, but you hard-code "256" in the error
> string.

OK, fixed in v4: the message formats the constant, and the doc comment
cites MEM_BLOCK_ALIGNMENT in place of the number.

thanks,
-- 
John Hubbard

