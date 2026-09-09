Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011005.outbound.protection.outlook.com [52.101.57.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD047253F
	for <nova-gpu@lists.linux.dev>; Wed,  9 Sep 2026 21:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788990741; cv=fail; b=bpWxdiWaK73DHYTPlHWXfmOYUdzhavs83zt4r/MPf+k7P4SxCZnNC1y/AOtuPjJS4k9cY4n/SpZrfd0D1wbcI2kP3e6EiLKBVxmyePUl5dIAw29RduG2mO7hD/KBJkHDYEo2WZnXz19Xc1GYtt0GTfBA30sXrmyD6JOoufBz6Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788990741; c=relaxed/simple;
	bh=3BbcyaD3zIu1cDUzGdIwWCENdVWPBTH8Io47KeO6+LI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=urZjQK9D4s6EqRMOPLGQaOhSeM0gjxvlXA2otZdwjk7gg44xul3TK73OU+AikXMQB0KQmyj47/HKthk8Q2R9kTIwpZdhen/KEG3TNy5lKuuM1bqgVjg9k22LmSPT6zT4be2QlpsvMRDLQ5L6NbSeuOQlfAX7Cd4bV0gjiGFwAVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z+g+/u2c; arc=fail smtp.client-ip=52.101.57.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z+g+/u2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8e3UYcmsRneSnem1hlO+3mFtp8caUSA2Qna7tmtQyQLwQn/vF7ISzvPzErogNCBD/D0FjMmwESzR5exx5o8J0gxsjVSYivnl02UUI3tQ2dhmsGMmD4zpQoBT2DJZye2MTELzgon/VvVKr4S3to/0nYIJ+BRJsFGj4xUMxU8yBAkOBpFZA3AhhxVEsfAQQQT9DBSv4L+AKRse+zjbw1HW4attKPvP1NY6Eu+RZmJZ1RQSem7FTxeMELiiPrcNRGhrZ3o3FjlV9NGAv4EumH2lnX44NU56HI52MGM91EvISb3ARWtoTsX2u6YVOE/GYH/7hf9s/EwvSS7OeskDnMauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scsaJ8WNz9lL5X0/e8SpnAOx10fZBc3EU8U+nGrc/JA=;
 b=sU3UoZLVe8rpBtPSoPTq1m3NcG4xTRLenjx6LYJTVOHl1bXy7N/ekVoxvM3+eg/OCNdjVY799yTD+EqB2ccaqzwr6xZwr+QfzP1EZOMw1M0YHxRmcgYYrXTYtd6eJ6Q6gN4bM2ZcrxrNySJU82VVKbOi9p57Was0MzGetZWySwDqbW+viGqYVvMzMNYQABzlsFn6/SXNLoJCAjmQLpsF1DneK33i2U+BTF3pBl2fdd2kVo57/yuWupoCsQ/p1kzHtq3fqTVpKVSe1VFHu1bMVpJvsNz9kqvbDNn33KERouJzQVQ11NEIGpQBJHvsx+1Twv9dCGtE02ZnQRUM2PpTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scsaJ8WNz9lL5X0/e8SpnAOx10fZBc3EU8U+nGrc/JA=;
 b=Z+g+/u2cmegveq1CgTB/i14XTB+DUn7M9PgWzp5cjrTaHMqv6CDl3EC2Bq+hnzQyAqLO9KHsmB5eFdXtcwdNfSjwYKa9ofPuLYCURK/00OPDoyuuy63TVYMV5cgtdu5u2abOGq7tYD+G1T8JpIPMbe1AQzKiqRm3u8+MOo3E/e/gGPK0DMTQyCoVKB3yV4S+BMvSvDc137oXw8Ex5OCIZFrWLS16N/7XHIUUHfX35kYaOgJybPs/LMhYE+LG1TMbY6SDHeg6MDhnllW/Ldjafe7/FG2FPHohXtgcIchgs5Aawb1pfDDcIGtpxW/L8eAuubSiXXjIgJSMR0+7IeyWGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 21:52:03 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 21:52:03 +0000
Message-ID: <a2d7e802-7c9a-4f32-85a4-79c3c51b4b98@nvidia.com>
Date: Wed, 9 Sep 2026 14:52:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/31] gpu: nova-core: boot on the r000 GSP firmware
To: Eliot Courtney <ecourtney@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <DL9ZLUVDKRGT.2RN154EKHPKEJ@nvidia.com>
 <DLAJRDMODQ7Q.VQS8G9TRN3Q8@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLAJRDMODQ7Q.VQS8G9TRN3Q8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0122.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: ba82b97d-fc0a-4b79-96ae-08df0ebc94f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	e7cI+J+Vt5JQdhu2L4DLkQSxzoDN7B3oYyYZf1SQReL6tfKpeuvSrw9uyT7Eyw+oAQtTrQElUZjucLXjAM8x8H2E7Wc7ExH4q0KYZJxMagvqsdbFwgj0lt4OZ8nqWGQeofj3us9Q/hA6/KFhvZeKPyjcFEYYeGjZLxcVJistVWpgA2ncwiANOrGoiQ/8XkNkYngfy/HCDZmiGFQlauKtLLrVY/8cUTT0GONKA5An3uf6r2wd76t7LaQELOMfISBMKOB/UV10UH3dxy+1MRJnVfNFZSHLlAzgNzjig5WT4hN98Wlx/bNp9dazhx1fobZQFt/ZsK0F6m4I5L1Wy9WJkKg0WeDtT6i+jzsoSVYk6eM2VowAjVmbuSmgLHxRFlhD/ydc2IqZQvFSoKZF12gVEDg7mxs8Ao8u/ohj7eugz/L9CaULLHeJl2De+kKbY7WxWfPZioZgFEOAv/b4h+LffM3nLRLGIWi4TSrKgrQlvVEyhFVCNvd+0ZOVytP3Pxvhbab9whqxTwcmdUICXhdoopIN7epeRZQhzlwFyUVRj9ScL4BnnaArNZkRFzIMH3i7+CYghgq/gQi52XFOjLladmBIBpECHCA4Scc3fJU42QaRigphyu4a1otRCmo6h3Lp5Wkwynab+vXhVsdX3Dc2eBwNAdGA5GEUCX8eeLEODDs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amM5azNMQytFWEhLNjlwUGErSkZrREpyTVNqbFdHMThFSFNwMW1sS0tPZzdR?=
 =?utf-8?B?M0JsaE5taklqbnFWMkd1MktlZTZRcHFFdkNNTG5VWVowbnB1REFlVy9ialNh?=
 =?utf-8?B?ZllXQkhQZmtsZ1FyWEdSaEoxeE9JYTAwemRnK1g5UENPWW5uQVpQSXBXVnJO?=
 =?utf-8?B?SVovYnVnejFtdUxBS2c5U3BLZ3ZmbGdwREpENS9HWlBLZWEwRitGMVdwSzNo?=
 =?utf-8?B?WDAvbm1pdG03VmNlTFBTUFpuTXliNUgrczM5dHAwZURnUENOOEZyV2JFZHFS?=
 =?utf-8?B?NTNIVC9iTmdHaS9jRHFkT2RFclFEa0thdWkyOGc5QStJbzBaZW5ic1A2UHZS?=
 =?utf-8?B?dVNNTDFPektOOHdKT3RmbGtTcmZBS0M1OExaOGlXaTQxeHdjSlN4ZlVJS2hl?=
 =?utf-8?B?NVdlTHozQ285YWhURVpPWFdCdFhjeXlEMG5hL1N0SUNYSWFPUmMydnlZMEc5?=
 =?utf-8?B?S0pGeWxEZDlTb1ZsTDFxYzVLMmczZ0xrS2svWmx6NFNXZnM0MnNGa09jTXNI?=
 =?utf-8?B?a3NDU00xUk9tL3E1eTJDSEhzZ1NHeVVTMzErditJaUpMV3pzU1hod3orRTNt?=
 =?utf-8?B?VHU0VFhkN2hYaHc0ZUwvS1ZYcnVKd2pmeldCUSsyYWRnVDA3UGZ4cXJ3V1VC?=
 =?utf-8?B?L1h5VUFSZU1XSDdpOXJuazhpY090d3dYaVFDekVTWFlEWi9wZDcrOEhvazFK?=
 =?utf-8?B?NGhsWEFuY1BMMkNpZlV2bmZZaXFQN3ZNTTd1MzMrTUhUeTZUQlVNOGtUQzc5?=
 =?utf-8?B?M3hQbjNiR2VTVk8xbjlYemNOcDRYT092K2dTcWtjZUxGODB5OCtlMjVyY3ZB?=
 =?utf-8?B?LzV3bTZwQWc4VWpNWk8rVEVrcXJudkc2RmpEOEgyZ2o2akw2c1VZL1Ryem8x?=
 =?utf-8?B?WVJra3BtYlVTcUo5T0RmMDZwa2lFV3RudEcwSytENlJTVkxaZ3lsR3BMa05X?=
 =?utf-8?B?eDRHdnpNd0hROHc3NDNwM3NvVloyQXlpL3hEUFMzeWMvMUFidm8yRWxZWHNy?=
 =?utf-8?B?TXpWaHI4ZHBrR203Q0dDUU5RQ2ZpQlliWUJOcDRMT0FBelJadmVpVi9FTHFJ?=
 =?utf-8?B?QmhobUd5b0Z2SWFqVXNzZ3c3c0IvWW9IV0Z4R1krNXRWUGV3bG5WUG1Cc24w?=
 =?utf-8?B?TUcwYzhuVXNlZFU2cGpHTFRSQ1ZaWTdndVJNOGVBcWJRM1JKQklvbUozREZq?=
 =?utf-8?B?Y3A3UC9PNWVwdUE0WVppNWQ0UkpYN202dmdFdHM0RVdzVEpTSDN3MzIzK3FB?=
 =?utf-8?B?bGVNRmtKNjMySnRlY2I0NVlMd1UwV2xBSmZIa1kzWGRyR0JNbWpVY3FXVmZB?=
 =?utf-8?B?bDRWakZPcXd5U3gvN0dGWm5BQ1FxMVpaSUdQdkRoTUttQXhiZE16K0pqWFhr?=
 =?utf-8?B?QTA4RXlOSXN1cE1ZLzlhS3dtZnIzN3R5YjU2NWlJU201MkJqSlBqT2RSYW5p?=
 =?utf-8?B?am56b014Y2VPY2pmcnErVXRSQUhkSVpXcTFKSVFvSUJqVjlhcktIa0xCcWti?=
 =?utf-8?B?a0JXcTNuMjJjZTlBc2JSM2R2RCsyOVdrd0dxTG5wNWpKN1ZTdkZKY3pPL0tx?=
 =?utf-8?B?cFU3cWZIZ2EydGJ1bXYveXorR0VhYm8wNjdPbnZXZGN2YVNRazc4ZVFvdmJQ?=
 =?utf-8?B?UzFyV09BNEk3VCtRV2p1bW9vMEhYd0s3c0U5M0RyeDBTRnVrT2Nxc0YrY2FW?=
 =?utf-8?B?WnVYUTUxR1ovUWlyL3dBRDlCclRZamNaZU9jZDMrSmNsRjJKc0g1dlkyUWhH?=
 =?utf-8?B?ZDNJT2JoWGlqcXZUaCtmSEx1S2NYbGQzbityT2oxMktDMlAxa0pvMEh5ZUFp?=
 =?utf-8?B?QnFZcCs0Wmg3c2J6R2JkRU4zTGVCazAxTnEvSEI2a2tNb2d3ZWMwd2p6dC9Z?=
 =?utf-8?B?ZUhpaHZab2szNFlnVmRlTHAzNXM3aWNJeFBiZXBsV2lCbm1HZWhtUWQ4WWRS?=
 =?utf-8?B?RUVjWXJ5dG5DRzFJWmR4bnN3NUhBY0NUZ2FrNlJzdldKclJZcVR1cmgrOWhn?=
 =?utf-8?B?Q3BlWkk5UEIzTElDckFEbWxZbyt4Ni9wSVQ4YnJIbC95dHF1MjYwSWNTWVNB?=
 =?utf-8?B?QlY5QXRuZkpoZ1NEeWFTQ0tZOG5kM3FUbndmU3I1czROT2pSaENVVUtWSEFz?=
 =?utf-8?B?S2ZGbm5zbkg3blJHNFc4RHZGTW9IdXp3ZXFoRkY0WlM1L3JHTHlhaGFycTho?=
 =?utf-8?B?dmIyWFVWT2wxWnp2eWJKamJsQkhkSkp3QkFvN2lRemh5UGk5RFBqRjAvdGMv?=
 =?utf-8?B?MVRhbCswc1lLUTFmZWovNXFDWXloZS9xakV3QnFQWUgvNHVkS2ZTRnBsREI3?=
 =?utf-8?B?cDV2d05QdjdaUFdIc0VsZWNiZHF5VmlUUmw2TjRrbklpOXl1ZFhGdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba82b97d-fc0a-4b79-96ae-08df0ebc94f3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 21:52:02.9886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAOgfXtJ06hYjTEGlFmONtjeUp73+qKafY/5llmmiv+kQPwuDtxQUNO9riIuIq1H0d30lrA+Cc+Jui3EYxj+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101

