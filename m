Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012071.outbound.protection.outlook.com [52.101.48.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90E370AF1
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973240; cv=fail; b=XOala4edJthcpUmAElLnnl+j6l/ZpceMuWCaCd7uahta3Pmu0TK46iKmtLm22ItbsX6YFhRREUAp5clcUaIPCztjo8pBgHU8xdpHDGn1YRmrP/4oIsQj2/24y5LyhUdnQtdX2WYfq7SSNdu4PFAEUCwZ6hlois9HO7xFWcei8dI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973240; c=relaxed/simple;
	bh=8iVdW5G+ct5xm+oZ3nH0LjvOhb7Um8zxygRQ8YIBdO8=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=Sd+knptcX3bYEFgkdTUWAEeoGN1W2p02O8kzb0FvppfJ0JnrTUFJuWwFjOFTCDOOYjaGF8snTL0R9lbMBYC4DubB5fQBI/qz/MJwNMPPCJ0eIXJ9qO+FcZ39jED2pE9cOg0xfDyIDBp8NqU2qehfXcBdaP6/V7POAdaW3aO3dwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ucP2sD0G; arc=fail smtp.client-ip=52.101.48.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ucP2sD0G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P47prQmZ2+ZiU6vjHJr6GmjPl1BGmc7fMwZkj1buwhBttPtI+didxRreTVe9WNbNfGA2wlszHFwyYhLiXh0YP6zI0fpA9E3nRi3RLfoe97M37fiYLS9c0gyudTFUBmVPwnwK4P0kBelgqwPtq5ryW9yYi8GwFNbThmbwZYBPMQi/MOPXCpxjXBlxhy2fC7dg0KN7kQa8VJ+rst6OQ2kNSSfGpS68WOEryzewkqQ19rx+aNNKpShBGjJO1LnKms8giR3+tx9WfaRoiP+8tQHZThLGjEKp4Kbje0w0gPOZtq9VZ+iN/3bmiQ+2WQYyUISVHfo26IfpZAq2J0SRqmiwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSDxmJ5GPholFBfu+RkFJ7gVnxtOGokE0xDkNmvNHE0=;
 b=nwxU459YS6xLnfF6prLDeO1rv+fk1UDGb5WBV5ZQMHp3rvwchyrzExNY+YY2MIPWxKT/IWllzkxGXkuC/xTA7jyG1Fxh+bExdZ79W/+6YBpRGTGjo6QoF9KxIB6ZYENXNeUWnFDurewu4arzi1FXLhCA33F3/LCoStZCHRUCb6zPoLA30cOHO8qFi9nOu2nepmZh+hM5rob9Ia8NZOmKQu6TvTNV/fmAQKvG7L64bIMqYY8sPMFVwvwYmqgongc7DTbGSrXevl69jKmBt9Nq8ba8Wm4ROhDgLmkQRkgJstTCJTZntTpJcHxNIMwTBavTRZBqVrgSGG/ChjUIqKrfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSDxmJ5GPholFBfu+RkFJ7gVnxtOGokE0xDkNmvNHE0=;
 b=ucP2sD0GyFQ81Yk/QTjqq2aP38rtcsp7q24sagevcfIqGxt47I6OMF8f8dba7Frw6oDRghe67U7jY/Vi2MzywDXrsJmwqnMxSsR/j2yy9jcwwROVUdTdOPmlNKs74lxn97Bhf4OvawTcf7JQ+n6n0qdsWzk8QO/hnuo0i3NYOQzbudiVH6wkIwNhWQMn1ynjyYVrNmR/XU1uzhUJO4yr6kXdIbYK3yveJpQ3J7PUtQ6Hb5OR5Jx1HYEysaSboFAfVz8HP8yOcO3FEbjQFIkaRyucphOgU26dWB1iwoWAO9iMzy5wyLNRsAPho9aB9+8j/ydiFOKk3MSkMz9fGJTfPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS5PPFA3734E4BA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:47:08 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:47:08 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:47:04 +0900
Message-Id: <DLKSJVIXKYR9.1JVN5EFQ5FUOC@nvidia.com>
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
Subject: Re: [PATCH v4 16/17] gpu: nova-core: add KUnit tests for the
 interrupt tree and HALs
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-17-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-17-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS5PPFA3734E4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: ef47dcc8-8b58-48b9-5c32-08df17ac27ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|23010399003|11063799006|5023799004|56012099006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t/8MjJwzwuV0b9HWMxRfhy9jihX7A73oQnPD/NB3wGtvM+b0YTjEzO7dzwKOWeLps1RyTO6ce+ul+wvJRxNqkmD0IqCS6oFj5Sjr4t0LxN22I/U0v9vZCkTgtS60FkcRPhA6ZdRYX9myqV0EAsPMbkcEAyaYy8sjhsGxASKWFSTPHg0t2rJGsFe+6Y1qlBXsfZ/7BQ0Y2JA3MqpbIfU5tXg4Twd2KhzCKFayYS2npWykYaHfluysb57rYGzWDiPIvZw6DaMu57VzpEC0a8k5eY2AISZEtzAHhUFTnoAzCNiPNLjq4tzyvUi4mZPD4lVEQZFy1QXJDoG/YnZFIm85LMB4fISyXjnHP7laqJe6NpYQjiKmWHt5fB6Xm8fKbdxxG882JI1pvlzERwBkZAv9waofTi63RM+Sj8fc0nP75T2Y7bBLMslslQHlI4n5zV50eRf2HrCOnOnvjxRrYvFE0iS8dq67SkkpUvMfycA9PBPLruElYNVa8eQ/My7IN37+NMh4GE+VIpVwWpFVZ/fAHPHKlC0n1v6M5G2fpyO6CWLa9OYDf1+P+OUsFnJ/4YxJy7w4jtlACXMxPZs+gUJ/tZIXMA+W+gwuS/Rn7R5ylakj4daWqkY3k1/MshPCilLETBsNN/EVpRse2OW+BnJUt9G7axLN0wfBETbwlZJQE2M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW1jSkIweE92M1FWUDJQM3ZNOTNPOTdSdUR3UUlUbURVOEtHZnRXaGp0czhI?=
 =?utf-8?B?V0I4SkFrWUhvYTUyVDFZZ3RlTEF1UkRyLys1Ujk2L2UyQ01HcU80NCt2aldw?=
 =?utf-8?B?QW9pdE9saUN3dlVMYjZObEtUYTVaUlA1QWovR0NwN1Z4dStPWlhYRTA5Rldh?=
 =?utf-8?B?R0xoa0VTaU1jeDJlcndXdnBCOUVmZ2ZrME9TWGJ1MXpSRGNLQXhoaTZlVHpT?=
 =?utf-8?B?d1NDWVAxOEhZMUlSdjhhN2Rod3hFNjhBVlJVcnhFY0xHcktIV2pKTGlDK0Jm?=
 =?utf-8?B?dXBncWFNWVE0bjJTRm54ejRBR2xDSUxBbnJ0M2J6TEZOcDIza3I2TUxxdi9M?=
 =?utf-8?B?ZXJvSXFrK2ZEa1RpYUttWkoreE1vQ3JCWlpnMlVOSStkbXdWa3BhdVFVbTlH?=
 =?utf-8?B?RWpERkZPbHNqWkh2WTY4R2dMOWMwMisvRlN4T2x5S2hvS0ZwS1hQWnJoLzlo?=
 =?utf-8?B?Zm1mSWRYMEV6Y08xQXN3NDEvV2lCcW1NQUsvOHZvR2E3bG0veUowQ2ZVV1pE?=
 =?utf-8?B?eVk5S2R5cmt3bGZRSXIvdk1pL3VFQ0h4VERTZmxaczBRdzQwQ1FsSEhaRnFq?=
 =?utf-8?B?YXI5Uk5UUWQxb1c3bVBVL3ljMjlVYWV5OElydklJcEhGNGZCNWdQeTRiTGFw?=
 =?utf-8?B?WXVqY1grVnFmaWJreEpkYzNVbUJralBtZ1J1TTg4MitKRVh2QzdhNGhWRjdC?=
 =?utf-8?B?d3VJR0ZBZ2M0OFdLd3ZCci81b2toRkU2OFFNRTFHZTdVTUQ3TkJUSG10N1Vz?=
 =?utf-8?B?UmxNR3ZJYXpuK3dFaFdjL3ZTay9Wd2xaa3ZNSXRZc3MwU2p6SEJGcmlPN0tm?=
 =?utf-8?B?YXZLSWZpUDdhR1RBS2VqMXNIRFRrdzlZUC9UQVVBMW9EODdqN2toa29PTGtY?=
 =?utf-8?B?cXhva0N5NHpLbFRLd2kwaEs2ZFNBWmNXR0hPb1U1S3JXMnY2cUd5NE8rWEVm?=
 =?utf-8?B?REZNK1RaZEl5aHVHTnpwb0F2VUxaWHdFOStaU1d6MDJLbTdjTEpvbE1pUG9x?=
 =?utf-8?B?WWFxUEdCREtGSjhVaDZIUlE3ZEZRUFJ6SkhkNW5GRDQ1bUZxL1lzdG14TkVV?=
 =?utf-8?B?RlJObzIrOXFGUXV6KzcweEQ0WDdIcWQ1WVRoeFc1a09BV2NTVmNCd2hKVElK?=
 =?utf-8?B?a2FLMktHU2dQV1hBWDhRNVNtZlNmMnhsNFYyUzRkblJYZWlsa2E0cmJWVkd0?=
 =?utf-8?B?Q0lnbGdQMEhzRzltQTJ3b3I2YmQ1bjk2YmIxR1R1VDBuL2RBcGJBYUxDQTJF?=
 =?utf-8?B?ZWd2a0pocWp2T2pqQkkzdk9JSzJEYi9pMTZwalhDdUxGYmlMTDFMNm8wQmMy?=
 =?utf-8?B?VEdMM1dFZU1WVEhoYWw3ME9iVG5CbWJTSWJmSk1BMVUrcG1xWmEzN3M1OXpY?=
 =?utf-8?B?SUlHYW1hMzQxWG9QTW91bXJoYy9zS2ZrRUZoc0tZQTYyb0JZMTlDWUFXMFhv?=
 =?utf-8?B?WlBWa1RnQXRTQ0xsSlVJN0FUTWpDTmNPSHJyYWM0djVSQnJpcVVqdjdnaGJp?=
 =?utf-8?B?bFdpUFBaNkdxU3pyR0RwZkFIQUw4cVdUOEFWRkhMcWMvTjBoWDBmYVZBWmw3?=
 =?utf-8?B?QUVLWFV6TytnUFpKVXd3UkdYUzBUK2l2d1Bnam1qZzNYUGd4ejE1Vm1SUXRj?=
 =?utf-8?B?RmFaN050Z0NITG0yRDh3N0oxdkcyZzNXK2dyd0Y2Zk1HOEl1cVI0M0FaMXA0?=
 =?utf-8?B?TGhOV1JydXZudWpoeWhKVFlwOEV5SU9UZFZEWjg2eGxnV0tRRERsZXN3a2ls?=
 =?utf-8?B?WDNha1VQZXpTMWZFRzlOVlN1cmh4Vi91SU1jTm5WVVJnSERQQzRxc2cvczJI?=
 =?utf-8?B?dkgxcXVpWGVxY3NIazJHRXlZR0ZEbDJjcy9xZWppNE8vUnU0Y3ZHNmt3NExo?=
 =?utf-8?B?U2xBMkNBajJmaG1HVnVCWUE3M2RuN2grMThlMHBVdGgzZ0gwOGFjbmxzbnFz?=
 =?utf-8?B?UzRRMzF4T1Fia3VNUUkvQ3JkVDZMYXprVDMvNmJsTVUrdVhCZ3hha2xKUG9E?=
 =?utf-8?B?L0NIVTE1akE0VDNxbm5JZ3BEd042bE1YS1o2VitwTHNFZ2hvWThuUEdaWmRG?=
 =?utf-8?B?OGx2N2o5YkpXY29ydTA1UEJxUmtTU0Q1NzNGK3oraHFzUWREbU1INi9qbmtK?=
 =?utf-8?B?M2I2NFozdTdCUzBENWUrU0p1T2RtNUIrNUNBZGhqb3MvL29HSk5sUHdQSXJJ?=
 =?utf-8?B?dlhaYkk1QnAwb1Z0U3d1VWNtYlVBb3UwbzBRbG1tdzlUOXVLUnQ0MmJ2Nm50?=
 =?utf-8?B?elplZ2ZzTkErRW1lSmtSQVd1UXVMcG9jZlZvbjN6VjhSemRQUFR5Wk12SEdu?=
 =?utf-8?B?ajZXdHgvZ3MreUlidjBPK0FxUklEQzdIYVFFOXV2VG9ZRnArclNpTSs4QnZL?=
 =?utf-8?Q?q+ntL1gCIh0dBnt82J6ztywxCCa5sxcAHHl3DYbaCWUYL?=
X-MS-Exchange-AntiSpam-MessageData-1: hEQdrAYcoQqocw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef47dcc8-8b58-48b9-5c32-08df17ac27ba
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:47:07.9452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdI7sGg1IaAMhRkZE4niSUs5S1ns3WcHGCJMrhNjCpd+QTtutHCnEldtZTM2G4UaMf88fzTac87Ojr0gTTQJtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA3734E4BA

On Sat Sep 12, 2026 at 5:43 AM BST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 3f1f509eccbd..70bddcaf4266 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -171,3 +171,51 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
> =20
>      Ok(hal)
>  }
> +
> +#[kunit_tests(nova_core_falcon_hal)]
> +mod tests {
> +    use super::*;
> +
> +    /// Turing falcons have no retrigger register. GA100 and every later=
 chipset have it.
> +    #[test]
> +    fn intr_retrigger_gate_per_arch() {
> +        for chipset in [Chipset::TU102, Chipset::TU116] {
> +            assert!(!falcon_intr_hal(chipset).has_intr_retrigger());
> +        }
> +
> +        for chipset in [
> +            Chipset::GA100,
> +            Chipset::GA102,
> +            Chipset::AD102,
> +            Chipset::GH100,
> +            Chipset::GB100,
> +            Chipset::GB202,
> +        ] {
> +            assert!(falcon_intr_hal(chipset).has_intr_retrigger());
> +        }
> +    }
> +
> +    /// The RISC-V routing offsets change at GA102, so GA100 still uses =
the Turing ones.
> +    #[test]
> +    fn riscv_routing_offsets_split_at_ga102() {
> +        for chipset in [Chipset::TU102, Chipset::TU116, Chipset::GA100] =
{
> +            assert_eq!(
> +                falcon_intr_hal(chipset).riscv_routing(),
> +                RiscvRouting::Tu102
> +            );
> +        }
> +
> +        for chipset in [
> +            Chipset::GA102,
> +            Chipset::AD102,
> +            Chipset::GH100,
> +            Chipset::GB100,
> +            Chipset::GB202,
> +        ] {
> +            assert_eq!(
> +                falcon_intr_hal(chipset).riscv_routing(),
> +                RiscvRouting::Ga102
> +            );
> +        }
> +    }

Unfortunately these tests will happily keep passing it we add an
architecture and forget to update the test. And anyway I think we want
to remove `RiscvRouting`, so that leaves us with nothing to test
against.

Which is honestly not much of a problem, since all these tests do it
checking that we did not make a mistake when assigning the HAL of each
chipset. Unit tests are more to ensure that some algorithm performs as
expected, here it's basically a low-value typo check. I think we can do
without such tests.

> +}
> diff --git a/drivers/gpu/nova-core/irq/hal.rs b/drivers/gpu/nova-core/irq=
/hal.rs
> index ede9a10ccda6..03852918013d 100644
> --- a/drivers/gpu/nova-core/irq/hal.rs
> +++ b/drivers/gpu/nova-core/irq/hal.rs
> @@ -88,3 +88,67 @@ pub(super) fn cpu_interrupt_hal(chipset: Chipset) -> &=
'static dyn CpuInterruptHa
>          }
>      }
>  }
> +
> +#[kunit_tests(nova_core_gin_hal)]
> +mod tests {
> +    use super::*;
> +
> +    use crate::gpu::Chipset;
> +
> +    /// Turing through Ada implement an 8-leaf tree.
> +    #[test]
> +    fn pre_hopper_tree_size() {
> +        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] =
{
> +            assert_eq!(cpu_interrupt_hal(chipset).leaf_count(), LeafCoun=
t::Eight);
> +        }
> +    }
> +
> +    /// Hopper and later implement a 16-leaf tree.
> +    #[test]
> +    fn hopper_plus_tree_size() {
> +        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] =
{
> +            assert_eq!(cpu_interrupt_hal(chipset).leaf_count(), LeafCoun=
t::Sixteen);
> +        }
> +    }

