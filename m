Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794374491;
	b=vMClu+y4sp+CZObebIE5lFjUQqU3QX2ElvYMu7z+dSNrhf6Q6EaFaZhtOdxwLBpzxplj
	 D+K8kGz20sJsnlZ+/X1/Jvc3nzeB6KZrVE6ttJ4KlapeC780A96xdR2PFQN8q3om44AeO
	 Y2yBDTFVJn9u0Nq14re7qrB03N6nMybI8tGi56pamv34FY4JUlnf9/i38USJeZBOQgNpp
	 JnnaI8jmPrB/1TaerigcJ2knZdloQ4X8B3vkpzGp6vWFYGtMpYMeIwDPXFQVU97LsFPBi
	 Vm8QgrGn6TAP1mGnLZUPiiJZzwwY514hGxzl7/gxsOIBUnwxaOuSesP7GwinXL9c3Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794374491;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=rrovmGJj7invubTwanG5gKiRbSKu2CYenQ8fxJ4agLE=;
	b=RMEpLBqSpm1bYVD3MZv1XaO5Z80IbHfU2YyrlPINL+lLgF13MCGaB7VXC4ndnh4Pxbr9
	 LbLjijUe6vxXTCEHQ/RKwJ/kcVJT616T0Jhi4S78FMvQBgz3ErlWvecsBQ4MpNGF/0k6G
	 6JQ5b9vJBxbCy/ZV1VPHgSo6BRX8qoQgAIljbHW+6rm2iPwaVntPGlh5/6jyfW/hGqQ9u
	 OfGm3DLayndbjcyrY+kcDEVXl5b3MzWXNf59OEVd8u9B8ibV3llZ8c3YndlQ60LVJUnea
	 QK/AUg7tgXH9LiZ0nSsTU3lImixKulp2NFEdsigQww8icMATvW5C6vYEZCf56ucdOSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bHlbbo2D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.9
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0678E606A31C
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 05:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0678E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bHlbbo2D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfmfDt5i02Vq8a67kkdWh7VT3T5MvSOFMQtCBb48jPP/Sl1yAM+kxl45idTr1ufCTeGssMYK5n1pwXgQn2e+TLDJsl7TSILE/BXWhedaehJubpu1AxzIol8IvV6ZkmNDiQDWPvUeKr8/2fgEwbE97oSS3foa2dOPAFcpTt4Vm1cc96KMAf+kBJ2yC+Z2loAz6nMdZb0+3uDK8PY3GAE1IS3KwKTfDdiYDmBy9nTqtz8eNUloJHP+aEhGIVHU4rJWsqDeLvJExVvf+VLpcr8eJU6KmzuvPlgNcicI5CCJyxkmk8idWHu/16yq2eab2rnQska564WRiURaDsp0QOK+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrovmGJj7invubTwanG5gKiRbSKu2CYenQ8fxJ4agLE=;
 b=RZ5tUgHu72Pd0UWjwnLAYsnH345rTjMEdq7bwHZXQkjD8qSevTU65XOgMyLTn65NPgdNX/jmpsAGXRxddMCfMHuCeHrf6nvQAmm6+VU5SKfB0Skp3IaS+QcbJvkj5+h42qY7wJh7ZxO8p5d0cclw652VG1FcNTKgDkIFdDKfEcX/0aY0u8cTPz/sivLhGR+4CpKXpTF3AXOM8c/T5LZnB11i2QqRbw/JFI0nWOOmpM/AfylPwEY4J5pDcaWdBkdeQ2O2GdC7Ir0ytvPY9A5pQZTdSZVFiEKmo5QMqai1+J2n32606KbOqIBmGv1eoBtDh6XEVcXKkG/wwHVik21CHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrovmGJj7invubTwanG5gKiRbSKu2CYenQ8fxJ4agLE=;
 b=bHlbbo2DOhZsflT2hgLeLFdQzjr2s6O9puXf1cTVAX2tdHYShKt78TkY3xa4+yLr0leSfW5Iz+Lo0bdchuu7CyZQsK6XheaxOM0tfgZQywLOkYA/+qjOio0ABL5i9rF8sCDLCZWReDRlgrHkvhhyJCZH9mg6k2zCNNeFGTcuQLinfcdGH0h7iVHTO2NjXKN59WHSXNJfcfxPDyahvsczN4PkWDdIB3pc5yuR7R+Q7AHKPFLt/WFNnT/s7uEsDsKs2SHh+HMuXYdU0yQGyqUag1aLIvERqeRStANvCAF6Rr0RWT7B3lutEM3coq2PaAnIJpFbAfLtVnEKDRwEesDCIg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MW4PR12MB6780.namprd12.prod.outlook.com (2603:10b6:303:20e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 05:21:26 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 05:21:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 14:21:20 +0900
Message-Id: <DMS4O0C9JW4T.3NC7R44BE47KV@nvidia.com>
Subject: Re: [PATCH 1/5] gpu: nova-core: add Tlv.get_u64
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110231053.1352163-1-ttabi@nvidia.com>
 <20261110231053.1352163-2-ttabi@nvidia.com>
 <199d4ffe-780d-416d-9946-f21ef18678eb@nvidia.com>
 <8f6caca82e82f457a24984503ef8fe896e0afa32.camel@nvidia.com>
 <58c3cb46-d871-47ba-bb91-da6712b56c48@nvidia.com>
In-Reply-To: <58c3cb46-d871-47ba-bb91-da6712b56c48@nvidia.com>
X-ClientProxiedBy: LO4P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::20) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MW4PR12MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 74924510-5388-4fc2-3ca2-08df3fb3a1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10070799003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261021135927099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9bhJ+B+XYI/TXVbhwd4qQDaYhO715tvSVHCKs8TvME8/LRP3rpv+qa/DfV1diH+1uNaPDe2y5T49WkgeXbuozic3dE7trt29L7lJY8nmmWJzEuJa+rBHGZ8SSWI7bp4YFVd1sA9dmcRKqDgO4t+pUKkxHXuHlnVCdmSpAaxKiZW8jiKKxFLew0qwlp/tKQXBUPLqwXvKOZE2k4fMLGoRyByIwtfT3WzOAu6MDqeEkAc47zf3+7K9s4aI0bSN+DB3C9t0Y2tkdb3H9dOmBe22ztftG+hvAz8TLEqup1FFKIhRPqloSJky+CEF3TIPxYtJFvDEf5qL3p7mh6ZyDlOblOwEEPrf3mpaQtC0Dx8qPmSitzG5UomhIPjaM426L7WAhOehpdTvBMxTagJ+Sh0g+HgqlcuM2r0atKzS3o353u218KvlgsWnXt+ck5ZunKU/r2jp6lpUXbZgEg5e4KHFSu/D52AHGMscf8sTe0XuA3QzDgpitmU9mS6YaDXEj9swu0F22rqwjCEkLB+Z4ktBR/32ioha50MzvkqBK0BAnT8qweXVJPoJz4tPlif1YfIDmfENva5M+J+EPCSbStHwQ2lTHUS4lfrU5MzmZagSdXstNfe6bvcUHAzxhtf7Ad3qDiSnfzYAOaLONTX7/U7He+p7N8JeJPQwu3ihl0wT4k4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10070799003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261021135927099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U256VHFHOStGTDJTVGRZaVBRR1QvSm9UTGh6N2ZlYkRRdURkMnUwNENDaE9r?=
 =?utf-8?B?YjM0a01yZWYyTUpBV05EeFVSbGdEc05mM0EwYWc1YjJlRXlhZmVudFByZUlF?=
 =?utf-8?B?R1dkS0txOGU5V21DcjExYU5wZnlObjhMekhVbUpMZjJIZVhBdFZzZm4zeGVE?=
 =?utf-8?B?R1FIRXp3WXdsZElhZjNGWFR0RkZ6RDJkekRGc0hrWmlINDMvTTVseDlENHJj?=
 =?utf-8?B?RmkvZjRvU1lQQU84eXZ2c2I5TUVSWkNhYVBFYmpOQ0xDRmJ0YWFGSi9RcE00?=
 =?utf-8?B?aGNHL1hUK1FXS1NWS3pBRldQaG0vMXcrUTlqSVJ3WGNRdzJydUh4bml1aW4y?=
 =?utf-8?B?czFjS0ZjTEZ6K1NqTFhvaFVRL1NNRHpFTHA5dmlpc0VEUnJnVWRGT1B3TzJl?=
 =?utf-8?B?cUN6S25EYUR3ck9sUkVWV3JLQTJTSXNwUHdZVkloRlFBcDBPVnJXdDBLQWUz?=
 =?utf-8?B?WlBWcWgvTmE5L0hVQWZya3NsQ3d4VWRZRG5YYklBQ2R3bWNJaDNJbmxjSmRp?=
 =?utf-8?B?SG5XbEZtaTdlbVFCRUhPbmRhM0xlZXJSWk9Cdi9XUVRqKzc2N2xhRC9pZGZn?=
 =?utf-8?B?NHFPekVpaE9JQ2V2WVR5aHBLWUpwakZYbDUxVmI5ZFBjaUhLVTJ3cW9kMXlT?=
 =?utf-8?B?SlF2Ky9mbnp5RTBkdzNmZ2FMVmtDYVpMdXFRZmx5d3Uxb0NzS0pzcjA3ZkZQ?=
 =?utf-8?B?R3l4aG5qL0dMQTBIdElTMzBQdS9wK1VBaFpKSkk1VTFDWm1OeXBwL1o4Lzl5?=
 =?utf-8?B?WERJM3pNSDFGWWhtQW1uZm40ak5aQVNseTlQZ2JUZElYbS84aEV4Mk95Z2dn?=
 =?utf-8?B?UjM0MFR2aUhENy9jMld4VzNmTGEwME5xNTM3ZTFqaTVmS1BCbTl0UzZ3Ylk3?=
 =?utf-8?B?dStnRE1JMHNzRDJBWVJCUmdtQXA0MThiM0lwRC9uM25BSTNSaEJxVDZsYUpu?=
 =?utf-8?B?Z2dWZHVTendhQ3F2RklzdmJQZTZranRDTnVhdk12bWVicmp6dXVTZDJ6WVNT?=
 =?utf-8?B?MVIyTGtCcXY1V1Z4WFpZUTZrYk1YWmw3TTVqaExNTjJ4RCtQdythWFJlWkFj?=
 =?utf-8?B?VlhZdlBUSEJLNXZHcklTbm5YTXNjU2ZyZURJMWhmRXVWMHFGTStRTy9SVm0z?=
 =?utf-8?B?S0xobDZlVFJuTjBFWHY3cENzOWZVT1FzbWhEeWZLTmRRajk0N1plT2lhV2M4?=
 =?utf-8?B?NEpjNXRCVnp4ZVBwc0Z0djZsN3hLZWZCN3NpNFlMRGVZSTFPaU9pblBEbE9E?=
 =?utf-8?B?V2JNcGo4RjBWVUV2cFdaMjZpMGZ0MW42bkJYREhUTm56L3MzeWlIWTRuYnl0?=
 =?utf-8?B?dnM3ek9veDVYaURQbXNaTUVTaW1rV0FYVmFENm5ZTXBtdVN0VlhuR3NKeEt4?=
 =?utf-8?B?c2hPNkRvWjE0UWwrZGdvaXljVFdMZStqeVBBSVl6VFEzS3l6Q3RlRVBpUGRE?=
 =?utf-8?B?UXNFMVBlempoS0R4YmJmalVFVktMaUNJeG1tRFBOMlFjUmE0V2hvNjZPZ0Na?=
 =?utf-8?B?NWc4QytqSXlCTTJqUnBhOFNqLzBBdGF4NWplV0tvUDZZL25vY29CVzBBSDBB?=
 =?utf-8?B?NHNIcVpTSDFMbkFadnQwMHVWYU9rbExhZXR0R29ENjBtcXZzd09SYXZBZmZH?=
 =?utf-8?B?ZVIrMGxjT1N2ZU1zYitjVEhObC9rd2s1SDR5NHJPajhqRDRhbFpSVDRTRkdB?=
 =?utf-8?B?bkhKYVY0U2U0WFdOVzdrbHVnM1BaNkZqelBhVDIrZ05DMVlUVEUwcHU0eXM4?=
 =?utf-8?B?RFU5Snk5U0hFRElFUjA1UDRiSHU2T3V1QXRucXNGWStrWFVYOHdoZE8xM3A3?=
 =?utf-8?B?SCtiVi93TTJXWUQyYklnMlpPYTJNaXUzVm5wVDdOdWNDL0ZMYlBMQjZjSkpG?=
 =?utf-8?B?dW5SUVM4Sng0enBpelNIb2hwQzNuRGY4M1Y2RDRDbjlYL1c4VGdLRHVWcm9F?=
 =?utf-8?B?b2MyeUFBMDk2NndQeFhjS21ISnZlTlNVaXVhZ3JNR3hDQlNFYnhkN25nS1c2?=
 =?utf-8?B?SFdtUlNvalloVk0zYkFJZ25aV0pGTGxkc2tWbVBaeXQwWHhzMGNoNEU5VjNU?=
 =?utf-8?B?Q3dEUGlVcWVuNEhHQVU1M25DQW13ckovd2pMSTNSWmtFWm54NHlmUHZNZDht?=
 =?utf-8?B?ZTFEaWI0YmJKSEtXRXlieGloOEdYczJVK3IxRE9rWWU2aTR4MGFMVnUvaW9Y?=
 =?utf-8?B?azJIcnJEZy9rMjcySC9HRStyaWFUVnpWZW9FRS9iaGphYlVGWHVFUXgwaG9X?=
 =?utf-8?B?enVva05ubFpZTlJjc0lhcWxEa2FEWEVweThwdjhvd3ZsY1RMVTFPSHlFSnFo?=
 =?utf-8?B?SFljNk9WakVnVEdPWEpjT0hQRE9ORnFMZ0lmMm14aUVVUzUvb2Q5UGhQd3Zo?=
 =?utf-8?Q?1tcT8/kZG7xgbq6+lo0BeApBX46ASVgqU8HC0YUHf51EG?=
