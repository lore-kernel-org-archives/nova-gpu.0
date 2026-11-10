Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306083;
	b=NGauEM0yQYC7locgNeJpcLtPCWgGSFU5t5bJ2OjIcBo7aKDWHZzJYq1tcFlT5gxRQpqI
	 hh+n1tYlAnuPSslxsk5pFuwOwyzDXetv0XDMXbIec+O0S2nb6zZd6qSmLe9zk3TbvDDRr
	 xPYJ+J7dPFO6uGq/+Rdrly/EN/DrbOywfYMmw1fBO1FVgLVgPIo2lI+yjHDMuOHZSZAvk
	 /dvsHZN/JJOxH++sEWlw2C1jPW3NHdvrdIUTquQ6WxVcMTYdg8PTquR+xU2iblSOWH2tG
	 +9seff966RsxX0djkuhbUhtmZjgFQf/9FWJyBhR3Av8aJLS89n8nnBKFiH1uBPq56FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306083;
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
	bh=4FO22ucntD+n2aMH43t2W272aEfPjzGG0EFjnv3oa1c=;
	b=zUnpwqs7fkwyjIKbZ53DGGM6axkpmLvG2bUYLwjPjdtFF22ZtoDstfVj8zolgLTXe5rS
	 H4CFdaN/SptAMbNgNxg4ccfJ0MsTimWWqeMuz3AMtVMOQbH/uDOHyZjrg3p1asawnlRpa
	 vLpOCVUVTyby+FuSeBt1RuHEsi2eLqWPR7y3Vja72MUrbmf3reHnwhDKtEkhlSMvdVGMe
	 Q3GhAi0d8t9nGuhlABDecq4Ba4Jg1rKj2cdzEH8+pH7q0tdAhhqnnv3bRObp+D0r0St6g
	 /CuwI+ZYrKnvTo/oDSXuPyT/kWikSeOPP4XhBQ0QuG0onJYhomXSnouPM7oGLjMomdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dLwytLs1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.3
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011003.outbound.protection.outlook.com [52.101.52.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3560A5BFC
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F3560A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dLwytLs1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHscuFrVPFg0+xkUPdmCVbZ+QJvl1c/7kart4dIcO5Fibeo23sMXJ+eGcxOUTjQ7EWpQqCFJiDfp+qNMJT3CYvxcSRnDNpcHGThMx4ahgGb6VVZZ7r5VuuWFclr2x6aGz7XPFK7GPU3jAJ11ZAIiQPo8hY5DAP6dyyTMRdQKul/JypgM3/epYVZBV2MuosVm44kE8gGyUmSNN3pw4PL3/godjXdhsMWJBh9issVqUdK9kzyPETjUYJzIGJrr5hVjsSCxAH0lSFhx4zFUcjf0ywcvO8r3yHSWiFgi3vHDtL0L/6tssi+Ef434uqoRpKhzVVbYzjJ36zd8j/iEOorPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FO22ucntD+n2aMH43t2W272aEfPjzGG0EFjnv3oa1c=;
 b=mg8mD76rBxFdOA09tNR+RMgdHSBoGdzlu05Hz9RmwlpnrNQQSi0YXn+j+RuRuOxwq8GamqdTknzvY6o/0ORUhDpqRldY8DZpuANtMTk9fqvMWN2BixQ9lU31Rquo15rJI+Ij6D6xKAY8iX3TzigiTlCRCjgdw7jJ4qgRuM6oStEGFe2VjbP5Iczn6ApH6Hg+5M1PHxSBtZpHCVALRHtIqGqXTtVkmWn1DVxXHarvj4oPQlXHm3PDfwMXCc6hL6D3vfvCpjHMhcg0n6e3O0pStzShDFYNlKSNgLrbH70+PTAK+lAxvV6imH3saLjKRRsazpPe0bLiVXQIWpJoVDmOtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FO22ucntD+n2aMH43t2W272aEfPjzGG0EFjnv3oa1c=;
 b=dLwytLs1QrKdTaQyWGvBsGf1l9HcMwIjOpXvl2RlwejuwxjfzakT5sFRYfnR/HUs4TURhVkwQ0zXxJ+F4ktpZo64RmHTWeOaBZ7iYEvZbfOxELMEKRIb7+IQavJozaqfNuVw9DsUbd2Sh7s4K53NkQrH2By35dfh3KUFcy+rFpAPUCxKhowtlWqS3M8bU5WihRqvQe5iItrOTmeu9jPHlNH6Me1lIt5/ZyZJwdEHtQP1HsKyYE52F+TUJqJJsAVZtGTR+ejcY8l+DK3yBGV9a7q6EuTdVviO3loZozY8l4Pj4YDF8VQGDLq8bgNzckEyKu10TedEt2aRXOG52lG/3w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:20 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:54 +0900
Subject: [PATCH v3 05/13] gpu: nova-core: place the generic bootloader at
 the top of IMEM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-5-20d79ebb646f@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 1979397f-966d-4742-5473-08df3f145ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	TFFqYAsGOIp8VI1o079GAYVR6x1PelSZ5VHQhX6Bv/wzXJWwvgFp8W76L4f3eKGRVO9aPkTXZu08Ndr2yymEPiyzMqDKBXKHszOQRbgcEAcWNEnJCl9bXkeQybqZa2aI5T+sJQfrkofGRo+pFWKHsDjco2bHUIhsLV8HREbg+YJEZg/V1Ow6KE7hvs7/mk4s38A/kYnfPqkrZc8F8yrlbWEzcabkAkpMQCxOU23s/uajJJwcqmibA5RzxEp+D3VUMv+opiMvEYVfLuLpK5FHR8ENKTOQfmVM/5y/4ZWC9XRLstWtaEuTOqP7n/HhZXVoxUcv+Bg5mBEikvMhhv/huxB/w4ADNLyhG0wRIuTJWytC1CUvSs+fYApu7Bm3rZUlYh1TY+gb5dGjYvqLXUWqIV8QePIsk/2OhRpLSR+iP9MdawjwFB5NDWaAR6RFB/4jelVCOmjYVgKbjHCIKdWml8+F1NY9N95XOf6CARAFzmICcO8e6gCSCqnfm6Pd4RLV7CP5X1jBYUzJlFl07LkJwyVW3YHJSFGZVzNGWRkBPDh+71gBonU+4XJglFBhus/PRBFKYU97J9qVtI9lEhfKdzbxPlNAc+EZftEOrO29ndl5vCaa4aMufppLCVtCV5IFcU4RH2tnfR3ydnZFsjuMXi2PdNzq1HG006RPRoWl7cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R25VYkpHMDRnMU12cFd0L1gxSzR6ZXJSLzI3N3A1VW1XUDZlNzA5T1owS2ZX?=
 =?utf-8?B?OEpGRVJiNUJDWXhKeEYydW5UQnIzTTNyZTc5OEV6WTl3OG5OM2JxTUN2ZDlU?=
 =?utf-8?B?ZWNMa1VhaHpGaGJ6VUxwMVg3UUpmdXdicGg5V0lMY2hPUTl6dG9EM21IclZq?=
 =?utf-8?B?WXc2RXFyVEhENm02NHRrU3FVU1laWjRFeVA4cWpCMGRFRlJwM21QdkpBVUJL?=
 =?utf-8?B?L1VXcDFmRW04ZkhCQjZWV0VkUkljcGtKdlVQSkVrZFdGYUJoclN3dTBmbGhX?=
 =?utf-8?B?dElpMUVMR2pPTFFkWXMyZDR3Rjl3MEVxY3lhQ1Y4cG5hb1NRMHZ2eHAvVEsz?=
 =?utf-8?B?TGZ6dTRzVExJY1U5RW5XWmNROVRPZWYzaXZxRnZXRFVlRmYwYktoN0Q2dkVi?=
 =?utf-8?B?YXplc3BzOXI4VVVqVGw3RlFLSXVFWkcyY0hsVUl3b0RqU2lyejhqQVlZdXF4?=
 =?utf-8?B?SzdrWTRFL0paTzNkcFZHQzY2dk9kcVd0MzBWVkZkTTBJdUNQdGNwTzN0WFNW?=
 =?utf-8?B?TmpGY3NFMElsM2FTemh1WDVrb3VDdkhxN2VQRVA4TmFwdnlWNDlkNk9nWkZ3?=
 =?utf-8?B?bzllUE9jNHZHMkJwSFNpTHk5VDNWTTRHUytudWZRK093OXVQeUtFYnpHSnlX?=
 =?utf-8?B?dDFLT1lmM2lFL2ZMdDJ0c3Y0YTlrd2pWWWtsREZhdytMUkxoOWZ2MUJDWFQ5?=
 =?utf-8?B?NzNWblcwcnZ3MWY2V1N4SEJ1WHJEWkdpM2xCQ1hxd2pJOGQ0OUlpVktLbWhZ?=
 =?utf-8?B?ajN1KytGL0lwMUVVTmZqM2Y0WUY3eUl2d3U3NEQ3ZkMya2R2aGhwbnJMZjhL?=
 =?utf-8?B?RmNZbHVjdmRhQUlDZzdsYnpybG1wM3V2ZjZLUlNYdzhhUXU2ZHFyK3RaeEVp?=
 =?utf-8?B?aWF6eWdWbklBMThqVE9Ta0ZXcTBQN1JSbE02S1ovUkxkUktPRTdwYnhmTGFT?=
 =?utf-8?B?TExVeXRGU1FQRmVGeFFBZU5RTmRBNHB5U28xQmwwWTZFTjltbHk0WHdLVlhF?=
 =?utf-8?B?aGs4OEhtUENXRlcxaUFtSU12S2hTSzlSL1NETWJmeHlCOWFrTGlXOE1XUHpi?=
 =?utf-8?B?VjVEbUp6ZkRoYWFCZ2pQbHIyR2grcmhZZjZoNkxhWmRzWWZwT1JJR1daZE8y?=
 =?utf-8?B?RkE4ZzN5M0E5QWJLanpNQTJVdUdaZE1iMitoTkpVdHJ0QXMwMEtNMkdGcit4?=
 =?utf-8?B?WHdaaElpVU1VV0hDRENlRTMrRk5jMHd1aFhJV3hvcElFNCttenJIcktpNm9k?=
 =?utf-8?B?bWNoc0NVazdINUExVDBBU3pKQ2lEc3hGYldxelVVcGVKZnlsdW1NVHY5TlR3?=
 =?utf-8?B?NkdzUXA2NzBuZ1RPazBUblZ3Q1oycHE1RUtobHJWMGVOUnJ4N1FIcDc0Rnlj?=
 =?utf-8?B?RHI3Tm5DZ280SFl0elYzQ0pOOGpXckw0c2c2dDJkVzRoZmFLcEhvanc2YmNs?=
 =?utf-8?B?TE5Dd1haUlYwQTFlMHRoTFNSRzU3R1pxV3FYMlBycmwwRjhGNjRnWUFnT1VX?=
 =?utf-8?B?Z3hDR0JkN2Z2TUF0bkIvaTJ4SFkyUE92aFNDWm9KcjVIRTI2QXZXT3JyM3lO?=
 =?utf-8?B?YndGS1o0a2tLM0VGQ2YzRmFxVnNENVRaWU9tMUZ5R1h2cGM4WCtLZEU5OGlB?=
 =?utf-8?B?WXpEMWIzNEhWMmtuTDFFNkhYYzZLOUhnVkhiMm1zRnAzMjNHbkdUZzMxWEdw?=
 =?utf-8?B?eTZsVGwvNHdNRkw3d2xwTXlySU9NZUJyOTNCMDJva2ZhS0FoeldYbXlFczNM?=
 =?utf-8?B?Rzgvc0d2ZDZpMmsvc0x2YmV6U2c0WlBLT2NlTWxEQmZIbXVaWmdSM1VyaUpw?=
 =?utf-8?B?ejRIbW9VaU9GWFRRcHhOSUUxTUNjeFRWekhSaWN3cjZod2paTHpzQnFVZ2Nw?=
 =?utf-8?B?U3hPUlNRc0ZpeDNBS0xyd2Vvd2VpcGR0enBHcy8yVVhPNXBrVFVnbFlseFFW?=
 =?utf-8?B?NUNreDd1cjl0WGVHQlM5WlNwdUhBUGJFT29QeFZOTWEwd3N3LytxZFEwcFBZ?=
 =?utf-8?B?NnUvUThDUHlBVFRldnc1ZDI0T0kxc0RIQlNZaElPYVNKclpEWGE2Sk1nMWpj?=
 =?utf-8?B?RHM0VDRuck1nelJFWld6SzRGZ3B6bWlUV3pRNCtCK0haYXB3UTVwNEtJYkN6?=
 =?utf-8?B?bTlLU0VDcnZySHJvRTYzUVpHMzRSVzRodGx2elFuaS9mL0NQWmRXWmQyM29v?=
 =?utf-8?B?T3RNa2tpWTdNSDVoVG5INWJLRy9HMUR4QzZlN1hRZ1J5ZjcvZUljTFRwc3hC?=
 =?utf-8?B?cE5qelpla3ZjMzZ6bVFVUkFmenNFVC9PWFNSQ2hLZHV5WWxVQUN6cDhLTjhI?=
 =?utf-8?B?ZVdZSnlzdnNkZU5TMFlJNXJQV2VYejZneVI1RXFTVW1qcDJ3TWlNTFpIeFZy?=
 =?utf-8?Q?gPh2HNDPXvkdtaYIaEJgTgXgl9/BR63TRjRRNZ5I4+cDK?=
X-MS-Exchange-AntiSpam-MessageData-1: 8GhIjQ6WjdlXQQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1979397f-966d-4742-5473-08df3f145ce4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:20.1611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/YVLpZOS38t5XzLC7HrT/BGgR1FIQH/l+6DzGHoEVdVbqAbQ1uPbORFVYArKhBjqkURL8P6IpPKph/3o/UNXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

From: John Hubbard <jhubbard@nvidia.com>

The generic bootloader was loaded right below the first 64 KiB of IMEM,
on the assumption that every falcon it runs on has a 64 KiB IMEM. The
r000 load-and-execute bootloader event can name any image for it to
load, and the bootloader must then sit above the blocks that the image
occupies, that is, in the last blocks of IMEM, regardless of its size.

Place the bootloader at the top of the falcon's IMEM, using the IMEM
size that the HWCFG register reports, instead of assuming a 64 KiB IMEM.

The computation of `imem_dst_start` is moved to the `run` method as it
is the one that receives the Falcon as parameter.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: split out of the patch separating the bootloader from FWSEC;
 convert the IMEM size with usize::from()]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs                  |  7 ++++
 drivers/gpu/nova-core/firmware/gen_bootloader.rs | 42 +++++++++++++-----------
 drivers/gpu/nova-core/regs.rs                    |  5 +++
 3 files changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a34748abc74a..b17a997860ef 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -386,6 +386,13 @@ pub(crate) fn new(
         })
     }
 
