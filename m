Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2E23392A
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 01:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225335; cv=fail; b=NRiLxX0+FOEpw1YhTAsv+4hPJQeyAx705Uf+n7mb9GR/Ts4mXbm1GUa3N5uX9kVECrNUxmYPypLXTGCELTKzBrK9Sex39ZHEugdK9x369u97b3ZoLyFrk9FbrIGNircP/CjidwexPEly9vasDLssiL/6JAB1XJqkEWX1A181sfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225335; c=relaxed/simple;
	bh=SR2rUkBHYIrl2gzUQlZnw/XMDfYRAOjpNFSACVfRY5o=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=lxCEbOYNsGzf1uV6jjLsM1CgHX43swp4CAZDzEJFqmYMGOFRVvkU1dIwEp1j6MhCnp7efApdB03NLMwW6FOooGzwJmeFdYTuABnQP5cd1t2w+L8ELPwdYfIZ5VBmCEb9lqe8gToUsV9kGKoRABHgJx7bSk/M9yVJEXF52s8V2/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bakaqo3S; arc=fail smtp.client-ip=52.101.56.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bakaqo3S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMuCPGgzARMF0vPNssztNUnbOsNIXFMaUEcEgZG8q5LbHdZXMZmapAx1Qe6SojvpIE4U4iNALMGN9l1dYOJhWD9sIvsCckjc/7vE+rk+Qe0tKL5FEQDHBVbrYec3GtpZkEYbFO//Q6m6N1vEdzciyn1S9OFHl/uhafKIlwFW53XGju9IHnNt10M2B1LOMsHYjaEgUodmVO9KOr0c8LevfTeUCl5RSINSrcasHdKwcN1Dt3/WA3h6fymSndwjwCfHOiiPWJjD2o+XXL5Bp85iHf9hQv79hBsnDfcBdoTIChx5TwCM1V30eRddTZlvuS6d5aRwOF+F2hwNDLCmoCbDAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qiOXn6u+CuH6Vxh9Ltx/42rrZoOGBf8VGO0EykKzHE=;
 b=FCriqZbb4ZMVtvZrnx1V1hKajMlbtBErf0RJV9VjN+79iggiKxKgJ3RaYX2KpGHKduv125elDwa8qAfBW7pXom3v6lL6O//fXqmQ5/DkdWeRIPFiw7Wge1ClQEuNiCUkrTa4dBjwwRHQBqsmRs+RgblRJKaEnGgae2NqtW/6jQ8A8dnoFTQtBA55bIKdpxXsb8ZsDqx8BUDAAgJkTCQV1E1Rt5DCqn1Wv7n2/QtR5jrXV2rWXQ8uAN1AHSdIJ3+B9avFNXJIGq7zxgkofmczUKqqL5lUsSftLR6bYx0pi2dhaE/Z1ysPMzyKHvB5NxzTPxNPZQF5Zp3cv1DIoCP+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qiOXn6u+CuH6Vxh9Ltx/42rrZoOGBf8VGO0EykKzHE=;
 b=bakaqo3SuhPr6n1FWXVR38EyCdzw2242v0R0b1Fh638IjZ+ppPurZMxVk4XwqaV8keBivrpl5JD5GpzqlXRkzf8ToILjjaZr2GMbsgY87Cn3rG0MG46dalzY+6XkiKKHk3g7SDONDzfcLVkaThOBtiChpO7fAI5H3fXNzzCh7HHTvYotx4wKTNmEbvuCAcr58SC7syJtYLq2IFbeUzgPHroFEbGIWIDvI0E1wFD+2Aye7wPtYWHs5k6fWxRafcc6FWl4m1Gzo1svRLy5RavZZCP4Hh2gKNCi7Vf2E8qTcUhWuCRgkZDC/ltENckFdmaLcSVfmkJdZ9vraoSezeQkbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by SA1PR12MB7224.namprd12.prod.outlook.com (2603:10b6:806:2bb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 01:15:24 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 01:15:24 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 10:15:20 +0900
Message-Id: <DL3KYZGCCPTV.17HP77N1O650J@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v2 05/15] gpu: nova-core: add the per-architecture GIN
 CPU interrupt HAL
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829012243.496697-6-jhubbard@nvidia.com>
In-Reply-To: <20260829012243.496697-6-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0062.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|SA1PR12MB7224:EE_
X-MS-Office365-Filtering-Correlation-Id: 75443ce1-0e01-4e6b-82e0-08df07c67f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|7416014|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3PO3/EBjrqFm2xG8zCbsmMHxwAQdfNsdI2sDUtxG7Z8KzICuoNL5+Oyx19iUAJ5XB85m+stls6iiTk6Ac4hGkGTbomGEVc3hEwtOy3eNe9fjjBDfKlZXO+Z8IkFv/wIHHH2V0RMgbjSdAyz6cW7vPI805O+wuT+vuR7EofhxqxwtnIpqsuqalBdCSWuGWwgmTUeDXNvtNYK6sDe47Zn3oSTruIE6+E05bzytzDl6Kl5EB2dj9fS/Qa4tcTUloIQnGIYVrMui4Tf/oygqcvPkO4ZR3YyxRzkR4zvLETZgSingwl5o5r54y3Qv15flR+wwcEw7I/2AYEWzvrk1gQUrsnEjg4443BbnqSzP4VKFo6ly1Ps6m5udu67jieYO2Fttb/dymDdyjgG8cRiuKuVRL+5/FsoximTnmdxGFptPOlHu/d8D0rTjafxjgkOrScTqVB5YfNoUKP/2eOwrtlCF87yqEnNglad2qCUALOnwGCVfMHGqb9MKKmguVb9GsRcxcKyWID1H87n/yuAHnWVMwafq2fhpcWQkGBzTDTnWfgZsZCsudyqD5p3mi77sackoAbs625KjtZaqk500XR4kuUQJ9DLNndq6SF6GWuh8p8I8atupeqXQ017kEdJFS52BZONqWAUKxVv9JppuonSyS9QaLEAsZcArYLLbwYtavWs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC95eUo3eGJuWGZIQnZxb3dwVE02NmIvL0hwQ1NVTzRZQ3RGdkJLTmh3RGhr?=
 =?utf-8?B?aDFUSXRubmJ6STVWRkg0QWMvVFhkOU1TdnJFZXFuTU5jSTFBdkZ3cWZyWmNO?=
 =?utf-8?B?TnVhRTRFdXVLcS83eXpUN1NXV0lTbTA4NTZ6aWIzcU1iaWhDdmV3d01tV0lB?=
 =?utf-8?B?MGNkN3hmWHI0SGpKTy9jRzRPYmdxek5FendXRXp5NGIzSEp2WEFSWENkSDI4?=
 =?utf-8?B?OE1QV1FQQXMrV2hleThlblN6Sy9kL1BLVHM3V0NDQkNxVTAxd044Wmx6Y2cz?=
 =?utf-8?B?cEhhMllhcnlLNFJ4SytjVlVwakxYOExoZ3J0MEJaSEJBa0w4cGRKUkVRbC9D?=
 =?utf-8?B?eWFhOGM3U0NFVWxNOEY1WnZnbHA2dkNXeWVoemhTZEVwbElrd1ZQbmUxZzg2?=
 =?utf-8?B?VGFtS0Z4azVqUUxXcmJhRXRDcFBYVE9YV0ZwNnYzSWJKZDNHSWU5b3pydDM1?=
 =?utf-8?B?VE41Rk9MMUx6WER1RnZreDFxYzhUUk9ibEppc3kzbVVvR0JnNllFcDQ0QXFQ?=
 =?utf-8?B?cUtXZ1kvUVh1WTZnUTJPSCsvL0RIT3VWdTZLdTJ3d1p3Y0VncXpDNXVNVFhs?=
 =?utf-8?B?ZlVMenVYK1ArdVp0ZFBkL0FnbEVRWUN2SUw5dElrek1OKzNRRTN3RWhqbzFz?=
 =?utf-8?B?dDFKU2xlalE0QlFFYUNvdzNRZUxhdVpHZ3YrUGtUL1lpOVdyMGIrVWY3WlBi?=
 =?utf-8?B?T01EVWs1Ynl6MnBmZDBINnU1bElSclBrU01haHdybGMvcHdwN21RK05Ed3Vq?=
 =?utf-8?B?Q2QxTVN4cHhka1JWVS92am54L2JuTnF3eUxkeGpqeHkycHM1RTRyYVZzRlVk?=
 =?utf-8?B?UERsVmJCR1lYdVFwYmxmNzVhVVBFTHBac1VLdGhOYmZmT1lhMmVDTC9LZlB1?=
 =?utf-8?B?enJyRy9keEdWVmpDQVV5U003NXBqY1gzZ2N0c1JtQ1dPaXdCSHZsRmFZTVE3?=
 =?utf-8?B?OURTb20rK1hIYVd0Y1ZhUWJ3ZHJEZEJ0dzM2L0Q2bk8rY1Y3VWRjbk1wbEZE?=
 =?utf-8?B?b1RRbHEyYUR3dnZjdmZjRUh1eVByc3E2dVUybW53WUFvSDI4UGVlMEcrbWph?=
 =?utf-8?B?U285SDVWNThlaHA1RVNmamZJajUwanp5QmgvaGVoaTNhbkhFZHlrMU5VL091?=
 =?utf-8?B?UW0wRWdJTk9WeVlzbVJwWU5NamFSQlRnRlc2KzFINkt1eUswRWJLTjQ1SGtS?=
 =?utf-8?B?S1JmR2FCNWlkK3lmbEMya0V1eUlqWm5CRHIyRll0cUR3a1dvd0xIVnZHR1FW?=
 =?utf-8?B?YStQSzBOV0xpKzY0OEVoS21JRDBLYzVQQkVscGV4dEN5ckRNZXlDSFFhMmFZ?=
 =?utf-8?B?aEp0cyt0SE1Mb2dJcnlJcDlFeURYby96MHYyWHUvV2JLNTJVMFdJTFNNS29R?=
 =?utf-8?B?Q1Frb0NJWEw3TlRjT2UvRVc0dGo3WmwvdHZOK1hUZnczUVcwN1BwVks0UEZu?=
 =?utf-8?B?cW1Nb2MyenAzZndyaTl1bkRDUm13N0UvL2J1LzdiZ0ZjS2tPcGNHMmVrK2Iy?=
 =?utf-8?B?OE1VN0phT0VzYkxZOEpQd0lOb0FsQUtIQzdkVm1wS2RaYmhoSWtzUkdlRjh6?=
 =?utf-8?B?eUlRaEVSZFhFU2ZpWm1ZRDJ3eHp2UTB2MHBhY1VQUWRuZThHYVBOd0R2WFlC?=
 =?utf-8?B?MjcrOGduQ0t0Rnp3cU91bk5YUkUxQ2lEWjVqNlVpaGVaZHpxZ3I1MWNQamIr?=
 =?utf-8?B?elh6cHdsdXpieXJJbFlEWHNHekhOV2F3bEpOWFN5amNVbkJCM1NsVDMzMXMz?=
 =?utf-8?B?dnliMlEvcDFaaktvV1hyaTRDeFBKcXV1N3lacFlhY2FjTzVhRTJrZjZpelcy?=
 =?utf-8?B?VTBtaCszUkFNVCtSejg2MjQ4Rk1SaFUvOUh5dXhpZXlWNi8zMEF3UFgwSFdj?=
 =?utf-8?B?QTJvWGdZUHZxQXhRZ2FmK3dWSkpCUVZqN3puSGNLQVNRNXBiaWZkQVI1N1N5?=
 =?utf-8?B?UEp3ZkxVKzhaU0NHdzhjLzNSZk1xdlRSdlJkS1JwZmovZ1F3N0dzOFBuL0dP?=
 =?utf-8?B?UUdYaWxXMmgxYzBhK1k0TDhlWmxwNG95YnJERDliMHZsZG1JQ25YeXA0YTQ5?=
 =?utf-8?B?Rm93V0VZWUU4cHFYU0RJemxlNEVmSVZ5NkFjSmdBVXV3c3VReXN5M1p4NkhZ?=
 =?utf-8?B?V3BBWHJwTzNaTExwVWNFcFVES2JqVW5Ia25VTkRoSzliQk5pa3I5U25CdFpj?=
 =?utf-8?B?ZVFCdmxZa1c1dmpBamlFQXM1U3h1VEhnYjB3QWtjamRTVXkxTlhMbXBFdjFT?=
 =?utf-8?B?RnV4TjBsSk5wVlk1Zm02SVNSZU5QRkNTR1daeTNOZ2FhVXU4UHFYTFVCbXd1?=
 =?utf-8?B?L25ZWkhqSnpGR1M2NFNxS0VNMnVKaE9iTGkvbDE5amhidnZjdzJGVkJSditu?=
 =?utf-8?Q?mb0OOIUog34FQ4scsz+5ano9BipU0vMUXFOVtyeegGhK3?=
