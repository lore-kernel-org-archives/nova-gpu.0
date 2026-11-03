Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701379;
	b=qdlPuuSAXH8yZX8+ScJcoMHuRjyD4GbaBHR+xuES7wsIwUmtNJYiyw8z5pWiowXtdR/D
	 rPd28bO82QemcVXXnROr5Fiy0mbvCm7mUdemBZFY5JokkwmKrnsA6Z2L10KaYKzFnaBy8
	 91MPGmUtkPeAuGAvLaLvvy0wFVJp/GgwI7jntVCsKLS42NHsrazAtDI912LCjoqEiN+jH
	 uTerlYnN76Bze6+X2ZjQCm9I6YmdE5ntgtkWMfN7HDTvZ+XNWMHvm+jAYBkcuSlQW1o4u
	 xDtvKg4qkDQ99/qRyFJcG3T+4CEKDivvtZOzMLUJH16oWQAYEqBddS3u1GJrTcTlFGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701379;
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
	bh=0OW51CHZ9e+K+QgzqzjN/3ParyaZMi8FpIPcHx7L6rY=;
	b=HRgjh8OGaT30NmUGy5Ga3jhsoWQWHXFzm69OahhB52sDpN1v/lxJHeJw5WfVn0a/s+qz
	 fDKGbZ8XbV9c/JdKnJjFpIZC7bGNkP9RGeAK4EEPmAWH2ZzZRBwaj2FAM0kB+AxaAvYH6
	 f/J9IRbGAndqo7Q8/cuD0yZI5+9AnlO8l3PftITjdM8m2pq05OlM2HkTEwaMzGJ6OpdNe
	 yhnIKDTakg3Ym4GqGJcYHaGZbVA4gs8tnImtJk8jcAqG14/iCzOEAaLyO58yD9XWoZvdW
	 uUG87Hc4YmAs+VBMS/dgaNtnqE1oWS9+ybWmv1XFytLkbyXWvH9cLb3AAcQP7Ui0WNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=U3GKhnTE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.52
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CF606A816
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 520CF606A816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=U3GKhnTE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uknwsEM/ijPar9EvJhaH2Nv1yTszz3IKkWncsTp/VNK2Hq+Q//xuzIOjFP3e/vgmjNNNwNwI/SYE9SkTT/tnh9zyNdQPpeXy+2RsY0D0UGHm8qmnSWMG3pLlbPaRRhS96vNGYvRFacuvfLIZZn695BKuvGrhh9FCgO+vcgFYAVGgKz9x/TzAio1/3R8bnDdnM/Cb7gDIabqDoKS3Sg+SxVnJAl34wdumvneAvVOr9EOnnzlmkNnr873h/FbXVOARruxjGSfV3XJO3dpQvZB8hXs1yLmhW8QjW3UvirwJXtBqCmGrDW6cqEbtfv0Hwb7RXIit5vqT4snswUYgpbnBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OW51CHZ9e+K+QgzqzjN/3ParyaZMi8FpIPcHx7L6rY=;
 b=beDoyZa92ZqXrlgN5JlEOONf3mZ4o8ce8VaF7urbWxkuJUdP/xu6ssG0EEOq7mplbS0Bkn0W5a9EohZUFGQ/2P9GO02osLTpbnCoxzhlR5UONHZbNAtwfl2q28/9F4SIm3HnPchVA4b0Kz0GInqoYvdZ5BoD/Dzcrn26GpJlTNTQTQ9Sr6VNi1Au2Cd7DHSqpbb+E5zEOOyWHKH8r6LmRn+jViKvynqcRgYFC7b7v63R12zGeDpE+dl86LZUHAF4Zx7nnl+2efrGkyYiwA9RcEs4Y81NFz3zeW9nVROaMUW/qyDXO0gjFKzKWYSXOwCdXBwe+Hk64R6FLWEvUbG9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OW51CHZ9e+K+QgzqzjN/3ParyaZMi8FpIPcHx7L6rY=;
 b=U3GKhnTEdO04323eqkcHUSlwZYBzL7ADxqxEcvNsa8ySO++DkPz9jbr0PdLEWjbp5S9JNq9g3JbQgiuCfS/Q3TWPW+WIWK92hDAsAmi2LS9KM68lJ8b0x32W+NPMoRce+OEc57lzH3yFc0lGW8uoDzBDq7mrqLyA/NHe8kieVPnnkDDMF0T/+mmc32IbX/K/tZkt4O46W1D1MM9NGNAN7BRKWE9RRcxuZoD+p6AqSVahUJLzzS4iWc2pgLQuNLjUKJIZF3VmSJ7ZkBJM6z5l82ffZKCSoplOqPXhfWKD3ctpb1y1w+gZi4nFAoNmhakZ4szFRlec1yndEhEcBLgkIQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPF8FC6E1236.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bda) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Tue, 3 Nov
 2026 10:22:54 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:22:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:39 +0900
