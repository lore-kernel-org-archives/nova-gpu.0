Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17410317153
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 02:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781059657; cv=fail; b=I8PX9gn99ahgTZ2ZU6TemEbsEaBmcfFTfD7Ck1xvHiq7mcJjWZWY0kNc82xcw5S298kV59OAVsWs+ec5V7uKjwY/sh/o2VESFjXcAD6wfh3CCU7KbUImeUErXZsg2+pRgABBz+31Qghfd4I1bC0D4R/MNI4uNBnfRL6dIS5ftMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781059657; c=relaxed/simple;
	bh=D+JctivFjT3u4Ui5nyRLrTh9Nscr0xaeK70RXeIeCW8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gHNtGwSQ0l8tfLnxAXJtmcRe9eN9wlTvOFiuju9U6BNxIrdKiuQ1sNH+2+jisOiOJaqQDCXBzOVmocZnn0RiZQecX06wVlymRQVRsueWgOk6vdNUGYc6xOuFShNgfGPbR8DgIX7hGrAT4AQXmJ/mXEkE1b1zWdw5YLa505GVaOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MD2kSJwy; arc=fail smtp.client-ip=52.101.61.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MD2kSJwy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTpd4V7e+hJSfr10hImtYM0ULUGXBRN2uzLByxtgcLIgO0WcGyIeXoLj0XVGmExGv3goywL9feKBQcULM8af0ee8xw8tX0Ha7F8jmQ5KA5Ll/e/sMr8PM6Omm6zEhtBdoRjYDXQ7IMhkPFx+gsGdgvw7vmNEVqlHH84nQrun7/SkJX/ALmXdN/ohNWOZEHo7loEM0GkUtJASR+qEDfyl2XJOKtMrFb44sJ5olGQmZjTJxUhiitLqE5eKxPzVb16CzYBUrdTmhnLrCCR7ZHOZYbDIHd2bPg7N4kwtK+IJkzrlXtn7n8y/0DnX5QmhgyTwqg3ksAW/0RdESyMVwiav4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbsd+qnfzDVyJA58KsJkV35u+WDGZhdlhlHNBKq+occ=;
 b=Lgn5z9JTv28wBj3SOyE5fjDA7uaLlf7r78fgT/eAm3Ac3tcYZAhqxCX2ljNoEPnTz6vxn+gDo+0lcev4iA3rd3sGqj26zIUe9SnTeCELdT0GQHB3H8AyIR9grgRd8BsjbEWEWSo0k5W4fLPfZbzjgbV73M93rNhzhxWryPKozWdqidFVnaHY0WlxfBHpcwhU3aG8HYenvx6aaIbBXkHiDFFXcfNVVxHBbDIMcmZFPsj2ok+Qn7uoBl02TQmd35a8mb2fxlSvm5v+t+fiY7HoT8AMOBbHg3xga/j9JJJaQ6eYinMmA4Er9AtUgxqfo5E7ppSbTksKMkIWAq2vKdNXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbsd+qnfzDVyJA58KsJkV35u+WDGZhdlhlHNBKq+occ=;
 b=MD2kSJwyMBGwhYkQyT9SysOVTGPKcfKwPRKtpQNlwcEAB0h+IfvKZQ9lHxu0EBqK2QW/16o/2lkMhBKtKKE47zOEqsYxgPVjGc3GhrUKsG2zo3mv+W0S2XdNBLraP0bCq92o0kXpOHwuq+V03kO/AyTfpWrTDURi6opzzqHxrv0blxt0V8ZXoQ9iTUhNlolTb0h4qbVc6IHR6SA5mrl8RNuazR0bQRJw9PQF3UgG/W/RfQ3Ld68Rjdsiebr878JhdSvXzu/Uujb/5xqmwiMee5aI1IvNLZ9xiQZzcrZxku8RmXSK6qjqP+hyeiD7Eg1oDXmp2rJTDzApG92iCMbFqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PR12MB9576.namprd12.prod.outlook.com (2603:10b6:610:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 02:47:30 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 02:47:29 +0000
Message-ID: <d4070f36-6419-4898-bc8a-ed06b039db0c@nvidia.com>
Date: Tue, 9 Jun 2026 19:47:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: Hopper: use correct sysmem flush
 registers
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260603235034.131354-1-jhubbard@nvidia.com>
 <20260603235034.131354-2-jhubbard@nvidia.com>
 <DJ4KIA6ZQKT7.1EYTZ35IUMVA2@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DJ4KIA6ZQKT7.1EYTZ35IUMVA2@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PR12MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: be07d1b8-50e1-43e7-e856-08dec69a9d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|4143699003|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	f9Sf0iq7FLxtMxRbNNwRb6+fQqe2QGP/ffdXBBEUm6/iMYjm0fLxqxCyfhmgxPLVswOFh5e7Sk/hVuEaKTwQVaCZLmYLOUUhvz2OHvdjFRU06wRJnDacSCOEuFVl4qhM+2Vh2Hrsff2bBmy/TqdZy2BadSfY1We5Khvb8NAByBxfiMdYnQaxEtP3gd9/jwCvm9ZmZMXh9yaAGs1l5LlSGZTkgfat2En0oo/7xBTMzCx4k5NL1Xl0NVxIDsSFwvwy+rvnKzs2IgEMsyG+cTDDPDd6cX/IznKAcOSc4kkF0eV4aUNDB5Icpfurm1ELJ7Tni5Hx8dIm4Oe8qnn+/1LdiafN4g5+AUJuG/wwxsicC6zFn7i0ooQRZ1a0C3Tqe61WWNtPkaFTIQCiPdixqd72/50o6S4kUBqw96/y0iP+RcD9qJQVNoOM3WKPlC6JwhZkEImHaQKNwg75R3OZEvFdHOxVldiZctdjf5QugLyVKM+8JxkGCKlyeM+QGnb5msfuNSAsO0y4DED8kLzQZ4+DE39dH4uNVoXZf9Xrqp2CVE77kMpENaf4WIoU7GXY0g9m++rA+zFqtyUFXkTi53krk6imLdSyTHZLKgCTQ4oy5HLxzxzHi0W9q613qQj3Z94mI97iQEx/UtZlPJkKHVyROANydQzDnArBjg3hK/+GV1C+wvNhBCOGmtM2tE6PuYAl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(4143699003)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGdXSlczL1EwYzVvbGhVeVR6dVcvODZaUkYzdkx3Q3ZOM1BvRHJsckgwQ2Rx?=
 =?utf-8?B?dUhJcGRHYUthT2VDUFlXa1NteVRvNlU1UHpiWlJTemtyMGR6OEZhaE01UGJp?=
 =?utf-8?B?S0FrL0I5bGVLaHRVdXdRNkJrZXVIdEpWRWk5QXZoK0NUL3Vxblh4bWhteVdx?=
 =?utf-8?B?L2tUSXdUTGFtR09SUGs3Z3pjODVLcHMwd2NQdVVRTjV6L3lSMGJadGYrR3U3?=
 =?utf-8?B?QVFmZVBmeEU5SWwxbVdsbkFQSVYzVXV4dTBtL0t1ZzVHZVZJeHpTZHQraG9w?=
 =?utf-8?B?UHRsUXpoQS9xRUtESWI5MjN4NVNNS3JOMHY4QmVWZ2JUL0xseUtZeUxhb2FY?=
 =?utf-8?B?a05lVWZpOVNIcUY5N0lPOE00ZDhFYS9acEZTYUFLamIxNVN5WmFuMlF0Tm1E?=
 =?utf-8?B?OW5BZUxLdnRKYlpxTFhIYVlPOXZzWWhrL0JmekoyUmJja1lMd0NxbThjQWFw?=
 =?utf-8?B?OWw2VUtKTVNtbmFSL1VhZWlRUTRRemt6ZDZOZCtpNlRaTmFjVHB6RXQ3QVVC?=
 =?utf-8?B?dC9pejZrSWllVy84TlJUTG9WWGloUzQwSHNaNGVhNElMdzY1dkFLeEhiNTVt?=
 =?utf-8?B?WDN1YWFDUHV0ZXhUeE93NERUY1M1ZGQ3dkw4ZldtcUR1Y1J6QXRSS2lLVmJ4?=
 =?utf-8?B?YXIrVWQzVFZ3ZC80eGU5akFWbVlSMkhnZlQwcGs1SWhsYVI3N3dHc1RnYThn?=
 =?utf-8?B?ZW5hMkQzU3FpeHZVR2czVEs0NzgxdVhMaDhtYWRPMCtwZVRPazNlZ08wTkFU?=
 =?utf-8?B?UE8rSGhpTmJuNnNhZjNFbGxpVm95THpZL3RBR2k3WCtDNnZQMTcxN0dqeXBk?=
 =?utf-8?B?YjlRRHhmSDZBOVJtYTMyZWd1NzFtVHpWSGExMlBHemZlL0Y5K0NiZGxCeW1z?=
 =?utf-8?B?YkkramVubGlrb1Bvcm1qaS9zWjVNdExuWXVNWGltSDlLSjFjcm9sTlR2OWpK?=
 =?utf-8?B?TlVkMkZUTk5WNnlvaUZQRVlGWnU5ZG5XcUlPWlhBVEoxVTVaSVJVSlJ3RGJ1?=
 =?utf-8?B?MUJzRGhTVjhLbVFPbVZTeHVxOEViMlBkUnBWRkZtZThxbHM0d0V1YU4yMHdq?=
 =?utf-8?B?cVd2bTJXZ1FRdGRRRnRXRVB0WFZHU25BdHc3UEJkNHYzdytISkp5eGdiWDU5?=
 =?utf-8?B?NmFVWDRZZDEyQnlYaVZiWHlYRDRjQ3dJUEhmdEJZY2dDWUZVN1pmWVk4T3NV?=
 =?utf-8?B?cTRmVXpaNmhFVUJMNldmMTRtWS9teGExNkxTNXpJQ0FNK0o0N2hMaTd0VmRj?=
 =?utf-8?B?M1ozRVkzSitqQTVxT1RGbm43OEp5SkFEN1FveVdOQm9zNlFOLzVkZTV1R3FQ?=
 =?utf-8?B?TElSMHZ3Q2pNSHcrSXEvaDN4UTNoeWtZYXkrUTNsWWxMeUpWLzZEYjdsQUl2?=
 =?utf-8?B?N05heStYZUNPK05LeUZkWllOeWp3RS9RT0Q5bTdld1R3VnhmWnArZzNGTy9x?=
 =?utf-8?B?NVoyZU5OTnNIZmtKaXhjNUZScE9zeS8vQlUzMDRBVFRmb1hKUlFrYndjV2tu?=
 =?utf-8?B?RjU5a2hFQTdzWkpsUCtzbGVSR2FOdFlCeW1tbHJNSHc4TXBMMWtaOFAzdEpr?=
 =?utf-8?B?aW8vbXl1dGFVUHluWnRycE1UaEt5dTUwSDN5Q21qbzZKRTkya0dzK28zMmZB?=
 =?utf-8?B?c24zdHExSnRWcmxZUFBnUEphK3Y0RlFVbGhkRkdySHRrZXRWQmlhbDloOVlm?=
 =?utf-8?B?MldtMjIwbEpkdHQ0M0w4cFZDWndOTXdLUUVuS0I0dW5qRWVYcERBT1kxalFL?=
 =?utf-8?B?M3lPRkFjTkEyTHRuekFGSDRJdWpnamtlcE9BeGkyTWU2ejl6V0N5YW0zYlhh?=
 =?utf-8?B?Q1h1VzExNWRwWHVXUlh6TGhoeitmQlY5MUd0MlJpWFRWMFpKbUhUQk5CaVMr?=
 =?utf-8?B?VFRTQ1ZBRmo5MzVsSUZ0SURBVy9OSmhJWWZmWGdPMUVwV1JLNmJ4dWJHTjNM?=
 =?utf-8?B?VllFcEg3VElPQWQ0VERic0pDZG1LT2ZRSEJnOGJRcHdJUWlwaXRqbjMrK1lw?=
 =?utf-8?B?c2YzaW9XL1FTbmhINllDVDd3NFZYaVlaK2tCRlE1OXJ1MnBOcW9HU1d0aHoz?=
 =?utf-8?B?SEJ6WU91d0I5dUJLNklvcFhuQURQUXdWOUpXNVpEeS9FYWdVOXh2SnN5cTd0?=
 =?utf-8?B?bFFtZzVTbTQwRlNqdUpDZ1EwTkRTblV3Y1oyMTJXeUkzKzVZNmRPbFIzOGtO?=
 =?utf-8?B?dFpaemR0NnNGYW1zemNDalhxRlgvSmRlbk1wNDRQY09MaVYwVjVYbFRXVTEx?=
 =?utf-8?B?S1d0VGhxeTBERkpGdHR4cnRwVFVkeTFVblBJbjVtUGtuUWFpVHpDblZNTmlH?=
 =?utf-8?B?L3BCRFM5d0ZWVjZpMjFYZTI1aHd2eXFBOGNHbDdGYmtuZVVVaE94UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be07d1b8-50e1-43e7-e856-08dec69a9d16
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 02:47:29.7998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxSW/a8XNWrZCG1iysjodKhTlsN4OX310KB+P8tbsT15rTb8kCgZ5m3MDjGTaSojbE4drxur7ROrjUHllIOgVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9576

On 6/9/26 6:54 AM, Alexandre Courbot wrote:
> On Thu Jun 4, 2026 at 8:50 AM JST, John Hubbard wrote:
> <...>
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 0f49c1ab83ad..a57e95140ec0 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -131,6 +131,22 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>>          23:0    adr_63_40;
>>      }
>>  
>> +    /// Low bits of the physical system memory address used by the GPU to perform sysmembar
>> +    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
>> +    ///
>> +    /// Unlike the Ampere `NV_PFB_NISO_FLUSH_SYSMEM_ADDR` registers, which encode the address with
>> +    /// an 8-bit right-shift, the Hopper FBHUB registers take the raw address split into lower and
>> +    /// upper halves. Hardware ignores bits 7:0 of the LO register.
>> +    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ 0x00100a34 {
>> +        31:0    adr => u32;
>> +    }
>> +
>> +    /// High bits of the physical system memory address used by the GPU to perform sysmembar
>> +    /// operations on Hopper (see [`crate::fb::SysmemFlush`]).
>> +    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ 0x00100a38 {
>> +        19:0    adr;
>> +    }
>> +
>>      pub(crate) NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE(u32) @ 0x00100ce0 {
>>          30:30   ecc_mode_enabled => bool;
>>          9:4     lower_mag;
>> @@ -179,15 +195,16 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
>>          19:0    adr;
>>      }
>>  
>> -    // GB20x sysmem flush registers, relative to the FBHUB0 base. Unlike the older
>> -    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers which encode the address with an 8-bit
>> -    // right-shift, these take the raw address split into lower and upper halves. Hardware
>> +    // GB20x sysmem flush registers, relative to the FBHUB0 base. Like the Hopper
>> +    // NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR registers, and unlike the older
>> +    // NV_PFB_NISO_FLUSH_SYSMEM_ADDR registers (which encode the address with an 8-bit
>> +    // right-shift), these take the raw address split into lower and upper halves. Hardware
>>      // ignores bits 7:0 of the LO register.
>> -    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO(u32) @ Fbhub0Base + 0x00001d58 {
>>          31:0    adr => u32;
>>      }
>>  
>> -    pub(crate) NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
>> +    pub(crate) NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI(u32) @ Fbhub0Base + 0x00001d5c {
> 
> Since we are switching the name to `FBHUB0`, wouldn't it make sense to
> make this an absolute register as well? Because now this reads like a
> FBHUB0 register using Fbhub0 as its base, which is redundant.
> 
> I know I am the one who suggested making it relative, but after looking
> at OpenRM again it doesn't really seem to make sense - there is really
> only one base here, and the register is defined as an absolute one
> anyway. So my bad for suggesting this in the first place.
> 
> If we do this, maybe split into two patches:
> 
> - Rename `NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI` into
>   `NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI` and make it absolute to
>   align with OpenRM,
> - Introduce Hopper's `NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI` and use it.
> 
> This keeps the changes local and simple, as renaming makes things harder
> to track.

Ok yes, I'll post a v2 with the above approach.

> 
> As a side-note (not for this patch), we may want to move registers move
> aggressively into sub-modules. The Hopper register seems to be only used
> on Hopper, so it would make sense to me to move it into a `gh100`
> submodule when we eventually move these definitions under `fb/regs.rs`
> as is the plan.

Ack, some register organization is definitely called for, and that's
a solid first step.

> 
> Or maybe we can have an even more aggressive policy (which iirc has
> already been mentioned on another patchset) of defining the registers
> directly into the HALs themselves. Subsystems like `fb` only ever access
> their registers in the HALs, so for them at least that could make a lot
> of sense.

Perhaps, let's see.

thanks,
-- 
John Hubbard

