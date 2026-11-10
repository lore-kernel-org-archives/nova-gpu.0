Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306104;
	b=cR2WeFCkZJ+WjjikFlE5DDWeI3U+IAZGJzjBTetYKI9MxWE8FHqyXAs8rc/fLS1aqguB
	 hiV+uXI9nvb0jVET1dtJlkMtt4mBHrBVvNbwscz8s7XNzJgZ9i9+TfqKraGu1CoywksPW
	 3ntB0hwGZZdx9KTNRlRaen8qzJbJhqs5/Py3uyQkS9uflx3dZXjADXxudnGdOyU0zHDXZ
	 eTbSz6JeucnDzOdYz6goWqSvwxtaJiwgsZzYZIsVKzAkCn3l70a3lEbiznvzOt7pTPmAs
	 Zh59AnwdQ4e5B18PM6wy0PVkMDOLY93W0zPldHThFBE4D2qhuf/6Cywp14wzvAXNi1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306104;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lRawS1WgZr/Y6lRRnzg2Hjbqh+fLD0lNEw5+cV0mTac=;
	b=CW60XdEJRz/vrVtaRgyUn++sKOqqsyxGwRtb2m977NdgR4/9acVyr9esmwTaHBtX2gX+
	 yjKgajg8o5ebl00FYADS64fgxwKgHoAGY7ro8Kitr/Monx1ZSaucWowRlZEwGfiFVV5BQ
	 U2LcpHogDlZONd1UTGFXXMtvIfJ8P6PhmM7wDQJvr6BAIbvyO2h4YRscr4jLafMCipvlV
	 ZgM4/bTSTVV1Qkz+6fVk5MYLGCrDJPKIWvJVokWEeQENOzAyxFt2r9UwurqlaalVT0Dfb
	 7rpqvMtVM4qxzhYk23c/SeJGWr10Es78HLAbLCaVKd0yccBw4LSANqnCERSrL3U+ubA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofq1Bxln;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.51
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D70460A5BFC
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D70460A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ofq1Bxln
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isYui5O6EygdL9wnC9B9ZP+qHCGFUuAzCOuZVCPWcNCqxrpNcGVkWN4fhL1jQWTgy3jhbrZczA8j0NX8cKdjCQyGxT0BqUjhIxk8eJJY8McCU4337N0UT+CmZBTbdX6P61YwYqYPNcG+pzDzuWkOBloWteamaTKl/yPWG63A7+5ymqafwRY/0QlcydXVej5aH1bdsS6ROoKKrAkgsd0g0bpOIg7+qIvCIV3hw3PTYx6nKhIpcm79KP/9B+2M0Ca7TD2yILRQwKO5oiyNcMCAccUQe2aUBpMK5nfuVY/Atu9zxj9cJ9nvR8JGVSQOVSdLOA0zj7wFgmh4AMcZQPVj7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRawS1WgZr/Y6lRRnzg2Hjbqh+fLD0lNEw5+cV0mTac=;
 b=ct5KemAArBdfwMzmQCX3PyaOf7KHOkKHX8dZOh+ksE4ZAReFwC+dIM0lQ3QQkAlvi5djzVKxBvWn62eGhpXvuceq8hCHz5DnWiouaM8AfCQIOKKmda2NfToeeHgxNluLu4lhfVF5aay3ELJUspvGvavrGMKB2NRrB38BD8XlCakIYi4fO97Q8SQy5DxTgJbESSA+Bd9SsHvINUeUPn/m5CSd27FNWHeqmi0Z28qWy0aaDlnxSxCKch62/snMJm7UG/HAFzPyR2BuLp6kGmlHlh7xJBZREBJOQz7iCfUt+tPB4ivN6Iku37b/2TTbS/9+nXyjeP3qyq/P8NwYyOZf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRawS1WgZr/Y6lRRnzg2Hjbqh+fLD0lNEw5+cV0mTac=;
 b=ofq1BxlnFi8PjsqbwxQBke8Cldo9O6rvvgcqGjpppmx9eQgqFZUJAGRob1TjwUVBqxPvlaFaVBXReq9wZm5884AxnOsk+gkKMBGma3zDillTodcFLne7qczQE7dmc7KbaMkH3G8lrTj1dKqzb9YMwloQWgI2ErWzbnJBg50STGj0tigEdP/Nw8YTmIyyp0MTD2N/fFbwWidWG//A9SBf5UYnk3XIGPpwzCBCIqa+9bUT1Py21WWo8oOpA2iEs36+M4ESRki8L/ntFumik12vnhe4qk23qHMAq8GvHzmUgPyYCHwamWhn2zJI1CipjoO2qNsk0w15Up0BjmzufK2UtQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA3PR12MB111810.namprd12.prod.outlook.com (2603:10b6:208:712::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:40 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:21:00 +0900
