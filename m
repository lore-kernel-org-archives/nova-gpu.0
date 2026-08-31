Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270E83A7587
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 22:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216419; cv=fail; b=V2qzMI5iMXJP1pwSXYUDYJA4LWksMURIMoUBygR4paJuIjrZvxBytxyi8MpFvogmLHUERSh9IAm0SxF31a0JMrok+1hHtkW0kOkJ/NeDEpQHlzpp/DLAA+oLgwDPB4cHIwmZLJ/Wr/F7ziZmJB8MqcIn/PF7aFL/ubqT7iE10DY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216419; c=relaxed/simple;
	bh=micyzv2ZHKU8uVX+zwGR5Fqrs/b60E9s8RpFbNmyqWk=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pty/MTBRv8uQVWC/AAjsWkCbgsi4aLpplRgiMhIvQotwwLyqf5UGk8ZnLae7MELvq+0ltacgrE8OQ6rL9PtM863CNwE5/XratR5VIZgRyUzNDSaO8D9j2onxG/39UByainhvWRykS70ws0mPZyb7iEN+S8bzQ6K05R+t+aFbk7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WuKgsbdD; arc=fail smtp.client-ip=52.101.56.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WuKgsbdD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6FNsZTN3/oOhYRwkWQF5/HV6ZKxP7UyKhmRJj+qzwWRS6dvTkBwzYbIVzt8Z/8P669nOYEY91wOMcNFZsa8+km9muqT0Gi2MDneQB2O20KH1Z+wE75BngIQzkmpTAspH///+qtLuVO9PQWbok2xXUCcceE+b/tVppOQzkwa7+ZMb/on8VjUD/RIYYfTYN3/FuvZro/YvX8sXKYeaDfRpgyt8UREUvFrh3RYNVSKfwhlMRVsM53t1z38a2Q7QfF4s7kaQocSUW5TO+f/bzOC4xLLoIXMoKmyrRZnnIX3S43kR1cb47LE3umEewzP9Cazk0qHLGpkn6GN/v/WuNyYFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6Sm0mIeYucBpGYng/bkPfjzCbFO0k2CwCWXUDAdeqE=;
 b=mFba2J7xyzsu9G8mqE3U98is2IbDJh5/LJtU8+BKGDzEi8IH2kakcQ6b1sweCFgrbQZ9JpiPsFNz/r/7GWq+xLPOrqRxczZw38DMILhCLDsQe4QtrcBgA2hOUJ/i0AYhPGeOJQrLCAs4HomIc2FQoCqMpk9p0b0K88VmRJd6fwVDey4kqotKxsEYGdQqkLQxSKldla+9SZ2yn+ha1QR33DoTmjYhq+pCZ1LFBOg8gGa6Ml9Zfcg96R5f1mWKf4nJuSUyNkdM/W63l1aix31aqiv7SKOwfsXj7HqqOp4F+W7GfPNza3jYzGIl8WIFUanv5TORAYR7Mxy6pXLQY3yuAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6Sm0mIeYucBpGYng/bkPfjzCbFO0k2CwCWXUDAdeqE=;
 b=WuKgsbdDdpEY3VeeLYM/M3OGTOZjqFcW8ubKmYJlauYenN4ZHBGRcMpqSUrsbLGxZfJpb4jq6oz7RGkDr31z8+YRRD+NKPSx/pCUwFjGx/GRfUxrbM3VxsgkcAezkcLVb0VU58uy5y9nKG+s/nbRyor8QF1/IoVlfjUpgHJHzACDamJNSc9THXC8x28NToAsAeD0IV7TFvaFnI2gSCj1q1wBbDZl5IPSSj1x2/TpEiibk7yr6VmvLOv5Kpj+BQ4gjs36NmEgegReZyBP401UfjMg0UqEmdacBDS9trEP9+eplBrjXSglksTs/UyfoSRbYsTASzgDDcPCNxF5Qv93MA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Mon, 31 Aug 2026 22:46:53 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 22:46:52 +0000
Message-ID: <2fe22ca0-8324-4217-8669-0adc336d6a04@nvidia.com>
Date: Mon, 31 Aug 2026 15:46:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] gpu: nova-core: match GSP RPC replies by
 sequence, not just function
From: John Hubbard <jhubbard@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-14-jhubbard@nvidia.com>
 <DL2Q86NR6TJU.3ULD0NQAQ9HF@nvidia.com>
 <d6d3bcba-56d9-4775-9687-ca8e2a0c80ec@nvidia.com>
 <67b67e00-ca4e-485b-bff0-77b2499898bc@nvidia.com>
