Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157234;
	b=LJZcH9JLyhhmJZ/vJP9ZRKq5ZyInmPnN/UEQyrj4w+Gtir61xpvU9mZiRp68DIbb98T+
	 quilYm4EZnFGDW+30ZXUMcmJR/u5vdqQ8OFPUJCnXDxujEcXG3w8fDRi+mxmBwfzVIzIU
	 wxi3vLzKOSKUaETUj6QxQj6LzsNytz/msXPOiyfA9WN9JcGvCWy3SN3u9b8oQPOIEOcgZ
	 MxEnIx/XUmGYGtHguT/OLXgqCQXkIkskY7Zj5ylQMTpF+ceys6u5qCfipj6KlIWsRa1tk
	 qPOAP7qxg7x4GnZv75X4Bfwkqd/sF9R1z8fEMcDzb6DdfJithhyTyYeXn7z2sY2JeZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157234;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Subject:
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
	bh=/e2QJKnUMnu4fOMK8HQavzWPuxBO1liDVB96sNVrrUA=;
	b=N7+omv30OCFzS50WPUAE84cRIsrJisRMhloJC7c7JxKd0snbRdHPFWiuojRixcIfLRuT
	 uXoh6WEhY+4A9nC4CQm31sHPuJqZ8Pp1tZV40ipMRjZ9qk3IwQonJ+jdANYPAdgLFmO4Y
	 gNeXt+DXGVimuJ+LnNB6+ZXFltgRdN6Br7pf+lHqGMKDfyuR1FN9dcbIoNta2fUzu+b/q
	 XnP7bqPTc2yzs6XhTCLPPtyOUZe1i2DvSxdi3oZ6CvW746jN9nITAW4Q4z1gQnlQ1SjsF
	 0oS7yH5hgz6AvGxCY485kGH3/PpSngqSeT8s7clAgC+Boryz03VxG9z+8tLHxFnGIkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m6zbOutw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF21606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 06:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FF21606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m6zbOutw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOQGulN1fDL0MiOiF7wbnaXWZAWlnwTWn7uVTrIvA1cRTy3kY8UUaMZAKZmco4n2ke4mHwFd8zAZFxeGeKjkcwiTweHwiA6IVpQh0TOgIoTSJ1xlSBg/KdU2DSU438rVbp0lyg9OB3/jyePkm4lgRAvkBDMp8uzrGVF6RS2xbzJMO9OKbNraPwuyrHtDDxAUrvNrEGRUWtTtVCeJaNcvLKlRQ7MYRkpzunHf2oQuVmT9y7hZ5EPmx22HRoi8Zj7qp1SU0RQGWpUPq0J+kzFXbU4qJbpA6EK+twKoFhxIrcPsUzcqmvvuP3gqLFtvwWHX/w5mI7Lkt8e7EAYjl7IoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e2QJKnUMnu4fOMK8HQavzWPuxBO1liDVB96sNVrrUA=;
 b=kgWU6ocfKq5iL1AiKu7bJSRWqCytEdpfPAsJupD0rwAU6ypxlsfgcYU3ONKQOfmgChhaiRlB63pKkW49RQV8GoFYwjOLBUCFE5YWnIHbvbhAWMEjUTFol86yVHAHtwb426xPIBsnhWw/JR6RtamLSxB3sL4eWFgrXAkGstb/yu5/DJOVcvLmkZMCQZ569R3FrnwAuH94lWsBfwp4/zfqWD9ilXQrtIpIRKuZZCadPo0sxTrhB9bx554ZNuk+HVIBXrZeNFbiS5KR8l+mtdv1/plWADxfWQbQZcqFX5U4DM5RXk3Bton3hBKG4eHgc6Jn5iU+zPSRrIdZCTIX9ikmsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e2QJKnUMnu4fOMK8HQavzWPuxBO1liDVB96sNVrrUA=;
 b=m6zbOutw4tj6ZnQsCxxxISzkUSnlNmFuEILKk2JPhjHPM3NoOUGHE0zCqwEpEq5EdUX67HTUJqn2/cQHWX0ZA1jynf/L8ZnapBf2SSfdKigAit1Dm2yWs5ntNjD9pKgzQWF69JWecJ0ZQ6071pOQvkRf6K3kW19QUkIM6B8tT+j+JB/hXtoc4eU5Cf6QJxM/yxxe+AkFfVKtTjiQ2DbEZ8v7vpWmB0UobjuN5Qpd/NdXSf3RwU1OydiGw36i1yQEeypXnxWO8HpX/1zcFEipaHdM8QSLGi+Fadkt/Wpv4xCX1Oew4RJ2wUi+ykan+bb1vqOfttU2W59U1AJe488gAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:47:09 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:47:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 15:47:04 +0900