Subject: [PATCH v3 11/13] gpu: nova-core: falcon: use src_start as FB
 offset for all DMA transfers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-11-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA3PR12MB111810:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3db45c-7153-436e-26e8-08df3f1468a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|56012099006|261021121427099003|261021123027099003|261026121527099003|10067099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gsXGrWWo+XBLD8CUiPJ5zA40BwE+Fzvfl8HFbyfXQHISPZIMq0GQwTp+7TkGQ0wSTNpZC8rzX6q3mc+U/NBdwZWgkoVAPgxQSWC3Zi6txwqKtlkKH8fvTCb/44ZoGmUl/mZFZQ3tUm/5eQ4Utix4dLRtv/2eCkJ28Kw1YLXwW3zeCbH0zmPARq+Z3R2V4coQ/sXDmaAWb11eiisLqpgNqBD3VKCw2t2Q4aM8gsZ1ng+61M3BXxISNmYuYou3cnRFvpiNWHt3y3SXSkK7yJd+oPvTHtaQX8yrAKmmy4VYeeM261ikIR0s3AwhEIfMC1hmCjZspHyNYjvbY3B0wURFfOwomMpfWAy1qtj6H/Sp/NL3fGimS5yG10LD7dqKb6FwvaaelhgWTaBE9qUSjjXWm2E74JLk8FCiidEyGyyIky49ZBOrZ6B0Xo9nX57h63xMp4lGqa+GIaxOf6BxpcM67/gTLG0gr+JpCB4fyB0pJvlaom6Ymvt90h7UbK2pwTKsvuGbHhnsbnYSMbk48AnSlIKp5XHASHyf6KGp7o9KalT2JGGGyyllfxoMeBu+2KVgZnzfJ4vYD2elOv7O3ZxL4Vdm68wY7ZKdHuGqcQLWfuB2iXrBP3H/TFdhPjPJrupTlbYnjG4I6MdIX7kcdwGzFBBL01uWpL2yUfXXRd8X8ws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261026121527099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZJc0dmclUrMVFCUzRXYlA5cjJya0IveHpoNnZSalY5c3V3eEFWUU5ZeWg1?=
 =?utf-8?B?TFpBZzNYUUZVeEVTLzFESWVaZHZWTC91cE8vTFpUcno3c3lKc2FiemRHZXZZ?=
 =?utf-8?B?Ni9kUGRKcmxxYlBObjZLV0JWZWFuZjUwL1dGd25RQnZCN1crWHY1K2JkQ08w?=
 =?utf-8?B?TXM0WXlpWHVwelBGVWJQc1p6UFpkcms5R1JYOThpb2FxVjdNR1kxdWdGYmhR?=
 =?utf-8?B?YjZ4d0hCc2lMTGVpY01iNHphazRiLzB4YnFEaWd4aWpRR3VTUHBIWmc3SjZu?=
 =?utf-8?B?dThDZmFkMkd2QmZhbW1KK2d6VWRUbk1jcU03QWwvUG5iTkhra0dSaVJvdjZ0?=
 =?utf-8?B?M1BNRjB3Zjg5cUpkYld2SHVLNzNuc3p2c0l4UVI1NklVOHdVamdFOWNjaFp1?=
 =?utf-8?B?bVZkU3E4bmJVbW5SVzMyZi9qVTJBSWd0blJ4SHdMbkJyRXVHL0JDMGIxczFC?=
 =?utf-8?B?eU9SRm91NWsxVjJRaHBtV2x3UUpxNTl4UlV6bitQODFkNENLUEdSeXdqaDcr?=
 =?utf-8?B?Ui9QSzZNZXN0ek9aWmRrQUEvQUpsR3BCQWhwRFlsY0hoNkdGdXlFbThmalky?=
 =?utf-8?B?VU0wcDZ2bG5LS2xJazlucEh4T01BN0ZOSjNHdVFVUnhmY095SEwrc01LcWVn?=
 =?utf-8?B?NUVNYkV3WE55Qjh5SnF1MHFOT0NHOUZwWXR5ajljWXdWSDNaVnIrUTlFZ2hO?=
 =?utf-8?B?b2hndU5yNy85YlZuUGQvVGxzOFc1ZzRuU1hVYjFQbGxzYXpPdjdaQzBBN2JU?=
 =?utf-8?B?V1VYemZaeWpDVHF5S2tqTWpFYUZnR21ibzNPdzR2ZW5VUkc2WDNzRERnV2E0?=
 =?utf-8?B?UEVndDV2NkhpcGorc1YwUGhqclFFNjZGV3dhWkgwb3lXNnJhc0lNR3h0UG1N?=
 =?utf-8?B?em14NzhJUkVMaGdwTHlKemVpRU9ILy9LZzhRMTR6bnZCMkFVSzBwdXBydzcx?=
 =?utf-8?B?bDBZSzVmMWpFeDZpeTBaVVhJVnpxR3U0TkcwYWxHYkx2NWM4M3BBZGdJb2xJ?=
 =?utf-8?B?UVFndUpEMzJGZW9Ja0wrV0lWNGV5Z0NCdkZYRnFVdFlLRjFDUG14SzErNHZz?=
 =?utf-8?B?dStqZEJ6MWtPcExKajVhMldQZFFtWTBjQnZqWi9odWNPZDNKMkh1TzNiK213?=
 =?utf-8?B?TjZHRGpTT1orSHFRTWE1eE1WTFErQWFPd0Z5SDRNMnl2YkdCZDlCbkJnTnZS?=
 =?utf-8?B?WEQxdEozdWl2T2Q5cGkzM1VDRTM1NjlLWnpJOER4eG95eXlNaVpJMThXOW5s?=
 =?utf-8?B?YmlZRVBkNGRTU1dBSm8zcE9kNGFwL3JTS1U2MThqNjV2dVlXV2NEdkVtb1ZW?=
 =?utf-8?B?RjlLM0NKVmpGNU43Y3h2TytvMFR4djZXOVJyNncxdXovemRHcnVBNnNNVzdk?=
 =?utf-8?B?UlFoZFpqUGN3QkhUTkNST2szZUdjc1Vza0M0SDJ4SHhYT1BJODBmRU1MWkNR?=
 =?utf-8?B?L05xRFBvSG04WmVBZkhld0pyc0tBeFIrWGdSZlA1cVVsRlRmV0g2MTZrazV3?=
 =?utf-8?B?TnhhR1MwSUNoTmJqYTN4TFQ3RUpvYUJNVXVhWjdKNGdDbVk3RE96MnN2MEdk?=
 =?utf-8?B?VTJ0V1RMbWl0a3FMZmZMdnBvWm9DSTcwODlZNDNKeHlUdDJrYkxIbmx1aGVO?=
 =?utf-8?B?VFJEbXVXRTJsQkUvcjZLSlZjdkoxNEpmSzUwVG1mMEdhQ1N2M0hISUlNNFJt?=
 =?utf-8?B?TG5BMHZvams2RzhrNGhSSThDL3JqdEs1RzhvZTRnNm5PaUt5ZUFhb1A5dldi?=
 =?utf-8?B?enBPRDZ5cjZST2Y0djNqdkRJamJQUnl6NXpsZEtmeGhnSzJDd3V2dHVpU1lE?=
 =?utf-8?B?QjNRclpiMy93bGd0aHZPN2VVYVN1cmp0eXh6dGlIaEF0b2dtblFPV3R2Vk1s?=
 =?utf-8?B?UDFqQ0lXeGw5NGFOTzRyNy9ZNWlWMVcxb2w5TGs3bS8ybUFCa2QrdVN0S2k5?=
 =?utf-8?B?WG51Sllxd3l4YVM3L3lMbGhUWnBXRTFQUTdmZVljRjFPc3hLbjR3YkUwdUpa?=
 =?utf-8?B?MkpOS3FOUW0wNDhvVHdHU2NDYmo5QzN0MUhUNXUyQWkvNlFjR2p3VkoreHRB?=
 =?utf-8?B?SU5pTTBQdjVraW9QK0Q5Um4raytpNk9hdGoyTnNWSUlMTlVHcUkyNWg5T25r?=
 =?utf-8?B?eFVGemxaQ2l1RVRkVFF5ZExSbGoxMWJhK3pGZVhkZXFaVldMY1RNRVRHMzVY?=
 =?utf-8?B?UjZ0dGNhWnVRN01lNDVBdzVuU2x1dk1EcFdFOW5xT29hdkFNTmF1MTNtWGh2?=
 =?utf-8?B?R2FvZS9iTUtoL3J1ak1WeWova3BjSG96TGFSejRqaHpTVzRDd29vbUtjUVRx?=
 =?utf-8?B?eTNzVitxRjB1czQ1em5NS3hsUEltM2NlYUU2SzAxTmhucE0wSmdmWC8yOGs4?=
 =?utf-8?Q?k+iWPMLlmeGNgo17Bbg7dOvGnmLRVHVKxCkdcfayohoig?=