On 9/8/26 10:47 PM, Eliot Courtney wrote:
> On Tue Sep 8, 2026 at 10:59 PM JST, Alexandre Courbot wrote:
>> On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
>>> Hi,
>>>
>>> I'm sending this just a few days after v1, which is soon, but Timur Tabi
>>> and Zhi Wang reviewed the whole series in that time, and that led to
>>> quite a lot of fixes and lines changed. So I think it is helpful to
>>> provide a v2 now, so that future reviewers can avoid rediscovering all
>>> those issues.
>>
>> I only gave this a high-level look so far. This needs some reorganizing
>> before it can be properly reviewed. I think the size of the series can
>> be reduced by at least a third, maybe more.

Not according to my latest math. But I'll do what I can. :)

>>
>> First let's keep the series focused on r000: patches 7, 10, 30 and 31
>> are dealing with debug logs, not r000 proper. I'm sure they are useful
>> but they are technically a different topic from adding support for r000.
>>
>> Then there is a lot of churn. For instance patch 28 removes 351 LoCs of
>> bindings introduced by patch 2. They are not required by the end of the
>> series, but kept as dead code after patch 26 because (IIUC) their RPCs
>> are removed later. This is one of the few cases where it is actually ok
>> to do two things in the same patch: were they removed during the switch
>> done by patch 26, their bindings wouldn't need to be introduced at all.
>> Actually that's how the sequencer is treated; I have many issues with
>> patch 26, but *that* one is ok - a bunch of deleted code is the simplest
>> thing to review.

