Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF46F35F5E1
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 01:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787794573; cv=fail; b=IddVOAIbTyaIk+mIcZbfWrWdGOGJsP5pyoG2KujbSuo6rZk44XMVuQs50s3TPyK7uwT3ku6vhxkO/3DWMgThqLc4nocb1pDTkw7p3ab5wIcyZsVwvcMmIwDxH46sK2zlANTAuERBSTIVEiUgdIoo4l++3RQIR45PWeSUSx/3RBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787794573; c=relaxed/simple;
	bh=9Mbzvb5/cR5SKPRZanGYNtoCYyMcIjRpVVOUIpVTCqs=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ttLUjPd13xCu+DBrrtmwBcDLsvSjENJpfD4gQ0mzJoYShxFE2S2o8LG38hSdjIWHmJwoMX0Ryc3Yq+1CYSHor1PTdeelJ+s3bP6xO1hfnass+M6QFs4oTxyErf+sLWIoGjJjayQ4c73LL4EGvXXPxlp2DI7Buwr9KMOwgwgSBiw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PWbIIO03; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PWbIIO03"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTN7bAUerEngSoZLuGsMYfTFqozEZb56px9rYyLTdTKhM9srCB8gtbXLcHgTTSMeB0biJ1LkQgxLQqzPe16Hk1fKuzKFDSxPBeoa9INxB+fS5MX+EGtdPJDwbHgHL7VinJQqZitzXBYT3udxNcmXUzPrEfnKLjZ+1zMNuhl64kUZUnOqaufHE3rXw6OrQ54RJKZwzVRo4V+m/chN6jDdFaJE4k/L1FPB69qHWWykATCZU/XlGTCvhCUN4isrpsnp0KigEBy/TP24IQXm8xHT0F2/USmmYbA+XUqbQYHiaMPRaJzZKLRBv+VXOo2zM6tFKSvyXaMGRpaZxmei8CBF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Mbzvb5/cR5SKPRZanGYNtoCYyMcIjRpVVOUIpVTCqs=;
 b=p6SlZ7L3SxTC6Vq3GJgyUgTbNqPOopnkfc5cY7zCy5RcBwKWzj9pHQXCCD1IgQfaRtH/IirQe2j5yGdtrJiLJtpjsz545PRlBs14m6HZYXUcysbIOV8GSYUUNZvwWmFRqZP5ekSnr+SkTrIY4vuyf64a8GWtRnuwTfNYIPb2t+CscjL2P5agnqhWhSfLoY0PbjEdwOEYwvVus6RtHzrb44oUD2VXqygGOtu1jbqlVS24UrUpr6f1g7WWN1Le6MvRPOR26KYgwcd08nrt2q9TSRjVrCnWZ/eWnCJeQrZ/2eFyP8Y7DjktihLIM+3oUQuPG+iN/CfR1aNmIrjUcP4t/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Mbzvb5/cR5SKPRZanGYNtoCYyMcIjRpVVOUIpVTCqs=;
 b=PWbIIO032OaL+TK2AKnEYdrju9aJ/9Xq9WbbfRARMytEb6XijA/A9sSEdaPPpnLVUfEykyNukHd9km07+7esI9LxJxfMIy3NxMg/zTIv4Wcxy5nWeb32Y3ZhTJAjjugjVUqAhG9kGYypKDdDwnH++n+vW5GWbWSB5JE4f8P6DUi712eN1DAlTdyEW94j8finv242eKDFTi6Bphyx/ZC79arSmmyCaAFzPPHVORxEqLj83deeXsdJkUBqHPV6MMB/1S7KHRk187ZOPPVBrpd2ohKvPfWMikYflBnnCh93R5BgedRHlmPwGCwlxEpeZjl6HwAH3LHpvfoeif9EocF1/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 01:36:07 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0315.014; Thu, 27 Aug 2026
 01:36:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 10:36:04 +0900
Message-Id: <DKZCA4IH52ZH.2NB0D6ZQ4S6XI@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
Subject: Re: [PATCH 2/2] gpu: nova-core: use kernel lossless integer
 conversion module
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260825-const_as-v1-0-1ce712225fe2@nvidia.com>
 <20260825-const_as-v1-2-1ce712225fe2@nvidia.com>
 <DKXRY82YPHIB.13IUNRJSOYH4B@nvidia.com>
