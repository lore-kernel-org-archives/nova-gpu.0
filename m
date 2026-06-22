Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B087346784
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 18:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782153703; cv=fail; b=VYNN5PYsr1qEZHUrVDfW3G7EcbErXdziDPHLmDiyD8Yr/YsOT8E1ACpTv4xbyE5mvpc1zBx/U/l2JdUoj9EoOoSrH9/ClQV1AOTpJXzAVR9Daayax3p53L3n7TotVEUk/n31Nk2U2Sh/ZScrni6NY8BYJhG6o/c5PvggTj3lNDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782153703; c=relaxed/simple;
	bh=mWP7fq6xTObx5jhPTM9sJPXaZdE7EoRkYlpsW1uPxwU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vDV4NrGP0eVy8RM03hjvbu8iX3Ic37et5Flgp1uZzrN4UsCDc6ZrqGET7+iQrPqs3PNcAwFjZJeFSevpnan31UTj/AT4aMtkm87qW1GSb6zD/Tw4V5pnxpZ+ph1WUkIxG7X/UCy5Pd9J+Bs3G0Jizo7NHzvToGIP4Mt56/jmMHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EOSRwnmb; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOSRwnmb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=illyrLUIMf1qzYgLY4Q+JUlZYFKI3gPXpCZRLC1NkUZU33HFtE+lN2gQBFIu+dnmg0dn0z1rGa5MYMTlHkpYFazyYlb2VT0kwz4VUyHu5HkafOxzX89ErBy3fCuTJQajIZnIdiLSIc4ir6IBeKe00TAngUr7V2cJ4ReDyhA6GboDyf+YlwDjw4LDcG4+5C20JR1drWOWDNaBotL+NyjGysTKpE11HBXZpjEEoW4t+Ie+956oCzTiRG0W3X+LRx0a8pOuQ9QRxyLL/xqORXdbrkq0zl+T1gvgeeDGGc77NCdUaqAjSY/qq/x+a7+97gZVEQVUlAR+SWHfrfT6UKvkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0q7Ek2g9mdMtYvwdHpGPPIkEca5/zDmJhm704A7FKE=;
 b=R1UnzW5Aj2IB5err4VvP+A1FbuBCMlbW7943Xq/aeyzTnB10vDmvdgHCtlIDWwUIXoi+ZBTbJ/WfGPiuCK2tFXP9FparwvKgMprjzILLZN5fMSN+n2+PwcRA+Yeyupkp3631ftb45U8O70T18+cwztXZQLcjovlNHxQWpgdYfe8Liph8Vtho5MAKmsOQi4FbYZ7YPNz/yWSrsGmtLEfIo/E7nFUJnvD43b8PA23LWkxYZ8FNbWb+AJP/pRidBYboMo/GaUXmG4tgtPbLMLKB8/N9Hb8/Tl0zsJDsbc/loNfHQ5Tn1pQ5FefLGKKNQLlE8glonb306AzLY/JOjLBnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0q7Ek2g9mdMtYvwdHpGPPIkEca5/zDmJhm704A7FKE=;
 b=EOSRwnmbZfsHbs3yHSgIgJH3eciWNgmo1jjvF5xc6rlJnNXHYXzd2L1phNZk1sk2Z9OUCnHAwW123neJxm8SR0QdHc12kHLAVowaQRr8VtS4vB5ZQUlqxX10x0MJHO79lH1/ucDhY2nuapvQF8k3Wg/oyir8QRTQqT9VyEfQgdNct1LAeXkNB2HkU27liLT3LgWIoUWLFHy9necINQHoneWI3sRAcJm+DI+AkgPBci//J+8J3wlKYy8JkIE7ckes08qX7M0NF6YS0xc2jO4y465WET6SX9Lra+aABo3bAenH6D8RAjyf/rgoOYTKuoAC4fCP+oLgK4ujIJts1LliWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Mon, 22 Jun 2026 18:41:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 18:41:37 +0000
Message-ID: <ebe1502b-1148-41f7-8122-87b8d5ff9c38@nvidia.com>
Date: Mon, 22 Jun 2026 11:41:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] gpu: nova-core: gsp: move boot code into local
 closure
