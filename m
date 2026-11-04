Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801064;
	b=sAAMwnVp/tNpjRu4tryoXdlnKJCFwcu6NlK/uGSqeVdlHUaCWKqbalWRitE2jTFVT6WA
	 /NkfB6RgwWa+5rmlIuugSgL0jj1WokHw/JCgzwusW6XC/dOaBxhFQFBD38CmOzgAC6p5F
	 8XnYg+dpekngAVW+HXquTxYAmw2Dj7sVVZ6aajMX+U6d1ljWUpe2mGxERhKzc3nDRUNWj
	 p9VOZWV9VwczIMC87D8mYSRnYjQ+d9OAH3Rgrj7uAeXOVYH8fSW8TnQEqY0WXQBkgxc86
	 WycY4JyurB3qfpOQRzzPOOvSeUWfEGI8Rv37Pa8ezNPBFl4K5lGvkyfk1I1zGWsTD4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801064;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=3HoGQkJxlGzC+wl0E1lMqOLgG1xmUxYpjwJkGlmj/C4=;
	b=2M4XieoMTCccIL5HdCa5EWSsGVeU0DeZpPYLGcAvX1tyklFxEjOh9Ai8TqMEV5uf/W3m
	 HB8LXNTG8XICwXapKIoGRxR2CoWflaSAtgtarI/1Iuo0L98cDZSEQ6ifXJWbboc6mwJO6
	 ba66NilFZLlv8X9OzU69AcAvYu//ArrcE/wVyfcX1NnHhriiCYbsIvDa+GB3eseFbSkgg
	 yvylZ8JxwQ6FVtUxWAC40ZEJ1CzhqK9HqakJRwR8kUlMsA0EnRLymGWj3BmHVjJCN/XeK
	 lALQPUkAzg/HP2D044Z3zwmXbZk5BJ0CXZx0k5s5+MwsYOvMyF1R1a60WYLiEmJyShQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=imkigC+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.8
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E3606A32E
	for <nova-gpu@lists.linux.dev>; Wed,  4 Nov 2026 14:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 187E3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=imkigC+8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meBw6b9lHsVg9lcT0+pH8y9TvmbnMwD7MOX1vbj9UxHs8G6s6FSuA6IlCKHxqwIbIkEPpZtn0HcYQ8t5DqZFoH1Tbk0JU4wePRp9Pt1WsiPAO2t8FI2pQq6nE+5+m7v92H3TGqY7DFKgP/aEGPgLaWJellDkkdJzfxqOQqyPp+apauDQQw49eg2Hf2MIRTIYSLBT3RiGB/jeYUZ55UbEOxaBipm8mAhHFMAmb1+Y5xV/7/+IQAQCADOkBhn+wYKSg7dBdo8MAVjvqQvS3UbIRcSuiYH0Kk6VHYu5DQcmJrPiZUhq/73cizHBeflQteuViaZjpPfrMJrjd4hTLSwMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HoGQkJxlGzC+wl0E1lMqOLgG1xmUxYpjwJkGlmj/C4=;
 b=panp5AZwIWM8P2t+lQkzUG9vkXtP5IpjrI83hkEfvqUaSUTa0Aiy/eUJ63ILKRxSjXTsBGAc11q2ChE0pGs73DjC+oNAnLOoHaWKWpQlGXrB5ZvitTbj/0jjO9HbbWQ8oSOlOGEnZ5F3VZOKoSaxJBF3dYaBtf+Km7ZMkGq2quk0XCAGFvX+Fbkvw3oEsEzRqiJ+9YSYg7Rho2y8z2sdMxXWoJcbMuPWTEQnV9mEgAHYIvAYrSXJVpCYyrpxnR3ru43+lIZt91rhDZdetx9TxVPm+U8OleIPLssspNhQANXzuK6lQKtHvRZS550cGjVf9kht1WHJ7XXekJ2ORk9NsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HoGQkJxlGzC+wl0E1lMqOLgG1xmUxYpjwJkGlmj/C4=;
 b=imkigC+8ErYmnsnnlTX7BV5DYE+xazn7wIofH6zx1b7VORi8Kpx2BtS58eL6QmpMqu+D2vutUZGOce9pxJ/6lZCb0Mytseanwqhbvh9sCZf4bNbD4/+cD4KywpBKn4WYXJeKkbhV+yAUGIEfVVkN7shqPORcktFPxr7e/5PybAxTg9pcCuFHXi0+Yu9iQibruhsaUBbam+uXQHD+LKAqsCuCaMFH5+HZkWspKSeNTQdaLJ6IxX7vGXvq2OqpJ9YirCmsot688M70WDPeDUQhP+XxozNpddRuafHyYQyKXJHTnI8haGLHM/3/akB6w1wX4j5vPDSvBFk3XrM5LjQXWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH3PR12MB7594.namprd12.prod.outlook.com (2603:10b6:610:140::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:04:16 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:04:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 23:04:11 +0900
Message-Id: <DMMHEIW2LX0T.2CCR3WAKAXC60@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] gpu: nova-core: gsp: cmdq: compute the queue
 regions from a count and a slot
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
 <20261102-r000-cmdq-prep-v2-4-c2c2b69bdec0@nvidia.com>
 <DMKRDBNW6KIO.OT0T0M6JFRDY@nvidia.com>