Subject: [PATCH 1/7] gpu: nova-core: separate the generic falcon bootloader
 from FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-1-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPF8FC6E1236:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ae3f3c-58bb-4402-eb38-08df39946a05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|261102123227099003|261021123027099003|56012099006|261021121427099003|11063799006|261009223027099003|261026121527099003|261022113327099003|261022115727099003|261022075727099003|10067099003|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vDH/zwgstZoQL/nSVBE9zQ0QW0sQklJLmLzrieee/0j2xl5fMYWDrjmrKO2vf99NA6m3WD9Bp8eXnF8h6JEksq2ZLCojRME5SU0YSR6AfQJ1Ksb7rusBEcVycqP5CZ30qL3gillTtHs1TRQvZo0eUiEUDQIyjMxstgYMrptBRjSBzNtlfKcLqF2USUQQFuDMHm5kT3UAr4rxJDgZVjqn/8pgLC7t4grA45dxarhKKAEfhXsMv0+efVyybwTX4UCMYO5ySxun1w3kNHYHfNFkOccKdCg4msutNbaE5DGxgCb1Lh8XWzmkPKGG8zVvu0cwjCOARh3zfgieR7k06blGB69OHE2nt39/jrGIQ6TOPx37N3tP85dEDazeEgmerc5EjlWcjk5t2BrRBr0M36mRTMPIkQG+uWTuLvM8VN9lMy/xuuHWztBJUxNXF/bdj/KUAZJqXg/zQtJ0SAMgGnqoZVS1o0QcCHY51zhvLyQPIIUT2CkJrTojhfWE4e/7rfSIm0Uv/7Ye7nCXzhNJDtfnkgRv2GQ214n8UUO9aNT9ThxUiX7seegiEnEmhR7VkvTRjN90HAgNkc3+eMrJU4ElYDFoyL0IxMMbgqwIL7gJ/p2fDyThRQW8qbKoCnKVrupFbcOMYkmpj/apNqc+CZDRL8CuHSSjxDzr2UnkNjFGCOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(11063799006)(261009223027099003)(261026121527099003)(261022113327099003)(261022115727099003)(261022075727099003)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHBJWGYyOWFZOVVJUkNvUE5SdUprNHdTY21YakF5MzVucW1mblNXWTl1VHhX?=
 =?utf-8?B?WjhNM2xvWk51YUs0OTZJRldZRkdNTC9YL0dzVGtkWFROdXpRcWw0Y1ZVWkt2?=
 =?utf-8?B?TW41akd3NHY4Q3JZQzl1aGxxa0VmMC9ZeXpUTTJlOXJaYnVNK0JoMEFib3FO?=
 =?utf-8?B?b2xnWFdzMzlFdTZCclpDbnFMMUlqV0hlTDhDaUlLaFJ3MmJLR2lGRkVuSDk0?=
 =?utf-8?B?eHVGOEVmbnY1cDBpWGQvRFNQR29GY1FEekNVRnlHaW9KZnZydVpkZ29qc2J5?=
 =?utf-8?B?elFOTVA4c2EzVnRGYS9hK1RNa1l2YW8yY1BJNGRHMzgyelFMQ01oUDZELyti?=
 =?utf-8?B?eDN0c3JhV01VcG9KZVFwTUt1aEU5LzgwaUU1em1ET1AyZk82RFJZQnVHazdK?=
 =?utf-8?B?TzROTlZDbGRDL01WazIrbTRhQXh4eEg1NW1LcCtZekYrREVlcFpLY2Q2R1Y0?=
 =?utf-8?B?UHhLbVl4T3lUMFdERXBoMEd2ZkRwbmRrSm1NTUlDdUZkbUZiT00rOE5iWmVY?=
 =?utf-8?B?S0o1RG9RQXVVM2VjOUhXODFvRHN5TWJWU3lsZGsvUFBvK25kbjNHZ3RBVHpy?=
 =?utf-8?B?Nll0RHhmbExvOExERlYzVzRKVnVTMWovcGR0SXdNVXFFUC9ncDZMK0doUFE4?=
 =?utf-8?B?blZzSFY1TW8zRmV5L3BGVi9UcVlIalN5eWg2b1ZTak9KWllTZmYxWDRPZi90?=
 =?utf-8?B?VGZSRWZzSkZGVFpxckcwalgybWF3Q0ZrV2V1dXE2QmZ5bm5YZ1c2WC84cUdD?=
 =?utf-8?B?RncxcDJ5SFpKNHpyTStkamJLcXpubjg2RjRtVlQ2WFIxbEF4RWFCUEpwbjJr?=
 =?utf-8?B?NE5zQnRBdkNUbzZoT3E5ZDJKcTNmWSszZEluTnlaZ2FTbDhDS3hVaW1Fb1lV?=
 =?utf-8?B?VG1UOElKSWN2eis4SWRQU3dVeWIxbEIxK0dVTkxWTldMZ0NwVTQ2eVNKeGtT?=
 =?utf-8?B?YlY5RTVpMWNMekNySnNHZWFlczVtbXhaZmJHaGlFK1ZJM2tlbG5GOUoyWFcz?=
 =?utf-8?B?NXhpSVhtSmFTdEdpbEFpODlDWG9RRWZUd2VKaFh6dUNjRlhMeGU3c0xUN2FZ?=
 =?utf-8?B?b3piWlB1QTh0cXpBUGxWclQyVmt6QlBYd3BNRE9uRWE2WXBUTFNyZ3VnVUwy?=
 =?utf-8?B?MytrM2dsQ20vN0tCYnJER2pGcDZMRFZrSE4vZ1Z4N24yU1JxUEh6akwwb1lK?=
 =?utf-8?B?dk5mYXFkdTRROTlueEtDOG13dVNpdXVWUHFtb0t1cnI4Q296d2g0WUcyMGVj?=
 =?utf-8?B?YWNvaUtUdElyOWs2Tkdoa1YvWkF0Und5Yzk2NlYvV2pwcG9iYXhqNktmdjRl?=
 =?utf-8?B?VlZPUGdZYUxXVVc4MGZGZ1ZNUnhsWUdVZVgrL2ZCZm1NWmFuS0lNaHE4ZE9Y?=
 =?utf-8?B?c1Z2WjJ6V0lqMWFuaFhyQlZzek15eGJEblRkR3RzTWVTNWxGbENvNzFVWHU3?=
 =?utf-8?B?Qkd2UlJUeU52MHoxTDRkd3Fkc1BNek1aWWl0d29aSmIvckg5RmFDd05RNmhw?=
 =?utf-8?B?dmNkNWpNYzExOGdPbVh2amwrUWQzREYxNEpzK0dSREp1ZDArT1pKZGEzeitj?=
 =?utf-8?B?NzFaTU14QXVKbEUrTlQzWTlZaVBwS2c4Q2VSaHlvYlFJN0tkM1hCWGFQc21U?=
 =?utf-8?B?MWxHelNac2FIMU9KYXM4eTFiTHRJWlVsSi9rOFd6Q251Q2lyTmNSd3V0WHJS?=
 =?utf-8?B?Y25CeXUzZFYwdlBIa29Fcm8wSE40WHZUaytCUi9scEZGWTVSUENROHlNWVQ1?=
 =?utf-8?B?ejIxZ0EydnNCajRvOGdoNGkxdDVVSXk4U21nSEpkbmpROXVYK3ZvVVRxQUQ0?=
 =?utf-8?B?OFpDNWhrOEx5cnVheFNkNkc4bEJ5RTJGNEhNbEtoQ1haaDMyVFlFZCttamtL?=
 =?utf-8?B?bnFnaVpBNzVMNEh2clhQUFhRT2dQQUdtMUFQelRUMnhUSFVlSzVvakJubGsv?=
 =?utf-8?B?cG52M2NwWUp6K0lqZ016cEc3TFR3eGFqZnNORVlVeWx1S2dsckZoRG1hOExS?=
 =?utf-8?B?MGYwRUdUVjJYOGRLWVdqcjFtUGFwWGl1V0hDUjIxTjBjTE5YeUdmM01wRWQ5?=
 =?utf-8?B?Z0RLKy80NjhmV0lGT21hK3ZIL1NFY01kckpZUDNZYWlQYXFHZGdWZVR3cDZD?=
 =?utf-8?B?N0lXUXZCNWZoVDl6Z0cwQ3cxWVNySXFDdTQ0cVRwUEJYWm85RDVlT3huVFo3?=
 =?utf-8?B?UTAxc3phMlFLTlJySFZTbmtacnlhQ204YXk2ZVJPazZaeTVEeDZLZ2ltbnpj?=
 =?utf-8?B?eC9JMVZtbG1CKzFrM2pqUk1lZWJId1c4RW04anFYMHFqMlY5S2VXVVIzOTJP?=
 =?utf-8?B?T0ZsbXdBbk5wL01qanhWclQ5K0tMY3ErMWN1d2E2UVVsby9odUlidDY0V3Rm?=
 =?utf-8?Q?foqKTD+pVPIjy9XN7HCjkHNmglLH39DeKGrzNIBvjyFQS?=
