Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795215237;
	b=5OczL4XqMRbBDp6rsrxEa4FVPaTKt9Bx4Z376gYeZL9dF03mmp2dlbvNk1Xr/uuendei
	 h/SbWzeKYsi6aVaqkcHZNDX4RIYk2MgE+x+txHhHgrvryl3F7sEYYXXBrU9TWZhTbaIat
	 138iXUkLBBFPntQejrRlCMI2FfVbgv1AbP+NcRMJ2cRZiP4Fp6AXP5IkiFEbz15XqD3iS
	 iV8RoaIlUoWACdp3/fBoR0weOrAXBdyY5YBXE9zVFSvLetYJKoo+vcGzFhwic9A5pjFKW
	 af8UHoEZ1LSRVZGmRZvW7wR45GASryjdxAvfRSovHy57DzY0Slcn9+cTYMH/f1hE04Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215237;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
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
	bh=44rrkBv1GKxfMbR6LBaIfS20l/da9xQgSRP4ciZ970w=;
	b=u1InhySygU7m6eXObEcRLCP2sQPns9AUuKLAcGBkw3DKR5CG1x/tkK9+D4PyP7W0SS+7
	 +Td4gZkkgssGpkW+s54L75Z1xzq2pehZZYtUvfD3dC7QwPZKPvBRSsbm+/b6wrFI5Yuti
	 W4TMr14lRK9pdvFaAhVHCsteLHUahCEdAiWdJ4aj0LViHIsIppkeSmrmodI3+PzDSTyDA
	 EzJane2Ff+c1St4LlCf8efeqf+7aLr1kYUhOZI5t8x/9pMFCMQOSI+ThlvcMRQrNLGfns
	 ueQbou7UX7w1vr7MyKP/YkygEkXmQ9dJAuj1WxYXLOmgt0Rsz7jgVJOcYhjIrXSuwtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XnjXdtQM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.45
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8812D606A339
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 22:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8812D606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XnjXdtQM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jmq32+qd4IColXHBvFo7e5PfH6MR1ReFH926Rh0MR4WYphor+ol1HKD67SoQ3Q/twPn/ASHRCpRlKRfOpwlWHukLabxUel2Ra7ZcHnr6dVKy22x5tuE58TCJOIyjN0IY6EWpeIFsVVoPm2yprCZ05VcMHBXiPZh4E8wTdcxFXv+nerEs9N/xxf2KgfWZXqOq33xTuwL946wO40C9DIDvs5pcQVH663VWQsJjUzRk0Ke2speseqpi6pAKYR2yrzKMOZV2Gj7f/nvljSqYk2D5A5qvClwJOtFtG6w2zBe5+K7Las4dOWWhZ7LJwvgK7w/1aHgx1VAcaWUnS82kfsDbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=44rrkBv1GKxfMbR6LBaIfS20l/da9xQgSRP4ciZ970w=;
 b=bvub6cg2+MeqbKsTsipk2banfSvldn3HqpRuY3NeLVilodly8KWsrByQNx3uonnqECJwTREYRmIO+V7BKoWvZdCZAa+32a6I1rEtCfsjKPRc40yPFbpw7iXHBHyAMTdsTOuSkHaitD9oV40ltHmfCTOYxM7dKBler/yT9XTbiMm9Kyywm0HY/QSS00Pdb5UsLLhemGbQuxW5/rNX0rqhDL6kosZbAHOIO4vQQGqyhi5UUhw660MB7+eCgm4NY4NeKX1VtHPBcdYRMIxi3klZ3ltPX9FcQjR34so/wIwaT4dKqJisw1Lr1zD2NgqlYqXZnqSeLaMCfc2LjsAohtYy3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44rrkBv1GKxfMbR6LBaIfS20l/da9xQgSRP4ciZ970w=;
 b=XnjXdtQMZENo/Ec5ORkzWMmrqqU8o+7tJ9bhbSIOy+E4K24AWjIbhmjOql7jrYdBeyZhqZ3joYZB7gjkuR4SSkGmRcAfNFbcCzsPNfg6yZ+OWA/tG+ZcDbUB+enYB1yg6EHDIYddA6KYe5N/CnHCpcJKYuvI9XJNPxRTwto6qYbzw0Zo6Eh3SBIcbyKwrC2VzHseUcO6PbIX7IiLmBQeNJwgcADboK1SeBp+/Zfpuq0dL7Thx0KpYPFbrJEeg0ii1TLRvHmYEOuICcScbeesELCsL6tAFKeZ14aEtrZCFDMY7tXIRO6FZMLIH65apVx23nA5qxcbeI3dG8Fw+YH7Dw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB5614.namprd12.prod.outlook.com (2603:10b6:806:228::7)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 22:53:53 +0000
