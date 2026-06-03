Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BA441031
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481864; cv=fail; b=T1RbBr5Den6RBv/WSAy+qzK4CPjbpx8kAR3RId24yAxY3q2ovpcxZbMwvi/WR0IT3sjz+6ZbtkzEahW/XGh3kg1uf8eyZwebFW8IKwEb3Y2ilwYtqtfDG22qYmoA4orH0PNVK/RWIbuBVPus5Sk5xkUCdeikRpH4qUXz6Xx9GLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481864; c=relaxed/simple;
	bh=QwFTSeDRyTOGIVFK+DrUipb3q+sWq497QoyKm8sJrDg=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=IQwTCm3VssnNdmZzS3GZBF2LG4/Il7AsJ13KwFTcxASxRfh5FnevM95aXUAIJaReIkLhmQSjdW6HFl+BZx2hRPUnScrJbjtMVyHD1Ji94+doExRaH12O4ulB3YuIP6jkMXdMz3NR6BQl/Nauw4HRbk0BirfbidTUqHy9QdiGqkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=djheSsrL; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="djheSsrL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbeNzHWdfH1uRXfD2wRqa1UZNw18b2Bp8boa0V99l0kgjNc9JuQqMwNNZWqXyuo2VSgQv9ZF/UJqaoDyBatLcv4KnK+FqJs4agDRkkCLXk81dXLEcQDw3LGl7De/ngdwlFPixbLsVdk+oovzX+gRc+lMYOHobi57LM64Xo8jo3jK5gPDgWS+O7CCBZ/1HJCjYaXkcaF8ew66eRxrUVvuCJSIOLkNeZnABypCOdXlFLVfciAp557NvUOiMAl1gTkhEIRgeSVTLE2an6dUtHuyBCz6q4QDs3tV0tT4NRoSWyKZLtdK6cjKUH0EhfeDEv4sMjviEAq1j8YmO7YL7eC0pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN3tjDHqvEzITu9+8NjqSILmNThVTLOeefLbEZogs4c=;
 b=V1V0m4yZTxjxRc3baYWXepWSoTSufvWh7gClu4MjjD/5Oivxj2JiPMC2teU/dUTy7ubQBI1N/cUc4GxdnFiwFWYL++nEWVoZIa6d1/2vHHOmx39jNjiPe8soCjPDxbsMfJDcACMxqj1Oze/2Ut2qVdHYbaP+2NNcA0CZkh8DytWZoEBlkTLZjosgSBcgpywH27OA3Q2oMQRRb/MS/vdj6gbzVCFZEZzrd8MScnhm7NrzYAzITjgEJulkzQ42D98J99I8iXvcT+w8Rvs9dsZAccFYyE2g4Z7WNrOgfCBu21QhTQMuh/YH3VXeP87V/E+oO5C7s8O/EYxjeEY82qlqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WN3tjDHqvEzITu9+8NjqSILmNThVTLOeefLbEZogs4c=;
 b=djheSsrLKkaYYnAfgGdONjIRH3HCXu6Std243XZek3e4lUm4Ru6XuxqlZMBq4qi2/s9209VRslfTpP8Ua9Uz0RSABfsJXhdsoJqot78U7i8sce/Y/V0S9JU5qFgQM+8hHIBSIMcuzHO8vdQNbXwimRvxNOJzNYZC4fLjBeQ7FMYXMXd3OXQ9Go9sxLppMHCh1pCgDXbKWeK63SVfgW5sCNKv4eod32SzgHlR53tEbPWansMGj7l7PMDPKvEtBbgd/X/erXiskfTk9bIv/E9WU4xXCjuaNHzJnSDT4jXyWq+KDeRkIDozPV/g+T9eZB4k6RnvzhV+jzE+jxVszveZDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 10:17:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 10:17:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 19:17:32 +0900
Message-Id: <DIZC53CCKAUY.2L04G0C2WSVQZ@nvidia.com>
Subject: Re: [PATCH v13 7/9] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank Sharma"
 <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Boqun Feng" <boqun@kernel.org>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
 <20260603-b4-blackwell-v13-7-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-7-d9f3a06939e0@nvidia.com>
