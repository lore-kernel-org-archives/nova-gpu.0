Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013058.outbound.protection.outlook.com [40.107.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54823B83E0;
	Tue,  2 Jun 2026 07:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387009; cv=fail; b=d5Gmg+xPH2e6XfgQjgpTP/FTlwMY/NoeCwC9hUKElwM7CCVtzyfXBb+xQA421CdvU4jZCykkKaXW5X8XJGE1MdevxUPGaSlTJ0CKcFswmZSJIozp87tc1Ab3poYhHIkNHo4npPTb4xgTWiQBFq/yXNDbCkyI9e/RWujmd4IoiQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387009; c=relaxed/simple;
	bh=QsZgxuRxgylYCaIgBQJGUO7u3/CWOjAfhoFhFhecr5w=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=BFBIJFyMGxMDSeH0mGzm2iAoV62HZXi/p3y+j1EpFq1Vj5okoMtJt8ceOngh+kmRkcQhw/4Lb7l/7qvCNpfSNofn7BtOmjIYLvz7gCFEuf8/Fp6nGoea2Piv8CBZCmgqZGBa28E9Fo/3M+LDXa8jS1po0ptd1YhI7JlwvSFnF7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=igIEn7bW; arc=fail smtp.client-ip=40.107.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="igIEn7bW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+6eN13O54IMiJg3hlB8sM2o9HLmNPMKcbcPunqIwfxbK+jhD1QWELRP8GZyV4uOkUoiCZYK8kj3LkMaEmJDQePsHs2aQc5LvWI6Pb9Jll4/uSSuS7AZHV/BPXIvjYVx6tf0avpJ+VNdhX+V7vkIDbj/0KHk1Xjbm26LknfmP2BbsXFTpsDOFSu1aniJq8a7qtzzzBj6JebZAxb8Of0h5s7Q8Gk7IeaUjOLDIkEjQ/yVaM4W8ceogZU5VaZ2G0AlV2fuDtqGxrWNqnOLSLSzZfrfpPKZXm4iNLZtLcWGW7eAFBUTW/D3VJ3EzBaifQCPo0ympYxm+JOQ31h9VwZXtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkM0CU7SG8WFdoJqo886ITV7nD6IW7X5NvKj6jADyqM=;
 b=dVc6VXaxF7xgIGsLAKbjmYkF9oliW1Q/17VarEV0POZ6bYxTeCWQL+lw6oHM1QTLDZld5yOfb/WZQMRKN0ug9X9S13jetsp3tB8W1z+18sX9HD7GQQMcOLk7HbYQGYrGrNzZiMLj3J/UxBhsDqfTk8qcEZCPrhK2NGPNJLUftpZppTXKlhfmufp0y1q4wPUUT3JN/jsja0NlDx8Ax5Mhc4eEgOu9/T+8Fjki2gFPNFpTgbSy/BQ7Gp5TQ5xHrYEgML4LQnrPOpN0wxHz09VwggZANeHiUXgxpR5tTHKzMaV31Ue++zufpI+g4+JXDV0lK/Q94lL0ZOGG3Lext0uOIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkM0CU7SG8WFdoJqo886ITV7nD6IW7X5NvKj6jADyqM=;
 b=igIEn7bWN1z++IP0cetUVWwvnhV1ETNbgvju6QRzkZgh1iPY+fQIjfN1NwF+Njwm44/vfCtWVLBKTICtY2JT/lLS3J05Nq5DAESAKg3YGMnrbzdrJYcoVs2Y3k1DUh91sN8oas9Mn2DrGgyQZRcavykZDE3s03wLioqq1IW2ZjBc9Y3jc7iK4v1U9U1y5ep0VnFvLTf4CYTtgQPqlpmUkhb1buLrNNaHoEnX/eM4QxVhrT3wOHPx7srtZ9hM0yY1hxzKYOHTROTmmuVY9M9fiZGOyKyjlkELOPoNFnfb8aGvp8kPipHG0qH9aYhSSfbiNMUMhqwjsLhD1khs00/41A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 07:56:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 07:56:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:56:37 +0900
Message-Id: <DIYEINL9REVG.3484XPOLDZ0KJ@nvidia.com>
Cc: <sashiko-reviews@lists.linux.dev>, "John Hubbard" <jhubbard@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Timur Tabi" <ttabi@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Benno Lossin"
 <lossin@kernel.org>, "David Airlie" <airlied@gmail.com>, "Trevor Gross"
 <tmgross@umich.edu>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Alistair Popple" <apopple@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>
Subject: Re: [PATCH v12 13/22] gpu: nova-core: Hopper/Blackwell: add FMC
 signature extraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: <sashiko-bot@kernel.org>
References: <20260602032111.224790-14-jhubbard@nvidia.com>
 <20260602033211.479711F00893@smtp.kernel.org>
In-Reply-To: <20260602033211.479711F00893@smtp.kernel.org>
X-ClientProxiedBy: TYCP286CA0274.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::10) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 9da42b11-595a-42b5-13c0-08dec07c7b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|7416014|376014|6133799003|4143699003|5023799004|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5lqDkjwWEvHQzUu/1B7rsJrUHJ/5hDyDGCo9+Ifq1Ri2awpMUXdl08J66PYALtT73y9PVuAMCikOkh4zulEhVAPWgCzF+jWKmQUR4xmrG43ZxFHExZJxf2BKF9Z8+qI8zKOAdLBiCwCmlhv/iSCNN6Xr1GvtQpWuQJGOEuINlLHZ8T3UTC2Uk2OHxr+UOVvqsL+MRcuS4wFlm1KnDE3q7nDZF8HvY8tlRb+wnOil5JtvjzQVFUop+qKVWr9IjPKVuec4Hij1OMFobJQb3YNP+fZw0tiu9TNdL98HQXDWpx0SwYO4PQG/qXMvzpAdCsGxKraaRa2d5Novh9TASMFsbb0FkYYjBlTNipJnUqMajdEcJo1/kSleIXhQV3gm6msuE0uAPKz3lPI1BqYNT4uV/8ZVrdgp81H65n/lE9/mJGl70bU9p6+gkSF4O6P4XqrSiB9GyhvSQPX8ohRTWYGnU6JulGep/fNRVEW8cwxPQpnmFj8CLVZspgok+r8/ybCoRa7tH/JwP048K4sD6YXTz88bdUwDtQH8uYKqEN2x5PnoaCqNbYeYrx/fkXHaM4PiyVClU9vCIjENDokuzZL/a5loHxjFpfwomhFn4OEGuQf7W8N0X4ZCL4/D5cjldRcIH+wpVWaHZuJXaAN32nof8AAQK4GhK/1ss/wulilCpSu2YfddKGck4Odky8KudAFa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(6133799003)(4143699003)(5023799004)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0VUZUJNSCtPMiszeHplbm9va3ZwRnhtZHBuR0dGU0pmZzFmaGFNU1VXaU1i?=
 =?utf-8?B?dVl2S1VZR25ISW5OT0c2RTREQ2hQSXFoNmVRQ0xIdFl0SFZOZDEraERTN0RW?=
 =?utf-8?B?aDkwblhkbHdIWC9FN1NiVkljcmJHdy9LbmJvcldEVk9IK0U2aEMzbFdRTGk5?=
 =?utf-8?B?WHpQcElUYnM5VGE4YkQyTFJvY2J1Q1BNdzQ1a0FXQ3o5ek53M2lPUlR5Mk95?=
 =?utf-8?B?QzhYZnhsbVI3TWdSbTNQQmY4SmdjZlB0dDg5V3ZaRDRnaWI0VlAxSzVvMFZM?=
 =?utf-8?B?ZUtyNnRacDBDL1ZFSkVVUDVWanVaTFVML0VvRUJFeU9YTy94TDNOQWVLL0ps?=
 =?utf-8?B?SVhzQXJ3Zk0veGpTRS9lbXVDTW1kOUQzZTVzQ3V2OHY2eUYrVEduaVZMYmkz?=
 =?utf-8?B?S1U1U3lHc0VCV1pLcXQ3U3FPL2Y2WnhSdmEzUGJuYk5iT3FFY0NDRGZLMzlL?=
 =?utf-8?B?RTFXeXIxeEQ0M2dGb1JxWUUrcFFBOGRsTzhrdlVCZXYyclNqdGNBOEVQSUFP?=
 =?utf-8?B?R2dNY0IyN3JWa29yQVV0OUs5d2dCOUlWNzZ4WElZMXV2K2lSRXkveEpQaE53?=
 =?utf-8?B?ZkhjcWZ6bFE3NUdPMThSTERWaFRuYkZTTFh4OGZnQ3lLTVhvS1Z4bU1SVDJk?=
 =?utf-8?B?azkycDVaV3U2Z0hQWGF2aHVRTXNJWFFHdVRQajd5eXF0Mlg5ZUNrNEZZa0VU?=
 =?utf-8?B?OEhxKy8venlSV3BFdlkrWGZmU2JHbEFWMjdtSlJ1OEFjZGI4bDY5VnpLMmZs?=
 =?utf-8?B?aERIeGNuV2s4MWN5UXhILzBneVBmc04wcGlqeEJnR3FGWU5mT2QwazExaW1Y?=
 =?utf-8?B?TWRBNTlaeWlWNHlGVHYrdjUvODJnQkxoaGlOSHp5c1JLWVl1QkhjeHBuQUMy?=
 =?utf-8?B?VFJQYktIZ0RCOWZmY2Y1RE5HYkgyR0ZLd1Ywb0hZN1VlSUhmUGF1d014czl4?=
 =?utf-8?B?K0VyYndhREZEdGlPR2dabjRoWC90c1g2NzU1aS9tNXB0N2ZFQWljMUJ2UlNN?=
 =?utf-8?B?b1MyY252dmJqZFdCOHVZRHl3bW1kV2xuMytWTk1lazlWSDJZMTdRbWREb2d2?=
 =?utf-8?B?MjNkN1Q2NERMN2d0SEh0SDVpTGlsWkt1Y0F2MWladnhGanZwUXpXUCtNL2Vr?=
 =?utf-8?B?MjJjaFNXRmp1UnlzYkpHQW51SHNyOTFVUGo4RXJieTIreXlobjNrdVI4VVdn?=
 =?utf-8?B?UUFWQWhsT1ljNE5MS0h3ZnFaUEFFNXVyQWpLWHpvTmwxTFZCU05Lbmd2eUFD?=
 =?utf-8?B?YWZBWWVFdVVuWklSRTZBN3NxZ09odHJoeHJtRi9sUTVLYmR0VktSaFlaYlkx?=
 =?utf-8?B?aFYvbTRCelVDeVJhK253VHIrSkF3UW1WbGdyQzZmdHQ5Z3UwVVBDRkN2K2s3?=
 =?utf-8?B?VnVNWE44ZlR3djI1Zyt5amRmN1IzMTBJRlA5cis1dW43MkdsNitVZGUyRXhn?=
 =?utf-8?B?cjVaK3IrcXhGVmw2Sm9KYWNzWXoxWXgrVjdsd01yTmFCbldOOFFFUjBDV0tn?=
 =?utf-8?B?STVQKzZRSHc0TXJwWXo4clJCZUJmUUcyYjNvZjl3MXNFMGFRUDJzYzZWOGFE?=
 =?utf-8?B?VGJmdUJ3RUZHSGFKaVZTVEFGYTFic0RTaWxMa0EwdWptNlBqc0xicmpZY29B?=
 =?utf-8?B?V0pEbU1CMjBrTUppVTFYK1dLVXh1a0J3c1N4RzI3b3k5TFJlbjNZT0c0ZUFE?=
 =?utf-8?B?aTZIZThRZ2o5RW44cUx3bGNYSTVYOHYrbHJ5NTQ2dFlBMEc4bXhSeS9JT0R0?=
 =?utf-8?B?Wk1LR0ZqWGwyeXZMTFhpbTRNelU4d05aeFZtcjJ2eFRXZDQvOFNENkxEcnZs?=
 =?utf-8?B?ZkZCY1lHSjFsdGlFUHkydWRxeG9WVnFWRlFTMHBlVW1nblBNTkdUMHJvb2xy?=
 =?utf-8?B?OWNoaWhaQmdtOHFRTEZ4UTUvQURUeEJhUWM2MUdPNUlMcXdldGxJOVd0Lzdp?=
 =?utf-8?B?aDhkU0ZrT25RVlpPa3BGOTZuK3hmRFlQOFhYdGxFc0ZpRWluMW5SV0Q5TmtF?=
 =?utf-8?B?dC9zWkdSWlAwb3UzU29MdURQR0tmdTAyNmVnTUIwTVR1UjMzOGhaaDhrS28w?=
 =?utf-8?B?cUxscW0yb0dPSm5mS1ZCYkVPVUVTNWw2azBpMnAxMUJwV1dZUW9VOVQ1T0I5?=
 =?utf-8?B?TjBsTVhFZVlRVFFtblY5VjdOOGVXYk1zMnZHWHIyVjBOM1dzSklqWktRbDQ1?=
 =?utf-8?B?SERBbUNFM2JIZ3FOVlpBbnFhSVNUTVNmVzFXQ3BHbFB3SExPcXB6QlBHKys2?=
 =?utf-8?B?K3poZDJCazhPQnhoVDFYeXpuNkFVNXBuSmpUSkFDUlAxbWV3NUc0UWpna21Z?=
 =?utf-8?B?NUk3UzBGT1lIT2N4OG9jNFkvS3dHSXAzSnVGaGEra0E2bE9WU1dCL2RXR3ZS?=
 =?utf-8?Q?lRa5XDVnM5kQTWLpFpyTqKnxM67xZL5upIx7BUh3xVnYA?=
