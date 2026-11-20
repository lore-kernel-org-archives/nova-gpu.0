Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157263;
	b=WG5DfrmfatSD9FENtTE+vVhB6Dwh4pa3HjMHh17m3RE9XMfwY0dzVQd6gz+GDq0NCngF
	 GtTXx86hVeysOrsD/6VvYkJ3rcVeINLEIcLkrCx5Y4Tva/qU/brmCIE8ZqQAZHujcaKC6
	 HlNI+TwYoC1BrYSUGUYN9Zjjy+wdXJ04W5oUr0vGoiAi3BrYa3EsVd/9sjw8wm1l+xpYa
	 4F1tocKGMn1+1qWIqvMtMqPwwYpR+0my40HDohtWsoiCHq74rHqBDLFfHxuYbnj0mpFi/
	 adPgFfihzii2U2yZJ2S96V+mXM0vi1x0pDCiZmJsdmmLBMkp0k5OtWZZEmAY9S18mNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157263;
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
	bh=DFuQCC0+8VaEw9nf3fef6Bcfm5zOrXD4qTiY8SMJxk8=;
	b=yZtmmBN+WFbEUNIzFa4XZa44bEQfSIPE5lqyihmiX1EVBG8ZHCx0cDY7MOeZFBwiWiy5
	 ukbQulPehJb3FcciunZXa467bd93TfBasrUY+UDg/ROaM26sDsQBx5f1XX8CseGyU6hhH
	 QN9DwL3YOAsBGdwiEun5kYVwbJuyjhnU2/LlKwlUIkAfIGXjHcPshfV29i/dBNQtctSsV
	 LwC2Qccjv03sPQMxnP7dGh2XBLAwxq3/kEevBWxPmHZUf9R9zAZjwKw2tm+ko2HGGcR27
	 CP0a1Huw8toUjBB9yt0j/MWdttuo3QNLtUhhWsm2tq8dz+F21kAZ0zCySSYCiz5Bejg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="MVpuqs/4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.57
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010057.outbound.protection.outlook.com [52.101.56.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3E606A320
	for <nova-gpu@lists.linux.dev>; Fri, 20 Nov 2026 06:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61A3E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MVpuqs/4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUgpS9RLYG/lsdIQp/aLegkdYXyZ3t0TvBgC2Gh/36bTizxes+O33qrqpIFlrS/SX4ydBpWTuaq0LktX/9JCgIcOuKkxFMp2lfP7wCBh2XB6gV0H4YtnWAe3R2yY6h8iIzt1bVZI9IkMrCVNKyD9A/Nnl+o1+/4azEBc1+psrF84oGWx+SFlTBAvmWmrNUcxEBxMla1QeCLbDrUNUOgMUBmv9nEA1P/cwF0loMEoYrlQ5KBLTvG0L9u9Gcah1Q4h7fBnhMvodgjI9HP5TjKUH17sqVuAKAoTPGONYJHA6XPq1dCgKRU0C9j04n6mh6ZwL4hqWTcbkFaDC8mICzeAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFuQCC0+8VaEw9nf3fef6Bcfm5zOrXD4qTiY8SMJxk8=;
 b=Ivj538b5aCQ70WvVSjykc+8ElS60iNkPzYB5TelDuo9EiRSUog91yNAslRX39pzjwvD6Kuc9hfk5V/PJutZQJkBY2TVPmhvcd54GNYsleFjuoKGqUugHnAzmly6Al287DR3IX8kaVrT0pe1/EcYcMVlcGMpO/48FVSTbt11yTGrBgXs0ckwkrLz+Sx/XfKQXCw/z5pC87hWsjn5A9gRGaD3rRTkO43NRtLyZYvbSmzgq4B1BYDef28jCbTtSkf+cB9K25Vfce09Br8Bo768V7Nmg0fnXzOG8PbbjG1ee67M4IiAKYxosPuCjJJ8HTTVt4D6ATjFY4Us3O/KLgcKJtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFuQCC0+8VaEw9nf3fef6Bcfm5zOrXD4qTiY8SMJxk8=;
 b=MVpuqs/4WFZw/9bsgYSUbiV1meY1nvTa5KCW07kafvOZGRqVKKmaOjhSFSG+vXBYAG99jxe57FnU6WdX6uOg9lEMxpPG1PN+UqXQDh5YhX47VXH50tkTcJIjaycihQo3rzQCh1oX+ckyJ8mSpYK4IUVMo3cUg21WD7UfeggJtY0A5CIlxqYhPeQk0FcW1tyjgMQxdp/9CitHiMwCVPKLjB0J4YIlAFFNCeBeHMgsD8BfjaJVhd/bWTR4cnQZ6x6SDXax3qeg9MREXyb+EqJ7HT3Q1/13U0W6DW3NjVujT3a2YWNd+KwIFSatGj//j3eHc7ADj4ujbZivGnnI7Vctdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 06:47:40 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 06:47:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 15:47:35 +0900
Message-Id: <DMZU4YHKU7VG.12NRH5H0F87QQ@nvidia.com>
Subject: Re: [PATCH v2 4/7] gpu: nova-core: remove heap size related HAL
 functions
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261116195441.940595-1-ttabi@nvidia.com>
 <20261116195441.940595-5-ttabi@nvidia.com>
In-Reply-To: <20261116195441.940595-5-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: bb79bfa5-c288-47af-c471-08df46d22ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261102123227099003|261021121427099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	SMNi3thTE2uoWRLvuF9AsMDmAN1RUaqyJbaUrAQq/HZLSWhb45Yaaof60eiN9DIbcZ+lbpDUD61cqbyxZ1t4WrKjfMSXHJ/icgWCUuBEVOXUyU6QmUjAQr9kU6fYWNrDyUu0LVAI4rpiWznG07fHWa95nmwaAet7bK4vDCcV7FMUNHzbGcNNsCOsDCEdPKhf+jlGvFFyorb5c1SUTjRaAprrTao6P4DnROXC3NulYMz6iaKE+lFq51eZFOTozN6rlQRUAjQSczDGYKOf6u1ZDiPZ+3w5DmOLQvFmX3ZEeRLa7XoXebMVin2rsYBLJOE7bhqJnOI5z9MSRtzgb3KiWIfBzNdIqSeQ5p5xn/RVoZwY8GrIewZFL2xiBWLDeMTm4WInL1I0lzRhXi+rAngsJmWbKqyvjsu82GqBhO7BEMhgNWg2HLlMCi0ueT001pWaKKlECP/QoE3u+cWjRKVIV7KXK4g7p4+ZyUNikWVod6bbH5Oo6SGpOSukwh5bD3NXxqZIe7CnzKBYvtYlvpdB3i9gCWe2q/+W5XinnHo8ggT0zxyjUl6XD0E1va3DRI47HV+PQe18tB2j4zy97KbzAc8By67S5SbF+c66gQotgR0ZNp+ztUpY1Xbn6ujHFulYlaheu0g2ktDEafKNOFMhYi1kFtYaE+5N/zhuw0kN3Dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261102123227099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmxCMEhXNllFSDM0MXpmUWFlMXRMb1pMdHZFblB5Z1M1WEh4RGJQWXNGTHJC?=
 =?utf-8?B?YVB4OVNFK0RaUnVvTzE4UlN1K3lxN1ZwZ3ZLTlAzTURsV1JRSFpMT1VobDBj?=
 =?utf-8?B?Q3IwdEVYVWNCcEZHanZJdWl2QmZCemYvSkdEa3lSamJxR1ZIcXNKWVE2clBX?=
 =?utf-8?B?QUxueDJPNC84cTBGUDB4SVNOZEhsanFhWEZab0NOUFV5U2JYbmt6clJhNzZB?=
 =?utf-8?B?djNQUVBhNU4xZkhEa2pETFZoQnFjbTBvZnM0SnRmUDU0dFpYOElyQ0JSYUpv?=
 =?utf-8?B?OW9rYjRrMjNnMy9RNXg0Qkd4eFUzUS9wSHAzb092eUNpdnVTWHVhSzVuRDRq?=
 =?utf-8?B?RURYRUpvc1M3bWl2OUlmMG5SOUhUNitHcWlWOExma3VJZEcrUCtzajFGblFl?=
 =?utf-8?B?VW0yQ1NRVzZuVUNyelFHMHU4a1VidFE1TCtWbU9ad2JDeWo1VGFTU1VBSU9j?=
 =?utf-8?B?dmc1MElUQitmYlJlT3c1cGluaTFmMC83bGZINDFGU1haMEJNaEVtWVlBVGxO?=
 =?utf-8?B?UkQyY0lWNUozdjRNdm9yUWFORk1VNG9wOUJGdENQVm1hSmVZY0UrUFdsWk9F?=
 =?utf-8?B?bEFIQ1ZSbTQwdFoyVzhxZFEwUmd1NDAyOVhRMC9IOTBDaXpzU0Z0YzdpMVkr?=
 =?utf-8?B?VVQvdzRDQ21MQXYreU1BZVFRNG4zMFZhSFQ3N2hwaHFnejFvTWsxK2pPTXNG?=
 =?utf-8?B?YWRybDYwV21PemJoZCt2cy85bHpYdXVRdEVtMXhHQ3hVUDduNTZJSHdPOE9k?=
 =?utf-8?B?Vld2eXZmMTRlRDNQRUpLUXBZR2l2a0tCR3QyTlFVQlFJaEhCcDE0SitKaWZC?=
 =?utf-8?B?YmpZbEQ0UkU2bis5K0dOanhKbjRUU1pQY0orMkh5b2xOM0xCUG9kNTkzMTBD?=
 =?utf-8?B?NWVZWEVncUE2QU4rZHVmSmxzVHlXQkZucDZwSitjbGROZE1hUE9qc0RsNjRR?=
 =?utf-8?B?eGpDRGtIRzBPbTRrcFFVSGtyVzZFSWtXem9JUHBVejY5S1NldkNrakREUk9E?=
 =?utf-8?B?S2M4eXR5dGhpdjdGQVhjU1JxVVpUcUE3SE9JaStaTzQ2TzIwYTRkZHFvQ2Ny?=
 =?utf-8?B?WnNSYjNLOHZOVEM4cThDWGlGOGpkMG12c3Y1aHRlY05MS2Z0SGpmckUzQTRw?=
 =?utf-8?B?ZGFtTW5xSkppejAwY0RsVGppbjJjek80YkxqRUN4cDdQNEd3ODg3SGZVTGpo?=
 =?utf-8?B?SzBESGJaREc2a1VZalQvQnJpOFNYQThVcEVmWVZJckg4OVFwSE1TN21helJn?=
 =?utf-8?B?TlFQUGtldGE2YWV5cElyK2dMdHIvQStsazlMNWl5eFRtNERQNHA0dEZ1MHZ1?=
 =?utf-8?B?SzUvRWFuRzFnMkZkQ2RJcW56QWlDYzVmSTBWQjNwaTdFL2t2eUp6WlFzS2dS?=
 =?utf-8?B?a3FNeGg3ekxLZGJYTjNla1ZVaXNKNU1JTFBKZHlsT3lscHVwUEt6ODYvS3NU?=
 =?utf-8?B?YW5BVEU0U0wvRkY4YmxCNTFhRzhsbHVNWU9GV0d2NVdVa3NwWTkyYzZGV3B6?=
 =?utf-8?B?T2VYM2ovQmR3dGdMd2tSR1M1ckFnSEpBQnJXNXNPSEVNNjNnTDJIbjZ2bDlM?=
 =?utf-8?B?b1pBbWtSMkhTZGVHL280aWtSdjcwaUJtaVFwbzErYnE4KzZQTzR5S3I0MWYw?=
 =?utf-8?B?MGR3eVdqeFBGQ3IzVFd1cjNleTdzZGdacUNyV2EzOWh3OE9Qb2hqRHJBYXpz?=
 =?utf-8?B?eStyV0ZmcmM3UHlxQnNTOXVlUVJNSUVVV3VFaElBKzg0VFZ2YUFueUpaai85?=
 =?utf-8?B?Ykk0ZXJOaTAwNmVSYlBHcE9WWG13ZlEyZVBNc1JkRDFFNEJxaExPV0NQZjdI?=
 =?utf-8?B?dmpZSkt4dXZZZTVvdzhQZ2loenM0NDE5ZUMxVnVwenFqVkprT3dKbjA3VExn?=
 =?utf-8?B?VmFyMmJtVm1KbWpwQnQwVHAzdTBOWUtlbHhIN3NQZEpRcHdVVkdCUVUvNHoy?=
 =?utf-8?B?Q0ZrMXBnQStZcDNoOE1reW4vNWlMUGM2MXFQeDhabHRUSnlyUHFqNzNIMVpx?=
 =?utf-8?B?S2NJOE1lSGsrU2VNSjVic1d3OWxsY3hBSkZlMWtLcTZJNkVPMDF2TFZTWUhR?=
 =?utf-8?B?Zk1xbzJja0RCS21haitWd3p0ODJhZU9LNnBrQ0x4NHVFZGE5WTdIYUNnaTZs?=
 =?utf-8?B?cWFIRzk3Nnh4aE9lQmlpVXdLelRSc3lVRUViaWtWRDQ0MXVWZzc5UHorMy8w?=
 =?utf-8?B?ZW80bVB5aVBjSS82eFEybDNNUnlFYkNjdEliVDVsVVUyeUJyV21TRkN4VVNn?=
 =?utf-8?B?SkZpRjZXSldabzM3encwYTRDV0l4RS9PWmMrM1RsSFZLOVhlZVNUcndPVFBr?=
 =?utf-8?B?OFJPSzZEUTNPM00weWlaN0tBT2FqV2RWNmtSQzRDdkhNeWQ3eXpnQ2o4NnU1?=
 =?utf-8?Q?IbdsM3D7s5Ct1O654siOF0SByQFP/BS5d6NRgNoCVKJGn?=
X-MS-Exchange-AntiSpam-MessageData-1: 5PzG7zWTNeEb/A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb79bfa5-c288-47af-c471-08df46d22ba4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 06:47:40.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyTrzhXBa5+PFC+IpSLag93WZJTg9ZWnFAQc9tZs5JGZox0q18dcVIBRQJ1ZrNuY3MhFuA3moUWtYggEx84frA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091

On Tue Nov 17, 2026 at 4:54 AM JST, Timur Tabi wrote:
> Now that Nova-core reads all heap size values from the TLVs, we can
> remove all of the HAL functions that used to provide that data.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
