Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664190;
	b=a3Xje78NXLk32G2jzMCuiZXWuYmr8Jkx0Yxd857CrLD15Dnf8yRvqIkSU83ss1Y6lIUu
	 jGADTw0UUvZdiWYH7Of/bKssJivCYJtwXlFGcTb4rJ70PGREarA3cIDtXnW8jotMbIKbg
	 cCwfqSAg1TWgiqEc4+qMxF9fe4HF85RptX/Sf+T7hdHGzu2q00K8erywMm9wxFtP4Ov5Q
	 Rj1CoTh7181wotWs+/htSyTgzYq5oyxnxc5G9I9nNeigMLp8Z06bfoI706tzfWlX1ksU9
	 FfUNIg/mC6FKUTAIaMPqyuLzCfoTaquJOE9GaKrsmvqUZqSAnDd/pOLeIidLgXEW9Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664190;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=TZNnv2tEvxJNhP42dcAGVJKzso9/GK4Txdd6P6d7WiQ=;
	b=lgbmlYeXMZtKgefcyMaESXEy+xBHOFCQtSWFCtkGF21mggFfJfY7s+HLSzN0VlFvyxKo
	 PbnS+vCzEHO+Xua4N1Rwfq4pl8C8MsIKxqf8rBRi9PQCDdZjoCgVdk5mY6XLHsTmRi0Oz
	 +FJZA8kmbSBdke5J08Nbf6UFIwRsq14vPBh+0yVLF3BnRI4maPS19hrzDdAQSzm32/SZp
	 XdmBGUfGqQHwtfPUxGs7B0557zTimsorSTFxLS7SJdjUMQmfx3T5pO3lPEsfK3IWazCum
	 OV2DBSuSDCHFSuYhc0V0EqSIAMTmGWpbpooLVQIXq6YltuM9cEkyi2wm4QFvF+oN7xA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YEqOsssA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.60
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA93606A333
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEA93606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YEqOsssA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg0g3yyVnPEFcVQuYCAOogtFoGKu2e1Tv+3iYAEfKnjdSRWuBvyDGxeT6CJE76X7TQ5Dtk2tJ40XEiHJkWNbH9TFm7DiijIzNLikSzc4r3L4s0aWbMxaMBjfjP7merZ7R4Y5UwdKm2qAtpORH8xe26W9Kt01jWZvrlsStrpovHR/8ytKa/4l5lJ9VHo/ltG+kDXSUwOFGgYHtDiWZfPGOSTb+s3CTyEcR/8z3pcWGoor7fUTnYiaifw2rN7rVoUkkGSTYovPkeXEgnZUkz11ubWExM2eb2WntfJ5t+2n26O8g20HOTKkwKVsQEXd36xX/KM0J4HsAJAreslsTptkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZNnv2tEvxJNhP42dcAGVJKzso9/GK4Txdd6P6d7WiQ=;
 b=K3DCphkRN4SuevQn31XAIJHgE1aLTmtNCE7OQzhh8MCfU3jOeYQJNpAS6NETY33i9LIFUpHKkjE8PxLIqFki0Py5o/t0FTEt1jPK/YfGSC2tokfgytXap6LyEkmCxs34jyomLXzwJH/H/ru8n3RaE3Hf+U46K7Bb7HruVCJ3YJIsq+3IudrWMzVHDi1mzGQfoYYcu+UsUBpShtD1/UJxlo+TlNzaLQpMhW5rMAV/Iq6ptGjs//RRw8VPqPncw0o01zUjrVC/Y09yq2iunhpLPzvhnEIm8IH2DD3JaEV7wf6WklJ5Rn+of3ACYbwICfwuLY5B2Y4WwubPshRIGXAJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZNnv2tEvxJNhP42dcAGVJKzso9/GK4Txdd6P6d7WiQ=;
 b=YEqOsssAqhTdQC4cFln1dIA3BNDTSZ9koaacou9t4X60IHiPhUlIQ4OdEiXo5tIfgf1gX/c2npArJ7lVPHr2/o1P+dJ59+sTZt3c6t2Y8LYj5Up8jiqOCLSjUjT/ma6thhgPcYVAqDhGfNt7poMlCmoNpg4Ng3UdORpY4wayBbqbjDoqYjTD4WZP1/XubplBekseqD5+IoOUuIK74VKsom+ghKQq50lmNGn1dlOWjqUqjGZ/cn63RXaOXaC0XZ2Xu3QL0k3fBa/qWZkJ+o+S/8SoGb3wPU8eHZI7KLyTYHRSnMJX0wPEGxDjKh26HE7rdLJtxCZzoiKxOYRY+dz02Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 00:03:04 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:03:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 09:02:51 +0900