X-MS-Exchange-AntiSpam-MessageData-1: YYcPKq2jSneRsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3db45c-7153-436e-26e8-08df3f1468a0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:39.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSYUVJiF51DqK+NnRsDDslZGsW2Oho+n+JY/VtJsKfdZ67JHt6zMntZyRvtBltbYgb/gOo6kMz51vO/AfQeBJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB111810

dma_wr() splits the source offset of a transfer between DMATRFBASE and
DMATRFFBOFFS differently depending on the target memory. This separation
adds branching to the code, and is not strictly needed as DMATRFFBOFFS
supports 32-bit offsets.

Remove that distinction by programming the start of the source into
DMATRFBASE and `src_start` into DMATRFFBOFFS for all transfers, which
also removes the `fb_offset` and `base_offset` local variables.

This changes the register values programmed for untagged DMEM
transfers, but not the addresses they read from. No change of behavior
has been observed on either r570 or r615.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMQI0G2K6Z3B.1YEH6D2ZILRBI@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index facf65a17c0f..a7e41e282ec2 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -566,17 +566,6 @@ fn dma_wr(
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
 
-        // For IMEM and tagged DMEM, we want to use the start offset as a virtual address tag for
-        // each page, since addresses in the firmware (and the boot vector) are virtual.
-        //
-        // For untagged DMEM, the start offset is folded into the DMA base.
-        let (fb_offset, base_offset) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure | FalconMem::Dmem { tag: true } => {
-                (load_offsets.src_start, 0)
-            }
-            FalconMem::Dmem { tag: false } => (0, usize::from_safe_cast(load_offsets.src_start)),
-        };
-
         let dma_base = match src {
             FalconDmaSource::Sysmem(dma_obj) => {
                 // Upper limit of transfer is `(num_transfers * DMA_LEN) + load_offsets.src_start`.
@@ -586,11 +575,9 @@ fn dma_wr(
                     .map(usize::from_safe_cast)
                     .ok_or(EOVERFLOW)?;
 
-                io_project!(dma_obj, [try: base_offset..end_offset]).dma_address()
+                io_project!(dma_obj, [try: 0..end_offset]).dma_address()
             }
-            FalconDmaSource::Framebuffer { base } => base
-                .checked_add(u64::from_safe_cast(base_offset))
-                .ok_or(EOVERFLOW)?,
+            FalconDmaSource::Framebuffer { base } => base,
         };
 
         if dma_base % DmaAddress::from(DMA_LEN) > 0 {
@@ -624,8 +611,10 @@ fn dma_wr(
                 regs::NV_PFALCON_FALCON_DMATRFMOFFS::zeroed()
                     .try_with_offs(load_offsets.dst_start + pos)?,
             );
+            // The source offset doubles as the virtual address tag for IMEM and tagged DMEM.
             self.pfalcon.write_reg(
-                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed().with_offs(fb_offset + pos),
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::zeroed()
+                    .with_offs(load_offsets.src_start + pos),
             );
 
             self.pfalcon.write_reg(cmd);

-- 
2.56.0

