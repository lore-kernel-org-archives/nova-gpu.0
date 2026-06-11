Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012007.outbound.protection.outlook.com [52.101.53.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC54A3B8413
	for <nova-gpu@lists.linux.dev>; Thu, 11 Jun 2026 20:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781209740; cv=fail; b=ugCc2ZgeXz/nSeU+muoWzzYDfG0p264Vt3cp6l32QtZX+ZBlFz4Wmne60K/4Pi5xSCGARLwF2ofaqgRk13RdWiZP0NjAq3Hrj+/EuzvUWj1EtUEpTVKD339qsVXUcfKg3BKNIi8JeKfzQtugPXMYaIqWyKYVtnR9XWv+XXCz+Vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781209740; c=relaxed/simple;
	bh=2fNyJr6IMg8xBiiqyJ5YOk5dPJa0vFAquHstQA+b8Gg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HQrAi4Zx2qVmF0aC/2zjMKKksbDJjMbJd8zMJF+HfCnIEFoDrXaF00sAd9iyqIlfqRpv5xUwB3hnapFBlMb7RlWmirvP2sIOkwK73V94nkBMgYce89I89ZHBcaLvHSJwDaGpkOn097DHrQSORrIlsu8iygj1a1lL6MRaz9rzIME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HbeHm0FV; arc=fail smtp.client-ip=52.101.53.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HbeHm0FV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyJ1IFctvwjLRAPpLo0uoBW1C0W/6EmssNsU9n7EheMtLw7BKymXf2ZW1JqLzRVoPK5MRItehTgLfYK3Dv/I8uM4IcSNp95ecMIJ3t/m0XcoLm49hSb/LKvK/aLRDaN28pkz/XlVo24kHKa+0xCTl47qKv7Epp79b9buwa4yDOyDPLDiELDZzCtWo/y0rDcX8H21EV2n6UdD27eqtyGDZmJMFHiOiphufCEIULdq/xHWqEo0m0lDWN/M0tYbflWhBOarSuCNuCQlLhYD/fr9OGOz8HEiYHQx6NEYFtbv3Tsh0F+p2KED7+/N29BiJFDiLkOIaqVdXai8KSGOYaHQ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsEb9qElUCTQbnd3QEk0Ets+xa6Y8WAFebC4TfnqzeA=;
 b=IuH4KJgUs4lV9ip8WSGbPxiTJU9b0M5LH9VNv5nRT9OQ/bO+s01gMrFWDW4AQ/R1aMyO+E+5sEbFTj+4lopzSf8lcV9qe+sxRKrJxqE6ne5AxWiR2GtTLQXOCOQaGQ0W1Xx/MlDWTXgBq5WZjiTvaj28GHPyHdU6vqwIC1MCEQhGRohKTyOCvzSXC7Y/19S/hbMjaL9/DCI72SDHezPRgMKqG9WzIBf2NqaMb2uXTzGljsn4SHQceZhc/pAfOVyNoB1cG3tv6/cefHVmbdEsqRQvOw29XIPjmRWFeLwohvu8KV6pKmgEfGpE1GBinXsU6obMnl4zSeoelhefnvWFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsEb9qElUCTQbnd3QEk0Ets+xa6Y8WAFebC4TfnqzeA=;
 b=HbeHm0FV/AG1kMyJHKM503bypX5ChrjdL5uBGR9O2EkDkvM8EIJEXJM19ZfM701tYxG9tsfXTp4QlTJcxD/y/q7B2MAgqbPlv1zIloQO83IZs/jIQjDYEDYkVGXM/heSXs0ezN0XZp+DNw8c4Fl1lOnSHVUQgHLhfPU7BQKlSQyu/BqmnoY94UgK11OmZxAIQChHXqaNI4U2sOrMAukBT/KuWHmBvpM22Dkabx+/QYiD8ZTng+WZsaOBfDUPz+CjdZO7RIIcCxS1/urtzIkBhLIQdZO5VwdnTBK6dyIJDlKbkI4TKHQBu+jE5PnVFmSoJZ/4ebx2utKMQxha4G45Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 20:28:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 20:28:53 +0000
Message-ID: <54b9737f-91b9-4829-8181-7ca74bd33fae@nvidia.com>
Date: Thu, 11 Jun 2026 13:28:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: clarify FSP ordering in the chipset table
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
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
References: <20260610234128.547952-1-jhubbard@nvidia.com>
 <ccf5f6c3ecf84151fac418cc026be318db7099fa.camel@nvidia.com>
 <9cb7ec57-8084-4c0e-ae08-ee48c0a4f49f@nvidia.com>
 <3507a37e3111b8de7cc921cc346c66ced20697f0.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <3507a37e3111b8de7cc921cc346c66ced20697f0.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: c621c013-069b-4880-57aa-08dec7f80de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	OdIaMThKWtN77E0l0rTM/Ief2PikzyKhHIvvlaBsfXCM6K8TO5eX/LGyUNPXDJtZIemIZ3yMzw2bqg74J8SBYqx8b1FlEQ9fhQ47d67RFrzR5fp7VrxMJzeQxCqKNRZLWo2+u840K9+tpOYO1sgx4s0V/UUltt1rTyjMRiyT8WpOcA8DvXVG+366X/rWDGGidweb7Z3r9jwdhrOQ5CjKuyRpBQUHpvM2ro4bs1TvHKUzR1Z82CWgHk8Az9/BQKte0LB06Ioqdw8op+s4uFsTkB2nzOWHUcLM/cYnn6Ze2E1Sa1BTSUGY5Bq0M5WF8IxXgbIwOmI4mKtkAHWwq7/wHqNWhrnEJRyezZ6KartwRJFQn5ReuKmG8WiqO5NCzlxw1M/jg3kYap8soAz8KvhhxOcMN95y+SfwynABPWNtHvEDHO3G3W6iyR9cHYsvKPM7T3ZMqRl8+mC97SFLUMlNst0PJ4aYBvKbvbATnbYUhzYGm0FHZMrKTxMOvVMMTgrHGL46RrOtR0y28dCHLeih0hsdujkwajegNY+vZbjFftYf2CP2OTZr0QVeU0awlJ4oe5aFrB4bHSW0gjWtBmx3fdBjMonXZsV13xouu8z7d/fok6RbVLuxmEAMIL2HazZ7iFnX15COJCDZk0KVaanWJpHiqUbBhPmYVYetWe+IOtSBg4Wpfbml+T4EhMJiSqhE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkJQMjlmNStyZXBWU01aMWVpWWJZVElmaVNubm1va0VtWWsycEx2eWZkeEc2?=
 =?utf-8?B?TlVTcEtGUXdoQnVtamI3Z0VPbGpwaE5reTRXeUFRbFplN0VNU2VXUDllSlAy?=
 =?utf-8?B?MnlsdjFmU3hiOU9Yb1JXY0t1dXl3Nk4wRFhxQS9pOVBOZjYvU2RnS0hEdUsz?=
 =?utf-8?B?UXl5YVpyWmh4TmdZeTBoajBmZGEwVUVpMDRzRnMxNVp2RU5SYkpmUEVYRjJ6?=
 =?utf-8?B?OTNsTy91ZDc1Q04xYktEMDhDU0NpVWsxZWhjNmQ5ZS9haFU0S0xrb0VNaUQ5?=
 =?utf-8?B?VlNUQmVrbWVYaS9iSVoyZlNJWEcxdUI2Ui95eDVHb0Q4eFE4TytLOEhIdHNo?=
 =?utf-8?B?MStudm9qQlY4VVlZRWo4dlQ2ajYrQW9FY0xTR1pYVDRLTDJmZTFoQXhKZDdi?=
 =?utf-8?B?dXhWeWozQklUWlZ0bEw3MUZKZVpTb1EvSHl2ZWVSSzdYamdyVHhoTDgyK1kw?=
 =?utf-8?B?N0k5SEpCSzc4d3l3VGFjeDB6L0orU1Zza0h4MzFrYXJXUldPOURDRTRVaUtS?=
 =?utf-8?B?dTJBZ2dBNTlXUXE2cVc0Wkk1TjFyZHpPeEpTSVZCRTA5UTVxaDZ1SVVoK3Bu?=
 =?utf-8?B?WlBKem9lK1dUdzd6UUhBZWIzMngyM3hnS1ZhQStwU05mNE40MExWYTJvUWV5?=
 =?utf-8?B?MUxJM0lPS216ZWVaU2J0ajJENU1IUTFIYitnWktvbHhUOEE2elFiNDc4d0o5?=
 =?utf-8?B?c3BKaE41YUFLMy96eUVVOTRLKzREbWlhUUhjakhES2dYTi95QlRVUWxmY3Vj?=
 =?utf-8?B?WWVqVWd4SEtWZVdNUGhqVUJsSVJ5RHQ5MlNCZ29veWdqSHBQUjgzcUhhZGJB?=
 =?utf-8?B?YlRwSkN2bUUyeXZ6UDBBMzk4bDBlU1FWMlJyZFJJTkpyNzBqSHRuK000R21i?=
 =?utf-8?B?SFhoNWJpWTFuS3NjWDJ5MzhJbHViL0orS1g1RThZUXlBYlhSeGFoYlhKOWVx?=
 =?utf-8?B?bmVEZHIrblhpekExS3BhSDgxeUJseEs1Z2N4aS9DMHhPT3k0TE01UW1iYXU1?=
 =?utf-8?B?aVB1S3pQOWdyNHkrNHRDZWg1bkZ0eWg0aG5IaHVtbEJGd0h1NE1uQUwrUHM0?=
 =?utf-8?B?dWxSaUJnTnVPRTBzSENZME8vRnYwSmdtNmpTbGZITU5JOXM2QmJLaGhPQmcw?=
 =?utf-8?B?MEp3dzBwcWFzQzlydG1Vc20wTW5EK0NlSEI0c1ZhbnovTEtzRk5vV1B4dXlt?=
 =?utf-8?B?YUZJSEhUMkpocDdMR2Y3N2JpaWQvbTliUlJxNEp4R2pHMXh4M1pIUXhhcm5C?=
 =?utf-8?B?VnVreFlmbUZlOTl6N09xbXFEVlZOUGJjMHRXQWFJa05LUWxHTE9oZEQ1eldn?=
 =?utf-8?B?NmdIb3JDcHpGY0JmdHAvdTFkNlRjQW5CTVlHZTZUdDl2KzhZM3EvZHpwT21V?=
 =?utf-8?B?NmRvWTc4VWxwVVcxYXFNWUhtb3dHNzRCYk15TzI2YloxeW12bzVXak9oa0Ju?=
 =?utf-8?B?YVZ1QllzRFQyM1IvVWZRVnRXaTJrUTZOWXR2TVJGTk1NZjVUTkxpZzgwMWc0?=
 =?utf-8?B?bEd6VGxUejFCR1VOaTMzRHRNY3U2RjVCbUYyVjNmRGRuZ3dOMWF2VTZ6Q1pZ?=
 =?utf-8?B?SWlkeE5nUkNqamdUT0U5bmUrRDFycWVWOFA5NFJtdk9Od0R5VXhqVzhLNmFi?=
 =?utf-8?B?blBNU2pqamZGcWZ0bGJVeThpa3YyUWp2cWFIZ25VNGczSGVySlo1VElpRGx2?=
 =?utf-8?B?clBXckVCdk14YjZ4a21kdWRoNHVmbDcrRjhhQWliZGpSblVaNXF2dDM3bzRG?=
 =?utf-8?B?SVFtMFBIcC9MTkw5M2s2RzNCdHZTeWVvTHdXR3pGRDMvV3RnZEJkbTFja0lP?=
 =?utf-8?B?UHdmSzd3RlhlSi9tMTJ1SzYwMk54SGRlNWw4NFduaURjR1lUUEtoaUFJamNP?=
 =?utf-8?B?UEFzSStxWTQ1VVJjWHlSV2QrNE5xWUpLUjFUejF3L081K1lLYVZMV0c5WGlG?=
 =?utf-8?B?a1c0a2l3elFDc2tWWklPTlZsbEhrVSsyZmNSMER1UEc0U0xZeG1tUklmN056?=
 =?utf-8?B?TzRyTDJHc3Rhc0xtMjR1QlNSeDFSZUlaZGJGVk5sVnZqV2VNTTdZbk03ZG1s?=
 =?utf-8?B?REZqNDBDVW5FaFJNWnE4U2lGYlBsSU9FRVZCSUN5UEFZREdnWmErdGg1Zita?=
 =?utf-8?B?SlZuL3NqSlA3dWswSGc4UFhDc3U3RU5XVFpyWm9yN2VaVDB3UGovS3B2dmFT?=
 =?utf-8?B?TWIvOGhTSG0va2lFakcxb0FOUFRlNWhrR2VHRFY0d3p4TTgrY2JQL0haMkNz?=
 =?utf-8?B?MVErYWtFZ04ybXZMRzJsRUduTnpOVUY2YWlhMlZsTTY3SGdKMUQ4R3JYa3pW?=
 =?utf-8?B?NkVRaTJ6K25XaTNsNDNZdVEyekFTYTI0d3BldVRIM0trRjZoWG4zUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c621c013-069b-4880-57aa-08dec7f80de7
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 20:28:53.4206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ugy4pI87qMHHKqUXlwpPK1uYPJSyTrVFHgZlfeNgCaABAf78Xk0VxJxsIsx6bgV/XcjMfQOB3STTmRHaXYZrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236

On 6/11/26 1:24 PM, Timur Tabi wrote:
> On Thu, 2026-06-11 at 13:19 -0700, John Hubbard wrote:
>> +    // Chip IDs are in numerical order, which does not match FSP capability. Hopper (GH100) has a
>> +    // lower chip ID than Ada (AD10x), but Hopper and Blackwell boot the GSP via FSP while Ada
>> uses
>> +    // the older SEC2 booter. We therefore consider Hopper to be after Ada, so "Hopper and later"
>> +    // means Hopper and Blackwell, not Ada.
> 
> This is better, except this will be false when Rubin is added.  Since r610 already mentions and
> supports Rubin, I think we can safely say:
> 
> So "Hopper and later" excludes Ada and just means Hopper, Blackwell, Rubin, and everything after
> that.

Sounds good. I'll send out a v2 with that.

thanks,
-- 
John Hubbard

