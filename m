Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792552929;
	b=ynGZUjszezpz5tHuExo001dCc12FJomuvwLr9lYk17H8I7E2lYHKzBWWnoUy6hJZDifD
	 c59cN8j66g5a1C+29VaVpgTPaeGcmwTTASZRW4CvlN5SR5npKau0qjT4cUvjDl5bauVUw
	 Vvh0WA7uHpsMq7PH54IcWLQmSbOyF68ZZIUFZdn1ozJf/XnWHBglnXuLeTXaF8jyRmgLO
	 7fjfOpoScjOI2I0/lY54R6QKexEZcwfa+A4dr9iDDSjf9lozq7+mYLfzHVR8TflgTEIor
	 kQqXX7LcLjUXDlb1yl8xo8CjvpWMRL5KWrcn2U926SHV1ZTBrShwMrqSo3PkrZolywQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552929;
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
	bh=TFQpkJC1YdaZbksQ2KZWYQC2To1pYZr/2Xhhx/p4k9Q=;
	b=SuarU7xe2wijBCLU90H1vaKULJbuA/vzd+DrE5HJNxVjqDuUnjoCVnoGa4aLtFVLBTe1
	 5zowgX6jW0N0i3gDXWAGasoPlR0HD832PcNu1TJxT2UiyT3Ra2+goV/dETCQLIZ1LRFa1
	 kfUt2N/kKkOB1pcqWniqu4EQYt5lTIxZCdyWNOg+es/yAYRDXPA3JEWZZ9HcLt4TJTuq5
	 4RbqDMZoT+45uRaoSqBpIHm7UARguCN9ojCQDV4u3EgDrTeZP7VdgkCI6ENfoiNELoKja
	 n5x6ix57EJqhWGtfcFGi6PENpyf91V3NMoUwJZLvJ+vafNWU56l7jiKzEiyXLRzSg6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z0wvnM3P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD66606A31A
	for <nova-gpu@lists.linux.dev>; Wed, 21 Oct 2026 03:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z0wvnM3P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DoYXlhm71LhaN4eTyPwhk29lQUdWwP6HU/iSAFS/qOtUjqZUNSp7kGHvY7CfFPJD6u7TVibhfZnxRG7cRIFxvb8gbS38azrPso4GwflzUf3ED5FpuVYZyPxexu36gII8CUtjat1ebK6Xn06EqUmq4XR3JNJOqNVQKa/bvswo0oLtVzoSMB93midQPfLhRdt3d4C+jQG3WyHen7iZlRIGG2NvKKWnxs8v4PWdRuj3+PBgJUYuNHJNv48Hi6CUm1IdlV4qLPHA/KIDM1mr8Fp5wfOtzmK4fOwxr0Fo9ZzkAdX36pp9YrRuAvM/aj9YJ9kUKnLQZb9a7qCT+lcl87m+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFQpkJC1YdaZbksQ2KZWYQC2To1pYZr/2Xhhx/p4k9Q=;
 b=ySBBaOCN2QPhWTO5dZhD87D/X1e2WEOnr38oA8BGzJpOK1tsbO/Han+y6YwYbujMSpBeyE1FqTZYElVapUgMMNykgehvQNTU+fCrRFxa+AuiElKGNcmsbPUG+DgHRD+6WZU3Q3BBuI78V5kDbhBPQp6tLBZaipV/tBoV9Z9yjppE76rEEaeYLuK8lQqMvQUzYpjRKktUzFOx6H2ZieU/xDMK4v3UrNZffqNzExbfPlA+7u+374Hursgs3kLHXc5snOp037oHcKONtSVoQoeR2nJeEw99d5g9d1UoE78CULR4u36O4zxcf9Qh87/MMssnIgyMtlTRZW4ylXWHaWlGpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFQpkJC1YdaZbksQ2KZWYQC2To1pYZr/2Xhhx/p4k9Q=;
 b=Z0wvnM3P9hJrkYMcgKXWIG+z+ACYk7ys93y+fwE7S6l6cbv/QUy/79xPLJHfdMOC1A35Nh8AUBYu/Aw/QkomLLQ58ty2NgdAINQW6zquVEvx91wrnQg4j2UBnHs9VzvPkyJNp+NkQ3jUwFVP1V3PUZTSKNGXv6zAPpUJG+ihy9nLnGHRdGgwV35T17mFugGd4y7m+7D2NYHFSHQ4k4pDnn7lPLtZSO80UFUJzObA98kfmMjo6kY7i37WwSrVdhSF+IgyJqT7e5RIv1jNC26qKxbnw67c+kipKloK7PRy48aMcD4gnaWynMYrIMZpEJaRFwtlf87z77tjln1ID+ZWwA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 MW3PR12MB4378.namprd12.prod.outlook.com (2603:10b6:303:52::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Wed, 21 Oct 2026 03:19:54 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 03:19:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 12:19:50 +0900
Message-Id: <DMA6XJJQLBOT.1EZJ61ON6VVEN@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/10] gpu: nova-core: gsp: cmdq: move RPC message
 logging to RpcMessage
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261009-cmdq-rpc-v4-0-c9ab8de1d3f2@nvidia.com>
 <20261009-cmdq-rpc-v4-6-c9ab8de1d3f2@nvidia.com>
 <DM46C72WC4G9.FRMU9QSIS1SE@nvidia.com>
 <DM5GBX7ULZFR.2TT17DYNN2UCL@nvidia.com>
 <DM9L3QYY9Y27.WM0G66X0Y8PG@nvidia.com>
