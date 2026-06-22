Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538C834EF0D
	for <nova-gpu@lists.linux.dev>; Mon, 22 Jun 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782119481; cv=fail; b=uB0y9ayGTW34aDCOuvt1uvKWi9J1fl9VTxUkUZ7kBNq9LQQP7RF41J68EOo6aiwS+g1v/U/Gc1JkbQl4rwHuwGd5wNxnWYh/Xy2j8fcPT36DBETnmBOhNAKSNaVu0BPydHe701XZpsnk0AKoe1sle1M62bdzDqJaQ0N+9JMk2Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782119481; c=relaxed/simple;
	bh=L7iCH26h2l3Jgic3VLDJ4oseufjNBWxrBpMaWomntoM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NouPo4LlXiUKwLdYD3psk8ygqamdDDR0IwmeK8NFGcNclZzsE4a2G/SiFeORnxQEN1otG5TIKUBAX80pAq2Zx5xYuT/vjrWG6swW29hpsGrMdKePa/WHKo1gQUP+/TSqV0Ht9HowGl+zQYlBNErUm43batkN5vYOkCGv6VtaxtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sDRSJ0yD; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sDRSJ0yD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLBvYEBJDAEDmjoeH5UWDEDUA6/qvUnNqGxaicNz6A5f/8+05G5tEWUNkyAf9bg5AdpLN9W8zJ7YjzRq/zsyAaU9g4Dwb3EhgC70KQofsNrknfJ3pwoxDjSW5mnSQIWo0xUkizuoNSj5YjXJ0ZEuTVUts9vn2o7d2pPkhBdYULo0H/xuTub3togTEgpxI+ig+n7TSWuE5npqaqmGcdzh8FPNqVmlkt8Mu4u6u8H6Pt5H0TZzyyODfzio5ZwN8byhYdk04teiZrhOOSgxr4LdOQWMTnDE03W3oM980cPXFir8WiRpHAEoKclEKGla+fRijZT1A377XVFaq524+eaBLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2naYSPjGSWDeIzFcV+o3A8T6GTCV0vUqwPHoDVu+BPs=;
 b=LWWCLKoeKSTB5GG6ctfof2q7YCmmpMRyouDN6lOZ9907K6O/DVnMBc58+HiSvQ6kVSkaWHid6fvFPcJMH8C7QC3f8PGE7Y3cP92Sbgny8S7kyUK7wCwwgiOZ8eqeHrkjJdsEGO6+hPeUgDw7hV7DcSM+BKdzv1BCD+993yszLlZMn5XGmIyKayUU7bD/9lJB0xbHFVRTYD9e+Dlx5QrMvcB3exSo8QHWnuxL41ySgtEYvqR/QFBcXeqe9I02HS5d8zTtc8kruBd+vHuW2gjV+9Hpy25wpbLrtDndEKmdaXMHr5tZz+n+gagfpb4mRG5B4CKn13pBe4yNa1xrNFf8lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2naYSPjGSWDeIzFcV+o3A8T6GTCV0vUqwPHoDVu+BPs=;
 b=sDRSJ0yD02sN6ldqQgdVHVGCqK6HiiDbjnYnzRSwsCi3orysUNt94paRQKpbAl4/2SLxiKqBmASPi6vzzVcEQt6B+iyCYfYddCbIh3nmMJqitlrNbJywQmC1OZuyEOJBKVvkk3MCIbR2QD5JAPDQp8y0UqDhwEllMhk8b5Byv1EmqAABGHNghuoP4CIRy3VHkSC65nKTc/RF5w9gDKohPct5lRhIbiMpD43Yw4ppyhG1IUJcVycVZemoTl9ZGrPEam6EKdSKJF4TPY0bhp/6JTsUZrU47NvNQi2ZNZgje1lbe+ASuz257B2+cJx+En4Myi3zbCVcb6Ygl2/z2rZBDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN1PR12MB2368.namprd12.prod.outlook.com (2603:10b6:802:32::23)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 09:11:15 +0000
Received: from SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42]) by SN1PR12MB2368.namprd12.prod.outlook.com
 ([fe80::281e:52ee:b18e:ad42%7]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 09:11:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 18:11:07 +0900
Message-Id: <DJFGMKY0BTPP.2ZSEYVTU5E04S@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 01/13] gpu: nova-core: fsp: limit FSP receive message
 allocation size
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260615-blackwell-fixes-v1-0-f2853e49ff7d@nvidia.com>
 <20260615-blackwell-fixes-v1-1-f2853e49ff7d@nvidia.com>
 <DJDXP9BBZB95.1TWARVNHKL0WE@nvidia.com>