X-ClientProxiedBy: TY4P301CA0102.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f632d64-6424-498b-94dc-08dec159556c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|3023799007|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sa4gFi3+ORqmqda/vZKgwPGMFlTyDvxO+iJ/Os66cQanZZiBKS+dLa675bPKftsCozDDdJa4ZQFDrDwSavwwCVem0F+uWKlKHvKSEWU+npxm5QFKSHMSxMHcGQm0BYXZIgn+TxR4B+vRsan8k7CNsLz/Vdm0GSqg7PEnY9Lspx43CTcw6TQ4YNZIU7UxsF1K7gW3TdtZt9eOGVcpTefPUUoUXSk38yCpZnDGhWtc0iyL4Th6PM1c9u5vxNGRUldNAxhsUPLxcxeaCbNkudv2+RtlbJekMjgGxIu/9J7Z4PR9HmKJEit4LP/NWSQpKPu4NNfppcpeCpDUItGg6n0dGC3NdxIMrvvoUswa30pON/w/DwG1Zy/6YUm36oK0wLW/g/9eVMYzSgSb5JpYI0Tdy0+Md3ohqppzUT5aze4l7GufVEfBr1MSOyCj5oUrDLlYtkTcriFC22VO5OJnJZFmELv+Hvt3TEMFkeCkz+EsIaDmPfxOiH4NSmGd44g2hCVh9xqN9RyDaTEYsrJj/pnztQHMoICh4cgLRMdkxwEAqB2MaXm4720DQWGorURmjSlFWjY1rWhkwOF+4Ta4q4EJz6AN338mLyxmbRPr4X71/HvhYHpaDS8wsJMz5VqXjTa/GrBWAXsLjdrnkg9RoAC1VAiEWr5/oL34tKj6pysel8sgJ/A9u8GrOPsRhdLBsxmW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGY5VndxZ2F0TTNxekJVWEV2N0lUa0JGYWd5ajhlUHpLYkR2T2hrY2ZaUXpp?=
 =?utf-8?B?dGV1MUg2ejFaL2FwTEI4N1hDSVVSWmNSdUp5MEdjTE5jTkpnQUhBeDBuZUd3?=
 =?utf-8?B?WHh4NkVpYVRVNGJtcTZJZFVDMnJUTEFzbWY5RFlGVVRSbnZaZTM0VmdycEpz?=
 =?utf-8?B?VE5rYk1pbFh5dVRCK2pzWDN4TStRY3poNFVZYmE3TlFXQVhwMGV1QkkwcHNF?=
 =?utf-8?B?bG9jMzlJdWtpL0FlUnliZlpVV2xjdWttUlZLUlZ1ZzlPdnd2K3Y3ZjF5OHJi?=
 =?utf-8?B?M0k5QTVhN0VmcDA4eHJ1ZHVuQXpzNTMvV0hWMzEvQW1pWW9BSE5jQVNFWUxF?=
 =?utf-8?B?Q2dNOWdtSU9GVUIzdWoxYThtUVpwM0JBSEE0aGVHVExuVUlMQyswaWVWWXZq?=
 =?utf-8?B?ekQ4SUZUcFVFSFhBYXJsY2lrN2NjZDJXNlBXZGZseURxUUJ5UzMwa3I1UGl1?=
 =?utf-8?B?Q3kvUXJCSXZLNWFjOThpQkF5YlIycUZFeTRuMlU0TmVIRE1BcnhjK1Y4bmpz?=
 =?utf-8?B?WFF0bzJoaUtHUDhncGJNbVBFK0c3aDlGZ3NOZDVxbjd6TEJrQkRkL0ZFOW5l?=
 =?utf-8?B?ZjBxSEFHVVRsRFBCYkRVamNFaVRpRFB5ZnpmdHQxSEErTTNnRzRZcTR4ZTRE?=
 =?utf-8?B?NDFmTndvQkwyZ3hGbFVOalNxSDdQdGMzRngxeDF3QkFYV1J5RUc3Z0VPNHFx?=
 =?utf-8?B?L2NFZW9QQURYSHg4MnBkVHpBOUdQMWJwVnZ5R0IwdEhQbDV4cXI1SytVNTQx?=
 =?utf-8?B?TFZTY3pXRERrNkJXNXBEWUlTc3czUFJVN3dCbXp5TFJaTmRudGFXcDhxbzI2?=
 =?utf-8?B?RGNndFgvV2Evck5CVzJ4Q3BISEJ4cVpSOE4wMXpzdGdQYjFjSXIrTlVCa3Ez?=
 =?utf-8?B?VnN0cllDQUk3ZTZqNFR4RjVpWmdSNmV0TEdXU3ZSUmgwQy9yeTZtUW00MTF2?=
 =?utf-8?B?WlE1RG11N1Q2eTBLZG45RjVTTVloZ1QycVBEMno3MGRmYzVCYVMyYmx1M3FX?=
 =?utf-8?B?RzFkUTF5emU5NVFvSjNveEpXang4V3Q2V0ZldU9IS1hQTGpuY0krcm5KbTlX?=
 =?utf-8?B?czJuZGJTcTNFeG1HOC9lSjRNdURIeUU0d1UweGdTWk9haGU1TEE0Q3dkMWxK?=
 =?utf-8?B?Y3U2UWJwMFFLRTJ2MUFWOHYzcGFjUEhUWThhMVRZdDBIbHRraHNSV3AxNlFj?=
 =?utf-8?B?d2UxZHJ4ZGtMaTVTd0JndDBUTWVwa0xmQ0xBNk9NbzZZUGt2WlBpME1KdUVQ?=
 =?utf-8?B?T0x2aUpEWmhwMDR2M2JHaVY4RjV3L1ltbWIzaks4TzJjMDJlb1pGbzVGajdu?=
 =?utf-8?B?c2diRDhoblIvcjc3V3lpdDVQeGFrVlBWYXQ5U3hkclhqNEpUVzNwRGYzUlFw?=
 =?utf-8?B?eUwvRWtoUUhTclRMUDlLY2tLYjY3dExPWUJBaTJseW5ZUENXNHZOa2FDZXA5?=
 =?utf-8?B?Z1dnRXNteE9FcE15WU8rYXBNaGtXeGtQMkUzVjcyU1NrNDN3dW4rbDFkRWpn?=
 =?utf-8?B?WjdFMTZWV3RYeWZIUElLdm4vcDVGdkFRaDlKcFZ6TmRkTi81Ym1OWERtVE0v?=
 =?utf-8?B?YUpOeXFUSFRPQVM0d3diRE9qckovT05POE1LQUtpbktpS3hRNnEvaWZNNzM0?=
 =?utf-8?B?Wk16WnI1ZGZjY0tMNGhpK3JIVkQwRFZZQzJSZTVBWXRXWHkyRFZVd1ozOGJ2?=
 =?utf-8?B?ZGxoMHFlRVdueW1QV2JyNXZxWHhQUFhWNU54bytvakthaWJnZFhyNHcrL2tO?=
 =?utf-8?B?ZElNL0tMOE1hWjJicjc3SVlsOXhNeWF0VVJtdEh3SEJDaURpSDQzNkV1dVly?=
 =?utf-8?B?VGJkUTYvNlhvY2UzZ3FuUjdETlRNV3RYTC8wT0Z3S0dYM0N5VHVmcEF0bW1r?=
 =?utf-8?B?Z2E0M1YvM3NlTUI5Q0FmNlA2bnM0WHNhL2FkTTFVMWhGakZ5WUZYUGtISnp0?=
 =?utf-8?B?YXJRLzVpOFFOSEFlSG5qVVdnbW9lYys3SU9GN3JFR3lDN2U1Y083dFIrdHpw?=
 =?utf-8?B?WWVHTW5FeUx5bm0relVsYTVwamVQd2VvWmRKdWNSUC9NSGR3aXpkbVMyQk8z?=
 =?utf-8?B?cGl3YnJER0hkaHBUSm1zcEkveFNqTWwwYnZ1TWQvQUFPZmw5aUUzaHZOL3pt?=
 =?utf-8?B?czRIbUJVTmdtTSs5eE5kYnl4U2JXeFdYcEFLclE4MTc0Vm5Ya254cENaWkFH?=
 =?utf-8?B?ZFA0Q09SZERyRktlakNYckxvbUcrNWF6OTUxa3l4bGlGdGRKT0hTV1NrYjdG?=
 =?utf-8?B?MFowL0RaU3ZCZGw2Z3drckNwbmUxcWNPK3ZoQmJjZ2NzTE50djBBTUxZL1hX?=
 =?utf-8?B?V2VpWTZGN0wySEFxTmZDV3FJN2xGRks3ZVRLdENZM0pZZENFbGZXVkZXNXla?=
 =?utf-8?Q?ZxHPfZ6H042a9BRaMfQJGIziYbvinwhCy5o6RGsr7E9mm?=