+    /// Returns the size of this falcon's IMEM in bytes.
+    pub(crate) fn imem_size(&self) -> usize {
+        let blocks = usize::from(self.pfalcon.read(regs::NV_PFALCON_FALCON_HWCFG).imem_size());
+
+        blocks * MEM_BLOCK_ALIGNMENT
+    }
+
     /// Resets DMA-related registers.
     pub(crate) fn dma_reset(&self) {
         self.pfalcon.update(regs::NV_PFALCON_FBIF_CTL, |v| {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index 2f42d3ad1ba5..54d9796b4897 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -17,7 +17,6 @@
     },
     prelude::*,
     ptr::Alignable,
-    sizes,
     transmute::AsBytes, //
 };
 
@@ -133,20 +132,16 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
     ucode: KVec<u8>,
-    /// Byte offset in IMEM at which the code is loaded.
-    imem_dst_start: Bounded<u32, 24>,
     /// Tag under which the first code block is loaded.
     start_tag: u16,
 }
 
 impl GenericBootloader {
-    /// Loads the generic bootloader image for `chipset`, placed right below the first 64 KiB of
-    /// IMEM.
+    /// Loads the generic bootloader image for `chipset`.
     ///
     /// # Errors
     ///
     /// - `EINVAL` if a required TLV field is absent.
-    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
     /// - `ENOMEM` if the padded copy of the code cannot be allocated.
     pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
         let fw = request_tlv(dev, chipset, "gen_bootloader")?;
@@ -172,15 +167,8 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
             ucode
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
-            .checked_sub(ucode.len())
-            .ok_or(EOVERFLOW)?;
-
         Ok(Self {
             ucode,
-            imem_dst_start: imem_dst_start.try_into_bounded().ok_or(EINVAL)?,
             start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
         })
     }