To: Eliot Courtney <ecourtney@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260622-nova-bootcontext-v2-0-0ddeafc06f5d@nvidia.com>
 <20260622-nova-bootcontext-v2-3-0ddeafc06f5d@nvidia.com>
 <DJFF3KUNHR5T.TQ4AVJEOA1GS@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DJFF3KUNHR5T.TQ4AVJEOA1GS@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a03:505::12) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2ae398-9706-4adc-c871-08ded08de425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	WB5JmCtjZpuZh3252lDbTJKKDW2vb0I0kh+FIjQDQtCHl78uJitRoJ6UlXk8NEx4cPU7Ucke5zIBebi3EFv7ybykBdE+iwx4ThSiAzUO1MQWPrEQS+kYTEeHRLtdJytxWtuQNJhu6XpN5/ZFgWLjxAsmGKllAH4gQvDj769bvW1hBz0og0mZvc8poAQ5thObUi+pGDoh+FVihJyNjbFvAgl0E+K3NjHI5qW078PLU+eKdjqauEmyma/ckZzBTRrWzzJIPS2briJ/y6eIVjfwo9RNayOpNYaFdd8Ig6C7Bc/YvPG1gEwcpVL6oEFnP2Z60YIfM2CeI10j1ZHDTl7txDWBcRIhj2Fdbf5gClZYtc3FYGVyfeOMUJ2CaAfQ0SMpuEVl5pr28uDxfwsHzb2DETIQv1z/LWOovXBzm+kqDfoFb0eDEtcLqp7/BNVRmTKmplodBDjczqTY0PmYDRWRFo0csQCjA2f1vxo2EIAgp1gqJKowo4tRV7G16+Sck0TbrR48j6YuB79ElWJWdzkE+ztZuAB9ZXEalgOsc8ErgHcuiYf2xqQ00dT7NQ/ezPj2QnTPRPpVr/ms2LL3OSI4qp+QBYGFp9N2oGsignQ7oOis2Gni1Hw5r93tx/5NdGjDAojieu7FhbPcjRn1AT4SAY20gk01Wq6X5SZcNT0BTos=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dUhuNmlLU1B5eFVzMEtCM1VYVHc1NDFONnZmaURSWWd1VkNmU2lzLzkwK0dP?=
 =?utf-8?B?Zkx6L1dGZTdoVEFnNkRDaEVxNDRBSzhxK3MyWTg3cUVRbU1WaDd5WlYvOHMz?=
 =?utf-8?B?QlZHWm11V1hQU2VHWjJ3aElpOW5GMXBwa2J4Z01iMGJPZEo0dnNrMlFIL3ZV?=
 =?utf-8?B?aEVNZlpyTFZNM3BpNmFmbjhVcXBDeFVuWmFlNTUxUTM4ZVpRT2ZRcCt0RXFF?=
 =?utf-8?B?NE1QOFYyMUFqNFFiODN3blVHM0syNnJ3MEV0anpaQ0NRNU9RNExOVEZJUlpM?=
 =?utf-8?B?QWxZdlo2cm5rT1FWdXhMd0loWk50Yjc1bW85SUJVVUJOTUJ6M1NtSmVZM09W?=
 =?utf-8?B?NkhaV3BIN2dreDVnR2FwMGFIUU10ZkUxYU91UXJZTWVQOXI5bE9WMEdwbHF1?=
 =?utf-8?B?aGxQRXJUK3dKYnhCanFNOSs1R3QxRVY0WVVTRnd4UzZ2NWFmWUhCOFRxTDJX?=
 =?utf-8?B?NkZtbVZNL29hcnZBT3YzenFjREU3S0ovdHpzaGgzQ0RGSDN0K3plVk12K0Q4?=
 =?utf-8?B?VjZDMEpveThja1BuL2dNcjZkb1B2Z2tMMU9QdXY2emdzREc1dC9idlNMbnhz?=
 =?utf-8?B?NUE4SGVXUHlseTV1L2lrOXBTZFYyQ3FXRlpsUW85REtCVERGeVFqWklEd3hD?=
 =?utf-8?B?YWNpWE02N2pDbWQzTTQwYjJWS1N3VzNyTzljZVpYdkhiZ01vZ3h1NFQ1VXhT?=
 =?utf-8?B?aC8xUVczY2RrUENjMEZDTk5jek9Uei9IaUFSc1N2V0t2V2RZREFnVHlrL2RS?=
 =?utf-8?B?eDBueFh0SnhnT3lKRkNvZk1lUzVRZnFWRWxTbkVtSXg1aFhjK1RwSkNDTFNQ?=
 =?utf-8?B?UW9tUmRDeTVMZERxWFM3TTlRSmdMYVJaUWI3bU9UaDByeFY4QlVZRnNtR08x?=
 =?utf-8?B?UDdFNWdIZ1BIRkw2NDFsUzlmTGtESW9hQ2RzWm0ra2hRd1BGeEVrTGxCZy9Y?=
 =?utf-8?B?NWJ4Q0xpcER3V0RIK2gzWVJtMFQ3UzkwNUorL1YwVS9UUFQzdU85endUcGYz?=
 =?utf-8?B?TFVCMUdOdE9MbU96NnNuK0tBRGVjVmM0aitOWUtxK094K1Jud3RKQ0xzY2d1?=
 =?utf-8?B?U2ZpbnhKZjZUOWQrbVlramhJcXlHU0o2Z2hkTTkzc29HeVIzN1ZTbXJvMGd0?=
 =?utf-8?B?ZkRDY1R1NThmaWQ2RkxxamNGVnk0TmVMZVgyNDVrWFlaRmVtU2lxVWZVVkQy?=
 =?utf-8?B?WVRFVlpRbnZlaEU3M0Q0czFyR2Z3Mjl3Q2RTV2o3bnI5YWR3V2FIU2NBdjVR?=
 =?utf-8?B?VEZ3VGxRR0FMQmVYeGRHaDcrWnRoRnAwMEpsYjUweFhYRlhqUFdjaTNXeDl1?=
 =?utf-8?B?b1FMU2tpanc3VlJ1czhhdnFoLy84UmptZGxCdlFmWGI5RktLb3pqNXdSc0dM?=
 =?utf-8?B?NnZPakgyVlZ6NHlITU9haWxON2xhM1g3ZG94a3lOcFVwSUo0WWtiZjJmVGJV?=
 =?utf-8?B?YnBrT1J4dDZwTEw4ZXBsNGZDUUNHeXR4VmRmRGtDRDlVbU9LajdiSS84TUE3?=
 =?utf-8?B?N1k5di9KMkFGS0Q4TlZQaU8ySzI3Q1NGakhEQzVqOEZ3eURCbi9sUkU2eXRU?=
 =?utf-8?B?ZjAycTVmV1VNaVZ0bmZ1bW93N1dROG1PNHB2TVBIR2RiODlFbkdCUFRFU3JP?=
 =?utf-8?B?bUJyZkRtUVljTUs1N3cxOVIxZ0Q1ZEtUQlRrSXBkN0ZXU1EwdStsNS9udjUz?=
 =?utf-8?B?SVVsd20xVkFydXgwQnpFdTBGUkpOR0ovMlEzTlJLUlZ5c3FITkMzUlJOcGhK?=
 =?utf-8?B?R0JFSG1zcE1oZE8xT1ladGNuV0wwNmJpQ3hKU3JxMkxlZExyQ0xKNDJXdlE4?=
 =?utf-8?B?SUNKTlZKOFNNODg2SlAxeGVFR2xPbDJBbWlabGUvM1NINFArWURONTlKWnBw?=
 =?utf-8?B?Yys0Nmg2VGdPb1E2UzUrUVZvbnhMVmFhemJOL3FvZkMxV050aEtZZnIrUTlk?=
 =?utf-8?B?QzRRQ3ZGRlk0MDdkZjZRTFBqK3orZW1Pelh4b3NYQm13dDdrMzVOTFFXTnNM?=
 =?utf-8?B?WmFpUm93ZkhlNlZMRFhOWlkyNlU3YjlUZ2c0d01IdnBMY3pmL3d0N3l2cTZE?=
 =?utf-8?B?a256SkR1ZXZvZjZIcUNPYU9vVzFWejBhY0RxbWtVbkxtS0ZGN2FJMWlwbEpl?=
 =?utf-8?B?N1NEc3RESjh3bzk2cG4vTTlpMXpROXF5a0E1QlFyVGZJdzVpOXNHc1A1TmNk?=
 =?utf-8?B?LzN6dU10UGhEVmVxaTJaK1ArZU1NbmtST0x6dmt4NHQ2WUhSY1RQaURLRmRz?=
 =?utf-8?B?RVNDL0hsb3JrTzBKQmR4Z3NCZndSNWhOYWRJVkxwTFp1NmtldUdzSDBKeVhq?=
 =?utf-8?B?Zmo1S3pvZGw5cmpXSFB4K28wN2Qya3hjYzloNEEzTFVJeWNXODBDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2ae398-9706-4adc-c871-08ded08de425
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 18:41:37.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bfYA8UReBC6aDFtK91EQ+zY9AE/WUPnNTZZzbWAve2WTk9c1HsKxd2rHwk6hnS13QZLi20Hb6rfyBdcQ1kCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435

On 6/22/26 12:59 AM, Eliot Courtney wrote:
> On Mon Jun 22, 2026 at 4:10 PM JST, Alexandre Courbot wrote:
>> The next patch aims at replacing the cumbersome `BootUnloadGuard` with a
>> more local and less intrusive mechanism to run the GSP unload sequence
>> upon GSP boot failure. Doing so requires running the boot code in a
>> local closure, which changes its indentation and would make other
>> changes difficult to track in the diff. Thus, this preparatory patch
>> moves said boot code into a local closure that is run upon construction,
>> so the next patch does not need to re-indent code that changes.
>>
>> This is a mechanical preparatory patch to make the next patch easier to
>> read. No functional change intended.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
> 
> See my response at [1].
> 
> [1]: https://lore.kernel.org/all/DJFF1W6VGY4Q.2PV5MEPMFXIDB@nvidia.com/

I'm relieved to see us going with RAII scope guards instead of a pile
of closures. But now I'm tempted to wait for a v3 that does that, 
before reviewing, on the assumption that the rest of the series changes
quite a bit as a result.

thanks,
-- 
John Hubbard

