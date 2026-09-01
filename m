Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AC83C37A2
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 12:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267177; cv=fail; b=nAHuHOev5i6adYdzniX58eTk5jmAEQp9yvF4aYkWGb/NDY54EPLU2mhRTzhjgpzlegTv9wtZoJXDMGMJCJsxi3Deo5d/0GWZYrnRYR/H2Y4Nr7HariBBt2Tup5VxiAvH4BmmADq9uBvnlP1XIeZTiXDXOJ9FlNA0Ne/FaBDn/vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267177; c=relaxed/simple;
	bh=GXBAcNlT4mOlMD2S4Y7+vQOjfD1eT+TmVH59CCtB+aY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=lofoONOTM7c1lt0Aj/YMXyZ7jk/Dt5le3+TtXuFd5Oe+7DuTB4czfsFXTs7BAwLdA8QTT2mxazmF7crYTbxKAAbr7mZBvLXuOxQj298iXrsBqdIcqeDiUAwtsT3zVseky2Aea3GMlBAI0kKYJIODqfOQgdIlV875obKdl0OhfVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bADf32pE; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bADf32pE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXJUuqp0m6fdzvkjUW5+ytc5oj32A/5GjT+2yxkLUrtt24Sc/GU/3aGdge3wWBiEQmzgwIj5bwRgvyzT/NqvtyOmi87N4o58Vy6etgUpLUcL89wsWTo6m0gybggIPygF1fnjt61zpXf91x1mnsnchHRYT3h81I55PxCQ4vqoAsx/VgD/L05lqmvtRBtNwx+LgGytXpSZbSRJFcnJtsQ7/WgMTkD4089sbdf+zRGSC8E4rOg/1FmrWSAEf/PPq5W9txTCtYdTVJLXGY5sK+P17YwHywDCfDgmUQzisOBF7Y8kM6LMWXfGFxRKQCNSzTX3aVOk9g8MwRRsrkl/5smcBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fV3csMwr1HiVUJksAvl75Nm0TzcpWAc7v2dAvkCiOAk=;
 b=KMGIBEB9gkLxVCCfZWnhMFqzRQDGkyCRjkZP+oiQTi3+zd+3IetEwTmG24OwkD36EJ3Y6gnDKWj+Wnf12DZ2Cnriuc2FYgCVmtA+wiy8GjkjorMtuIlg+qMJkKvR+vKjcC0heKj+oMg4/5NpQ72PrkYtldnqpqx8jrbJnqwa0XpxwXPGvbJEV3IVQFun1wl0Mbppk2L3D1y3nexSkYhFXzAGFd6iit7mo4bVeAFXjmu5NZc0dRBWktcUePIbJmC2OhJ/JO8D85tYpRtk0gV5TalOtXX2G9J5Ur+PdagTtt0H9ffPRV+4V4BgTHgi3Af8fN+rk+KSiWD84shdpexTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fV3csMwr1HiVUJksAvl75Nm0TzcpWAc7v2dAvkCiOAk=;
 b=bADf32pEpHKc6F7666zVHK3iZRjYspw5bqTxXRS+ld0BgXKrta6XXdQdy2JFdMBeJV2JKLuHIwO3USz/LXR+ah8Xxa/3kngpA7hsM6aHcpI1Ytabxl+wnVxX3oqFu1WgKF3tIFGj6QruI2++SIeWTmCU2kY1kRlwuF1j2//NRXFbzTL0zfTnYo2S7ptTPi3zdix6Y3Zkw54cyqehaz52VzjM1OztrMeb4M5ccF7nrnFFrE8YTNeFWtiAEYAhsQT0eaZYfTr9c8i5d1UThqNgLk0GqA/lUkJbcyuvOdAojpvrzCsbkMhwKxhIyV2dvgs2u4hLBJALT3H6W3UKprLuGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 12:52:43 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 12:52:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 21:52:40 +0900
