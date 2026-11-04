Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793784112;
	b=fLVnhsrsrWYG3LyZzJfxi+ge8aIpUzcB0GnTE1zQpEZyGGV/1ZORTPuc5BzkwhvuD3+q
	 xH9N6jQjDq9Wz8Vd03SwN1ABosGXWr6BaI4ronDwGtajGS9LQH6AIFmptvtGMvQl/hqG4
	 SUyXh4KMputByQrCbZe6BzcjiVS5m8ShuDLB3VVuj9yEwjtS3r28cc2NVRhbKmTQqsbSx
	 KDB0DazqJxGrUgM7mUv8Vs8f9vL64d7fPUhBthWMsIKGYM1vPUoyNO/vBgrLfnZy+iXW4
	 Y1gAeJDnLEQ+nqbbj9/2E8Vn8Ajk0r0qRkYmDsgPT/FXuT8OHTIYJQ5IZzK7xA6QJ7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784112;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:To:Cc:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
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
	bh=K8tbDifdt3As6Q9wfqevWYrD4i3H34m3sIB1ycJZmG0=;
	b=5XZPf4PnEi+S4rwEwB58CsF51r42EmQLsOVOYW0Peo8E4MjaJX5wsympFnfWJ3uX71rt
	 NwUncF0v5DDHD58pCn7PH1hH0zMoIVAxp43XKskWePHr+XEHscsCclFxEteQA5CpblpQt
	 9QI0FydI/KvRyCO0Rw9Dt9IMduERGVSr9sIn9E5o/dXR+0UduAl5V0GuraFrhppNXRet7
	 LzN7Kvchy6jcYV50c87yVR93EBty7uchRIjIqwq3K0//UMe31HtEaRYRRT5Gh5fX8E2Sf
	 eF+z3Xfbaa2lYWdgSpld2zCiLcsPXnHQM/qAtKGB2NeErCd9PUdNfVRfSiARLPloCNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QKtz8bEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.10
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3A6606D81E
	for <nova-gpu@lists.linux.dev>; Wed,  4 Nov 2026 09:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD3A6606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QKtz8bEL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwzfwmKYsR3C4wz0Sqpjdu05sl5Yy1QulXSvyjQbUUFyTE1ijkNAdKA2NyjDAjMmYUBAV5r/IxnglNb4FBzy1h1wtHJYdLVuMWDOOoew9cgUOvbLMUMnHlX1MtRSwpntYcUmc/PYaJOGCi+fRB2DNNKWzguDLJtXgA4JUdSX2/dbM5GGTKqWSV8QD+6xqAFQ2bg3qNHOHnQ+se5jnmX+IjH/VHA71qXpcV5AymWbnvX6nehwe6aPOvTxuxEb6FmdsrcZoiDrmEJ7lkndry6AyGlKUWLYo+8K8tUmfzr1gaKO1Pg4/EtXE1n2m9iszJoQ7pUHvioN7O1cn6FbFbY24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8tbDifdt3As6Q9wfqevWYrD4i3H34m3sIB1ycJZmG0=;
 b=tlG2R9rLXO+IaL8wijHodEU561UPIGwDN3nPP9iei/RbHJBfKI80ggc8aC4nbYB8dboZgU2Ag3iFZG62zhMgj5uQuJPsmyUccJkolL/X4G+3MtaDcRnzNEj2U/wyieCmn70AmyT/lfA9XL8S/+okb5uZYvybJQGlTMMWpfTyHEVpjx8imL4pqgf/pByri0yR3au/j9AmpOrwulasZvRj/kLAOWKCVMcme1A+rnpmZeoCmnAG0mxMfgpBgG7HWN6l01NzR3P2DvZBHiFBug7JCzJG5unZZ+jcnK3b5W05/o1kYAJadGm7iHYUEc4V9QQXbUgJ/8o5SsdSm3raSWoX+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8tbDifdt3As6Q9wfqevWYrD4i3H34m3sIB1ycJZmG0=;
 b=QKtz8bELl7VJGHfv+GtsEH9+D8Z/gJPGhvDiJQOD5hULZMaBXEjMg8lcvvcqKxpQ4ojfPE9ultHk7aYqoMk5UFEkQ/tUV07U5tu8QLedOe5569716cJmDaTULXneI1xh6yOLW8Jqn+dH0znZJ/LjfmAojGgXf+v6N4u7eaZlcDzEJh2yI268pkzJgvNTcnK57xnDhKrNS4A+8T2l6veMuv9xlKVLmAinMIyYPRTVctq597jYd31fAlCNlWwLXZk/8N5sNlTWRd+DlC8YAe/ZMbqpdrlDOWgfUYLlcIcKPztGZ42kZLtpPYzB/d0vnLeB9F1HAE1oG6yhODeX63nRPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV2PR12MB5773.namprd12.prod.outlook.com (2603:10b6:408:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 09:21:41 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 09:21:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 18:21:37 +0900
Message-Id: <DMMBE677FYSH.3FTFOWI4QHHFQ@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/4] gpu: nova-core: gsp: fw: add the r000 bindings for
 the GMC API header
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-1-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-1-189f9ff3bfd2@nvidia.com>
X-ClientProxiedBy: TYCP286CA0193.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::6) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV2PR12MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 465590c6-5384-4ecd-5eb2-08df3a55090b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|10067099003|22082099003|261102123227099003|18002099003|56012099006|261028144727099003|4143699003|11063799006|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261022115727099003;
X-Microsoft-Antispam-Message-Info:
	mpP3QVkEBbepFKqFYMsPUzob9LnsbXx8VSB+VEU8lWE0ViMy/HirGFnyT99BwiD1kb+KXST/yKZEINc069prazlU788cGgj1hmerwvllrhMAvQXNAljywS0qeaizGYTkyq3tFCJot6nW43AHxrNnKrgUs0tF+vhTmwN4EJ73OrnApcfgiEF3U3HLCnugAtFbDj2XtSVqa1PCa4SqGBY4eItrmFBk7fD7YzncMTLlGgHhB6ZtBqaoXcT0C8cBcffeEgmodFJm5Qv4L9vbR+6hPz48E+SrTK/XFOqMjZ39gmyvQ5nP2LIHwnk1gsoYylFKwQzrab9qE4KaUIkbtixs3mkEX13D0ZFxGJJxaTw3xc4BkF9SLGWvMRWxktVRPdyAlDhHAp/2R0Zwls++M4sGzKvh1U6lDhMEmwhDB7+fUobyxELrOWBR/sXWu4taBuC6i+gZS2CVVl+QQ16VujsDLa7aQ+/PARDzUp5RSTzV8DVg5gYOQnvKPG0BuUbVOCP0OJ7rnUx5iyBXKfJy04aCLBCf9ZF4NXmPT3qencVimQ9yejM7B7CP066SNwmLOP3v0RDUjfhwYFN6P7pq6WdjKdU2MUwZT7RUCG5wDfzyWLQKY+oHHEoJlmApRYjxXtKztFGWpSHk41G3X9iU+5xjxPQ335vlTIKKHGEcc7mq3sY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(261028144727099003)(4143699003)(11063799006)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022115727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG5hczNBUGFBdFlESkl4ZzdtRGhkbE9iQ2JFdklPV0pzVXRYRmllejI0T01m?=
 =?utf-8?B?em9iTElBdlE1cVR0RlZVendHWlVKd05SVWlkUlRwSnBCdVZCWm1RbTlUYnpQ?=
 =?utf-8?B?U2R6NGNtL3JGb0g0MFZQU2JJWExHOFZ6U0VlVHdoRFl1T2dWVFZZVThHYm5T?=
 =?utf-8?B?QzA4cHB3TCt2ckRhMzh1ZDdtbEQ5aEJUem0zbEowaUdFOXFpVFg3RjczUVl0?=
 =?utf-8?B?ZENwWUY0UHJIWkloSTc3MUNlNFZlTUhUSTlFWWdzL2dnektBbUhDUERYRHNW?=
 =?utf-8?B?SzNpc3FpdXJBV09manZTWUFNNDdzVXBaTWhLZ2ppOXhBQjNBaE1HWWhsMjlV?=
 =?utf-8?B?Q054VXppNkVzdlZIZGVyc3BCbXV5Y2lwUUx0Yk54VkM5Tit5L0FlTWdvUW9X?=
 =?utf-8?B?bkVHalpMNTRBWHVxQ1grWmhEaDJBSTZ4YXgyVmtvK0ZLajlkTi9VTmd3UUQ3?=
 =?utf-8?B?bmdMVFZmKzBaaUcybG43emt5WXVLWFIzeHRoTVJFNnk0RVpENEo0alBacnli?=
 =?utf-8?B?R1NzOGFHNGZBU3oya3ZlZitKc1IwbXZlbkt2dVJNMUp0VWNOaXF5WENscFk4?=
 =?utf-8?B?eFowVHBtcFI1NnlGU2J4aE84cStteW5jV2xhTlh0SmJ3UHo2N2RCVEFEM3dl?=
 =?utf-8?B?YzBCYmVvR203Wld4dXRTN0lGMm5naEc3VHpRcEFLSU1oaXM0NVNTRnFWMmZm?=
 =?utf-8?B?N0hEc2cvanNNRk1odVk5TDJPazZqUWlzN21TTzBhMDU3am1OMmw4M1RvZUh0?=
 =?utf-8?B?OFR4NWk4RmNnenh1Mnl3TnRMN1BtRDNXazJUcGkrTlRScXNXRnZMNjdEL3Bl?=
 =?utf-8?B?UllzOU5sc3NUWGV0NzFrK21WbWJ2b3orVEdjRFEwb1BtU1ViR3dRUEwxYkQv?=
 =?utf-8?B?ZEpnZW9nb29RWVJtb1V4RXZIdHJEU3RGVmNXSWZvNWxiZUM3NHYzbWMrR0Js?=
 =?utf-8?B?Z0FZMm9HSnpTclMrWHhpb2FYMUI2L2Z6WGdWTk5WTW5jU0ZNRkFpMFR1dlJ1?=
 =?utf-8?B?cDltZ09NcVZybTlUM3BCSWZlaFV0K0pzRmEvaTZVQ2UyREgzVndhNEtBTVZj?=
 =?utf-8?B?Uy9sS2tiQ1hzbU9NWVlmUkV3Q0NxMm4vWUczeWQ5amVaNk96OEVEczJ2aFd5?=
 =?utf-8?B?RTlSMHdpQ1k1SjFJdVB2SVVTNSs5TVVEeklnMGJxcy9sVFNDVkNyc3l5VFgw?=
 =?utf-8?B?VUpXWFVyWkVnSStXUjhFY1RpN24xdDJnM0dmblcwVzZ6ZHV0YmFoNkdQTXg2?=
 =?utf-8?B?R2JZdlk4anZqZ2NJS2VNQVhla1R4SFpycmxPVkRvTjNnYVZ0endHYVNtTFQy?=
 =?utf-8?B?dmZjenlWRVJKaG1pZmRmSURQZlVvTHZjY0FBUjRVQU05aUt6SVp4bFJjYW9z?=
 =?utf-8?B?ZE5YTWl4bGY4cEc3eExESXlWblhCRGxseERNd2VaL0d3ZUhRVU1KN1hsRURJ?=
 =?utf-8?B?aUdmR3ZCQW4yYzdGZWkvOGpOdUM1RjdaR0dzd2FLSjZvQ2JURy9CWlBwVDUy?=
 =?utf-8?B?RHhoOVBEaVpGc0I3ekF2Z2w0WHZGS0tmMlN5aUt4amhxUXgra3A3YlZEckFW?=
 =?utf-8?B?TXNicGdZTjZEbGsvcXR4S1k0VWlYSVZqbFBkT0kyUktyMXNCZGtNNHhrUERw?=
 =?utf-8?B?VHFmWkY0eTFnNTZ3OFFpdm9LTmdHVTFOVEhUZitxdVZDUkUvOVJkMnR1R0xh?=
 =?utf-8?B?UEw1cVZmczhrdDdLVUNXMlBlK0M2ZVB1Qm1YOHJxa3Y1U1JwVXVGUUVJblp4?=
 =?utf-8?B?WUxQRjRram9CZkdTWXAwS3FUVmc5RzQvUkdjaDZuU3pZR3BqcGprSSsxRWxN?=
 =?utf-8?B?TkVCTUZiSmwrRHc1UHJLMjZWVXJMcVl0M29WYTFyTlIvQXh6UHI0NkxCdTd3?=
 =?utf-8?B?czVDTi83eGUxM1YyL0puNkordHVxem81c0xIYVFRVHk1RnEybWtJcFZrbmVj?=
 =?utf-8?B?amdYaGZhYWR3dy91dStUa1pGazFLT2R2a0RodHdLY1NzUW1sdEN2OGhsRjFk?=
 =?utf-8?B?UlNnT2NzeHZJdUxFU3ZpbHRQVXh0VElUYXJaTUwxVXh6MkFyVnQ0RTQ4RnFj?=
 =?utf-8?B?ZlVHL3ZCcGhPREl0TmNLOGlOS1luOUsyeDlwWGtWOXR4TXNlZHFTamltMEl0?=
 =?utf-8?B?aDBxMHhTVXRMWHFMSEx2amRHOVNjSVJBNTdnYjlzazZBMWl4ZkxlVDA5SnhX?=
 =?utf-8?B?RzhCeDRiSnNJOUI1SWQ2aFNMc1FRdHlPTVc3VHZKU21scDUwcmRCc3FvSVlh?=
 =?utf-8?B?dUNmUEd0KzJYSTFBZUY4bWdhVUJHYThLYzk1TC9yZFpQeHYrQ0piQ0tiRUVJ?=
 =?utf-8?B?QzZhZUVReFh1ZEpwS3ZUVGZmOWJ5aTBlZk1wQndMOFlyNFh1UVpXd0VwQ0Er?=
 =?utf-8?Q?UGxVdBq4X2cNDYBbnfSXEIffOazZKthv65fwjDP/nVnTQ?=
X-MS-Exchange-AntiSpam-MessageData-1: GNgvEgqOldLJNg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465590c6-5384-4ecd-5eb2-08df3a55090b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:21:41.1355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UODRT2b6TxHP6uU62MTbbWemBa6+HY12xEPIoR4dqkE8Y/tf7XYWB5Gt+yMRySKFXn5V/7BQPcWdNsMcPrkYaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5773

On Tue Nov 3, 2026 at 9:02 AM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> Nova-core boots the r570 GSP firmware, release 570.144. The GSP firmware
> releases from r615 onward share one ABI, and their firmware files carry
> no version number in their names, because each image records its version
> internally. The driver calls that ABI "r000", so that its name does not
> change with each release.
>
> Add the first part of the bindings that bindgen generates from the r000
> headers of OpenRM, the open-source NVIDIA kernel driver. The following
> patch builds the GMC API header type on them, and the driver keeps
> compiling against the r570 bindings until the patch that switches
> firmware.
>
> The headers are those of OpenRM release 615.71.09.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Reviewed-by: Timur Tabi <ttabi@nvidia.com>
> [acourbot: split the bindings by the code that needs them, name the
>  OpenRM release.]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