Same here, these two tests should be merged into one so we can catch the
case where we add a new architecture and overlook updating the test. But
here again I question their usefulness since they only restate something
that is already clearly laid out in the code.

> +
> +    /// MSI rearms through the configuration-space mirror only before Ho=
pper. Hopper and later
> +    /// cycle the `TOP` enables of every serviced subtree.
> +    #[test]
> +    fn msi_rearm_method_per_arch() {
> +        for chipset in [Chipset::TU102, Chipset::GA102, Chipset::AD102] =
{
> +            let hal =3D cpu_interrupt_hal(chipset);
> +            assert_eq!(
> +                hal.pci_irq_rearm_method(MsiType::Msi),
> +                PciIrqRearmMethod::ConfigMirrorEoi
> +            );
> +        }
> +
> +        for chipset in [Chipset::GH100, Chipset::GB100, Chipset::GB202] =
{
> +            let hal =3D cpu_interrupt_hal(chipset);
> +            assert_eq!(
> +                hal.pci_irq_rearm_method(MsiType::Msi),
> +                PciIrqRearmMethod::TopEnableCycleServiced
> +            );
> +        }
> +    }
> +
> +    /// MSI-X rearms one subtree on every architecture, since each subtr=
ee has its own table
> +    /// entry.
> +    #[test]
> +    fn msix_rearms_one_subtree_on_every_arch() {
> +        for chipset in [
> +            Chipset::TU102,
> +            Chipset::GA102,
> +            Chipset::AD102,
> +            Chipset::GH100,
> +            Chipset::GB100,
> +            Chipset::GB202,
> +        ] {
> +            let hal =3D cpu_interrupt_hal(chipset);
> +            assert_eq!(
> +                hal.pci_irq_rearm_method(MsiType::MsiX),
> +                PciIrqRearmMethod::TopEnableCycleSubtree
> +            );
> +        }
> +    }

Same issue here. The rest of the tests look like they are actually
testing functionality, so they are ok to keep.