@@ -191,11 +179,12 @@ fn boot_addr(&self) -> u32 {
         u32::from(self.start_tag) << 8
     }
 
-    /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
-    fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+    /// Returns the PIO parameters that place this bootloader in non-secure IMEM, at byte offset
+    /// `dst_start`.
+    fn imem_load_params(&self, dst_start: Bounded<u32, 24>) -> FalconPioImemLoadTarget<'_> {
         FalconPioImemLoadTarget {
             data: self.ucode.as_ref(),
-            dst_start: self.imem_dst_start,
+            dst_start,
             secure: false,
             start_tag: self.start_tag,
         }
@@ -203,9 +192,10 @@ fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
 
     /// Runs the bootloader on `falcon` to load and start the image that `dmem_desc` names.
     ///
-    /// The bootloader and the descriptor are loaded by PIO, the bootloader is started with `mbox0`
-    /// in `MAILBOX0`, and this returns the mailbox values once the falcon has halted, that is,
-    /// once the loaded image has run to completion.
+    /// The bootloader and the descriptor are loaded by PIO, the bootloader in the last blocks of
+    /// `falcon`'s IMEM. The bootloader is started with `mbox0` in `MAILBOX0`, and this returns the
+    /// mailbox values once the falcon has halted, that is, once the loaded image has run to
+    /// completion.
     ///
     /// The caller is expected to reset `falcon` beforehand.
     ///
