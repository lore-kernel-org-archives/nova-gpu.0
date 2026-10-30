Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793337721;
	b=levArLZwcRPNYLy6Is+qYBf0iBmU/S/gvIbqVWIU+IoGgJuDT3oPdVaJnezoLPQCRg5i
	 yH7hihRJ4JolfotmCnah92+GNOo+oqFyNljxhxelDfkeyY+5jGtvPNIjGQnoCBV+eezts
	 fo3N4G+smtAztscSBtbtRrA2OjefDdTODr9orQjswtE/xDSMndSRaqCWYR0k4TUUtcS70
	 rdbQal2I6g4TOZ+arb4bJBkbDlagh/drbeijQGDU+21GspFn2m7m8lWwzjBq2qRjnl5RS
	 Yip95GZ6MIHrI/KK3zfrKcFn31dcknMQ4sHXxFXHFD9znHdxkl0D1tL7X0T1k0pCZqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337721;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=Wrry8BPo7/5R04zv+N4Qzosxb2SQPoLFbyekWBUyLOc=;
	b=YhyViQY8yEgWhjLEjnurILCiXI63/3B73jh7EcihbVEmMzpTzZncQOCtsrwXa3Qznogk
	 IYTtq8nOOe+GzMlg9l9zF8m8qYteuY9fPDnnd9oGNvkGc6gPDDtCS6k37lk3KkkqzcVXQ
	 IAwsObq1yqv7px1xkZ+hb2OHzocOHFyNKagjpyvy6Iu15USPCY3gfQKTXsJ7m6wJSHG0T
	 QtIaUHyNdVDf0mO8fB9A4GifRzl26K5HXvsmpqoBSEzOqP/njP+nNGeVQYT+aIQ3Xa+hS
	 4TSJKOueId3rNjAeYND+gH4PUXxUiwflZvigO3wJr8PkYkD/qtehVaxqXvPt76Hppiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QMEyCp9c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.50
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EDB606A31E
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 05:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7EDB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QMEyCp9c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OW7ffjPfYrLyG0cPszGqgQ4aUH32Rmqe1SMwr2Ig9BLVZ3rQKPztdEjyFCNLH5+KZf832egAVkNwnZsxJQ6FPPLqnz+EHuI5CSijGTfhOlnbpslSTWzcFsKCEBReB4TQiC4AbNeuD2hHbWu2pC169fLJg/KmupSSkoPawxC1B0eZRrf54x0cNomEDtsVrVWxJeQiFkBSiIM1Et6bs0R2wAF37KBuQNaYfgJ2mkbtn1UGED1Me6rOIG2uZiGRF5co0Z4F8PJFAW5y8OeBUgZJrRCAatwrZpzSyT0gJFJQVV/khVwZjfwT2aN6x4a1ii+KLo8aPrb78E/cfxkpXN15dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wrry8BPo7/5R04zv+N4Qzosxb2SQPoLFbyekWBUyLOc=;
 b=XAWNjdYUvKcvMphZ3S0G9P1VP8g1frE8fu8lzmU/M9yZOc/6bVHGEdUi80W7t9opHJfy1i/2K8e2sB02D9xcSg80kOolFMgSyTupgrjx50SOAjvgGWpykuT/BMSTmi+QoHYoPMf0+2dQCjadLvEWCkgIbfps4OyDxW/8n9BV94MJvBCePXvdcaxA5QB7ID062aCAnXA+/1bIaO3pWaHtdcpobw6QUMTRS3SHFDTO1+qDSXwiC+qXO9nHDXlnwdoCl4wbhwq4OvbPyhUX9VZsNXTstpqbF/VsC0J5J4SqaL51+Xn7t+pND1qTgmDXUARFiBrGHBVzl2VuJJJ2MrLWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wrry8BPo7/5R04zv+N4Qzosxb2SQPoLFbyekWBUyLOc=;
 b=QMEyCp9cgU8HaqkYrRP+/U4iCokgJY14jh0yXo1ueM2u9n78FsfERBVUsoeaZt22ZQy0M2ewq/CR11Olr6QecWyMhx7rZtWWbKIdy90mELFOdCwJgLNa3Inm2edBCs/b52fme8k3CBDH7hl1DZT3B4ac8VECjC+Zl/ggfbHLhqKjXwx4/H7MCeQwjryFnarWfjvI9Nw+8e3dstfO8eJKorfERFaB/e5t2TeIU7g2oUEemb5VUWROloSnmXmylXCqjXKQH1W6ToGhqi/WOC0KGXco9HIiiq2cvlVpi261sKs/9O5AgO0JCdRCCjJ/CFzKU2TtqQSPPbkN2FOV3P0slA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 05:21:55 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 05:21:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Oct 2026 14:21:52 +0900