X-MS-Exchange-AntiSpam-MessageData-1: wFfDhcfnlJNd5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ae3f3c-58bb-4402-eb38-08df39946a05
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:50.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjVkPmtiPuTpgfCKEmgZBbY3NNgvRtZPV41rnBBSd9iP04BG3txAgZ7r767l++5duT7LdwlYsZ26QhFArT1Grw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8FC6E1236

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader is a small program that loads a larger
image into a falcon. The r000 boot protocol needs it to run an image
that GSP-RM names in a load-and-execute event during boot.

Nova-core used the bootloader only to load FWSEC, so the bootloader code
was part of the FWSEC code, and there was no way to run it on another
image.

Move the bootloader into its own type, which FWSEC then uses.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
[acourbot: document boot_addr(); split the change of IMEM placement into
 its own patch]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs                  |  1 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 59 ++-----------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 99 ++++++++++++++++++++++
 3 files changed, 106 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d8f6509a35d1..358c9b8db0b8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -24,6 +24,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gen_bootloader;
 pub(crate) mod gsp;
 pub(crate) mod gsp_fmc;
 pub(crate) mod radix3;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 68858b48390e..59f57714fcfb 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -17,14 +17,11 @@
         Io, //
     },
     prelude::*,
-    ptr::Alignable,
-    sizes,
     transmute::AsBytes,
 };
 
 use crate::{
     falcon::{
-        self,
         gsp::Gsp,
         Falcon,
         FalconBromParams,
@@ -38,10 +35,7 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        tlv::{
-            request_tlv, //
-            Tlv,
-        },
+        gen_bootloader::GenericBootloader, //
     },
     gpu::Chipset,
     num::FromSafeCast, //
@@ -100,16 +94,11 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct FwsecFirmwareWithBl<'a> {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<'a, [u8]>,
-    /// Code of the bootloader to be loaded into non-secure IMEM.
-    ucode: KVec<u8>,
+    bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// Range-validated start offset of the firmware code in IMEM.
-    imem_dst_start: u16,
     /// BROM parameters of the loaded firmware.
     brom_params: FalconBromParams,
-    /// Range-validated `desc.start_tag`.
-    start_tag: u16,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -120,28 +109,7 @@ pub(crate) fn new(
         dev: &'a Device<device::Bound>,
         chipset: Chipset,
     ) -> Result<Self> {
-        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
-        let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded generic bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
-
-        let ucode = {
-            let blob = tlv.get_bytes(b"BLOB")?;
-            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
-            let code = blob.get(..code_size).ok_or(EINVAL)?;
-            let aligned_code_size = code_size
-                .align_up(cv!(falcon::MEM_BLOCK_ALIGNMENT))
-                .ok_or(EINVAL)?;
-
-            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(code, GFP_KERNEL)?;
-            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
-
-            ucode
-        };
+        let bootloader = GenericBootloader::new(dev, chipset)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
@@ -211,21 +179,11 @@ pub(crate) fn new(
             }
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
-            .checked_sub(ucode.len())
-            .ok_or(EOVERFLOW)?;
-
-        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
-
         Ok(Self {
             _firmware_dma: firmware_dma,
-            ucode,
+            bootloader,
             dmem_desc,
             brom_params: firmware.brom_params(),
-            imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag,
         })
     }
 
@@ -274,7 +232,7 @@ fn brom_params(&self) -> FalconBromParams {
     fn boot_addr(&self) -> u32 {
         // On V2 platforms, the boot address is extracted from the generic bootloader, because the
         // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        u32::from(self.start_tag) << 8
+        self.bootloader.boot_addr()
     }
 }
 
@@ -284,12 +242,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(FalconPioImemLoadTarget {
-            data: self.ucode.as_ref(),
-            dst_start: self.imem_dst_start,
-            secure: false,
-            start_tag: self.start_tag,
-        })
+        Some(self.bootloader.imem_load_params())
     }
 
     fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
