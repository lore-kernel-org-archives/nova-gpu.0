Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795768476;
	b=rL8/EO0o2sv5bpiqyYrSYLH44DS3mxkDRWsnQemAbPuTHKVnk3QH+fo26A0QO3iFagyB
	 QoIqgr7uj/4yUT2eG4ki7TeX7g5O8S4AAPuOVmnj/5AnAc+7QNCCJdPhu223FArgagdrR
	 L5lnucShiCH+yfmf3PcDk0vskat9h0QZUl1YksYB7lYZthPYljLSNOYAbbQp7qUl1M4u1
	 1Ocnu5zB9tHDpSU1/xbCBBjyvg+D5//7FRrjFDgr/AGrGJKUwkeDo7VC1rOXOxIGEyxzZ
	 S0MHl2SuaRBBC6m7Z6OY+LbIAU7E36+MLjNW5GqHNhQMrkH2rc9HpKQj7ZxcKZg0boQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768476;
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
	bh=N83z4pjhjyhp4BpX6x83XcPXjIQJE9v4c1XU7zw+lQI=;
	b=hF3nS1iD1b57QbGiGTEGYLgMmxt75vh3ECgsiAYToSOeXAcC3N0pzk8MlCYPrW9oimep
	 UsDs6fyPDufy+5m3ns2+HmO/uL4Je+ANzr9eBunD2i60I8yejEpFgl5VDp+1IYrAYlemp
	 7JYDFMZWcH73R547q+Re/nOu5aCkilPjcXhJ5+dgfvmoMwEUcqdWLw+sO50huUv5d4z8h
	 hKYtQNsx7dBzv5VGZq9/FI1nO1S6aA4A8M8sgN1hHfikOShtZR78yd3F5lfdwC9wvMmBH
	 qXvdYFa5rCs2qVFlwVzNUcRjUSTViZyqe53vld1r3Qfc1kUil1gqyRL6eSNsWkf12bg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="YIk/L2Xq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D4606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 27 Nov 2026 08:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3D4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YIk/L2Xq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1HeomvD3Yr+BZkZJhehuaPZVIFCRj2fwPdtpW7T3Q9waaWOUtFoqZez7rqcKRHgrNEc57JY9wGRN/xpBXmtob9wwa66EPQlrBNlQDq0HIZG+ZJn2Of6a9ipkgiOmb701j29+DLebPDnMFDF+5AG/Wi/XqbKD6vSumTPKglWnQgCZFkJWXCgfivk3ElcKXV75yiB79bcB5S2EdzBNdRk3COLcWXoneXREttL0Kvy8Ku1TbvUGROQ4yZsl1oL7cIuQuCEzIB5hmnI+Yvyt2o9QsRRkotwsISiuzpIVZ8460j1LO3ntItbOKn2jaE6Sr6x+QwaUvxJNnHsHVelCACxeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N83z4pjhjyhp4BpX6x83XcPXjIQJE9v4c1XU7zw+lQI=;
 b=mFtOdNGwTVbNYMH97uFByRY1od+HLi3ZAiSXdQ2GsiPs5W9hQktbmP7CBzHI0/cYogngC6mcmOzYAQK5MBNz4NFZezBiBUUHw1MQ/E976j2uYXKo5VXlpEG5XxhyT5xVe8VqfoNQZQFoVuB4V6/X5Rk67yF+WNlnZFlOcUXCOfulvkIIdI/QAEa8xxz5OZ6cDoyNvTnfLtytdIIlY8kMxBMgmdVETkraI8v+jQ/OcQNdcsatZL0Qi7z1wmPStSIlG8CSBSDxUjalgPzoLGIwyU18PuoGj8MYo/cbxgkEQx4S+Z1+ZbA8Slr86s+mN3ucq3KNDGWD8Zw2jpqmGaVH3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N83z4pjhjyhp4BpX6x83XcPXjIQJE9v4c1XU7zw+lQI=;
 b=YIk/L2XqttnBIt05vQd9vQUuKGjeFi7SKvx19ioZ+3TMlXsTSXA3w2H8pE9dfUxsr9kFTh7srdWy3pHUFsLJrpnudMsHNfFAWsDkjyxQe59hyKCHSKLELE046r9n3pysCgtDT2rLJeQl+lXB9shYhW78287Iq0LZTRrGSag0r4kf2Jhq3OvhWVKaGuWS6oIiwry6+ojPD78cOT/TcWEurr1hB/XCU1xfGxN0HLiTkpdBEVxx54e8PavnDni3VWJdsGf1ZmFKhZZKZokgL7mSvm8wvzNlwPFfbTzmRW5wd02NxbrRfciDHSAlto6YFtsFumuxcOvm1+TrOikqmV8Xcw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6411.namprd12.prod.outlook.com (2603:10b6:208:388::18)
 by AT6PR12MB925810.namprd12.prod.outlook.com (2603:10b6:170:111::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 08:34:33 +0000
Received: from IA1PR12MB6411.namprd12.prod.outlook.com
 ([fe80::b29f:6f15:4ece:5b5e]) by IA1PR12MB6411.namprd12.prod.outlook.com
 ([fe80::b29f:6f15:4ece:5b5e%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:34:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 17:34:29 +0900
Message-Id: <DN5USM0T3OJW.KRRW20AMA93M@nvidia.com>
Subject: Re: [PATCH v4 5/7] gpu: nova-core: add TLV versions of WPR heap
 size functions
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261125212445.620391-1-ttabi@nvidia.com>
 <20261125212445.620391-6-ttabi@nvidia.com>
In-Reply-To: <20261125212445.620391-6-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::18) To IA1PR12MB6411.namprd12.prod.outlook.com
 (2603:10b6:208:388::18)
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
X-MS-TrafficTypeDiagnostic: IA1PR12MB6411:EE_|AT6PR12MB925810:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c50fb65-669c-428d-de65-08df4c6142e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|23010399003|1800799024|376014|10067099003|56012099006|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|11063799006|4143699003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lx9DjVfNj6jPGv6JowYGMxm6wOZVUbZxTO+JaUvW1HjqEL2J0J07WiSlo7sDuMHzyFEIe0bt7uNo5HtFLD9Rqml+04bcvcCbBtOAEF+FSTrWrJZUYJFaZp7nfg0oXfnlnJ0XYZP0/ezraU5DmhMNR5qbHEyYPaxeZU8OBJW6cb7VbxQtpSyjB2GbLhnZy3M5Dsm4+sDZO7GK9JG6cF1mY3QFqCIl9jLJbMERtSkqBd/nT4GruRsSSBK8De/7cbhiCI+gCkpYl4L9JgpoRh2icQtgAiFB3dCxOzqgfZ4xMWtIrPt8MhFBBkCw+24Q5BTs3JBexoR7fjlFZtU17NiRLy4aAIhCI0OaKaWOmq6N6qtdJkvN0yHQBIu+PTJgf+NwW8VTtilyBFyuNl3UwUsAPYteSjueaXHruwZgCqFB/zHjicQzxDeAFQ6WbvAftRSdcWcq0K47LL/uRx9aDo5cn9fL5Kauvts8Xaghe4kWYOp+Ku0RR+Xuy41Mpjmw4zZCnImeHAha9S5c9sgRxCpaiPhO5NtRX4SuBfH87LK7wEV7A0nCyjkLnrtTY340HHGwudzIl6Ic5+MqFu/qdZGlmXdkyDAbDOorl1GAsboFqhG3H9wR041TYvCDVp2TS6Fkm/9K1qHBWrJBz58Cbirh9CyoB9sNxGYTv4chYj5V7Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6411.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHljdFdJSzZLWTJQZ1VDNm52WDZ5M3FlYlZ6RzVJVGkzUHJhSnZXMWEwY0xV?=
 =?utf-8?B?cUk4ZU5lbThJamFmSGRZWW5UTjQ3SmpyelBoazB2elJiMndVVkdsa3hyR2RQ?=
 =?utf-8?B?SzFLNjg3ZnZrQmJYbmFMRkR1NFFhVEowR1VDVWM2YjA0bXBnZW02Y1dUMkNs?=
 =?utf-8?B?UFUraDMxT0lTell5ZHFsZzJ3OEZFYzR6dTUxcEQzUnR2T2JpOENWdUJYRkVQ?=
 =?utf-8?B?bXVTN0tiTVViR1R6RE9GMEN6RjVLVjNSUzRXSCsrVzkrYmxaZ1pIZFMyOHpi?=
 =?utf-8?B?YWlENjE4OHdDZllEbkluRmVNWkdHZEFtMzdKcDFNcm9wRjZJei9LRmxoTTVP?=
 =?utf-8?B?QUpoaUJieUVrNGNNZFdTRTZQUWVHUEFsWlMvQzNpaU8zTytYelhUU1Q2eC9K?=
 =?utf-8?B?NmpGUGk0ZURyREMrR2EvbWREbURwbUVhZWo5dG5LMkhBQXVyempCUmIxRG56?=
 =?utf-8?B?TzZJc1gvckZkTlF3MEJPMWFGR1ZkTzdXcWlxMHRQaWFPYXplTmlFZDJyY2lE?=
 =?utf-8?B?TjlKMFpicEtVbEQ0Kzd4QW1Fb3ZoZEdTSFZKSE41cUJ1ZVRhZFl5a3JxRC92?=
 =?utf-8?B?S0Q3NmUvYzRKakFxL3loa2NzNFNqamV5eWJ6Y1dPNllxZ0RJM2NPTnVKR3hF?=
 =?utf-8?B?SWZLdnordUxYWTk3SnhON1poUUFBQ0UvQjdHN3ZaY2NxRys5dVFJck91a0NY?=
 =?utf-8?B?NGpKdXBGMU1TcUtvNndrdHlJa05zSU9ESEdNV2FubWRWd2lHOG5VZDIvQWlp?=
 =?utf-8?B?cEtONzNocm9HMnh6aVZJakZzT1RqMDI4R2VFL1ArUHF3T2h4NmVrcEJ0NTJn?=
 =?utf-8?B?R2k0Vno2VjZ5ZDN4Z2l5ZExYZ2xSRUhMU3BwZDFDK2txSzF3eTRKaUVNaDlF?=
 =?utf-8?B?N056Vm03cjBrQ2hhY1QzalBWTDlLK0VNNldmYzRJZUtCVGU4UlVLcG05eU1n?=
 =?utf-8?B?eW9PRGNmc3VKS3pGTndnYW5BTXFUdWtwcCtZc08yWlZBOStPREZCcXR0RTdK?=
 =?utf-8?B?MzZmOTZ1aWlKUnNFbi9zcHVQazdOOUtlTStaek9CS3Fqa2JFYkdFR01ITk9z?=
 =?utf-8?B?SGF6cXY3V0xGMDVCUkVqQU9xdEdvTCttRWxHSmFud2MrUE1BRWNhUlBjSEoz?=
 =?utf-8?B?ZUpTeWt3dkVReGdKTlVyYmFJUVR5OWFFQzdoLzVyT1ArSVhtL1QyYUQ0WnQ1?=
 =?utf-8?B?ZzhSODFmMGhLNVNDVWdYQ2kvR3lab1hiY1YzSk1wM3hlZ0RYbytXOVI1WlRy?=
 =?utf-8?B?T21PWGdCY2x3WG9tR2dGNGNIYU8wVDZTZExkb2VqSXJHUGh2SWFuZlo0VklD?=
 =?utf-8?B?SytwU3dzbmpmN1lzaFJZUUlITVZORm9aemZhcGtiY2E5bGhITmdNUWpJTVVo?=
 =?utf-8?B?UzZjOXZYQW1oYmdSZnZoTnBLTlcvVDIzV2xuRU1EbUJWaXNvU3FUR3Z6M3Zl?=
 =?utf-8?B?S0pSQS9hTFV6a25HRUNkdnpSM1RWeFJCTVh2MDlhaFMzTjRidkhTR2JJUWZh?=
 =?utf-8?B?cEtNZlQ0Ny9JSHBVRUZkQmFZVER5WEFpTXhLSnZCQjk3T0V2SWN1RTlpTDZi?=
 =?utf-8?B?cDZLSi9sOVpBYllSMzFtbnFNdHlnKzgyWFBJQ1VJdTVDdU5CVmNMZVhZQjhj?=
 =?utf-8?B?SGUwdHg1TmJlNFlDUjYxNEVpL0hnakk1UjlHcU56eHZOSTF2dkFOcGtPbWhP?=
 =?utf-8?B?SHFWT3pDTnhjZlMzYXU2ZDZ3RVBuTVUzUlRXckJoU0lkU1FrR0hrWHJmZkFL?=
 =?utf-8?B?a3k5UTR5aUY3VWRKVms5dWxPRWRFbkhlR0tsckVabXd5RzZFaFl6NXo1dTdW?=
 =?utf-8?B?T1NsL2VjUXlHbjhaTEwxV3Q0c2lHN0Z3V0xQaC8zWWlJUmp1NzdXekVVOGl6?=
 =?utf-8?B?YitDTnFVZFUzL0VuU3htM0FGUGxjQ21wTkhuY3draG1WVUkySG9mWXVkbjBZ?=
 =?utf-8?B?Q0FmYU5QMEFzZk9zVU5VUGhRbFpKcU80YjNWdi9PL1VRR0xmN3M2L1BPcEdD?=
 =?utf-8?B?ZGhudzQ5dEpZaWR4OHFkYmZ5azJkeHdRckJMWTI1dmVjYjM5OWc3Y0k3VlNn?=
 =?utf-8?B?RVdLQWg5YlVzZG9qK1hXODY0bmxjMTI3bmtmMFltVjRIL0IzUk56U2sza084?=
 =?utf-8?B?RmpndmhBYUhZbmU5OVd2dkdPYnpuQ05KL29FREJuYXpId3JvS1YwdnNWTENl?=
 =?utf-8?B?UEFOYVJxY2RxWHFXWEwwVHY5MG5raVdZVGlFU01UMEV0KzJjem92SU5JSFd5?=
 =?utf-8?B?TTEvdVY0RjEwZVhXZjlmc2JQbWk4SzZ1QjhaLyswc0FFRWNLUEhiMXlnVnk0?=
 =?utf-8?B?ZkdDVUc3STNEbXNQL0lZK0s3SCsvUlhWelgyT0Z4bTc1MmhoMHlRZkR2S3JI?=
 =?utf-8?Q?MZW5OIed9l7VRsXXvZ+uCZcfCbm/dGDzz+dtwuV2wGfWq?=
X-MS-Exchange-AntiSpam-MessageData-1: RXtBIjtheZB02g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c50fb65-669c-428d-de65-08df4c6142e1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6411.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:34:33.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPph7G6/wXLWNetb/rtIW7nCTVjnmCcq39/Vk/3U+QdoFuE22xZSoDho4OK+O22eS66MidU3TNjj/w8lWom5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB925810

On Thu Nov 26, 2026 at 6:24 AM JST, Timur Tabi wrote:
> Add TLV versions of vgpu_wpr_heap_size() and wpr_heap_size() to
> GspFwHeapParams.  These complement the same functions in LibosParams.
> We add them to GspFwHeapParams because LibosParams will be removed
> in a future commit, and the driver will use the GspFwHeapParams
> version instead.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index fdb7f9625686..e59a10beaa94 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -68,13 +68,9 @@
> =20
>  /// Heap memory requirements and constraints for booting GSP-RM.
>  pub(crate) struct GspFwHeapParams {
> -    #[expect(unused)]
>      wpr2_heap_base_size: u64,
> -    #[expect(unused)]
>      wpr2_heap_size_per_gib: u64,
> -    #[expect(unused)]
>      vgpu_wpr2_heap_base_size: u64,
> -    #[expect(unused)]
>      vgpu_wpr2_heap_size_per_vf: u64,
>      pub(crate) pmu_reserved_size: u32,
>      pub(crate) non_wpr_heap_size: u64,
> @@ -127,6 +123,35 @@ fn management_overhead(fb_size: u64) -> Result<u64> =
{
>              .align_up(GSP_HEAP_ALIGNMENT)
>              .ok_or(EINVAL)
>      }
> +
> +    /// Returns the WPR heap size to reserve when vGPU is enabled.
> +    #[expect(unused)]
> +    pub(crate) fn vgpu_wpr_heap_size(&self, total_vfs: u16) -> Result<u6=
4> {
> +        //u64::from(bindings::GSP_FW_HEAP_SIZE_VGPU_DEFAULT)

Still has the commented out line plus saturating_* so I think you missed
updating this patch.

Series lgtm otherwise~