X-MS-Exchange-AntiSpam-MessageData-1: urMRTPsT9v05Nw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f632d64-6424-498b-94dc-08dec159556c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 10:17:36.6106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNaNI4/GfCc16B3hk3gBtz32wQ/AXDRtvDZpvezdWFBH29CoOceWKypaBODnTSO6hCTBfgxhjoaosT6R4VAQyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831

On Wed Jun 3, 2026 at 4:30 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
> After FSP Chain of Trust completes, the driver must poll for lockdown
> release before proceeding with GSP initialization. Add the register
> bit and helper functions needed for this polling.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/gsp.rs    |  6 +++
>  drivers/gpu/nova-core/fsp.rs           |  6 +++
>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 88 ++++++++++++++++++++++++++++=
+++++-
>  drivers/gpu/nova-core/regs.rs          |  2 +
>  4 files changed, 100 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/=
falcon/gsp.rs
> index df6d5a382c7a..136d6b24103f 100644
> --- a/drivers/gpu/nova-core/falcon/gsp.rs
> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
> @@ -57,4 +57,10 @@ pub(crate) fn check_reload_completed(&self, bar: &Bar0=
, timeout: Delta) -> Resul
>          )
>          .map(|_| true)
>      }
> +
> +    /// Returns whether the RISC-V branch privilege lockdown bit is set.
> +    pub(crate) fn riscv_branch_privilege_lockdown(&self, bar: &Bar0) -> =
bool {
> +        bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp>())
> +            .riscv_br_priv_lockdown()
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 883ac4f8b811..872898ffe0a3 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -184,6 +184,12 @@ pub(crate) fn new(
>              resume,
>          })
>      }
> +
> +    /// DMA address of the FMC boot parameters, needed after boot for lo=
ckdown
> +    /// release polling.
> +    pub(crate) fn boot_params_dma_handle(&self) -> u64 {
> +        self.fmc_boot_params.dma_handle()
> +    }
>  }
> =20
>  /// FSP interface for Hopper/Blackwell GPUs.
> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index f41f3fea15ff..def41745a30f 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
> @@ -5,7 +5,9 @@
> =20
>  use kernel::{
>      device,
> -    dma::Coherent, //
> +    dma::Coherent,
> +    io::poll::read_poll_timeout,
> +    time::Delta, //
>  };
> =20
>  use crate::{
> @@ -33,6 +35,86 @@
>      },
>  };
> =20
> +/// GSP lockdown pattern written by firmware to mbox0 while RISC-V branc=
h privilege
> +/// lockdown is active. The low byte varies, the upper 24 bits are fixed=
.
> +const GSP_LOCKDOWN_PATTERN: u32 =3D 0xbadf_4100;
> +const GSP_LOCKDOWN_MASK: u32 =3D 0xffff_ff00;
> +
> +/// GSP falcon mailbox state, used to track lockdown release status.
> +struct GspMbox {
> +    mbox0: u32,
> +    mbox1: u32,
> +}
> +
> +impl GspMbox {
> +    /// Reads both mailboxes from the GSP falcon.
> +    fn read(gsp_falcon: &Falcon<GspEngine>, bar: &Bar0) -> Self {
> +        Self {
> +            mbox0: gsp_falcon.read_mailbox0(bar),
> +            mbox1: gsp_falcon.read_mailbox1(bar),
> +        }
> +    }
> +
> +    /// Returns `true` if the lockdown pattern is present in `mbox0`.
> +    fn is_locked_down(&self) -> bool {
> +        (self.mbox0 & GSP_LOCKDOWN_MASK) =3D=3D GSP_LOCKDOWN_PATTERN
> +    }
> +
> +    /// Combines mailbox0 and mailbox1 into a 64-bit address.
> +    fn combined_addr(&self) -> u64 {
> +        (u64::from(self.mbox1) << 32) | u64::from(self.mbox0)
> +    }
> +
> +    /// Returns `true` if GSP lockdown has been released.
> +    ///
> +    /// Checks the lockdown pattern, validates the boot params address,
> +    /// and verifies the `HWCFG2` lockdown bit is clear.
> +    fn lockdown_released(
> +        &self,
> +        gsp_falcon: &Falcon<GspEngine>,
> +        bar: &Bar0,
> +        fmc_boot_params_addr: u64,
> +    ) -> bool {
> +        if self.is_locked_down() {
> +            return false;
> +        }
> +
> +        if self.mbox0 !=3D 0 && self.combined_addr() !=3D fmc_boot_param=
s_addr {
> +            return true;
> +        }

This looks like a bug - if the mailboxes still contain the boot
parameters address, we will keep going and might return true on the next
line, which the caller will interpret as an error. OpenRM does the
opposite check and has an additional test for `mailbox0 !=3D 0`, which we
can translate into this logic:

    if self.mbox0 !=3D 0 {
        return self.combined_addr() !=3D fmc_boot_params_addr;
    }

I'll fix it and add a few comments explaining what the code does as it
can be a bit convoluted.
