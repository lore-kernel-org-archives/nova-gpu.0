Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010033.outbound.protection.outlook.com [52.101.193.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB17539FCCC
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 02:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044932; cv=fail; b=Kp2crYzF4xaze+A1cnq+SWJttPRHKEFYUpOsxqrUhvtGlVhA0WJKd6LHG56aPBvUsRrrKP5Z7g+9Amtu48RnZC9yGszOW3mIH8khSDme2EgsJWTfFi0Ljc0pny/FnEOTljIJ25BHlyzU5w2+DFiZV8X0tx8fakr9WNKXzuLzD+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044932; c=relaxed/simple;
	bh=KQR9klQqQkPyZVMy+243X2mKefznGxZomYLdiQ0xD3Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=htawUazEGtKpyHvDEtGxJIuN/UG1PpBcGRbQ9+np8mx4W4tizq15Eiq0p/Vcb34SuiHDRwre8thrKWHemxBOxrvvaJTv5L8RAIiHDWv24kRIszkfP2JkhGLCRfFbl33rt6z8E3iTPAkPYl+6n1X+bCkbbwQMdjpnuiOOOpRVy6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LMgs/D73; arc=fail smtp.client-ip=52.101.193.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LMgs/D73"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbL2WY9uT52jYCz2zZmtQQKy/pAmiuUmOQAxWxe87QCaUmko/q0X6JB7mscdR8mIGVfqhHAwkF8qlL/1uNThyNBq2tzBEFhmVZRKTMu3rQYXxoNhl2KcE+0n61s1ySNf47m7mvjzhXOnHbFywI/8+xZs8mXi3IDMYL196EYCUlTgnrQlCSPdo/wjo2MgwfN4pT+Gwq3WME3xiCuHGOeD+YWXzTZXTRgpxuKaC2GsXc0Kb0hi0Vggw6KNdeYjXzhczZWD3BGQ3JIA7NL2xfo5DGPK0JGhk/trXoC7JjV3E19aYOg3arRp0m0ieLDeXHBJ65hZqUmtcaHW+Z4X7Ih8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK7TzGNWQhU958t9+7+lPagBe3OC/rI7oHHyxTn3RII=;
 b=Y2gltI5mRY5hHhUCo9vm/iok8k4JTyV9i34elA74qyG4NR05KiKiZWo6/qccb9RjavoAp/sc0bGjOJG2qhqoIvPLLS+NLAnmkaIPheyRPKPUV+R4xmJjUjjuARN7bPgMORGi8bDV/WEUDKL3lQfJi6xkvTR1Zbl3QxE2aczoCZq4BJ+fZYRn7ZtI5Pqa9BcJ9u+4no/yzUq6U6VfeD6JC9JGmloglS56F7/SILztfUD+5i9lH7RcyP0tPuN9brH0Q52YaSe/Uxiz2/e6Iet9quq+we0pGbuerc6zT+qGsfIGARAEhavdgs7pw708Bwh8ic3S0XV7ksrJsRJdQAPUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YK7TzGNWQhU958t9+7+lPagBe3OC/rI7oHHyxTn3RII=;
 b=LMgs/D7379DrvUJdZIVU1MVqY47kT7ThH754bydeh0ix2wiDV1IC1Z14t1do5CMhq4zXSiqX1qPZbJamigx7g3lI8nwSYRrhjY5CIPNBXxYp9m6whXR/i8Uj8S/RnkRwC5bFmuvgaVcLQYTY9UeaSB+rI7B2xpjWoyeYxcG8NHzGKXS4IyP5ZPnUeGIyFCnA/XCCBHNn5Pwajd2RMIQ+jz2AK0BfdZAyx3s16gw3Wl9CFyPzN5ZbcwbbjkHrtLiHwNNW4qK61GyB3ag/r0LqNs6nfibZw+QG9Z7knPfjLXLWyK26xhXcc/ztRPMzcxJFpSBupiB04+hZwfhrxa4/wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB9550.namprd12.prod.outlook.com (2603:10b6:8:24e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 02:42:06 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 02:42:06 +0000
Message-ID: <269ead56-e6b7-4daa-ab5c-3334c72e34c7@nvidia.com>
Date: Mon, 21 Sep 2026 19:42:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 21/33] gpu: nova-core: gsp: add the GSP_INIT request
 builder
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
 <20260918010719.1176945-22-jhubbard@nvidia.com>
 <1daf717aa7e597829c47691fd17a7a2d28f99780.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <1daf717aa7e597829c47691fd17a7a2d28f99780.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::10) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB9550:EE_