In-Reply-To: <DKXRY82YPHIB.13IUNRJSOYH4B@nvidia.com>
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: de755078-01fe-4cec-66f9-08df03db9052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|10070799003|1800799024|7416014|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rUS2iuM17nKNwsw7gt5WHzI2n585mMHOjPO3VcpgJ+ZwRdX3j980ifDRv8hNLam9pEw9qniws5kAHWQsPHCcFG2TKZrX8wKn1vOFTXy1wHFoSpP40GvQOx8GCDJvvicb3dJvkh5PeJMNPYFZDj8KGmkDjpgYleMNUlSKX0YyIcxSzp7HEMQRK2dpZ/tZyps1C46Qwv+y9ZA0pYwR9JekC3FZjl9y9arbyjhkBivc2mba+5oLlMlLIvJdf38c87tU786o6riKnIiFO3E1S4wSMthcST0R2i/edypU0gDwwxlczwHC23rcglcE6ZYvia5hAdO35MKE6kc/fS3o6P24bw/kYR0sDvc0p9BT7VELZFNjhBbSZeL5GMZqoupKmiwhAKvlPvQ7bSEF54c3GQhJxEmbG6Ofiqim7gRnW1ZAXRkhQyD74XqaVtZYqwkLUZKuew8wzU/ljyx9rZtUnzLJhbXJ+E/chfNGBwIORLWnc+3cSxjSmq81/4w7Z1hwqRO+dW4ZEVN5d3kpsOY5ugq3P/WIjRE13HkBDc/MOHz4jzBB+WMqVSV3cPn3oQUrIUm6CUtHcBmeNa643uKJOHLnEU/JshEOjVpKlOyiiscEpZVyyumItwdOtjanyCk5XAUM3sL+G1owERZl/IUYQ23I4z3Dg6uTWJIoIxZ1fa5NWU0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(10070799003)(1800799024)(7416014)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzdPajg1T0p2Rjk4ckxBY2ZMalgvUldmUXV2b0lKREg5Um5FZmR1NGJTZlhP?=
 =?utf-8?B?ZzNpQ3VQTmpFTmtmVktOekltajcrZmg1TFEzaDRMZHZqcEZTN2IxQ0VGSXdz?=
 =?utf-8?B?bHV5cXB6eVZ1OVRwUFVJYVp4ZFMrWGs5N1JUUUMrdWZwb1NvTkxJOEYrWE5k?=
 =?utf-8?B?a3IzT0h1RWFMTWN4N01ZNnVtdlVSbEsyQmJiNzFpY1NpWVdJTkFWam1ucXRz?=
 =?utf-8?B?MjBxOWhNaUZLbFlieGZlcEV0Q3gzVEpCbFJrU0VhMFozR21aRVpKc3BGWTZ5?=
 =?utf-8?B?KzB2QTZmK0pXYUw3STNtQ28xUHc4TzFqak9FeGV4anp1ZUdKQ2NPVHN6cE5V?=
 =?utf-8?B?dm5jNE5zSGx4VGdkOXYvbE9tSDNPaXNTVEVaOGxuMmtRK1JubHdtZlQ4cDVs?=
 =?utf-8?B?eEozWU1JOHFIVDVjZlBTcVZJNUlGdDJFUlpnWjdSWmlEN0E3K0lnNWpiV2s3?=
 =?utf-8?B?VHIxdXlUdjVSNkRUNGgrdVdyeG9MR0U0aHpFS2lmTXh4T1M2SDA5bzFEcHhi?=
 =?utf-8?B?WUdBb2c5YlhjOVY2bzBwZmNySzBRZGt2ZTZGdzJrdjRWSjJDK1RXYXJBQkxX?=
 =?utf-8?B?emVFRlBvaDYzQ05tT1RMMUhFY3RybXo3Ri9ISUxmNm8xWk1Xd3lHaE5iSXBB?=
 =?utf-8?B?SlUvQy9iYzI4bnVuZmxnY0tWMTJvbnd3bXRCT3Q3dzMyeEVsZGpMWlp2d0tF?=
 =?utf-8?B?M0xla2N3MnRlK2trWmxxeE5Qb01EUFIxUlZnTFBKMHd1NGNmdDhZT0Q2M1d0?=
 =?utf-8?B?M0JUZnpUbkd4cGo3SjA2SjdlOFY0V2hWVnZqM3IyUnFMSGgyT292eFZLL3JK?=
 =?utf-8?B?SWxBaVFRM2gwamQyaWdRU3hIamlpWXNoaEw1dm83YVRvT0lwYTNVS2xOYW43?=
 =?utf-8?B?ZjdEV1BpckJPZUoyOFVFSUhlN1pCQjZPWDArYTM1V0JuTXcyOUExVkp0WFNG?=
 =?utf-8?B?ZGUxTy8wMTQ4SUVqYUR2bFJCZ2FZNUhGY1I2M1pCREE1Sk8rQzAzdVVKTkJi?=
 =?utf-8?B?disrbFVHS1lCSlBneVgxcDhYN2FtMm1QTUg3dm1Rb1VzSDVUdEQ0eE5qak9M?=
 =?utf-8?B?TUg0Qm9hZTl4bGNmalFnTzY3YVdOR3V2SnJGNjg0TFVOV05TTUdEQnNTM3dJ?=
 =?utf-8?B?MlhNM1N6eDlyK0RTc0FBcHFYWXlDcFI4RXpia3h5UitjTndNWFNIVnhKVTBL?=
 =?utf-8?B?eDRGRTVUbWV2K25VLzFFUnBYSmNKMm4zT1FHQWxnclZoUUlSWFlramtyMWxw?=
 =?utf-8?B?Z3lYTmg3NDA1Ym8zaFBDa2FwbUZWUkkyVmY5TmlIaFIraHBHM1FQMGZ6RWxp?=
 =?utf-8?B?RTJYOUNnSG9yT2haS09KNURmblNJdVhHY1dZVFdaZVJYYkdnSWVZaWpJSkwy?=
 =?utf-8?B?QklFMnorNW9yam4zNmtzOWxEUWtCckx4TUpmZ2M1OW8zbkxKNGZFYThiNEow?=
 =?utf-8?B?cEdaUGlBR20wRG9VTXZkVXRzRlFkV0RNSlhIaGtVQUJmNTVwRW9LWWxGdzE3?=
 =?utf-8?B?NEFyYURGaGx2MnNXSWZXV1RrN0hPeHVqRWZxVW1semlzWDNsbDFCWEd4ZTVs?=
 =?utf-8?B?NUtkR2VLTVNyd0tVVWlqTUtpMzBiZXNWNnVlQUJhMmNPazJHVGVGUkxaOXRU?=
 =?utf-8?B?T1l5cHlsVng5Q3pOUVFGZExXWDl2ZnRWYWE2dUVXZlJqRHExQ0ZENE4yN3pL?=
 =?utf-8?B?aGFuenk0MTVVVjNhUHFUZzduR2ZXaW56WktrVVphNU5JOTFtdTBGTzZudWkr?=
 =?utf-8?B?RUJyQkZ6bVhOYXBKQ2N5c2pBMTgwOWVFeTBWbU5wbFdVRHA0ck9td2V1SlpH?=
 =?utf-8?B?bi85NTg2NDRpRnk4bE5XVEpjUCtmUTIyNjliaGllY2FjVVFJK3pQSndUWXlY?=
 =?utf-8?B?Ny9xSW5tTmpqcVViYzA0RTJuOUl4bjMwbDEzamQzOVR2ckxFcTVvMUZ3MW9o?=
 =?utf-8?B?cmkzd2tRZFowVHBPWmNlb3FXaUIrdEtTNk01VUtIN0VEaUs2bUZqL2EwdkFB?=
 =?utf-8?B?K1NDZ0FESjZhemIwSDV3bk9iMVozOHdqQjdiZXQveUdwbGV4QVA5Z21yZ1h6?=
 =?utf-8?B?UVg4djhvaklTYTdKVFRVNnprQjk5ZjB0aVJuUGcwODB2VmdOSVpPSm41Y1FJ?=
 =?utf-8?B?cDlHMzdmeWZCRU95UDJnVzNUemFxSUdwazkvdkFLK0FpdGNBdERVVWJiOUJD?=
 =?utf-8?B?SktSWXJjc1RrcVkvV29iMEI4UzYvcHgxZlkvWk9vSktPbzJNMGczVEVwNHQ4?=
 =?utf-8?B?YVhZaTQwRmUrRkhERjdya1RmYTM2V3B5c2plTjNEcDFBbFdkZUpJTy9ZQTRD?=
 =?utf-8?B?ZXNqaHh6SDcvVnlSazdiYlJTRStCenFsT0FSVUY4cjYyeXdFcVVyTGQzMDNH?=
 =?utf-8?Q?1nCnPlGJVliyVEATStxHqYPeb59+ce6cQEEoC09HRv9XZ?=
X-MS-Exchange-AntiSpam-MessageData-1: bGwn9fTg96E1Xg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de755078-01fe-4cec-66f9-08df03db9052
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 01:36:06.5388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUzH8SCMCK5jZ75R2ViS9ChkGB3CZ6UTk5f19kon2jkKHUj6N35KW2O97p71B9Yq1jnqrlE8PHDwIqCDMMsWVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272

On Tue Aug 25, 2026 at 2:27 PM JST, Eliot Courtney wrote:
> On Tue Aug 25, 2026 at 11:44 AM JST, Alexandre Courbot wrote:
>> The `kernel` crate now features a replacement for our lossless integer
>> conversion routines. Switch to the kernel version and remove our own.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> nit: casts:: prefix feels noisy to me in actual usages - just import
> const_as!, etc and use them directly?

Yup, I used the prefix to keep the import list short because we were
calling various `*_as_*` and `*_into_*` methods in some modules, but
since we can convert all of them to either `FromSafeCast` or `const_as`,
this is much more manageable so we'll be able to drop it.
