Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793956153;
	b=njOvLusShpligrytovom7/ELgBWH7d9qFRFZzW1RiJPAOYr/aynzFROJ8mLDQaV56lOy
	 06aUAhDF70YJ03AMmJZYLK+GuSQX/SxgSga5zKsb9hh1dyExXHIgym+zG/ISkhJ7NpbMA
	 oGDLezMioU1mbv7xE25+gX/OWUFhF29+Vl4EsVMI5OuD+87D6A8ibjvBlyfzK+CHfOPMD
	 GUZte0IdNUxKwznfD4hDegb5o2kyC+0lpqSbkoWDGXU4VtqREmtqeKqjfsC6v1ebldJgp
	 kJY+iTozNCX1zmF9dpPCw1agTLBPPdsyshloPYhbMzgwq4xw+vDWzveWCp9PJfQmVWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956153;
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
	bh=Qf/IF5vFSGX24wLtqRHkG52+8gMxPJ9jhJVPb/LbMmk=;
	b=q91RV2T7W9Gw7g5NoN8SPGqxA+aqs7HSnRIYeqGqqpfeJANUOHun2aBKYkEJcttt+8dy
	 GHNHG+75W0iqoQ4ysLY1Veu1IMBorsC2mkWYA2F3NppfK7miPKU3OhhQtPCG/fHPkTbeG
	 Pr8h5uDcF1/RECIZxrCLv/nZA2zDI4UdyAmhtm8l8yZsXlti0eYB8g+X6zlIv1OBZmSg7
	 YHLVvdkwCGYMuI0l4fHopvC0h3W6ijXUaGwOM6Pa++5/4FgFsLwKPGvTwmPfMYFsS/EOj
	 KD9WTDvogE1LC5Fv2J2AKkuD41WVm5HBRNicoV1zoTCxlU1emkXMUCJKfmY/8A27eUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BTAlRtFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.7
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013007.outbound.protection.outlook.com [40.93.196.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9E0606A328
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F9E0606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BTAlRtFJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVxJC4c3rsE4kgPIadbF6JXfg/rFXS8u8qruoybuanThaIkZ9LoCzTkaSyTbpebYJAYt5mbqaN3r+IqA8n6S1w1RClneI6vK4uD7ZjE1EijcgSYnK7QB5jXqT/fIvQICP7somJbNe1hD+7+SaXviAwVowp47f16zM7MfAunawZHeEQs0S94V+9Y1zM2D0ZoC2LFRW/Pr7iYiC5JRDcUvpvgR3OOJLLafh0zEcrnaqypelFXQOk2B+aNaRUNbELLGzQRqVYUSf4/GxvDx615fZOukFopJT/1KE4TK2zr3wtzese4k8XcJL4Qpqa1Du5Nfow04+b9msCZB4qdMImAiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qf/IF5vFSGX24wLtqRHkG52+8gMxPJ9jhJVPb/LbMmk=;
 b=npPFuVbUgG6QsLaFv6RHdl0qr5r4mz1jCGi+A+W+pviLfnXsH7U6rQpeYbxE8C+s6OLTfXHL4SsGPX9/8is6ZbRyjAt2yMfO8Kg1sg1h91/W5WFT8DgL/TgY9Gg56pb0L/ZJts2Mtr80HW1EHsYbspq2qpJmDWlXSESnlXdZ8umeGPyxdUYJYeQAsy5enNR+2OfdUUrsEnY3qhDmu6Tt30/pP0FvTwHRDi5SPJ49wvTs1Cr9W/wC9KHQSNjh/78kW4YDjZLpyttFkMZZskktv1OKIcatt6HPOSS5lK6xYbpwOiVqqCyOmvPo0JurYNowQrdaGlgHmW8niFtLBy9c8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qf/IF5vFSGX24wLtqRHkG52+8gMxPJ9jhJVPb/LbMmk=;
 b=BTAlRtFJtHWhRlmAVGJ5MVmsrulnuegyzz2o5FoxECgwV/FJUocX9IF7aGxxaTEDfxXcbs8HQi/1hn/Llb9jZ3JxgVK8sj8k8uDpI+n2AXyY4VpIklXDghTeZf0XLs9HB0GpRD3QyQveXrVfHWGNyVCnt77PspH8tEeVDIkDgThmmj07MWsPAxHJMM9hEdL2/i0CvUYxat3GgR4JA5nadJ3v5vIDu5VlioXJkxyXtaro7AOFZA1U9R5xCpm55l+E2jvu67AlXO6SK9FM0HmdwAxpnbBN3nUDE69GyvmnIphCojXFi68ZTuV9WHoLqSalZLtu4JjMInxC0oqkSn7d3A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 DM4PR12MB6423.namprd12.prod.outlook.com (2603:10b6:8:bd::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 09:09:07 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 09:09:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 18:09:03 +0900
Message-Id: <DMO0DN1D2EZS.1YO5VQ9YY5VO2@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] gpu: nova-core: gsp: cmdq: do not use ENOMSG to
 skip messages
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
 <20261106-r000_rebase_on_cmdq-rpc-v2-5-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-5-e481ea2168ef@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|DM4PR12MB6423:EE_
X-MS-Office365-Filtering-Correlation-Id: d5064436-ab60-4c49-4a79-08df3be59c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|366016|1800799024|11063799006|4143699003|56012099006|261022105027099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	p0r9MAYKJJJg8wOSJIkKCEKjiz3j7LMziKN7nA1f84ZVsF1jagnT+PUHRl2tXL6eKIpap2mB7rQLRdgCb1+arUaWv1w0ETentCNLq54WRdPOVutyqMvh6WzcHF11UhRKOhR+UDgiJt4+MTGfRxUyXwJ2De1OTr9lat1fa2YFC47uaZO+pOCcW1+dVH0+o0A9S9KyH0xlu43OsjvHKVnF9f1L+xIM5lCfXuDG3e7Va6fX6EwpEkkkKjfTSKy9OmVxi6WLnI7El8J0VzQWS4nW/os0M477LL5QuzvIuvDVM9PZiGp1J3OyDzHjW/AcnZXEiPxB326Q6b5IdsixEpGFjJ0L0664Fte+ygVDkmrnP4VIVkdGY2tOrUwtnvOSkAMuUjUeLKnM7mcMXu5woDn3/HrzV1sZGXhlWinLy7Fs9ftbC1SLKKAzF1s+PZbH023vS1UTzvoOA7pZDfpydaj4DWFSSZJibnsW/UJo6U7uy1DkiSriV1ez0EzHiEPwVeQy6Azxqsa++qm7oomwF4Zcyk3+nGybmpHAe+eIv+aKVZJQzUhSEQQ35DOx5EU1F/wxTSKxY0qopk8TgV0x3ChEm0Xb46I3YNFBsat9/eA06OJxIopK6LPP3wtNyplvxpRNPMHT9b05al+dII+dqo7b9KsWNb+B9SMp/mSV66+1Pss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261022105027099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q3pJTGxwQWZyUDJiZzEvSVJ6TkVJRGJRODhYWTR4dURJc2QrM2s3aEVLdkVS?=
 =?utf-8?B?Zmo2UlhDWGwyVzVwRndUQ3I2aGVENjgvVnY4VlFSK3lmcFZVV2ZkWWhUY2Z2?=
 =?utf-8?B?RHd1U2lNZW9UM1N1NEJaZENWQitJNWlkZzh0aVREWDJkdTk4a09UZWhFWU1Z?=
 =?utf-8?B?WUNNRFVkZW1YZ0pJLzZ1WmRUSTkvdHlSVVZFMkFYV0N5YWtOemNEeUdvc2xi?=
 =?utf-8?B?NHJtS0dYRnZuZGJkYnowL3lZMG1NNzNNejNVQnBGTFcwQVhlWW9reVV6aFho?=
 =?utf-8?B?UzhiUCtEeG5wczRscXdnazN0NGdQSWh3Tnhwd3dQVVVyTVA0T1dmYlg0L1Ir?=
 =?utf-8?B?L2llZEFxazJZUEI0aVFnbUZ5SS8wYTg2VVFuY0hQVVR4K2JWRXdSVVJDOEY0?=
 =?utf-8?B?SWhsT3M3WGxEaDVUdFZsbCtuaHhIN24wODBzeEVlY0tGYk9qWlpsTEdZZmRj?=
 =?utf-8?B?Y2dFcGVjcU0zN1Q4eE9VNmhIT3kwalpoNk13M2YwMVU1NG1QM29HNkhmc3h3?=
 =?utf-8?B?Ynh0WjNWZC95aFFJU3lOd21jVWNNVW4xc2VFODQ3WElHVGlyZmxxaTZPMW1j?=
 =?utf-8?B?WHN2cHUxeUJtMHIrK2Y1S0xNNEtKZDh5NFlLT0JISXpUVW91WCs5ZytSbUtt?=
 =?utf-8?B?RUxmZjV2Z29YaEZieWpaNFZwb2J5bzIvWU9ibGtjM0V6Nnh5eFVEUWxpU1dT?=
 =?utf-8?B?K0xobkYyMVpDOStxN0xUV2s2eEl6U1NCVzQ1aWxkVGJqTnVVT0dUVFF2Uk9J?=
 =?utf-8?B?NTdJU1dMSlVDN2V3cGVnOGVITkpoWXRScWJiWCs0ZmM4QmorZFVJemthVURo?=
 =?utf-8?B?eGlhRDB0MS9Gc1phK3lUVkozRVIvdlBLcENId0RKOEZ6R3lmTUVIakYyeS9a?=
 =?utf-8?B?MDZBeHliUENmUmp3QXU4MFlzN3ozYm1ZZWJIVW9lTmtFVHdIaVVERWpUZGxR?=
 =?utf-8?B?NmZlMTU1K09tdTlGRlFNTG1IMjNUc2IvYjUrSjNScDVHd0FDbk9WU2NaS3cx?=
 =?utf-8?B?MVgvR1RzckdYczRHbXRoeXZGMm5nNU0xdlZsSkdxSHk2akNXRU5pcmUyQzRS?=
 =?utf-8?B?Vk9aNE5CZkFVWHpsTUdLNDNtZW9jcytFanMwTTB3U1I0cWJLbEpvSE1UQ29Q?=
 =?utf-8?B?S2lONTduWGU2SEN2V0RHLzU0d21CNUxibHB0d2NRUE9jV2dPaXVFbGl1MzBO?=
 =?utf-8?B?MWNuMWR4eWZOdW8zTmQvZ2ppS21nbnB5Zmt6T1p1Ty9LRXBYbDBTdS9hL0RW?=
 =?utf-8?B?Q1JuOFBVT2J1TUhSUnBHdWhHWTdMUy9QM2ZLQUh4blNGNVlwNkVoTG8vbndL?=
 =?utf-8?B?YzJmZnlrQmJJNWcxRU9OUnEwSmhoR0I1eDBOaVU0aG54S1VDRFZ0UXp4ZW81?=
 =?utf-8?B?RURXdER0a2ZNVGhJclc0Q1hMcjFHUnJ4THlQUW14QkhBcGlUajZuMXBJYnkz?=
 =?utf-8?B?bGZCRmhKL2QxSkZ2QmJ5WERyY0NzM0gvVGU3ZEJSOExsOGM3UHBZRDdoWVdP?=
 =?utf-8?B?SnVXZEtYWklNMFY4UXNHK3M5NjBZSzBLR0F3RFVxb3hwKzg1L1VPbFE3NmN5?=
 =?utf-8?B?anpnRCtoQ1BmWTU0Vld4czFCU2tOUWNMMWdmNXE1eGh5ZE0zck1JaHJSVVVr?=
 =?utf-8?B?SnVhOUpLNEtseWNVN1NGN01yS0RFNHRnRDJZQkRNdThGdm0wTVluVVlSUHdL?=
 =?utf-8?B?WnZ6bU1RMkZxc1VPTW1tUTZYOER3RUtGUVY3WUlTeUVIaHhiVHRBR01kYTRC?=
 =?utf-8?B?bzFQTEdZekNHeU5kTm5LOURIbkkyelVWOWN0NUdna3pXeUtYejVGQUYxZzdm?=
 =?utf-8?B?NE5zZzYyZmZ3ViszZnRCQkZ4bEwzMkN6R0I5bHdKL1NFbm1rbFdROG9ZSm52?=
 =?utf-8?B?bzVxV2tmZlppZXA0WE9YY3NnMGwvNGpIMm92bFdEcUhkaHN6ZjZWWTZ3NDRi?=
 =?utf-8?B?VklFbjY0Q01hVUFsdHFrUVgwcXZDUjZyeWRnMG5wdnZjdmZxM0lEY1hESWxl?=
 =?utf-8?B?RXYrU3Q5ck84SnZPaTlnaU5SdkUwV0ZqcUdvck5YVk01Mk80eDUxSE8vZGVB?=
 =?utf-8?B?dG1jazIxNy9JUVVUQmptN0VvMTExajFySStBeDM4eU9uSGsrWG9HVXlsdEI3?=
 =?utf-8?B?bTc4REQ3a1FUVm1ITlpOUnl1NkdIT0pJVDhadHIwdjhGbjlOYngyZzRMVGRm?=
 =?utf-8?B?UUFNajhXamlVdFFkSWoyVS93TFZnNGs2RlRMNTJEc0FHWHFSZzV1Zlk5YmMr?=
 =?utf-8?B?b1d4SnZzWmhCamo5NE9SK1hLb2duYmR4MEpubTVUM1d1WjlGTXpYRTIzSGlq?=
 =?utf-8?B?enJidGhYTzFGN3ZhTjkxTkJnNTVhTHhwaHVIb1lrWTJSSENOcEpvaXFYYlY5?=
 =?utf-8?Q?KwPUPv8XYo2nDa/QGONo62pNTAsmFe+/tw8VYmkIUOcpb?=
X-MS-Exchange-AntiSpam-MessageData-1: j5DB5BsSbgRHdA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5064436-ab60-4c49-4a79-08df3be59c9c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:09:07.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uar6y44oJDyarjPBAM71n70Ju+0DpEi1/Yqv5T9chwTexpIUWJ86Y9YuUf3bB4ji6GMI8+oC5S4GA4FXctDBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6423

On Fri Nov 6, 2026 at 4:06 PM JST, Alexandre Courbot wrote:
> `await_msg_with` currently relies on its closure returning `ENOMSG` to
> signal that the message it received is not the one it was waiting for,
> and that it should be dropped. This makes `ENOMSG` an in-band control
> signal, as code running inside the closure that returns `ENOMSG` for an
> unrelated reason makes the queue skip the message instead of reporting
> the error.
>
> Make the closure return `Result<Option<R>>` instead, with `Ok(None)`
> meaning that the message is to be dropped. Errors returned by the
> closure are now always propagated to the caller, so no error code from
> the closure can alter the control flow of the command queue.
>
> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
> Link: https://lore.kernel.org/all/DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