X-MS-Office365-Filtering-Correlation-Id: 87dd2a3b-1530-4beb-2f5f-08df18531732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DwCoxJWdANwwXl5XAaltQ7aS4XoGTJI1JwCwATxuKVl/oJ5MPNToy3ZSa1QpoDy9CrKi/sHdMzRo2ukV/aeV+/4/owJA40dihT7v/9mwFlmiD3Dzd0g0oLmQ5SBQtz++5APkXsRPL7tIApTVOvvLbmnWfI7MSzX5zijNEMKmtyl/TLYecJdEWwfK+vJLrR9QmD3RxxtitKNQuXT9D5jk5NISMSlRUanY14v8Q3Qm4agPonrbX6qH+vF6I6VWBficggCfC/B237gAvzxWAVqoPuD0VwINgf+XZ8lHuY+159q7CRwuds8yFmiJDdIWOsHEKpRLuzW9EGNj9n3pF42bZMXHST+QqhKb2lPwUjLSqixoqLUab/5HFzcQ2CM0Mmu7Jl0FFBtuanE+nE1JQ6LGjnEL6MSgylTcVdob9bA7wkJr/tE13SMzhW+KhUB2ARqB43kTw9SoOHVpO3M3DYPIWE+wx6vQrtqsT5i9+laBPl0CeZ3piu5siVbserQ7RNCUEkt8DcWwsaQxb6a4UlwOllfm6L/vhCgiAiDQObY7Vkm7sSJEo1ThCmS7IJMGVw2KJ/7xIKxQmkVreNjpFoyTrPWFMhOQvELG/HCgWwW5kZ87rnanJytnznzx6J32sStrw3xuGdSSrn0LxIN46YoWS4u3R7tcH+AJX8vbxiiEQjQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkZjYjBoVlBNdWMvQ0tkakdzSVNpMHo4M09zK1FhdkVZZzdJd2lBN0pON2xT?=
 =?utf-8?B?QjVUQVIxU1ZHZC8vZURJMzB4aEVoZitIMkJwZjRkSVZwL2FRelhVa0dSWFVm?=
 =?utf-8?B?d0tvYVQ3ajZCVGw0OFplV2VKODR2bmx1NWRSNjZacC9ZNVhJZnI1ajV0OFBh?=
 =?utf-8?B?cGtTU2lSdE12MnIxZlk1ZU5rSEEzNnJ4K0VXNHFJKzdITmhpM3lURFZzaVJr?=
 =?utf-8?B?WW1TWkNMb213WUdwOHROdjN1SEk4VUE0WmZjdkY0NlljN3RwNjZMcXRCYVZo?=
 =?utf-8?B?YXR4SXhnaTV5MnJqVzZWZ3BIclEwQS9UUGJsMFFiN1ZGbmJSaDlYUEFZa3Vp?=
 =?utf-8?B?UDlaU1ArVERzaWNSTlFQSnF5MERkRlpBTjNLaUNEVTFxcnhGY3FhUWZ5aG5h?=
 =?utf-8?B?TFp2YlNYR3J4T0tpNndMOWJLSUhOYWhBZXp2bU5KOVI3ZDAwUG0wSkpqd3Nh?=
 =?utf-8?B?dktLa3M5SWNIckxPZVlWVHRKSmpySnZoZzBNNEc5UVgzeFVZQXNEWlJJR3ZL?=
 =?utf-8?B?T2JEcWp3R2FZUngzUWVBcHpTSWtrci9PYWM1OE1kaEZGZVZ3Zkc1bUVmUlE1?=
 =?utf-8?B?VlRWaGVHZGllZVJ3cHJ1a1E1dFhmRWNoSk84U0FReThISEZ6eGV5UVUybWkz?=
 =?utf-8?B?bkFBbVR6R2N0dUcxako1KzRwam1CSzhpVVlJZ24xZU1lK1puYS92ZVRVbmFT?=
 =?utf-8?B?K2hIVFF2QXIzdGVEWVpPWm5mblF0eUxNZ2E4cTVncm50T2RzV3p2aGpzWXFN?=
 =?utf-8?B?cG9SSGVsOFVFd3JHUU84R0NEZ2dYZzlWSW5haFRwN3puZlZyVjh1Z2R4bWMw?=
 =?utf-8?B?WGUzR25WdWliUGNFeFFhVjNNS29pcUNySk1MbVltVWRoOUhtZi96L3Frbjc5?=
 =?utf-8?B?WTZqcmFkQklubkJ3eFZZMko1ME9heE9vV3V2L1pQVmt5d3hFRmxrb1ZJWXI2?=
 =?utf-8?B?UzZPUVRnbzN5R0JFdGN1Ulg1d2hnWE1jczVhcXRhNEJlYUYyYzk5THp3dkpV?=
 =?utf-8?B?VDJXNnZSdGM0QWNFYWFJZlpZanF1VGNaVGV0aUNBUHhJYUJVRFpvUzl6WW83?=
 =?utf-8?B?aWxiOVUyWTFsSERVcm85N2N0TnB0N2ZoM1RNdkRQR0JUWkFtV3VZcW11L1dI?=
 =?utf-8?B?cTJGKzFVTGZKM1pSZnQxcEJZSzZwcVhVMklmbXNRTkFZcTZpNFcvK2F3UThY?=
 =?utf-8?B?bjFNaFQ4cmNmWk9jMjlicmt1UHJWd1R1R1JkV1IxcDBHVTdmdWttQlFQT2tt?=
 =?utf-8?B?UlhiV3RPaWlldmxjc3VHYS9laVd3bGdTYitZV05ubkRvNEQyNDExdjl4cndn?=
 =?utf-8?B?QWhqSnkvdWxPanFIaXpVN2xFRXZSQy9SaGI3amRRcXM3RHFlek92akEvamQ4?=
 =?utf-8?B?b2FZNm13RTZkQU11Y0NMNGhrcVZERktpYzFoNUJGZTNiSVk1RzBQdno0K0hB?=
 =?utf-8?B?bWZXdHQ5RWhyU1ZRUTJ4UmJCUnFsY1JkbFVVUi92WVoyUlNyQVFvREczRWM5?=
 =?utf-8?B?aUhEQ1JXQ2FxQlB0MnZaVHBMeVRWbzJ0Tm1BMGZBbWFld3daK1poanJRY2h2?=
 =?utf-8?B?NGJzRFJ1MHQ3NExBZTRHL0NZRngwcy91K1h4aWhTb01OdTNYSlM4MnNyVmV1?=
 =?utf-8?B?azB2UVNudUxqcHhxbWdNeEx1Ry9DY1ZBbjFGa0Q1L2tZMkkzcFZpbDMxTjVE?=
 =?utf-8?B?MWtEUE13bFpPSnp5bHRqTGlBd0x0dEh2YlgyUkYxTzRFbUtLKzFQRFB1MEtP?=
 =?utf-8?B?RlJzQ24xU1FEaUQ4cTBiYVRla2ExRWRpcWlYNTlSRUNOcGF1TGRyYlNGai81?=
 =?utf-8?B?d2xLYUk2SGx2UkFOMUFSOHFiYUNoOEZSRDZrV2pzSnJ5Tkg4VCtheU5kS0Va?=
 =?utf-8?B?MHR6aXZkSGFuKzhBU2ZvR2Mya3VlaVo2bzVCem9JalJsTWVzMkExR3NEanNq?=
 =?utf-8?B?dnRUZ2VpcTdBaEFvblhIQ20xZFdpRktrMytrc2d0RXR0Vm81UGNma2JsdWVr?=
 =?utf-8?B?c1l3Ry9ISnZwTVBOODR1ME92dEhhYmNrODFrZUlEQ3dseW4xUEVhMjRKVXNL?=
 =?utf-8?B?WnQ1NExtNTFFWWtGOUZOMmJIcXpHSjkrUjVDMHZVbE9xSjh4eklBZzd0L2Q1?=
 =?utf-8?B?Wm9EN3BEYlhPTlJMRzUrLzNoSk9qSFhrQlBDRWdrUWU5WHFoWWNrT25OYWI3?=
 =?utf-8?B?OXFHWmRhYmRmRjFqbHFEcDVYNVlXamhUd2lxcWFUNVhDNjF0U0lCaVhSbmtm?=
 =?utf-8?B?TEJuMWZ2U0h3eHZ1Vk1uQktURm9xL09hZEdmcDZQMUNPTXZiYkFLQ3JrVUl4?=
 =?utf-8?B?Zjl4eTZmd05KeEx2VXVaK3h3TmRDNlpFWlB1bVFjLzlTeXg3RWxmdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87dd2a3b-1530-4beb-2f5f-08df18531732
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:42:06.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/PE4ttLQT7HNMP9DFRSacRNiYB7NZM3XXyzDQM+GnBfs+7aGCPfhzPtVZJH3xmzk8Enfaub7gZ59WatdRgOxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9550

