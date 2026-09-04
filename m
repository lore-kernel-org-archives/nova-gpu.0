Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFF28373;
	Fri,  4 Sep 2026 01:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788486792; cv=fail; b=cDtYkTSnd1GGqkD6u5IMvO+GLTXT97ZPs6QDEj5+fR9mKId8oo1+dY86VcGWsOOrYiYqSTn2SjpsXInfEQIMmb1efivxfsm+Krzo+SW7oI27C7lXKJb3BP4gQG0Nz4SSya5FiUHOpA0jwS2RVcFaURTpUpntYI9A6jMyI1WCXoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788486792; c=relaxed/simple;
	bh=UFeNa0u/glSFaFKqvHMGJOd6dpkXCWpMj040bFK1a1A=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FEuKFeCz1l/9HQzxMEvT9DP93ElGKOBy2mSrjoPu33Z3Edmc9s25nsMCYQMeMP7rWDzeFEpM0xSODvSOVbihrKXfKODOSddfY5JB+90cy+U9jnwe5Woq3psXfTYLE3NfB8JGwB0YDRzEhBfwXH0TpNDEmfMkx9Rng5hjsIDFrd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=snurDlsj; arc=fail smtp.client-ip=52.101.193.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="snurDlsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gg9xhrU5IKIUvPVQupjvouxASOP4A+PsqJ61gYz38+AG7VFxATN3bKIOax5kQklKohl12HFogdun0gf2uU+KbeOv8Ma4+GXJ9f0RxT3w7Y0A/ilg1jYSnDJ+1Tw16Oq9AZP/d58jrllkEi+hDj/vQYyAwkxabIADtIm/TLQoyqDvx9D4mKp4oUU/ebYK+z9oD8TBNHy3CEv67UmlNI7sgei1T0NmRt/xBA2DFDxalt1eT/HXklXQQaRRFpHiOqpUNSEYeSb4HI+T7nkg68pkX+p6LXjbgy4uOCNmX6xiKUkwkxbgf1iTjKfM2hSdwlS3rZ9Q4DqPh+TWLSZ/VlwtCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD8QNa/URshx7FsEI5LlH4oxNDhY66hkZHoYLMYheL8=;
 b=OU7JUw2Yu/D7X4pAjOYNvgCGZKNXBViAwHIT7/nlxBscydHfpJtakxfwC4QPrmPMst2RKSk6Q4ovp6IlSWFZHm4l8a01Q8ocUqevbP81vv3I/FdzrWPZ6gdPQtrJFqRiQZCkSEqs7eTJXRjhzoTDeCKNI6hmf4Yf7pYM5uBat0odZPJ5HiyfFKta68zkI2I6yOLdNB3CDu+CWLnDZwEEpDzFXspXGZ72ibjhNTQZpupl7ud88CKCiJyMa+eA/K6tgmVFaAk/aab01PvryRiHZAow8Fvweyk2J2uKPk/ZGLqZlsiHA2Wi4xxAjcUbvl2XaojEnkLGzOavauTnlubhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD8QNa/URshx7FsEI5LlH4oxNDhY66hkZHoYLMYheL8=;
 b=snurDlsjArYaf4r2HceRArzEGhCNEgXY5TEUBCAGl8jRYf4K3LzClUMZGmoLlhxfzFFibfFcnLgZhoukzbuI6W3L6pQSdzg0WsGgrD2Av3Qo4xV6aj8NvjXf5DQWq620GuYnCjuVYeWVB+HViZUSn8VtN2i1y5PymnrJp1aiG7Woc49LSxy0zUWPCiS46idz/RUsZLvbS3iYQIKvfmlr9RmZ7CzqEBMSk2FvPpWv+yxlWTenGxjzul8my4E/j/Xjr5EntS3jMoyNjOHqJ7ASoL29EPJ3K8TMhbNCCpFmkpIweTUgPH5+h0Yn0aYW5kdDsSH/WgljBOgrPihsN4ANAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Fri, 4 Sep 2026
 01:53:04 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 01:53:04 +0000
Message-ID: <103445ff-f577-40d4-8b0f-ebc7bb6907b2@nvidia.com>
Date: Thu, 3 Sep 2026 18:53:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the SWGEN0
 interrupt
From: John Hubbard <jhubbard@nvidia.com>
To: sashiko-reviews@lists.linux.dev, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Benno Lossin <lossin@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Timur Tabi <ttabi@nvidia.com>, Will Pierce <wpierce@nvidia.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Trevor Gross <tmgross@umich.edu>,
 Gary Guo <gary@garyguo.net>, nova-gpu@lists.linux.dev,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-13-jhubbard@nvidia.com>
 <20260903032815.6BDA71F000E9@smtp.kernel.org>
 <3c3a96a2-4eda-4335-9388-0b35ea5ecd5d@nvidia.com>
