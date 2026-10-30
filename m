Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793346215;
	b=abBbN1jJPXbn+RRbCjmcthb8W7xbhzk/aTRgCeeTWv/klwEfvJdWR8LpNz4ezqP1nbOd
	 4G4E4aQGTeHHaSRjVxD7tG3iYwGQAYXeNmmjCg+B1PHcHsaNeMtolA/PGa4yjq0yS1onX
	 JKtcMiCgZxGGOnK3nJhIeAou2HeRyV95UyETs8MkMhkAx5iF1PgGOu+igeXhyqVv7HkHG
	 a10NVIbmtDphILAdicijKpbIswEpqaDPkpwiW6fbOCKbjR7cFDcTKWaeS7LUfSRK8+yyJ
	 64MgtUqRsRfawq2KDt+7WeEUFReeKUeqRj+jWuoCBN7CzBbQPiBeUzmxc3a0g0c5qhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346215;
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
	bh=C9QPharc1afG+bDIaiRoS+M5ZZ+WovUHzSuZdKJOta4=;
	b=bsHESAp9Q4cnirEQdLFGHiPaD3pkJ5MhASE3sgbYQQ3B5b5KHs16yO0Wvo+vtNDS25Oq
	 aIBPSTe94XHwZe4plqJx83Bb4e9FwIL8depYdW2MrvysmSXDt4KHTjvovoI/L2Jaor0Y9
	 9ecld6tpB41gU07ewqqpkdFtAlwfS1jSsdg/LYytcsEv3L5GoVkpu8kfNuDvPtukaYLDD
	 rR0BxTLqa7YG+VnRDRuQuoq2U6IqhQ9NzYp0/CZvffGHGkXnu2eaYBggMGYrn2kzONUQL
	 CpkOiayAgcLiTVFdWinzJGH/wLJ3vcBRMpwWi139px70hvoFBoy0jjcANES0Hg1D9Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="sWf1/SLk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.31
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010031.outbound.protection.outlook.com [52.101.193.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC48606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 07:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAC48606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sWf1/SLk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7CwIimfZNiwtUqZEfpN/J1ymEBWmnklrj66dm+DxztBcGhwszgY8OWxS/vS6NIcbatgEHXCp/1KiOnXTVPxZ9EizEHcY3IzUXpkv6Kc63WVrdTCDb740qAl6Bos15XE2rzNmJt1htVKzpcVPAEECZjsoYNkha5iMTYDf3mqDDlzIcZ10GHEW1duDE621zq1jIJ6GO+jXABGhyF4RidmufOn/zuc/cGzwQVUbd4uq/msWKR0fGd/AoYm5rEeNGZWJp+Ymk4NLnSgf+1maNniCDB8uHV6AKs4SMmiSt+P1jzcWT4MiQ0MjrY/LgdGWwNqKJZFggzZ8rOq4ViS3VwM3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9QPharc1afG+bDIaiRoS+M5ZZ+WovUHzSuZdKJOta4=;
 b=S1OSHltyZdC9zUDivfWrfohPSu9TMDa6Ez+gNyxHXZsn6VNkbqzmCqlxs4JgMbDJfzci/ZK019d/cwJKl2cvsz7DoqMdmiOO4fr+blbf+eRC0Vs816mkUl4aAdZyUj6JFo12yzTrgtiBYoUBu+IOkmWZXo/UFl/BqmB0x31VbFbhiXPu9jzpEFq1qT+mQ1R1MIirWNUxQpIAFZ8FHibwS5P95I6hPYzrla2HlgHejpnW2t3XWFm4CVZZh9it4ErNUrgUopBBAPRGwsO77WNKCMoflH2/8h/IYMveHSAzbcEt6j1TnM1w/OIs0We7foSYhPxPIe6A25rkOQZUw1RE+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9QPharc1afG+bDIaiRoS+M5ZZ+WovUHzSuZdKJOta4=;
 b=sWf1/SLkaXgIlroIjVCF4fb5aXRTOJ0wQHJDSV7KtGWeMv6dZ/i7rN0dKzK6giT03bSK54gm4aBDi09kw0Li1F8hA+Z4q2lF4jcEiDoImHZMIaOX0iP9LrzosaOqAEaqoMTXJV60Pan/jA42Ie21nWpRMfjosMPMUJ1sp5UBiYWC2wi+VEF1KgTGqTdiozHeNJb9mumY0mzXuvKJyJja54Wr+ODqVIeSQ8WKA7zbMzDtIiLrQPW04/kcHCDX93alEaL8I7+7GCN241EMTkJvlHEEu7CjV4kEpMl37L4lhyW/27lIe6hl0XaapBT3LmYT9fsH1HyXQHWxme7nR/AgMA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by CYXPR12MB9338.namprd12.prod.outlook.com (2603:10b6:930:e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:43:29 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 07:43:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 30 Oct 2026 16:41:32 +0900
Subject: [PATCH 1/4] gpu: nova-core: fix stride of NV_PFSP_* registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-r000-cmdq-prep-v1-1-f2befbcd8ba9@nvidia.com>
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7P301CA0027.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:26b::18) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|CYXPR12MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b15aedc-6861-427c-74c2-08df36597c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099006|11063799006|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	+b0PclzIV9y7fZ9yhvRVvSzueAA2z3HmzxX/Jugvu2Zaw49ukLoWdztg+YSBvjUaXYSTpC6jdetNqMZUjuCnca3OUfLyP5TJtr2Z9EXc774TzT9aZSI8xus5R4iVtU19gQuNynC9YwrbIJKOt7l09y4JN3FpKlP8+CbmLEBKCD2T1wXljwlte5pEguQQbtuSkgxThUvP7KUApcvfn8icLDGmLQXtvgal6BP/JKWwsINw86Kyrg/wucxNPhgMYDQnwSOF/VPHr0KEBojAis6WfUdouAudNRjxLlZntxyLlt+d38p5MCb0kqDcTV2LEgXJF08RG6BbVxsvPnjq33fgphlJ7Cn3yx9k4lIRop7jgmlqUJo7Ad9WM7Rmxak3YGTm0eBqyuaat6P9OuMP52/bJvegFwyAQJZIkaqNGwTyhFfqsPs4oGfABiKGtb8F1DiiQrSh4V8xALNF3+Hiez5zFXnt8BTH1ExuPQqumtSUUHn9y0xvttXjuyqlHNp5l/UjiWt/Ms0HWj3xjxFChyqH+FtqBkjuyeqWyHDwIWA8eszrAYuvrIdnVDqDxQGAe9QZW/mxko6pYhnPjyoZLEIJvqau2lDLBZKvrsVGQitwdjcmmoLKaixehxPY2L1pH7k03dbtVvDNpVYacKJ0mrrbtYX6OSXdaa4mdYBVHQQgwiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zng0NWI2cG9DckFJdnpzZWUrejF2aTYzTHZ2bTc3TTBQT00rUzBzNGIyVmR5?=
 =?utf-8?B?RnYzVVRpREFKV256b0NVWnRwRUp0MWtpTWxLdDg3VWcrTVBmVUZkdWN6MXI1?=
 =?utf-8?B?Y0RwSGVoVDBVdUxkZ29pekl1SW1mSnpXLytOOGlpT1pNMUVjTi9OUngwZE5x?=
 =?utf-8?B?WG9DMzZNV05vZ0xEQkVTalE1QlFNVjY5WWJ2R3l0RnZGUFd3UC96RnFCMDNp?=
 =?utf-8?B?WVk0a3poSTVPZGJka25lbEhvUXROdzlhL3BVYkJocGNCWVFOM0dOT0VDTEpC?=
 =?utf-8?B?YVgzQ2xZcXl2K0V0UVpxNXhBbnNsdlJlV1V1SzlubDNCRkdNM2grQ3l6NVpW?=
 =?utf-8?B?OTZRVm5LZ1VHdW1ueXNuNTVkMHVvSXpnamZGdmN5V2ZVWU92OHVtMGpXRWdP?=
 =?utf-8?B?UEZKNjc5SXBRWFhwaVgrejY1R3hMZEFtc2xLQ3h2QUREVFBWWU1mL2lTQ0Ru?=
 =?utf-8?B?WkpMTjloSFVsaVdkSWl1TXlLV2V2MUJqMXlHZmVMNzlCd1UzeXgwME5EcThh?=
 =?utf-8?B?ZTZZcmNzT29aMWtObWdtRWlWeGg0NytBUWhwTmg5RXBycFRSNTlwQlZHWk1D?=
 =?utf-8?B?eUQ2RW9udkJzTmprdVhvRzVhc25FRDZKSDc5QlArMXF2WFJHSEJ1ZjZaSTVx?=
 =?utf-8?B?OWVhcThVQWtSNUdGSkZvSTNKZ3krNnV2UmJxd2tIYzVoOFZFNHhURWxCNjB1?=
 =?utf-8?B?WGNtKzVZU29GSnBoUnNKWUF6bEZXTFU5M01tWVJoaTJrMU1IWTEyMm5BeE43?=
 =?utf-8?B?T2VMcDFwTnFiMjh5aXpTd00zZjlOdXk4SHlyY0x2TnJIZ3ZONG55aFF4TzRW?=
 =?utf-8?B?QWZYWFdJcFFmVkdwWU1GM0NBTGlQaHFDS0E1Uk01UUp0YUFLOW5lRnVxYXk2?=
 =?utf-8?B?S3V1VHZ0QmUzRXpoZWJuQUdFcUZlL1NVeTJSZ1FtcklQZEt4dVZxTXNoUlBa?=
 =?utf-8?B?MlRjNW5LUUtZdkYzNGR1akNiSEtmRG1qTEJTQkNzY24rK0lBZXR4ZXpkR1Jt?=
 =?utf-8?B?TG5la09kenVRdURtSExzelNEVUtsTkNtY1VzUnlKU3duSnNQamQ4cjMvL2xG?=
 =?utf-8?B?blMyUjNaemZDS0xMMHNrOEkraWt1cE00cjZYeGpDQ2M4VnE2NDRLaE5FaC9x?=
 =?utf-8?B?ZERWT0hqemN2ejZIQkZ4TXRLamkwaTNEYTlkTnlVdDYyTW5talVwYWFlam52?=
 =?utf-8?B?YnNjUkxndHpMdkVOV0hxbzNMZTlSTmIvMy9FV3RuNk00L1RyeE93VHV3dHJB?=
 =?utf-8?B?YXlVemM4b0U4SUszZ21odDE0Zi9qSjJaNmczYjZyR3JzWkV6cGlXZmtPTTNY?=
 =?utf-8?B?dlZsVGhtMVVoSzYrbDJGYVBORm9Ha3BwTWh1S1hnQ1lHWmlPL0h2SldSUWpv?=
 =?utf-8?B?TDRRbVM5eExzSWswdVdqR011THFBelkydTdzNTBpdXg2SEpVdk1VcUF6TWV5?=
 =?utf-8?B?RkpZY0tBRzErMjNwQ2FUczgybVdUZFNZVGtKQXNRYTR6aVkzOHlqdTFtakgy?=
 =?utf-8?B?TG9qeEpHei9LVW1tMW5SbGVsZmR6WTFXcWltWHl6UUg4WFRwU3QvTGMzUXRu?=
 =?utf-8?B?d1p4UStNT0hDbURycU5QRExCNldOZG1IS0pBOEY5TDlsMFk4OW5QWnhtbXZp?=
 =?utf-8?B?RS9xWUxZVW44eVFVOHh3SDVDc0xxT2M5clJiK2pUYXd6OFd4bG9GZWQ1VmdP?=
 =?utf-8?B?MTEyT2VFL3RHTU40eDZ6bVJyM283bGtXUUlkZWNnUXQ0Mm5yZW9oNWZ0Smph?=
 =?utf-8?B?dHprb2JVUzZ5S0paOWx3bjE3N0ZLOU02ejBIRU5mR2NkSWxLRENNQ1pMWXRk?=
 =?utf-8?B?OTBhN2hIenY4cE5WdlJHWitMdDhTc3cwc0xzYSt3MlZwTlgvc2tYL3ZJeWR5?=
 =?utf-8?B?VHV4RmFGR1N1RENldWtXa1pkY0l3NElrcWdXZWRkY0VKV2kwQWRtVGJpcWll?=
 =?utf-8?B?b0VPR0wrQWxLNCtNK0NRam02ZmREa3pkVURrK21FUXlFejlPVFVGY0pVZkRk?=
 =?utf-8?B?ZW9kRERvVTlTWjdxeHdpNlVBMGNYM3NLWFFleEI5VEZGUVJJRlpEWVFNbWUw?=
 =?utf-8?B?dEpEeFlBN2NKUDljaU40alBsc05wQkdYOHAyQWUzcW41K2JzS3NjRXRHS0tz?=
 =?utf-8?B?dHZ2VEg0T2ZqM0V5eTVJRDBzWXBEVlQyRW1pTDdsYXNIb1NwdkJlTEdMR21z?=
 =?utf-8?B?dmpJZEV4YlFKTDI0TWZRVUZMY1B4M0tFUS9jZzNaUDVXdlMyaWJsaHdacHZi?=
 =?utf-8?B?VkNYUmRqcjNOeUNTRVh4T0Z4WTFlZFkyMm43NStMRVk2V3FxcjRXSUFOaWVS?=
 =?utf-8?B?NmNrVUpkNEk0KytXZVRkV2FqR1h2V1dTc2pzU1Mrd3N4bzkzUmFIQkpJUlhM?=
 =?utf-8?Q?htLbUXfSANX1kBb8GamnwMzq2CBqAj16xKJDjK4dGKGKx?=
X-MS-Exchange-AntiSpam-MessageData-1: ijNcAfeML1AKzg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b15aedc-6861-427c-74c2-08df36597c22
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:43:27.9578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9PQdJa7UTBTk8W3+gxo0zLXJr1Z5Qa/yAtKfQCrMVuGuegVe659R9/gX0lYoV2bDhRf854aChPBteKqWsW+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9338

OpenRM defines these registers with a stride of 8 bytes, so reflect that
fact in our own declarations. That inconsistency went unnoticed because
nova-core only ever uses the first register of each array at the moment.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 88662da634dc..df2eddc58efb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -402,19 +402,19 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 register! {
     base: NovaRegisters;
 
-    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8] @ 0x008f2c00 {
+    pub(crate) NV_PFSP_QUEUE_HEAD(u32)[8, stride = 8] @ 0x008f2c00 {
         31:0    address => u32;
     }
 
-    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8] @ 0x008f2c04 {
+    pub(crate) NV_PFSP_QUEUE_TAIL(u32)[8, stride = 8] @ 0x008f2c04 {
         31:0    address => u32;
     }
 
-    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8] @ 0x008f2c80 {
+    pub(crate) NV_PFSP_MSGQ_HEAD(u32)[8, stride = 8] @ 0x008f2c80 {
         31:0    val => u32;
     }
 
-    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8] @ 0x008f2c84 {
+    pub(crate) NV_PFSP_MSGQ_TAIL(u32)[8, stride = 8] @ 0x008f2c84 {
         31:0    val => u32;
     }
 }

-- 
2.56.0