On 9/18/26 3:26 PM, Timur Tabi wrote:
> On Thu, 2026-09-17 at 18:07 -0700, John Hubbard wrote:
>>
> 
>> +/// Registry entries that the driver sends to GSP-RM on every boot.
>> +///
>> +/// `RMSecBusResetEnable` enables PCI secondary bus reset. `RMForcePcieConfigSave` makes GSP-
>> RM
>> +/// preserve PCI configuration registers across any PCI reset. `RMDevidCheckIgnore` lets GSP-
>> RM
>> +/// boot when the PCI device id is absent from its product name database.
>> +const REGISTRY_ENTRIES: &[(&[u8], u32)] = &[
>> +    (b"RMSecBusResetEnable\0", 1),
>> +    (b"RMForcePcieConfigSave\0", 1),
>> +    (b"RMDevidCheckIgnore\0", 1),
> 
> FYI, we may want to rethink RMDevidCheckIgnore for Nova.  For Nouveau it was a big deal, because
> we were always lock on an older version of GSP-RM, so there's a chance that an older firmware
> could still support a newer GPU that isn't explicitly listed as supported in GSP-RM.
> 
> But considering the problems we had with GB20x and r570, we may want to make RMDevidCheckIgnore
> not the default.

Good point, but I'm not completely sure I'm making the correct choice yet:
should I remove RMDevidCheckIgnore here, or wait for your follow-up patch?

> 
> I can submit a patch (once the dust with r615 settles) that makes it a command-line option, if
> you like.

thanks,
-- 
John Hubbard