X-MS-Exchange-AntiSpam-MessageData-1: L1AGa3VDFA7KHg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75443ce1-0e01-4e6b-82e0-08df07c67f7e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 01:15:24.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QorucoAKffZXSbk8U+wtz4KfZp0zza8FGy745x3cGadY/HPVqXhANbgW+ZZb0PPaF+avCgKB7lIVzT89MAgBsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7224

On Sat Aug 29, 2026 at 10:22 AM JST, John Hubbard wrote:
> GIN, the GPU Interrupt and Notification unit, is the GPU's interrupt
> controller. Each PCIe function has its own tree, whose leaf count
> depends on the GPU family.
>
> Message-signaled delivery stops after each edge until the CPU rearms it,
> and the rearm write differs by family and interrupt type:
>
>     * Pre-Hopper MSI writes an EOI through the BAR0 PCI configuration
>     space mirror.
>
>     * MSI for Hopper and later cycles the TOP enable bits of every
>     serviced subtree.
>
>     * MSI-X on any family cycles the bits of the handler's own subtree.

The indentation of this bullet list is a bit unconventional for a kernel
git log (`*` typically starts at column 1).

<...>
> +impl PciIrqRearmMethod {
> +    /// Performs this method's register write.
> +    ///
> +    /// `serviced` holds every subtree the driver services, and `subtree=
` is the one subtree the
> +    /// calling handler serves. Each method uses whichever of the two it=
s interrupt type delivers
> +    /// on, so both are required.
> +    pub(super) fn rearm(self, bar: Bar0<'_>, serviced: SubtreeSet, subtr=
ee: Subtree) {
> +        let subtrees =3D match self {
> +            // The written value is ignored, so any write rearms deliver=
y.
> +            Self::ConfigMirrorEoi =3D> {
> +                bar.write(regs::NV_XVE_CYA_2, 0u32.into());
> +                return;
> +            }
> +            Self::TopEnableCycleServiced =3D> serviced,
> +            Self::TopEnableCycleSubtree =3D> SubtreeSet::from(subtree),
> +        };
> +
> +        bar.write(
> +            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR,
> +            subtrees.into_raw().into(),
> +        );
> +        bar.write(
> +            regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET,
> +            subtrees.into_raw().into(),
> +        );

With the typed register fields in patch 3, these can become:

    bar.write_reg(
        regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR::zeroed().with=
_subtrees(subtrees),
    );
    bar.write_reg(
        regs::NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET::zeroed().with_s=
ubtrees(subtrees),
    );

> +    }
> +}
> +
> +/// Per-architecture properties of the GIN CPU interrupt tree.
> +///
> +/// The tree size and the method that rearms PCI interrupt delivery diff=
er by family. The tree
> +/// walk, the vector encoding, and the read-and-clear sequence do not, a=
nd are in generic code.

The last sentence sounds a bit self-evident and unneeded.

> +///
> +/// See `Documentation/gpu/nova/core/interrupts.rst`.
> +pub(super) trait CpuInterruptHal {
> +    /// Returns the number of leaves the CPU tree implements.
> +    ///
> +    /// [`LeafCount::subtree_set`] gives the subtrees behind them, and
> +    /// [`LeafCount::vector_count`] the vectors they carry.
> +    fn leaf_count(&self) -> LeafCount;
> +
> +    /// Returns the method that rearms PCI interrupt delivery for `irq_t=
ype`.
> +    ///
> +    /// `None` means that `irq_type` needs no rearm write. That is the c=
ase for `INTx`, which is
> +    /// level-triggered, and which nova-core does not allocate.
> +    fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRe=
armMethod>;
> +}
> +
> +/// Returns the [`CpuInterruptHal`] for `chipset`.
> +pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &'static dyn CpuInt=
erruptHal {
> +    match chipset.arch() {
> +        Architecture::Turing | Architecture::Ampere | Architecture::Ada =
=3D> tu102::TU102_HAL,
> +        Architecture::Hopper | Architecture::BlackwellGB10x | Architectu=
re::BlackwellGB20x =3D> {
> +            gh100::GH100_HAL
> +        }
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/irq/hal/gh100.rs b/drivers/gpu/nova-co=
re/irq/hal/gh100.rs
> new file mode 100644
> index 000000000000..32b9b4a01adb
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/hal/gh100.rs
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +use kernel::pci::IrqType;
> +
> +use super::{
> +    CpuInterruptHal,
> +    LeafCount,
> +    PciIrqRearmMethod, //
> +};
> +
> +/// GIN parameters for Hopper and Blackwell, which implement a 16-leaf C=
PU tree. Only 12 leaves
> +/// carry sources.
> +struct Gh100;
> +
> +impl CpuInterruptHal for Gh100 {
> +    fn leaf_count(&self) -> LeafCount {
> +        LeafCount::Sixteen
> +    }
> +
> +    fn pci_irq_rearm_method(&self, irq_type: IrqType) -> Option<PciIrqRe=
armMethod> {
> +        match irq_type {
> +            IrqType::Intx =3D> None,
> +            IrqType::Msi =3D> Some(PciIrqRearmMethod::TopEnableCycleServ=
iced),
> +            IrqType::MsiX =3D> Some(PciIrqRearmMethod::TopEnableCycleSub=
tree),
> +        }
> +    }

AFAIU we do not support INTx at all, right? In this case it just
shouldn't be handled here, and we could simplify this method to just
return `PciIrqRearmMethod`.

I suspect we are considering INTx because we work with the kernel's
`IrqType`, which includes it, and must make our match arms exhaustive.
Let's just use our own IRQ type for Nova:

    pub(crate) enum MsiType {
        Msi,
        MsiX,
    }

Then every instance of `IrqType` in the `irq` module can be replaced by
this one, and we don't need to care about INTx anymore. This method can
also just return a `PciIrqRearmMethod`.

You will probably need to include a `MsiType` into `SubtreeVectors` to
make its `irq_type` method work, but that's still better than having
code for managing an INTx variant that is dead code since it would have
failed at probe time anyway.
