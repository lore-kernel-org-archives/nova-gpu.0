Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792551600;
	b=cLKaUU5XldBek/RxGL9wtD3QzwobgmhcIJKYRvc/5/GyV5FGlEHg4VTZ88yItyVJcyPo
	 lAJyJB62bBoUJMcsT3u0GsODc0uJYbowQEFWZA5sdr2/7OsjHbWz8dtE89LouFPnO/tFH
	 yqSBwnK7AWgHXKo5117giSocoPfpEV75G2zD9X593K4/XjR15mx9UMlXd+ZuoDjSqpPjj
	 UgNhQwZ5HJ8GZb6u+YpO+h6ZYEpzs+vO3PtRfUcyeWwS506znQQOUrAGVXzYIx0PVeD18
	 sSQ8cHqoDSemJvOMsJuJINDSapKJkRKx4/34tXxGog4uuEzrwuaQN1HvEve3Aio8ACw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551600;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=2cYsPRw31FFG/2HMBtApJUfzhysp2wW3zEMuF0y7PQA=;
	b=HKfioFR/oemnl93Ycr62kB0S0J+Lj6QQ84iFQST4B7vuoFFdbA7no9K0KQhIxNy7OTER
	 gBfhV/KPLDmt4CizffeaNFXJDgheRTxkEKKL2NWDoL66BHkT04OCuDPJMXZiQsx0OBQnl
	 JeuvylwcbKAX1w+vGkmsALI7cShxoEnr07X71iQRHiDJwSQIPHZUM4wtZ/IUdpLRcbS0C
	 wtXzj7jsmTJHIYU+n459aAh3mbJ0q7tGlgK6bnPrxpQFdvpM+q/3M+aXMpSt2+JH4lLDh
	 msvAevFnHIzulLUhiKU3Ogxfb5SX3Fg25ogB3ewu8kUEcMAxXpUkjL7Xr4V4UHyENwA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=esE7Wlgz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.66
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25776606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 21 Oct 2026 02:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25776606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=esE7Wlgz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRng7m/j4qhVisA3zPdClz9Mx9i8r+kJPih+hG0f+y8+rm8NEcnQLKw0Kh/QjcCMXVsYM5bNK9+XrTK02HYHnhhGT3Vhq50u3prU1jXw6ENIRVGP0A2ABpaXawVqDFD27U4QyqtTMq0gAHbtRNuKJdjso4qB0UkkIR+T55xc66k9QjQusl0wA24bkXXd7FJvLUFJc4iOR/nFZoRXe80DkkhJW+bicSyITepoOvju+ACrnY0BCNDP2XPuCX8yANOGGYaKopVOeltmR7TZPOkvYZ0AxFokPXBhLjA/Dq1QCxhskg6eI85NJ4vSlMJIp9UGMNhxhMUpSNf3jpfbeekKPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cYsPRw31FFG/2HMBtApJUfzhysp2wW3zEMuF0y7PQA=;
 b=LhBwATbAlXdVFUFMPOhVj3YIq7IxM8J+x9LHhYNDtx0cLQxlLbMuM9cdiaEWTis1db8yOU7pm3wFJ7iaNjvYpnTmfc61h5KUjbt2yqFKD0aGrokrpl0Sz4I3OPpPa2cqbtufmEVaLJ+KJmUAimJHlOtTd/aKITaFxND3TxqKx8S+eV2/UyuSWLb35UyQ6wg+BSOoABUW3+jnlvejRo551qDQznEl01rnotndQZcdJrXGeOrRGheOtrcoYsf7e9EZss1eGbvggVkZn6dkXpQ5oaOtEuAc/97YKtasiFos9V5/+0c2XUS4e5P6AqTnU7r8q8seStIPJ81aaNihecidRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cYsPRw31FFG/2HMBtApJUfzhysp2wW3zEMuF0y7PQA=;
 b=esE7WlgzM871OOg4AAMvPcAjCYHmua0SmSGHD7wd/NHFFuBalfuucGgOHMs6aDYLGCTb+0v6x/6EydEsI/8aYEUo1JBOMNLlywy6WCorq5sSkdcdObz5/K734ywUVQs3J9haP8qrAVBvcthv/YHxakTg3/E8RrTf/cW5v3vMV/K7CRP6QUFc5VauCD5wRxfgxXXWFbMo2nfKwwMo1HRKSjY/nlbVMh57/g0sx0cv71CyBfJnsiFE66ATYwvUsvSK/Mz7UjEFY122T8oZ4uOtK2/a53W7biKBynTw2x9pqpoDuZ0RqR6fXShHFLf/Lrxrcf2yE5PHOljkawL3n33Ojg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB512574.namprd12.prod.outlook.com (2603:10b6:610:34d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 02:58:13 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 02:58:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 11:58:08 +0900
Message-Id: <DMA6GXBII2CF.2VSUR3RDYEOUT@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v5 11/14] gpu: nova-core: gsp: cmdq: use consume_element
 to implement drain
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261020-cmdq-rpc-v5-0-dceeb8f360ec@nvidia.com>
 <20261020-cmdq-rpc-v5-11-dceeb8f360ec@nvidia.com>
