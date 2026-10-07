Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010019.outbound.protection.outlook.com [52.101.56.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC7F244692
	for <nova-gpu@lists.linux.dev>; Wed,  7 Oct 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791333204; cv=fail; b=QtC+PmJ2Ul4sYKBL4gLG/hzHncS/fzBJAQ2OM4HPypA7CI2PeFbApWiy/x1+j3VuSLDfDGPh8MeO5Lu7kK+k7WXxws5jNXY0yeOMV1lGmCYSOJvnOJN1WIj6zLCPwxjR/PlPsM1hudcy15WWZkvX9SEGGkjcnof7n8fmEeILZH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791333204; c=relaxed/simple;
	bh=qjCBf8jyIkB5qxwYPojAtuBw4KeEogyWEChRhPCDgLc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=YUkKhSX4vwpovOtDwah6NqjFj+PlS+MoDA0yzLdbBGPoXRnjHnQdsZOBltJiL6pvtfPFl+cKVXRCuebllJPUHiwDQg71JIUXSf7HiiEDUNBeggV9iHDLiirXVjtKdnfQjjYjEqss0Wh8Txysxa2txymBiceq3hi7I4VrZAij6t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ckjfA/wV; arc=fail smtp.client-ip=52.101.56.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ckjfA/wV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yH/fZpBN8eR/S6OaRrk6mQ/SM3FIQIYFp7WAaN5l2WRHgFggk2OpzOOXecj1bJQRrLFlzDShQKgUCb5s5XyEUKbAX0bz7PadIDtaus9+HjPY2v+LbVPK+XczjS5fw5N35/6Hwsvj14N5YUJeuIEkTfsXMy8jV3X463wD/yHjXigYJyX/WuCJOqh9embgKD47qLp5xRhx4PRfKsYhV8kP9clvOFfDRaPA6g7JnAmnyCaBY3I3CWNbSO/W2X3RUL7p3ZLMJWoxOOOfYdSVv6i2s+1CLwRlFOmVgf5OUzB6sL72HFWAif82yxqHoqIFmZgJIpHPrWSfhTY5S3VQnfQNRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rd+bMjE0DDCkBvQTgij1RpIWzQe7HGJCLubdS6c30Hw=;
 b=pjUmw2Eq1WBfH6/iTnorTvI8umaJ2cTtk2kilNmp4hwHEyjCuvqvQz+LdL4jA65j2GXULB1gLrhhhBWR9UX2t42Ku6enOcnC6zyjSIJ0/usCVJ/lxDV7pBC2bugn5m4RH/zFAl74gXJCOyhcSveLN/2yGdiWVm0zgvlFCXevJ32tUvleaKMxPIJft9yObhQ2NDPkd8He0DAidr2JKvpFHpZ5sTtUskKI+FFY8TYSAYiHpfKiOqUWwz2i1anw3hhGE7QEsXlVEPHt+88vfkdxColSgBjdxmSzV10ilSQJL3+ksWxQWx7HyOs518YWStDFp5BQHr6CoqrbSBSdR5V/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rd+bMjE0DDCkBvQTgij1RpIWzQe7HGJCLubdS6c30Hw=;
 b=ckjfA/wVORwSt2PRzpVzfxTYJ9v6irqnhhyfijL3h0lv62/tgbdtx7Hp7t0DLe5kli7+UzVGNr/UHCprvy063A2h00h5CPyrcIC+GB2yLlXLSA7bsVTAm2LAR4ukLHZxwgLD37gDwaRl3XDZRbqAHXqy2SYoDdKAkFLfyMkoYEpCfp6JGgS3973TbWAUzkU8EYPXwhVonrik6Tm8f2tlTE4h1Ne5UWDuHOSrWdQP38kbI3Co3LwjzVl48sRvEiLaTWwfJ5v+Ht1zrNoyC1rJZAPBFV0048KYmMWHccjRXZq6ujgF1389W0c9RkggeYa1fuDLTAx2MbVDrtDb8jDYEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB6912.namprd12.prod.outlook.com (2603:10b6:806:26d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 00:33:18 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0472.016; Wed, 7 Oct 2026
 00:33:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 09:33:15 +0900
Message-Id: <DLY6MDDAUDFL.142WKY7PWTNDU@nvidia.com>
Cc: "Thorsten Blum" <blum@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Gary Guo" <gary@garyguo.net>, "Timur Tabi" <ttabi@nvidia.com>, "Robin
 Murphy" <robin.murphy@arm.com>, "Tim Kovalenko" <tim.kovalenko@proton.me>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: firmware: fwsec: use zeroed() to
 zero-pad buffers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20261006100442.80432-3-blum@kernel.org>
 <DLY3SJLA1YG0.1YBCCD2CAH2IC@kernel.org>
In-Reply-To: <DLY3SJLA1YG0.1YBCCD2CAH2IC@kernel.org>
X-ClientProxiedBy: TY4P286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::10) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB6912:EE_
X-MS-Office365-Filtering-Correlation-Id: a9acb22e-76a0-4329-6d0a-08df240a9536
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|10070799003|22082099003|18002099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	2d1ndEOhCO04/M/arfT2dKJPUDztSu2ATV/+WClYbhKd/7w1JVF4QwXDv8C+EuwvtodkS50uIgjR4MI+hvir9llxmUnjDkaaSI8pIx9wZgGlQDRNM27GhPwS8JVWGRwoogGj0mXtlHE1SsVzjjkX97WktK1pL8IHTJIK4TQZfwvl2Kgm2D1cwjgiQ+lcLwylUXzKYEtO4TOJmZevaWBkPtlz+gWz4v4Hzps0PGhS1R3QmrbUQqURpEKtSBdKOHuyek3NPDHkRSlEbMKrQJTte+9tJWH0T6K5sjSQPg/K476UUCT/h69Vwp0InZiT/QF5G35rjY18QEfMKUo/o2MJ5D7MG5TabWHo576Qh/Xf5UmY/7oW/SHkaEeORC+36OGpYaOuOzDgVFE5yvLEj0uKiPwcH9HF90A3TQX6xFPnvTa7CXYk/r/9nlY/fqO6h0lZwvf+GPsU2ArK+sYe1PBx+WE748P4dPKd1cGnptP7uJvNAcgnDYLh+pg4hefkxJ0Ox+4GKUhTR2i4o8Ibi+R8yiRFdZ1Bz4robRDD8gWHZmSaCZ4TR7wIp8gA5J8xKQQgDrSQoDY8WVHsj6kUSjEHNiI4Bia+5x3JqZe6van0C7fCp3B2uEWYXDlXRB4mOYu2IDIYBUTNsbJprFoNEfPdl9Fx0hP5dFKAN1nFzADyBJs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(10070799003)(22082099003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUtVOHl5M2VFSU9VSWV4WEY5ZDRTS0FnT1hrM1E5OEFsNFlEbzQ2ZksvWkUz?=
 =?utf-8?B?WVpmNUROV2duK3ZhM1VDeUFRK0taUk5zNWllQWd3MXNkR0pObjVKSWtZcFI1?=
 =?utf-8?B?MVFWazRvU21tV2t0ZEsydWlhRXRQYXFDb1NMYlR4V2k3R3gxckJrQWtwdCtl?=
 =?utf-8?B?SnFFMktkVzRFZnBzZi9DN00vYm14RXZxWkxXdHJHRVlmMDRGLzJ4OFRIcGRC?=
 =?utf-8?B?ai8rc1RuVVBtcVQxazZmRTc1U3JudVN4K3hYalF4WFdpOVVmeXdJRWZ4ZE45?=
 =?utf-8?B?OVk2UjlPT05VaWZFZ3pTNnNUOGFNZWhkUDhSNFQ3aS9PWWZocUZhSUkxelBv?=
 =?utf-8?B?bGJsRm5uSFAzdFR2Szh4NkRIV2o3UlcxRlV4ZFlLSStzK3ZTSVpKRFRSanc1?=
 =?utf-8?B?WHgxZGg1bjRYc0EyN2pRTUVpS0NDZ2thd1luQlRyR0F2aWthTVhNTTVnQmsz?=
 =?utf-8?B?SW55OEdsYXBYSFNMMEhPU1lmbzJ3cDlIcFh6R3V1YzVXVzNuYWgxRFhRTUJu?=
 =?utf-8?B?WHhIOW11Wm9ORnV4REh5L2g3TDJZWXVxMjk2ZTVuNENBTXNpdE81djVxS2Fq?=
 =?utf-8?B?ZVRUR1dLR0ZZMU9XTHk1ZGp3Q2diQUI0U2UvUWg2eWNuM1RCbnFqaGR3dnpq?=
 =?utf-8?B?dXYzNE4ycWNhdVIzWDFOZHc4Qy9xZUFvZldCUzdvUjU4UFNUdlhobmE1SmNY?=
 =?utf-8?B?S0U3VTVEM2pVS2ErbVpKa0MzcXV4VXpKR254N2RZVnVMRXN5U0pXWjFaN09J?=
 =?utf-8?B?aU12UStkYmFtYzRGNlZHUmlXb3V1VXNhZzMxOWZtb1lwa2NxQTh5VEZkek4r?=
 =?utf-8?B?REt0MFhMK2FPNllHM0Q0S2pEYTNoaUtQTzNZcDFPSlZCRTZUUmhVSTU2bmZp?=
 =?utf-8?B?NS9qUXRQWjdQSFFTbUFoK1Q5OXFmYjIzTnR4Q3dFLzhwUnFZcTRWc0xSNlpW?=
 =?utf-8?B?TG9UU0F0cTRuVjYzcXd5cWNRQTNqZXlGbEt2WXZoNmtDMEhZTkFvK2JUdTdu?=
 =?utf-8?B?c29UeEJadC9kelpyczkyTkl2blY0cEJZcEVtbjNSL3Y5M1pHc1ZDeEJxR0h6?=
 =?utf-8?B?c0piUmxJaEQ3U0Q3MHBpTWV3Wjg3Umg3ck9uWU5OS01GZVdMSTRnRTRkQ1JB?=
 =?utf-8?B?dXN6S3lSKy9mdjZINVhOdytRWHZMaXFEWC9EMlBIUGlNbm15OW5xM0pvalNF?=
 =?utf-8?B?YjJCQVVKeW1TTTdxams3YlMrY2NWQktMbVZpMFVVWUJGMDFoeGZJVEdpTEpH?=
 =?utf-8?B?WXhtaE9BL2ljcHV1RnJ3TE96Zm1kczR3MjhQSXRiZWZkN1NxdGhGbzVaS09K?=
 =?utf-8?B?ODZoSm9VbzVZZ0VwbHVBTVUxN2F5QnhWU3kzNlYzbTZpSCsxMEZiWlRxYkpL?=
 =?utf-8?B?QkVRWWgrMHBZT2lla2lPZXdKek02eVU1aTF5a1NKM0pZUjV4UVZGS2U3ZEdV?=
 =?utf-8?B?S0dkb3liQVBEVkl0aS85aXowRGVOMGZScXRBTHNFczFya0orT3lDcDZqLzRo?=
 =?utf-8?B?VFNwTkM4cmxuQWNYWU9aVnpZckxmMDNKZEZydGZZc2FwaUpRUnRFdUtnb1BD?=
 =?utf-8?B?S3ZJYTYyRUVTb2E0QXpEbFBQeFViN1A4cklmL3FvVzlSUjMwMmZiVHEyZ3Rk?=
 =?utf-8?B?Z2JQbUQvbXdDd2JDZGw2SUtBRHdJaExvbExZWjNZTnUvT3BRb05Eck5kbEpR?=
 =?utf-8?B?VEdQUGRKVFZMeEdHb1V5YVQ2ZkxHYXBvY1Z0STRPNEwzQUUzL1J5b0p5RGRt?=
 =?utf-8?B?azlpSlZxd3dHemRPemZqK3JCdk9EaW85M0dBaFBCV3VLUEgwVXllaUd2L0Rs?=
 =?utf-8?B?RGpYL1ZRMjRDY0lXTDB5SlZYVlFmWFpQSVNjdzc2c2plMEdZSC9pWjVmYkpI?=
 =?utf-8?B?eTNjUjV2OUZYUWZycVhIVlRRVzFvcGgwc2hyMTdsWUg5VTJrbjdIemJzOFRX?=
 =?utf-8?B?UVRIR2ZKUHVvczVkcFJieVVpUG02VHNCT2EyN0VucTN6RWF0S2dWQTVla3pR?=
 =?utf-8?B?K3d3NW9OUEIvUE1lNEgyV2tCbWhPMlRCTjVHOG5sZDJFbHpES1JXaFdiTVU3?=
 =?utf-8?B?aFNsSzIvWmdGLzExVS84b1h1TDdEM3FRUkdidXZUM3ovVExvNW40bWRxTjIr?=
 =?utf-8?B?YmlaMm42M2FLU2NMdVB3MnFzZXQ3bDZKMmoyTm5XSnB4bm9SVzBvWUNzYU91?=
 =?utf-8?B?Q1lZemtTTitLdkRZdmdIK2tUV2pFUFE4TUN3QjIwM290SVpKcEdibm9oOE9F?=
 =?utf-8?B?RmhEQkVDRzJ6OFFzWlFveTFlU1lWeG5JSU5TQjJIWVh1NEozSmppRHFJQkU3?=
 =?utf-8?B?Y3o0ZDgvVkxxMGVUaTZhL0VTZi9kS05FVlhMek8xV3FrRENudFIwcWN0S1Zu?=
 =?utf-8?Q?CmnMg0IRJVGjk6TZIPG66k9AitoFUKF5pMOq2oO/ZI8hi?=
X-MS-Exchange-AntiSpam-MessageData-1: mMPQeWEBPlwINA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9acb22e-76a0-4329-6d0a-08df240a9536
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 00:33:18.2779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDcUjDnuit8xDZOKt462Lj7Bni2FVhMR8qJqfMpbdImopV/qOg/lXzOvqLKPj5waFg2xfKi25MhgEXb3x1idqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6912

On Wed Oct 7, 2026 at 7:20 AM JST, Danilo Krummrich wrote:
> On Tue Oct 6, 2026 at 12:04 PM CEST, Thorsten Blum wrote:
>> -            let mut ucode =3D KVec::with_capacity(aligned_code_size, GF=
P_KERNEL)?;
>> -            ucode.extend_from_slice(code, GFP_KERNEL)?;
>> -            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
>> -
>> +            let mut ucode =3D KVec::zeroed(aligned_code_size, GFP_KERNE=
L)?;
>> +            ucode[..code.len()].copy_from_slice(code);
>
> I kinda dislike that this is now a potential panic, but it does better ex=
press
> the intent.

IMHO the original code expresses the intent just as well, and avoids
writing the area covered by `code` twice, on top of not introducing a
potential panic site.