X-MS-Exchange-AntiSpam-MessageData-1: Eo/XxP3ZlCXazQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74924510-5388-4fc2-3ca2-08df3fb3a1c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:21:25.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pk/0aeH/0hFVSLcbipwH048MLsAwLJXO8J9wEV5CBROGzL/d9gRh/JaNux/L5qemoKWXctt8gl6Us1Rs3iCB2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6780

On Wed Nov 11, 2026 at 12:45 PM JST, John Hubbard wrote:
> On 11/10/26 6:59 PM, Timur Tabi wrote:
>> On Tue, 2026-11-10 at 16:20 -0800, John Hubbard wrote:
>>> On 11/10/26 3:10 PM, Timur Tabi wrote:
>>> ...
>>> ...but then first_chunk() checks the length again, and also returns
>>> an Option that is never None.
>>=20
>> In an optimized build, that check is not actually done.  The only checks=
 are for the match
>> statement.
>
> Nice. OK.
>
> ...
>>> Instead, we could use try_from() to check the length and convert
>>> the slice, in one step. Your TlvBlockHeader::parse() already uses
>>> that approach, and I think it would also work here.
>>>
>>> Something like this:
>>>
>>> =C2=A0=C2=A0=C2=A0 pub(crate) fn get_u64(&self, tag: &[u8; 4]) -> Resul=
t<u64> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let value =3D self.get_bytes=
(tag)?;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if let Ok(bytes) =3D <[u8; 4=
]>::try_from(value) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(u=
64::from(u32::from_le_bytes(bytes)))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if let Ok(bytes) =3D =
<[u8; 8]>::try_from(value) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(u=
64::from_le_bytes(bytes))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(=
EINVAL)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0 }
>>=20
>> I'm more than happy to change it to whatever other people want.  I went =
through several
>> iterations of this code, working with Cursor to evaluate each one.  IMHO=
, they are all ugly and
>> hard to read, because of the from_le_bytes() constraint that I mentioned=
 in the comment.
>
> The reason I responded was that I think the try_from() is nicer
> on-screen. I hadn't gone all the way to the asm code.
>
> thanks,

I prefer John's version which looks a bit more readable to me. It's also
possible to write it like this to avoid writing the array types,
although I don't think it's necessarily better:

```
let value =3D self.get_bytes(tag)?;

if let Ok(value) =3D value.try_into().map(u32::from_le_bytes) {
    Ok(u64::from(value))
} else if let Ok(value) =3D value.try_into().map(u64::from_le_bytes) {
    Ok(value)
} else {
    Err(EINVAL)
}
```