In-Reply-To: <DMKRDBNW6KIO.OT0T0M6JFRDY@nvidia.com>
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH3PR12MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: aa375e11-6f39-49b4-8a09-08df3a7c820b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|10063799003|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261021123027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|11063799006|261021135927099003;
X-Microsoft-Antispam-Message-Info:
	r8LT0NP4yhSIo5YifvwHrgeVHs4r6ZbnJaGGyVmFs8RzAtJK7MB2ZmHFRVy37YN5p4k044KSsHdDTYLO6I8SFtpDNL0uPQWmrxOx8LrpGJsZhOBsn8CN1Qpws5I9SbAvh/j+WKMsl0fdCdOeM58JUiU74TZROcfZ0l9D3G7zq00dBHwCBROSXKPNyWl9ag7tkwipHjSWTvSmlT6ihvGPOpRsymysOoc7kNHdUeXLh7EmkMtXIy36L7iSkQTY5osd5h9HuDgw5ehD8XD60TDTxCnnLG6LJkQ+vFajgOaIH0Dpop2lgS2pJ/cB1Ha+CO/E/m7cUHEJawLr2VriKC5RUTxLf9ocp2d+LfW/QqaigXLuVdHWgfr+Z6ayX6cmrt0pWPnQ5IWdJogmwHcGgRE96Iv02uK3BrACwGhAEU+p6o56y9VGqLsB3yLaowP1SVyI1eFgyEsfgGqa6Kd3KzZdZ9wj1tFPjIfaZuRP8FrRcYbguSpa1TiIEEAyCMAMuJBaXldyT4fETWo9KqhMlue+UWFc49YRsPEnBpB4JnfZA07IndaaZuuKCluyt5Wp1G3WwgyLQSCP5EDsVXqbkTGgbk+Cgcek2e2skJV0+oKRXn5pwyrs1SXnZBBsaPxwkORpQPuplfhMXyZ44x36k9NJAcPZmxdrGjZileORCdLl0xk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(10063799003)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261021123027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(11063799006)(261021135927099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mnp4WFp1cEpMWkNTOGVzRmhCTlpNLzlYQkIvSmY0NVZiK1pPVE8zcFgybFN4?=
 =?utf-8?B?R3EvY0JYQzB5ZnhPS0tLVWZrelM5V00rWUlSQUczckR6SmlwTlpQQWwrZ085?=
 =?utf-8?B?Q2E1UlRMRzVnbnFYSlRkN1hmTHpIQ0FRcC9NczdpMEQrVzJIeGgrN2JGMGZM?=
 =?utf-8?B?OVNVUEVUcWtXK0FIZzViU3IyRndoUEpyRjVCenhFTFYydjlUaVpTQkhSUzNr?=
 =?utf-8?B?bUt5TThSODBhdzBsVFFaYVFKK3ViRlFrK3RIdVdkNlA5MmIxbVB4M2lFUGxF?=
 =?utf-8?B?WXJ5anY5N2hqREhWcFh6Uko0WmpvQmRmeDh1SGMySEN6alhsRkV3YXZjVWw3?=
 =?utf-8?B?dWpVU1E3MnBzMmlsaTVDTmNUT0NGZFlrRzRBWWw1SHZJOU80allwSEo4Ym5U?=
 =?utf-8?B?dndWMGRlYm9vZkE2SnpRemRyVUJtYnJ3ZVptUlRMTjllNVJ3L1ZiQWpYYXVv?=
 =?utf-8?B?S2x3dVN1QW1lNlBkMHkyaWdEaW53STNQcktOeTdBUEtteCtXNVBjQ1o0WHc3?=
 =?utf-8?B?Vkhac2NIUitDWXRGMGNOMWx4aHZhV3B2ZGNGZG9adkRvY2I0bloxc1RYd0J3?=
 =?utf-8?B?TjRHaUxKUlZabjU1QXVGYXE2WjkyOGVCOHNOK3pMT1Vlbm5uaEU3MGVUNHhQ?=
 =?utf-8?B?ZFErMWhaU01LajhoL1VJYlBtdnFaT0IwdFlOMHVPU3NxOTA0clNWUndyWndl?=
 =?utf-8?B?SERkMEFxUStJWDR2OFBSVkEvVlhlQ0xtSkZCQTNpT0lISXZXdko0MW5DSXU1?=
 =?utf-8?B?Y0VaVGcwY3ZITHF5d2V0UjM4Wi9JZTlocEttVjMyYk5CaUFPWUs1M2dMTEg2?=
 =?utf-8?B?eEg3QUovbmQ4K0ZvRS9uRXBXNmN3RFY1MzJYRTd5U2xDQWxXZnRHMmk1dzY1?=
 =?utf-8?B?MVArMGJvemZIN3FRZlpoeEdEVVozZjVFS2JyMnhOMGY5cVprcGNLK25kcWpj?=
 =?utf-8?B?Rks4SXNiWmljbFlmUFg4SDMycExQRHJSaytONWY2S0tBY1FHNFhvR0tnRmJo?=
 =?utf-8?B?dklLMmhURjZEZ0phTnFtSGkvczljWnlMY0g5TkduVk5jOHJLNjVoNzhCOFRi?=
 =?utf-8?B?dVVkVGh4eks3YzR0elFJNlFqNnhYeWZyU1BJb3BQc2twd0EybnVOcDVCT1pw?=
 =?utf-8?B?aFZCMjJvQ0xnRjJMamJ0ZjJlYXVzYW80TG1halhVbmlCdkF6dUE4a210aUxE?=
 =?utf-8?B?WlR4Y3oyak9VVnUwZTZwbTZGZURMMWRZWU8xakVyQUxCZEFJREpteFhHYzZo?=
 =?utf-8?B?azFvb0tMbmxGS3FNSWRMUnpxZVFiU1RNYmIyNnp1eENtQkl2aWRVY09seTcz?=
 =?utf-8?B?dWs1VFdxMkVIelVFODVsRmNQL2NZSzVnNmU2QjUzL05HcExWb2dWR2hJeWJ5?=
 =?utf-8?B?ajU2eThPZWNyT3llNzNLYzdRUit1alN4eUFGRkRqYnNISjlFZVZua0haMTYz?=
 =?utf-8?B?MnJsdHlKMUdpNExiR1k5ZTZycEZYRWVpTk8xcTMra2NjdXVDdFkwZlBSM09i?=
 =?utf-8?B?anpWT3JWV2dUU0hjb1pnaUhKQ0JXRFczckRDM1VVd2ZRaWZNeUJJbjZxQmNq?=
 =?utf-8?B?K21iNGwyUHVRMGhvOUxmMitDT1phZWJWcDMxM2NvVDh2c2Fvd2ZjTyswQURW?=
 =?utf-8?B?bVRtTG45QlAzUlFBdnNOMGRpNnAvaEZ1MjkvQUdEL0pWT3NQUHppRHM3RzI2?=
 =?utf-8?B?YnorbnB0QnQvUEJFd2psajB6SCttZGZYa2ZjSlRCUFByK20xbUpTVHBsbWtY?=
 =?utf-8?B?cGtTdEJFeEo2bW1oa2g1R29ucVVUdDlKTThqTXJIcVlEcGliSnY5NUxTaXB2?=
 =?utf-8?B?ZmdZMVh5M1JkTUsrZ0Y2VEROVHRoT0RteG8yT1A3ZUZRVlFWazA5VytFazRS?=
 =?utf-8?B?S0FlaWVtMlE2UWFJdnN2cjhjL2VFNEdqM0lQRE1FclI4K0UxTWxZTDFUZGw5?=
 =?utf-8?B?d1hkQXNrWkJoVTVGOEM0Y2hRSDNybTNxaTArOXR5bUc3OXhERzZlSlE1UjNC?=
 =?utf-8?B?eE5jSVUvVTBsOGFOY1gyZ013SUVMQTVGcTlkakIwaGFId2VnZS93VGpWSVpr?=
 =?utf-8?B?ZitNMk55R09NampNdmUyZ3dremdKaUdrYnRmb3plOGQ2RUx6Y05jSFJIMnUv?=
 =?utf-8?B?azJ1TmFiTGNMMFh3MVpOaVFzSzFKOVJXWEZ6cDYrenNPMHl0dUdxSVhVTHR1?=
 =?utf-8?B?TXlvWVRpb1RtWmVkVjlBK0taOTdIaUZ2ZkZlZkx2V0JsdTVrbFRTOHZ2L2hW?=
 =?utf-8?B?OGFTY2t0cFFnSjlibjNQOE03RDhWdXFnODF1dzdxVEZSSGF3VEg3Q2R0MFlo?=
 =?utf-8?B?Sm50LzRlTWpuOVBod0tmbnV3SWprMGlZdkRwdGV5REQvMFhFWjdKd0dERm0r?=
 =?utf-8?Q?KCzdl8CrqHKITgeSaYDG3x/TqMGrET1O6OG07JM08zRmu?=
X-MS-Exchange-AntiSpam-MessageData-1: P6MrcdABs7uEkw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa375e11-6f39-49b4-8a09-08df3a7c820b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:04:14.5987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7v8vYqC2jdO2FX89iXWEIPEfpYw9vAdtycuRAyNEUcXS02S6wdVYsHnHXaz34vii0U3QbpkhBTHYqcumevNNZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7594

On Mon Nov 2, 2026 at 10:27 PM JST, Eliot Courtney wrote:
> On Mon Nov 2, 2026 at 9:09 PM JST, Alexandre Courbot wrote:
>> From: John Hubbard <jhubbard@nvidia.com>
>>
>> `driver_write_area` and `driver_read_area` both branch on the relative
>> position of the read and write pointers to decide where the two slices
>> they return end. This works for msgq v0, where the pointers are indices
>> into the ring, but msgq v2 (used by the r000 firmware) keeps them in
>> BAR0 registers as free-running counters, so the branches and their
>> SAFETY arguments would have to be rewritten for it.
>>
>> Instead, compute the number of slots available to the driver and the
>> slot they start at, and derive the slices from that. The slot counts
>> come from one helper per queue, which are the only two places msgq v2
>> will need to touch.
>>
>> Use I/O projections to limit the amount of unsafe code to the bare
>> minimum.
>>
>> No functional change intended.
>>
>> Assisted-by: LLM
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 130 +++++++++++++++++--------------=
-------
>>  1 file changed, 58 insertions(+), 72 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 90e26c4dcc28..33cb9174c1e6 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -19,8 +19,8 @@
>>          Io, //
>>      },
>>      new_mutex,
>> +    num::casts::FromSafeCast,
>>      prelude::*,
>> -    ptr,
>>      sync::{
>>          barrier::{
>>              dma_mb,
>> @@ -186,60 +186,58 @@ fn new(dev: &'a device::Device<device::Bound>, bar=
: Bar0<'a>) -> Result<Self> {
>>      /// As the message queue is a circular buffer, the region may be di=
scontiguous in memory. In
>>      /// that case the second slice will have a non-zero length.
>>      fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mu=
t [[u8; GSP_PAGE_SIZE]]) {
>> -        let tx =3D self.cpu_write_ptr();
>> -        let rx =3D self.gsp_read_ptr();
>> +        let avail =3D usize::from_safe_cast(self.cpuq_free_slots());
>> +        let w_slot =3D usize::from_safe_cast(self.cpu_write_ptr());
>> =20
>> -        // Pointer to the first entry of the CPU message queue.
>> -        let data =3D ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msg=
q.data[build: 0]);
>> +        // `w_slot` is below `MSGQ_NUM_PAGES` per the invariant of `cpu=
_write_ptr`, so the
>> +        // subtraction cannot underflow.
>> +        let before_wrap =3D avail.min(cv!(MSGQ_NUM_PAGES =3D> usize) - =
w_slot);
>> +        // Per the line above, `before_wrap` is less or equal to `avail=
` so the subtraction cannot
>> +        // underflow.
>> +        let after_wrap =3D avail - before_wrap;
>> =20
>> -        let (tail_end, wrap_end) =3D if rx =3D=3D 0 {
>> -            // The write area is non-wrapping, and stops at the second-=
to-last entry of the command
>> -            // queue (to leave the last one empty).
>> -            (MSGQ_NUM_PAGES - 1, 0)
>> -        } else if rx <=3D tx {
>> -            // The write area wraps and continues until `rx - 1`.
>> -            (MSGQ_NUM_PAGES, rx - 1)
>> -        } else {
>> -            // The write area doesn't wrap and stops at `rx - 1`.
>> -            (rx - 1, 0)
>> -        };
>> +        // PANIC: `w_slot + before_wrap` is at most `MSGQ_NUM_PAGES` by=
 construction of
>> +        // `before_wrap`.
>> +        let after =3D io_project!(self.mem, .cpuq.msgq.data[panic: w_sl=
ot..w_slot + before_wrap]);
>> +        // PANIC: `after_wrap` is at most `avail`, which is below `MSGQ=
_NUM_PAGES`.
>> +        let before =3D io_project!(self.mem, .cpuq.msgq.data[panic: ..a=
fter_wrap]);
>
> It looks like compared to v1, this kept the `after` and `before` names I
> suggested but changed the indices (e.g. in_after =3D> before_wrap). It
> means that "before" and "after" are being used in two different ways in
> this function ("after wrapping" and "after write pointer"). What about
> picking one usage for the entire function? Either is fine imo. Same for
> the other spot (read side).

Indeed, this was a bit confusing. I have used `after_len/before_len` for
the length, and kept `after/before` for the slices, so things should be
more consistent now.
