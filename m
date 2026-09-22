Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010048.outbound.protection.outlook.com [52.101.201.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243254EEA2
	for <nova-gpu@lists.linux.dev>; Tue, 22 Sep 2026 13:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083454; cv=fail; b=uAJIzpgngzXKxnNgrvQxEn7tWIcCSMXVJi/PiAMI2rrRbmXUUfFv5a80AS57f9f+LihkvNDV4oH4mvSvHEjl/tvWhEYt9y6eumpnNSCIgPFEZ7idEELNIlBBtyfRBrd1ywbV0lvNbzXE7fnzPOC0EHVPRX0q7qAJfvrBX2cGM3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083454; c=relaxed/simple;
	bh=MBiY+mkOy9C8bs8hnYz+l8ywiORIUCvlk1GfdYLZHlU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=nJec0OdVoslp0sdKBoonRa0ARDcGjOmrfLpW3VrGNgMyvTiRqksIbVjpgJ4eDPP0lc0IKj1xrX2AxtlFoDvHcIfdlNXETejzDyM5OByjuQjQjCTAMTKy73apYb4XmxhYXu4BT0bmmv4+5vXzWZpanao9dJQpxI7d0nynJxfym1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m5Zh3pO0; arc=fail smtp.client-ip=52.101.201.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m5Zh3pO0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQ47xCi+LzmKosG4PprRFawGchr5EmqiiukZiuxs5erTR9GvzeRNIZ10zsBSrf+prmDIrIQ+lxJcjZz2E/f37iNYwLrEfmMLQtLDvciece40g6Q41ib6l/g1TC7F/mxGC/oQykSghsBgTNQHGyw7Lneu0zj5tVmCviMb1aFFEmoI4Msj35I286jITvnfo9YQbQ5EiWd2BNFqX323nXTWE1b91O0KHJ+6fyf8wRxn2drl6YVFfrNZl5gPzIWrR5MSOA3+TfAyxkYLZrWwpG1LyujcGls1CWzpxrm5j6fe/GKC7rjAAoV36ezLdoC9NrB7/Y+CCms7SJgS9ZVdn7eXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBiY+mkOy9C8bs8hnYz+l8ywiORIUCvlk1GfdYLZHlU=;
 b=Mb5S/hTDa1NOF1ZqxmhyJxpXdxdSjAlyDBb/WoLWEJy9Aq2CmXhLNIsTLlZFt7uYm8tu4oi0DvU5ziFEzpHFBj//VJ7Xvx2tjmCt4O1fFnIF4vR26zjW/YwdCBRyaBm1TWMJCx6W++R/iMh+mmqIw9XsmjrS1By1NTS9x/v5oDVBOC3D3msNf37w58GzKLth2n5uFEzUbrWLzsYX8p92oJzfczoqu18smPibVgImx/EpQ3GvaneQpqgGeOr45IeaZucvG485SB/WXOHkDtW2xuW+VaEadCRH7NPt+w1axJntRmmkiWDYvvVjYsj6qSGwbp5BKca3KoPzrttrtbqXfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBiY+mkOy9C8bs8hnYz+l8ywiORIUCvlk1GfdYLZHlU=;
 b=m5Zh3pO0ayvoZzbounqcNnw3JkDJgnOFvWdsXXvens6Edw7HbgzITYbJiPZvDiH82RT3fAoQVaML5n60L+nV9XBi88Pf1FqyIR2f4Db0wlvSe8VUrCtoY1FhDh+DU6bCe4RrJcLs49H9Deai0lRSdfKyFYkceUBdnkq1M9UajPb5bSGP5t0hDuQuYM6tl36wYcp49ApAq16/1lOZhbE/AUuS+/nxcXY3+CFJ/z8/QAe/6FA1lrZsQOybyRDaMq4H39VX997czbE5aONKSeto0R5xsvRMMSWdTiyo1m54K9ZAtwpzBe8hkqcshZbQ9VfI1u2tmSsiFqVozvgB42rF9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY5PR12MB6274.namprd12.prod.outlook.com (2603:10b6:930:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Tue, 22 Sep
 2026 13:24:08 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 13:24:08 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:24:05 +0900
Message-Id: <DLLVME9Q01L0.G34UL6UCBZ4J@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/33] gpu: nova-core: gsp: give the command queue
 its own BAR0 mapping
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
 <20260918010719.1176945-4-jhubbard@nvidia.com>
In-Reply-To: <20260918010719.1176945-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY5PR12MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 968a8f01-f9cf-4f95-2545-08df18acc832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024|23010399003|6133799003|10067099003|5023799004|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IU2xYOsw4xamFMatkn5GqZ8oAzXBxSwiL/w17PMIfPZnpv3sLDDCFgvULxJfyeB8fMd2el4RkFXDG5+0SFtB0mIA5ZuC96OV22U2qdJ5uoZ5JLUghDnMvw/5fMCUg0vNWE+onUqsmAoc26f83ypFzwDnqs/5RMsWiw+q6ZJXnp1zjwcjHtMllGUjjyvuvkt/L7y9LyyEmG6Cy0wDVqAFEa4vTwLiHcXNAm/5bfWa4hszTCTVQpHOjRI7RbbR0MSaf9aJVkvzH9fL0Xv0xZdSM4ManXxTBlGgN2UMaoEs75dCWZrclHT6OWrNqXIpQgfn5208n7qObbO2wzPWLOUg1yfY+k2E8NndIcD7ivc4Ibq24Xa7rTmbkpyiyVgcd+a7GdkW/+bo3u+ST1Km3zjW1ZfGAeb8U5Mh0LSDNlOmqq2WcvBEB15szeGrnD28JqreSDDc8TUWko/wE4+7/+GUdtoqEY9bFiOHZ0smSabHSzedldqiPCFDT1DwR3tz6dVU4ObSLG9SDGEhEQFJfzf+0R5WsekN+Cw8LHTyhysDDNNMlHypIpVNBxoWILJGLPrrksYnuYlevuDw6fISdYG1xzJIijbI1vDfDYTqEzx7XKq7lzz8SIDaS1qqNUYGS6Rhswav7rWaDmuSpsZbl18ikV6TVTH5cYTe9gerlp6FHvU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024)(23010399003)(6133799003)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lWSVhUcDBVam1ucmZKYXljTU9OalRtYkluTktUdWJ4R01QdGdPTWlaTUJY?=
 =?utf-8?B?YldMWGRCV2N5TnRaeTlsblcrVWd6K21yU1ZpOEFXQnhyNFhEemdSdCtrUzcw?=
 =?utf-8?B?L044R1c2MkgzVVF6Vkp1R1hKS0M5YjVZWkh5Z1VyU0NIaVBqQ3VSazVKb2dw?=
 =?utf-8?B?VitWOUdvN0IwMG56ZExpUVE5Yy9yaXFteEs0emhpRjJQUFl5eU5VV1h4TEM5?=
 =?utf-8?B?RnNDUW1SWWovSXNEQ3ZvekhHZi9TcTZTR0prZWhMMUJvZHhFVExPcnRWSFB4?=
 =?utf-8?B?NTB2YlEvTFo5V0FZaGZzWjBzTGxENGxLSjY0d2w2VmV3bTNBNG9FYkg4Tm03?=
 =?utf-8?B?UENuWU1ydXZjMUFCV1AyL1FvRnpWZm1Renh5WHRVSCtvSHlvQURCU0drek1a?=
 =?utf-8?B?NGhoSlIxVG55UE9TOHVvZjBoY0tNYXRoZVBncUhQa1JNSUNXZnMxUTk5cDha?=
 =?utf-8?B?UUdjTjY4N05La3Njc2dBNTNEbVZ3ZVBOQWxmVkVDWXN3OFdINWRmZmxOM2hw?=
 =?utf-8?B?bjNFd3pkVC9UZ0JOejlMOUJNUitIMnBIQjc3M0hrRWR5TllZcEg1S0lNYmdt?=
 =?utf-8?B?OHZxNDMrOC95T1IyNkpINVByUTlmeGVhaTAwUGQ4NTY4MVNUV2UzUVQzd1dB?=
 =?utf-8?B?a1ZxR1YwL2NxTktTdVJyVU9JblQ2SkZXV2RYZTQ4bUprNVZsL0NjelViRXMy?=
 =?utf-8?B?Ky9QWFNLS1FXNEo4alNLb203ZDMxOFZMS1JWMnBud1laMnhlY3MybzBOdjJt?=
 =?utf-8?B?TzN6cjR4K1FxbC80SXg0c0JSN010WE5aSGpGY1IrZENySUtuWTF3YVRuVk1m?=
 =?utf-8?B?TFc3YVloSGdycEdCaXdpYStWMXdLRXRiSmkvckxLdXBJaldGUGl6M0x6VWFa?=
 =?utf-8?B?YkQ4T2t4V0NnS2ZTV0tHVDErbk9VSStkcHBOcUcza21uVEJycGUzNTBUZzJL?=
 =?utf-8?B?Y1BlODljY1UwNXZLdlNyOVZFMzY1WkZQMTRxZ1pZeDRxNjRCMGQyQk55QXVP?=
 =?utf-8?B?cHZNemh0djhoRjNBa2cwMW9UZTVsN3A0UENJMFBhTUJ3Rytka1gzZ2hCTnVB?=
 =?utf-8?B?V2szZ0FqUm9XNS9OZUVQbmV3QUFaOTUyS2ZwVkc1M3JQNXlnaWxWajRGWm5I?=
 =?utf-8?B?S1NKdlgvYVp5TGRNR1BXcTRMMzN5dXdiSStwcHJJbmpkSDhESzJqS2U5d1VW?=
 =?utf-8?B?MU03Uk9iS3gwSDNsdHFJTmhRYUl4M2R3YkpuZDZLNE5hNW1IaDNSMEMrYkFj?=
 =?utf-8?B?aXR5T05QSDE2NEw1SWtMYmV1TVdLc2lmNDVvd0k2dVB2NnlsN3JOTWtMc2RI?=
 =?utf-8?B?TW9oeklYeU11YW04OGZFMDdwSG4yK3pJMXA2VmR1REMzZW9aMDBUUDYxVldZ?=
 =?utf-8?B?NFNlZDRlczN6djljblIrYTV0VXBWOGZ6YUh2Myt5OVlFdGtLTG9DMVFRTjRS?=
 =?utf-8?B?c054VWZRZHRWZ1pueTNQRUJpcS81TVR2OHg0eEIvWTNVL1dSSytOdWtZWllP?=
 =?utf-8?B?NUI4aDdGZ2wrVmEyYXd3MFltMTFnUmtEZGttRjlhQWpJajBJME95OWNLUEtX?=
 =?utf-8?B?TDUybUpmdmxaWlR0bE1BWExLNG1Dc0hJa0tQN2RhWXBEWTBtZUhqWERjUERZ?=
 =?utf-8?B?Q2U3czMyT05aL2xnSEVRKzdpakg3ZmlmakQ0MW1RdnZoeERTVkl3bi9Hd0d3?=
 =?utf-8?B?ODZXUVBNQWVrNEpyazI0S3h0WkNYRzNlSDY4WVhzMEdtNC9VS3h0Q3llYUhE?=
 =?utf-8?B?MzNZUG1xaHVQMnNreWN1MlU5YldabzRBSEI0MTlDQ1hFdE01QmZ5OE85dFFu?=
 =?utf-8?B?blRyaG90WVVIM2VTL3dpMlU4K0F1OU5JeVRNYTVhNnBaMkpxS1lIdkgwTzdn?=
 =?utf-8?B?d3dwSDdhRGN5YUczbUlDMUNYWDFpemtWbjVXL0R1QVFjRi8wYWNPOVVpUmZk?=
 =?utf-8?B?TlVBTm4rR2xiNXQwdC81T2VoYVcwcW1LckhrenhWL1ZyS283dldzcXRyVlBn?=
 =?utf-8?B?LzI4NmZOSkpBZ1NpRVNDV01wTUNPOXY0TjFkazhWMFIrMGVNQS94TEQ0NnUr?=
 =?utf-8?B?dXpicmVFQTFyOVFqaGZsVVVaWTlKOTFyVno3anNpTXVQMlkxRHljNWozRHhn?=
 =?utf-8?B?REhvVHFkK2pYa0J4MmxUU2s5bnR1TVliNDZKT3crNHovdGdoTmhSYXdudVFH?=
 =?utf-8?B?TFB0Y09NcHVwS2JYQ0t1dXdGNWZiSllPbVlhSG9sRW1uRXkrcDQxa3VYandE?=
 =?utf-8?B?RWJuODZ0ZlM0MzY2RXpqNThzNDRZOEQrYjVYV25IOFZNNHVMdHRzYWlacHly?=
 =?utf-8?B?L2pXWDRuUkRqRmJUSlM3TUJaeThUbE8yTUJ4ZTIyQ0R5MHQrcGlhK0FGdnVR?=
 =?utf-8?Q?fbDgzn6set5sghUVh6yEqywKqWduvUhDCJBw2mTUcUFMg?=
X-MS-Exchange-AntiSpam-MessageData-1: QdX8NAkgjFIS3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968a8f01-f9cf-4f95-2545-08df18acc832
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 13:24:08.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3jwh/8Wdi59+AVQmh3B7oyQ9IpKWelXj+fg+HIV4AIZe1cSdZTOvFmolzrsg+ep5KXpRao68J3hwFpe+gxpSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6274

On Fri Sep 18, 2026 at 10:06 AM JST, John Hubbard wrote:
> Sending a command to the GSP ends by writing the GSP doorbell, a BAR0
> register, so every send path through the command queue needs the BAR0
> mapping. A command too large for one queue element goes out as a first
> element followed by continuation records, so the send path has four
> functions.
>
> Nova-core passed the mapping down from the caller as an argument, which
> was threaded through all four functions, and every caller of a send had
> to carry it as well.
>
> Store the mapping in the command queue and drop the argument. The queue
> lives exactly as long as the mapping does, since both belong to the
> bound device.
>
> Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This patch is merged into `drm-rust-next`, thanks! Less arguments is
always nice to have.
