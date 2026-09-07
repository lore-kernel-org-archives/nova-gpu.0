Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010005.outbound.protection.outlook.com [52.101.56.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B894277C88
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 05:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788758326; cv=fail; b=Sb0SccJ9vPmz1ayTxrghAfm5BJAULMwfm/K+aVlAGqXCrPYM9TpNdb+PGj64Im9axwu3y1W031PuEklqW7sXDX0z0ypFtpmSScUKylyD8TioOfffze1nBLKGizHTvjy9e9FrA0m7NTUczFBjSX97vUlVwuc3mRH3FJk9OFVbwNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788758326; c=relaxed/simple;
	bh=5N5gOLcKYjscG4PTnug/wB6VtleNHIZGoY5pOmXYMsQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=Nw3zgSAv42jLaFPaX93Mv0OWIGc2qrdTrPIiwDe8iixEL8kwojkkneU+O+anbcF3E1xI/6C04thx+vq+FlbLZPWRX2i8hvSBHj8j4XvWJDWz9LrTY70zRT+hCIPLc7N3Ej6VZsXlLv0W9r4WZ8B5AUyhJ1SfF4iYPDTbemDfoX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fxgRzqRW; arc=fail smtp.client-ip=52.101.56.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fxgRzqRW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRY0NxkID13KKpRD2E5veJ1VUYPdkWTCtf7wGQFohe2NlIiO3UzbE61KXIbmzJOnYDLhmtoEpHpRlwUc5cMiCIjLoajrIRmlGzQWtWaa00XemUvmJBhBvtWtqNKDAmmeHymmA3MDy3YZigcG32Lq8/lg/VLN3Gu/rcmWEMm+aupp1lxgID4YZk3DZW4Y1REVg+1vva4PUgNYZiSU01DpGIkQaDlC3QchJgBU/9d7Cf/zEDSTdNp9qu2qkGNBnKAZtw15pVDpWxcDDJu5A63QOiXfdHlcuIyXwAG+UXlFlhowbiPd3upj4PDiHY4XiG4eR+wKuH9uEjK9sSgpscmKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N5gOLcKYjscG4PTnug/wB6VtleNHIZGoY5pOmXYMsQ=;
 b=ST6H2QkrFPDTCzlvQ6kyHQJm+qqosXn45TipuHsbL2sshUbGeWnjZQnEbnf8WQXSoT6yfAxtuNzB275QBIEqf8MzUcIH8IX5WN0CyuDK/4HfmWUu5JwVmvmMTnZVqnxnB3ICk0T2sF1PHJMtEJtemgmzZ3HjQNJ3yEuxqWs+8/Emi/cTXiX/Y8g1emjgb3S+nYUAiFjFwjTkwsTDhAWBGkzM+X1yg7E78659wsV/YCPMQL58fKMOKvGXS8ywUmGnxBDR2zlobRBKmCeTcz8qBOgdTMdeQe9/yovpWw7VNzinmUOQw+xxb0pP1NUN4wNDhq3g3IM3xMPs3SWXWnuWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N5gOLcKYjscG4PTnug/wB6VtleNHIZGoY5pOmXYMsQ=;
 b=fxgRzqRWfXLNdHY3/KdhYXWX7e5SSVdA1RCoyb0k7z+6DJv9Z4amXavA8Mk+vpp0x/ylm0kBoFwYUAiHWj8Uj+3ZFnZy+zGY1ptP/MSRBcczVj4+g4C3h//a/cdOTRZrNIPD1QGg3ruEAtm5fGp+R6ronwq8UyNypqoh4nJpynM+1h2/XhAvFpU7Me+2EctgzsEF7tzzUhXGjMEstJLq4Qev1HKgVyy2NU1gZj0iXZkqDzqfeCQDVcV99d3qMadnX1jsyjYgnqb7s5+jfGV6SrYRVCicvf93XlhpJYnn7ads0Rsk1mnltTJFonRvHnUy41JXfm1fX1wXs/q6K7jT9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bea) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 05:18:40 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 05:18:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 14:18:35 +0900
Message-Id: <DL8TWI24RH5Q.3HLILWI1D3YQC@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/31] gpu: nova-core: extract radix3 page table into
 its own module
References: <20260822015448.238214-1-jhubbard@nvidia.com>
 <20260822015448.238214-4-jhubbard@nvidia.com>
 <DL8R8THTD7T4.260VNQOBXRHJM@nvidia.com>
 <821c96ee-fab4-4dbb-96d2-b2446a38dade@nvidia.com>
