Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801722;
	b=Og9YE9RZDKwtrCzFXHESQpHiDKpQnnRyfayl8FySqW1T83DK7/bM972h1bGdRYMHozSA
	 x4fuRs1ipdhheOrDsiqJWzMtqoSkCYiXGq6V1fgTcsqTdt22olCcEjygta/fcNzXGsgj6
	 eqQtE90m0MBUVpz65MdK+sX3EsoQ2OZOFkxezgYuD7mCtsjVbEoArCNZQ731ORABTzcPI
	 vVdFsIhuozGDYSTtilcp4gDEQLtVEl3JAAb3vb48Zdg+wjYiddl1MlJk3tFhMCsl/uDJ6
	 nnNJX2gGcTKYvJwzo5BQ4vC+oWXIfmZuq93I5m2UlJsIBtn2n0zRlic3IegB5AQg0XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801722;
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
	bh=LIGRzl57K0l68ij53cw1LIe3hV4H6Qcpv+Kofz7d/fA=;
	b=VkffJKv3l7lgiK8aljoyM0/8NIgajz4otdybE2TJEovGCYgoRmoyFejjjq9/kZiwNC/O
	 Bkqte9OJSIu70AmB/xewJg70Ys6JhfHomPJo8FZXG/XO7CW1LP/PTfnWcLTW6flevmZRk
	 TfMoUz+DpYGwKw4eN/c1x6B8BTFKS/OZnDL4xPNlMlQPe/NsZhJj/8NL4Eeduk2XbDEL6
	 DHsbKM6oW2TguyQJnwL+EPfzT/lrdx0Tx3qcfe5DvoHcFMs1y1935MtPmxTugYAbHycLl
	 wd2Y9QLRAyrdbeKaxWknaU2ixNhafEl7+wDAhqiQ0xejpN6mv+2yANY/bICOfzteMSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h1Vfg5OC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.28
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE3606A33D
	for <nova-gpu@lists.linux.dev>; Wed,  4 Nov 2026 14:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43CE3606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h1Vfg5OC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTJTL5Rui/MUDhjsHVA+wHL9GZtwVSOnDyAFIfa/hlVhhMQyu7+i8Zb9PATETbECOlO6aAqAl363hSHIN3Ld3VDPp7aR1DVFd4LZOZsB9KCNcCfSNKQtY9DQAdKMrIb8Vusc84uXJPnwxsKwntGTd95XzKJFKk5mjylA8DsrmmtF/tmX1iAsLDheRKaL2ZxN5nZlfzlnmLoZEFoUPg1wNT56Wn16rHpl1ZBMcRXOAp+6umUOFyXCMy34zn6OIvSDn7DXIrw1VjruHUF8N0xXTMrbudobRbs/voCjsQnwf4QMGjcOBUK6nxjZeadFnwKMZUZWAsB51Pip9tIg6r9xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIGRzl57K0l68ij53cw1LIe3hV4H6Qcpv+Kofz7d/fA=;
 b=c3Mw/rOcIYU222I7PuV9sPr7B6mbseyzkx+KcwWXVLLRPX6EKoip4v5G3RIZBuCxRH7FS5k1/GPndJva98vYqL/BKmM2mlpDOdhFvMMZLpPkZPRc+SAFIL3l+evsehIacWDM0trRRxvE4t0d0+A87XLeug8FLkfO7xFs13Hnn3bgt4Zx8hoq6/cHlCdxmNh2uXdAVNWElRRj3Ts17BZeiKjeBVlBrPubDVBVBSp9/7BOkwwjGKTGhecCWXuvtsYWRekP3jfY+bh8K4xHs2mAjHV+st8GivmDJh6wyeEjVTR2fWgMqPYOdlfYCv0DygG+MFaRVIuo35vC2c7fXbN7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LIGRzl57K0l68ij53cw1LIe3hV4H6Qcpv+Kofz7d/fA=;
 b=h1Vfg5OC+vj4RgKTZwbBvhSA7Uc88aGW2ltQvD+DM+WIGnu+cKBtJ0HdoeC55lCWahxtaCbClS0VMi2EVPPslLSLywrvWiA/ACRMIgmhddWpl7yGCoTPsltYn/spNa3S+IZs1O0Yoc/8x2GAMjopH6tesLWGVKRb4hwaUWHhlpWUUMiooz7Zdf5npzAy3TzMlcUJwh/ks4xwPZtB3kKaXuaQNVMK7qRNQIbtFXfNNoWgRF6v4QAgZqYlyXyWqyMG2FhqCOcp0lVO2o3EyF9RnKFLYh1a8RQtF6sI2pgomqft5OlqGYYH03q4qtemi73a8BjQDQwD6XsvuKGvSaslXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH4PR12MB078048.namprd12.prod.outlook.com (2603:10b6:610:50b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 14:15:18 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 14:15:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 23:15:14 +0900
Message-Id: <DMMHMZECMLUF.28CJEC05N2N3H@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Subject: Re: [PATCH v2 0/5] gpu: nova-core: gsp: cmdq: preparatory changes
 for r000 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
References: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
In-Reply-To: <20261102-r000-cmdq-prep-v2-0-c2c2b69bdec0@nvidia.com>
X-ClientProxiedBy: OS3PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:604:da::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH4PR12MB078048:EE_
X-MS-Office365-Filtering-Correlation-Id: d88e590e-c3c5-4d44-e469-08df3a7e0d8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|3023799007|10067099003|18002099003|6133799003|22082099003|261102123227099003|11063799006|261021121427099003|56012099006|261022105027099003|261026121527099003|261022075727099003|261026140227099003|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	wkDjZmRIhEyR6a/CfjRa2bJ68431bjI9NIIyyl49GBuTAYoM7UzYqB9ztQKRjveLfKagxHNvWZgzPBqE91wkl8WCWJYn46K1FGhgmhTDX4gXuB1OO+75PzLL/C0nM+YwxpCSRW3S6ah4fzta3/llJnQB53JZc6mMfea/sDn7sNyBaiPUD0U8oX4Tl5rFJM4wj9DkcGOfgC9+XO0fmM26FOkmp/2tJuInxvS3ULwPPEdmSMk8HQ/ayouyvLsBWzRJ0ewSPh2siLhi+RarL8w1PAHmBISbg+G9akoi0A1eKWewtBbu4os0ucmlM8OwP26mIx10cWQIplCSc6WSjlRsu3leAsavKZs59NFwP6xbkAOIf0kS8xk1W4NXciRdiFgVrBEQF8WF7Ag3FQxjBjHS4l9keux6FoJ+xvldzvyXPd8o79JR1VGexaPaaJRHS+GNfXkRT5DgXnWcwM3ieUO25StMknD4k/E2wZDpNKxVYvcSk5B6RbLzBEJKqNdAacmw2ESQji1j4H9U0ACylqhg9Ou+iqiaBiKStvgmcXV7u1xZZndWC8qwAc+BmG0/JP1+Puc60KLkHjCwnZskh3MZEysX4ICxnOxYt93WfFk3FMTtLjh7N0QZacw+O/SDZhwgdgUJYSYnGfQVHR2J8KygK6NMGOJPN6C+fhsw04Yro3Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(3023799007)(10067099003)(18002099003)(6133799003)(22082099003)(261102123227099003)(11063799006)(261021121427099003)(56012099006)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(261028144727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGtWS0p1Q1F0K0tLUU1lMzdjRzhhaGxNUzY0WTVOOEZHZ2Fka1lwbUVxa2E0?=
 =?utf-8?B?elpFMHJjeTM0MFlSQURPcGZEbnVDMzdGdzFhYmwreGNDekMvMnlBZnFJeUJk?=
 =?utf-8?B?M3pWVFgyK3BTS0gyU1ZTY3hRQ3lqQmQxbG1qeUU1UU9RUm5UUEgzMTEzaUNl?=
 =?utf-8?B?Ukk0Y2VwaFpFVnkrZXRTRm5BSnpoalhIOFVSV2VjSldoOUhRWkp0RHc0dkNu?=
 =?utf-8?B?TllIWmlybGpRZEc0cnFtcTlUVUg1dDhYUlJlZWpEbEQ2N0tzS2lsQWRVV3Fv?=
 =?utf-8?B?L041ZER2NjkrbEFDayszMm5uL2Iydlg5M25GNDljdzdSWUlLbEcvWkFYWUpw?=
 =?utf-8?B?UHdHc3ZMbHdKWWw2WmpyK2FmT1lHZlZjVi9KMFJ3QlRKQmdDdnFGKzlVa2Ux?=
 =?utf-8?B?VUtRUklveDJaZUREbXNidk1jRDUrWjNjNVRxWlI2dUFhNmRCSWRudXdDTE9l?=
 =?utf-8?B?VEh3ZVphazIzajhLU1VURzg4QUIwcUNVNXdSanNvNlF3L3NTTFpCYWhadUd6?=
 =?utf-8?B?bkJJQXNBanB3VXRqNWZtYWd1SGlIcG44dS8yLzNCT0tYUmNnVERxZFpPM1dh?=
 =?utf-8?B?T3dnY2RObFlRd1Z2S2ZUVVhVNmhxdXRtRVlSK2NQc1AyQUtZK3l0dE9FTmZ3?=
 =?utf-8?B?SnR6bE83bTZQYzJieE1iN0puUG4rMUM4L0dRWHpzaTVFSkxPL0g0V1orMWRF?=
 =?utf-8?B?b1RmTlNTSzNDQ1UwYThlWWxpMXFMNzBWNGZjeS9xdHhzL3RDUUlMQVJNOTRh?=
 =?utf-8?B?cUdUODVrVmI3OGJtdDUxSDRmbzJsMk90cGwyb3lLU2pQT2tTZHkwbFNNQUVl?=
 =?utf-8?B?a2xDbFBSMDRCcDFNUXBTNm1DTjJkV01rbTZsbWY3K0cvVjhheUJZTGVVWlhO?=
 =?utf-8?B?c0ZZZEN6RTdpaHlmbUZkSUlYd2hvV0NyS2dlMlY1OW1yeUxvTFgwTlZVSG0w?=
 =?utf-8?B?TVBySUpqallMY2hldnFTSjhNZFVjSE9RQktNT0JDeVB2L3RUaGtiWHJHenNM?=
 =?utf-8?B?LzRhRjRaMDlGeU1Zc2RLaWQ5QnV4QU9HOHpqdDJtQjJ3WnpOYnI2dXNXbURu?=
 =?utf-8?B?UGwwWi9JSEJIQVdkSUZET2lBRjVjdkJDMS8zVGpPTFMvZUh5a3NEWmdiZ1pv?=
 =?utf-8?B?eDZJVFFFTUZDUys2bVJQbnNwaFpwOGxZY2xjd3REeFBCYW9tdFRkbzZZVEFp?=
 =?utf-8?B?RHNBUDhScjFsajdWSkJZY21USUhoZktRcUE0Z0k4RWRZb0VRYjFsRldzNHhH?=
 =?utf-8?B?Zm1tdUtPcTRjTUZadTBKL1Q1Zm9zVTlQZWlkVjAxQ1BOeFJpUEx1emkyWHly?=
 =?utf-8?B?eXRRLzl4WHJIM3pKTVZMd0lvTEJvYVpCWGxBWkI0QllpaDViUGZUd3U5RGlE?=
 =?utf-8?B?OHVYNEU5YkVkaTQvdjFoVFg3a01nQ0VNcTA3RGsyZktSZUhMV01tV0o3STJr?=
 =?utf-8?B?d2lsSEdwVGd3ZCszcHQwbmRUS0llQnI4WDNOaDZNWTBXUitiS25WVUUrNEpK?=
 =?utf-8?B?a2lzeDh1bmFWazBQTW55aGgyZ1pHWDVxYWJwOTRtYVJiWElxSHEzQTFpK2NC?=
 =?utf-8?B?UDBIOEN0RW5ENW83TkQyclhtNmRjbDIrbU84b284OUg3ckRaa2tQaUREZElT?=
 =?utf-8?B?Sm8xbGg1M2NUNTY0UVNnV2hXL0VqL2FmNDRVUnUwOWpVQWs4VnhsOTByT3A1?=
 =?utf-8?B?ejdKZ05GeXN0WjFiMlJON0NZeWxzL1RUSURGRkdzN1pLVVNqU2p3bUdMUjZK?=
 =?utf-8?B?KzhmQTZPbnRrRDk4Z0xtWnRwOTl3bUhRSXNKN21BdTBSeTRpT0Q5ckZzS2ds?=
 =?utf-8?B?dy9oZllZUTNDL2ZRTjBSa25aKzVLUC80VjNicWtkYTFuZ1RnT1FNK0grZTli?=
 =?utf-8?B?VVIweTNUQVB2elNVNm84aEljb1czOGxhaFM1QVBLR0xiUmpadzdUNndFeDBj?=
 =?utf-8?B?M1FQZCtVSTd1WlQvZnJmYmNPZmtaY3gvODFibjVrbDBXTmg4ZWNCWCszU243?=
 =?utf-8?B?MkI2VU9xYzl6ck53N09ycnJ3blpTRlBicTd2bzdPS21tUTc4bHlFWFdreDlB?=
 =?utf-8?B?cXQ4QkJhcy9LSlozZm5yMXBSQnJTQmxZanZyTjI4Ykx2Z1VaU0NKUUVpV2hj?=
 =?utf-8?B?WkNReHVReEs4ZVhIaWpGaE5vOG5BQ1Brbi9nYlJYNDZZendkTlJPU2tQNlps?=
 =?utf-8?B?QVR6NUl2STN6K3F5enRQTnVPeVRBUG5NcG1XWmMzd2t1RWtzUjIvU00vT0Fj?=
 =?utf-8?B?RE5peUg4UERuRC8wTkRSd2lmNGhTWE10cCtHaGZmK1BxOUM3NzdvV1JHNkUv?=
 =?utf-8?B?OTduU0xjbXNBenZsajhQQ0pRQzdMRFc0WEtuZTFLc1lBVG5vcTcrU1JSRHY2?=
 =?utf-8?Q?4loz4UKUre7JvHXeYGeXOT54pTDa5k474FmB+HWJ+w4XY?=
X-MS-Exchange-AntiSpam-MessageData-1: 7BubrTS/FXkf8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88e590e-c3c5-4d44-e469-08df3a7e0d8b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 14:15:18.1107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPuj3mAFYxeIRNk4LsF+iWwqr1EgmcT2uEYUiCZLrXg6OJQ99xQWMY/S5NsL1RIgJhnLE0ocFKIco/sdXUFLqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB078048

On Mon Nov 2, 2026 at 9:09 PM JST, Alexandre Courbot wrote:
> This series contains patches 5, 6 and 8 from John's r000 series v3 [1]
> that prepare the command queue so that the r000 switch applies more
> cleanly. They are submitted separately to make review and merging
> faster, and because they are also valuable even without the r000 switch.
>
> Patch 1 is a drive-by fix of the `NV_PFSP` register declarations that is
> included here as the `NV_PGSP` declarations mirror the `NV_PFSP` ones.
> Patch 5 is another requirement for the r000 command queue.
>
> No functional change is introduced by this series.
>
> Applies cleanly on `drm-rust-next`, and runtime-tested successfully on
> Ampere.
>
> [1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2:
> - Add patch returning the sequence number of posted commands.
> - Add `Fixes:` tag to patch 1. (Eliot)
> - Deslop a couple of commit messages. (Eliot)
> - Use I/O projections in the command queue. (Gary & Eliot)
> - Link to v1: https://patch.msgid.link/20261030-r000-cmdq-prep-v1-0-f2bef=
bcd8ba9@nvidia.com
>
> ---
> Alexandre Courbot (2):
>       gpu: nova-core: fix stride of NV_PFSP_* registers
>       gpu: nova-core: gsp: cmdq: expose the sequence number of sent comma=
nds
>
> John Hubbard (3):
>       gpu: nova-core: regs: add msgq v2 BAR0 register declarations
>       gpu: nova-core: gsp: cmdq: ring the GSP doorbell from the queue mem=
ory
>       gpu: nova-core: gsp: cmdq: compute the queue regions from a count a=
nd a slot

Pushed to drm-rust-next, thanks for the reviews!