Message-Id: <DMZU4K5Y7ARN.24GTSON4AGVVV@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH v2 3/7] gpu: nova-core: use the TLV heap sizes for pmu
 and non-wpr
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-4-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-4-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0087.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::18) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0681e2-029c-48b1-30cc-08df46d218f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261028144727099003|261102123227099003|261021121427099003|261021123027099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	GFBsR0rwHcEjvryQ1q1sNCpiuZi9fh2TKzN5ssiDPp3MySnL9uBTBOEPzsWV2C3yibw8kQEg6oEggmywpJfwezRJNvf/wIRjIom+007LGu7xRm9QiU1tVhdNf7MH8rRrU++HhhNkIdMU1I0hkl/GjiY+VJtW2xOeRJHRXVhLV7pTbZQF5vVvC80n9MkoiYEqVLemGDMdr6OwX8P7MKBa3X9p/jRPyjCsN5WC8SdadIAt7gMZcKORfcAnraXMWCaiwvD6bpOD8uoyaXwxcfiG5aFeJmnrdRfV9v4cYQ7X3LnpfDjYt4cMWNARSPCuVAZYIG+PI/RvHryzttMq87Ud/ZAkMm5J6RYK4AYpQ/M/bwcBy8UhBMMk6YCfhmfsT+c5jW7UljubBij4ST7p+AhjBdpp95/EmQQGvA1dKapLgootBTGugcorNoNAT6ccOe/xKEDQDyCYvVAXxnE41tdwIM2ukRtf/RiiKPI6BF5WpqZhpiHtVk8dcp4ERfAeScwsJkJWxZ8BwomeQiUKESNHVJ+3/qcv2Z7S3ODHGXBiv1tUgBN/7yGxi8UPnhk7eJVA1ZX01Q7W8OW6J1HDtcyGRwK+QxyvI7Tvl8uh1teeKLo+CDXmczODZQKRisGUSGyu9TbK+L56XdQuO7Mp93I+fg91eg7r5odVA5zE5eXNLIc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261028144727099003)(261102123227099003)(261021121427099003)(261021123027099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3plZFhtbXdIL01zWUM3UjFjc3p1M1I0UWpSaDdLdldUdnpVY3FEbFJJYkRa?=
 =?utf-8?B?bVdKWTFic1dGdk1WZmM1WjlhdjA3dytWMEt0S3NtdUFWTjh6cjl1MGJpN096?=
 =?utf-8?B?TVpMRXVRY0NrNm84dERUaDltZnRhN1hwTHpBcjZqakx0ZzlmWkhlanI3elF3?=
 =?utf-8?B?YVlMOU0wYXFXcVBxYjhaMi9CZWRXSUxXOExWeVhYVGt4cDFzcExsLzI4V2Jj?=
 =?utf-8?B?djA2UlFLelZWV21MeHZwcHVieTAyTHRMMmpsYkQzMTJUMjZTK0J2VE0zZzNY?=
 =?utf-8?B?bU1HUm5CWkFFSEJyRlVmNTdtbFJBUlJHSUt0ZWRGV25Db2N0Nkt4WnZRaUVa?=
 =?utf-8?B?OFlUUDlsNXlLYWF6dFl1WFc4b2NCc2VwYm4vWUNjdE9lZXd0WUNISEtENjQ2?=
 =?utf-8?B?ZTUrVVpybzBYTnh2b3B4S3lzb3hSYzBER28vM2xITk1relRyWXhtTGRDd0RB?=
 =?utf-8?B?cWI2b1VYTTBtK2NHd0hkVTZQNVRZL0ZZQU1wRzFQVmJzc05ZZm02Q0MvTmp3?=
 =?utf-8?B?dzdlZEMzU0N0MmFJL1RJYTRqSUpUS3ZRd0U4YkpMcFJLUndiVVRzeU1XeXI5?=
 =?utf-8?B?RndQelk1cTlGWHJTODl3QXd3aHdVZFlhSXBLZDVoeTlUeXFEejdFemlmSGdZ?=
 =?utf-8?B?ZTFqaGpFV05Sd2RBWjJpT3E5VUN4aGdoSGlGQmhoWkV6NWtxTk80c1F2NEtR?=
 =?utf-8?B?N1FaQWc1NE9XSTQ3SGYvMHZDaHN3d09qTEJQYWZJSnFCZUhIbWpWS0ZjYkZX?=
 =?utf-8?B?OWNaSVVZeWloeXc3TjdSUnNTWVc0L1Y0em1sVFlJVnlvZEZVWG9pYVBpUlR2?=
 =?utf-8?B?ekNVZVRkaUFCRzJhZDhNTUw2bTVzakxrNndQSkRyeVlQZmVNUXpKRlJBOFRL?=
 =?utf-8?B?dEJsZ0g2dmhqb29GZFoxdDFSZGlxOTNsYi9IWnJGQkJRdFM1dGhmbHFQMlFM?=
 =?utf-8?B?eXFmR3RHVFlSeUljWG5LV2dqRWZTUlRZNHhjemdDTGhXWmxxUWtlOFcvMFN1?=
 =?utf-8?B?OVV6Wi9DUFR1TXN2a0MyTWtzZml0K2JyT0tITjBSYlNwVGhJQTB0TVM5cklL?=
 =?utf-8?B?RjVjYzJYRmEvM1FjaGJUQVl3emtCZ2V5Znk0QkpFOEpPV00vRHVWaUh2UWN0?=
 =?utf-8?B?U1YxOGYxdFpXcjB0SkFaZm5FMDltbElxeXFLKzRhM0ZnNjE1VnhlVldrNjNs?=
 =?utf-8?B?a3pxSVh3SWwxaW11OXR1aVlOMHBMNkp3LzBHLzJkeHp1WGxJbTZTV3M0RVM2?=
 =?utf-8?B?L2pmL0dNYWdlL2ZiM05rNVpsK1M1QjdGUDRIVzVHVG1oT2drSUhPRHJjMHgy?=
 =?utf-8?B?aWJkYWxuSlVlalhUMktVb2d1VnA1Q0c1cE4yQVdlV3g4cHdyamdydjB3ZG4x?=
 =?utf-8?B?N2R3V3RBYXlMbHg2ZnBqdk84aS90WmNMeGEvUVVabWFyc3cxZ0RBTzA1LzE3?=
 =?utf-8?B?ZU0vOXo5TWk1ZlM3TythQ0l0ZXpkajVnMm1nTlByTEpnaTBpRHN2dFVQNGpJ?=
 =?utf-8?B?NEFRcmVYOUJPWU45VkI5Ty9OS3pvdTNRMFk3a1Rmc1RTQ1Q3ZkZmcG12RzFX?=
 =?utf-8?B?a2tVcUpMM0pxQnd5Z0FlZnB6V2xtY3NnbVQ3Z0RQY3FhUjQwdkFVRG9vZEo2?=
 =?utf-8?B?OHVCaUJSYzhJTFBtZU94R1NuZFB6N2RNb3J6QWs2UVowVW51ai9YNHdzdTZ0?=
 =?utf-8?B?OXdTM1gwU0VXUHFrNldOMmo4VmZyc0FFeVZPSG15VUR2UFB3bTVMSzZoMVlm?=
 =?utf-8?B?UWZjSmpSQ2kwVWtVR3FVTzduUFplTFd3eFhXQ2k1c3JrK0xLOVFuY1BKQ3By?=
 =?utf-8?B?cllEZUFpN3QwajRteU9VV3MwTTNzUzBBK3E2MXB6elZKMGQvTU1WT1FQc0xH?=
 =?utf-8?B?UVJiUHBVYVR0NDRkeTBCcElnNWdweGhYQlk1eXJIVWh5ZUtpUEhMalp6VnBy?=
 =?utf-8?B?UFJzUVJiNW5VaXcxUG52ZVBNcjE5bEo4cEh2M2dkSndKZHZtZ2tVWENMOGJD?=
 =?utf-8?B?Qk1CUGY0bHhtbmtGRmRTejBueklQS2UzV1pmblFJTG9zZDBKZnBvNjM5UUY0?=
 =?utf-8?B?TW9ITCtpR0ludFRhZFVFWGt3Z0lqSnJyYWhMOWRjU2wyUWs4dlkvWVp6bUZP?=
 =?utf-8?B?dEpsQTRuT1lCdkg0NVdkdnM0ZnVXdExveU1YZS9ycDdUY1V1bWMweVZKSUdL?=
 =?utf-8?B?dnNYdVBSSkJ5bk9HelZWMnFPb1FaVmtwZVJzeG9Cc3dBT1dUNUhrU014MVF5?=
 =?utf-8?B?aWJxV3V0VS9IQnlIOHV1MVcwYkR3di9LdlFuRlBDVkRwN2JRTi9wSGNUS1NW?=
 =?utf-8?B?SmNqTko1dmg1cVdYMVZiYzdNNFdNd3hEa0JjTURrVUl3c3lDc05OdzAyUzMw?=
 =?utf-8?Q?cKqUkjrdhmaXDPPNJ9/MrqZ/O1P8E/28F7lXj+GCgI7Vx?=
X-MS-Exchange-AntiSpam-MessageData-1: KpKe1IwMDmRktQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0681e2-029c-48b1-30cc-08df46d218f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:47:08.8375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rn3rkk6HY847zNJlPIUpdaHD7FpMEYJpS2nmPP5bQUvB5DEeMs6PZXdpeL7Mebl/NCOxzjAngkD7GyL7BS0Ipw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Instead of using hard-coded per-GPU values for the Non-WPR heap
> size and the PMU reserved size, use the values from gsp.tlv instead.
>
> This change will allow us to remove those HAL functions from FbHal.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs            | 16 +++++++++++-----
>  drivers/gpu/nova-core/fb/hal.rs        |  2 ++
>  drivers/gpu/nova-core/firmware/gsp.rs  |  8 +++++++-
>  drivers/gpu/nova-core/gsp.rs           |  1 +
>  drivers/gpu/nova-core/gsp/fw.rs        |  7 ++-----
>  drivers/gpu/nova-core/gsp/hal/gh100.rs |  2 +-
>  6 files changed, 24 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index b0c0b8fe6008..048d3c5e655f 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -264,7 +264,7 @@ pub(crate) fn new(
>          };
> =20
>          let non_wpr_heap =3D {
> -            let non_wpr_heap_size =3D hal.non_wpr_heap_size();
> +            let non_wpr_heap_size =3D gsp_fw.heap_params.tlv_non_wpr_hea=
p_size;
>              FbRange(wpr2.start - non_wpr_heap_size..wpr2.start)

Now that this is using a firmware defined value, it's possible this
could underflow, so what about using checked_sub instead?

>          };
> =20
> @@ -278,7 +278,7 @@ pub(crate) fn new(
>              wpr2,
>              non_wpr_heap,
>              vf_partition_count,
> -            pmu_reserved_size: hal.pmu_reserved_size(),
> +            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
>          })
>      }
>  }
> @@ -328,7 +328,13 @@ pub(crate) struct FbSizes {
> =20
>  impl FbSizes {
>      /// Computes the framebuffer region sizes for GSP-FMC boot.
> -    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vgpu_state: VgpuS=
tate) -> Result<Self> {
> +    pub(crate) fn new(
> +        chipset: Chipset,
> +        bar: Bar0<'_>,
> +        gsp_fw: &GspFirmware<'_>,
> +
> +        vgpu_state: VgpuState,

nit: blank line between gsp_fw and vgpu_state

> +    ) -> Result<Self> {
>          let hal =3D hal::fb_hal(chipset);
>          let fb_size =3D hal.vidmem_size(bar);
>          let (vf_partition_count, wpr2_heap_size) =3D wpr2_heap_params(ch=
ipset, vgpu_state, fb_size)?;
> @@ -336,8 +342,8 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, vg=
pu_state: VgpuState) -> Res
>          Ok(Self {
>              frts_size: hal.frts_size(),
>              wpr2_heap_size,
> -            non_wpr_heap_size: hal.non_wpr_heap_size(),
> -            pmu_reserved_size: hal.pmu_reserved_size(),
> +            non_wpr_heap_size: gsp_fw.heap_params.tlv_non_wpr_heap_size,
> +            pmu_reserved_size: gsp_fw.heap_params.tlv_pmu_reserved_size,
>              vf_partition_count,
>          })
>      }
> diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/h=
al.rs
> index 99363cfb116b..e30eb7de2a1c 100644
> --- a/drivers/gpu/nova-core/fb/hal.rs
> +++ b/drivers/gpu/nova-core/fb/hal.rs
> @@ -34,9 +34,11 @@ pub(crate) trait FbHal {
>      fn vidmem_size(&self, bar: Bar0<'_>) -> u64;
> =20
>      /// Returns the amount of VRAM to reserve for the PMU.
> +    #[expect(unused)]
>      fn pmu_reserved_size(&self) -> u32;

Unfortunately MSRV rust 1.85 doesn't have as good a handling of
expect(unused) as the latest one, so this patch produces some unused
warnings.  If you want to keep this patch separate to patch 4, I think
it needs #[expect(dead_code)] on pmu_reserved_size_tu102(),
non_wpr_heap_size_tu102() and pmu_reserved_size_gb100(). Thanks!

With above comments resolved,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
