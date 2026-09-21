Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575013749E2
	for <nova-gpu@lists.linux.dev>; Mon, 21 Sep 2026 06:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973224; cv=fail; b=JxncKe5Wj6XTjjyUxmSF7RVbxKkX/InFWyOJ7VIx44i/JALftQ2mCD42oVBbZJpSXoQNkkYnfEigPQFW5u4L44CbIqxm2+Ij8PQ0sQVtCOopf+4rREfIuy0PDpIVLYzz95JsiD/ZGLch/4h3wvbLcjGPXfwwDlnkczf4kQc11qY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973224; c=relaxed/simple;
	bh=vKAhp6+rC7zfRaDg7swfMCXVXumAatk3vjRpd6Zx3Qs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=EakEbbozkk+CJqp+7Jivm6VgTswmjS5yqX1C5rxrXQ7UCT5kVShDAG1nUx1pQaH3fPwpDVp+ErZ9WplvIlrNyjIfa8wbCjI42iFhQenQaLau3G6mpnRTJshkUfZYiv6e/dmbDVb8GFQaS85BRZS0UqXhOj6HcKl728flI6hvP9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SkUfxIj9; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SkUfxIj9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WoXDSCepuG+RPk1F6BJ9y/6GpNYRaOsf9LwuvyBQLyV9uy85UawvDgZoqb/HZqv0l35cjQN6mHupja6sC+bg9X6lftJpQln8Of/sGINozhNV/pEhF2H9MOfg/n4eXvLIBybfmoOt7BJjFrxLZG3LMBpJdJo6uPre8lv71wQp+SlRyV52Y6nQNkDPGEBXdWqRjcPgeFf5VzyIoCPc+zc01nK3JREP3VSuGOZ4/VwaWWUGtsQvdcV+vpAkVaq02JJrQb11fEo/LRUDpRtBFX27XmEtbKi92eowZL7Dj7wJwSIz4OqJzZNgXUBBnpr2HyCawtF2rZLWIGH1fZ/ixMhtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNfuU+ol8E9voGPn92XtBfqZCH/oeWo0EflqM7nSbFI=;
 b=tmH+plZB7dbfONI91dqPHxunek7e/T28mJNUPEY380ZSIIcowgdzrotD6Ay0RRpxlXZV5vcQN40Zmdcguwe4qi0NYp6jUNgTVvOcpclcE1D7Z98dFwx/j1NRF1lv5BpyjiaFuN7FseAnjC2XFsbjU5VAYQUKA/Zmplw5R9ktPrJRclHoN88mEaHctQvu65mkP+qPQfLLxBzlypLCBTOMqOFQZa53CsvveVxCGKser1HSQUzJtugE11nH1gBpak2HghLQZhsio/nXX51mpTBFgukZ6ad6416HxQE2Z/aiJWwSPRL7fM279dqOwrJl3JHZ07SlCGiofgs+hDg6//ss+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNfuU+ol8E9voGPn92XtBfqZCH/oeWo0EflqM7nSbFI=;
 b=SkUfxIj9vj2zTg7yQXaAyXyNDmEGtZpOo6nAOn6AJpnXUQtfYLDE0Mq50EunjcuaJgq8jiN5o8XsT1bgmRcwVZlZ840h8L/XuPPLKli6LlEAuDlSk6jiWS+gWfUlokr9eH1SZjIMnPLvQ2xSWHcRMj9wBm2yIRyrx+XtJsUDEtMsI+lBagEcbi60tmaZj2rx96iQkt5SdYLANr6vrTn9XEYW5GiKsdQOXfDzUDiNg0xQy9roKIpTYAjI8gbGVXzwg12rgtIu1JHszDgro6JD1C6LBmVtr7JyGacGznXH1u4UTVo3ktoJ4p7q8rU6UX4nmrRg07FJ087GHYQBCZL5xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS5PPFA3734E4BA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:46:52 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:46:52 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 15:46:49 +0900
Message-Id: <DLKSJOFH2EZ1.21JRCSY7IY1ZP@nvidia.com>
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
Subject: Re: [PATCH v4 15/17] gpu: nova-core: service GSP events from the
 SWGEN0 interrupt
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260912044400.677097-1-jhubbard@nvidia.com>
 <20260912044400.677097-16-jhubbard@nvidia.com>
