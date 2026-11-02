Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621421;
	b=5nQVqMgn32IA6Cfysfx63A5umDg5VrTXxDlNKFs52546uOWgfFxrzONlx4lAO/bpx2f6
	 w6nGHqJP0wUGZY2QzoRsDjNq5pqqSQBVRfAAXAQPFQfZ09xn6iqfVSYSwYTaUsKULP3sV
	 OI1Kyzl+KCscK2N8p44q7w1TO1N/HCPVPmBTd1Pwm3hCobFVzoa4LshacoGhSsFWSCLOz
	 BJRZb1wWfAMNvCWQU4Idrhuqc93VxGMBND1vDpGKpbRIuUrgEaHQ3R6KMg/IBuUFDKxfh
	 IkkkdFR26ujIJ3nvs82zZ0WEhqaftmpG2RU1rechQRjxqJiOfu97FJ+oi6WKENPX+8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621421;
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
	bh=JkTLQPMR0xWPTrd6wTk225K7gTUHMjq8R470i8s4m4I=;
	b=GZILX0ba/dWYdZrkAEH9dOOQ3duI9cbodwUfjB0JjEnrFAnxoj6tvcJ4uyBhuaggCRxJ
	 Znvb9Hj+C3vXGvGtneRZrjsBeNO4/1HDOp/1nF34v4Papf5VqCX5/9BIWtEug8aN9ezD/
	 2sJ7ImIBm5xco6rVkI5jEM10bEJedMD3go0u1P7CSZIYUCvHQUfG6irLuZM5MLLCnsnHw
	 GsLwJj/3fkt0jYqzPV0H+tcUermh4K89JrsCQLixrhZa9f68dAVvL/aY3OOQLKPMvM0Hr
	 n/vBOYUFBFPnpoXHhVXV/07hqpq6B9BwGpB9piMtRltTTP2UFKErfKpocp6Dus2zOCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EtCvXfse;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F90560A2614
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 12:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F90560A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EtCvXfse
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PagTwzMblsoADh5rdT0psT1Mn3Fx5vrTIbMg43lAP3uTzd+MxSyDmVAApdJvvzNVGyH5MJTpv+b7MU/9WN4gPXBsUWTTGoeN5eo2WCWog6E8MGagyNOGRLGC+iLSI06tGo6Q6dAQ8Xo4fDSxtSWJ0qjiovx//jxUCeDdRLgVyQ1aXgDIaWmEK6V5XTU5RGscnIz/v36/iWdUYUuMKpTDk4rDmSzHQXgAy98nVtFmepieLLk8lmx1gkQ0jNM4sbiZRj+QfIIL/+b9DdjBdCPlCH0PxuTK6VHDeLqcXofLJAndLzGyJMY+BQaN7DAaToD3uc0NasMVuG/EyH6QAise7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkTLQPMR0xWPTrd6wTk225K7gTUHMjq8R470i8s4m4I=;
 b=yzo1+529H9Hi84pBNHmFz1p5IuIoXhhek24txKQuz/Fjkun7hn53nf7E5WiZjNhmj1/U5/N1vsMAgifTLG9KzySEBJm63tubxKPVf1QwzB9PDlAJNZihLsrikrq241gNcIIA1pTLac3Th5B5ZQG9VBRA+XwJCe4Rq8EtPdkWaDI9Ht+UvVscq3AMS3EjGDsuQQvuINQSL3rhwWTksta1dzcgvLH0uk4n7Xo4bIwGgKmhGcRw6dLLjqhI72m7JriKCUyQVtbYEyXYVGwRv/rUjy8mChUVWfZ44rXViK3ge2ys8n4FgDgLX/AsB9kfclHrNT28O0ZAN9Ue1Xcm5sPQgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkTLQPMR0xWPTrd6wTk225K7gTUHMjq8R470i8s4m4I=;
 b=EtCvXfsePN3ib7EdTOjdj2I3rH0w4xa5W2j6rYdOYU7KaO2BMttAnsh4HtlIwubupMKrbKYLDmnXdmRQa+azgImzbhIsOapwzrBBRYlEWjCswsjsTyuyjwZUS68rleig8jFNNF7TtIf7fucW3n4EHO3M6/NPhWHfp4WB5GZEOiCMwb6pIv0OJ0097t1FFKqSoR8ZRNdiX6lcim6RB83NxAD1gL6PfqrmDbTVLhpTn4aExDgCqiZNqZp4jQ01AQcoDLT7ZkZXSj0cFtaGIuIRNN22IGJodg5hWEg94RIz7SCiLKVYd5SKYa4euc2ZTWytb9cjNGt1lQZ7l8/mcEK7Xg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH5PR12MB028906.namprd12.prod.outlook.com (2603:10b6:510:500::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:10:18 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:10:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 02 Nov 2026 21:09:56 +0900
Subject: [PATCH v2 5/5] gpu: nova-core: gsp: cmdq: expose the sequence
 number of sent commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-r000-cmdq-prep-v2-5-c2c2b69bdec0@nvidia.com>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH5PR12MB028906:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa223fe-57a3-457c-4ac7-08df38da42f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|10070799003|1800799024|6133799003|10067099003|18002099003|22082099003|3023799007|56012099006|261021123027099003|11063799006|261021121427099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	cT/o7yX6PVG/IcStEh4Qro7tRYfpeaw2tGDgbJjDMYUcqTQ81NMYjaHkmJr3iMw7SZHMayFsEin7uR8XJzepMpV0a3/UlYWkNHD8lTly0K17RjkSB6cLiUzpudZQwmw8YxaBzCm7h9fLVv6oXEZt6oKdN4RVAKPcU3ZsUVnyxa/v5xBv/8hK/qFvqQ5XJDuwnyadW520eD7RSkgYOXtIogJDfBesUw0cI6JrLUecranWloeBI8QyJD+VkXxrvGTEXNxgPWOsMLcV6r++isRnW1IY9MTVrXUyVlkfG1vvn00mIvrSQ0KLIwpRUnvsBvWRgrZlGQOmO86ABZVm+JosVhFJfNBO/PaAdV5WLULd4RBe8xcSgbMKrRP4RGw0qlAokAeSzj6nalygvewIgKSF1KLadhdvOw5RALTnkzkDNZrSpqVu2IBa6+tls0jCgrNW8/NUS4tk3dfkbfxAmQQ8WzsIh8+Gi5DFVYvoH73wOVF/7mWRy/mfPpZvOzvIkQehx4zaD1s0YQlWRxSMKRj8PRjk4pcMl2z/URJV0v91rCMALoLQoTwEcTWjKB2Ffz3suYthPdhGZK6kA8Tg2BU2/HjVoc0VQgR4fMQXGvhoUynhCbARS5OSiMQBTf/2ATnNEurXCXEu/WVudp+TDLDE7GI6VicQxRw+gYxn0b8ChiA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(10070799003)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(56012099006)(261021123027099003)(11063799006)(261021121427099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUV5QmxycVErd1Nnb3lyWmtyN1ducUFjOVNHUncwK1F4cHNCMmJtQTNsdWFn?=
 =?utf-8?B?MjBmNUs0Y2xYWGtBcmVkblhkcW1DT21lT3UxeThXeWo0Z3ZjdnFKWjNpMW53?=
 =?utf-8?B?RkczOXpKbng1N2dYM2h4MnRtVzNLSkZZc3hzN3p1MnZ1Z2VIeE9aQmV1RTdO?=
 =?utf-8?B?TVYvRFl6cHRYaDZwM0dOeWZhV2QreXFqYzhIWFhjeWdDL3JpNjhZSHFjVk1O?=
 =?utf-8?B?OUpxZkN0bVRiVHBhZGZsQTdPUWxOKzVHWEpKQWFhTU5iRmQ5enBXN2tGeENW?=
 =?utf-8?B?ZjhjY2VjTmZhQ1BCR0pTZ281ZVpCcmYwQlJ4aGV4UVkvejRaRXZ2bDJRbDJq?=
 =?utf-8?B?NUZvRXBmRlVCcGZaTTFLdzBrNm1sd05jZHEwSUs5aW1BN3BXcWxha0N3SWxS?=
 =?utf-8?B?WHVtM0FqUHUxTkJKQkQzbEw0aTJJTjhiRmRzTEJNb2U3Z3NGdXhXWGNReFFn?=
 =?utf-8?B?M1BQV3JNaUxXUDNmeU5SUXF2L016STREZDBLRjE4c2Nma25UUVdDQjBpMzE5?=
 =?utf-8?B?SlQ2N3VlcjIrNHZRSUp2V2VWbS9GdFdyNlpocmFOMXZDK3dMZ0cySkpQSVkz?=
 =?utf-8?B?SSsraFZRVWhEWmtEK3J5WWFHTUhMZjgwVktheGcyNGtNeU8xOVhDQnRHTFdR?=
 =?utf-8?B?VnJXbUNQb0ZSbyszdWpyNFk5Y0M4cWVkQWhXQjJKRkEvMWRZUUhhNDMvRUpD?=
 =?utf-8?B?ZDlmZUQ4dXJvazRmcFVSUFV5bStnZGhvbmFORHlORnJlS2ttL25IYS9Wdjl1?=
 =?utf-8?B?dk5UNGNRVTNnYmd5NG5YUzdTNkhHTVhEa1FHY1ROS1BpNWJNUkY0eVRZbWIz?=
 =?utf-8?B?NkZJd0h6bWZsQmh2L0U2anRINHNzS1crcHp3dHlwc0xqVEp3YmNkWlEyYUVs?=
 =?utf-8?B?N1hBc3FFYWx6MVVHY3ZlZHNoejhSRmxwdXRaNG83VGdPTmtaak9IUGpBbTVP?=
 =?utf-8?B?ekF1ZGs1NWtiU0FRQitscGIyK2x5NmtPbW9YYVVHeHNacGZkdTFDM3I5VjNF?=
 =?utf-8?B?L2duRHFkSk0wbENIaS9YakVDVHQ2SzRFTVBBMVlnMWNTdUlEM0hJck1ZQ0Vo?=
 =?utf-8?B?V2xRcWtHMXI4K3ZNb2JHQXJvckxPNHczMHFKVnZHbzVjYktFdFNhZ0pISTU0?=
 =?utf-8?B?WjN4UmQ0MjF2ZGxnTDRTVUREaktUOHdmcm1wU0FuME52Mk91eml1MWgyL0lZ?=
 =?utf-8?B?WUtYV1pJcm10cUovVlhHWndUYm9QYzc3Z1FhUGl5c1ZLd0s4SlgrT1FkOHla?=
 =?utf-8?B?NWdMN1ZkR2VBSFpiWnVjYVl1ckFWeXFRalorNDN1akdYV3lDeSs2TW85MndU?=
 =?utf-8?B?N3RoNS9ZNTJnY0dTK2srVUNZZERNNTlieVdGa1AxK0NqclVLa0ZxVDBvRmZh?=
 =?utf-8?B?OUkxTGNTaDNNdzNlSXFNKy9tTyt2dWgyQ1VlRzNZR0pBdkM2YVkzNG4xUmV2?=
 =?utf-8?B?Y3lVcEp2OVVGcUNEUU5CZ0FKWVNlby9qMWZyNEgzSTFVd2xTd2tOYUVCaXJv?=
 =?utf-8?B?UDkrenN1K0g5OCtBV0ptRUZuVVRsQWwzVDMzVHBoS0pLZXNXQi9oZmFxSlhG?=
 =?utf-8?B?OEZsMG1GWms3UEFCWlRvUXZUdU1QUmNUMnlsdnRxUXlTWk9SRzJ1YzYzRjhy?=
 =?utf-8?B?WmZaY0FraitoaExZalV5WVFMQ01WYnNTcXFxSlEzVW0wRXNCZXRIWXU0eTdC?=
 =?utf-8?B?L25JR1hmblNwM0dIK3lwdWlVSENSWUFEaTd5M0NVcWIzU20ydzA2Z1c4bDZp?=
 =?utf-8?B?dWVXd3ZUclBTN3l5Wit3eDZRc2dIYjEzTVZUYTREQnUwdStOMFB2Y2VrYnZi?=
 =?utf-8?B?UDYvbmFvNHlLd3dnQWNibVltVUNJbFFDZEVYdFNmN245dVNjV2huOGRpanJK?=
 =?utf-8?B?NlNYOUFwcFI3UUo1L1k1KzZ0RVloTk5EVWdIRlJ0MW9GaXY3OTRyUGt0Ullp?=
 =?utf-8?B?U1lIUTZUR2hCWjJXTzZ5OEVFcFZIQlVzUFFHZVRGL1puQzRjbTNJcVBabDZk?=
 =?utf-8?B?Y0IxMkdwbHBFS0FHNmtvU3prUTNNYWYzczhrTFlDeExpeFdJWEE2L0ZuN1gx?=
 =?utf-8?B?TmFRWHVjVmdNcTBjZWt3SkkwOEkzRFpTZHU5d09FMVpkREp6bVM4TXQ4MVNl?=
 =?utf-8?B?a0Z0Wms2aXkzWjBEaTh3SHJNcUVlYzJxRUpTK3RvUTIvS0tlOENXOCtCRU5W?=
 =?utf-8?B?VVJYcGdteVBZQ0V4TXJkODBESDBHeUM0SDFDc0d1MnhrcnozRTE5Q3FreW12?=
 =?utf-8?B?SWlPWm5xeUFZKzFWNFo5dXBuYURrY0dMdVdmUDdSRWRzOTRQcFJ0dWxwdjNw?=
 =?utf-8?B?Z1ZrSllIVW9Wc0JSdk5jSktEcU1qdm42UnV0TlFLakFucEFDdjVXQ2sxa1NR?=
 =?utf-8?Q?eEUotVeO2Nqs7O45UNDJPUEzwxSRNnGxcL7fh/cHOh+d7?=
X-MS-Exchange-AntiSpam-MessageData-1: zIY4ksXCgZ8MsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa223fe-57a3-457c-4ac7-08df38da42f2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:10:18.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88wRfR+bqaH1OyVbjHr4ep2wZd9UTGMev/YNL/OvLbLnn+i39yvLTUl0UcwyzAEM9NarLMkJlHyzaKPf0EZMMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR12MB028906

The r000 firmware requires matching the sequence number of sent commands
with the responses received from the GSP. Make `send_command_element`
return the sequence number to that end, and ignore it for now.

No functional change intended.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     | 11 +++++++----
 drivers/gpu/nova-core/gsp/cmdq/rpc.rs |  4 +++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 33cb9174c1e6..65f25d3c4d98 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -524,27 +524,30 @@ impl CmdqInner<'_> {
     /// Allocate enough space on the command queue to store `command`, initialize it with
     /// [`CommandElement::write`], and send the command to the GSP.
     ///
+    /// Returns the sequence number of the sent element.
+    ///
     /// # Errors
     ///
     /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     ///
     /// Error codes returned by [`CommandElement::write`] are returned as-is.
-    fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result {
+    fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result<u32> {
         let size_in_bytes = command.size();
+        let seq = self.seq;
         let mut dst = self
             .gsp_mem
             .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
         // Fill the header.
-        let msg_element_init = GspMsgElement::init(self.seq, size_in_bytes);
+        let msg_element_init = GspMsgElement::init(seq, size_in_bytes);
         // SAFETY: `dst.header` is a valid reference, and is not touched if the initializer fails.
         unsafe {
             pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element_init)?;
         }
 
         // Write the message payload.
-        command.write(self.dev, self.seq, &mut dst)?;
+        command.write(self.dev, seq, &mut dst)?;
 
         // Compute checksum now that the whole message is ready.
         dst.header
@@ -559,7 +562,7 @@ fn send_command_element<E: CommandElement>(&mut self, command: E) -> Result {
         self.seq += 1;
         self.gsp_mem.advance_cpu_write_ptr(elem_count);
 
-        Ok(())
+        Ok(seq)
     }
 
     /// Wait for a message to become available on the message queue.
diff --git a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
index 2c52ec78871b..36cba7c28d3e 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/rpc.rs
@@ -354,7 +354,9 @@ fn send_rpc_command<M>(&mut self, command: M) -> Result
         Error: From<M::InitError>,
     {
         match SplitState::new(command)? {
-            SplitState::Single(command) => self.send_command_element(RpcCommandElement(command)),
+            SplitState::Single(command) => self
+                .send_command_element(RpcCommandElement(command))
+                .map(|_| ()),
             SplitState::Split(command, mut continuations) => {
                 self.send_command_element(RpcCommandElement(command))?;
 

-- 
2.56.0