In-Reply-To: <821c96ee-fab4-4dbb-96d2-b2446a38dade@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0281.jpnprd01.prod.outlook.com
 (2603:1096:604:259::17) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c5287d-30d6-4dad-b1d4-08df0c9f79f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|10070799003|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Wks2vslZOFSfhkibso39HMIJrX+hN4ggUQ9Rldx0MYtDI1nrchwvi5s6YF4G9Ln4Kr0NVssK8h9LRiPouQKqVbfzDBAat8T4UJFXCLo7jBqRG2BVEiUKdWKc/MiwgJ+bRg/Uj5z4l04YUUlhPl17sFTbMBVDM8EkoyjfZlrNiiKdIFwXIIYMQXgayN6XP8sd3uMDO8ScpfPvwD3RbJopdhf3TBNsmbCsWNSljGhC3wlVBYWtOXOKg24aNGbPIWtvM4ndLZE14mfc8/aKDQ3NeF/AA2+S4G/93BkBM88tDedA0CbT2rK8iqpYzeXR5PypxNAHnnFHe3MVVNzldw5mM4edytFZc16JrP70pro2PAZfjLaGJPWhPW3NsNhR/+ChKee1yjSBVlZdtlMTQo4zjMvmRjszscbjxyEOgyr5BpEkKstOM/GkpJHaPvkV7BUln1R5HkQKjKCAIOhYy7nKezG8NwsQtVZIgE18XxiIvDdCDb5bDKC7sGZIqp4IKPvGyTNySneFfq+KD9x9Hrt/W/2pqlvIsqbFekou2zn6+CmBspv7sb2HyBChZR2DMgSLwdXUGHRldfH+BAA0ZdHce5+pcOsoxCsmZpMfUavyCXMwO/vhtYPGbi/PHDT8jcxZI0ITrGNtmN8V3fOFFn7N/rWbX//lMPZTO60eiyqP96w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(10070799003)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRFK3ZBOWR1WHpxV3BhaTNnRmRWQzVDcVJjVHpYdnpkZCtNaWF5d211SVR4?=
 =?utf-8?B?NElibGN0WnRSSVNVdGxzOVd3UnBrbzg5MVNpZHNTTkFlZE1PaTJ3anpMQTVB?=
 =?utf-8?B?THZqaTU3WDg4bTNwSS9QMzNDQTEwclhOcmV3cGdTZk1oT05iZjJ4U0tLKzJs?=
 =?utf-8?B?T1kzaGVrMzZuejduVW8vN25vMUZrMkxCR1IrS2RhRVpoUlh3NmlrUFJKSGtK?=
 =?utf-8?B?NVllWWQ3SVN5ZkUya3BUTUJmUW9OSWFoSVNyZGg3Nm0reWIvTDF6ZHdXazVv?=
 =?utf-8?B?WkZWZ2pXbE9hbXVBSjFnejZUMVlzdG1CbStPaXNtT3dRVWVJYytPcklYN2k0?=
 =?utf-8?B?bW5MKzhsOWVNMElGV0NoNmFCMGJ3S3NZZjJzNjdrNVp1bHFnbmJZRUVzZXc4?=
 =?utf-8?B?TVQzMjZtWlZIVDMwYlQrckM2VGZrNU5GaWFWNzRyV0hWQTBRWGkrekpIdThE?=
 =?utf-8?B?Sk1FNVgvNGI4NkNudkkxV05nUlBuUzhjNE1SZTA2eTdKMXdMdXV4UXRSRXNF?=
 =?utf-8?B?ZjY5ZmpSbnZXaU9EQkVUK1V6b3dlNjFRTnZMMnJ3dHZwYytPa3lJUzlwM1E2?=
 =?utf-8?B?TkMrZGFqRkpiOS9kdjcxakpDTG5lbUp3dU9uZ01NalpGWmEvWW03MEZ5WXk2?=
 =?utf-8?B?RFVvTnJiQXNDZ0ZjNG5tT2c4TWxRU1hOTkRxTDZUMGRuV1ZTZ3BMcWlFYlQz?=
 =?utf-8?B?YStPZUc4c29wdm0yV1pkYktxRDQrT2k0Y1hDZG1CTURweUpuK3lKNzNORmd5?=
 =?utf-8?B?TFV4SlQ4RVNLVk54bEtlbnduWE04YTFaRUdCQUdPRERTaFVwa1pmMVNDSGlL?=
 =?utf-8?B?ME9qN3M2RnFSb0dPUUlua3RZakdjbUprZGFLYVdkU0x0RFRuS29ndnlaZk1p?=
 =?utf-8?B?eWRibFk1TGNJWFplSys0RHNWN0o4Szg2TFJtelVEeDRYVk1PSWdwM1VqMzVS?=
 =?utf-8?B?VCt5RTNrTG9WanZzKzVuYWtvN2VQQU5jbzJ1RktrYlZmdEU2bzlscEZyN0tr?=
 =?utf-8?B?U2lFZlRmUkhuTldRZ2tYQmo2UXB6NW56K091aEdkb3JjZ3dHRkxIMHRFdHBP?=
 =?utf-8?B?cG1pTldqaC9kWlFYaHJPRkpwa0dWak5ybSt3L2h0ZnNZa0Mya0VhN0pEdkd1?=
 =?utf-8?B?cnp0VzE3aFM1Vk5yRnl0Q2U3OGtsZ3ZmYTRBWXdHcGJlemM1eVVHUkN2Z0VR?=
 =?utf-8?B?KzF0VWdRQS9vYWdUcXBTZVl1ODVQNmtNSTR2c3pVSGJTdkhCVWRpa3ZJWVVX?=
 =?utf-8?B?SjdIVGJzZi9iMG1EdzBJZHo4V2l5Vkh2QTZpOS9JMVdUZCtGVTU4SG9RVW5Q?=
 =?utf-8?B?bUIvdmRTaEVEd3JRdlBEUm1OWEphVlAwMkNaQ2tvdXphVnZuaTNyQmF3eWty?=
 =?utf-8?B?ZGRrZ0drbVpYeDQzRWdlcUhBbkpQYkhvWGNERGYwV29PNFJzUitqZHJYOFpq?=
 =?utf-8?B?VE9iV2NWc01vSE1pMkpySEgrSDNOZmVwMGZ6QStYSWxUYy9DMGd1UmdBdlU3?=
 =?utf-8?B?RXFsOTdzeVlMNmhZRXhnT0ZMQnN1Z0hSY0UxYXdsL0dqeU4xZERrcER4T3Bx?=
 =?utf-8?B?UXZkY2xNYjNMT1Zlamp0OFFWL01oVmFoaUttbVl6NjduSlJwUm1FbkhKcGxV?=
 =?utf-8?B?ZXdDVVM2SmhYd0ticWttWFJQUlJkellZSUd5UjhtcEtGUW9ndXQwTUpFOGha?=
 =?utf-8?B?OXBjQWM5MFpBYTdkd29RdXhCNG42b2RMYjdKRkxRQzM3RDd0Yll4OUV0SVZK?=
 =?utf-8?B?Tk1WSzh1bmh2WVdhYk5haFlhY3NwaFlkc3RLTFR6b3V6U3p4UEtHaDBLc2Q3?=
 =?utf-8?B?MGc0dVNuVHBzdExTL2U4a0ovVWRzTmJhNUJBNVVlbk5iUzZQM20vbzJxRU1i?=
 =?utf-8?B?KytCSTZZZGp0TjFObUZLenFsK1dpOG9hcDF2a0UzZjR1QUJHZUF2VS9uNUN4?=
 =?utf-8?B?ZHNhNHVNZlhwV21DV3Fud3Y4d0JDVVdBbmdHckh2Q3JyUEs5YmlYTUJ6d3VU?=
 =?utf-8?B?ZnFKc3JZRk0xV2VQbGhiVkphY3ZoQ2hTMDd6b2FUWmhUMjNXWE5zc0YvcE5Z?=
 =?utf-8?B?QnBNMmtGMWlJVk5sNVRYSUthWVJibGw2L09DaFIrNllmNVZaRVFMTFNzdGI4?=
 =?utf-8?B?dlFKdklLU2pPRUt1U1BXanNZNEN4bUVNZmNMYU5lU1VOZXUwTXFzaUxFUE5E?=
 =?utf-8?B?Rjdsb2VlbmZSWGN4RXcvTFllck1HNXVSQkJJdTl4Qm83U2FLSmJwRlNtSnNy?=
 =?utf-8?B?TmJQWTFIVklYekZCZERSQmVPeUtLQjkwUkY0RlJmN3BjUkptbEg4M1VlOXM2?=
 =?utf-8?B?MWk4V1FtV1ExY0NPMHp0Qzk2R0F0NisvOFM4STRjOWNDVEpyTkNsNllWWXVF?=
 =?utf-8?Q?bstRZ0TCgaqbj30wQKcc/ahHihbZwX9CzoHtsWTh4zuAm?=