In-Reply-To: <DJDXP9BBZB95.1TWARVNHKL0WE@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0019.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::9) To SN1PR12MB2368.namprd12.prod.outlook.com
 (2603:10b6:802:32::23)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2368:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: b6edb94f-cc35-4fab-a691-08ded03e365d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|10070799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	PlcihZAozqhT3fNBjVaAyzqqL6MK82+uTZX9jmT2S715uqb2wdMRsjdt9MiXjgg3XkrYIdnU94SO4HA7lQ1RjxROTbGcwguj+F3iVu9OORoHvFPEClA9c+fCpIspUmEu8kK5LymzJY6eDonQLIvb6nJgoBMbhJTo0pf0xZiFbUkiKvwMNzUabC0IkVxSP6Uj5DMgw+ujGgp9+7aVApyywys8WWVdfsrcbYDh1ZLhMnPcN3+nssB+meK2S9bMR3z/yIoSBIKbV/fqrJyYTkhSTiBR59xsBGgMU5mmGU2Bv2W4WZwP8yivuVT7tb9xkAko0T3L2UDrH/4wwRJbEchUE5m6Tgs7dIGWp4JRUSOVg4iWxkB703dllTYtGBKmmoiKbZYj9ZRM11ai9pfBPIVx2baxXQtOLpQjxG3GMqUD+ATrXZUh9pYGsZYJZ0DA+h+mTepCY4l0Sfv1BdrerZumQbM8hY+SJRzYWEefjzawp2DW2Oj9Y70Gi1u8j//I4KDosk0DSE82Yp65c2v4M5qOd2BJOQUckwy3hyPwvMxMOsP3UR6k64qk+vrMWqU1Fc2xg1U+1REc7jqTAQzzZ51wy/Gr7/01QYHpj59Y5T2jKjjaSCdpnZVsfXeN497iD3p6hysEgYMv5CKZbKr5Rz0dZ29Jupq8Gn5l2taCzx4Bfuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2368.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(10070799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmppRXN2R2NjNS9EWHFrWG0vKzJJR0NTTVE4YXZxK3d3akRNZTdMaVc0NFdG?=
 =?utf-8?B?YjFDL1UwSHlvbDFWbncrR2VueVhSMVFzeDBGMG1OS3ZWYVlwVEk2MCtRMWdI?=
 =?utf-8?B?MW5aMmltaXFocnZ3MVZhdkVJeEhUcHVlekF4Y3gvTW9ZLzBMZ2p6WTRPWlhH?=
 =?utf-8?B?ZCtXMDlsU1lzT1ZIYzFDRlZtMjV6bFF5dnhhSkxtWU9pd2dSY1plNGZBOGNZ?=
 =?utf-8?B?TXhoSDQwSGt3eHcyVTBlM1FhdVY4ZnRZb0YwWUdLUUdFMVdIemZPWmh6RTVt?=
 =?utf-8?B?ZExnMWdzM2ZLdVllWlZKbkNiV0dxNnRTSGxhODBJa0U2MjljbUhQVjVwS2tS?=
 =?utf-8?B?STVoSElIVFlxejllUUtaYVYwK05kenU0ZjRnMkcrUDAyTlZvdk9MVnNTcThl?=
 =?utf-8?B?VVYwMkgwSm1xOWhyRTRTOS9DUEVBamxkcFJWU3l5UGFxQ2JOalZEWEpoQ3lh?=
 =?utf-8?B?MDBVUVprdEwyT1VIcGVGcTNXcXVCK2Q5RThrZXlEelB4RHVEOWxyRFVEWU5D?=
 =?utf-8?B?bituc0RFOStmenZ5UU5xMzhwU2puN09ZZlJEWkk0ZVN4L0lycFpyK0N4V0hQ?=
 =?utf-8?B?WUtESU5xaEs1OTBMSnZFRkIwbSt6RHpTaDBFSnkwd056Y080Yks0YlhKc0x5?=
 =?utf-8?B?cE5rYmpNbVY5WnV1eWowMmVxaDV5MkFLcHJqSHY5anJqUFdXQjlZdW5NR09J?=
 =?utf-8?B?ZVlzQlJTbGp4VHN3ZzI2V2l1S29oZXlRdXM4eEFaLzZLUUV5WkRqT1Y3Z1hR?=
 =?utf-8?B?RTYvU2pmcjEwb1hzM2VFQkNpVTluc0JNVFNVUmVabXF1M2lUS09hSzA0ckpu?=
 =?utf-8?B?Tkl6K2VUWTlPQzZHWXQvaCt1amZCTExPWDQxcEVWdEx0SGhpNmQvbUE2S1pU?=
 =?utf-8?B?MWU4OG5jZ1JrOUVRWnIzN2ZZZ1hmU3dZVi9ZWTl2K2l1VHFHVU51d2Mxa2Fs?=
 =?utf-8?B?MTdOUHg1UC9TMUxZalk3eTc5MFBKNXYrdHlxRno5ZDgxWTBXNFVuMER5a09t?=
 =?utf-8?B?TWJpSmYwVC81ZWJGYm1QbUhJakJKU3hOSmhSS1lXcVVaczBCNVJQdmRJaFF6?=
 =?utf-8?B?dlRPV0x5UHpSeGpzaFhIVzhTTWhDYzNPdXovU1VoZUljdDJnbFpGUEFJUFJX?=
 =?utf-8?B?RFJLemZMT3E3MW95bk1Qa1pPSHczNjJWaXhKZ25iakRjeGtoclNIUkRjTGlV?=
 =?utf-8?B?eFgwYVM1RDJ3SkJzMGJUT2dVSk5rQzhvWjEvWEgvNk5DU3RhWHlZd0pGOFpG?=
 =?utf-8?B?YzYzbk8vRXZ5N0F3ZkFpUDdlRW16YklNV3NCNE9vckc4V0RWZVh6M0ZKY3RZ?=
 =?utf-8?B?N3l0ZHc3bVhIZS95SlhRYzAvb0RqSndGWnJDVXZOU3o4S1hnV2d3MzBLZ1Zq?=
 =?utf-8?B?d09LeVRsKzhZN010ODV6d0UxcmxsZEtzYUZkM2NDc1NvYjRJWHRBQnJrNjFy?=
 =?utf-8?B?V3VlZFJvTWFQUHhWUkFaQTNlZWdZZWR1eU5LQldtN1BXZFd4bko2dFp0dFow?=
 =?utf-8?B?WnVudHVEeURmV3RFbFdIZFFpRzlCUHJCSEZFaWExT0dMVTlaVnNVdHpCTWlS?=
 =?utf-8?B?SkRjRGJDM25DODljanU4dERCVGVmUGFiSzBUU2YyUDFSd01TaGZYdno5R0tD?=
 =?utf-8?B?S1JWSlJKaW5HYVVad254L1N6ckpBVUU2SkVhdGNRY3ZhTHRtVjEyeG9kMmhZ?=
 =?utf-8?B?eHZNNHhTejUvVVZ2dHFJMzBzdkc0bzE1akV6ZmNxd3pQWHdvOVQvSFQ1WUZQ?=
 =?utf-8?B?dUtJbWRCVk83M0F0T3Z1OVNXcit6RmpTUlZ4REZRT3RsSWRvelRqMkdqQ1Jl?=
 =?utf-8?B?OGxuM0NIK2FNTTNnSHZ2WkRoc0p6NzNPWkFDQ01nUTNwaWRUWGJHaUVlTjZE?=
 =?utf-8?B?NXVNcWV2bG1mMjhuL09IdHcyeXU5cHNjdzlBa0FlQzF3dWxZb3hWUlBIRm9Z?=
 =?utf-8?B?Y0R3bW1MZ2V1Vy9la0Fzbzl3MXFVbnA0L29saHlkQ2tGT21PekF0ck9aa000?=
 =?utf-8?B?UWVKb1JjejhUZG9ZTDdzWG8vbEtyU3E4YmgvbmYybmxSOThUaVBYRVY5cmhT?=
 =?utf-8?B?Sno1b1lQU2F2ajhudE5GaHVhR3dCaHJoWEIrbThXNU9LMHRaWTN4c2pLYXM2?=
 =?utf-8?B?V2k1UDFvQU5OemV6TGxFYVBBbUpucnhuZGczL2YyNnFEOHRlcDg4VUk4eExR?=
 =?utf-8?B?SWpiM3l5QW4wT1k1eC9waDVKZXdWKzZBNnBTbXB1M2hnYlVSZnMzLzFkZ0U1?=
 =?utf-8?B?d3hUZGN5bFFOMzdwNTNVMGUyU3k1cDhpWFBkVkxlWmowMFpFeUdCdVVZYi90?=
 =?utf-8?B?dysxeHdSS0lWbzRxT0RkL1BqS1NNT2NDMGRJSWpjbnRVZ2ZXOXNDMFNyTEhj?=
 =?utf-8?Q?/HV3nR13KbZ/mO0dENqJg4VUcMSkxSSqLh+3+fhujRrvf?=
