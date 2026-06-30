Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013028.outbound.protection.outlook.com [40.93.196.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8221933ADAC
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826755; cv=fail; b=Zm/oIEYVXSwlYll9rPC1RVP5ga3A+EBb6l4OtP4v6W2wjoyOMzh46ZiWjFaqHoSF/GAU213aQKY/ZpCcOouD9w1W3YGWlmXK6ZuLn1WK0vMGMmekxOJVIwcTRkchMpNrZTwJI6CR7jwB/pgYj9Xcha6V4yLksn6OLfzqdstvJcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826755; c=relaxed/simple;
	bh=on7fulMmZl1rXLlGX1NfDH1x7HgrrG9HxbVA5avF5uc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=pthn/XRsTkTk7f1xeO2zr3dlOkiS0ttRTR6Rf2NySjxc4uVOze/Gyg3t9J/lLRmqBD3l431IVThwuhkEogcMl6luVdfx9Lqa5tr/CG5CBdQkQGwrOKfY7fN81w5kTBWUWUM6gcP0GHDJCfN4cyb2JscnzyjWpHyI6rjKLKWvkac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y3PPLEnG; arc=fail smtp.client-ip=40.93.196.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y3PPLEnG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFasw74aTmOWfPthRbj53FtHvNtN0Izd35A/1AtK9OsJxTJ9/kTlrNrO6/1eRBpVyYH17lXLEaU/G0nvwR6rN3JJiHIBahQILvRQSL4VkiusfX+qvpNxJFxbvLk/EfQWET5mDCWMFK3mRTuJZZnxl+SHgfaaEqGG53bZLENQcvRnz+3I+gfd+X93CavwSuN85DVscsUwB8LYkYl/M1boeOPOcdlSVLXUXHffayQQfx7rcc4kOIIKHWr1iBv3wLGrPsRwsL78zTvYa5z0Rze82FtDKd1jmo59hami/hdM4VJrKlqXuqHpbPEWyZdIAvp8z2ptf0zFo6Edma0N8LCsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5iHc5opyRlXUWKwD2F0Xc3KbZtWY+k/0c/YEb0Snj0=;
 b=eVpak6fF6ZYIQpKbOygWAh/ErzrE25V2lZylfJa/5cijTDXzacAT1hen2q8O0jtbzGqdm1WaVCGb/ke4/VcD3Rpd3AduDIZQQJ5qG4tLuNhpZxP0YzK9+MJR6Ao8pG+k3kVZ9Hx+QZ1ybIU/FBBkX00TW6L9DLU/aUzXvRPdRXUoHmOOuAvTxIbWkKHaY4bBRzOUSAjRPYcBHcfQm0cCC2p1SBN6SHoehGrQCYwuL+pJ0Hud7q9ZO0JuQWTl+f7M7Rn1N0W8G9HDxawOhHVJS2gIpDBbD05dxbdNdrGB/dHvnI+xclBp7uKtZi/w3NnVNwhvJFQVh/bBM0q/RnRp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5iHc5opyRlXUWKwD2F0Xc3KbZtWY+k/0c/YEb0Snj0=;
 b=Y3PPLEnGgG49hIpWWoLoKZn7dovZRDRjVWXptSY2/vPCV52fEiSCQJIqJteag5MWc3em0b0p+PmIEzGYog1onXilJhIn59mG59pqMFopc07mwefllcKe7Q8wh8Vxv/qIV2ipwyxR4/91EVfLUVbBkUIpHYs8LdMFbKzYhbvXytgrP1Donqv3Ql4TxU/5sIMmgfcod28rowNaEESzyvAjdHWsWur71hB67VbZNc5igLr6iq2Lb9aaPKZw5Lm63aIWiLYMupmDszTzBcUZM8+nUwOs0Ld2RcS/r6jDdassGlCgwksU8dBmpj5I3p0A8yUimxBUgEMsaZe4uWg/kkJcjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 13:39:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 13:39:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 22:39:01 +0900
Message-Id: <DJMFC2HBBZD4.3FJWK6DAFI2YL@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>, "Zhi Wang" <zhi.wang.ai@sent.com>
Subject: Re: [PATCH v2 7/7] gpu: nova-core: reserve larger WPR2 heap for
 vGPU
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
References: <20260622194353.1308872-1-zhiw@nvidia.com>
 <20260622194353.1308872-8-zhiw@nvidia.com>
In-Reply-To: <20260622194353.1308872-8-zhiw@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:604:257::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc227e5-cd53-4f78-a9fd-08ded6acf48a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|23010399003|22082099003|18002099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	BtQTiX2EiRvp0tOpGyfnwXyggRN4/2EXTa4BsMTk7riD+Jb7Sn1dRKFPEG53wqOepT2kR3FKruWq5P+C1NFPkEdvhtKKKXwWsr7gV9Da+Ld3o1g3IMDCB3AlSeVje0BNLpYYVDbydaFSVcXtkzKdM6vGQIMxfQm5FRMAfSqLDQIaqMK9pp/5g1bFiH6X/gN0ToWOBWP/kHkisToqZh1mqKeEP9gGld1ptzQuqdP2xDW7As4uz4ECGwzNf0Lf+EyIKKajC6+rp8J7POrEsPiRGi0piJi8ngQhCDlDKSomXdhLLYAZUTvW1dWf2SuC4vo7Fl4aATf86fXvdFn3XAKFxdw5n7xDxZZuLBqyahlvYQfjE5gTLFNPruST3JVF5lSsRNNW/C5oiAVdCFCWRMgRIz2GAK9htNoHHsVlAK8YX99hdNxYgeXF1rwIeN0aUvH8vAWzzUeA+Ux3oWLCaEv1xCZJAHAzcBPWAGhtHKxN62asox1icMCiE9rqN2bGqOTdK9cWDz56jIQASfN1P7wDF3q9UyyUttNfI6g0ONHJoyHUD+jNQzMqTTnoTWiQjoIL7yXZlojLRioV/BwbkPp/WdMx13esJ2jzF2ym1+tLIgcGEfUzZSoZIBtnE3BP+ZM3ZKSgiNWC4lZYXihD8VJphG3+HMXl0zPw5lwc2N2i3zc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(23010399003)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym95ZFRkTTUxcnJMT3JZeHY0OW1hcTdBL3ZFa0d6Qi82RXU3UzlFNTRkYi9Z?=
 =?utf-8?B?bXhsOVhCRmlrWmJwTkFjUG1nT2ZUSy9INVA0aWJkSDcwcE0ydkdVQ1NRY1NT?=
 =?utf-8?B?ZzBLeVRQamJrWjFINk5leDcvNVowSUh5ZnBMakhaKzErR01CcVNPSVVhRDRj?=
 =?utf-8?B?WXpkNi8yQ1dHVHF5NzFUQ082SjJJc3BPNEZBYWxuQmgrc0lwN1BtS0g4UzJk?=
 =?utf-8?B?QTY5WjZ0TkRuQlUyenA4S05DblY1UXJDbGtKQnV4MW1qUTZmVEFpNU1ZVnFM?=
 =?utf-8?B?Z2ZBZ04wbmFqQ2NvM1ZpOFF1OERZV1NncXVVNTh3RHlHQ1FtdHJ4ME1aN2o5?=
 =?utf-8?B?eGd4dHpIR3pJdmJwUno4MnA3QU5DN3puYVYxeHIzZHBhM1FDNXZwVzhaNnZ6?=
 =?utf-8?B?TDhmbXdGTllyTkx0NlNXR2lzbUlLVTlyZnFnUHFxdU16R2V6OGwvSW9tMzBU?=
 =?utf-8?B?MGR1UjBTUksrY05QMk5aQ09uYkw4bFhZRFZsVlNOc3R2SHBIMlRjTkhuZ2w5?=
 =?utf-8?B?cEZsMVJSVUVnaGxBTE85VHpiK05UWUFGYmZBZ1Q3STF1UGwrWi9uZ05EQWtu?=
 =?utf-8?B?ZUozeVEzb2NPWUErR2hITVZjUnNQNlZrbHhxVTdWKzFqNlNkM3I4eDFYOVN3?=
 =?utf-8?B?WHRoM1NaYXNIalhUdzBuUm9aY1MvT3JyQ29WRzFLZjRaTlU5bjNscUZTT1lu?=
 =?utf-8?B?Y2VEV0wvRURnNDBzS3lTNTRtdE50a1MwSDlBVVJSSGYwTnhLeHFVSEMyQ0xQ?=
 =?utf-8?B?WlhGTzY4T3k0RVZlL0hTTy81dTRDRVpleSthVzR0RW9qSitaT1RKcWUzNkhT?=
 =?utf-8?B?ZDRFWXNNMUJ1M0hOTkY1Z3NFQ3RaN0d3OHpSZ2w4NTdQVFM1NTZNN2JLZGRL?=
 =?utf-8?B?N05HTit1OFc3Uy9OeCtWK2RXZFdLazRMbEpwcG5EWEN0S0F2WUlVdzlmeFpN?=
 =?utf-8?B?TzRCa0lTdzVqY05raWVwTGY2a2NKMFNySGJmODBoZzNidkFCVzQ5R21lT0Jl?=
 =?utf-8?B?ZU9aOGdMMDlSWE9WZldoTnloMG1Zck5yNFFRZ2RDYnB3MmlaYWpjSUNaWEJC?=
 =?utf-8?B?ejR5VUxwZnpEVkRCcHFPbW1iUWN0OXpuZzZVQ0I3VFhVYkl5T00yTTU0L1BN?=
 =?utf-8?B?M00rOFdGUzVTeitER01mR3JpOTZMcnBqSERaWFVmL2ZUZjRNYTdJWDJuRGRw?=
 =?utf-8?B?ejY4SGxXeEJ2UjBrcmdpOW1QNjJiWG5SY2ZUVnB3YmVwOVFuWDFOeS9NVk42?=
 =?utf-8?B?VHB2SVNHWllwTTIxQW9QSGtjQTJESlRmYWNrWUVOSXVJNmU3cEhCNm4vTFRW?=
 =?utf-8?B?eXBJNmRnN2pnSmF2L3FqZWlQYXVuTUthZ3hIczU4c2JXL25NM1lZbTZiVFV4?=
 =?utf-8?B?TXptdGlTKzIxOHVaUjZDU05lTVdoVmxTaEpLMjB4YVZBNVV5eXNWd1VaSEZO?=
 =?utf-8?B?cG1QWjlmejByaGp6bkNDWTZ2UWJEOWwvM0xhWFR3VGt1aGJZYldWdnpPcHBh?=
 =?utf-8?B?Y0xDYTEvUDYxa0Y4M0x3am8rRVZGbkpEQWJ2OXU3MjJuRlU2UTl3dE5YRzNF?=
 =?utf-8?B?dURqOFpTM2dOSi9jQ0hSNlVSMTNnK3dTd1hCNXB2NUFtZlgxRlR5R1lnWGpD?=
 =?utf-8?B?MW1hNmxYUGVDSW4wMS9xRW02QzJUN3pxZVhtakcrWmMxeGVsazdxOEcrM3pX?=
 =?utf-8?B?dDU1VUYwWlcrTmdTRVBIelZpSGlYWEJpTVJyQ25GV1dQbm56UHQ4aFAraFhC?=
 =?utf-8?B?cEU2eEE2Q1d0MGEzTHRsTzA1N2FFb0NNQWorR2xUWVFEYWdLbjVCMGlVMTFF?=
 =?utf-8?B?c29kVHJnYkVtdFVmalFSQjRYaHVmT1VUemVJN0MzOFFkL3RpaUlxZ3d6V2Fz?=
 =?utf-8?B?NFcxcmtMdzl0ZE5VNkQ3VXJwa2pJOUtDYlFsWGx4S0pYQWJNbFUwc0lnZU45?=
 =?utf-8?B?dTZ2K0JONjdSb1lZUzNYc1ZWTkFLREM2Z01OKzhJV1J1ejRBaWJ5cVp2ZldN?=
 =?utf-8?B?UGRjczkzVXllOE9SMW5zWXc5c0pXMWt6a25iVUF2dThCc3hZRW9pdkdRbUlL?=
 =?utf-8?B?U0VWdENwdTFVVjU2eTd1RFFBMFlBNFJrUDR5QnZ4cTVKbUtyMlY2aTdIQ0ln?=
 =?utf-8?B?YmV5OS9SZk1vYVJYejZVNzE2UktIQnJHTHpVQlY5UGV5REQ0azQwNUV3Y2FK?=
 =?utf-8?B?MjJPNkorYkkxYy9KQ2dCY0QvM0xEeWdaalFPOEFxQzBTNHB6bzhjcVRuREVm?=
 =?utf-8?B?RkZidStDWVhjSC82cHE5OHhwcDBRMUdPWU40OWpEOEY3a0o1Z1g4eFlURm83?=
 =?utf-8?B?Q0N1ZTNaQUdlMWJsLzJ4Y2JpSmkxdjdTek1hWmtabU5xYVB2SElqM3lvOXpQ?=
 =?utf-8?Q?qtEW6QdJHBkHDdzbBFIC5MkqURDyXv3fQays0dcQV2xmq?=
X-MS-Exchange-AntiSpam-MessageData-1: zpTqulyyeLMD/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc227e5-cd53-4f78-a9fd-08ded6acf48a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:39:06.0093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2Mb04UzH+ve9V1RjRDgIK1GlR7CYk8DiLVYRObRaGE+zDdFKXoOfzJQ6pWu3DFuskl/08mhSI7XAM/Bx9hmRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123

On Tue Jun 23, 2026 at 4:43 AM JST, Zhi Wang wrote:
> From: Zhi Wang <zhi.wang.ai@sent.com>
>
> Reserve a larger GSP WPR2 heap when vGPU is enabled, using the VF count
> reported by VgpuManager to select the heap size and to populate the VF
> partition count in the GSP WPR metadata.
>
> Use the baremetal heap sizing path when vGPU is disabled. For vGPU,
> reserve 581 MiB for up to 32 VFs and 1370 MiB for larger VF counts.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fb.rs       | 25 ++++++++++++++++++++-----
>  drivers/gpu/nova-core/gsp.rs      |  1 +
>  drivers/gpu/nova-core/gsp/boot.rs |  2 +-
>  drivers/gpu/nova-core/gsp/fw.rs   | 10 ++++++++++
>  4 files changed, 32 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 725e428154cf..b5b1f6c13edc 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -24,7 +24,8 @@
>      gpu::Chipset,
>      gsp,
>      num::FromSafeCast,
> -    regs, //
> +    regs,
> +    vgpu::VgpuManager, //
>  };
> =20
>  mod hal;
> @@ -171,7 +172,12 @@ pub(crate) struct FbLayout {
> =20
>  impl FbLayout {
>      /// Computes the FB layout for `chipset` required to run the `gsp_fw=
` GSP firmware.
> -    pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gsp_fw: &GspFirmw=
are) -> Result<Self> {
> +    pub(crate) fn new(
> +        chipset: Chipset,
> +        bar: Bar0<'_>,
> +        gsp_fw: &GspFirmware,
> +        vgpu: &VgpuManager,
> +    ) -> Result<Self> {
>          let hal =3D hal::fb_hal(chipset);
> =20
>          let fb =3D {
> @@ -234,10 +240,19 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, =
gsp_fw: &GspFirmware) -> Resu
>              FbRange(elf_addr..elf_addr + elf_size)
>          };
> =20
> +        let vf_partition_count =3D if vgpu.enabled() {
> +            vgpu.total_vfs().try_into().map_err(|_| EINVAL)?
> +        } else {
> +            0
> +        };
> +
>          let wpr2_heap =3D {
>              const WPR2_HEAP_DOWN_ALIGN: Alignment =3D Alignment::new::<S=
Z_1M>();
> -            let wpr2_heap_size =3D
> -                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?;
> +            let wpr2_heap_size =3D if vgpu.enabled() {
> +                gsp::vgpu_fw_heap_size(u32::from(vgpu.total_vfs()))
> +            } else {
> +                gsp::LibosParams::from_chipset(chipset).wpr_heap_size(ch=
ipset, fb.end)?
> +            };
>              let wpr2_heap_addr =3D (elf.start - wpr2_heap_size).align_do=
wn(WPR2_HEAP_DOWN_ALIGN);
> =20
>              FbRange(wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOW=
N_ALIGN))
> @@ -265,7 +280,7 @@ pub(crate) fn new(chipset: Chipset, bar: Bar0<'_>, gs=
p_fw: &GspFirmware) -> Resu
>              wpr2_heap,
>              wpr2,
>              heap,
> -            vf_partition_count: 0,
> +            vf_partition_count,
>              pmu_reserved_size: hal.pmu_reserved_size(),
>          })
>      }
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 6821008d48d9..a159f36bf704 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -26,6 +26,7 @@
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> +    vgpu_fw_heap_size,
>      GspFmcBootParams,
>      GspFwWprMeta,
>      LibosParams, //
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index c607081e8242..dea028f4b434 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -56,7 +56,7 @@ pub(crate) fn boot(
> =20
>          let gsp_fw =3D KBox::pin_init(GspFirmware::new(dev, chipset, FIR=
MWARE_VERSION), GFP_KERNEL)?;
> =20
> -        let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw)?;
> +        let fb_layout =3D FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu)=
?;
>          dev_dbg!(dev, "{:#x?}\n", fb_layout);
> =20
>          let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 4db0cfa4dc4d..2fb72f8dc3c9 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -101,6 +101,16 @@ pub(in crate::gsp) fn advance_cpu_write_ptr(qs: &Coh=
erent<GspMem>, count: u32) {
>  pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =3D
>      num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
> =20
> +const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u64 =3D 581 * u64::SZ_1M;
> +const GSP_FW_HEAP_SIZE_VGPU_48VMS: u64 =3D 1370 * u64::SZ_1M;

Another thing: I would like to get these values generated from OpenRM,
so they end up in `bindings.rs`, as these are firmware-dependent.

I see that for 570.144 (the firmware we are currently supporting), only
`GSP_FW_HEAP_SIZE_VGPU_DEFAULT` is defined. Is it ok if we limit
ourselves to this value until the firmware upgrade?

If so, here is the diff you can include to declare it in the right place:

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gp=
u/nova-core/gsp/fw/r570_144/bindings.rs
index ea350f9b2cc4..ebcc9f9ae126 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -40,6 +40,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::=
core::fmt::Result {
 pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100: u32 =3D 14680064;
 pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 =3D 98304;
 pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 =3D 100663296;
+pub const GSP_FW_HEAP_SIZE_VGPU_DEFAULT: u32 =3D 609222656;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 =3D 64;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 =3D 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 =3D 88;