In-Reply-To: <20260912044400.677097-16-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0217.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS5PPFA3734E4BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aaf0739-d4e9-45de-8bac-08df17ac1e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|7416014|23010399003|11063799006|5023799004|56012099006|4143699003|7136999003|10067099003|6133799003|22082099003|18002099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	aTtLf+HVEqwV+0KkfUhFb5zrAeQj/uRhHZri2+SPKvImvC6rKP2BLEKkYLUfRKFZ9OBFR9HqUDDE5tyescm9KzYVgtUnWZnZMc0u1Fyy8jbsR/q2EaHmviqIetr5RmFzBtKqj/mwZl7fanel2vp+mdmJffHEAI1XPVtQIQdZdNWYewYeUnYs5rn7YPRT0qdyXr4wmj5Y5o0w/Pb+UityRebkV9c8QIV885UR3rXjJyxN6cmRaQTR27as2XaCtBz8zvb371wp5HG6l3NQzu7armyBBiIkQTZ3S7WALLhFtXKnRVhQsqhW6QnhHPPPa8HixIfVnBjTBSIOkrZ9VZj/mrYH8N2JBPwmtmsOXG5TaCaqg13OfQyL4kc5sx7Fj/k3IpiZt+Ohoj8sxY7FwYq1vVbAlCldqCzoyUb9C/LvsGoZ4AwoH7hSdwMxOftQ+SLXaJI+qxz5/vtpTbvuFuSkum4wyM87h/fchGGYU3eawH2RjTql6ji1QdlHlUiy9DjHaa4q9s2R23txmHLTne3iBQJqxklSCL95ivU0vrgRCo1GCVEqFmuEPlnLiXXf5/VxRyoOyYO3XJJUMjKoPe/yhF/fj1xaKgf4LfpGFj25JqRCKVgT5m5ZOD7v21dVDxRbrunFtGp5Gl+I7ACqpTCQO7m7+coYOWczFpW8D/DxzX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(23010399003)(11063799006)(5023799004)(56012099006)(4143699003)(7136999003)(10067099003)(6133799003)(22082099003)(18002099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3dWb1BtMUJ3a1VUa1RPeGMzZXVrVWhnUVhNOGlIVkZsZ0ZBLzNhTU9ObkJN?=
 =?utf-8?B?ODNuVUR3WFd3OEF5SnNBVkdON3l1dkxzeExBQllmLzZPNWltekZoK1VUTndk?=
 =?utf-8?B?Qmg5dTFadVdaSkFtcEtuV2JTS0krM05VbGloK0FucHg2eUl6ZzQwajVlaytw?=
 =?utf-8?B?L0NwZ05TRjY3MU5URnJrYXdXZlY2QTBPS3NHLzNNNExCbW1yUkhKMUNNMjBl?=
 =?utf-8?B?ZjM3eUZuaU5Id0Y3Ymkyb0FPQ1FiYWNUazVwU2NPSDB6cGFYT0R0aWlwV3Nv?=
 =?utf-8?B?WnBFOHpLZ1FQSW1sNWdQQ1kyc1IxdjBEMUVmK0l1REduU0c2ZEhtNitteG5X?=
 =?utf-8?B?bE0waE91dUtKelp4OTFkcElFRDFYYWdOS0EreWZzQmdzV3kyQVgrQmRFZkZl?=
 =?utf-8?B?VmRlajZjYWFseFVFdmp6dUJzaTYzVUtHeWlNdXJoZm9sSE9BdTQ3a2czd3Az?=
 =?utf-8?B?eXdqSERRNmVQQWZnNWJwVTlNQnFsaDJ1am81dENkdnoveS8wY0s1RVo0c2JF?=
 =?utf-8?B?WFRVa2hWTm9iSGtaSXZOcDJuSTZ6MFJxVm5QS29uT083THdaZkg3K3ZhYzhS?=
 =?utf-8?B?L0x3S2NjZjI5Q0ZsM3Q5N0FkNlh1aU1ZdEhpeUpoSG5VcWtadWlXckM0ZFF3?=
 =?utf-8?B?RXFsSXVyNlg4dk91UXNTOTRzVXBMTFQ0YUVRSnhPUzd5ZlQ2aXRLdnppZ3k1?=
 =?utf-8?B?NTJuVHpaOVJnUlI0M3ROYjdGakl5Wmg4SWtXNzdGZmtacWZldGV2b2RML3hp?=
 =?utf-8?B?MDd6Mi9yU1RHd3ZRMVMvN0tvODdTV0t2NjNQc3ZtVCtob2QzWEo0ek0yZnNB?=
 =?utf-8?B?a2E0aE9RTHpuRjJJTGg1R0U1SnRFL2ZJZ2tsbExGa0luUDRPN3d1UkFsOUtS?=
 =?utf-8?B?ZVNqYU1qV05BdTdPVEVKWm4rcWhtdzZhUCtGWmVWLzJpY3ZMeWR6L2p6R0ZU?=
 =?utf-8?B?UEJuTE96UFFLNi9jYkVQMytOdmlCOGxYT1hlS2t0dEVHdll6THZQeXQ2Zms3?=
 =?utf-8?B?b0ZOeGFrcFdRQzVHVUM2WTFseXlPTnBBOEVESWk2elN1blczYmZiVHNGLzU3?=
 =?utf-8?B?OUM1VkhLSUpyMDFvREkyaEZLa3NpbTN6QXFUeTBaRVBJSHo5eE1YVTJVQ29I?=
 =?utf-8?B?UVJiTitSaHRQL3I2bGhyc0NtSHRubVBHVzRYdVkweTFTc2FyQmpOMW1pTWdU?=
 =?utf-8?B?QmRFZG1JZmZsTmhiM3dEQWl3WXRQNUx4am4xMjFXN0Jzd01rNWtjVXBORDBr?=
 =?utf-8?B?bFlsb0RlU1kzSStJdzArbEUvdHNQTEd2MUpoQnRKVE81dHV5anZKaldrMTFB?=
 =?utf-8?B?VytuVE52S0dWcVlITzNBbUh4c2NPelZqYzZWZGFuQmo0MnhZS3JERjRwWUR5?=
 =?utf-8?B?V0swaU5DMllTTXlhZVc1QlAvZGY0RDdKMDFTZWl4U3dJVFZvSGk5dEZ5ZCtW?=
 =?utf-8?B?cWVwZzhpMTBJVWJEVWxvbWFmU0ZUM3B1UHZnVjRmUDZsZmpYYTNaQ0tVOWNW?=
 =?utf-8?B?Y2YyazliUG9HY3VLVmxPdUoyMitIdWlWSnhNU0ZoSXFJWEgycTlTSkNST2U4?=
 =?utf-8?B?YTBtRDhPd0g5VjFGSFRwYW9MV2V5N2RrY2hveFFtcEpVVis4R3BxaG1pbG1w?=
 =?utf-8?B?aDdrL0FVL05oMDdUanlvZ0toVkRpamRLaVl1cysxT0lNMDRHWTFtNWREbDVE?=
 =?utf-8?B?cWxRS0ZtTkJHSjVKMGFEYjZqb2lxSmdDYXV1VW9Tai9oR1N2cTNITktJTEZu?=
 =?utf-8?B?ZnQyTXptQm0rdkYxTU5vSUtrYktIMTZOUE83Rms2Z3lOYmtOU1BRdXZKN1Zq?=
 =?utf-8?B?OEJHK1lzWExjQWxMNWt4K25OY3JHY1p5ckczdjVFNzh1bUR5M0FkQUxVbUhR?=
 =?utf-8?B?cTFBcGFuQnhvYlJLYlozTDVSQW5wVVZBcjFtSWd1eGdpTWNqNXZqeEtKS2Mw?=
 =?utf-8?B?L0tKTGdtMHhsNXVVZjFjZGUzSXpLRjFuSWdNTEZtd2xycGQ5L0ptTUJmbTNG?=
 =?utf-8?B?L05OQzRvTjJnaU04TFRiUStJa0JCS0lidmpWV29iRnVlZWVYayswVFk1andl?=
 =?utf-8?B?aUJvYzZDT1JHdUFQVUdKM2RxVHR0T3YzOFM5cjFkZ2FOQmxlSkhsVzBPcU92?=
 =?utf-8?B?RWdwREtrekhFYTRMeFU0N051TjhuRU9uU1pEcnNxOVczK3V4enF6bDA1QzlR?=
 =?utf-8?B?S2QwRzFDcFBGL1gyanVXckhiYlpEYlVINU1JdFYzeEVRM1RsU1pnU0lLSDlN?=
 =?utf-8?B?eFZpYUNRaERiTzZIMzd4VDZxdnFSVkNBKzVXZE5jcEt5R0prd3UzeERIckN1?=
 =?utf-8?B?cVNEZ0FlNW1ySzRsTURNdHdpWTFXclNveGFLdnl1enFGQlBvaDljNTB5d1Rw?=
 =?utf-8?Q?1IuHsz0t1Szkokuwfrspq95own/22+Mu1F0gJ8yfWvDk0?=
X-MS-Exchange-AntiSpam-MessageData-1: DJ2psgUjdLIr+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aaf0739-d4e9-45de-8bac-08df17ac1e4f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:46:52.2383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMAU2XnqTKbakqyLUDetTxt0habKQAJKm1KT2h1tPjnjznMEkt+NzhmodGyUREWntNCXl8cFpir5uDiuDqExKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA3734E4BA

On Sat Sep 12, 2026 at 5:43 AM BST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/=
falcon/gsp.rs
> index 4c96ae325fda..dfa08bc6867c 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -5,6 +5,7 @@
>          io_project,
>          poll::read_poll_timeout,
>          register,
> +        register::Array,
>          Io,
>          Mmio, //
>      },
> @@ -18,9 +19,11 @@
>          NovaRegisters, //
>      },
>      falcon::{
> +        hal,
>          Falcon,
>          FalconEngine, //
>      },
> +    gpu::Chipset,
>      regs,
>  };
> =20
> @@ -46,14 +49,72 @@ fn pfalcon2(io: Bar0<'_>) -> Mmio<'_, super::PFalcon2=
Registers> {
>      }
>  }
> =20
> -impl<'a> Falcon<'a, Gsp> {
> -    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register =
to
> -    /// allow GSP to signal CPU for processing new messages in message q=
ueue.
> -    pub(crate) fn clear_swgen0_intr(&self) {
> -        self.pfalcon
> -            .write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::zeroed().with_sw=
gen0(true));
> +impl Gsp {
> +    /// Clears the SWGEN0 latch in the GSP falcon.
> +    ///
> +    /// While the latch is set, no later message signals the tree, so a =
caller that consumed a
> +    /// notification by polling must clear it.
> +    pub(crate) fn clear_swgen0_intr(bar: Bar0<'_>) {
> +        Self::pfalcon(bar).write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::ze=
roed().with_swgen0(true));
> +    }

This hunk is the symptom of something we are losing in this series: you
don't need a reference to the Falcon instance anymore to manage
interrupts, just call a crate-public method with a BAR reference. I
think there is a way to design this properly but I don't trust the LLM
to do it right, so I'll fix it in a follow-up after the series is
merged.

> +
> +    /// Reads the GSP falcon causes that are routed to the host, without=
 clearing any latch.
> +    ///
> +    /// Every one of them other than SWGEN0 reports a GSP fault.
> +    pub(crate) fn read_host_intr(
> +        bar: Bar0<'_>,
> +        chipset: Chipset,
> +    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
> +        let latched =3D Self::pfalcon(bar).read(regs::NV_PFALCON_FALCON_=
IRQSTAT);
> +
> +        hal::falcon_intr_hal(chipset)
> +            .riscv_routing()
> +            .host_routed_causes(Self::pfalcon2(bar), latched)
> +    }
> +
> +    /// Reads the host-routed causes and clears the SWGEN0 latch if it w=
as set.
> +    ///
> +    /// Returns the causes as read, before the clear. No other latch cha=
nges.
> +    pub(crate) fn take_host_intr(
> +        bar: Bar0<'_>,
> +        chipset: Chipset,
> +    ) -> regs::NV_PFALCON_FALCON_IRQSTAT {
> +        let status =3D Self::read_host_intr(bar, chipset);
> +
> +        if status.swgen0() {
> +            Self::clear_swgen0_intr(bar);
> +        }
> +
> +        status
> +    }
> +
> +    /// Clears the latch of every interrupt cause set in `status`.
> +    ///
> +    /// A cause driven from outside the falcon is still set on return, a=
nd
> +    /// [`Self::read_host_intr`] reports the causes that remain.
> +    pub(crate) fn clear_intr(bar: Bar0<'_>, status: regs::NV_PFALCON_FAL=
CON_IRQSTAT) {
> +        Self::pfalcon(bar).write_reg(regs::NV_PFALCON_FALCON_IRQSCLR::fr=
om(status.into_raw()));
> +    }
> +
> +    /// Retriggers the GSP falcon, which then re-emits its host-routed c=
auses into the tree.
> +    ///
> +    /// Call this only once every host cause is clear. A cause still set=
 is re-emitted at once, and
> +    /// its vector arrives again as soon as delivery is rearmed.
> +    ///
> +    /// Does nothing on Turing, whose falcons have no retrigger register=
.
> +    pub(crate) fn retrigger_intr(bar: Bar0<'_>, chipset: Chipset) {
> +        if !hal::falcon_intr_hal(chipset).has_intr_retrigger() {
> +            return;
> +        }
> +
> +        Self::pfalcon(bar).write(
> +            Array::at(0),
> +            regs::NV_PFALCON_FALCON_INTR_RETRIGGER::zeroed().with_trigge=
r(true),
> +        );
>      }
> +}
> =20
> +impl<'a> Falcon<'a, Gsp> {
>      /// Checks if GSP reload/resume has completed during the boot proces=
s.
>      pub(crate) fn check_reload_completed(&self, timeout: Delta) -> Resul=
t<bool> {
>          read_poll_timeout(
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 052610c4a4da..3f1f509eccbd 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -82,7 +82,6 @@ fn signature_reg_fuse_version(
> =20
>  /// Offsets of a falcon's RISC-V interrupt routing registers.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -#[expect(dead_code)]
>  pub(crate) enum RiscvRouting {
>      /// The Turing offsets. GA100 uses them too.
>      Tu102,
> @@ -97,7 +96,6 @@ impl RiscvRouting {
>      ///
>      /// The causes routed to the core belong to the firmware running on =
it, and the host does not
>      /// service them.
> -    #[expect(dead_code)]
>      pub(crate) fn host_routed_causes(
>          self,
>          pfalcon2: Mmio<'_, PFalcon2Registers>,
> @@ -122,7 +120,6 @@ pub(crate) fn host_routed_causes(
>  ///
>  /// Separate from [`FalconHal`] because the GSP event handler calls thes=
e from hard interrupt
>  /// context, where it cannot make the heap allocation that a `FalconHal`=
 takes.
> -#[expect(dead_code)]
>  pub(crate) trait FalconIntrHal {
>      /// Returns whether these falcons implement `NV_PFALCON_FALCON_INTR_=
RETRIGGER`.
>      fn has_intr_retrigger(&self) -> bool;
> @@ -135,7 +132,6 @@ pub(crate) trait FalconIntrHal {
>  ///
>  /// GA100 has its own arm: it has the retrigger register, which Turing l=
acks, and the Turing
>  /// routing offsets, which GA102 moved.
> -#[expect(dead_code)]
>  pub(crate) fn falcon_intr_hal(chipset: Chipset) -> &'static dyn FalconIn=
trHal {
>      match chipset.arch() {
>          Architecture::Turing =3D> tu102::TU102_INTR_HAL,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 3d796d6c7013..d1e0da7b8682 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -38,6 +38,11 @@
>          Gsp,
>          GspBootContext, //
>      },
> +    irq::{
> +        self,
> +        gsp::GspIrq,
> +        SubtreeVectors, //
> +    },
>      mm::{
>          bar_user::BarUser,
>          pagetable::MmuVersion,
> @@ -301,6 +306,13 @@ struct GspResources<'gpu> {
>  #[pin_data]
>  pub(crate) struct Gpu<'gpu> {
>      spec: Spec,
> +    /// GSP event interrupt registration.
> +    ///
> +    /// Must be kept declared *before* `gsp_resources`, so that the hand=
ler is unregistered, and
> +    /// any in-flight run of it has finished, before the command queue i=
t drains is freed and
> +    /// before the GSP is unloaded.
> +    #[pin]
> +    _gsp_irq: GspIrq<'gpu>,

Eventually this should belong to the `Gsp` instance. It looks weird that
the IRQ aspect is the only one handled separately.

(this is not an ask for fix, more of a self-note for later)

>      /// Static GPU information as provided by the GSP.
>      gsp_static_info: GetGspStaticInfoReply,
>      /// GPU memory manager owning memory management resources.
> @@ -319,6 +331,14 @@ pub(crate) struct Gpu<'gpu> {
>      /// Must be kept declared *after* `gsp_resources`, as the latter's `=
PinnedDrop` implementation
>      /// requires the sysmem flush page to be in place.
>      sysmem_flush: SysmemFlush<'gpu>,
> +    /// Borrow of `vectors` that `_gsp_irq` holds. A field that borrows =
a sibling field is
> +    /// self-referential, which `pin_init` cannot express, so the borrow=
 is taken by hand.
> +    vectors_ref: &'gpu SubtreeVectors<'gpu>,
> +    /// PCI interrupt vector allocation.
> +    ///
> +    /// Must be kept declared *after* `_gsp_irq`, which holds a borrow o=
f it.
> +    #[pin]
> +    vectors: SubtreeVectors<'gpu>,
>  }
> =20
>  #[pinned_drop]
> @@ -358,6 +378,12 @@ pub(crate) fn new<'a>(
>          let dev =3D pdev.as_ref();
> =20
>          try_pin_init!(Self {
> +            vectors: irq::alloc_vectors(pdev, irq::gsp::GSP_SUBTREE.into=
())?,
> +
> +            // SAFETY: `vectors` is initialized above, is pinned at a st=
able address, and is
> +            // dropped after every field that uses `vectors_ref` (struct=
 field drop order).
> +            vectors_ref: unsafe { &*core::ptr::from_ref(vectors.as_ref()=
.get_ref()) },
> +
>              spec: Spec::new(dev, bar).inspect(|spec| {
>                  dev_info!(dev,"NVIDIA ({})\n", spec);
>              })?,
> @@ -380,12 +406,7 @@ pub(crate) fn new<'a>(
> =20
>                  bar,
> =20
> -                gsp_falcon: Falcon::new(
> -                    dev,
> -                    spec.chipset,
> -                    bar
> -                )
> -                .inspect(|falcon| falcon.clear_swgen0_intr())?,
> +                gsp_falcon: Falcon::new(dev, spec.chipset, bar)?,
> =20
>                  sec2_falcon: Falcon::new(dev, spec.chipset, bar)?,
> =20
> @@ -409,6 +430,30 @@ pub(crate) fn new<'a>(
>                  })?,
>              }),
> =20
> +            _: {
> +                irq::gsp::quiesce(bar, gsp_resources.spec.chipset, vecto=
rs_ref)?;
> +            },
> +
> +            // SAFETY: the command queue is a field of `gsp_resources`, =
which is initialized
> +            // above and pinned, so the reference outlives the registrat=
ion. The registration is
> +            // a field of `Gpu` and is never leaked, so its `Drop` runs,=
 and field drop order
> +            // runs it before the queue is freed.
> +            _gsp_irq <- unsafe {
> +                GspIrq::new(
> +                    pdev,
> +                    vectors_ref,
> +                    bar,
> +                    &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
> +                    gsp_resources.spec.chipset,
> +                )
> +            },
> +
> +            // No interrupt announces the messages that the GSP posted d=
uring boot, before the
> +            // SWGEN0 latch was cleared.
> +            _: {
> +                gsp_resources.gsp.cmdq.drain()?;
> +            },
> +
>              gsp_static_info: {
>                  // Obtain and display basic GPU information.
>                  let info =3D gsp_resources.gsp.get_static_info(bar)?;
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 25ea43f1cbe9..fcfb4210d435 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -152,7 +152,7 @@ pub(crate) struct Gsp<'gsp> {
>      /// Log buffers, optionally exposed via debugfs.
>      #[pin]
>      logs: debugfs::Scope<LogBuffers<'gsp>>,
> -    /// Command queue.
> +    /// Command queue, borrowed by the GSP event interrupt handler.

The borrow comment shouldn't matter here.=20

>      #[pin]
>      pub(crate) cmdq: Cmdq<'gsp>,
>      /// RM arguments.
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index acee444e898d..f1231569aa33 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -643,7 +643,6 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> =
Result<M>
>      /// # Errors
>      ///
>      /// `EIO` if the queue is poisoned, or if a message fails framing or=
 checksum validation.
> -    #[expect(dead_code)]

The patch adding the drain method is short and looks lonely as-is, let's
fold it into this one and remove this temporary dead code.

>      pub(crate) fn drain(&self) -> Result {
>          self.inner.lock().drain()
>      }
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index 7fb7d9f2e237..cafcc613770a 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -11,6 +11,7 @@
> =20
>  #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
>  pub(crate) mod doorbell_test;
> +pub(crate) mod gsp;
>  mod hal;
>  mod interrupt_tree;
>  mod regs;
> @@ -25,11 +26,16 @@
>      prelude::*, //
>  };
> =20
> -use crate::num;
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset,
> +    num, //
> +};
> =20
>  use interrupt_tree::{
>      Subtree,
> -    SubtreeSet, //
> +    SubtreeSet,
> +    Tree, //
>  };
> =20
>  /// The message-signaled interrupt type that Linux granted.
> @@ -56,6 +62,39 @@ pub(crate) struct SubtreeVectors<'a> {
>  }
> =20
>  impl SubtreeVectors<'_> {
> +    /// Returns the tree of `chipset`, covering the serviced subtrees.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `chipset` does not implement every serviced subtree.
> +    fn tree<'b>(&self, bar: Bar0<'b>, chipset: Chipset) -> Result<Tree<'=
b>> {
> +        Tree::new(bar, chipset, self)
> +    }

We are 4 revisions in, and I still don't understand the relationship
between `SubTreeVectors` and `Tree` clearly. And this method hints very
strongly to me that they should be merged into a single type.

And also this: `SubtreeVectors` already store HAL-dependent information
with the `MsiType` and the number of IRQ registrations, yet when we
invoke `tree` we need to pass it a chipset again. What happens if
`chipset` is not the same as the one with which the `SubtreeVectors` was
created?

I'm not asking for a redesign now because I think it would mess with
ownership of the interrupt handler and cascade into requiring more
changes, but adding a note to myself to address that in a follow-up
patch.

What should be done in v5 though: the doorbell test basically rewrites
this method at the beginning of `run_selftest`. Let's introduce it in
patch 6 so it can be used in the doorbell test as well, and then
`Tree::new` can be made `pub(super)`.

> +
> +    /// Disables every vector in the tree, clears every pending bit, and=
 rearms PCI interrupt
> +    /// delivery.
> +    ///
> +    /// On return, the serviced subtrees are enabled at `TOP` under a `T=
OP` rearm method and
> +    /// disabled under the configuration-space one. A caller that needs =
delivery enables them
> +    /// itself.
> +    ///
> +    /// Call this only during probe, with no interrupt handler registere=
d.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `chipset` does not implement every serviced subtree.
> +    pub(crate) fn reset_tree(&self, bar: Bar0<'_>, chipset: Chipset) -> =
Result {
> +        let tree =3D self.tree(bar, chipset)?;
> +
> +        tree.disable_all_leaves();
> +        tree.drain();
> +        for subtree in self.serviced.iter() {
> +            tree.rearm_pci_irq(subtree);
> +        }
> +
> +        Ok(())
> +    }

So this calls `tree` and then just calls a bunch of methods on it
(except `serviced`, but `serviced` is copied into `Tree` and thus
available from it). IOW, this should just be a `reset` method of `Tree`.