new file mode 100644
index 000000000000..b1ed6c2ccf7d
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The generic falcon bootloader: a small program that the driver loads into a falcon's IMEM by
+//! PIO. It reads a descriptor that the driver writes at DMEM offset 0, and loads the image that
+//! the descriptor names into IMEM and DMEM by DMA.
+
+use kernel::{
+    device,
+    prelude::*,
+    ptr::Alignable,
+    sizes, //
+};
+
+use crate::{
+    falcon::{
+        self,
+        FalconPioImemLoadTarget, //
+    },
+    firmware::tlv::{
+        request_tlv, //
+        Tlv,
+    },
+    gpu::Chipset,
+    num::FromSafeCast, //
+};
+
+/// The generic falcon bootloader image and its IMEM load parameters.
+pub(crate) struct GenericBootloader {
+    /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
+    ucode: KVec<u8>,
+    /// Byte offset in IMEM at which the code is loaded.
+    imem_dst_start: u16,
+    /// Tag under which the first code block is loaded.
+    start_tag: u16,
+}
+
+impl GenericBootloader {
+    /// Loads the generic bootloader image for `chipset`, placed right below the first 64 KiB of
+    /// IMEM.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if a required TLV field is absent.
+    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
+    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
+
+        let ucode = {
+            let blob = tlv.get_bytes(b"BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
+            let code = blob.get(..code_size).ok_or(EINVAL)?;
+            let aligned_code_size = code_size
+                .align_up(cv!(falcon::MEM_BLOCK_ALIGNMENT))
+                .ok_or(EINVAL)?;
+
+            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
+            ucode.extend_from_slice(code, GFP_KERNEL)?;
+            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
+
+            ucode
+        };
+
+        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
+        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
+        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+            .checked_sub(ucode.len())
+            .ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
+        })
+    }
+
+    /// Returns the address at which the falcon starts executing the bootloader: the IMEM virtual
+    /// address of its first code block.
+    pub(crate) fn boot_addr(&self) -> u32 {
+        u32::from(self.start_tag) << 8
+    }
+
+    /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
+    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+        FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        }
+    }
+}

-- 
2.56.0