Subject: [PATCH 1/4] gpu: nova-core: gsp: fw: add the r000 bindings for the
 GMC API header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000_rebase_on_cmdq-rpc-v1-1-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0278.jpnprd01.prod.outlook.com
 (2603:1096:604:259::6) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 779f4460-27ad-4e53-ad7d-08df393dd4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|261102130727099003|56012099006|11063799006|261022105027099003|261021121427099003|261026121527099003|261022115727099003|261026140227099003|261022075727099003|261022113327099003|261009223027099003|261028144727099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	QyTgsEMLbnoMmSrqdrLl7UkgHB4FxnqcClcgAPXCyl1adpxBo/lK1J1CwT9Sw5W5ZuVB73lhvyNdDss2TTErzijfOulkGZAV0CuRNdyG0n2X3fiH24DbN+SXLrrLGdHicwFJY/9828ZMV2gS0oZBLXRwsojZRqcz1LjmAZJYV5aFDiDxl4gCwh8EHkQYU987W2kxOMS/dt5CjWHlfSvZ/t/xNNj2PTMm8sG9dOwFNEg6MB5pfWDLUcXhq2w7pGvTvH3PafHZlP/XJoemZewl3KicQzO+mEg1LHp+PCVsIw/Ns60JSdAkb0IPSlA9a16A169xrJ2sUsj69VdJ7tNWmcx9LdU4aTRw81lfUi0X6dIXvJl0RqjoYBe3viyjpygtiH80JQWT6ahJIUpbHR5VdPmxyckYy67n5ocKEjUTWhiQYwEFt0C4u0z0I/JTmZMY0i1pHG9d4x0Hg/YV9TXw4oyQxYwmUTUkVesmcECl0COEHD9aesQ042lnByI4ngF+h6Wby+ksDDFDgOi33X3/q8FdeOjFNLe+tAJ+BrYkNzKorxrXZdR0uw3ZKZvzV5741VTm8iK900D9l5Ve2WI9KHADZPE/2ftuwItJlahUWV9KTk+nlaarqk/AlI2p4VTXLZVpFY3MX2WBvQwYGatGoY7VSbnIyDpmAhUkQPiVhLk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(261102130727099003)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026121527099003)(261022115727099003)(261026140227099003)(261022075727099003)(261022113327099003)(261009223027099003)(261028144727099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3Fla2xtbVMwbGRPR3ZQRWdyc0hxRjQrQUdBZ3laVDlsKzRGOTllQWoxbFlW?=
 =?utf-8?B?QjVHcVJtWnF5M09kalo3NW1JRjJzeTdqTDdBNHdvSU0yajJnL2JoQzdaVFAr?=
 =?utf-8?B?VGh3Sm1ESDVva25oMDZxOTgxV3EyWHpLRFpjdHBUZlJ4RWJ1K2FqeUgyZmFU?=
 =?utf-8?B?TmNjTEJ6OWN6T2w1clR1cGdGQjVsdVJlSDFLUlRzUjc0a2RkYTVObXhLR2tv?=
 =?utf-8?B?YmlyR2tBdFM5SGQ1RHQ5c0NYU3d3WTFId1ljc2FEaGIzQmlMbHMrclluSlpH?=
 =?utf-8?B?S1lCY1VpajViTE5aVCtrVU9HLzlYK0VjaVRVb2VvWm5VT2FrMk12aDZFMFp2?=
 =?utf-8?B?SlNySTM4d0U3c2tMNWo5TkMza1JZYVhNS1ZZeWltS0lzNmFWOXlLZUdrZlFR?=
 =?utf-8?B?cHdGTXNmZ0pBVmx6ODJVbG1WYU1hcExobm0vdXpxOGkvbk5vd2ZCWWZ3bVlJ?=
 =?utf-8?B?N1RwZnB5TWRFV3VrS2xEYkdFbTJ2L1BScXZSQkFkUWtOK0llT1YwU3pkaG8x?=
 =?utf-8?B?cHYyNjdjMkRVVlN0ODY2VkVXRWRwcnlJQVYyV2FLN1l5Z09UV3VvQjJJUll3?=
 =?utf-8?B?b3F6aW5HSmsxMjQxYVFyU3Q1bDZ4L0toaTM2UzFOWldacUxsTnpEYmh2dER3?=
 =?utf-8?B?c29DZjUxZHNiS1FDRVQ3Q0FDdlZJNFdTcDN3ZklaQXN1TmFxeWFiYzdDSnlw?=
 =?utf-8?B?bE9uQkN2QlB3NmJYVE9zS0RKNzdMS1J5Szh0NGU2d3kxemRrcStVeitqSHNi?=
 =?utf-8?B?UkFlSzVWWVJpTHNta2ZDZDdLaHZoWmRyR1M1WXdOS1dlNmRGQmxwZFMzai9a?=
 =?utf-8?B?cWpndTJFL2xaQ25vTjNGM3BBSW1VMVNNNVhxODJpNXBvd0M1VXdxU1Y1WlRt?=
 =?utf-8?B?VWJaU2tKZGY3cVJQdHRROHU2M3NyTDRHeWpkZVFuR1JYTy9OblB3b3JBNUFt?=
 =?utf-8?B?SmZSanp5bWNYQjlEQWtDa0FvSlRQWWFEbXJITlhqVGsrTFVMSkhwZS9FQzgr?=
 =?utf-8?B?UzRETFNPZVYwTmQzZG1tclBNZmNRaFVpb3kzL3R0WXp4Vk5QbysyOVR1VmVY?=
 =?utf-8?B?M0lQa3JJclcwNEd4RXh3Sk5TUmZYQmxXL3FpbXd3cmtIOVRlc25zdG94NEt4?=
 =?utf-8?B?RTN6SG1QaXNhQnpRSll1MXUvbTRZTUZhOTBma1BLeklHWHV1MVFLemFJbFpa?=
 =?utf-8?B?WnpWaTN3ZGU5c0FMa1ZHYU5MUm1iZHFlNzlkK2dJcE5Ya1ppNzh4cHpRTmoz?=
 =?utf-8?B?RGhrVk1DQnZuamJSWGZzUytTQzRZL3lvVlEySGlCbE95eTVha3NnL1VtYVdr?=
 =?utf-8?B?SFpURVFRTW95ZXEvRStPYUxSMnBVWVBiVmVVbktkQkx1SjNDNjZDSzhmU2dZ?=
 =?utf-8?B?NzlnTk43cWMyZGxRTDNIUS9waGM4T1UwYW5CT09wUEFaT0Fsb0RnUUJQQnVT?=
 =?utf-8?B?Y2RLOUl0MFJrMVRaVEJGWHhXek1VS3JjSkE2WDZpY1ltYy9xUjE1UFhzNkN1?=
 =?utf-8?B?Z3R0OUVFYVlNU0ozRkpEcUk0TWs0cjB4eGt4Q1FtZFg5VjdZc2dTaGgraWg4?=
 =?utf-8?B?TzJuTDdneEo2UFMrNGF4czA0NEJZcWh6eXRFUXgxSHpudFNUb3dEYTE0Z1RO?=
 =?utf-8?B?OSs3S0tTTjJ6VUsrZCtVVHlQVVdIQlB5MndMMElSbVZ6aWlJREZrWlJCU1lL?=
 =?utf-8?B?Mk1wZWlDSnFKajRodzhmdW9aVU5QTUxNUFFMaXJBTkdUbDhhTGNZbGtYcFl1?=
 =?utf-8?B?MzlPcHEwdnA3MGlobWNCUHorK2pITG5VVTZPYlhtbnRJMnpmVzdVZ2dZck1B?=
 =?utf-8?B?bVNydFBHRFo2Tnd4WVAzMGZ5bElPNkxRL2xCUGZZSmZOUk90MWNWVld6Zy9F?=
 =?utf-8?B?eExYc1B2VHNkOHFOTitsL1dlRXAxTWNIMlJKekp1N2ZIWUFxUDRoVjNwL1pJ?=
 =?utf-8?B?ejMrYWxvYVgrd0FmUkVRSnYxUXZ0djVmZG1zNzBoRzUva3E2c1VnanozcWVq?=
 =?utf-8?B?TlUvK0ZSN3gxS1dSUUJoeWVuRThmSXB4ZTFicDBYM0dTbkhhUWlQK1lpeVhU?=
 =?utf-8?B?ZTZjd0hJeitoZXRkck4vRStoWVZtSmVWc1RlUVd6Qm9xM0NDSDdqL3M2QU5D?=
 =?utf-8?B?SnlHYlNwYzY4YWtaRFVZOU5GQjh4bEhjbWF3ZWdzNkZnSCtEakZZUEVJV05W?=
 =?utf-8?B?SDBSUlBJcU84eEF4SFc4cVJGOUdoaUExWmRVbm03aUQxaDA2blV6amJvUm5C?=
 =?utf-8?B?UWVWYUNNRlFvWk5ubjBKaE1KR285SVlUbUNpNTBJMXg3TzlEN1VYUmNjdGZH?=
 =?utf-8?B?K1VVSFlUdXFDbGdialJ5YWd0WjlVUEZHNDl0UGs2NzVkT2hrYUlTWk14Z0xk?=
 =?utf-8?Q?WPSDg7ZEA2D3mnmhAZ+CZO5B0yM7gJzk5tY3lUmSXsPLU?=
X-MS-Exchange-AntiSpam-MessageData-1: aC/ze2yJX00J5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 779f4460-27ad-4e53-ad7d-08df393dd4fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:03:04.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nqtu+kGnaePNzUuFF6jaREFGuza0SNCG4eUWiBUbvNjHHYLZUGiTvTJTKy+mqAw5jbz9FqqMBzrxE1VBFGT15A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

From: John Hubbard <jhubbard@nvidia.com>

Nova-core boots the r570 GSP firmware, release 570.144. The GSP firmware
releases from r615 onward share one ABI, and their firmware files carry
no version number in their names, because each image records its version
internally. The driver calls that ABI "r000", so that its name does not
change with each release.

Add the first part of the bindings that bindgen generates from the r000
headers of OpenRM, the open-source NVIDIA kernel driver. The following
patch builds the GMC API header type on them, and the driver keeps
compiling against the r570 bindings until the patch that switches
firmware.

The headers are those of OpenRM release 615.71.09.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
[acourbot: split the bindings by the code that needs them, name the
 OpenRM release.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs                  |   1 +
 drivers/gpu/nova-core/gsp/fw/r000_00.rs          |  29 ++++++
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs | 110 +++++++++++++++++++++++
 3 files changed, 140 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index b2ddeb27984f..213ef5bfb258 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -2,6 +2,7 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 pub(crate) mod commands;
+mod r000_00;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00.rs b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
new file mode 100644
index 000000000000..0c32f4ec1e27
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bindings generated by `bindgen` from the r000 GSP firmware headers.
+//!
+//! Use them only through the parent module, which abstracts or re-exports the symbols that the
+//! driver needs.
+
+#![allow(
+    dead_code,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+use pin_init::MaybeZeroable;
+
+include!("r000_00/bindings.rs");
+
+// SAFETY: This type has a size of zero, so its inclusion into another type should not affect their
+// ability to implement `Zeroable`.
+unsafe impl<T> kernel::prelude::Zeroable for __IncompleteArrayField<T> {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
new file mode 100644
index 000000000000..552299c98169
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#[repr(C)]
+#[derive(Default)]
+pub struct __IncompleteArrayField<T>(::core::marker::PhantomData<T>, [T; 0]);
+impl<T> __IncompleteArrayField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __IncompleteArrayField(::core::marker::PhantomData, [])
+    }
+    #[inline]
+    pub fn as_ptr(&self) -> *const T {
+        self as *const _ as *const T
+    }
+    #[inline]
+    pub fn as_mut_ptr(&mut self) -> *mut T {
+        self as *mut _ as *mut T
+    }
+    #[inline]
+    pub unsafe fn as_slice(&self, len: usize) -> &[T] {
+        ::core::slice::from_raw_parts(self.as_ptr(), len)
+    }
+    #[inline]
+    pub unsafe fn as_mut_slice(&mut self, len: usize) -> &mut [T] {
+        ::core::slice::from_raw_parts_mut(self.as_mut_ptr(), len)
+    }
+}
+impl<T> ::core::fmt::Debug for __IncompleteArrayField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__IncompleteArrayField")
+    }
+}
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GMCAPI_HEADER {
+    pub command: u32_,
+    pub size: u32_,
+    pub sequence: u64_,
+    pub __bindgen_anon_1: GMCAPI_HEADER__bindgen_ty_1,
+    pub reserved: [u32_; 5usize],
+    pub data: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Copy, Clone, MaybeZeroable)]
+pub union GMCAPI_HEADER__bindgen_ty_1 {
+    pub request: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1,
+    pub response: GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1 {
+    pub max_response_size: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_2 {
+    pub status: u32_,
+}
+impl Default for GMCAPI_HEADER__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GMCAPI_HEADER {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_RESERVED_LAST: GMCAPI_COMMANDS = 65535;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT: GMCAPI_COMMANDS = 65537;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: GMCAPI_COMMANDS = 65538;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY: GMCAPI_COMMANDS = 65539;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND: GMCAPI_COMMANDS = 65540;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_GSP_RESUME_DONE: GMCAPI_COMMANDS = 65541;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ADD_VGPU_TYPE: GMCAPI_COMMANDS = 131073;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_SUPPORTED_VGPU_TYPES: GMCAPI_COMMANDS = 131074;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_CREATABLE_VGPU_TYPES: GMCAPI_COMMANDS = 131075;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_ASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131076;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_DEASSIGN_VGPU_TYPE: GMCAPI_COMMANDS = 131077;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_VGPU_PROPERTIES: GMCAPI_COMMANDS = 131078;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_QUERY_ASSIGNED_VF_VGPU_TYPE: GMCAPI_COMMANDS = 131079;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_BOOTLOAD_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131104;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK: GMCAPI_COMMANDS = 131105;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SHUTDOWN_GSP_VGPU_PLUGIN_TASK_COMPLETE: GMCAPI_COMMANDS =
+    131106;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_CLEANUP_GSP_VGPU_PLUGIN_RESOURCES: GMCAPI_COMMANDS = 131107;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_PLUGIN_TRIGGERED_EVENT: GMCAPI_COMMANDS = 131108;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_SCRUB_GUEST_FB: GMCAPI_COMMANDS = 131109;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_ALLOC_GSP_CEUTILS: GMCAPI_COMMANDS = 131110;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_VGPU_MGR_FREE_GSP_CEUTILS: GMCAPI_COMMANDS = 131111;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_SCHED_CONTROL: GMCAPI_COMMANDS = 196609;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED: GMCAPI_COMMANDS = 262145;
+pub const GMCAPI_COMMANDS_GMCAPI_CMD_INVALID: GMCAPI_COMMANDS = 4294967295;
+pub type GMCAPI_COMMANDS = ffi::c_uint;

-- 
2.56.0