X-MS-Exchange-AntiSpam-MessageData-1: uj+EQ9OW1xTvtA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6edb94f-cc35-4fab-a691-08ded03e365d
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2368.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 09:11:15.4555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OBrmWA5O+aqnzhujy6ahAeAQ247ZGzKNPjekQ1XYH2c1bAd2td6IQVfgA1pzfqnjtTDadHupyVF/GbVjvSodCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341

On Sat Jun 20, 2026 at 11:08 PM JST, Alexandre Courbot wrote:
> On Mon Jun 15, 2026 at 11:40 PM JST, Eliot Courtney wrote:
>> Currently, the FSP receive message code will try to allocate whatever
>> was sent without checking it at all. But the actual size allowed is
>> limited to 1024 anyway, so discard any messages over that size as bogus.
>>
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon/fsp.rs | 36 ++++++++++++++++++++++++------=
------
>>  1 file changed, 24 insertions(+), 12 deletions(-)
>
> This patch looks like it does two things:
>
> - The size check, which is described in the commit log,
> - Reset the message queue pointers even in case of failure, which is not.
>
> That second item also makes the diff a bit difficult to read. Could you
> split the reset-on-error behavior into its own patch?

Yeah agreed. And actually I am not even sure if this is a good idea
anymore. I originally did this because if we get a really big message
then it's unrecoverable unless you reset the pointers, but I think we
probably want to give up in that case anyway. Let me update this patch
to just do the oversized message checks.
