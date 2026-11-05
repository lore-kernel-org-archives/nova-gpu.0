Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793882846;
	b=tNJ8PbxJsbklgCu/aNqXmYf0bu92GZeAsnJa8LI27rGjUpze49bvp0o7OnVrjne2+7em
	 vLzWRWjKgV3EDEzB0bNRFuTnjofwv2U1supTKFm9s2lkWC61Zy1vJ9M/dFuqugtj/5hHO
	 KVlKEWUASHhUyfTW+qyZ+yVNELsBKM/HmHHZoF9UL/7utrjABHpUWv6iyfkC/v6mbo9tv
	 pHomuiuDCxni3pNv/DLIz3EIG3onjrg7u1b3ZHc0/EHWexSaEf+H0XCKUFwvLWptDnO8n
	 kLayV6ihg/rax5A5NP1eFFzlunBFlJ0jbu3uduXomNQKuEHdcAPAt8Y6zhWT6KkhKgA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882846;
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
	bh=HKfp0p3nKebA0bl5fMXQpmso/Sk3gLx1Xp/Vdc1xPf4=;
	b=Wfdm2ySYtmYwSEgMOaA2g0MIhHh5UcJrxcLIncI6ATchJ2ONFK/mLk1JE4sO8itt4bD5
	 vW10O9o43gmaIc+4J7+yOnrdkYeRQO/ic9VyzDYd9CtK1bvxOpN7I+BnD2M1Oiba3sTmq
	 HUsbKTmS5NiEx2WwxoXtd1JhiQFASkmgGoTlWRJ3FWLfiYUWHA9F32P5Thk3VFif1mQan
	 ROlMWx7AQ62/A2bVwYJoB2FRNuNR3fK3W3vWkX7N++Wmk1uT1EsHkTOIcZi5pNUfbNM/g
	 2bagWE86+75GHEW0O9RnO+DFz+lty6euU+OfKuHOTknxaBawEzRC0CgYY5DL2UZwh4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tTuEEh1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.71
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA8606A326
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 12:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FA8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tTuEEh1I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4ns226rc3xpJcRxW9+4JEAmzgnVvjdYItyAwubP1ibrXtYI12MrxoovZuLxE6FfPh9TrozgBitL6+wsJlAN9A8bL75SLpxbyRMc2rfsQnzhtFM0+QIGbxkOa/B1IekMSydzxbs9xrQrm0tGjG+n4T3WSA68mKO9szl+bPLrZAk+qKqP+JURNF2F688vZWHyUWkw+G5hDy1LyQ7Pz7BiDZN60skRDkKD6t4jR4Jczktwb+3KJE8Pp40hfDCuLYl51Phc0dTCVq15bbExTV2EHK4uDcy/HdvRz5DugPP8RQqa/9WEdt+6iSmME0/Ju+rqFDGxM4/iVjO1rl51wPSUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKfp0p3nKebA0bl5fMXQpmso/Sk3gLx1Xp/Vdc1xPf4=;
 b=mIAcaVa2Oe3c0TBTDoP+R8zsfPlQzbqt0Qd9GjoKruuy8e/+5x6b+YTE61NK3E6GcOM4jM7c8PjMOS5sWCvmhIOZSIkUWgYKT1zzL0Em41TuHqanHtkNG2tv99dlcrwUfRG+/4HiahFoFEL7JjRWtNfEmxTp4rXtzw93sJ+q+VRieYUaYU1w3YiJaS+nQj/gIJqixGqJNuSYtPUabqIyeGjjt4RioGgN8WAEK14aoal5XG1oJBf5aTxUKd56il2peLYRdFfhevReOgDHphF6LRytzLGq4l0sNZ1TpMUjYiEzBk+GyEGwWmoVUah3QogJaBmgvaKqpgAxipt5RMvu4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKfp0p3nKebA0bl5fMXQpmso/Sk3gLx1Xp/Vdc1xPf4=;
 b=tTuEEh1I1brIC4e9VVzCBqaUDUL0AnfiuImOvDi+NyphOyJP+XqvcJqG+obucgeVNbZWHtSj508MG7a6HKm/9+k3Mof3ToQCs3OW8Vz99s+c4Qj2eLmrUNu6gJLVomMO0TVmnRDj70dltuK9LgnZ2yty0t1XCvnxInKvEPpLuTb/ykC7oTviUdIig02HW9sy4IS81wQgSwI/lGGGdoLcy0iERRgqWkk8egNk17YJBTvn/toLMa4UJdSEfESI6JkZpMGayMDwohdTKe4Vfa86Nqf/+T2qJaxBIVp+HrNU9Q2nLyS+Dc0UgZMd57KKYycvrfjrfIOVTkOtFYWp3qsxkQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DS0PR12MB9398.namprd12.prod.outlook.com (2603:10b6:8:1b3::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Thu, 5 Nov 2026 12:47:20 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 12:47:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 21:47:14 +0900
Message-Id: <DMNAE5G4NW58.3H7F8IEQL0Y2T@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/7] gpu: nova-core: move the bootloader DMEM descriptor
 out of FWSEC
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-3-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-3-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: LO0P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::18) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DS0PR12MB9398:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d57b10a-f6db-4a74-d451-08df3b3aee5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|366016|1800799024|6133799003|10067099003|22082099003|18002099003|3023799007|56012099006|4143699003|11063799006|261102123227099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	zvzXsB9JYgNSfumSiMcYwtPYLsouiNmy+6WeIo6IEGD0bu1Y6CcJWl/qjnDajQjjW6vaT/ONi3qOffdBSLAYka9dfPlmJvdMwPL/ihPsTtLyiQPpoYFGuWXHRWd1NYpgRepqQQWOg1YEZPJqAbQytgLSEThIpfR5QvPAlfg5vyz5Rw2aXum8owh5Ol28PZcPpAeYP8pFNICGQh9JCwp9Q/P4UXcdTtVF280imXIC1+uoTRiwrRrIe2db205EmuWS3GrT9ifIbU7NfvEkcC2MkUn/y4PB0bGqNaNRj63Znwu//sLNDketrGgaV+i+vpAWJ3C1nV2eZ0lTspjOa1X4EKh6CuNQmndX4a4p01LZZUXdpUBBuVFLsAiCL8iVn8QDq7p2Xb+4W9+WaG/yXhP5eJUSnfyJq6KiJvie+ZnbyjWIDP7gSbVpXQVgzpv5V5jvlkXhg3ppyNbGj2mXoR0aOC2tTguk20Y147YfjMCHuPM+8MHW2/C5bMUYiH05u9tCY8FT9N/uVweFVXeim7kcK0zAJpSL2dIFOEm8DMrW05TxQ3dW5qV70bwR5piQY8kUCHPy55CSPrhP6nheAbMSN1V1Moew1gctRrwn7PeooTtFE55RXtxMNrNnUUGB4IlpHhPeAeDv1dy/lYDGW44AnL+KTREDa5zNf1Frhl3/jGA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(366016)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(56012099006)(4143699003)(11063799006)(261102123227099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzZKRDIraFJ5SkFYM2J0VWZTc3ZTMHhzKzJlaThLM2pWNUtvT0h4bWRaNTlQ?=
 =?utf-8?B?RlhrUW5nMWhDOVVpMWY2VHpwUnpNNWc0T0lzTk5OcnV4Mmw5cnVJcTdLdTR4?=
 =?utf-8?B?dW0zWS9Zd1J6QU9oaE1nR2xWTmhja0NDdlE1bzkyQ1F4RmY4TGgrNUJtQ1Zo?=
 =?utf-8?B?RTFpY2FyZmZGRFpDN2lZdzB3QnUyeVUyUzF4TERzcTAvRG82UE9FM1ZPbk45?=
 =?utf-8?B?cWNKc25FODE0VXdhNlh6bkJTTDVXajViallMSGtOVTFQeXRJSDFBK0c0ZFBK?=
 =?utf-8?B?Zi93K3ZFeDJObFlzbVowMkRwZSs4OW5NUHZoa3dWeC94M3RHRDA4endIdHZV?=
 =?utf-8?B?amsrZDg3VXVOWXFQdEJRTTJGQmt0N2cyN3B1ME05ajlianBVT0Z3VEN2ejN3?=
 =?utf-8?B?OERuT1VMTFZTVnVpR3Q2TUNvcWVWZStBKys0YTNIbzU3NWR0Y2JzWXVucTlD?=
 =?utf-8?B?NHVZNkUxMWNDRWVYSys3TE9PbjlyMUJ2OW9RZ2c5QktOQldSMmxvZSttdFVk?=
 =?utf-8?B?QVlpaksvTGhsMkp6bHJsaHF6NGIwSmtwaFFYVSs5aW9LSldCcWg0a3JFWEtY?=
 =?utf-8?B?TU9BZkZJVHNGWDdDcWdEcHVsZjBPTkVMN3ZZeUxVYTBrMUxmT3ZMcU1VMmdr?=
 =?utf-8?B?TFZ2aWxQbHROVlZVT2loVW1DTnU4dGtib215Vk12ZXFtM3NqMWUyUCswWEdp?=
 =?utf-8?B?YjlicVJtN1lSd2hWZ1BlZDJFWGdtdXVoa1BNVTh5b3RIMlBlQ1ZFQUNqWStt?=
 =?utf-8?B?dnpwcTZHMllEN1JFbnA3emlQNzM4a0plUmdJMkl2U2JqSWtmVzFkOXEvdDly?=
 =?utf-8?B?eUR6eXcwTUFnaHBzRkNNenp2VnhvN200R2J2WThSZndsMHpPamtyRnQxSWxt?=
 =?utf-8?B?d0ZCdGZ3MnB1UXBzZjliS0FTSGdYVzBVY2xrLzdWYUZZeTV5QUJJeFJFekRn?=
 =?utf-8?B?TWg3bUphenRnc050Q2Rib0g0QlNrcG9BNy92eWNXVWtKRFRwUlU1Z0xKakV2?=
 =?utf-8?B?Z05iOFNwMTVveHdscFZoUndjNkdmSWNvQUFHekVUNFVSd2NTa2h1bERJVFcy?=
 =?utf-8?B?V0JpcERFVHFJblYxd2U1cG0vM1hXbkNKcGpHQ0FXTStFZnpvNVpsM2FaZjhS?=
 =?utf-8?B?a2JuREdGNXlMblU2a0ZhaHZ5RUFCOS8veWZnZFpHei9MaHV4UjQvZGpwM1Jz?=
 =?utf-8?B?bGFuaXlCdUJKSG1JMkhsS3JheWZLOTRNRHZrWEI1NzBTRk1iQmE3NVdBMHMz?=
 =?utf-8?B?ZGo1MkV2ZGNGZFJBTkNCTmZqM0VlZkphakVCNC9UWXRrWnlaMWRwODJTelJD?=
 =?utf-8?B?L0Y3U2VoSmt0UlpJT3E3RGZxRTlGYzlGL2h6cjM3UXpHU2kzYUJkR2hHclZj?=
 =?utf-8?B?VjZkSG5JUHk0ZVlZQ0NhdW8rM3pPTXgxN291MXpuOVExTUROSUR3TlQzUllO?=
 =?utf-8?B?UDA5YTA1R1M5SzZiWkdoSmVTVXdkZ2d1ZEYxZ0IxSUFieVE4Mlc1N1gyVFFl?=
 =?utf-8?B?Uk95dVQzNG5kSFRQS0VidWdxNkg5eDdMeDZRZ3R5dFpSZTZtaEYvTXp5c1VD?=
 =?utf-8?B?RThCSEw4UTBSNzZ3b283ck9GUXl1cis2Y0M0OVE5ZmFPUndueDV2MVN1R0xD?=
 =?utf-8?B?WEVnUWdBVWlIc2kvQXRzZHZJM0tRWFZjRUk3d1RjcGlkQi9adEM3aTREYVhw?=
 =?utf-8?B?cDVwMTluRlFYU2tXYkJBeUVUaW91WG1sNVBvbWJ4NUZUZ3FXQ3d3YU1FOEhr?=
 =?utf-8?B?dktoaXByMFFpQ2k1M3lUYjQzZ1BudGJnR1B6dG1TeVBVMC9GcDRJNFhPeXpm?=
 =?utf-8?B?dDd2OG43NTF0NDJnYXlPa0lhVVpVRHIybW0rbkZxQytmeDI5N1d6aGtsNlZr?=
 =?utf-8?B?QXRyaEJZWTJSQXNrVzdFMThFd2NSYTNpclZGUk5UbUdMazRVTDdxcUZTQXp6?=
 =?utf-8?B?dnZUK3Z2WXA0NEkyQnkrWGJCNTRqVUN4T3lpb2xjcStyeDdhamppdU5ZTVR1?=
 =?utf-8?B?Q1FBMmVyWElKTGtGaWpoTWcwNWpTZDc4OXkrVlZXYTBwTnQyL0puTHpTdy9B?=
 =?utf-8?B?TUV3YndwbEtHbU5mcHY5aUx5NWFVQW5Qa1B3NWlEZkdIdHpYaGVMclU5NWc3?=
 =?utf-8?B?Q3dvUkQ0K3YxWGNIMy9DRzBjM3NiekY3RjVoMW5YNGRLUElTa3VaU3ZjZHhZ?=
 =?utf-8?B?OFc2d0hBblRIYlVpQjN2Q3Jzb3BKU3BUYU8wZkJuRnlXQWR6S01qeWJsN0Js?=
 =?utf-8?B?blhvODBjZjdLbDZvZHdIb0pQU0lZdEE3bTBlUVlaTnhYTmwzY29iVDdwM1VU?=
 =?utf-8?B?ZWRlSmZ0YlNkdXZmYzQza0RUZC9sTWhkdHYxOWN1QXVRVjVFSExZUnEzWlo5?=
 =?utf-8?Q?4J5AJRdsL36AGLzU9pdRuPS/V+u4FRNERRL8iJj0w9Cpa?=
X-MS-Exchange-AntiSpam-MessageData-1: 2cohSuYv9J7/cw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d57b10a-f6db-4a74-d451-08df3b3aee5e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:47:20.4725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIHTM/awHxgXeQBN+zCe4Odx5kHs1Eh5OvyTHRsVa8/TRt9IbQjHyGbQFWEUXemmV/b8vMwVgfS93/E6TA0A1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9398

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The generic falcon bootloader reads its load parameters from a
> descriptor that the driver places in DMEM. The r000 load-and-execute
> bootloader event carries such a descriptor, so its handler will need the
> descriptor type.
>
> The descriptor was defined in the FWSEC code, which was its only user.
> Move the definition, unchanged, into the generic bootloader module.
>
> No functional changes.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> [acourbot: keep the fields private, add a constructor and the ctx_dma()
>  accessor instead of making every field pub(crate)]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