Content-Language: en-US
In-Reply-To: <67b67e00-ca4e-485b-bff0-77b2499898bc@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8f1166-b9f1-4de9-cf77-08df07b1c04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Jumt0d4tQXPGw8Vf9a7s91x36BUz8vnB91hcWz2Gnt5/sZ+EyO2fCo/n5OerXcv71z8HXpwCfXRUMG5+AICdmZ8SYiA1aYTrkTQL3Y0wJD0tsQ08YpQkkcbUus70zzdg687kc21Itc4j2yuZ49HE6Exao4cYhhsCi2lHoy//moy2UO7lo81WxLoSwr8cEaFBt8OeySnpn2dYK1sCPc4ugEFILmLfwn92eWoIKslCTF9nGiX3WGBZ94Lr6+zFt75fXgll9h5YuQZIaFq8pBE/sIxsoaet0GGiuQ156ViFxoA6bQlaUMwC8xQr+sKU27aI0IVsr3w+0FZpc8WJsJPnEPGvHgIXV225jeV966Oz+xsiFB/8mUQ/QzA+pkReJ2NL7YbCq2/u1H8xInt8lIp4tzsp4aaMW/5QUrWTgmrvsA7jvt/B5ycx7BhyHGGIaroYXnjMRO8B0Me2dEQOxAMvAFoumMiNEjIx0Xkekaime7BgW3cM79OnHumnTb4pNpLLKD6eSGDlAAbOia4+YqiIxwiOiJvbbNySZv8i2Nj2y2kLSPpcHjQmFm2p5dD1KJgVFJaVM6ZoLeH5pbFc8vTn/qcQtiqGzaWUOrLmB3RSAFsnrXcR5cHSg0IxUaMZTManmh6APSARaE0stKEH8oYuUVrX1jsrfzaOSeOz+c4vLSE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YSsxRE1JQkhKVmpaaE5GRFpYYmp4VFBhaEdvNlZpbENxSTVVTUQ5cWVwamZw?=
 =?utf-8?B?OXJSQkZNUEFTSDhMeWpCR3RncXBMZ1RtbTVBV0c5MzhnTmhHS2lIbkxqd0RD?=
 =?utf-8?B?UVZiSTlGR3k3b2ZkZVYvWFBORE1jMENTR2ErRjJjR0QraXV4c2dQNWZteExR?=
 =?utf-8?B?RzhFWTdJbFJKZGhQMGN4OUliK016OUZhTHo1Q2RrUEdnbmVXbU81ZFE1akRO?=
 =?utf-8?B?Y0pzTU9sdURnaEFON2pLc2hwbTNuNFY1OWx2a3J4NU1oaVhYL3V4L1dOQnZq?=
 =?utf-8?B?ckFzUEtldlc1cDR3YVNUUWhUK2NEblBIVmY2T2JWaVNVamI3UGZpNTdqZmZp?=
 =?utf-8?B?azVpODRRUHhkeFBJeE1kWnoxRWVkWjRqZGFHYWpCSldEM3h6SDR5Rm1QUDgw?=
 =?utf-8?B?QjF0VGVBSmN6MW1wbHVpSUx0SEdRS2swcTM0YnZzSzV5a3Nsd1VIRUwzbGxk?=
 =?utf-8?B?OU5kTmxjQzNndzZ0ZnRLY0JwWEdONHdhTXhVYnVqS3A1dUd6cktINFhBVHk2?=
 =?utf-8?B?L1g1UXVFeENMcDFOSkt2clJEbmY4T0dUSlMwUys5YUoxTjdaYllXQ0NNZ0tH?=
 =?utf-8?B?MHB5NldyOUZIaUJjS1ZXbEZ5QjlnUGwyYzBWVzRCQUxhY0NyQ1dXVk1LWWs1?=
 =?utf-8?B?TWVYQTh4MEY3RjlwYlZHb0hIb3BMODNtaUdjSFJHSCtjd3dCbUptb3piVnRF?=
 =?utf-8?B?MW1RNFlWUGlla1hsS1EzaG1YRGpGU0lRa3JsTGQ5cGplTytIMXJuZ3JjN1dk?=
 =?utf-8?B?ajBtUjE5cnF1dnFWQVc0S0dkdUFLaWN5Z1YrVm5BNDJNY2UxNHVxcHYrRDB4?=
 =?utf-8?B?TnNOY09jOTNTTW5LajBkZlBDYyswWnd0VkdvMlpVQURjWWE5Q3VRaVZjdGlo?=
 =?utf-8?B?cnZYNlVDazdjVzhDVHhHRDBCRzBYanlSUjkrRGNoUkZwUjJpWWhpSWxuZ0NT?=
 =?utf-8?B?c1FZMnRVQ1U5SythY3I0WE1RdzFUd2xMUFNFNnNublV4UUE2cFo0M3RaYWt3?=
 =?utf-8?B?ZzFzRFRvWitiTU9ORTlQRXZIVmI3eVlhRnBMeWxTSWtPVFF3eHdqVFFKTUx5?=
 =?utf-8?B?TCtFbzUxUWF0dThVWkJ5SnEzUTNmaXNhdnFBOVQ1UFBteDhySVhpRFdQTFFM?=
 =?utf-8?B?L1MyZkFlRHZlRzFIc3hDNGZWMUxXM3V6WUZ1eURnaVFPd1JYTGEyc1VYMVJu?=
 =?utf-8?B?N0ZvalVKZlF6ZHpoUG1BN0FoTUZTY3pVeHJkaEZUc2ptWW9RankxVyt6b0JQ?=
 =?utf-8?B?T21SSGc5R3AvYmZHbklGQ041dG5ZaktQb1BFVDJ6dDNDa1R4alppRm5Tb2o2?=
 =?utf-8?B?c2ZpN2RjNERlSW83RmtTVnIwU2dWdjBuWTNiVlR2RkNpMzJGYVpaWEZxWUxC?=
 =?utf-8?B?bWUrNlpRMXFjZkdPZFJaVUpwUzZvelBpUVhLdTNFL2MwTUYyOVBPekQzVGc5?=
 =?utf-8?B?UUJhaVQwb0p3aUlrV25lN1AwSWwvQlh0TUNjekZsVWZjMFpjYXFCcnIrZWhl?=
 =?utf-8?B?NzdrbUdmcFZ4UGR0cmJ6dGpVaEM4RkJ0a202a3BJZkE5WW9kdHpGVHJtQjJI?=
 =?utf-8?B?dXlDVWZkZ3JzUFk2dnVVenpGNVZEb0YwMnNCQmlOcFlUTmFMekFLNTh2dmNB?=
 =?utf-8?B?UHdKZ1BvbzFTZVJZV0dPVmlIRmsxYjBHa1hDWFh6UlREWWhhdmNFb1EzZzZq?=
 =?utf-8?B?WkgwN2kyU0lmRDgzcjh1L2lqSis0VkN3ZkxKZTVOcUs2U1BrbmJXek1Zd2ZZ?=
 =?utf-8?B?Nk9hTVNyNW1LS1RxczN2T0swSEFVUkEwR2l6TmJ0b0JTL21zdkJBMWF5Qm9Y?=
 =?utf-8?B?SnlWRWFXYlRiYzZ0VDMxeFA0Z1F0c2xlMUhwclNveTdyNndhdm8rMUpFUkhI?=
 =?utf-8?B?QnhpM0d1RDhWQTBLWm4vYjRmSm43SW1Db1RXbXpNUWVQRVdZK2ZRK3dWSDY1?=
 =?utf-8?B?WHg4K1puQ0RtR0dmWjlPN2tOSWJJbHpwRGNPN2ZLTUVvMldsN3VkNnFVL3pS?=
 =?utf-8?B?VDZLbktlRitaeHdLeng2cDlwQ3k0YlJIRTZNa0tJWW53dGxzdzBjTTlxVVRW?=
 =?utf-8?B?VldnL0pJanZ6V1hZeWFOQ2dOVWtTSjhIQmppa3JZdTlsVi9nbGFldmNSMUg1?=
 =?utf-8?B?OHB5Zk5NTmxYNDhSWm5va2QxbEVFVVF3WUlpWTA4Z2RhNUw2ZGRKdURXV29z?=
 =?utf-8?B?MnNweHRhMTRDMlJ4UnlRYlY3U2FRV09QKzY2aUdVTkw5Z3p5RU92Zk8rbnBP?=
 =?utf-8?B?VGQzT1Z4UjVpb3VRRll2Z00xNjd2eExyM1ZqT0luNVl5SXNnVkxuYk1oTnM3?=
 =?utf-8?B?MS9EQVlIKzNiSDJXYW9XMVRuMmhDaU1MY25qL0I5R29sNHFzOXE0QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8f1166-b9f1-4de9-cf77-08df07b1c04f
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 22:46:52.8565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTKq5+WhIH9P4rxxylv6kKQIbcHtzeF4TVrQbW4+NH2/EcVVZuBp02q20fNnYWYi6Lv3mKGFNGY4y4HD80NZ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457

On 8/31/26 3:18 PM, John Hubbard wrote:
> On 8/30/26 9:33 PM, John Hubbard wrote:
>> On 8/30/26 6:09 PM, Alexandre Courbot wrote:
>>> On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
>> ...

> Actually, my existing tests pass with both r570 and r000, but the real
> problem was that my test suite did not include unloading nova-core.ko.
> 
> With that test added,  I can reproduce your reported failure locally.
> Debugging it now.
> 
OK, yes the seq number matching, which GSP only does on r580+, was
the problem. All fixed locally, and I've added a test to catch this
in the future.


thanks,
-- 
John Hubbard

