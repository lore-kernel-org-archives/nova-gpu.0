Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209A835CB6F
	for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735997; cv=fail; b=Y0f+veDHy2Bttwaf2uXnEWNSteaIJF+8Jr1JP+4Ke8wVweE4abCe0I3GU6buFDfskuJ+xCiSS8Q7yzMuS6lCmHEm5gcOeL5KEG0r3/4eyQAV8oTkXqy3H0TkPWANjh7efOYigUo1N+HJWV//P3rqRFsE06kTai76PRmTa7uPHRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735997; c=relaxed/simple;
	bh=mf9zNKrOHwd7UdSXy8YtyYBxJVFMOkmhcSJ/X7gjYjs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SelpvIY5ei8YRk0AyE0lu1WXqRq0sL9+pK6hPrms6vTvGqAW96gs+2EVYyHRoKwr/Qyunju5pYSz3gy1CLTc5uklB5fwgtO4/UYAOol6vN0wgpkQTqK2oY39GN0zOSw0a1xlb4DYwLRmtU+tD0H6bGUjoq/bos4rdGLDx80/YGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Jr4pYM1V; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jr4pYM1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuXt2HLIs6rSDZ6u1bPpwYgN9lwYu4aSJlHSnhooeAr86NlNsYnlHGZImev5G9By6JVOPSSwJy0SW33KBcvK+cSedojkZcshYGn3L1b+GAWr/R75xauM8a5HNu/7mPltRxQcBgUdVDKqxHoicMyU9S3eC5BfNpfnk7WsXglEqWC+3CkuHiFt31hTrZMctXrQ9+TwU5wCB9F4qIw3f/PnSp4jYBtb26nsmdX6/FwcOK4aGGynfXFf3HvRcHmjw//hxuLgYERpsYJbUneII2sfNyQkV4j7ZGzpieQQlgfpEm9AjlX7KHJUftVn6vITxwcIoANJi+sGhuHYE/LCvkZ4Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOjST84yv7ol+EUarpmiwm+Vj97r+lA2XIU9kcpe/IQ=;
 b=gpZW+c0JqAUccHKr7P/14YJnnTIL+ASepdFYNGlfGfwrHgjWnnQoRfuRDwbTQdPWYVoBJ+YjQWO45cQlPGWu20X13tVFaQFrRPmwzQoWhrvUg/ZhY7TlOHdyarnTCvhqFn3GQ9FYOcRMcJUJM60vfYLQb5QeXHjXiExgmjwmoV/VTL6M7Rl+EdePsYlKoUW95Q8sYQviwbWijEeMaFFwRez5Q5vouPTXEnhsckSLGKaAgOf7S/KwaBWYzC49YYvpK0tv+klP05PaKTGAIHTRSYS9FHPvRnnrEH/CmCC9LAXqmFLxi2fsumT68/NyM9Nt665ODg/BFSs5lL2VcxhJcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOjST84yv7ol+EUarpmiwm+Vj97r+lA2XIU9kcpe/IQ=;
 b=Jr4pYM1VaHZype2m7roXVVjx4ZabZuKwl593ofEmABmU+qXF1fadyOrZJx4NKpr5vV2OfbrMOzsAS1KqUttA9pm9UwX9fdAigBJ6ZF90QVr7RjyjmQX32Y+GU0r8TZ10g/JpE/oYnClQxI4HcwOFVq7ETcCravkWD8Jqx5mJMg6Yrh20F59DQpZAkhDQxk24uCXvmo0wamcNPddbjXck4auTVP+k/p1vJNMQhAB1g6bV81ivWh94Ra2HZDCtM0welXtXN1BFqa8ZMb3KUPpqYbqwhLA6dGVTWtuo3v8xFF0+r7AVIAKaUaFq+nu72gvrdIGDWIh5rYVzCskaaKEMvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 19:33:09 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 19:33:09 +0000
