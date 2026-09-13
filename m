Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010015.outbound.protection.outlook.com [52.101.61.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC742315D49
	for <nova-gpu@lists.linux.dev>; Sun, 13 Sep 2026 20:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333031; cv=fail; b=uwkLiVXc7OFbU11ZTk/dZnA9A+bctysE5ZpTbMWI5iik7ncG7BfG+lSV16KwADcWZB7hAWbTaEX3zImhjL3rO36gIrci8Rg7nT8dDHYO9XXTb4gvrlFZkLkSvidFs9hnyh7C1kFqyYVjyduWSSdM6qWV9C5PJRuymvh12PmCGNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333031; c=relaxed/simple;
	bh=BdqvZNZ+ncebm+Lt8i7LUkOf1OqfRqEsarQKsi9j5TQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dEUUfNvB585Ax3GkKNnwhTp2/WQs+qtHZgvOcbETEtHYt1d0w5rxQc9nZ5pq6sceG3XupCRHbD976/W2Y87ehv2+HtQLVJQ8+JW5xPz/liJTN6xusyUFEPeqXiuWw0g38qe3NbLMWeHdoc1atv3+CREJuYVs1AB1sOS33Vyp76M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TuBk/Ouy; arc=fail smtp.client-ip=52.101.61.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TuBk/Ouy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWQJ1Wz26xaGFsBdc26h90nq1AnaSAw4WbHm1G6tbyGSTJsyWlaSEUVlEyuUB7OneXXECHXFbF4kqVeVAoqyYdNarNSoaseZ65jz//KB/uiiHbNBrZXLmp1lqLF4tCCW640yiZ7DjtoaNFgC0WjHZu6ccMOc+Xe8ByqC9fUdo4TJRfbsqoc7u3F1hKLUxoczdEdk33oRebmZX/R4IC9T39FmpHVAvbsZLCL0RxS9hXFL3JpKw+w4OQgXAKbL9IJkgmeig4M4YuRr81xd4tT2Ld/pDfJGgWy8xSh+Sf3AhylUjfJsDCNl+yFUVa/ZHptumee4bdPCkK3FbNBbC7qYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdMR+Lv+orPQHdowxuvkPRkhDe3L4XiXq1k/d0XgslA=;
 b=acAmNP4vWZUVSj9l7eQCVeSwfPHrzsGO4j9r/zpF4xwLzTaZcQqsSpsPHmXtXpHxLGeDibCjNFFFbrPzP1iFNJmrZP4P47MPbhkwI8M6X3L1cH4ahtYnekeT0XkDGWmHiUg63uqJ2uuTVMXHAksM2GVmDAJJHtlPChBIQuXAnNuyQNLS+ImnplKWpIM7b/zvBsJe/fmK6Ka60nxu2twZIGySvVChLoiG3TI4LtFKtfAkv1497Q6+4KZsFigWmOeXwBWvY7QRZEOmhKV7ACsYW4IJkA1b2X82kd6Yw5U7yWJiPEyM3YtaZHErYj5GgJPKNUelaWdJIeM+FcHQPKcIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdMR+Lv+orPQHdowxuvkPRkhDe3L4XiXq1k/d0XgslA=;
 b=TuBk/Ouyfwb/nKuilR02gwtmKq/Uk6OMUfWBQ+7yxA5IVdnHtsibue43o12DC0cnByxcEgn2EM44OubEQ12kqATC86IC5DoO3NJWUY8p6IaKTIaQNfQapvoB7BYSLZm2nRWTUBwdZwxZqy1+e1UN+RN+pr/fMUHfjqLOcD0bsGTva6S+qqM4yBmQP+gxzsWx7MxqLPeKAk6uQta2+C/YGUBjW5fyuAg+0GdiBZFLEa8yeB5j8V27GhKZo7Whq+cno0C/DqyeBWMNiXQsBfMlNFyBKMn1ishVV9sjoSt+5pt55D4G1McYoP/srcuo7sCLxjVadg5DVEYTStOEnVtalw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Sun, 13 Sep 2026 20:57:01 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 20:57:00 +0000
Message-ID: <edc3647d-62b2-4172-99be-7bce01eb3ac7@nvidia.com>
Date: Sun, 13 Sep 2026 13:56:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] gpu: nova-core: extract radix3 page table into its
 own module
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
References: <20260913195413.742143-1-jhubbard@nvidia.com>
 <20260913195413.742143-2-jhubbard@nvidia.com>
 <DLEH6H1Q3IPA.2WVRSLX0LL2F6@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DLEH6H1Q3IPA.2WVRSLX0LL2F6@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P222CA0016.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::7) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cd0152d-6636-4cb1-02eb-08df11d98e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|1800799024|376014|10070799003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fYtsN+70wNVwJ8Owe+46tcj4vc8EV2VHgD4Hy1Rruc+6JJLuV4ZKdib/8G0C3eOSlYGzGLqYR67J+brCriAWj5AKStIObMCHV8wBiYJZCvILfv6F1Xkro6uiRvLynmaHrbYHNC12kI4W0Ze5WtxMNTa+OIgeaSGJ/Yt7UwoBbrrVOGoC0KCq4OkooyxMX0kXTVCxI1TGpcpe0fH1eOnTcijj5YieKCb6DQaEmn4LgDYvda3vRTRtoz/Dq8LBEPdWDfutJ6oUhJUiiPdijuXAxgEYQfVOEJ7cLD0prjeUwXZcm6kqGUWyJTnY+h8hPA0hLyFNHvsJYSEKk1jGMQsCoaTv6Uexrq0FD+9NEP9DG+DAk1HX53RrcyzBTpCGxO+1uUkUS5ty2QLgMvpBVUiOXRXt4z3iu2pnBNrnBmh1QLBxAlXLNznCyWh6J+clNtD3s49afr0pqgzLxLm4Db+Pvv85pYkwny2lH7fyBEUsD9SxRBFSbdmR2jkA4A0eLoZGlf4CSmDZRcKHWuA8X6QDH30DTJmIrCMvnoUmWvKrqBEaILFej92Vjsz4DoB69tMNRfvTswFWlhI68Une3u50/gddrM8OASy5xUBmLu7M7QfHzCSC5shFP1Olnhv3bxWhRbf6fMVNgPCtkxtQmsHsqgbspVUwLKSTKlBQwvR2tK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(1800799024)(376014)(10070799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFFjZDdtWUY0MWVmcHlqYi9ZQjF0ei9YSDlWNE1NcEN6SUpHK215N2xPamx0?=
 =?utf-8?B?K0x1dldyMHpBSkQzaWxvREZvR2NKanc4ZUQ4dnY1K1BCR3FRTTRFRGZCdW1y?=
 =?utf-8?B?MFZ2TzlHbnRNZmcvWHhJVklrYkprWnJFZ3MrTTNZZVBUQWlMbzVKZUg3NTVF?=
 =?utf-8?B?TXpCbmRRYkdTOFh5Q1NQWm5nMlZXaUpzSVVqTG5icVhVRmZZYnRlY1VER3dH?=
 =?utf-8?B?RDlvcWNTY1FGbUJGcUFLc3phaG1UNUZieS9wcVFYY3VVb0NiMjVKL2gxcnVV?=
 =?utf-8?B?VHVTZm5mNi9ic2R5SWJIeHpYQkkweGQxemd4ZEZ5SUhXZ3dGQjFqUjF1UGFv?=
 =?utf-8?B?aWNvVmJ5NVRvaVlVdDE5UFQxUVREU201dCtqa2dyNWd5ZWJjTFZBVjk0NWhX?=
 =?utf-8?B?ZDhDWmZFOTBObUNDRXdNV1AzSm9HTXMrUS9UQmRtakJlV0VjTjE2Rk94anNj?=
 =?utf-8?B?ajJDYU1RSkJKNktnL3VxdVZoNW9wNUVnaEJrSXp6RVZ2RW94OVhiOGdLWVZ6?=
 =?utf-8?B?STdyQ25LNjE5K3dQQVpHWnFBTkFCRExOV3k2V29QWFFFMU1MSHF3YUx6WCtI?=
 =?utf-8?B?TXB3ZlowRzNiRlBrL0RNSjNhK052d3luaitJeWliUG15cXZGNjBuMkRYZVZj?=
 =?utf-8?B?bnZJY3BxRlJENWdiaGFOdldlRG1NT3Npa0E0dXgvamFvVEQ4a2x0YzBsTEUz?=
 =?utf-8?B?b1pubEhQbENYWEQzTHYyK1N6RXY0dlYzTEpmL2htM3RQVVFVVHBValgxNU85?=
 =?utf-8?B?WUdoMFVvK29FMXJ1cFNTcnlqQzhWaW8rMy9YelViRjJodU92Y1NJb21WRktT?=
 =?utf-8?B?STBPNGEvNmF0Ui9FampFUHR4aDZQNU1Ta2tJeFhrKzcwRGZzSDNLT3ZGclNJ?=
 =?utf-8?B?amkvYSsyRE5WdzZ0TUkrSW9aVG5XenhDaVl4OWhVSnp5NU1YTDdkNXFTMGg2?=
 =?utf-8?B?VnVMM0liOFZqUGZTM3JQNktJL01FSlZta0JjRmN3dVpPa2p5blRYY3BmSW83?=
 =?utf-8?B?bjNId3creTJPeHVscjVHT21vUkpOZ0svREVjcERyenhZampDQlRlUlJiMWJu?=
 =?utf-8?B?Z1FxYnZkUmtvYVAzZ0IwNlFmMkFGUHBPT0VldFg5TFBmMXFQRGZXOHZDTmRF?=
 =?utf-8?B?WkN6dURCQ2xWa3Z6RHpZek9TaFYwR20wTVlCMFpqV2NNenlsME9OZ1Q0V0RK?=
 =?utf-8?B?dUJ2YkNBbk9zTURiM1V6TlFyYVk4azlBaHJybzEreDRmV1NUVFE2TTlwK1ZB?=
 =?utf-8?B?cWxrcGxtbnYvMWY1N3hQSEYyb2N3U2xpMWVZNFpGa3lZR0FsUXRUMHd2Vkhi?=
 =?utf-8?B?S1RMMTVESmxMVFp0cXlUTy8xNHNiNFpaeFFoNW5tL3Y4bFpadjVzb1kybmMv?=
 =?utf-8?B?VVVpVVNYWUxId29EcHFnMERnWmt2QmdYdVRrK2FTRUQzVjBnVWFHUVh2QXA4?=
 =?utf-8?B?SGQ4cXZVQWJtYVU3RVZ4ckdNVFVuamV5RCtPOFhLdk1TYmJQT2x2MEg5Mkpn?=
 =?utf-8?B?aGNURUw3cW44WUJ4WWFWWmVZdC9wSmYrUk1pcXlUUzdBakt2MENNQVVJY3g4?=
 =?utf-8?B?NnVpUUFzenNnMkFWZ2lOWGVKK05SQVNxN3ZXKzhNYUxsOXozS093WG1mUFpv?=
 =?utf-8?B?WkgzYSs4aHFWWmdwREhFTk9wNzN4RVQrdGs3Z0plYVZqWGNUK3Y2bnlQeG9K?=
 =?utf-8?B?TXhWOXI3T093RGJLMEEvUEhub0VoVHJ4ZG9wVFNnVFE3V3YreDZ5M3BvSGZr?=
 =?utf-8?B?ekdpdUpETlVTbWZOcy9jNGNZc1ppVmRTOXBTSDhhWC9XNjI0aGM1ZUpXY2gv?=
 =?utf-8?B?aTVOOXF1c1NaMFgycC91dVZjQ0ZadE1WSkRxTS92Wi9ndW9IbDFDWGFiWThi?=
 =?utf-8?B?czN4NG0wcWpTNncrYi9UNmtUUlJ5QWtma0tmVTBmNEN1R1oxWDBjZ1FYalBM?=
 =?utf-8?B?SWdVQnBOZDhFV3pERjRySkVMU3Zwd0JmcW5CYktzbERtM2M0UE95bkFLOUEx?=
 =?utf-8?B?UVdTU2RKdTVMYVZvRnVhVU9CSDc3TS9LOThxOFprcU1jQnBDWHlCVDFVdy9O?=
 =?utf-8?B?MnNZR1d0d0QwUU1tb1FsTmZWeGsrSVE0NmZnOUFzOWd4V0dWRXhXY1hTQU5V?=
 =?utf-8?B?dEQ1OGQvT3ZpZGhNaUR2dmJ0N25oYlVSRGk4UWNrZnpPeE4rRGpScVVmUjBk?=
 =?utf-8?B?SEZGQ2h2bEIvZTVVc3N2eGJxTTZTeEpZWjhZbldFbVl1eVplZ0FMblFCcDIw?=
 =?utf-8?B?MVJDZjlsTjNmZndGaEpnSi9jMjhFb2FoUlNXNkhicUN4RU1oV0dQdnFxYysz?=
 =?utf-8?B?cWRpSC9aSTFudTcvclNNcmVhaGFqUE5LTWwvM2ZkTXZZOXlPaVorVkFNQkVk?=
 =?utf-8?Q?gY9xI+xdubMvB03g=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cd0152d-6636-4cb1-02eb-08df11d98e08
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 20:57:00.0057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xadmrlyC2j1dANnjrWRBcOhMUhuW+b5viaadl163Fe+yOqr1SBEiNGWwBr4jHkDJG1wKQkqtPwGpZGdetq4xdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926

On 9/13/26 1:36 PM, Gary Guo wrote:
> On Sun Sep 13, 2026 at 8:54 PM BST, John Hubbard wrote:
>> In order to boot the GSP, nova-core loads the GSP firmware image into
>> system memory, and the GPU copies it into the framebuffer, the GPU's own
>> memory. The GPU finds the GSP firmware image's pages via "radix3", a
>> three-level page table of 4 KiB pages that the driver builds. Today the
>> table exists as fields within the GSP firmware wrapper, which is fine
>> because there is only one radix3 consumer.
>>
>> The upcoming r000 series[1], however, introduces a second radix3 caller:
>> the ucodes firmware image. That is because the GSP has been changed, so
>> that it automatically fetches the subset of ucodes that it requires,
>> thus reducing the size of the GSP image. This is a helpful change for
>> the firmware situation overall, but it will require nova-core to load
>> and provide ucodes, in much the same way that it was loading and
>> providing the GSP firmware image.
>>
>> Therefore, split out radix3 into its own module.
> 
> I find the name itself confusing if I don't read the docs. The radix in "radix3"
> is actually 512 (given 4 KiB page and 64-bit entry) and definitely not 3.
> 
> Perhaps name this "radixlv3" or something similar instead? Or perhaps call it
> GspPageTable?
Right, it's all about the number of levels, not the radix value, that's
true. Open RM loves "radix3" so much that I've become tone-deaf to the
name. :)

three_level_radix works, but is silly long for this.

Do we really care enough to insist on this, though? I'd be inclined
to ask to just leave it alone.

thanks,
-- 
John Hubbard

