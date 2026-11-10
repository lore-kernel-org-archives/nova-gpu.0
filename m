Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306067;
	b=is0SVqNY8uw+5vObmMZOr30mVSMGucrSPgUlQfWXhKWMktErh7CKqROnUGjGCTQ0rZVX
	 XDw8CeHPuX/Pv/PRhnPI6knPMet0cd/D/iRm8vlmOwqzM2JwNUlZFZ6nHbsCtPPUn/TQH
	 zbinWsspsRQfRsQbZReXmtqaLY8s8K9/WYzQFO0aU+a38oq0hQ0dbtaKQAv1UQsYKwDHb
	 vA5qoYmezcQe87fxsLoQUeBmhdTl33Wg4JrZSKN9jgXoMMwSxC1Cxv1Ae8sjKAlASwzAS
	 dZ6hmywA1z8RrOpiNhTli/ldbRuHdjm60qstsWBpjYoEGAPbzZSsZFuEFgtI03uQcwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306067;
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
	bh=zaLdDmdC3IldOYeT7qkcbgEonM38hUE88Lc6TpvPoiU=;
	b=nTjNPwTSBhz3cTskp+wsqIw3Y+CiJxPFF1D1YECIW6gGpusnT1JSO/fbsd4oz0BX8oDR
	 61zWM1EuigB09zMkRGDRjToEvMlcYFX7bmqHunTvk2qYNa5Na3X8/ItVtToemi46Lg97z
	 VxxTKDYwyx54aHbPH0EvVjfsd1OsW3UbpTxXZJvzdYd3svYKX2AkmseLbWRmUpHJFwx3w
	 Z1qejHDqdy1645GtRM75H4KWIdgPbFAqX+Y5J5Q299evV9beVauswDbm8A1nHOtAu7KvR
	 MzwU0Ubj2fe6jUrtcRK7cMB9oKGReqcr5zz04FMLAd661H9bpirhrPlijG1ISwtnxuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mg8KKAS6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.64
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012064.outbound.protection.outlook.com [52.101.43.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AF60A383B
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E95AF60A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mg8KKAS6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNUA2ji+mJZMsM4YWdy3p0xRfhdYqqPF21bTZ7AjO5LuCTyOc4Gs5upcVaGF1ns5uWH3HTGlC/8weMq/NF8IA26I9V0CZuJXPG1/cmQkDAr7vyd7THHPeyiKAfwu9XsxUynvYDgEo7UYr0G9M1R6H62OYNb0jlQ/kQLHblESh4WYrEGEW3JbLXpb5MimHRnXxeD6e+eXfx2ZiCTy0A4Le6PRb0eKPYypvctCcba20Dj5LgFBm//BEeh0ZU0UgZm+XgZGnUwKcZ07ppmVYvJv0wBBBK5uyj6ckdK9Wx31ZqKchOtGG/JZwOY3QQNlGdYvs1+tprg2x/4So2N7agJnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zaLdDmdC3IldOYeT7qkcbgEonM38hUE88Lc6TpvPoiU=;
 b=nqHGL/2h9VZQ3JjY7JskQ8yzAcswx/sgdNJPVganyeCixy+nOsxOgO7E3uALAsCHoP7DH8cRYPPMzhEwgBvrEy0t6OSTy3P68jJFuQZ0WO8dMiBbcEpw2Qh287WUuAuUuUpFZQ/L9Jct8IPdZSe9PJ1vNQifiFxeVFmo1g8EPzyFrNQle+FA08kuDiGv2keYwPjcLc7o0CCQEV2t9fwfye6etoijmpS5CpAJAskLJl2t0cKvDL6ZIOZJ5LfjVe8YkJLu2XHr9puSO2bpKlKk5yIyl7tAGVyr1+yLtKqCiW7Bf3O81e45vVnOVVwgvQ0dizxm/+PPiy0xxxOJF+ftfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zaLdDmdC3IldOYeT7qkcbgEonM38hUE88Lc6TpvPoiU=;
 b=mg8KKAS6ZhY+M+fZGn0mx7Iy23kpx5SzC3SX/zXqUvIXXxgqG+fmVczyRfKtc3d9EBMYmC1yJPvVyqHjqWqFO9HcZu8lqEVIDPn0rJJFsw9D77//+mE4+v/qb/qb+B6YWapfRYwh4o8yVL9Ivu1OxbRB7zhq8vCaITCiqc9gLQ6O77+FxUsfFNuCxtP9g69tzKsdulM0H4yZALFYxTTU7L/fSBbQ3aZO9bUFslfSXzQBB8KqWtM4ASItjCuuvz1DkLNvDTTiGd17yFEL7wL1ktBHsGo3NLjQsHYwKgO3t967oDes1WPPm7vv11H5AynPMHlNDy/pmSoLW4OvCDkmMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:04 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:51 +0900
Subject: [PATCH v3 02/13] gpu: nova-core: falcon: widen the IMEM PIO offset
 to 24 bits
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-2-20d79ebb646f@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf02c59-b5e7-4f58-d4d8-08df3f14537a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dGILhL3THTuUFTaTUWkWRHNqF6KpRndMGi8AjNwz+FCq36b5X0K7BZaOiQEwk473oBaJlqYL1ihDBaATPXOE/MsxKyWznf8dOKS7jz8pGJvQOpXAAo9+iz5q4xoIkBHz0lRxTCFJ/0npKoMrndfcv7zeKKHqEaav+Of38sFVh48Txx7j9YoeD9smM2AZ34LnUndP/pNDahxnzdGZNYULg9PX/7t3weJPsWQFqoD0vyvKpFy3izquwPPjuX2nLY9No9Lq6GXVkFihcWUn+jd8QatWQ/8ya/0d3spG6E8ZF/D6ueU3dsD+WwIbCzIlyqaOBCCTEwAj9QvsTOqNm8qIRn6g7graiOUePxrF9VpMzosqtuMQ/KpnLpKfzNAO1GWXnb2GLO+GhcOrCK5OqZ39icYsjDOoX/35EPfAS5pbl2xO9TqRk6nzMXyNTXtJHcKPC+uVws7foFys84laIPauIP63Siw9/feBWgL/wBvrbdsEUvYtZs2wY3ahV2i8vVqp808Qmf3CS4Q6OQ9SkWAr7XWL8LFfUGxNjh7RI1qAQ4MDzzeJaN70fXBqm25N/fDKp+4A/72hPCpphebzTYftUOOEoeeEGvMtK33Vb2n513vbxoCLC30sL6ktnKDWTgBFHiJgsLPGO2mw9FfIICfbvgoReRUYOJbVJbhFPvT2mjg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUpmSUlOUXZRRUhvMWI5UGRTUUZ6elJRZjl6aXNLcXkyZGNZUk11S2grSDUw?=
 =?utf-8?B?L1J1TjF2U1NuL3ZGL016WGcvNHdTVVJPZjZnN21CMzYrTWN3enF6c0dVeVh5?=
 =?utf-8?B?dW1VSmRSNTdadkZacjNHNXJDdXFGNkhIVHVISGRmRUgrNzNqdjhCdGJ5WXRp?=
 =?utf-8?B?cE1BbDVwRml6Wll2UTdhbEIvNlNmU1h1V0JOaTRHNHd5YWVxT2NhTTBGd2hS?=
 =?utf-8?B?N2hZNVYvVnN2QjAxR0hhUDRpbkNIMmNiRzVXMHpVM3lsRGVjbWtkcEZUclFr?=
 =?utf-8?B?R0Rva2dvZmRmNlA2ODFoT2hobGRGTEg1VVhXaWkyK3R2bkQxSm4vQjlFL3Vm?=
 =?utf-8?B?TjY2TEVWUWYxVlVYTTkySzVIeHNKeCt6WFY3dEg3dWJaVU5jMkZpdEZUQktS?=
 =?utf-8?B?ODhwTDRzdjdvRk5WdG5pQnErQzduNzRSeDlGWS9Qb0YxcFNoUjhHcUxuT09m?=
 =?utf-8?B?dG1QbThUOHlnWm9aU2I0N2dnL1cxeGM0N1FkNFZwOHFLS0FHa29vblNicGVG?=
 =?utf-8?B?dDF2bE1JMmQxOCtmcjdzYUpnVHg0ZFh1UElBUHNFSTNqRWxuSWRNWGM2UTFj?=
 =?utf-8?B?Y20xU3dBNXpxaSthV0UzZWxLVndGWkdrbnZjMVl0QS8yV1dtQTlUWUFlR1V3?=
 =?utf-8?B?ZU9nMUhpd0pPemZDSXRZcjkrME56dFNpVGFyUnczZ3l4STlSMVhtWlVBV1I3?=
 =?utf-8?B?Wk0ySDVlSXUydG5BcFplcHBDL1lvR0ZvTWVvK3ovZHV2TVBMMFRFVUI5Vllm?=
 =?utf-8?B?aWlTOUtXUTFRdDdLem9XWFFkWVVxZ3JzNDZpaGk5aExwYTBOdmtpcmk1NStm?=
 =?utf-8?B?d2hjTzZpMWJkakdtdjh4ZkNrdUM5QjJiSDVKUm1SU2FGQ2FLaWtDRktCSm1C?=
 =?utf-8?B?enhJK3JzaVljdkRsbGRZWW1zbDZiNjdqTnprOC90YWwyQjI2WkRRaldQdkRh?=
 =?utf-8?B?NjBGbFJhN1hDazVXK3hyMjhSVldjV0ZJK2JyZmN1czExVjY1QW93WUx5dnl3?=
 =?utf-8?B?dGdVekU2SHNsNXZ2NGUxZkNtaCtBNWhrSGtnYUk2UVFhZzM4RTh3dThBd2Mx?=
 =?utf-8?B?bEVVME5sbjNod25QTnE4emV3MmVnM3k0QkNaQ1NXdk5DQXZrTksrNE5aa1JM?=
 =?utf-8?B?WWRxQUJGN0svaWNySVZwUjAya3F5STF0UmI3c0o4NUZhL0pjN3NoN01aeDZU?=
 =?utf-8?B?d0tMWExGZ3cvQU01MnRyMTRYTUJkTW1iaHRDNFJQRlVUbERxZ3JWTTdDNkdQ?=
 =?utf-8?B?WDVEOWtSa2sxdm9nbHA1Ui9RMkZQcTFSRGVaTVZlTUIyN0s1N3BTMm9hZUVo?=
 =?utf-8?B?di8xRkNHM2xCWUp0S1JIeUlvMWdBMmNnSUxuYVh3OWl4L21NaUJ3YXByZXVo?=
 =?utf-8?B?UjlZZWJJanp6cE9DRGwzRTNFNGFuZmt3U0xEaTJDSllSMGRqMFVrdnV0VUdt?=
 =?utf-8?B?cnhVMTBJaXNVeHJOWVcxc2UzNFFZcWlMT1lLWTJ4OTkxekIySDEwMlFVZ2o2?=
 =?utf-8?B?MWNsaGJrMmIxRllaMkpoMXFoYXNRVHNlSlVDNWRIVlVpbnNmREliMHdTdnFx?=
 =?utf-8?B?RUxMck9XNDZiVEN6OGc5WDRxaFJCYWhCak1ybFBnaGxaUjhkMmt1aSsxNGU4?=
 =?utf-8?B?QVRiSU1YQ2dFMjZlc1BxQm1qa2IyVjloS2FHYitQTXkxR2hjanNEcmdMSnlP?=
 =?utf-8?B?M1NRSnJ6bURoV0tSNDdsQ2hSWFcwckZqZ09XcVVTTDB0Mk9OemxZOEZTYjBP?=
 =?utf-8?B?V1ZkVUxGNWpLR1VPcWlxOWxMT05VMGQyZ0FUNHdLTmx1dkpkNkNTbnhxNk14?=
 =?utf-8?B?dEZ0eHJzakdBaXhmME1WbVpoVENOYjV5OHp0UmhQcWQ2VzRTVktXcnlEYnZR?=
 =?utf-8?B?T3ErVnlNNzlkS2M2T21SUUV0RG5ueHZDYkpMYmNxL0JVZWF2N3J3NkxWdG1s?=
 =?utf-8?B?ZGlhMDJqRkIzMnZBYmk1VGVrUlF3ZjlQd1lsMjIzdUcySlQza2p3cW9RRDd4?=
 =?utf-8?B?OEF0eFkvd01RYkF1bzJnQmxIeXBuRFJqZWlYTVhTbkpuSWtTSllHc1QxRzZN?=
 =?utf-8?B?VEw2Snh6TkMzUnN0SXhGeGt6SHBtZk45VVBjalZXK3FESCt6RGpHY1JxTUpn?=
 =?utf-8?B?aXdvYUhlRjZoM3A4Z1lPZmRMOHJmdVFQb3RNY0srdDFnZjN4WnhmTU9lSFpC?=
 =?utf-8?B?YUsvV2hmQ0RVRUJrS3AvWEpiQll6STY5dEdKNmQ2Vitwc0sxRHhneTlxWDUy?=
 =?utf-8?B?cHJqckNya1ljUE1ZWXNOT1dydWZNczRPUFZnYlUxVkxzVzFZSDd1UlJaQmdx?=
 =?utf-8?B?T3dLMWVXaHRWcFhPNkpFbTAxYjVlNWd0RVg5bUlpUGlGT1oxbFgzS2hvQ2FK?=
 =?utf-8?Q?uZvbO16EGaXZDbQtfMpF0ryaB/POP2+1YFyjG17OSYEaV?=
X-MS-Exchange-AntiSpam-MessageData-1: /z9th3OAsW6dtQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf02c59-b5e7-4f58-d4d8-08df3f14537a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:04.3782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Kpt7Fs9YC4c0aEdDcspXs8ryioXkOmsfBw/UddRp1Cj3q5k/yXDubA7q2jCMch+bIuvUbIhCpsjL73d+hRvLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

`NV_PFALCON_FALCON_IMEMC` addresses IMEM with a 24-bit offset since GA100
(16 bits on Turing, with the following 8 bits unused).

Nova declared it as 16 bits and carried IMEM PIO destinations as `u16`,
which prevents loading anything above 64 KiB of IMEM, a scenario that
becomes possible once the generic bootloader is placed at the top of
IMEM.

Widen the register field and carry the destination as a 24-bit `Bounded`.

Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
Link: https://lore.kernel.org/all/DMNAN7KX22SC.QQ5HURCU332A@nvidia.com/
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                  | 10 +++++++---
 drivers/gpu/nova-core/firmware/gen_bootloader.rs |  8 ++++++--
 drivers/gpu/nova-core/regs.rs                    |  2 +-
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 0b377bd6524a..a34748abc74a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -18,6 +18,10 @@
         Io,
         Mmio, //
     },