In-Reply-To: <DM9L3QYY9Y27.WM0G66X0Y8PG@nvidia.com>
X-ClientProxiedBy: TY4P301CA0050.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::9) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|MW3PR12MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f508c7b-af51-47cf-a286-08df2f222ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|23010399003|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ON0ne/Xjze/0Px+OliZ+sXLafgl8uUchF6ww+09vDIWxh0o9CrOnTAzej1JMqiJdb48r+dr9+hT0m/i9iYc7wo+Icqx0ep/LtC7YFrBcycENTWjrsHGAeXRFl2f1WhNcRoJQIR7G2KpyIul2Yf3BrDTkz9WOeyG97YcfncMsw1hfNrVHngRIDMGC+7usrSj/0EbXP8ajApTTNMPIYOaWhWVoDoqKGsGf3NN7dQNEkfn9SaMdSjn5gXN6Qrdg8FaetIWpAyjiI62Y5yPuFc2AszU0wp+TROoF4KsPJLQysCGurFBaLcGDjV2mJym18jvqpx6Kkqagnydi0RE8r7uhcyhnNtLhV4LcTKz+m1j7dalZdKTuvbRdDpIzkZhXKTlNwRV5LbuIRNly32JGTadltRk7It1bCK0H4YnZVwyJKrQK8hNfb6QhIVFE2gJRj9qZx52Y94NvR+A84cgDVk6/HSkXpLmf8AZI03ysNgJTYZsJR0uEqyzDd029Om2YHzCZK2928PAFKSmwsYcXZwoAPN7hbD0+8JGUg4v7AHJTOC/YCCxjjdU2SxGgsP6GMgpbNzSaw+vlv97u7YuGAMVZ3W5UGyPwXFe3zaLAPHo39xJGvm5r+uz4fQwDi7TSjdQ/2UuIsfKqwM7RuPi+hlZIiy9S4bdKLyF1uhSCvAIORuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJZa3FCY2hjWnJ0U3BnWXRTZnREWUhsS0pmRWZRdWNHY05JUWROY0hJaUlt?=
 =?utf-8?B?SnB2Q1hqOUJhQUx5TzRCTWNrWCtIeklYNWJISnh2d3gwNXZudGFBKzVxd0Qy?=
 =?utf-8?B?ZExHM1ZxZkdaNGxZbFN3ZlhwK1ZjTFVscExmcHpZakZzMm4zUnFNeFhCcHJw?=
 =?utf-8?B?UmRndVhDVitkREpBcDBGL0w4SFFhZ1BWWFA1U0dzMGJMeWprUDBmUE54Vkgy?=
 =?utf-8?B?L3JpNE1nR2h4L0wzQmJ2cHFlMFFVNENyZ0l4Z0pVUC85dnhkM1VpWkltby9X?=
 =?utf-8?B?djg3dEVEbmx2Y3krMDloOGpVby95U2hwODVybHBYQ1hZdStwdmdmck1GY0Ri?=
 =?utf-8?B?RjBHamVEd0JKNHFsZWd4d2FSWWlDM3poK3pVbGlmNXpjZzYwZllveW9hbGoz?=
 =?utf-8?B?ZWVha3dINlQyM3FNK2xSTml4M09KNVg0VWJheFNBQndIWHBZaFJKMjRtNVlY?=
 =?utf-8?B?akdUSSttNWU2RjlwZ29WdDdzTWMxRnRvVUN6RWVHUlBWNThla0RWUUg3K045?=
 =?utf-8?B?a2FPeitUWVdYcFdHSWROVWNobzB3cngxU090Q3lxSkpYeldyNEJJVzg2b0lD?=
 =?utf-8?B?SXZURDRZWjlpZ2UyaWdDTEhwL3B4U2pYalZEMlhLWlJSSkpTMGk4Skh0QzFT?=
 =?utf-8?B?Tjd4MDFtZHF5elZVMTZOcnpNUXgyREJMUmtkMHk3L3d2aSsvMEVmZmtOaEcy?=
 =?utf-8?B?YmNFSTZCdWlwUWpzcFFHZWtaeDBZOVZGT1hJNjlGRUZGb1k1ZHZZQ05XMHh1?=
 =?utf-8?B?aVcrRURvLy8vVHFZUVlTR0FUYklFdm5IQXZTVGpteGxWSVBVS0xIMVY1V1ZT?=
 =?utf-8?B?TDNlVEVoWG9KeExxSVVGcE43ZVl4WUNiaW1QUG9RdC9RcTkybEJteTI1ekti?=
 =?utf-8?B?NTNXRmtjY0dMMXJKc3kzbDBMNnFOUlp3bGtPNnhYQ25oYXhKSkdJajkxWWpr?=
 =?utf-8?B?TDQ2SUNyT0t2V25KaW9YbDZtTUFOTVpOVk1oMXUrN1ZtSGdHL1JuT2JYckhU?=
 =?utf-8?B?dGRxdUNpazJyQXB4SWlVNU94S21uUlg0eEVCU1BsZFdYQUlUSVRUMDJjRy9C?=
 =?utf-8?B?cFg3UzBFeWxQQ3NwTm13d3QyS1hyV0tyZzBlNjAyakVuZEhnbVAzMGRQNVZR?=
 =?utf-8?B?bkE5WjRDYUlZMEdpcldUaCt3YzB6VFRZdHU0bnBGNUlVYU1IZUVKOUIrZUEz?=
 =?utf-8?B?ZVVWZURtTThNKzh3Nkk5QjltN0xNS1hHSkJsbXZrZ3NXc2VWblVIdkRBaXlj?=
 =?utf-8?B?dnV5aFZGWkhEdXdHNVVzTGFxU0k3NXlTalVKSW1nSFBWVVhGd0ZReEczRDlL?=
 =?utf-8?B?c3FEdVZhdDdBdjRsb0RibDYydUgzOUZiZzRibmh5aGpUanlhcjNpMThKWmRL?=
 =?utf-8?B?ak4wb1VsNTVaRzZITHIzS1dnQ21XNjdXUExLbFJvZTJnQmprL3FkZHBvc1hn?=
 =?utf-8?B?MkdjMk5PNHF5c3hqT0s5bklPdVB1MGFpTUhtRUZ3RUhqcHNXeW9XcFFwYjIr?=
 =?utf-8?B?bHEvZHE5djNuZ1lZTEgvTUdxeEw4MjZvZWM2cy9IUkZTejIvWWVDdzk3SnFa?=
 =?utf-8?B?UFY1U29reW4zeUJkZkllTCtVckhiVTRVbzd2RVhxWjF3ak4rSUFJSnlWeFUr?=
 =?utf-8?B?Q0R6RWo1ZTEza3ZBRjlPeW9hY3FuOWxCVFR2aFVlK1dyOGZDaU5uYUJrWWoz?=
 =?utf-8?B?Y0MzVlAvb0lYYU1MaUFadnBRN0syS3RtdUVmcVVDY2lJUkh0dmJVRFJyNEs5?=
 =?utf-8?B?cHR6KzVGTi9oZ3dmY0hpY2JOWmQ5ZVJzQXZ3RHdQQjhYOWhZWmZMTTh2bzY2?=
 =?utf-8?B?bVQ3SU1kWGlMck9nVmtyK0VSZitpOVVNdUxxMlFuZCtDR3N2clpZT0VjZzBD?=
 =?utf-8?B?NkIybWxtMGNNQm1vSDRpb21aVVZNN3g1OXRPRUc4ekt5YmdjSXV0WUYzdElH?=
 =?utf-8?B?dmE2K0lhSjNvV25abW1jZFpCN2FRK3g4ZUVIY2F0dTg3VlB4TXRNS2FzUlV0?=
 =?utf-8?B?V0ptSWdJbmN3cWNMbk1FNXJUckZUbFFFa0NXSU5mZmFYN28yNkRPNWJoMk5l?=
 =?utf-8?B?Rjg5NEpJMHpTNjM4bzZIVXZwTEVWektiSThEdTRFTWFJZHpWazZJNkwyTTMw?=
 =?utf-8?B?TFZYdXZtZjhZalArUkxmOTVrRy9nNWpQUWJjd0gwNVBhcjFsOWdnb1NrVmRl?=
 =?utf-8?B?eUZTNG9Ea0xCVU51Z2VxNjN0VVF1MkJMVGRPQjB0YlVNS2UybUpBaHlZVndm?=
 =?utf-8?B?ZVVrUC9Zd2VJRkZ5Tm1QOWQrNFRIZ25zcm1ERkJHRldMemt0WnNLUFc1TVdU?=
 =?utf-8?B?NG9KSyt6bHRhRjBpc2tmMmpxZDI5M0RTcXZLYWR4MWJOY3lYcnBJcVlUWEdK?=
 =?utf-8?Q?iFQNJO3Yc01QsXBPuL1ABqVgB2yk5JlhuTjQtUf1k7UD8?=