I was wondering about that approach to deleting the sequencer, so good to
hear that it is readable.

>>
>> The msgq v2 part also looks more messy than it needs to be. It tries to
>> keep both versions coexisting at the same time, even though only one of
>> them is ever used at any given time. I suspect it would be simpler to
>> implement the changes as part of the switch. Or at the very least, let's
>> make the cmdq generic if we want it to handle both, and place the
>> differences in sub-modules. This should also simplify the receive path
>> considerably.
>>
>> Patch 26 does 5 different things over hundreds and hundreds of lines,
>> that's more contexts than a reviewer can hold in their head. This needs
>> to be split. I strongly suspect (more an intuition than a realization)
>> that a good part of it is actually intended to land in the
>> already-existing preceding patches. Other things can be simplified: for
>> instance `Bar0` arguments are added to many cmdq methods, which was
>> probably the only way of doing when the series was first developed, but
>> now we can store a `Bar0` in the relevant struct so let's do that.
>> Actually the `Cmdq` is probably overdue holding one.
>>
>> I'll give a deeper look at the next revision, which I expect to be well
>> under the 3000 added LoCs (famous last words :)).
> 
> On a broader note, this series contains several chunks of functionality
> that could be separate patch series and reviewed separately. I think
> we'd be able to review this faster if it were explicitly split into
> several series, as Alex noted there is some churn / patches that could
> be put in a better order.

OK, I'll work on splitting up this huge series into digestible smaller
patchsets.

> 
> In particular, I see these sets of functionalities that could be done
> separately and in order:
> 1. MCTP transport + cmdq transport
> 2. GMCAPI cmdq infra
> 3. Boot events for r000
> 4. Boot using r000 - that's systeminfo+staticinfo stuff
> 5. Migration to r000 + removal of r570. Ideally, the migration to r000
>    can be the smallest commit to flip from (uses r570 for booth, doesn't
>    use r000) => (doesn't use r570, uses r000).
> 6. Misc debug log stuff

thanks,
-- 
John Hubbard

