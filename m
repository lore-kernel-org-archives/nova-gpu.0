Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793334782;
	b=1bzm2bgCecS7c/rvjcU/jiJxry8xBim3Iite2ifU+oUdoUYUXX24R0ZvGWBOEjhE2NaT
	 JTVi9cYykblqlfZ0muGj82/pEZ9B/hLTS7mN1FmBFGtvt0A3sP2sDxipu8wvUmzXx5Iwo
	 STokZy5JpSs46NSBMaFhBCsI8XDq1X/F7iqWTtOrvxhX6g/g3rd8WxKkMzjAZUqQvECcv
	 QMmaPqRIbkjKkd5V202iKbpRRjQo84Sk241cqpioUwM9Auj06C7ajU8lebecDmOfkn7Mf
	 ohMOH1FFEM13gXf1SPPGCYGXfENzTSN8O6DQWG1hMGreF5IBedHu7wFLGgxvfLlK9kA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334782;
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
	bh=vbD0hTarChEm/1W3r3jnP+TonDDqfbttISb3DUnpAyc=;
	b=GKTPFj80DpnzUkoyqU5HCGRcScZlvQd8gBSQc2Yqw06xKVYpONPnrbCcml7a9Il20B5o
	 BOy2eyUtXrSWrliv9sVWSOiIO9XOBBln+G7XuceITVuMBDhrv/6rA/BrDUE7eBAeDCPPo
	 QJhmLmY++y2oSRdtmMKRtjbR/XfZCS4aGabDjVtD9KKganf4zEwotJK7Jd6vUVYSjPDyG
	 c1qLVxnqWqW2dCNP7zMR1MQ0KMQsd4QZt3PQgdfcRrWhGlxrDZJdxCzjg9i9p+0rulzTL
	 dRRalgdSMk+axUwJ6dk+F0tq1faqJtGu0aenPUWYEkUpn6E5ZJih0pThnPfu4B+T+RQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lpIbdjcW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.201.31
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A3B606A332
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 04:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A3B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lpIbdjcW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YAv4TYxUqr98xGPAx8xQgr/Hedtqp15Uwrwp0It+Kw7bHPILpmahnue4gbP/dPGLH+1tq+etmCKz43uyMHuS8QochZ54pYtBpO6AITLckJakyvyIWbGg+NVpp93ikFM7I9ibagPZhOdK5bC9Da5Cibf2r8ltlJgVFLKrYrdye9lp91YfwtfHicV6RZ89T+cbHkfgsChgns6kh083PqVkYUcY8MM/s0IgVKvM53b1hFaYufxQUH9/BA0XCKzRp1fTH2DZuaQnFgKghPwLsz7wq9foO4F1tdcA3ihvMAJHXvHDBD9ktO3t9TX9PK7ANrxxJ/R6AWLKH46FRyLpfeiNHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbD0hTarChEm/1W3r3jnP+TonDDqfbttISb3DUnpAyc=;
 b=s7dODFQi7kMQLNjtmRS9l4+EDLWNjInarugVDiArrgk2LvT2h1aRxKNnO4H4rGKpFzZ71qzhHkPiT92tMloZ8UlhZzFC7DsjNW2YxyTuKB3Ma0YcTCsgBVmTxP5ZsdlGEegVOmR36FJWX9ahL+VSX1NnrqYvM48kHDHWrRG370ox+pXwI91RTfbHS3UsMqsOAv8wnYlEy39VEOcTbFbUrDxQuXeU+KdJcerf3ms0eUW0i54AgVJ5UvKf5/35qPBjSRPe1F3k2tFVXvnp23Gtvx+JshNy3CONp3LbZpVL/1r9x24eRgq35DeDZozItGUMvZmG96LZc0rXtjaMlpq3ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbD0hTarChEm/1W3r3jnP+TonDDqfbttISb3DUnpAyc=;
 b=lpIbdjcW+9hQXY+e/7RJv4dCmERunOEu911aroD0G++IT6uxCWKQkyEjKhHGvu2AGgHGojeICpUT5frkkYA8RP+lMRo1pRa/Lv6WqQtotoFLtvnGgYCcn2g6Js60KFUIZQq9GUFkxC8qL84nY2w13qfVy5WGCEQw23W1yY+mDOHxuOwvFsM6Ev10guis0/vz1IIAIGjgjYq2XY3X12tCYpqk1YZyP2LbjPBYFzhxFCXfTaJxiO2p8fwjMYwH0iMqcPHTFtJKFqJMKekL6x+KSMfftzIWhe9c6kUZ4g7sX+5h7ggsxHmvd5UrH2trVIF8aZW8bG/+pe5KvxLNiMdmLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 PH7PR12MB7236.namprd12.prod.outlook.com (2603:10b6:510:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 04:32:57 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 04:32:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 13:32:53 +0900
Message-Id: <DMHW4DNFAF18.1N88RMWYD4TRY@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: cmdq: do not sleep in wait_for_msg
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com>
In-Reply-To: <20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::23) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|PH7PR12MB7236:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d058f9-aa33-42b8-3231-08df363edf05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|366016|376014|261028144727099003|261026140227099003|261026121527099003|261022115727099003|261022105027099003|261021123027099003|261021121427099003|261021135927099003|261009223027099003|56012099006|11063799006|3023799007|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I+gKUBJIv1oSuhyX2eg7DHrQPRT86vTHdsMTjJQhPXWs2fYEGvIIFz0+VYIpiH48abudlf9Tf63H5yHAZKMU4tOIY8gMYUmrznRXwzxw7+wo0KM1PxocDCI8SGxAKypFQVKmF3qNEh6q4kteID+1my0bd4e8DshfmDuZDvalhTDWD1z+rhb4YD9uWHB0cj/scClcADYzdl9nHHrlb2U1t+wMUyoVozEReGHtqAMMNQMIZkof1LF5+Zmi5IzeJ4dcE3tlNSet4hN7GNsp+UngK2h85jqrqiK92A9X6JFtdQ2XDjYb0pg2revl98Qg9TxCQFPQqyfOI3c6whr8nZ9SjOybqCdkFnW0QsPWmIbhjsXL8pGslclRmJVFPIlfbiG1/buGyMWoZCJaSQRiib4w0OJ/1ChrvgM8JpCR7p2rh7Pl6oot08rxA9CNqTY6N9DlJKn48AWto3KoyU+kFSKeT5UJ4ppGs8MaTykzzy1sP1m0R0kUYaGqHxvc0GZ42BxJ2lPAooltKG29nje3aPH9XcIxnfvQcvyNRA9BQ0tn32Mp0j3ScWQ4pM90lG6l6dptiMo3ndLxc91dTVMWI03mqtN1yfNE9CYYp11BjvM4Qk7bHx37r8eincHYyFdgm+X1gvwTaZuhdWVyXHmB3ayHIpHnJTEKELy3O5zfSe/fY9g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(366016)(376014)(261028144727099003)(261026140227099003)(261026121527099003)(261022115727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261021135927099003)(261009223027099003)(56012099006)(11063799006)(3023799007)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTkwUXpWM0N3Y093OElNRWptYmtpeVhsNldmdzRQWitOMTZHbHlkZHhITkJI?=
 =?utf-8?B?NXJ2TDJLd2MrckwxbTNJOXpQWXBNYU9mSWdGZC9UeWRsSTZFazg3THNYMmg4?=
 =?utf-8?B?QWZmcFhtbERMODQxWTd1SUYzWG5ud2sxTk5yZXFIbDlkSUFSQzF1WTU5NWpS?=
 =?utf-8?B?dFY4bTBDbVhEbDBPQWhQcjNuV3pPSUZTVjVxZXBRQW5hMHRYQkdjU1ljSTRH?=
 =?utf-8?B?aVlaMG5wRERvOHJZTzlwYU9pUlMwbVpXclRBdE1KMkFYZ010QnJWRy9kOW9J?=
 =?utf-8?B?aWFCb285U2FjcFl1bFJiSzBjckRHRE45MDgyQ2pSQUZFWDAxL3hjUGNnVTR5?=
 =?utf-8?B?MlBwOE9SNFRka3JnNE5kL2JrZkJEdndSNi9WcFlOaURWcnc2aHNpRlBBWkJa?=
 =?utf-8?B?ckc1SlVjSEY0dGpvV2duZWpFa292cEd0V043M3A2NGRjaXNHZlMyNmFaTXR3?=
 =?utf-8?B?Qm5veWRrYkUvUW9zVC9LQ0F6Y3dERkFXV0F5NzgzOVhYdHBJcVZyUkJIYVNz?=
 =?utf-8?B?cnIxUC93OFdrbnhvL2ZjZ1Z4VXpPblhDalBqd2NJK0I3b001U1FJdCtGRGZl?=
 =?utf-8?B?UUFlNDJhMlo1VVI3aHkzTE1OMUlOWWVLa3p2bzNlaU8rTUN1TG91dktjcTZS?=
 =?utf-8?B?WThBNWtaekd5WmtPRnNGb2s3ZG9EUnRYRkk4Q2tacmNZc2pYajRPd2JRcnlM?=
 =?utf-8?B?bStmRUNiVEVhS3oyR1RDekJmcE0wRXBwMDcxRElGTXBDenlNeThVY215WWZl?=
 =?utf-8?B?WCtQWnlnZ0c2bVJwYWx5TlFtMGJZSmRBUVNrM0svQnRycnBJYjd2aUtaUHpW?=
 =?utf-8?B?RVZqcDE5SzVteWJMWVVJVFhISytHSGN1TFpPb0J2VlQxSmNpUXBnSzJGNUZF?=
 =?utf-8?B?YTNSVDhmOWhYUHJRMzNMd3Y5VDJIUklqc2lFM2xRMzVhL1pEMVN3UG5tTUtq?=
 =?utf-8?B?UTVocHVOa01TTXUwK0ltMVhkaHUxdUVUQkF0K2lrUlJGb2NRZ0FKbmFuWjRk?=
 =?utf-8?B?bGhFWlFBRk5QYkFyOEE0QnY0aFQzeW1ZOHhvY0RGZ0FlTDhnMXJLV2I5d3FH?=
 =?utf-8?B?NTVwKzFDeDdnY2cxbmlKZWZtdVFuSmxNRGFCNFYzaVN2U0dKWUkreDN4dktm?=
 =?utf-8?B?RmcrZHNXL1EweU9OTmJVaHVreHVaeUNrOWFjSmxPVm03UnJhay9XMzdHRThj?=
 =?utf-8?B?UldLVWgxWnhSSWN6U2xqVU5PMG05TG5EUkFVWGFCTEw2cGprSkd4NXZyQktP?=
 =?utf-8?B?Rmo2dFNjcDFERUtxcG53dDdHa0VIT0pWaldQYlZrbGtYUG1jd01TcjBwUFNE?=
 =?utf-8?B?eUhjcmJoRlB5U3ZDQSttd1JpNmR2WmIyR0pHNk5UK3VhYkwvWUR1MGpvZnNY?=
 =?utf-8?B?NXBiNVp3YVNiWXVZOVowVk5Fd2QrTlVvSy9hK0lySnNlY1ZxRE83WTFJR3da?=
 =?utf-8?B?eldHNHQyL0YvQzdIcDl0WnYwOHk3a0NXQ1NneldVR3Z4YVlyaXNXRzRwaWhF?=
 =?utf-8?B?aDYzbnFmUG9PUE9vSWZkOURiSkZrMjluNm1Sb1pUK2Jsbnl4aGdzK3dpOG81?=
 =?utf-8?B?bW9MQTByY09MUVFUVkxneDNDZ2xoU3hJTDdSKzdKVi9xeEM2cG5rODVKcEIv?=
 =?utf-8?B?OWZweEltRk1EVndVNW1veldlV2RWUFhTUVFSV2p5N2llYm1mMmowTlZPekdk?=
 =?utf-8?B?aFBlKzZXZVdna2ZtZFZKanZKYTRiRmp0dDhZeEpnOFpTK09INEZnRVkxa3do?=
 =?utf-8?B?ZlJ0aFhQbElLVHZSdjBoQkY0bXRURDlVMURxbGxJSk9oNCtmczMvYTFyUmVy?=
 =?utf-8?B?UzRwYmVNWVpWQk9tZGtuT3A5T2FLYVY3L3hycW80anYvMGVTMU8yQmFxQnRB?=
 =?utf-8?B?eGg5aUUzUklES3EwVy9MYWg2bG9taEdzUlRuWVVwSHVVRy92WHVlSHQ5Wm1y?=
 =?utf-8?B?dnkxRHp1NFF2UFE4TXFWazJFZWNmd0hXM2ovR2lNN0JvWTZxUm1hbm1tTUFO?=
 =?utf-8?B?Y3JuVk9aZldlNS9UbUZvMnNnRTlwSVZwdk4rSHgxRXc5YUJXNjI3YldwV2pY?=
 =?utf-8?B?cjZ3ZmJVeFBVcFd0K1BPTGh1YWkwdit2eGl3ZG9qVVQ4ZEFVazNtT05TNnUz?=
 =?utf-8?B?STVPTTgxWi9HakE4R0hQTXR2UGorY0tlY0RFWTI2VGFOU2RsM3lDcjE4aDkw?=
 =?utf-8?B?QnpSRGR3bmUzRHZzZlE5RjRqS29FR0pnZHUwcmRCT3llZG9sS3M1aFNHYkVC?=
 =?utf-8?B?d2xCTU03YmdzaUR2WTcvbXoxQU1sODFoUUtGT1grZlJTZUZ0d2pNVW5BT1pp?=
 =?utf-8?B?R0hyR21UcXZxV01jWU4wQWNPTTdEenJNd3NvZEdnd1NPS3ZLVVh2Ujg5R2k4?=
 =?utf-8?Q?AGn6Qval3pWomtez48+Bf+7hIx5Fd8/ege3VmYDAZgnF2?=