Received: from SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6]) by SA1PR12MB5614.namprd12.prod.outlook.com
 ([fe80::1a0c:e9e8:f3a5:d9d6%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 22:53:52 +0000
Message-ID: <03436183-9dab-426a-9283-28e988b238db@nvidia.com>
Date: Fri, 20 Nov 2026 14:53:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] gpu: nova-core: use the TLV heap sizes for pmu and
 non-wpr
To: Timur Tabi <ttabi@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-4-ttabi@nvidia.com>
 <DMZU4K5Y7ARN.24GTSON4AGVVV@nvidia.com>
 <1f88322ae5c6d879b293b2f2a96a36413dbafef3.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <1f88322ae5c6d879b293b2f2a96a36413dbafef3.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0010.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To SA1PR12MB5614.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SA1PR12MB5614:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: dd91779b-7cfb-4fc5-a7f7-08df4759260b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|261009223027099003|4143699003|11063799006|56012099006|261021121427099003|261102123227099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	nvmsLVTY+nIzIXCauWZEjpJx4tQyCSwatBkFQgdjXM6bNCwtXFDuSYEV+9pZ81KaoJOeqIbYgOupsPjY8QJgBSmxjvpiL3G2ebGS6LKvBnLCgj6FYqYXSOi7O7aGiW3xzgHCEkjlVqZF8mB35HNwmeE0QiBlluGZLokGsHJjFYwMDFtiBQb99rO83OAZXqVJg3mIlesj9LJklX/y/OEO7Mi5hu7HFZgX5UGBVVThMpL2H0ONMQbdUYmdWz5tsYEinF6YJXZa9zSDDQIm610T8csdL8u65hbDpcpChVt5zpY6hT0FbtCJ7BOlHPDgMhYoMYxgt2ldfwpXKv/6w5IcFpa3D8gogOdLHah28thJ4r/22kMaiByOEKIqcF675Qqe3ba55u1gKdyi0tsTKAlaz91Egbnl1kXNF1kaa2Q//+YxAlf7ox4f8c4DjOzxoYMa1uY0nGKmL6MeU2jQ4QnF6RFZQk8RnFMpy1Pe5JB27ZOICkuxZDp7Jj7tHaqoC+WaxZrAPQYUAOgD94RDJo7LLrvZDbyJCDEdjOD3jCukjg8X5tocdcC3NgeAHXPm04/5ptwjFXTrP1mLm/sDdCNuyGAqoGK1fDuAIe3fpP6hKvgOD40Gu+KyWFEjJus1Ynu+HYuoLsY3cwt+7CC+nHYZSPL4nRmMlQfZCMb3Q93f/XU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB5614.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(261009223027099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261102123227099003)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGN5cCtVdGhENDFiSmlsakhLSEgzdFd3Y1E3L080NU5mKzhUNkhBY293MlVV?=
 =?utf-8?B?aFJyV3huK3NaQU9CTng1WGg4WHpIdjdXd3FoZUgxOHZwQStzalhWNXNZM2J5?=
 =?utf-8?B?TzBPTXFYaXNoZjh1L2JwcWtCblRaL3ppWUpzWHlhTXkrNWsveHZFNWpSVVJI?=
 =?utf-8?B?VzVrMnVjZUppVkNLZVRHQVIyRFBEeVdUeHBaN1Y1NEkzRmJBMHNiZmhuMUNI?=
 =?utf-8?B?dVRpTjFjUXpTSThQMDJBTG9TTWlMRzVVeE9iWHMrUE9EOXJDZHFFRXBySWp3?=
 =?utf-8?B?ZytPV09SbFcwamFtRUFtSy9pYVl3QlJGTkpzdDhTcVZYMHNhRnpNWTdZWmZ5?=
 =?utf-8?B?UVFOSjZLbEFhUXcvcklKUEh6S2MzbTEvbDB6QzdTdFg1M0dhdkJBUnVENlhr?=
 =?utf-8?B?elBOc2dlK2IyVVRCRCtidkkwRTdRWG04bEw3d1JUYU1SV0p5MWVFMFhQUkJq?=
 =?utf-8?B?QlZYR0xqTk10OWgvSFo1VExzM1ZNS0xzaXUwbkJnS0JpcFpBSkxHK3oyNitS?=
 =?utf-8?B?RmlMdTU4NkdxTzkrazRxc2hFK0RmTklpbFI5VWlCVjhkYkhLZ2lSU1VpWGRa?=
 =?utf-8?B?Zm0rT2p5TGgxUVFJK2FPdGx2TDc3QlN1RjFYTnF6aVQyYSs2SW5wdmlnN2Vk?=
 =?utf-8?B?QkJibFJPRjVtZ1MvbXc1SUtPUERsRGtiR3RYNWhDbHJVRFFIMDlTQnNYVHRZ?=
 =?utf-8?B?TkpRUll0eFp3NG4weCt3TXFHdWdKZmpobjhOMk55MmxqNDd6Q21TRmpYS01M?=
 =?utf-8?B?ZVhBeG9oaGtHUnZncVdTUk43c3ZyemhwcVh5OTdHTG5oVEZyUWNzWEVmVlpI?=
 =?utf-8?B?bURuU0d5MEVNT1h4a1F0RWUyNzFvYzZ5UWZDUGcxd0lxVlh0Z1VQOGxMdkcz?=
 =?utf-8?B?NTJVWDJMT2JZeVQ4L3JiS3Mva01MbGNYOWdhRHpMWlpHeDBudmNqZlcxSzlQ?=
 =?utf-8?B?dkpVRVZ2Z0NmdlgvZ3EyVDhaT1NoVnpOOHlVZFd1Mm9mdFF0Tm41V1pzMWNB?=
 =?utf-8?B?Ym9NRTAzNUEwbk85MURrQzVONGdvR3JDeEEyTXMxaCtPcGlkS2ZRT0FoM0tQ?=
 =?utf-8?B?R1J0NTJuUTJ3MFJ6V2NWNnhLZWZnK1FqK2ozUDBqcFJzSHA2cGV4RzIvTzdp?=
 =?utf-8?B?TFAwQ204OEo5K3hFWVhQLzY0elFGY1BzcEd4ZDZSVWh3OUc0ZzFYd1d0RzEr?=
 =?utf-8?B?bWRLTlB5V3ZlVTZuZERrNWFGbkRHV0hEUVUrOUJsNU5jNGxNMFB4ZHF6S3JS?=
 =?utf-8?B?ZzF4QmlQNC9RblNqZ3NiYlRHY0x4bzQ0S1huZ2o5S2RQa2lQRC9OeElMd1M1?=
 =?utf-8?B?M1gzQWoweUpRVzE4SytycHVRRlZnYTBGcitpSTE3QVBJSXczNXphczRpeUM5?=
 =?utf-8?B?c3JOdC9iMjVUNklvY3ByWnlrRUVUZ1d1R0VzVkYxU1c3V3dnMmJvb3k2aVhI?=
 =?utf-8?B?STgvTmYzN1RML1I4UTl4amxhOElHWm1uaVd2bENROU9jTHEwMlJHSW5MTDl4?=
 =?utf-8?B?QmVIZWtlT0xSQ1Zxd3R0cmNJVGpzOFZ0V3lkVXhXK2E4a2hrLytsclZMUzll?=
 =?utf-8?B?cjNmTERUNW9PL2hWWmZCZStGOVZOeVlnam9RY1R1SWZBclVGL3N2UTk0aGh3?=
 =?utf-8?B?UE0rV2Y1SDBxUG55VU1DdHUySVhZU0JNUWVuL21wYjlLMGtrd2dONnl5cG5p?=
 =?utf-8?B?SXJ1MHdXOGdBZWwrZzVReHdqRHJ5Y3dSYyt1MWg0RWxDVDhVRmJMTVBHWlhp?=
 =?utf-8?B?MXpibHBZY2UzVVJ2Z010UGlZWFl3UTBhTWZEaTF1cXVmUFN5c08xcXBla25E?=
 =?utf-8?B?bDFVNGlNc0F2WGNNK0JFb0R3U2xPQ2x1djEvRFd4Mlk1em1wcU56R2lyNnVY?=
 =?utf-8?B?bHZ5RFZ5dUlERlI2RFB3cGNSZzR3cGpwRDJXekNJVjZDYStXVUVTUGFkMzkr?=
 =?utf-8?B?eUJGa05OWFhrSWhoSUlISEtuRlJDNUNHZElYNi9wQ0F1bGZOUm9Ya2RjT3lj?=
 =?utf-8?B?Z3VHS2RiRU9BT0h6cWNyeE4rQlZxZU4yYndvNzdpMitZd2ZQNXZkVDMySG05?=
 =?utf-8?B?WTlLMzhGbzF6UFhjalNUL3kraXI1NHM3cDZBZXpDZ2JwU1FYYVFWU1FlcGRw?=
 =?utf-8?B?TTl4bG82VVZRWCtKdmJrQnVheG5xYUlkY0l5K09IU1VNNis2cThDWnFDSnhC?=
 =?utf-8?B?L0VNS3QxMkhLRFlzM0h6WW0rem1xNTQrT2dod2ZiNjJvNStZeTRMNGVFVFZ4?=
 =?utf-8?B?NlBIcFMzaXk1WGRoOC85MEJ1U3ZJbzV4L3VDanRtZHF2enBaZzBTOURCd3BK?=
 =?utf-8?B?SUlQdDFBa0FYdkxoQjZVRDdoTy9VeXMvQlY4QzB3N1VDOHFKVUY3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd91779b-7cfb-4fc5-a7f7-08df4759260b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB5614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 22:53:52.7641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMb3l8XcDaqIjlumsGBo4XTMK1PLIo4jLGs9nl0E/eH0AMq7LoBwjdiFN2jPcGhtX2DhpKNxC7HyMl7rrIXSxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263

On 11/20/26 2:33 PM, Timur Tabi wrote:
> On Fri, 2026-11-20 at 15:47 +0900, Eliot Courtney wrote:
...
> Honestly, I've never been a fan of adding and then removing unused-code attributes within a
> patch set.  If you're telling me that they now depend on the the Rust compiler version, then

We are stuck doing this, though.

> maybe we need to relax these rules a bit.
> 
> Just FYI, when building this tree, I already get warnings like this.  I've just ignored them.

Please don't get accustomed to ignoring Rust build warnings, because Nova
(and Rust for Linux) are expected to build completely cleanly.

The convention is very strongly "no warnings on the build".

> 
> warning: this lint expectation is unfulfilled
>  --> drivers/gpu/nova-core/gsp/nvkv/encode.rs:4:45
>   |
> 4 | #![cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
>   |                                             ^^^^^^^^^
> 
> warning: this lint expectation is unfulfilled
>  --> drivers/gpu/nova-core/gsp/nvkv/decode.rs:4:45
>   |
> 4 | #![cfg_attr(not(CONFIG_KUNIT = "y"), expect(dead_code))]
>   |                                             ^^^^^^^^^

Eliot can fix those, but only if he knows about them. Don't suffer
in silence. :)

thanks,
-- 
John Hubbard