In-Reply-To: <20261020-cmdq-rpc-v5-11-dceeb8f360ec@nvidia.com>
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB512574:EE_
X-MS-Office365-Filtering-Correlation-Id: 00543366-f151-49ab-c42b-08df2f1f25ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|376014|10070799003|366016|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d8a18e9LXJIQnZgqFFQqTUNYvhCBhiX1kdfaUeIF2yXraZIpmXA2JYs0+zgc8ybaVhBdYEW4uyLtzI9/Hk51ZAAiRAz34ekzXA5V61aZugxLEsETXhYYDSEUSQxmz6lIDZDWqMKVdKQb/qslzKsyVOYPzxpaGKIc7mbtGq2dfXQeuh5EXung8SKJTs+qcR08VzijwEl0uqelcUHQcSxc4avxDw9rzPykF6ZjbKYEnMLpB9BRQz5nwyyZyVBFJrpjWoCkncMORbPpKg/eGLSNNyfClFvVdfQnAIEno42aOLF9Zbauz7d/f8INW93NhItAErJhhHm3qt8hKxDvxxyiE0+9eKIOdRoptr+ESdUfEaaIGaJ4+Lb7vDy6VTPMScFA2j9oAQWc57Y/HBamtApcF6ZhF5X11h+RqznVDez400T8FQByxDa9RLBG+RuGYp8YIAJZWqEtxOR6ikQLkgvfHdKvpWGKbICG6UnDXOB5fnPyxr4uEHbrLF051fpWb9lVh/qq84mjeAiQRvpKmRi96DywIANFenQYuOAhc4qCtUJeacTNXLy7+bk+NZusxdtiwbImS95VC1b88sRbcKdJyWL1Sl9VffSY+rbK8cDyFs0aGChKecXGUnqQaVcYf7AReE6LdlQw+x/ZyK1teDqVFk2H8bob3xMlN3er1A4fmy4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(376014)(10070799003)(366016)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDVYbEFjS2UvM25tcUhXSHQ0d3pKOFYyY1ZTMDRqZUIzcEpwbEVqN2ZqdDdU?=
 =?utf-8?B?bFlYMG1GTUE1K21KZ3RSUC81azlqbjNzbTZYb0pYTjdvcDRBcWZHUmg2YXlH?=
 =?utf-8?B?NVZQcW11WnIzU040YTloVDkrUFR4WjRGNWZkWEU2SUxReldoVlBCV2RTVjJR?=
 =?utf-8?B?VUltciszallKTmJRN2daMzRVKzBIYnRCdW1kQklzLzljQ1h1VGJIeSthV1Rn?=
 =?utf-8?B?cVJjMktWMS9MeFJBMmhEN0gyT3hiTXRmQTYvbjhMaFIvbjBoRkJraFZjQzM2?=
 =?utf-8?B?Tnk5bXNIYWhhME9XMlY1dStxUkU0dHRHSlJVZndSVkV5V3lJRG9yMnIrd3d6?=
 =?utf-8?B?VlZJcm83SHQzSTU3Mk04TVpIcGZEZ1pQZ0k1S1hOQUgyM25nN00xcWlidWha?=
 =?utf-8?B?Q1UvcmU0dTNXZTltRFNtNzlDdXgvblNTQ1dkbGhiSWlucVNoOTRuNjRSRHBa?=
 =?utf-8?B?NXFBcWVMWVJBUnhXcGNEVmlXZ0NjNkdSaTQ1R1VpdWQ2NWJjMHh5VnFzTnJu?=
 =?utf-8?B?S2ExNXdIMmVjQ05lL2hTTmc4ckI3em1wQWNPM2NnL3c2dE8wT1hrYTNJQ1ZI?=
 =?utf-8?B?V2pUZldVWVZYYWY2V25QdTZ2M3NGdGkyMS8yQXU5VjMycWtPRm1oK2gwV1kr?=
 =?utf-8?B?MjEwUGFxUkZNSmNTY3dVU0U1ckJzSTNocC8xTncxNDAraStReEhiYkN4b09M?=
 =?utf-8?B?SVcxenFrWi9SQXZxMm4wbmZta1lXZ25MMHRlYkk1ZXB4RUxHRUJra1EvWnA5?=
 =?utf-8?B?ZVRaYWdPOEplTDgzL0ZqbmFRbzFBd2puRVR6SU1hOE9iZm1ObWhSRHhlcmZy?=
 =?utf-8?B?WXJmL0k3SDJBUWlxaTNTa1JkUFpFOGpQSDA5U0JWZXVOSTJETWdnUTFTYWlo?=
 =?utf-8?B?SzZ0bzk3cXdRdUlHaldhd1FiMis1LzZnaDNCenI1VmFJdERGR1diejIvR2J2?=
 =?utf-8?B?QysrS0lDNWZHTCtkM0gyNXVvTm1sbk1iUzBiY3MyZGhjcGtMbHJyNkczZ1V2?=
 =?utf-8?B?SXNNeWUwZ3dkMk96VmF4MkdvczNKZkZxM0YxUFNVVFF6SmRxRUQyYlBBNjl3?=
 =?utf-8?B?czhkZ2VWZzV5c2poYmdhajJTTjlXNzBlYnZMMm1NNnQrZU9pM0w0WjhxR0FN?=
 =?utf-8?B?WFVqSG1CVGs3ZXg2anJCMFFRd0prSkErSE53T0ExU3U3UWtJencyZGx3NkJ6?=
 =?utf-8?B?TnJFbFYrdDVkNFJqeE9Jd3hSSFVSamtabFplbW9EV05TMDJHcXI3TFNIVnNT?=
 =?utf-8?B?TTdVdFlqalcveFpFTmhCVEgwK0VLb0E1Qjd2VWwrdHI2a1NRaDg4bm5FZEpk?=
 =?utf-8?B?Y24yK2R2NWlmLzdaNVFTVXBKN1JqVFVLTVR0Vldya1hCRWF5Q3JiRFRHWWZ1?=
 =?utf-8?B?OCs2RVVwam5HdEFzQTFKTTVyNW9GNkJvemZFbmxuamVFQjlxTU1WV0xLN0NS?=
 =?utf-8?B?RlBWN3pQaGtvbzZtcVNZeG9oWjhHQ21DNG13Qk9McnYwZS9PdWNmVEROaytY?=
 =?utf-8?B?VEVnbis2dWVZTnV4VE9OL29GZzFjSEcxb2l4ejRMYmc4S2pJeXF1ZkRVYktB?=
 =?utf-8?B?YmZXaUY2RXl4aDlUczE3UWhtSXUzamF4N0EzcHVxYjJEVzM2bEhyM3F2VlNn?=
 =?utf-8?B?RWlIQWlFL1pUVWpiMmRsWHJzZ0RIcktLVW9Ea1RPaGs0RGpZWjU4bkFxQmQv?=
 =?utf-8?B?cGgveTBWVE42ZXhVTHd0TEtueVhkRzV1elhuMHUrdHJ0OWpoengzTDhNVWQ0?=
 =?utf-8?B?anN1aEFBZlo2Q05ScXRMK1Bmajc1d0pzYWVSNjEza0dnb1J4UmtuU1dwempR?=
 =?utf-8?B?MEhuVUY0bFZLZFBMVW1Md0JablhWVUlTMnZUa2IxZWx1YzhQYXZiR1U2VGZa?=
 =?utf-8?B?UllmOE1LNFhVZmIwaEZoNXRrdEowZ1Rld2JjNWdVY1NZS2Q2U0ZVQ2JmbThY?=
 =?utf-8?B?TmdRaHlybUFOVU82UmpvenVSbzArYlFSbGN2TGwrV0dTMjFkcDQwRS8zbEtQ?=
 =?utf-8?B?bTErVFFrYUhCVi90b0tIMVdReDhELzBDcFNCeXhEeEVXWFdqTCtjdGVpWlNy?=
 =?utf-8?B?bHV5UDc0MXBVM1RhMkJnWG9DUWh4WTdCaVlHSFpNYi9jVGVmbzVzWjhGQk80?=
 =?utf-8?B?T3c0YkxObkliWTFpRTFuWEZ0RllEREJ5OG92SjhWNGpGN0VBb3FEUy8wbk1t?=
 =?utf-8?B?UTdHU0IyQnlCTE11STlBRjdwS1dURVEyUk9aaGRZT05xS1hpRG4ya0hjV2d0?=
 =?utf-8?B?VHQyZU9GdWMrQ09wbTZuWTdyV1IyY0FOYW1sS0IyVFJzQkdVa0Q5Tkk1b2ZR?=
 =?utf-8?B?aWhXaGhsNjAxcFN1SWx3aTRDL1RqalVXdGxkZXBndmlGZTNCeFgvaEVNT3hK?=
 =?utf-8?Q?5kDZQOKa2ZXxqCodvw2SzSCiZOchqaCsNSce2G3lqQwI1?=
X-MS-Exchange-AntiSpam-MessageData-1: x0WKOej5mxr9ww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00543366-f151-49ab-c42b-08df2f1f25ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 02:58:13.5452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZYYydHpAjurSn844dRfjOQNXQfUqR7s6+1daYIDI/r+WgatOIsqy1DhaCs5bZ4NEC2loO7K/UnxT3G29hU/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB512574

On Tue Oct 20, 2026 at 7:08 PM JST, Alexandre Courbot wrote:
> `consume_element` can be used to factor out the code of `drain` that
> advanced the read pointer.
>
> No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