X-MS-Exchange-AntiSpam-MessageData-1: ztk0wYTYnrp6xQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d058f9-aa33-42b8-3231-08df363edf05
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 04:32:56.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sRzMLI23tjjMTVWP5VLK+OrR3YCHTCJawFrr68vFrIldHD6vby6lYZChDgFoqtyvMkD69cXjSPrVia//LZFW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7236

On Fri Oct 30, 2026 at 12:21 PM JST, Alexandre Courbot wrote:
> If a message is not immediately available on the queue, `wait_for_msg`
> sleeps for 1 millisecond before checking again. This is 3 orders of
> magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
> (which does not sleep at all and busy-polls) and is way too much, as GSP
> commands are expected to be processed much faster than that.
>
> Set the sleep time to `Delta::ZERO` to mirror OpenRM's behavior. This
> makes the CPU busy-loop with a call to `cpu_relax` at each iteration,
> keeping latency to a minimum.
>
> Slightly higher values like 2us were also considered, but with such low
> values `fsleep` also busy-waits, and would thus only add latency for no
> benefit.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index e6d9a97130ea..d8c00df012bf 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -590,9 +590,8 @@ fn send_command_element<E: CommandElement>(&mut self,=
 command: E) -> Result {
>      fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>          // Wait for a message to arrive from the GSP.
>          let (slice_1, slice_2) =3D if timeout =3D=3D Delta::ZERO {
> -            // If `timeout =3D=3D Delta::ZERO`, check the message queue =
once as `read_poll_timeout` can
> -            // potentially sleep if the clock hasn't moved forward while=
 the condition was being
> -            // checked.
> +            // If `timeout =3D=3D Delta::ZERO`, check the message queue =
exactly once instead of calling
> +            // `read_poll_timeout`, which would keep polling until the c=
lock moves forward.
>              let slices =3D self.gsp_mem.driver_read_area();
>              if !slices.0.is_empty() {
>                  Ok(slices)
> @@ -603,7 +602,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspM=
essage<'_>> {
>              read_poll_timeout(
>                  || Ok(self.gsp_mem.driver_read_area()),
>                  |driver_area| !driver_area.0.is_empty(),
> -                Delta::from_millis(1),
> +                Delta::ZERO,
>                  timeout,
>              )
>          }
>
> ---
> base-commit: 9b840ed71d34ff545e3ada8be2ad5daaae542b50
> change-id: 20261030-cmdq_wait_msg_timeout-26df11234d10
>
> Best regards,
> -- =20
> Alexandre Courbot <acourbot@nvidia.com>

Previously we had a discussion about Delta::ZERO waits [1] and Danilo
had some concerns about creating unnecessary contention by reading
coherent memory extremely often. Also, AFAICT `fsleep`'s busy wait is a
bit nicer than just spinning. WDYT? I think switching this to
Delta::from_micros(1) is probably better.

[1]: https://lore.kernel.org/all/DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org/
