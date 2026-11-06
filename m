Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793956123;
	b=s3d8KEUYnI88lQYmhVJjZdJ0zCwI8iHZ0V9FgZ2ihaBpDRKN+81JAroegKVHpXw/t4Am
	 o5tx07yEpKjG7Nml+PTzie7JKO+QAZYn3gQbbfEbocJy47jVman2YA2a+xe6g3dTtFi/k
	 7fubYpmbA06BHAQd3Xj5IU9IMVyMaMRlqfKJvIXiTRBcb/8VH4SImLTgH4M8YawKIGCd1
	 tE6OvE2p5PcCCgesIbkgv2dsBE1NhD6FEyZxoH/Z3fe5RV9Btz0PONKkFGA8+pg6cXxtx
	 X3MjumtPFypZm0XTdSfl1QIYG2NRrA1UGGS7eNsaoXkl0b6PpWbc9tLWFBoCVPnZHfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956123;
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
	bh=JslkheYiAvM/AVGpJR7DczHSYgqVwiXbHJVVkABvdGM=;
	b=1kB6URZM1hoTMe+KRXpUKBNp43wS9VEYv3LJK3yyxBB0jrNCDiA85wZhZQO5w6PeYZw3
	 bNfR2U4Em/BPznHV6fdvLtG0usB7UHn1PGv6SLTaEBh7/F16peFbCq1uwiPJuhXeGjKBO
	 +nbjurDXe3wa6piCoeZlYr/ns1lumNwIUKrZ0c8r75VmuD0FDDeLluNrfXgtd8mvsFnEN
	 NhvgLViMuDY1+ZDTtUhfY4V2KqGy0aHPZdA9YMRwT5UTkRMk7u12DS//rTR9cANn/BuWR
	 2T69X9eekFdBvml5PmhyrJjq/XRS3lb5NdQNX49Cc41ZU1kx2PJMCsGdxMDqdn1lXsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g1WnU3Jx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.39
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011039.outbound.protection.outlook.com [40.93.194.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE23606A328
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 09:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE23606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g1WnU3Jx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGd1s+LiHrYAZHTGxs5oe05qfaWq/ZXS4AO+F2m7HomofNgiR/77Mnh+/DRUTWTF62hCw8vhMuG0Y1vH7qR9geOlPJHxbS6rhEPlpOyW8QwyRTeUodwgBZ8ttePoiYTS71guty3Vyl5iFFHKwMO32ghLkN83OJd+0/OMmyJ64wsNP/BPfjYEA2ZYTuzv+KUon9YjbJ7WRkkZJL/3gFtuDJDujKlTh9YF7OSKklma8b44ho+WTSN+fxGQNTUGkkqTM7fvoNq7QKASGNkzXLQIm6doScG8BYpYTGuvN0iL4pQQdK2cZhIoOhw1ajXVMTcDRhZ1JjFGnkBqc7dFFhQCOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JslkheYiAvM/AVGpJR7DczHSYgqVwiXbHJVVkABvdGM=;
 b=VhbCuc2pMe6FplZoBfgI4KyK2qhLwC4P5y/eDVzBhe8060RXp0OVPTV0l/z1e+eOlzsOvFUqmx2sFyX/gdciS153Qgj0CfwuxeqTbanNPC//pdLE0EtzkRoe7kEIEXX2d31BZCIKh8ubLW8gowU2HZfnSnqA+MKoxBGJ+EgGkDqsGd5EM5YWXa4tg2SgRtv6lMxQYYnbIP/6bm9i6w6hFubqutXWDKCVL9JsI/iV0ekQM/U5ffoRy7HjD3typjiIOTQdwezrA6aVd9b75IWhXrabS3wKRhuEofwzfGX5UpucIJNJEL8Qm81Bghq2S7vWFEjuxJqt40syHJ9ASOn/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JslkheYiAvM/AVGpJR7DczHSYgqVwiXbHJVVkABvdGM=;
 b=g1WnU3JxQDutrTI9w5WS/cY8Z/5RXphm55s6fMKSdrhMQyq/veGOO6anOT8n2K66h5jp9V6a09UuOeUh2mjSq3JCd3rYV58wCqBv6JYilyKK7H3ZsBNZWJyehhuXk8PU7wUguDYVj/aX0hnWu/H1hRChikjDFANoiDaQ2F7hM9NGUL7uSaSvAgFMirjR9YAXzJnN9mQpCgQenE0HevIjrnI7G+FJsX/cQmBeGsUAcJ/RnDQaGwC9rwy0oDXZY/Gu+OrSBLZVEmW9miMsDtEPmPULd0QjFX4NkyVDzj5E2QFWMxuyGQNG7O1xenjuJLexDLpxL1+/IocCZ5wHgN0X2Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV0PR12MB174539.namprd12.prod.outlook.com (2603:10b6:408:609::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Fri, 6 Nov 2026
 09:08:39 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 09:08:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 18:08:35 +0900
Message-Id: <DMO0D9ZE05E0.2BGV3A8P7XEWJ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] gpu: nova-core: gsp: cmdq: move message trimming
 into its own function
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261106-r000_rebase_on_cmdq-rpc-v2-0-e481ea2168ef@nvidia.com>
 <20261106-r000_rebase_on_cmdq-rpc-v2-4-e481ea2168ef@nvidia.com>
In-Reply-To: <20261106-r000_rebase_on_cmdq-rpc-v2-4-e481ea2168ef@nvidia.com>
X-ClientProxiedBy: TYWP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::15) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV0PR12MB174539:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c99ea1c-84c3-4912-7140-08df3be58b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|23010399003|366016|1800799024|18002099003|10067099003|22082099003|11063799006|261021121427099003|261028144727099003|56012099006|4143699003|261102123227099003|261026140227099003|261022105027099003|261009223027099003|261026121527099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	VbuMRXCWlYcnGj/Z0im3cITnmVSePZvCvGMO/nRmZmsQUOoN0ut1hOqYH4ss3IiQsOQBSIJVjuY++Gi64I3cclQD7xEZ0cLGtgcc4mAg1et/P4KFphwcR139ItvsH72273HSF4QKkTOcxaORHCvIJzK+SZHPOstSROeGBybu6J8zE3vzHdLkQsfIOWW0L7JC2e/9VYAf6GAmxCDSjM+3CI/f1qsPn+ui8/gGWJuoWIVxrpD9g/2LrjW79YzVnDBpEVg2A78zn62pDcFdLu8mAG98WBtv5dsTr2gm5ajPoKlUMjvgUyc3KHOKhjHOZVusUXkYKYMyBoktBFBhcOCYq1nSx+JhAss8Xg+8BAUFLMUdE6d30BCbPw0ZC14WSPhaiJ1kpe7c+iP8lZ/G7vpt+QABEH9rsQHRz7pSuhf5p+TfvIQMeQTQ9HL7P1kIjanCnAwIV1zGYAL94Jc3nRkcCjZCw1hpVlN8j2HS0cFmPF4bhtyDFw8utFKtGrSTUxSHapI8kfW6nS/27CScvJa7gS31Zq3Cxdi3rHKiPGW4NNb2VHiZ5FlJjV+MindhN24BEoKJV0bH9D3cf9FpapzC9q/0S5JB9pADx/1Y+zE8D6bn22jkT/d07dUZ3kw+514roseLWUXrpuwdAjieHeUzw0bCCo0NInz2nmRtlt3d4xg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(23010399003)(366016)(1800799024)(18002099003)(10067099003)(22082099003)(11063799006)(261021121427099003)(261028144727099003)(56012099006)(4143699003)(261102123227099003)(261026140227099003)(261022105027099003)(261009223027099003)(261026121527099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDZabnhnTXdrcnIvVTVQYjFtWjNxUkxzdWdla2tkc0lndHRHdTlONUVqYUdw?=
 =?utf-8?B?d2Q0QXlOeXU2WkJDcEwxWm1WWTRtQk9GeXpZQ0prKzNlakN2d25aTHQ0TVFh?=
 =?utf-8?B?ZFFTYndnZElSRVdoTDFqY2JQUlhXM1FxcTA3ZnA5ditadE5sYlBwRmpjcUl6?=
 =?utf-8?B?bU1ERDZvK1VkbUI5bVpTZzhWWnpTcVFsZ3BJUFZuWjV3NDd2alFQRGV3ajdN?=
 =?utf-8?B?aEJFYkdsOUNLWlVLaC91M3gxV2paUFRWTC96cmRNeVQzOVJHVUFjRFlTRVJi?=
 =?utf-8?B?NXJ4RVI1YTY3UzNIMENNbnZwZis3TlB2akRYRmZ5Nk9ld0ZhVjJxSlh6VnRl?=
 =?utf-8?B?OFp6T3ZyZ0U0dnVkMkR1L3NWZCtTSkFLa0p3bTJIaXVvOUhnZCsvZHlOazdI?=
 =?utf-8?B?WVdjTnlNY0k3dml3M0N1QnpGdG96R1VMUjNQZks1K2YzMWhzQyt3UzFPeksw?=
 =?utf-8?B?dXRzaVo3MWZWNFlmQ21IZHh1Y2tvMXh5NksxbXRvZ1ZnL1lsdjQ0N3dWMWkr?=
 =?utf-8?B?M1VxQVJQbFBnTEUxMTY2dkF4OERrZUM5Z202ZEJWWEF3b2h2SjlUUGU4bGpz?=
 =?utf-8?B?UVVHSndYNzRTcWNLbEVRckxkYkdhQWlXcnZTcC8rTWI2aWtmaERjWHVBMjVv?=
 =?utf-8?B?dXJ6Nm9nNThhWk41SFM5d0VQeVFiTkNzWTJRbWxtQzFDdTVkNnJPdGtaODRk?=
 =?utf-8?B?UHFjZGxJaFZMTHZjRFRKMjF3SVBqQThoTWxWaTlKRnYrVjBQTFppOC9pZGhs?=
 =?utf-8?B?eVlyNXFrSEFIL2pXYzFLRWg0bThRbHJzQytaMmRwWDZhWTg3WVg3K1EvbjFS?=
 =?utf-8?B?Y0s4aS80VGl5bG84U0NPLyt3NnNQMUVIcVoxang5a1NqN1NEdmFyUUtKaWQy?=
 =?utf-8?B?VUNQQ1VNY0FVNmZnRk9NVFB1QzZpZmZiVzVJSmdxdWNqMTBPekJvSTZ4dHFD?=
 =?utf-8?B?a1Y0L05GT0ZUcXR6cWNIaWpXejc0dE1xSGJCdVdRWFh4dTl4RHc1MjFmMlkv?=
 =?utf-8?B?M2J6SmFRNVloc1I1bGZsRkladmtjTnVjTVV4cUFoa0dvY05vVjUwMU5xL25a?=
 =?utf-8?B?UWhDd2Iya25VVVRSaWdQdFhkcmJOVzVCcTlHU0tLZko4RUN6R2szRWNaajlK?=
 =?utf-8?B?OVZoaW1LTXJTUGZDQm1HMHI3U2wzYkdnaGFhMnc1UkdEcEI1c2N5TkZWYk1I?=
 =?utf-8?B?V1grTmFweUE2cEFiYjNia1c0MTIrdG8yWUVVZWdIdFVxWVdzSXpNL1hlR043?=
 =?utf-8?B?UklqekNQTGpOeUJINXlKRWdyVE8xdGVCYWc3YmFrelQ1dGlFNXY5ckk2ZmQ4?=
 =?utf-8?B?TTZHNy9HWmd1YzFPUGlBOU5mazNJU0ZpRmhERkhhaTFHWHVHUHJkWjJFS2hH?=
 =?utf-8?B?bDRuNnJNbTk4TFFWOXd2Yzg1U1RaZ3dROEFxS0FJL0grSXB6Z1ltYnI1Rm9X?=
 =?utf-8?B?eUJSTzAzUzRQUEtYOVFKNlBab0o2TjdUZVF1WjRZaDFycU5jRitIaXdDMElV?=
 =?utf-8?B?U0RoVU5rOXlmd3hqZXh2RnFtODZSejZIQkV5MUhQekJUVjAzM1FoaDVuSUhI?=
 =?utf-8?B?cDc2cmlEVkNSMHBDM2FaZWM0ZGVkc3VtN0o4Q0ZzaHdpdjdTbmMvODB3YnNK?=
 =?utf-8?B?Z05CMUtuWVhZRG1mUUZmMUlEQkp2NlVRenc1NWQ4RkE4YXM5TDB2eFZiay92?=
 =?utf-8?B?YkJTYUMvWUVoWDRlSkF5ODA5OTZ1ekIxSGVoMTJIVE1Kcys2c0ExYlBKd1lr?=
 =?utf-8?B?UFZObVpYdEYvS3pQbmhkOFdMM3pGRzAwamNRVkd0UnNzOThHOW1tOUFHdy9M?=
 =?utf-8?B?UTVRUnIzL1NSUGk1ck12Wm5DMmRsNUJKL3VZSjVqdHl4aEk2WVNKSW1jKzZl?=
 =?utf-8?B?WGlaNEZhYXJIYjFoM1BhZ1dOTmNVa1FQcEEvVlNLdnVFMkRkZlBIUTljRlNx?=
 =?utf-8?B?dUhaMEgzM3d6dlFLa0ZhTTRRUUdZOW1NNHJtYTVxMG83bytnaGk4QlRqc2Rp?=
 =?utf-8?B?Z29ES3RLWWx4cGM4N3d1bTZHU2NscGo1cTgxMkozQzYvamZlL2cyaXpiRlhi?=
 =?utf-8?B?cHdhbkRiOTJrdGhWUFVrdktadTlrNnJQb2R1UVJtMVlrTEUwcjRnYldZc01W?=
 =?utf-8?B?ZVloaWhWN3FsaHA4b1A0TnFkSnZyWk5Ia1ptK2wxTWV4aG9SN255ZW4xSVph?=
 =?utf-8?B?ejQ2QWYwRnZ1bnJ3ODJ6UnIrNFRwdkFYaTFNUGR4eWxmSWcwNHBQY3dEWjFo?=
 =?utf-8?B?dzJFbnBta3BRcXIrVDhMaFNMQmpTUTBhT3dISEVyNm9oeU9FaFdoOTFYWXo4?=
 =?utf-8?B?RHNGZDhsK1VIMUdUZm9hdnRvWkxaTXI3aE5raVFDQmRSRmpsWEdWWllVMHlG?=
 =?utf-8?Q?39Wye9Oq5jFY1mPsyN9QuhkHgBCt2jRIt6Um/4NV60u3y?=
X-MS-Exchange-AntiSpam-MessageData-1: URYtwAdr/a7FuA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c99ea1c-84c3-4912-7140-08df3be58b92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 09:08:38.7173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWuBOJTYiDKHgMLsW32S5heCpggCokCRYc3f6h/ea1rgeIsDKBDi9lp3yutjp/0EfXINuKyZBU3/aPdnoRFVcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB174539

On Fri Nov 6, 2026 at 4:06 PM JST, Alexandre Courbot wrote:
> Trimming the two driver-owned slices of the command queue to the
> advertised length of a message is going to be used by both RPC and GMC
> messages, so factor that part out into a private function.
>
> The parsing itself can be improved by leveraging `split_at_checked` and
> `get`, so use them.
>
> No functional change intended.
>
> Suggested-by: Eliot Courtney <ecourtney@nvidia.com>
> Link: https://lore.kernel.org/all/DMN62G2CDG3N.ETT4GRFXWKKU@nvidia.com/
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs     | 21 +++++++++++++++++++++
>  drivers/gpu/nova-core/gsp/cmdq/rpc.rs | 20 +-------------------
>  2 files changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 9dd11ac8952b..f3151aa8ea26 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -719,3 +719,24 @@ fn drain(&mut self) -> Result {
>          }
>      }
>  }
> +
> +/// Helper function that trims the concatenation of `slice_1` and `slice=
_2` to `length`.
> +///
> +/// Returns the truncated `(slice_1, slice_2)` pair, or `EIO` if `length=
 > slice_1.len() +
> +/// slice_2.len()`.
> +fn trim_message_slice<'a>(
> +    (slice_1, slice_2): (&'a [u8], &'a [u8]),
> +    length: usize,
> +) -> Result<(&'a [u8], &'a [u8])> {
> +    // See if `slice_1` covers the whole message, take it entirely if it=
 doesn't.
> +    let slice_1 =3D slice_1
> +        .split_at_checked(length)
> +        .map(|split| split.0)
> +        .unwrap_or(slice_1);
> +    // `slice_2` is the remainder of the message not covered by `slice_1=
`.
> +    let slice_2 =3D slice_2
> +        .get(..length.saturating_sub(slice_1.len()))
> +        .ok_or(EIO)?;
> +
> +    Ok((slice_1, slice_2))
> +}

I think .split_at_checked(length).map(|x| x.0) is the same as
.get(..length), so you can prolly just write:

```
let slice_1 =3D slice_1.get(..length).unwrap_or(slice_1);
let slice_2 =3D slice_2.get(..length - slice_1.len()).ok_or(EIO)?;
```

Up to you if you want to use a checked_sub or saturating_sub but it's
locally clear that it won't underflow imo.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