@@ -213,6 +203,7 @@ fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
     ///
     /// - `ETIMEDOUT` if the falcon has not halted within two seconds of starting.
     /// - `EINVAL` if `dmem_desc`'s DMA context isn't valid.
+    /// - `EOVERFLOW` if the bootloader does not fit in `falcon`'s IMEM.
     ///
     /// Errors from the PIO load are propagated as-is.
     pub(crate) fn run(
@@ -222,6 +213,14 @@ pub(crate) fn run(
         target: FalconFbifTarget,
         mbox0: u32,
     ) -> Result<(u32, u32)> {
+        // The top of IMEM, above the blocks that the bootloader loads the image into.
+        let imem_dst_start = falcon
+            .imem_size()
+            .checked_sub(self.ucode.len())
+            .ok_or(EOVERFLOW)?
+            .try_into_bounded()
+            .ok_or(EINVAL)?;
+
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
         falcon.pfalcon.update(
             regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(dmem_desc.ctx_dma))
@@ -234,6 +233,7 @@ pub(crate) fn run(
 
         falcon.pio_load(&GenericBootloaderLoad {
             bootloader: self,
+            imem_dst_start,
             dmem_desc,
         })?;
 
@@ -245,6 +245,8 @@ pub(crate) fn run(
 /// firmware that [`Falcon::pio_load`] accepts.
 struct GenericBootloaderLoad<'a> {
     bootloader: &'a GenericBootloader,
+    /// Byte offset in IMEM at which the bootloader's code is loaded.
+    imem_dst_start: Bounded<u32, 24>,
     dmem_desc: &'a BootloaderDmemDescV2,
 }
 
@@ -272,7 +274,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(self.bootloader.imem_load_params())
+        Some(self.bootloader.imem_load_params(self.imem_dst_start))
     }
 
     fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index bf3a43f1c09e..af0bbb92e992 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -181,6 +181,11 @@ pub(crate) fn usable_fb_size(self) -> u64 {
         31:0    value => u32;
     }
 
+    pub(crate) NV_PFALCON_FALCON_HWCFG(u32) @ 0x00000108 {
+        /// Number of 256-byte blocks in this falcon's IMEM.
+        8:0     imem_size;
+    }
+
     pub(crate) NV_PFALCON_FALCON_DMACTL(u32) @ 0x0000010c {
         7:7     secure_stat => bool;
         6:3     dmaq_num;

-- 
2.56.0

