Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE1A393DF9
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 10:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483630; cv=fail; b=JDB/6yfCF/R6gsn6/uEzwRQUMQ7GOnrYBo2XPNM/PeU8/fgVmuhT5H1sngsGuoXZbhN+qpa3m639lkFec63MOt8rmWv252E8/+bevum7rimPgPmAW8Hl5L+NPopPAHFsDwvM09qRvgnbwnDMAymo/qBpzwqzbY+jGIYB+Cue0cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483630; c=relaxed/simple;
	bh=aBTKjYqbJP0PajOB9pcUOoXgZYZ/LXJNE4GLJeNrPVg=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cyfNohoYJv3won32BaBMHbnmQhDnzkQs6zPKm/qgxSKExFmMXad05w9wGFZBP3ek62SHLQGMfdo6ndIU5jRiF0MBKUCX9lzXTx07GccAFKoNTGZwlCI1CwCae9eaORuP96AWTF3HCipGXfl35u5zH9YIyD2i/CEq7aputfT6mVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ul6CSzGL; arc=fail smtp.client-ip=40.107.200.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ul6CSzGL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zb+i+gqN7q/fbROhBLt2Xb1Dja0m7xdY7EozeGrbFlD49opNGWK4qxTuAlUEfg1uq5mF19JDm+wL/maYriXe2bR/0PMRVkWkVNeLHzojAUW2JzYOw6ivAUSLzU8q4ZxEaWFpyIoX/VPPshAW2ruYy3HKqptw2gwHCwM0d31otX3CmkfuS6UdTpS3yjVMswG3VmAIUB47Dyr46qaqO9bWeEKjb6iJj+u4Tq1cNw35ZPu5zzSmxd+8TUStDRIhGl1fzMB9ELHYymZKPckguwoDDjdbRaDs3AZ3hxXdIePYcnTaF2GvQqGS6Hm7hpY1IwTxumCB9e+YlIP3xcnQmBlfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBTKjYqbJP0PajOB9pcUOoXgZYZ/LXJNE4GLJeNrPVg=;
 b=Wv89n7tNHQGGCNuuMyHFYyShTM42ZAaEFte/aCzU89inmqg33p4Gb4Vz0MlK1wZe36eqE46zGwZcJ9YedUyuqJVUoLTgmXfdeZPsv2L3JLck7o4CMlEgFdyESKTpxKFy7ivIVzcTDXBnofbJSPEfyF2n3NboGUE1E5ZCQe/4BUtYDC3dXEo8eH2JhXMwXUMDcDgmVfhXo5U5O06LLv0JNsho8D29GqXGZTub6NqTXLAkfq6uvhUiLBZmwRdWLQy+XKwIhxhXppiJ2aoNKQ22c4s/bGBOAIueZchlhJmplGAHHUqqkd2Vqp2B4nvJ1qzENtBK5yU7nErlgHRHPKqnow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBTKjYqbJP0PajOB9pcUOoXgZYZ/LXJNE4GLJeNrPVg=;
 b=Ul6CSzGLyT9z+lSn7OL8N2SWFJ5/j3jif156hurnWsquDEjMr8Hs/XhkQY2JJlVjLbysNzjH2juUPjLXSwI6yypZfKLEM1oxx0Ulu1gI6FU0pjGK9+yx8D0we6IA1Q90DQ75inuroeIZ8N/zwuBI8PU+RLcrrviZ0M6O+nq+WAQ0XIRil7LVK7j0ijPi5V7yRWYinaqrKeF0f6SrkGVL1ykYLGJLJfSMvf4P5B4+i9/QrvbR3rc580LQ7qlBmKN9ihZC1K019awtKfNjokqcjmp7iVhAuP0gU34kWUnb44/aQ/QDcYGB9wLtgfZpkc7ocEkwHJVuxfIrDqcap5mTLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:47:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:47:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 19:47:02 +0900
