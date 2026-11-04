Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793759599;
	b=LQAYPusgt6t7BrmLBcRFfO5LNhY3Uq0HlrRrst8ykznUsTx5M32gbMGRh3qy/+jMBk4W
	 Ozdtq8UxUEyiKgugfZv8dhirfxdcg16yajPocoKsfPTY1QfiaUtGThc+VmrLh7uiKeHiC
	 e1PYPmHAkHLxMNk76ZNaH0L9LWy+rg1kO26q7HcxRtARDLETM7OTvI4izaOZkxMmzDVyt
	 AHs/TW3+X2msd6OwVANeS351/HTvVIVaCLyPNjxAQcsgl2OEsPgYBFbugagIYIJqpXFEm
	 RcRuwHbWM8cYZPjnx+khIgOZE21YCaK2EWbmx7c0r/vFTV/a+3IZAr3wLUy4TBBPc9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759599;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=1e3NrLfHApm0cgNFDZjFzD/FZWRYyHJAgLwMAdhWnZ4=;
	b=vXcv/GnRmr7TTUBbQzafie3fJ+1d0Dqo6eI2HYVkdahoD5OhkxYO/F+lRjopfyHxXtHT
	 m6lq3V/syOL7WLhaKQhvUa9V/n6qBjpISTuT3skN6TTWs2Xy2dh4ABX7fNrriLp3+IRp0
	 XtS/72m8MPV3T9dYf3T5RlRtNIwIDsE+d8YwrcW/r7xr8ll20VhHvVvyJUztp9/gdP4tB
	 5PxWrWL4sOIXdA+ztgl1cN4Zk9zNyQCBYwSbCh6hKfmlwkutOPxEDxRVWWYxO+m6orGUY
	 6v/1vqwX5D8HNx3vRMrySyWwnmj1sNMA1HpvgLH5KBYfWWQKXhq/TCpjnzlY0YcBU2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rvd2li8q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.70
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA0A606A32F
	for <nova-gpu@lists.linux.dev>; Wed,  4 Nov 2026 02:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBA0A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rvd2li8q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6MgyyndC1+Rt5kCoMx0Ov+syY9sbPTttfJMSjxD3CsJ6vowL5GUddguUFWVaSm8nsk2OKdaXP0+1qDYYi1XVU1CL/hMfmiySO6mQYrXyou/QTZuocorv12uDX79eZ5dGCAqaRbZG0WnvfQCNEAn2CuF9bogcS8v3FV1ztDgKnWtV5Tiy8FQ7XmiqV77kf2n0IFHTIMmNVFnHd/OfaIVDaTTbSYwEPjYDego7034qOdA3UU/7Y9XIK1qx3ntoKDRaNPGf2D4TrzWUQItvHL6xODPWLQpjDX+DMp3Bd53vM276wchrD+D3mHX6xgFqeSrU9j7kKNpwuS3eaNCe3Hq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e3NrLfHApm0cgNFDZjFzD/FZWRYyHJAgLwMAdhWnZ4=;
 b=BkLdyQNJHKCE17vj1+2sy0n5h3MzhawPqOH4lnSDMFXZbpvbH1cL/1rN9Mlww+tNfDQ9BFzUArzBqU+EMLKSzsK6n+EAvKSNS4WQP8QAlq0JCiK8NjAEm6NL4muLwPh2zVICrKQlnTOVOdWK75G5mPx0jSLyNEwzS2zYd5rKp5znBp42x07LsPVWeMXWS/9ECXCOk4qOJ8qbP3iJZEBwz8pInov8pX/4ZB4vRQ9UQwcXKuNsyj1flB9mNboVVjxt9z3rPLFMTUfB83nB6RoBOxHZFcg802DPwp0kB06+VqWUarckiZMSC21NnH5FmHrUAIpaehmsQuzCLzpC7pyCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e3NrLfHApm0cgNFDZjFzD/FZWRYyHJAgLwMAdhWnZ4=;
 b=rvd2li8qQ97aWc5hoDqE30ehtvEQfuQNQC8SZDEhKc6tRw7AeOdjqyLz/2PyNdWSayUFpKKOoGF8RtvKS66IVoCungO1MwE6AKp5XTjRow4PRBwoiHQ8FvA86i4/xyIrjo/Izn9phWrbxbhpingmjSMz35znB3IYh9C6tYSA2WnsXooiqwOb4rGxjEmqkPC1HOmFTzZrsaaultZpvQWc2FeSYqyEtC1aRAK17Sp8EH/LHjJSYntYkhDDlBSwoi2o+giGfu/Bm4xm9UIw93iZQXMKPPQ6rlgMNu6GWTdbIP5QU5UxGDBKyR+yFrj4QXUMVYuMaV7bXiKgBfAgeqhzsA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by DS8PR12MB540605.namprd12.prod.outlook.com (2603:10b6:8:447::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 02:33:15 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 02:33:15 +0000
Message-ID: <c361f7c9-188f-4d9d-b5eb-d46c23109433@nvidia.com>
Date: Tue, 3 Nov 2026 18:33:14 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: drm-rust-next needs a commit from rust-fixes
To: Danilo Krummrich <dakr@kernel.org>
Cc: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <211cc191-828d-4494-92c4-168906a0ede7@nvidia.com>
 <DMLZOJTIQ2N6.1WNIKHGVV3U7T@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DMLZOJTIQ2N6.1WNIKHGVV3U7T@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To SA1PR12MB5614.namprd12.prod.outlook.com
 (2603:10b6:806:228::7)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|DS8PR12MB540605:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5c8225-c698-464b-6c2b-08df3a1bfaa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|261028144727099003|261026140227099003|261022105027099003|261022075727099003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	fbxYcylRbOaVTNKJcIBHdCsqyJfOgUK5oW/uBWOKgKMRfVoLDaIObFP7AkSbGlkiFGJogz9uSpGFcyBT+AU7VQjX4yfPNg8eb3vASCVOaMcLvOGsbsSSdQouSsTfhXSDDy7fvMrw81qUyV2Aev3A8gvxk7iyzswlUMqmPS/uJPFsnBmcBVlJjHIhDLuRPxmft8x4OFjbb+JhNH22x2drDDG3SvrDethiGedQYphUblMvXd1ppULRJZq8LnbytG6aOOf8Bpc+gaCgC8NUpbUxCofEdK0v5vZZQX+FHzldwu4icwVt3z6DdNl20v2xNShkLPtpixaGJEE1EXy+le4xFYk0ZMMz/DayZH1Cn4wT75Q6sOYesiygC/Si4Pt3viWk9C7N8mDv6hbJvs+7EkaVYwxjy/lO5wZ0KUTx0a0N9L8kzIPTx3WuWtVIBsTDuGEAZlC2ilRwWnJ7hWx8tL5JjDdYLmic3hEwfoh3Qkji4cDi0Mr76rVSvJzVSNP9GjOX8fJ1AN4al3lPQ4mlPc+5/sn6WJcflOxEKOjb5TbHead//1lQy6Nz5HK8gnyVSg0tJjEdsfj38gA4gKlTNt0WLD2dMtGghYCgZlVVh5tZW6BsxLOc4cjguV8BcU3xVlwyh3E+Z7wzw5b+LMA/ntCAjngNT05+SZxxnK0Rt1hSmQM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(261028144727099003)(261026140227099003)(261022105027099003)(261022075727099003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjVLT3NNSmFPK2tWZDVaRGhVZGJNMVdEOWgxMFdXQXdJRXByMWRZa2lZYmVO?=
 =?utf-8?B?RE5ROGxxdFArVzFNQkVzOWc0VVdNbWRHYmV4K1dwSTRTTEQzVEpabUFsRThG?=
 =?utf-8?B?R2tUWnl2WkoxSkNqVkZTM01WVlhZckg1dTd4Q0ZMZlpudE9FRVFNZWRkazYx?=
 =?utf-8?B?dHZaL3JrMjJ1WGZQdXFWNHVTOUR6RFA2aFRlRkxUNlR6Tzd5L3M2cUVISitt?=
 =?utf-8?B?Y3dGUHF3UjdDOU1aNkJTcFlSSXBhSGNBdlY4eis5bDNlclJrZnBtZVNuU1Ex?=
 =?utf-8?B?REliVis2UWJiRUc4bnRrUXRqOUx0eFBrOTdoUVJqNC93NWZwYXBrejQ5VDhs?=
 =?utf-8?B?YlN5aS9ReWR4endmMnpocWE4NnpVNUVZWE1BYzNPT1FmVk9wV1VjMEtILy9q?=
 =?utf-8?B?c0Q1SS9VTk1iUmhpV1lsNldiWFBIUWY1N2tGRUxFb3p5UFVFU1BJUVNPbVcy?=
 =?utf-8?B?aHVscVBzdkpMSE1aL04vMkphK25nU1Z2NGEzTVJSRWVlRHVxU0xxaE9BOTRG?=
 =?utf-8?B?VkpXZ2lFWWoydllhaXlCNlYxSCs1S0ZJWmZBdEZnOTBaSEo5Sy9zanpnZk5L?=
 =?utf-8?B?SVgxQTN0SWtUUmo4UU9jUGVCUkJEcXkxczl3YkZMOWswdno5bkdZd05BbUFI?=
 =?utf-8?B?b1NpQ0VHcW1mVUUxd3J2RGRxTmFpRjJob1Y4YXpOZEpTY2pRY3BtSm85eWxw?=
 =?utf-8?B?OXd5NjFyWGRjY3NXK0NNeCtUQnMxOGJPb2FJUHFzeDJLYUl3YlA5eVFtbzlJ?=
 =?utf-8?B?VHFlNlBNTG13L1ZQOGxNcXFkc3llZnZGK0dNMW9iNUw0MmVqYzFzMVRSa1pt?=
 =?utf-8?B?V1R6ZXJmWkRTczh2ZGdaZDl1OEV0ckdzN050L3RMZmgyUlZxd3NvMS9jZDhS?=
 =?utf-8?B?V2E5dDR2cmN1bUNTWTJIbFRjM1FqTmdoc0hCUmJwRVR5T0VTVE4yN3FhdmVM?=
 =?utf-8?B?MnVjTnpoSkdpV20zUGhYZDdZNVp0NG9oU2MrclJWU2haWVVENEVyWkpwUFA1?=
 =?utf-8?B?WEdjOHM0U2xHZm92TzRBbnFod0dYN2FvNE15KzZkMFpJSUR3SnUxdmlMQk9R?=
 =?utf-8?B?QmhldHJvSGZndE9NRzRDM3RXbkZRTG50bEhMK2RIUUhzbGZYSk8xREZTa0gr?=
 =?utf-8?B?ZFN3dTczYTVKNFIrN3daTEkzbzNVeTA5UFAyeGdreXZnT0FaYm9pVG9yTzFs?=
 =?utf-8?B?Q3Z0RXphaFZlVTN1N0orNnRlYjI3YzFyWXpkaFBwTzNkK3NEayt0MEU2TnNX?=
 =?utf-8?B?SVN6ME1JOGFwRStWYU9hTkNwZ3hNbktpcFhSdXNqSkFPa21FVktWU2hpVnV1?=
 =?utf-8?B?NXJ6Q1pWL204a1haaGErSzVvNmt1Y2JxeGpDa080WFg0c29sZ0tPcVpiZmRD?=
 =?utf-8?B?a3ROTDdzTHc5U1didVpHUnQ3NWo5NkFKbEFjUEJ6ekt2VlkrU0pFZ044bG96?=
 =?utf-8?B?dzcyMktMSEtjakd2aEptM3I3WDY3OVNtNFIwZDNMYU93V0M5dThOck5VQUdV?=
 =?utf-8?B?WkErd2JhUEwxTEs0ZlRFWm1VWXhDSjROc3dhZi9MeXdETUVYSjRxaVBlNGty?=
 =?utf-8?B?TFdxT0l6TGc0WmtCNmFTWmFkY1RmK0RvNHRxY3FBQTAralNsZVJubEoxQmFZ?=
 =?utf-8?B?UTNBdGJQVURQYjhrUlRXdHFaTWdSdlkreEFXRmU0c1BzckJsUG9yNXhFcXgr?=
 =?utf-8?B?L3NreldHRUFrUllFa3pEY2d5RFZSbnVBOGlQME5NT2ZQa09MaWErWnllNXlz?=
 =?utf-8?B?cU5YNnEwYjRNRGFxdGRBWTh0Tk1qTHhkdk40UWZzVnZlY09TYyt2a0h2bUJz?=
 =?utf-8?B?Yk95OTFrWmJrRVhmdVdMSmdOQ2J5V2hiTGJsaHJYUTZ5ejdYY3FjVUEvL3ZS?=
 =?utf-8?B?V2piV1ZDT09DYWNiQitsV0t5L0xzUlJ3ZjdUM0syRVR0ZXRnSHBCMEVyNmwz?=
 =?utf-8?B?enR1M2prbmg1MXBXa1NLZ0MrQWV6MjlFU2g3WWJlVFYrV3JTS2ZnNDRsNjht?=
 =?utf-8?B?L1BsQ0FuaVdMSnU0SjE3TlIrdlVTbFliSy9XSnZwSDdKTjRKVUVZWUs1VGh4?=
 =?utf-8?B?R0l2dTZLVTRUQUJSNm1OdC9ia3BJNDVZT0ZSak4zaC9HVlkvZVoyaC9nb05V?=
 =?utf-8?B?YXJFenJSZEgrTHhadVZhbkFkdmkweU91MnNYVlBVV1NpYlBNQXpHbzR3WERv?=
 =?utf-8?B?ZTN2UklGVTJkVFc1dWRuenBwVTR0ME9TVEcxTnlPSCs5VmZJT1JZWWFXeGJ1?=
 =?utf-8?B?eFQvN2JsMlpkd1ZkbUpkUjVIN29jaGMvekkybEFPSmxPeVJUTUxsZ2FlRUdD?=
 =?utf-8?B?aTBxYW5ENGdsdWlqTFg2b0pKVXFURG1wbEdLZVNJWGFiVytiN2ZOQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5c8225-c698-464b-6c2b-08df3a1bfaa7
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 02:33:15.5670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7oOIc4ZuVGf5F3JDpQkF2azCBIq3n9NZTiHBLQusYoo6ZHTu9obKjfvBLYp8TXQ0q9CNFN6ZChin36bFAVMzpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS8PR12MB540605

On 11/3/26 4:10 PM, Danilo Krummrich wrote:
> On Wed Nov 4, 2026 at 12:25 AM CET, John Hubbard wrote:
>> We still need the fix [1] for this problem applied to drm-rust-next,
>> as of today's (Nov 3, 2026) branch, anyway:
> 
> We can't apply a duplicate of that commit to drm-rust-next, but I will backmerge
> -rc2 (which should contain the fix) once it is tagged.

Sounds good, and that's only a few days away too.

thanks,
-- 
John Hubbard