X-MS-Exchange-AntiSpam-MessageData-1: w7czP4nfUnbMew==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c5287d-30d6-4dad-b1d4-08df0c9f79f4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 05:18:39.7709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pArOSAIi4xcQPRhG/UOsWC8MiVgAF7/Lv3OGC648hfOyZDJaO7Bq+QYrhguLG71gONS6T4xfcLsuhh1ZNLksSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86

On Mon Sep 7, 2026 at 1:20 PM JST, John Hubbard wrote:
> On 9/6/26 8:13 PM, Alexandre Courbot wrote:
>> On Sat Aug 22, 2026 at 10:54 AM JST, John Hubbard wrote:
>> <...>
>> I was contemplating merging this patch early as it is a reasonable
>> change on its own, but unfortunately these two introduced (and unused
>> for now) members prevent me from doing so. They are also not related to
>> moving the Radix3 code around. Can you introduce them when they are
>> actually used?
>
> Sure.
>
>>=20
>> This would allow me to merge this one and patch 6 (which btw is
>> strangely not placed right after this one, with unrelated changes in
>> between) early and lighten the series a bit.
>>=20
>> I think patch 11 can also go in early, but I refrained from picking it
>> up now to spare you a conflict upon rebasing this series. Ideally this
>> one would also have been at the beginning of the series.
>
> Don't worry about conflicts, because lately I can resolve those pretty
> much automatically, with today's tools.

I do worry because today's tools tend to introduce churn when they meet
a speedbump. :')

>
> Should I sent a separate 2-patch series, with this patch merged in with
> patch 6, and patch 11, then? I also would like this series to be
> shorter, of course.

A separate series would be the shortest course, I think we could merge
it quickly in this case.

Let's keep the move to a new module and zero-padding as separate patches
though, it makes the history cleaner.