Message-Id: <DIZCROA18EVK.1WTOC61CIP7Y2@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: move lifetime to `Bar0`
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260602170416.2268531-1-gary@kernel.org>
In-Reply-To: <20260602170416.2268531-1-gary@kernel.org>
X-ClientProxiedBy: TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8722:EE_
X-MS-Office365-Filtering-Correlation-Id: d3041399-3208-4fae-95c4-08dec15d7413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	L6bRWGhOjr4ho3npkik3Yt8ciGc1UPGQsUkXCH6SG7XxV8QQSK8n4R6bP79DfCktuuShdcL3iH1knNXy1raqajp7vbPaPIBW/QU/7TOX+Q3j/SvfzKyA2BmWKTP5wkbhNyF0xnhfdlxk8ZU8wE/9CizOapInT2ouH88zpBLpJW7PUfGxY7PIuc9j0n63m7m2QXzKd+bDZaKA39btLdUK1YB79V9KCtsQNvjjpaN28ZW6N2wvkfUlTJJIFeXYScY0OKqYHVBrBt7upODev0y9cbMQXNTwDoEyqxy1CHxlWxV97y7xviEI2fbwCY87fRHbV2hDTK7Q1MmRImeP6CWBYBIkyaGq5Cz15z/KrUiLOCu7rdf1eFsgIfEEEPVPoqvHCYaNBPauXBJYX7kWvrVnCNNhAUz97L9hYMsGpOzffhveXZVEXkgNYCu8fXVi0b2ek+MG/BIABon/1yWIOBEsbtuIAtSRMSjbwvvdt9hnk+3z3q51CjcBkwzgkLCxEd2XgxKhficruUA1uYDv1CHLS62zr+jLwyZoekWlT2OI7s3yHXBKrdOA/SvrT19qaDeb8hu5bDIes2Y9aOGtQzAQdcw1pS+v5pLrzd3G2huVtg2JWX++FVQpOo1pw93//4XKmzrp4bE7S9H3mTqWtCgltHEyFF4wlFpJQrh/Djjd0DRrWBa4SJsDg7IJQrLq3Ado
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC9uZ3NwTjllSmxKdC8rNURMRzZIZzBLaDBCNFA0ZldxZXVxSG8xOXVsU0Ri?=
 =?utf-8?B?OFVEYjk1VFdpK0t5OUtQQXFNOVIwQUpFei94MGRMVDIrWUl3cWJiVUR6MHFW?=
 =?utf-8?B?eHhRV0JoNTdvUEJPWWdUS0xuVFk0d00rMVZ0MTQ2cnNCRnBPTmJmZWozQ3Bu?=
 =?utf-8?B?VlZRK1NxdlZXU0xzMktWWTlJcllGN0NoZy9GSTE4K2Z5RGhTSG9BaDBreUNp?=
 =?utf-8?B?T2t3UnU4Tkg3WllnRi9YWm5QbHNqcXMxaDdZdnhQYVZINDhGbVhIN3JWZDB1?=
 =?utf-8?B?TnNBWTBZKzFKb2pvbHNlUVRlUWVpVENsM3lTWTZFMzdoN3dpM1ZONHlRcmln?=
 =?utf-8?B?ZmN3QWhxM0VteEg0dkxUNDhOOGJGN0hhT1ltQkxhc2h2ZG1tckVhUGtJRURF?=
 =?utf-8?B?OVhsV0NJZnFTSTY2eEYxQ0c1V2Z5U05yWGluT3BLK214TmRyTllNaGFUWExF?=
 =?utf-8?B?U0ZGTDhXNEgyamx3ZUd6L0M2SzQ2YXJLendKdXhGTTFpS3lxL0tsOXFzVzRi?=
 =?utf-8?B?WFA2WkZqdmM3aVEzYWNOd01xK28vRE5yMWw2c3o5UGFEd0JiRWIxc2s5Zmlv?=
 =?utf-8?B?RHJOR2xPQ0ZvRHNLOUpjYnhOWmN5KzFya3d4eFI2UFRESEtmMmI0TGkzM1Bl?=
 =?utf-8?B?alc0VlhBc2daMmxaNFpZZkNyV09GWmt2VHRIdjlUV2R5UStEcmdIQTh0bUhs?=
 =?utf-8?B?RE1Cdy8zYnFtaHJhQ3VpMU9hcXo0YmxXUWNUOExPeXZIWWxRWU9udm1yTDQz?=
 =?utf-8?B?clBMWU8ybzBpcjlZRFNyOXBhWnNnY1diS0gyZmhhWDZkTnVVclVxelc0cmc5?=
 =?utf-8?B?OU82aGo2dCt2akx6VTN4M25LdUdRSEFIOU1rT3pNeVB4dHRPQ0htbG9abnZF?=
 =?utf-8?B?U3ZkTkJvcnd2ZmhVVGJLQnVZSlN2emd0VFVkTmN2cEc1eXJFaEFzMlJ0Qkow?=
 =?utf-8?B?MzNPVzJ1bWRsdjdndnV5Zk8wWmpWVHRCNDFraHBhTmF1TXZEWGVySE1NaUpT?=
 =?utf-8?B?c0hJQllGZ3FzejVBVnJLbmdJckxRL0tOdy9JR0VlcDdkZGZMQWE0clR4U3g5?=
 =?utf-8?B?YXVJWUJGWjZ4M3JLSkRFUm82RmlUNzZQdzVkOEpKVmhackFqekQxeG9ncFJu?=
 =?utf-8?B?bEtYTHdtcS9sSHg4T0JSVzlRUUo4MWNYVHljL2x3Z0pIdEFzcFpHREV4RktO?=
 =?utf-8?B?bFcrSEx4QzR3WkVqNHJRSjFaRnZSQ2RFbFhrNlNydGsxalp0S2l0ek54ZzlV?=
 =?utf-8?B?cHVNVStreWZRc0NZSWlaV2N2Nlo4NWdYejhYN1I1ZEZPd010MW4rUFh2Q3Nu?=
 =?utf-8?B?NWJTdWwrcE5Na0htRUxXeEpSNWxLQUVuRUNEbXdNSmp5aDIvdUc2UzBYMmlF?=
 =?utf-8?B?VlluNEd0anNHZnNxa2NQSEdyeUU5Z09QNGZuZGFNVnpzdVFPcE9tQzNjMHdS?=
 =?utf-8?B?di9NbVhCdDg1Z2dQMHJ0cWd0dmwyRzluM3BwQS9lTmtZNThDQzd0cnJUQ1BF?=
 =?utf-8?B?eHVkWUZSS2hCZ3l4L2pENEFVTkVZL1U1UTRWUWRvdzRKUG5pZkhqQXdDaDNQ?=
 =?utf-8?B?VVpZd2xrSUZxRVp4Y2NBWmlpa2prN1hwSERpYUtBSTRPVGIzaXNmQ2RpRWpt?=
 =?utf-8?B?OHdHc1JVVWdoREZBNFNJU2dQRDk3Qy92ZmFORUJSUHF5WDZzcVE0R1RrOFE2?=
 =?utf-8?B?dDR2aEE0MGEyd2UxMXpqbkJxTDVlYWJMR2grb0JTRTJNbmtJS2VYL0JDTUdj?=
 =?utf-8?B?cjRTWkxqWmVOa29HS0xvUmlVRTFrWmphL2wrZmRucEIxWkxLZTZaVlBuZzA0?=
 =?utf-8?B?Y0M1MkpFUm9JUEVLQVVIVTBZWVIwL2tvbWo4VXpGVkRYUVBjemRCeVZROHVu?=
 =?utf-8?B?aUphYThLRmhqNDB0M3c4ZVlrbUU3RmoybktiYkI4aEFwWUpEZUUvOWlXNk1O?=
 =?utf-8?B?elA1VHFBYThhT29yUlVzTzhRNzNPUkd4NXkzM0J1UU51Y3dYbG9DM0diNFlU?=
 =?utf-8?B?SnowMG50ZjAwZFRFOUp1bEE1bVVhbGpLL085eGJZNnVySlpsL3JicHBybWFN?=
 =?utf-8?B?MENObW5uclNmUnpuSkFlT3VsZEVsZlJmdWhiVlFlY0ZzVUJYM0FMd1dmYmFK?=
 =?utf-8?B?cVBmcEFLQ2dva0JJclBQU3RZVG5hN2Z1RUY1emhrcW5ITldMcUhYOXV4Y2VO?=
 =?utf-8?B?NnY4cGhxTzE5NWVndEtaOXY3MEptOXFPSG9Jc0ZVVG9iUVdFV1l2MWsyVVBI?=
 =?utf-8?B?OTJpUGxnZm5zUm5FQStJV0E2WXZ5TXBmTitoQXFsSVVRMmRJMUI4bGVSYWlB?=
 =?utf-8?B?ck9RY2lTSEpoMWxvY2MrWW5hSjFCWEFVajZneGdxVEZ4UGlKQ2RSK2hJME5F?=
 =?utf-8?Q?f7jgQgiuwC7WX8Sa45TF/Hcw3R2rlJXFI2RCML1b1V/Ou?=
X-MS-Exchange-AntiSpam-MessageData-1: 19xHoKIQFaqg3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3041399-3208-4fae-95c4-08dec15d7413
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:47:05.8277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIyF+ECx7TSTZ3uhfYqehtS+yxcF2bPOG5ihxhmPwnMv06zdVzO1m7jq0AEXaF8rpVSaJyPs4ar4GAArn5FwMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722

On Wed Jun 3, 2026 at 2:04 AM JST, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Currently Nova code uses `&'a Bar0` a lot. This is `&'a Mmio`, where `Mmi=
o`
> represents an owned MMIO region; this type only exists as a target for
> `Deref` so `Bar` and `IoMem` can share code and should be avoided to be
> named directly. The upcoming I/O projection series would make `Io` trait
> much simpler to implement, and thuis the owned MMIO type would be removed
> in favour of direct `Io` implementation on `Bar` and `IoMem`.
>
> Add lifetime parameter to `Bar0<'a>` and change it to be alias of `&'a
> pci::Bar<'a, ..>`. This also prepares Nova core so that when I/O projecti=
on
> series land, this could be changed to using a MMIO view type directly whi=
ch
> avoids double indirection.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
