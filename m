Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793598452;
	b=Or9bFuhRMsPYpUTR6p51hPqmtoBx6llvMJM7vTI2ltTbnVhRHUFI4xG72i3A9oEbX4Kk
	 iB2ZR2pLOwN9wRQHTNdTxYzgvwOz2HOOdghk+XhYUKaeGEWtvlRAq2vDvkBRtgdZa8JZn
	 FhhVhj+h03CUziqJ47+VbRn3ufLbtQBvbJEIs8a18h6bUy3WulgTzOlMPdbGEVCcW9djb
	 50Bw1I/CaWLPabpvHRKbRHHLLjFji2A+0qlYQCTP6WOU6Yq/1MJVGnPYPsuwMZEC/k5fU
	 7dJ+DmindNxr8wY+oCi+q4We7D0SnGQK2KufA1wgLoQUxZDUaYSTcL3KaXw0XotNMfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598452;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=4JHrie2fhT7OFeureO9DSHroJx2MycfpORqwNCwHDow=;
	b=LdpH14ahewmiYNKhWnIxyQLsEyewNpfogEmY1iJq7JAEnkiPga3tlfZ+JBLxUjoW8l+a
	 /a1TWm4zYugJz83rfWjaDAXCZaffXa/XaKqD+9cUKvlaASB9YLyAydmwwsGDAdc4eIBxB
	 ridgLZ21KQCpJradE7IQ9o2o6dv3RClq5I1K8jrPBYbNR81NtLMgCsraN2L5vNoxSpCej
	 d51Cdhf8AxeIlGdn9/M2l0D59pEao5V8YKLlnDR4+LosMjVc1gqtBKguuvdS3YQONuFyn
	 KaNbWQbPH4mH5vwoZkoJBdQH5/Bg2oF0rkK72DTTskWik4hgg1LR0sp5IyWrX4k9zNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LwDBllTa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.56
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010056.outbound.protection.outlook.com [52.101.56.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F143D606A329
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 05:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F143D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LwDBllTa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOPp/tBQW84dLBgGvk+3H4vre/uj7LK6CW2f49KcFHqKpv/QbeGcaKSSbZkETFLE4a/iCTNxhORVVymeGXZwvkt2Q8kqk0Nz6a+sFmFuGcP72KjQUn7WF9Ji2n/X6ccoDBzEv30BsFk1eLVc1sZSM0DtbBrJDitANzFy6cbZjvS+Xoboigv65n6PN/MfWDKBIHdJJlvcFaz4g5LVua9SIz5AivyC5W8dtF818X8QSTn4mEQTKmLb9iCoDfJkDE1lG7D3bKZMZRb+Xu3d4wuUOw3XsVb9UWZFuBMA/H/ZAtJIhhp/0F3MUjBJXD0a21lBjpQlmDtt2cNId2IMvM6ftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JHrie2fhT7OFeureO9DSHroJx2MycfpORqwNCwHDow=;
 b=IgVsElQ2RfaF9EQmH0iAfuMNPq34pWH3qEEn1AVnVtFkccPxYxBDoiofT0ZkodME+oSE84iRw/SxXOwMud5nMqdGO+FIJ8XgKphcSw5YkJZhk93Sx1bZ6J6fPkMKJ/x9k+Ug4II2Q2U1aGn75cIc/+U3/JbuwHKPU5sX0zPG9iiidRQylt0/SA0oJXrgenK+rtUylS2iq2PpQbgb1XDTSm97N1qFQCIfGw/g7xc8VXVQ5WcSCT/ycXbkS10aZmm+ATBRapIlEupiVDdE7vnqBzm3xDtWVBNb/6wWfqkfoQcVKRvRaS6NBt0MGnbhLHAlT4mPHconPUyPvgifEryVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JHrie2fhT7OFeureO9DSHroJx2MycfpORqwNCwHDow=;
 b=LwDBllTaoiIMGDifuV60uuEIwnH8WctepulvPFbDPmK8r/0Ag8rTnJhrC2MPRqUrG4qr1GZdcTdVea7fDE0jlulh8AJq8id4Tdt5NIIbltFYizugXxPjZ2rVZCJo1/rnpqnmTgApqBWsFv1el31//IC9h3H5sEeibR3gGDbNX7xZyRIfHmVUuKLQDVeRVUPpulwbPPw7VN8fiqk4trxRNm8JZBv8BqMXtV6wn3tfTEjwcHSc+q0zsBOfeTZdgm3W5MiRvIgzibrLWxQMw+xgHG00AW1YTHuAyr4izgDX34rQIGmQ54aCWWzpUAdskpcopkk2lJrpS3I6DjNKKQ/jYQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Mon, 2 Nov 2026 05:47:29 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 05:47:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 14:47:25 +0900
Message-Id: <DMKHL2WXTG9R.25WTHMW32HYOZ@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: regs: add msgq v2 BAR0 register
 declarations
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-r000-cmdq-prep-v1-0-f2befbcd8ba9@nvidia.com>
 <20261030-r000-cmdq-prep-v1-2-f2befbcd8ba9@nvidia.com>
In-Reply-To: <20261030-r000-cmdq-prep-v1-2-f2befbcd8ba9@nvidia.com>
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 45afc846-9262-4a76-3838-08df38a4c7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10070799003|11063799006|4143699003|56012099006|261028144727099003|261021121427099003|261021135927099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	MnEQ6bhgr8JyP78wIOFzqteYqKl/lkooarDQJjiYzLDuaJt5QgTPf06u6LLlmftPMMkizmzKYLSOtZysr2aH5vtteS74V193ZccaX2PygCm49tf8bGKvhn6M0dcxPqDnuqouwTx2flJ7fFPp5eEjWHgvEamqzT+7TVPTTw0VWcGPmwCirA3D08N9WOOGVrLb1eyrwwOMDlusv1PH6Wujq5u4PfqR4SkEhMDk25lnkvCaebZiwu5VsH0XgiZztbSo2cORHcIHXQsXWMb0OVTYNsUayvVKkNEFfbSbCbemCWIQ+2ZzOJ8NAAI0WsNGoVompff1ZZAkO6yfT9B5UgCsaGVIk8UiMhOA0J3z46tY3T69rVC57DLj84yGkMC5ijOfFE350YONIGHP0hh/BBN8Mpsp83HqdJu8iU21HzSiR/Uo88R+pkrq0lch6IvFz2jQ24eRT8JcZE63UyntoQUuNKEd7C5y8i9Zmfveajb/KvRzetg5MG7kqPg10tMu52exWowuCR1z//dYar5HWto7AZhqNW1ANKghyUj/xXUGbS2RzyU6z5l3+8+AiN20DE3zlk2xp+jHgqSPymTejNu88H1uh9pR3VH8XVK0+W3mZfyHvpOlPTcHLR/qm7hwXLNjdEdydvQh4fkfgfcc+WTzbGA8Rwy48qwtxRj55ye4l2g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10070799003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261021121427099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alpuYTdNbXJiTjlCV3F5dlFURFdCRGVLeG1DRnRnZ2hGM1hkdEVKSlhrR2Ri?=
 =?utf-8?B?b2dNUjN1Y1ppbEFYai84djc1Mm8rYU14Q1BMWVhLYXA2YWlwWkxyUkJBc3Vj?=
 =?utf-8?B?TGRPOEkxRGtrUWZpcDJITW5hd1FDZTErN1VvZUUyczBteWFka1dCVDRVNjhF?=
 =?utf-8?B?UlExUzNoLzF2QmltZUFUZE5ranZMajNwa1gzRzdUOVN4TzAzeURrZmFpdS84?=
 =?utf-8?B?SWFiNjlNdlNJTkdmNmdKRTZzMk9icXVPT2d2Mno2KzRZMmF4RDdaVUo0d0Zv?=
 =?utf-8?B?QTVidVJ0THlmTDVCY29CQkNscDVwU3gzaEVUUS9pdEhGQW9PcnBlZGpsK1FJ?=
 =?utf-8?B?NVgxNjNpQ2YvV09QV2ZRZFlwL1lTQ3k4RW1YaEM3a1NjMzJMNlU0a21nckVO?=
 =?utf-8?B?T2x3L2FFcVIxMFNkTUw1SHVmTlQwM3lFUTF3dk9aZi9SRSs5OCtIV1Y0U3pr?=
 =?utf-8?B?b2U0VkhoTy85V0FObWlxNkxIaEo0blNpd0pCN0hGL0VWK0Q2Zm01OUI3K0hX?=
 =?utf-8?B?cnRUSnhRd1JRUmdXSFRzaXpXWjRYRklselNSaHBNS2dPK3FXV3dWQnhPTHpY?=
 =?utf-8?B?QVVhSmRBeVV5NmloVDlhOGs2NGVzM3l3bUZQSmM5cWxsVTRLMDRkaUxjMnVR?=
 =?utf-8?B?Vkl2SVU5eExYREFHUFBLRG1qVllkTFpqUlBrOVVJREtqUUZZV3BLcVlrNUd0?=
 =?utf-8?B?Yis5SEhUQ1hvYytMOUxHWHRWZmVrcGE4RVVnd242UlMwd1JDVWhIc2EzeUxP?=
 =?utf-8?B?eXJhZ1hJTW1abDBXWTNaWFovczdMT3dudnN6QUVuRFlRanI1aGFvNXlUbnRr?=
 =?utf-8?B?NThRUFVLdzlhU1l1dCtNVS9FS01UMTM4Uks1WWkxWWJqTHIzSkRabjVGNlhG?=
 =?utf-8?B?QURSRnZiczVtb0tBMFp3QnhIN3JoWklpbVp5NytjamxyQUJNeXhSelhYSmYw?=
 =?utf-8?B?WDlMYW00MkZ6cGVNdkNqdWU2SEtpNTlMbm1yWlhKc3ZTL2MrMjBSZDBqVDhr?=
 =?utf-8?B?MXYvc0dJdlhWTE1lbStUZzZIajNyOFFKR29uSDdBSU1IdU1YQk0zKzJ6clBL?=
 =?utf-8?B?TnJ1WVVxZTF4ckRiVkc0ZDJEaDc0OHAvbzYwZUhDd2tRaDN0S0xObGs5UTdq?=
 =?utf-8?B?amJ2bFJVdlNZUHJWVEhUNTVpNFNrZGR4cWxYd2tXWDFkR09iYVBOenFVR3pq?=
 =?utf-8?B?cG9mc3oyejJwZXlhZmRHeDhFdk1MdkNWdmhHa3NvR041ZjhRVklZNTlpM1Na?=
 =?utf-8?B?NVVhSXRiSUdRYi9FZnRQTTQ4NkNSNFZBV1diK2N3VCsvaC9UUk54MU9XQ2dk?=
 =?utf-8?B?UmlJOXVvcmREOEFUc0xPMVpBSTRaSG9SRXFQdjZOM3haUHAxRERPRE9jR0ZV?=
 =?utf-8?B?dVRCRUNHdTB6NjMvaXVtNjdiTjg1QzQreE5qL1I1ekQzQjZUREZhcnJWdHdx?=
 =?utf-8?B?RlRZa2EycU9HNWJDdThPeUVCV3BsSXlMQU8xK3ZsMDlxaThmRWxqMjB6Qnho?=
 =?utf-8?B?V2JXRHdmN2t1dEhCSDZNb0ZQbjNObHVXcElraXdIc2lxem1PTmtYWnJLNVNR?=
 =?utf-8?B?cGRnVURNcnNqNG9kekVtTEM4ZkFYb0dyRGdlWFZrbm1BSFhBWnZ0bE1teXVB?=
 =?utf-8?B?YUhUb1ZOTHFFV0pHNHJDZm9RY0ZhUmFraVJweEJSUXJkTU5GV2kwMktGNmFT?=
 =?utf-8?B?T0VrQ0loSmlZUzR2VlBDRURQNEZUMkJmeTU4eUdYdTdWTFBOVEtMaGVSYW1t?=
 =?utf-8?B?V3lLazlrbGN6NjZPbkl5ZmFqT3NSTnJwSm1ZclhFTEM2WlBBdlpYRUhQZG5a?=
 =?utf-8?B?STJDZWN5ZkYxRXVaV1NiT0JPeHB1TFQ1eGJEcisvNHJMclBRTTIxSTRlVUMz?=
 =?utf-8?B?WnAvdU9BZ045MG1GUk1mZVplM2pMZktBaXNVdWJkWmVkdEIxZjFCanRXdTVZ?=
 =?utf-8?B?cEdpSnhDTk5LMDlCamxkY252b1ZnamQzNDV2VFNFTmVFQkcrQlJUTzE3Q1JC?=
 =?utf-8?B?NUQ5UGo3NnplOEtlMXJwenNZejVRRUw0bVNPK3liYTRMWGpQakNZZWh1cjBD?=
 =?utf-8?B?VDVRVVZQNmo1NEhTSXV0bzVSUks1OUhSUGZQanlXbG1kTnU3eFMxckJDSncv?=
 =?utf-8?B?MjRNZHhleFA0cnpPcTQwc0YzaHg2cEdXV2locGdBTGRVeWM3OVJraXBvSlhU?=
 =?utf-8?B?UHFyWFJWcEJsdEoyMXo1Rjd1Z1AzS2UrWlY1cFZaVHU3RHAyVXVtV1QvbFdo?=
 =?utf-8?B?SmgvcEo1TWJ1YjIyRk5xci9UUW9zNzhmOGMxTDlTN0VPN1RzRk5DQkZuTGYx?=
 =?utf-8?B?RHdyWlhIaUlFKzl4aXZHaTZXNW1CMkt5eXlKSUlFMzdIZENtNllvOVBBWTlF?=
 =?utf-8?Q?89G7i6e3/c2iH4JrskJqgj4nM/rxyV+g4BDPXUEpx2CeJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 5NB1L4dbylwT9A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45afc846-9262-4a76-3838-08df38a4c7bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 05:47:28.9296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlHWzXvNtwxxrncUET32xa4ac/wOJoUcgnWzjQbpx2rv+1O6mRDftEGPCfRhHSdgTZsfpS7SZkhY9hjbV8j1NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

On Fri Oct 30, 2026 at 4:41 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> Msgq is the pair of ring buffers in shared memory through which the
> driver and GSP-RM communicate. The command queue carries commands from
> the driver to GSP-RM, and the message queue carries messages from GSP-RM
> to the driver. Each ring buffer has a write pointer and a read pointer.
>
> Msgq v0, which the r570 firmware uses, keeps both pointers of each ring
> buffer in that ring buffer's header, in shared memory. Msgq v2, which
> the r000 firmware uses, keeps the four pointers, two per ring buffer, in
> four BAR0 registers instead:
>
>     NV_PGSP_QUEUE_HEAD    command queue write pointer
>     NV_PGSP_QUEUE_TAIL    command queue read pointer
>     NV_PGSP_MSGQ_HEAD     message queue write pointer
>     NV_PGSP_MSGQ_TAIL     message queue read pointer
>
> The GSP numbers its queues 0 through 7, and each numbered queue is one
> such pair of ring buffers with its own four pointer registers, so the
> hardware has 32 pointer registers in all. Nova-core uses queue 0 only.
>
> A write to NV_PGSP_QUEUE_HEAD also interrupts the GSP. Msgq v0 uses that
> write as the doorbell, so nova-core already declares NV_PGSP_QUEUE_HEAD.
>
> Declare the other three, NV_PGSP_QUEUE_TAIL, NV_PGSP_MSGQ_HEAD and
> NV_PGSP_MSGQ_TAIL.
>
> All four registers are declared as the arrays of eight that the hardware
> defines, with the stride of 8 bytes at which the HEAD and TAIL registers
> of a queue interleave, as the NV_PFSP_* queue registers already are. The
> existing doorbell write names queue 0 explicitly.
>
> No functional change intended.
>
> [ acourbot: declare the registers as arrays of 8 with a stride of 8. ]
> [ acourbot: use "val" for the field name of NV_PGSP_MSGQ as per OpenRM. ]
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