Message-Id: <DMHX5VRNFYLQ.11FZIS5422ZS6@nvidia.com>
Subject: Re: [PATCH] gpu: nova-core: gsp: cmdq: do not sleep in wait_for_msg
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20261030-cmdq_wait_msg_timeout-v1-1-a1e628d2732c@nvidia.com>
 <DMHW4DNFAF18.1N88RMWYD4TRY@nvidia.com>
In-Reply-To: <DMHW4DNFAF18.1N88RMWYD4TRY@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 97bf2a75-e118-48c2-25dd-08df3645b684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|10067099003|4143699003|11063799006|3023799007|261028144727099003|261009223027099003|261022075727099003|261022105027099003|261022115727099003|261021121427099003|261021123027099003|261021135927099003|56012099006|261026140227099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	XdXkj+A8rlPdkewiHZXSKr6jqDiD6T1ZZAZZ8eH1+Cevy4rS6JfSmwI5enWAljChsc2fBPkrKzjVmolZKhS+FMXdIAe6n5vjfk3jn4/wUfInZyHrNmU/wtNLCQrnUKBf1Sh/ZJdVNgy92KOwJ23NlPwaX032w4bUoEAsCJl+aR/5Vuma5uzbs/e9T43On+YljCPY9wOs2Tlgh+fhdyUCGaVbNisodz/R998DV65URAbugdYbBfdFPmW2P2b38mj6xgZrl31hmdgW5OpASs0hfO36dWHZ7ep/Cqp6VlwmGv9HsV22DDzxfrwoQD/WAoRgLuZlYMiIlkFLjphZcEcAI9RibrdFkjfETyPlkZuR/jABc5xlBUivTq8R+4gQALzjsPwylN/1ERsIzbW+F/z5/wsTVjzhKccha4ZUvoD1JGLb0t6hqRcZJheJKKMl81gqfwPqrSmnlYzYJ6Ujhs5l3uN78mE1wFe19HX3f1tbHTRQLOyC9Cr1rCTyJ4z2cgEgSCZjrjZYKzv4MC+psNafl/om+jGVTpSInHv4Qt5RLdkOHJIJi0GYubKBT+KNwgOb81lsTfO86jBqrXDrBGE6emtcJYAtMsYsp0XOdVciBbEIxLzMHsEWztMLSy0EksibhUD0bVpIe5mlAaYwONJYlnBIT0VbU/QpM3M/6LkS4sQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(10067099003)(4143699003)(11063799006)(3023799007)(261028144727099003)(261009223027099003)(261022075727099003)(261022105027099003)(261022115727099003)(261021121427099003)(261021123027099003)(261021135927099003)(56012099006)(261026140227099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWNhV3NuL3AyYjR2ZzBTZ2dDK2ZNaDdaZFpONHBQa1dMQi9FZVRLempiK09G?=
 =?utf-8?B?Wlo5K2l3dGV4TFFWTjlBT2J4ZThiT09ObUprZ2ptOHlRQldPNzRkeUpDU3JC?=
 =?utf-8?B?ZHpVa2FzWm5OY3JnWDJMV054VzFLeTJrY2xlcXF2ay9DTERLOThkNk0yRmFU?=
 =?utf-8?B?WTZVL2VrdlFLcjk3MXZYdml3OTNjVk1ZZG91SXZyblF6dEtCNnVKdlJoZVBK?=
 =?utf-8?B?dmF3bHZIOEIzOW04TTdvSnNrVWs3NDRQaTk3Tk5SVGd0cnRTZ1lqb1l3Qkxv?=
 =?utf-8?B?aStMcUhTMDhBMXJLNkQ0ZlorTWovOWRhVW1wQUpldEhteEUxZVJoSnpUQnhQ?=
 =?utf-8?B?cmJ3MjN4YXJrYmY1M2VuQ21Fc3lvdWtmK3N0blNVRGV0VElPMFNXVHFLcUVZ?=
 =?utf-8?B?M1lUNnFnNnJXRHhINTB6bmo0SGVkRkxtcnVkRGwvUlVJL29xL0tuR3pub1JL?=
 =?utf-8?B?Ym5CUjU1SzF6UFJnOXBHZDlGWkRudElhbEl4enZTekZjMGs1SlhmSkdRV3RQ?=
 =?utf-8?B?RmdBSm12dncxb1JRcS9UWUxtVWZKaXhDUlFKc0JRcEtzUHExVDFwWW1MZTJu?=
 =?utf-8?B?MnZBangybjVMTExWUTNRZjBrSHI2ZGhnRjhkR0RNbUpqSUhobExsRGN0Vmhs?=
 =?utf-8?B?Mm0rS0hzWEg5ODJOdEdQRkUwSUdseVVNY0g5NnhxT3EzTTBVdVorVGJsMmts?=
 =?utf-8?B?eG05Tnl4a240RDlNejQ3cXN2OU9ZVUU0TDF0enBlYUkxUVVyQVRVQndBMk9l?=
 =?utf-8?B?WFlkT0lZRkdMSDcrMWJYa3hQa0NNUC9rbHEydlFaeGJSdk94aG9rM29RZVBy?=
 =?utf-8?B?TTlwTjNvSjc1b05vd2xFRmFvd0V1aDBFMW5xZDZiWEphUzZaVUNFSFNyakVM?=
 =?utf-8?B?b2lvQk8rdUk1Y0lpRk8yR3dJMEpMNGx4ejd1ZG9keUw5eGdtakppcVZwQlZM?=
 =?utf-8?B?WDBlNTVsd3RjM1FnMnc5QjVpbm5XQStmWFNXZDlrTmIyNi9JOFh4YTBzY1g3?=
 =?utf-8?B?UnZyeCtiREdVSENTdnpqbnd4SXA1NnZ4QUVZemVldkkrZGRTK1FmazhkVWhI?=
 =?utf-8?B?aTNYR0RwdzVPTjRUcld3Rmo2UVlVeHZYRExQQW1qb0ErZlRLdHRWT25tQTQ1?=
 =?utf-8?B?YzlHbUpzZCtxUHRybkZRZnNiejVsMTZhRUVOd2IrYWtCZkdONTFrMUp5cEh0?=
 =?utf-8?B?TVBHQ0ZYZ0JFOUJCM2VINnVHUmdpZ0hWazQvLy9ORzVaN1NWVnNibmdUL1ly?=
 =?utf-8?B?SVl6VDVNd1FiRndDLzE4aERucFdtaWJHcThHb3c1UlRMUWdwSXdWbis2TkJ2?=
 =?utf-8?B?SDUzbWwyWjBjc3VuN09GQm5zQUlaVEc4Z3ZlS2ZMWmkwOVE5Yk5nWTlJUXFh?=
 =?utf-8?B?MWFPN1BUbTFzV25FdXlTQ3BQTHh1NW5qaW93ZHJXM2pNRWNCSG1QQnhHVG5a?=
 =?utf-8?B?a2UzSUYvU0ZKcTdxNVREK2MyTC95ZFhIUGIwSENmUDdCME1NL005OXlPZldW?=
 =?utf-8?B?WW1DOW4vaGJuZllHYzU4TDNQUDdMR1hYK0xBQ2xheTZwK0N1ZmFSUm1oVExH?=
 =?utf-8?B?c21kUk9jdWhDb1BpSU9ZaFdOK292SUdNRFFpRnJaSC82WWUrUGhqeElHbnRq?=
 =?utf-8?B?eDJSVzkxcHZCNmNBNWFpREZNN25wZGJCOHUxQjQ0ODVPMXpBTlo5TkhvZlND?=
 =?utf-8?B?THM1dDNFbHlGc20vd05mQ3prTlI0ejJBeUhxNHAvSnQ1Z3NMUWdUdmZML0kx?=
 =?utf-8?B?UzdIRjc1eGNFQW9aTUVaazQ0eVE0Qm9UK1lqTlFrWDg2amlCMWVxRm1yTzlI?=
 =?utf-8?B?c09WK1UzaUNkTGhnaHI3b09pdW1sR1AvcHFNMzVRaURmK1Z5TUxzTmlDR3Zu?=
 =?utf-8?B?V3E0TVlCejR4QlppSjQxQ2FvZ3pyZ0QwSmhaaURPMVlXVElvVWVtbFRKT29P?=
 =?utf-8?B?azBRd3ZNUjUzZjVoY05VUU1HcytuSDJ5WE8vSUdqa0hXNWxXelBkTkpZQXBC?=
 =?utf-8?B?VFUwdEkyc1hUdGhLMmxMZVlPdGd0Z2JBVWRCcTh3S3ZyQWN3Q21oRDVpY3Az?=
 =?utf-8?B?QjNXdHd5RkV6bXhzOWc5YXRwb0p4cnpUQnhhdnlKWnNZaEc5TUo2dGpxV29j?=
 =?utf-8?B?SUY5WWdnMEFGdUljd05jQVZSOWdSNmxhSEVyMW94djV6dWFOK0tlRWoxWXhw?=
 =?utf-8?B?KzRIVnBtbzFrMUVqUHdhM2NEMEU5blEzdnhqWUhaRTlCdTc3L2FSY0ZUR3RJ?=
 =?utf-8?B?U1MzRTE0RzFDNHBod2JoL1pBQ2FhTWFGRGlEQytUZmpOdG82WGVlMkxIVzc1?=
 =?utf-8?B?Q2ZLMitsSHZ3SHVlbzR6L0ZZOXBaTXZxUndVcWpMTGs0aitwYmt3UDhyR2pN?=
 =?utf-8?Q?tn5/FZXADzNjiHbi96jnKmW2WSzyl1ziaOnu8Zs5vrfHG?=
X-MS-Exchange-AntiSpam-MessageData-1: 0Ebn6Xja3bNU2g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bf2a75-e118-48c2-25dd-08df3645b684
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 05:21:55.5237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V39b1qrJR+d0Ltjw1001y8T8EunG0vY3cG4uUhG6SKBK69NXYQs80Rh+sDy5SFT5MHJ+MlSPySBtFwhlmrF5sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488

On Fri Oct 30, 2026 at 1:32 PM JST, Eliot Courtney wrote:
> On Fri Oct 30, 2026 at 12:21 PM JST, Alexandre Courbot wrote:
>> If a message is not immediately available on the queue, `wait_for_msg`
>> sleeps for 1 millisecond before checking again. This is 3 orders of
>> magnitude more than Nouveau (which sleeps for 1 microsecond) or OpenRM
>> (which does not sleep at all and busy-polls) and is way too much, as GSP
>> commands are expected to be processed much faster than that.
>>
>> Set the sleep time to `Delta::ZERO` to mirror OpenRM's behavior. This
>> makes the CPU busy-loop with a call to `cpu_relax` at each iteration,
>> keeping latency to a minimum.
>>
>> Slightly higher values like 2us were also considered, but with such low
>> values `fsleep` also busy-waits, and would thus only add latency for no
>> benefit.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index e6d9a97130ea..d8c00df012bf 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -590,9 +590,8 @@ fn send_command_element<E: CommandElement>(&mut self=
, command: E) -> Result {
>>      fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>>          // Wait for a message to arrive from the GSP.
>>          let (slice_1, slice_2) =3D if timeout =3D=3D Delta::ZERO {
>> -            // If `timeout =3D=3D Delta::ZERO`, check the message queue=
 once as `read_poll_timeout` can
>> -            // potentially sleep if the clock hasn't moved forward whil=
e the condition was being
>> -            // checked.
>> +            // If `timeout =3D=3D Delta::ZERO`, check the message queue=
 exactly once instead of calling
>> +            // `read_poll_timeout`, which would keep polling until the =
clock moves forward.
>>              let slices =3D self.gsp_mem.driver_read_area();
>>              if !slices.0.is_empty() {
>>                  Ok(slices)
>> @@ -603,7 +602,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<Gsp=
Message<'_>> {
>>              read_poll_timeout(
>>                  || Ok(self.gsp_mem.driver_read_area()),
>>                  |driver_area| !driver_area.0.is_empty(),
>> -                Delta::from_millis(1),
>> +                Delta::ZERO,
>>                  timeout,
>>              )
>>          }
>>
>> ---
>> base-commit: 9b840ed71d34ff545e3ada8be2ad5daaae542b50
>> change-id: 20261030-cmdq_wait_msg_timeout-26df11234d10
>>
>> Best regards,
>> -- =20
>> Alexandre Courbot <acourbot@nvidia.com>
>
> Previously we had a discussion about Delta::ZERO waits [1] and Danilo
> had some concerns about creating unnecessary contention by reading
> coherent memory extremely often. Also, AFAICT `fsleep`'s busy wait is a
> bit nicer than just spinning. WDYT? I think switching this to
> Delta::from_micros(1) is probably better.

Anything works for me as long as we reduce the spinning-induced latency
to something reasonable. I'll resping with `from_micros(1)`.