Message-Id: <DL3ZSWCKKSL5.20683BF1VO79K@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v2 07/15] gpu: nova-core: add an interrupt delivery
 self-test
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-12-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-12-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::7) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 8706f22f-9116-4ab7-545f-08df0827e9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|10070799003|366016|10067099003|11063799006|56012099006|4143699003|5023799004|6133799003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xUjLrie5KHWwKGqIEBBNRzt17IxQtrZjkartZidc1Bo4tRtNkZ3QWlz8+rU/MXc+tAlrTKjokug6IlFJDAbiULrityFJLmABACLVD57Uhf2OYbrfnzqx4CDp+SFJT/krJseLtpqkrxRCfZtaABfmpHKbDewOceSVEfw12xPjXLcLHCAxsxqYbPL3MmC7q1QlAYQkTWEzS6af41x5bJFOtQVlTfW6lohO6QM4aYM7xFy2j1xvJBy835Jo2ikAigWu8TW3jqcZiSl7J2GanfqSsuxwSspHe2SMVogzoHPxOnF6mG4IIucaynQsztSPw/8cn34dkw0tCxgFUzQaNwN9oV9AylhAmUwSHCL0hEfEdbxADWRRXiFOWrzGVVoV5bjd2OGMEiWAtI5T4Z8jzLmLhkwJQ5xTY+yHNcuFibsUY/P+aPseRdtyEShajRnqvJPG7FoWZF/PFpbNmHt+NA5NT9g5pG6BQg4eM1jlcg2TUV8/kBfviFoemd+2EW/6XQm5Y8PAunbNKRTYKGBjHdfY682TLC2QPP9KxtWYlF12qWjVgXl5efntfj2dJPjjz/PJ56VavQAcJsHao6NenZmaQFA6ovZ/1MEC7RQclCO3tzqnh0qeOrjnKnrsNT8Z8CrdPlE9hCeOP0Mc6dPtPECa4hP6uCALoON1yc3FtZ1VNgQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(10070799003)(366016)(10067099003)(11063799006)(56012099006)(4143699003)(5023799004)(6133799003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFlzS2MvMUpoN3NnSTBLcW9mbndLanNhN09EczlNRmJ1bnlGeTJ4NG5oYUhM?=
 =?utf-8?B?YlZxem5JQXdldlVFSm1oU0ppSkFMOVg2bm45MnJMdDFKaUNCYnR5SE43V0pK?=
 =?utf-8?B?RW1DKzJQZUhnSWVGT3N5V2R5VHdXZE8vNnkzaXVEZ09yRHU2bVJNNExwcVFl?=
 =?utf-8?B?bDVITDg4dnFaYXJPNWcxaWlCVUdFYlQ2SFV1SEs5Y3hNY1o5dkE0Ny90M05j?=
 =?utf-8?B?QzZLU2toanI0Rnl6aHU0eWJlWUFKNFFmZGlOSnZjUmFFUFQ0SDNadk1qNHRL?=
 =?utf-8?B?Z3BWOXBBNHF0QWpOVU84NDRsdGtoVHBSY1NIWjVERW5RNjJDcWpwdmxkOVNh?=
 =?utf-8?B?WWtuSmlySGZFeGdoNXFXQ3kzOFB3TTNSQ2hnb3dOeEVGZU5tTWw3a1NpeWt0?=
 =?utf-8?B?b0p4WUh2N2gzdjhoSHdzRGVWMUlld0l0Y3NlSTF2S3dURVdqejNsZU8zU2tZ?=
 =?utf-8?B?OVN6OFJJUkY4bUo5VDN2cjNnbk9ITWpzTkRHNjRSSHlYdHlwTmgwcTUxU1lh?=
 =?utf-8?B?Z2lPM25kcFhDK3V6M2VlWWtVU3RFMWt4bldTN1M3elB5aStJcWRBaGlvT3g4?=
 =?utf-8?B?OXc5b25yc0VKdTdGZzB1MGIzclZzTGJITmVkQmtKRWhPZWJKSFA3L1JCMmhX?=
 =?utf-8?B?c0djc0IrTlBBU2F0Z3diQXdWWXZ0b1RkK2dKSmdhZTZsclZzYlNkdXNlaTND?=
 =?utf-8?B?akRUYXhOV0QvQXEzTjRTejVRSkk2UnZWMWE1RDltcEVjMFVDL016Y3UzWUVj?=
 =?utf-8?B?SDdVemozdCtncW82T3hWcTlwenRoZkx5QURadWNCdmlId2hPQ0F3d1MzUG94?=
 =?utf-8?B?SER1UlFUOHVHRnAvcE1HQWlUL1VIL0dPSzkzSjNjVi9XSHVkUkY2K0hSd1VE?=
 =?utf-8?B?bXYwbWdLOFhoV2FFNnZLU0JXWVJjTVBjc250aFpKTWFGN3FnN09oRUp3cHlN?=
 =?utf-8?B?ZlZQWlMwTGpyd2RyZytHWUtTZHVtSWplVk9LbDIrZU5KcnJyUnI5RGQwcHZM?=
 =?utf-8?B?WXZacnp5VlBxU3hzYkpMOHNFU2JEdmlDdnUzRXRCbTFCSkl2bGxvOEF1ajNU?=
 =?utf-8?B?TUhmU3FycVNscmxxSGdqcWNHWDlTZlppc0g1c09QOVBNNlVYRW1TLy83K0VR?=
 =?utf-8?B?K3ozYzVQYWlHV2d4Zko5WUR6UFNJTmVjRkM3bEx4MTB0ZCtuNjFQc3pHYzVn?=
 =?utf-8?B?YnZRRURodUZodUFVNmtKRHJ3K2MyeDg2aGxjb1VEMDlMd2tCUE5EUDduSWxV?=
 =?utf-8?B?ckJLWCthVWljUERTSzRXT1FaL29kbTJsRlQwOUxLSDJQTVdlN2hYbEpsOG05?=
 =?utf-8?B?LzdUdy9SSnR4VE9ZYnA3UVAvc0xNeFM5YitONW5PcEMzRk0wRGpNbEdYYlJ5?=
 =?utf-8?B?R3UxK2huOFNYYTlhak8wdXVNTU1VdTNGYXBWYk1aQWgyUjRZUWF5Smd5Rnpp?=
 =?utf-8?B?cEJBZlloTEhHcFRkWjJ2bzA1Z2xZL2NNa1ViSkprL0poeVlpeGg3YUtJUHdQ?=
 =?utf-8?B?UXUwZ3BHTWJldXBnNFhGMUR5U0RFYi8yNDE5WnpJM01rcmNlM1JPbkdlQk9i?=
 =?utf-8?B?UWtzT2l1aWM4T1ZMVEpnMGtyL2hhQXFxMkVFOE1SZDhsd3JVV0NMYkZYdVJw?=
 =?utf-8?B?eTRrdTdmWWJiSFpoc2V5anU5SGI0ZTBmdUFzUVQ4TWtraVZLMWRNWS9uQmhv?=
 =?utf-8?B?MFNkbElTWjdGd251YzVRU1cxZG03VWFJNXJIczVOQTAySnV4ZnY4S2dJdDZN?=
 =?utf-8?B?WGM1dU5WYTFSWlRsY0JKYVlCbUNsK1ZkdU96cjB3RUV6RkErYWVFd2pGa2VZ?=
 =?utf-8?B?REpzVjdCNXFScWx6d3FKOEcya0NSUXBJYmY2N2JJZU02S1N6d1pFMVNKb2cw?=
 =?utf-8?B?QWZUUXh2WVdXZWt2dWh1T0pTSUJIUjdNVE80d3oweTh1MnNOWXpmbmdlWk16?=
 =?utf-8?B?ODJaQ0xEK3NoUlNTdUZNUm9Gc1IrdkthQUtqOHJIM3dHbmJKYk1WWXZ4QmZu?=
 =?utf-8?B?a3JORmRTUEExbll5STA5M1BCcUdmOVJrQzFrbE1HYTVLWDRGVE9EV0F0cXpM?=
 =?utf-8?B?ODcram1VMWs4UVpvQWdrWVdhRjhSMEJPMDl5bWNrWnVYOFYyeUJQUGl0cGds?=
 =?utf-8?B?UDJYanU3U3MzUVVYSjRBd2R6ZEsrcWpaN0VwVEt6aldwRzNQbEtyWGYzUVV3?=
 =?utf-8?B?ZzNuNmJpb0NObzhsR0R4bmxlclNuTzRVdUR3TkxSWVRlM1pHd21FWTJjU21w?=
 =?utf-8?B?VlBFaFE1WEhOMWgwVzMxYSt4c3dyd2p3b3VvWnpQUDNZK1pWbi9HZm95TUEv?=
 =?utf-8?B?VSt0VnNSRXN2aDlsdHJEMFA2dE51RmErR21WaXphb2tlZHBDa2JGV2hvMkcz?=
 =?utf-8?Q?7todH3FLQT/UqJUmbr5xjN+iqnnZeUxgvH2MtMtG1r1fQ?=
X-MS-Exchange-AntiSpam-MessageData-1: Od4KoPk0lkNNpw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8706f22f-9116-4ab7-545f-08df0827e9e0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 12:52:43.3502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +x/mRH6JoLDwKxZaUhudSYTe8v3NA8EOeYIvzmKQcw4GwREXlOZncdyjWRCW3Wu3RC56BgbGnclAbE//ebHEUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> A GPU interrupt can be lost in the MSI or MSI-X allocation, in the GIN
> tree's enable bits, or in the rearm. Every one of those failures looks
> the same to the driver: no interrupt arrives, and nothing in the symptom
> says which one broke.
>
> Add an optional probe-time self-test that injects the CPU doorbell
> through the GIN software trigger. One injection would pass even with a
> broken rearm, because the first message-signaled interrupt arrives
> whether the driver rearms or not. The test injects twice, and waits for
> the first handler to rearm before it injects again.
>
> Run it before GSP boot on a quiesced tree, and fail probe unless exactly
> two deliveries arrive, each delivery finds only the doorbell pending,
> and the leaf ends clear. Under MSI-X the injected subtree has its own
> table entry, so the delivery exercises that entry too.
>
> Assisted-by: Cursor:claude-opus-5
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/Kconfig               |  15 +
>  drivers/gpu/nova-core/gpu.rs                |   8 +
>  drivers/gpu/nova-core/irq.rs                |   2 +
>  drivers/gpu/nova-core/irq/doorbell_test.rs  | 294 ++++++++++++++++++++
>  drivers/gpu/nova-core/irq/interrupt_tree.rs |  73 +++--

The whole edit of `interrupt_tree.rs` changes or removes code that has
been added in the previous patch, and looks like churn that can be
squashed into patch 6, or am I missing something? I've tried squashing
it and things build just fine, so unless there is a good reason not to,
let's squash. It also makes this patch cleaner as it really only adds
the test.

<...>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index c6bf1dbacabe..37dea5abf833 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -8,6 +8,8 @@
>  //!
>  //! See `Documentation/gpu/nova/core/interrupts.rst`.
> =20
> +#[cfg(CONFIG_NOVA_CORE_IRQ_SELFTEST)]
> +pub(crate) mod doorbell_test;
>  mod hal;
>  mod interrupt_tree;
>  mod regs;
> diff --git a/drivers/gpu/nova-core/irq/doorbell_test.rs b/drivers/gpu/nov=
a-core/irq/doorbell_test.rs
> new file mode 100644
> index 000000000000..3fd8b26e135e
> --- /dev/null
> +++ b/drivers/gpu/nova-core/irq/doorbell_test.rs
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Interrupt delivery self-test, driven through the CPU doorbell vector=
.
> +//!
> +//! Exercises the whole PCI interrupt path (GPU to PCIe to CPU to handle=
r) with no GSP dependency:
> +//! it injects a known vector through the GIN software trigger and confi=
rms the handler runs. Two
> +//! interrupts are triggered one at a time, which also covers the rearm =
that every delivery after
> +//! the first depends on. Gated behind `CONFIG_NOVA_CORE_IRQ_SELFTEST` a=
nd run before GSP boot, so
> +//! it never observes or clears GSP interrupt state.
> +//!
> +//! See `Documentation/gpu/nova/core/interrupts.rst`.
> +
> +use core::pin::Pin;
> +
> +use kernel::{
> +    device::Bound,
> +    irq,
> +    pci,
> +    prelude::*,
> +    sync::{
> +        atomic::{
> +            Atomic,
> +            Relaxed, //
> +        },
> +        Completion, //
> +    },
> +    time, //
> +};
> +
> +use super::interrupt_tree::{
> +    GinVector,
> +    LeafEnableGuard,
> +    LeafMask,
> +    Subtree,
> +    TopEnableGuard,
> +    Tree, //
> +};