Content-Language: en-US
In-Reply-To: <3c3a96a2-4eda-4335-9388-0b35ea5ecd5d@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d0670c-e995-478d-e0e7-08df0a27427d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c03PiUkv9rqmaGgag9h0kjyf2g6o9iw2DLGB/Lbw1jP2kHLHi8oCrHR91nXnFcrXEPgRFY3cAqtjuF19Bq1z1dgTNXIn1uanZfu5Be9rgjEkV+FE/RcroVZxOPlNZsOtTmd6+xo2Jn/wjNXJptx0Zw3IyFV9dfkdahy18ZBL8mt8YSwxpAbkjdX3shsntb2uWhDDD9tXDNr5mURe3DZeO2OzT9eheD3I6SReUghLeo6EP/bUqsebu6l/Ul9cuIsu7qtXbzIP9LepDehpcH96JTbqHCiZEIqvhcj8HPNbwzgkq3DUiGSVbh82H6MhiIN4z4CyjLZuI/jIj+OFA00cjRgO27ERaUF8cFonXTyms1ZnK0sVbzEBntVjskrZdcjoTsAfIAcAZmelsKB2B4Ak1gtyzT5jNOhmUu3gt1/v04Cuido8LYg24dKqdFIJ409X24tF+Px2uoohPsYBqDLKNDbyvpyUyG3iNtXPfApHpyB4M2MmFsTEkj717sXzgnbm6MZ+Lma1BQrwsL623zv+5YsG0V/8jIOiNFxdtlaM7yy1O7KSkBYHZ/qXZU8aP1ilT6RRCLs4Qetrx1hjvx6+Ody2NJcIuIBvhKNtlySdUULjKkga+lkvfu7vteQalt+k9quXEe4Qd1bVegT6DgM6IZ4jGzc9sYSUns0HqRwqzsY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cy82M1A0Tkw5SEhTeUlzMDlVQTRsVjVpU0VieDc4LzdLY0dGL2RKNHpuQnoy?=
 =?utf-8?B?dnZETnVnK0JucnBDK2pyUVBNRDhxR2FsR0FDN1Q0UURSalBWQytRN0k4L1I0?=
 =?utf-8?B?TlZoa3VyaDZCR1dCLzFHTis5aUY0SjB5NGtqQktmZXd4MHU3VG9mK0d0SjBK?=
 =?utf-8?B?K2ZNWTY5SnEremVMM09DejJJTGx6M3ZhQ0dqczBOdkhzQ0Q2TDMxSHRoRVRG?=
 =?utf-8?B?RkxRcVpwMVpJZm5nZ1M3VGtSZE9tNFZPTzBvOGtQRWppY2syQzhqUGxuWmxa?=
 =?utf-8?B?RVRnNjNGeW9PUFkwMWdrLzN3YjFoeVJHdUtsVXZUTTVMQ3V2TXN5RTg4U3Js?=
 =?utf-8?B?NGpzVGZVWjNrNWpiM2sxeTcrbFp6SGZ4cGE4ZU91NnBLQjlBMmpxS1d6eXZr?=
 =?utf-8?B?MG8zdW90Z3g2Z2FlR0hXeTBrZ3RjcUhmc1ltRU5odkZob1FJalV0SnNoa2ZW?=
 =?utf-8?B?V3NoYmF5c25zNU9jbzNoUW1jczkwOCtsZllZd3QvK21UOUxaQmtqejVndzQr?=
 =?utf-8?B?MlYrdVV3NU4velFyQ0RNK0R3OTRKUnJ6cEFNNEp6S0Q1QzIxYXRRNG55SnRa?=
 =?utf-8?B?Nm1CcjJ6L1lSbXkremt0MTVOVndZVUkwdkErMVNEWGMrWStZMzd5T0tPZXlT?=
 =?utf-8?B?RzVReFFheVZGWXFiWXJSU0RwQkxnZ1ZmR0E1dk1xaHVRYzZsbndjL2syNkRF?=
 =?utf-8?B?YTFORm5SanV6cXFCVW81NXBNeHJ4eDVvU1FhbDFGUnplbTJ6KzVzRVBPU09v?=
 =?utf-8?B?VlFQWlU1SGJyZldvQnRiVkt5WEZLc0gzV3VCN05lRWRuM0hJOWxnK2lIb1Fi?=
 =?utf-8?B?ZDZRWHh3NGxuRzFZOGFLUmxCaXRmck1mR2NVMmxSS2JLK1hPbWE5Wk1ld1BF?=
 =?utf-8?B?djMwVDhYMjl2bjQrYm5CdGVidWFGaXAwM3pMajhmZ0lWNHZkTlVoNlhMNURM?=
 =?utf-8?B?NXVzQ25tMFJCY0o5WkpMZkE3eUpmVFcxanhWTW9BZTRyc201eTk1bWtiNjVC?=
 =?utf-8?B?c1FJNXg0SkJNeTNoTWRvcWFIRDA4YWpiNjFUQmNpRHR4VVN4T28xKzFqa3Zq?=
 =?utf-8?B?UEZHWEhHeTRjMC9NWFFPMDl5V3NHQWRJSGM5cnoyRFhGZDAxSnhlMlBwWWwy?=
 =?utf-8?B?R0QwOTMyNjI5bm5aazBQUDRKN3dwN21VNi9hcXB3QXJBN0J3YWJZSzNzTFNq?=
 =?utf-8?B?bGpHdk9hMy9FNnV5dDF5V3dzUE9WdDdzN1o5eThJQ0tSN2w4ZjJFMWdQUndD?=
 =?utf-8?B?eGpLYTAzaisvZkR2eWxNeUtzakh5U3E3SDBTNzJhKy9YcUtwZ2s0UXYwVlkx?=
 =?utf-8?B?RmZscnh3d094VGFvRmMra29Ya0wya2psa1dnWUxCN0VRdXRxSFkyQjNHcVpB?=
 =?utf-8?B?bEFrN1ZkNUlrSWgwMFJ4SDVrUURPbHBtNTN6alh1bmZmc1BvMVZ5b3IxQjd4?=
 =?utf-8?B?VVloSytwUjQvaUJHRU1KR29XNEd1MWw4WXBMZ2NlbWkyeGhPVUNCYW9ROWlw?=
 =?utf-8?B?WTJZNFRRYkU5c2lKMWFTbHJseGJyQkRXQkZSbXZIRmZORmRRZFBSUTFVcnRG?=
 =?utf-8?B?ZGlOeUZDV29zZEFYaHNBczhzK1crTXdhOStMYUVVTE1WUzh5cWloVG9BeTlB?=
 =?utf-8?B?alVoaktWSGNLZmZRSkR4cFp1bmxGVVNGWmhzekNFNXVVLzdEcEZJUDlUT1RH?=
 =?utf-8?B?U0RuYU5OL3JVMGtnMG5IMlJLRGpiZTlzRHVLM2JwbjBCTTZicytwdmcvK3Bs?=
 =?utf-8?B?WkZXSDNFSDdpTDZLT1RTeUNKTXlQK1QyQXdtNitacWRyNWxsTytPa3pHNVNi?=
 =?utf-8?B?ODdOa29URVQ5Njc5NGkyNFhiK1NlaUNGelpXRmZqcldBSmxMRkEwZFl0RG0v?=
 =?utf-8?B?Mm8yOVZlRm5Tb1VNNHNjbGRxaUcxU3hmeUJRSU9Edi83Vm13Z013ZjdwVk9m?=
 =?utf-8?B?TW5PdlE2N3VPcFVRSkhWa1lsLzNObGp0anI2a0htS1pYUHhpbzhMRE5oSHc4?=
 =?utf-8?B?MVJWaVBmbGRkY3NKZnU3S05GRzJUQkNJRU8vOWxWOEFWNG1iYVJvTEFKaDE2?=
 =?utf-8?B?VHUwbzVoZTJsTG15WTNOMkYwcy9QVXlmSDdQMFpIUVlIbkdjdVNTQ3NmVFh4?=
 =?utf-8?B?b1RNRk9lT25TZmQ0NWRBaEwxSFZGczB3a0hEeWlXR0FuZUpWWTZ3N3NEcm9F?=
 =?utf-8?B?ZWYvc0VSN3BGTlFraG1PSVBWeDZSOEJ1ZncwSVp5UE16NzRRZk1oL3FscVBT?=
 =?utf-8?B?dUJnQ2w5bkpUbjJZc0NjL0luWWFmc3ZlSjJxYmdmbktLRlNIRG4vdVkyMWYx?=
 =?utf-8?B?S0Y2OGhxamh6YmEvMlRqRk1MWGl4RTQyM1F5RUNmMHo2QU5KbGwvUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d0670c-e995-478d-e0e7-08df0a27427d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 01:53:04.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsUrB5cinDEGhSkIJFSrq0Eqi1vHu0gBVaT+HN9K1MJBLrHCGL8sIleTZ743x/qxCn+7NRtFo14vKCzJ7p+woQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446

On 9/2/26 8:55 PM, John Hubbard wrote:
> On 9/2/26 8:28 PM, sashiko-bot@kernel.org wrote:
> ...
> 
>> [Severity: High]
>> Does this lead to an interrupt storm if the GSP remains in a fault state like a
>> HALT or WDT timeout?
> 
> Well, maybe. I can't rule this out at first reading, anyway. I'll take
> a closer look.

OK, so yes, this is a bug, good catch. This patch series was merrily
reenabling interrupts without regard to whether the clear actually
worked. So yes, interrupt storm if the GPU/GSP just leaves an interrupt
source enabled.

Easy enough to fix, and I've applied a fix locally for it.

Along the way I have become acutely unhappy with the "90% correct,
10% just Portlandia-style weird" form of some of the code comments
in my series, sigh.

On one hand, the code is correct (well, aside from this issue here).
On the other hand the comment quality is off just enough to make me
absolutely insane.

I'm working on it. :)


thanks,
-- 
John Hubbard