+    num::{
+        Bounded,
+        TryIntoBounded, //
+    },
     prelude::*,
     sizes::SZ_4K,
     time::Delta,
@@ -230,13 +234,13 @@ fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
             let end = start + usize::from_safe_cast(params.len);
             let data = self.as_slice().get(start..end).ok_or(EINVAL)?;
 
-            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+            let dst_start = params.dst_start.try_into_bounded().ok_or(EINVAL)?;
 
             Ok::<_, Error>(FalconPioImemLoadTarget {
                 data,
                 dst_start,
                 secure,
-                start_tag: dst_start >> 8,
+                start_tag: dst_start.shr::<8, 16>().into(),
             })
         };
 
@@ -272,7 +276,7 @@ fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
 #[derive(Clone)]
 pub(crate) struct FalconPioImemLoadTarget<'a> {
     pub(crate) data: &'a [u8],
-    pub(crate) dst_start: u16,
+    pub(crate) dst_start: Bounded<u32, 24>,
     pub(crate) secure: bool,
     pub(crate) start_tag: u16,
 }
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 1e7ff9699174..16ef2c79a6b1 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,6 +7,10 @@
 
 use kernel::{
     device,
+    num::{
+        Bounded,
+        TryIntoBounded, //
+    },
     prelude::*,
     ptr::Alignable,
     sizes, //
@@ -30,7 +34,7 @@ pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
     ucode: KVec<u8>,
     /// Byte offset in IMEM at which the code is loaded.
-    imem_dst_start: u16,
+    imem_dst_start: Bounded<u32, 24>,
     /// Tag under which the first code block is loaded.
     start_tag: u16,
 }
@@ -76,7 +80,7 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
 
         Ok(Self {
             ucode,
-            imem_dst_start: u16::try_from(imem_dst_start)?,
+            imem_dst_start: imem_dst_start.try_into_bounded().ok_or(EINVAL)?,
             start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
         })
     }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index df2eddc58efb..bf3a43f1c09e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -236,7 +236,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         /// Auto-increment on write.
         24:24     aincw => bool;
         /// IMEM block and word offset.
-        15:0      offs;
+        23:0      offs;
     }
 
     /// IMEM data register. Reading/writing this register accesses IMEM at the address

-- 
2.56.0