X-MS-Exchange-AntiSpam-MessageData-1: 8dgPOGkisV9x5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9da42b11-595a-42b5-13c0-08dec07c7b99
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:56:42.3007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2Lzp5NLzS6oF+/k08++zDWvdfrdw8Hk/PDlU/riLCjK8wjz2VbzWXnFJX+69I/vLJCbQdizAP6p4dSAr947aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

On Tue Jun 2, 2026 at 12:32 PM JST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The patch uses `field: expr` instead of `field <- expr` inside=
 `init!`, violating Rust subsystem guidelines and defeating the goal of avo=
iding stack allocation.
> --
>
> commit 7149f8afdf16eef886b0d72d3c2139493024923e
> Author: John Hubbard <jhubbard@nvidia.com>
>
> gpu: nova-core: Hopper/Blackwell: add FMC signature extraction
>    =20
> This commit extracts the SHA-384 hash, RSA public key, and RSA signature
> from FMC ELF32 firmware sections. The signatures are stored in a
> heap-allocated structure used for FSP Chain of Trust verification.
>
>> diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-co=
re/firmware/fsp.rs
>> index 011be1e571c25..db61905eac9de 100644
>> --- a/drivers/gpu/nova-core/firmware/fsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/fsp.rs
>
> [ ... ]
>
>> @@ -41,7 +63,73 @@ pub(crate) fn new(
>> =20
>>          Ok(Self {
>>              fmc_image,
>> -            fmc_elf: fw,
>> +            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
>>          })
>>      }
>> +
>> +    /// Extract FMC firmware signatures for Chain of Trust verification=
.
>
> [ ... ]
>
>> +        // Initialize the signatures in place to avoid building the lar=
ge `FmcSignatures` on the
>> +        // stack, then fill each section from the firmware.
>> +        let signatures =3D KBox::init(
>> +            init!(FmcSignatures {
>> +                hash384: [0; _],
>> +                public_key: [0; _],
>> +                signature: [0; _],
>> +            })
>
> [Severity: Medium]
> Does this init! block allocate these arrays on the stack before moving th=
em=20
> to the heap?
>
> According to the Rust subsystem coding guidelines, fields that require in=
-place
> initialization should use the `field <- expr` syntax rather than `field: =
expr`.=20
>
> Because `hash384: [0; _]` and the other fields use the colon syntax, the
> arrays (which are up to 384 bytes each) might be evaluated as temporaries=
 on
> the stack, which defeats the goal mentioned in the comment above.
>
> Could these be updated to use the in-place initialization syntax, such as=
=20
> `hash384 <- kernel::init::zeroed()` or similar?

That's a good observation. One can also derive `Zeroable` on
`FmcSignatures` to simplify further:

--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -29,7 +29,7 @@
 /// Structure to hold FMC signatures.
 ///
 /// C representation is used because this type is used for communication w=
ith the FSP.
-#[derive(Debug, Clone, Copy)]
+#[derive(Debug, Clone, Copy, Zeroable)]
 #[repr(C)]
 pub(crate) struct FmcSignatures {
     pub(crate) hash384: [u8; FSP_HASH_SIZE],
@@ -113,12 +113,7 @@ fn extract_fmc_signatures(
         // Initialize the signatures in place to avoid building the large =
`FmcSignatures` on the
         // stack, then fill each section from the firmware.
         let signatures =3D KBox::init(
-            init!(FmcSignatures {
-                hash384: [0; _],
-                public_key: [0; _],
-                signature: [0; _],
-            })
-            .chain(|sigs| {
+            pin_init::init_zeroed::<FmcSignatures>().chain(|sigs| {
                 // PANIC: src and dst lengths are both FSP_HASH_SIZE (veri=
fied above).
                 sigs.hash384.copy_from_slice(hash_section);
                 // PANIC: dst is sliced to src.len(); src.len() <=3D FSP_P=
KEY_SIZE per `get_section`.

I will apply this chunk when pushing.