Message-ID: <876803ef-c288-47d5-8281-2a817b77a106@nvidia.com>
Date: Fri, 14 Aug 2026 12:33:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] gpu: nova-core: allocate PCI MSI vector during
 probe
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joel@joelfernandes.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Will Pierce <wpierce@nvidia.com>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-5-jhubbard@nvidia.com>
 <DKONOORZMS6U.3T4EB1Y2JYBU5@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DKONOORZMS6U.3T4EB1Y2JYBU5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::15) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: beeb4a0e-1a6e-40af-30b0-08defa3adee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j42ggET3vS+uqyUmbwdBcH8z1yF9ivyCs/U8YejPgysnE3IQtmNbpKiVvaF99pvvysJEavNF5clYk49MW/m+42pWK/h4SehTzKCXfmeMfBVaIeCu6aurfR4hgtl7UzAhKxYLu9tEyqSHQdWdFmovYmajCYmkmOJwB/15U03Jkt55kyKthDwjArMK19c7YMdqqASQhoAx5ll31qBcUbU/VOffEMNlEMWoaHnF5fA9IlMhYv3MDWpv3nllB89dBuSXGqPWEXTnoDZirb0n2cBkaNlmMF34bwu/iRzmzIZXsJf7OwXRlsN7zYJQwQctKfbTEGZHO80HeYmMpi+9qR+7S2+g0u93YJTRpG6Ro26QCOfGOyOKgzHObCTqMYujKPpalwLYcUwAMb/zvqhebJ83Zh5MdhzX7kLc4FgEIsa5n1aBe45BhIKOuEkajJEE1B0n9z6BVW2zRcXuVmlx++wURknIl9EKvxT92UAhmIiPDiamKIS4B3lgAookkrDBezZXRLX3ZS0FZqyGKqE/Lll3kerfKXTc3Ocm686flD2dwVDyvmt7iIHZR+R/zBGGld1CYogbpqgUtXv7X2faRLsmn6R19ydd1zBt32mGGTLfm6qACKD7lY5vEHd/vEjX8kV0FY49Qc8INC0ewBGjfg9A+gPXiR3HPzgOor49Y9Lo9qw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG5KZDdvYWlZeGluOGwxTWhWdm9yTGgvYjNoWnJXWWxhUk9zMGhpWlUrNmQ4?=
 =?utf-8?B?dUFIbEpKN25jeXhvUzlydVh0M1BwYXF0VmN2Z0hWa2JDNHJ0c2ZZcG5pcXpT?=
 =?utf-8?B?cFJ0ZUc2OTdjbTN4U1lLSTNVUTJjK1lUdm9ZK3JlY2pFUEx1SWpxeTRiRDNm?=
 =?utf-8?B?SnBuMjQ2Zml0Mml2UUdrZ3MyektES0E1OHRJQm5YWG9GUE90NU9LQnVSM3R0?=
 =?utf-8?B?UWhkdFlWWWxUTTd3b3Y5Q0V3aisva2hGMU42SkdadXdtdzZwUmFtK2pJOFBI?=
 =?utf-8?B?Y2cvdDJla1BWbGxva0dLbFZBT0JsSTNkL3c5UE9tL0thblc0dExlRmNoYUo3?=
 =?utf-8?B?ODlucDlRdFFCVXlJdmtRdGZTNkZZcWJ2dXpNa2JhVmI4eFR3T1RoNUV2dGZs?=
 =?utf-8?B?ZHAwRkt4SGhlTGg2WktSTHJyU3NUczR1S3FwK2FDVkx2dVhCbzNDanhlSVVS?=
 =?utf-8?B?THBheFNxMFlYODZyN1dGZVBWVzhhYnpvTWR5OS9mZXRCVHdEeWFKb3NVQTdG?=
 =?utf-8?B?VzVLYVZPNTVMSTUxa1hxdmY4TlBUcmtTSHI0R0llVEhwc0lHckVkejF4R0sr?=
 =?utf-8?B?R25jL3JNY2hZbEtEZ1VTTjE0TXdadmY4YW8vR0d3KzhZNlV2K1pManBvYWNG?=
 =?utf-8?B?VEFWeXN1a2ZtL29LWmhhbkhVTHRlZTRqWk5WeC9LUWlCQXFFYnR6dmRHNGly?=
 =?utf-8?B?NVI0UkZzamJBbzdZdVNSK3Bzb1BJbUluWWk2VUY0VjNjWjZrZUtyU0JmejRj?=
 =?utf-8?B?S0V6VEV4dUd5Rm5lbjExL0pHY3hmamkzZWp2d2ZMREkwS0o2VHIvZ092WkZk?=
 =?utf-8?B?dzMyaEVBRkpEdUNkOE5vM3JYRktHdUlDNGl2M2RINFRYdUNRbVA5ZXNORmRF?=
 =?utf-8?B?RWc3eVQyWGRTZXk0RGhTb0N3Y201b0tETWthenJ3a21PRWh5NE9vbDc1ZnND?=
 =?utf-8?B?UzEwUVdKdkJqSnVCdVJ4UWRMd0hiaWlyZ05TTmxMQ0hlbE5IbVpxUk53TGUw?=
 =?utf-8?B?VG1NSmdReGdpY2xIYUwxejhDaUdGUFZVUnhRTzdMSVFWUDVJeEdRTURhRnhJ?=
 =?utf-8?B?UjJ0TVFxd2d6bFlCSmYxcjkxUlA2aU9OYkhseVJrNGQyNWVwNnp3MlFjN1Zx?=
 =?utf-8?B?R2l1OEhnb0N1VjhJMXpSYUdaM25Ib1dpMmJnZlBtOVVBUHlIb3B4aCtjMHJ2?=
 =?utf-8?B?NnNsTFM3c294aUV2akhyTHBucEpZV0F1R0FPcFg0K1VGcUNTRGFEcUFibWYw?=
 =?utf-8?B?cVc2VG1LNmtNQThEOW5DNjdNdGo0NmlSbnBleVdERkNmK1ZlcmVlUVZwOEtU?=
 =?utf-8?B?NG9qRnBjRkNMbDhhdkdiaWNIelZST1YxVEVab3FXN1RIMUZ2QnFPa3VxZ2JQ?=
 =?utf-8?B?VzM5N2ZSZUJVOWpWYTZ5d1Z4amFuSENZZmQzMGZrWmNDVzIrdUsybUJFZFVo?=
 =?utf-8?B?TWF2eDlDa1ZsRVk3NFZJK1laMC9vbHpXNkZhaVRkZUM1cDlyQmt5M0M1Nzho?=
 =?utf-8?B?U1N4dytQWDRhWUhRSC9ROG5sck9UOXRVbDRTMWpyQWZEbklHZTBaM0lJOURI?=
 =?utf-8?B?ODA3RjdMOGt6ZG1HMG5rQVFRTHlKd0g2djM1clVaZ2pkS1Q3NHJzMWc3ak9G?=
 =?utf-8?B?dkl4eDdQN2F4Vmw2QU0veWtUcGN4dUZmNEVRaUhnZnlvdXBvWU1qeFhOU0dK?=
 =?utf-8?B?UnEvVEwwM1hUbm9Pam4yTU4xckdhVm10Lzg2WGx3aHpHRDh1aVV2UHAzMGd6?=
 =?utf-8?B?YlIyMGo0MkZ3RnBxMWNEL29sMG94Tm85WklySGE1eVQrRy9jeEE5U3p3Tnl2?=
 =?utf-8?B?OFVVOGt2VHZMdFZOaVQrK1FPeXFCSjBkSDNSMGZsQmQ5V0lGemRVOE9HZWsz?=
 =?utf-8?B?VkMybnF4RUtzSnAvNFc0Q3lMY24vVnFTczArK2Y0OWQ4YVVnM1FCMWRZRGV0?=
 =?utf-8?B?YnVYbWR6ZDZzS3U0a2RjcWV2M1pOTEt2d1AvcTJOSm9NYk9MY2JKQ0N0MHpV?=
 =?utf-8?B?eisyV21rZGRYckxiUEp4b3M3Mms3T3JnNUZYR2hiSXRnQTZqeDVEc01UQlJy?=
 =?utf-8?B?YzB4TFA0QWdVT285a1RRR2ZiV1phL2JqbHpFTlZrRFk3OE8xbHRnWkhpSFcv?=
 =?utf-8?B?VjR6VHVsZklKeWU5VjZiRHI2VURIZG53dHA4RHdjT2NWeE85NWFVZnhJQ0VS?=
 =?utf-8?B?T3V3Ulp1ODdNTTBpSkdLQm5LaGR6b2VseHhCd2RKQnBiSWF2NlNTQzNTZDRo?=
 =?utf-8?B?am1ROUN0QjZLcFJGVWxybnhqSy8vYkhXSU9UdmdSRHprcVo0UGJZYjJiNjFX?=
 =?utf-8?B?WERFaThZSDN6endCUWNqTDZ3azZZU21ZUmNhRWlwQitJYXZyTWloQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beeb4a0e-1a6e-40af-30b0-08defa3adee4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 19:33:09.0301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TAe5TDJVOCyKOGq0wIzognFlrPy13R1D3sky8kHNfiLuAZs9MfDS6xGJmpoMty5fVQZQWGDC0rw02ughftOV2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

On 8/14/26 5:12 AM, Danilo Krummrich wrote:
> On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>
>> Allocate a single PCI MSI interrupt vector in the probe path.
>>
>> Try MSI/MSI-X first. If that fails (possible in broken VFIO setups),
>> fall back to INTx with a dev_warn so the issue is visible in dmesg.
>> The allocation is devres-managed and automatically freed on unbind.
>>
>> Reviewed-by: Will Pierce <wpierce@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> 
> I think this patch can just be dropped, the corresponding code is removed in
> patch 8 and AFAICS doesn't really serve a purpose in between.

OK, will do.

thanks,
-- 
John Hubbard