X-MS-Exchange-AntiSpam-MessageData-1: TKboAI0gSZT6Gw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f508c7b-af51-47cf-a286-08df2f222ce2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 03:19:53.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QhC1l1OqmnuauC/GcvrsJ2//iviHMXsN0FEHsTlOVWB0yNgZgPsZOU3ZG52Zx/QXcMtk+vkDZbMhw7u253Y2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4378

On Tue Oct 20, 2026 at 7:13 PM JST, Alexandre Courbot wrote:
> On Thu Oct 15, 2026 at 10:38 PM JST, Alexandre Courbot wrote:
>> On Wed Oct 14, 2026 at 10:35 AM JST, Eliot Courtney wrote:
>>> On Fri Oct 9, 2026 at 8:54 PM JST, Alexandre Courbot wrote:
>>>> The `RpcMessage` type is the right container for the `log_event` metho=
d,
>>>> since it contains all the data we passed to it. Move it there so calle=
rs
>>>> don't need to extract the required data themselves.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>> [...]
>>>> -            let function =3D rpc_msg.header.function();
>>>> -            let seq =3D rpc_msg.header.sequence();
>>>> +
>>>> +            RpcMessage::parse(self.dev, msg)?.log(self.dev);
>>>
>>> nit: in core/interrupts.rst we say:
>>>
>>> ``` A drain fails when a message's framing or checksum is bad (see
>>> "Draining the GSP-to-CPU queue"). The message stays at the queue head,
>>> so every later drain would fail the same way, and the IRQ thread
>>> disables vector 155 and logs the failure, which leaves the queue
>>> unserviced until the device is reset. ```
>>>
>>> So `parse()?` returning early on failure here is intentional, but I
>>> reckon it is worth a comment, especially since the behaviour is
>>> different to the semantics for consuming elements regularly (still
>>> consumes and progresses for failed elements). Especially since you
>>> wouldn't expect this behaviour to differ for a method which explicitly
>>> "consumes every message the queue holds".
>>
>> Sure, I'll add a comment.
>
> The inconsistency in dropping behavior between `drain` and `await_msg`
> really bothered me, so I've spent more time than I should have reworking
> that to harmonize the two. As a result v5 has changed a bit more than I
> wanted, but hopefully it's for the better.

I took a look and it's looking really nice now, so well worth it IMO.