supernit: missing empty line.

<...>
> +/// Runs the interrupt delivery self-test.
> +///
> +/// Quiesces the interrupt tree, registers a temporary handler, and inje=
cts the doorbell vector
> +/// through the GIN software trigger twice, one delivery at a time. This=
 validates the PCI
> +/// interrupt path from GIN to the ISR without GSP firmware, including t=
he rearm without which only
> +/// the first interrupt would arrive. The handler, its IRQ registration,=
 and all tree state are
> +/// torn down before this returns.
> +///
> +/// # Errors
> +///
> +/// `EIO` if the doorbell is already pending before the test, if the del=
ivery count is not two, if
> +/// the doorbell bit is still set once the source is stopped, or if eith=
er delivery found a pending
> +/// bit other than the doorbell. `ETIMEDOUT` if either delivery does not=
 arrive within the timeout.
> +pub(crate) fn run_selftest<'a>(
> +    pdev: &'a pci::Device<Bound>,
> +    bar: Bar0<'a>,
> +    chipset: Chipset,
> +) -> Result {
> +    // The allocated interrupt type decides how the handler rearms deliv=
ery, so the vectors are
> +    // allocated before the tree is built.
> +    let vectors =3D super::alloc_vectors(pdev, DOORBELL_SUBTREE.into())?=
;
> +    let request =3D vectors.request_for(DOORBELL_SUBTREE)?;
> +    let irq_type =3D vectors.irq_type();
> +    let tree =3D Tree::new(bar, chipset, irq_type, DOORBELL_SUBTREE.into=
());
> +    let doorbell =3D DOORBELL_VECTOR.leaf_index();
> +    let doorbell_mask =3D DOORBELL_VECTOR.leaf_mask();
> +
> +    // Under MSI-X the subtree index is also the table entry the deliver=
y arrives on, so a pass
> +    // shows that the per-subtree routing works. Under MSI every subtree=
 shares one entry.
> +    dev_info!(
> +        pdev.as_ref(),
> +        "interrupt self-test: starting on vector {}, subtree {}, with {:=
?}\n",
> +        DOORBELL_VECTOR.into_raw(),
> +        DOORBELL_SUBTREE.index(),
> +        irq_type,
> +    );
> +
> +    // No delivery may reach the CPU before a handler is registered. `dr=
ain` enables the top level
> +    // as the last step of its cycle, so disable it again afterward.
> +    tree.disable_leaf(doorbell, doorbell_mask);
> +    tree.drain();
> +    tree.disable_top();

How about making `drain` *not* call `reenable_top()` in the end, and
making it the responsibility of the caller to reenable the tree if they
need so? This would remove this unneeded flip-flop which looks like a
tiny race condition.

Also, shouldn't we call `disable_all_leaves()` to make sure no
potentially spurious vector remains enabled? Otherwise the mask test
would fail, IIUC.

(bonus point: `disable_all_leaves` gets a user and doesn't need to be
marked `dead_code` anymore.)

<...>
> @@ -251,6 +275,10 @@ fn subtree_leaves(index: u32) -> impl Iterator<Item =
=3D LeafIndex> {
>  }
> =20
>  /// The GIN CPU interrupt tree for a single PCIe function.
> +///
> +/// Copying one is copying a borrowed BAR pointer and three small values=
, which an interrupt
> +/// handler needs so that it owns a tree of its own.
> +#[derive(Clone, Copy)]

Mmm I'm not very comfortable with having several copies of `Tree`
concurrently accessing the registers. I've managed to remove that derive
directive, and thankfully the solution is simple: after you pass the
`Tree` to the `DoorbellTestHandler`, just access it through
`reg.handler().tree` to build the `SelfTestResources`:

    let resources =3D SelftestResources {
        _leaf_guard: reg
            .handler()
            .tree
            .enable_leaf_guarded(doorbell, doorbell_mask),
        _top_guard: reg.handler().tree.enable_top_guarded(),
        reg,
    };

(notice how `reg` is now initialized last)

Then right after you have `handler` and can access it through
`handler.tree`.

That way there is only one copy of `Tree` and we avoid potential future
footguns.
