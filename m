Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010033.outbound.protection.outlook.com [40.93.198.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1143AD50B
	for <nova-gpu@lists.linux.dev>; Tue,  2 Jun 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412564; cv=fail; b=RWR6mTLE+MA4bEMg+76wmcbxAhQs3n6XEDZDUWpxgR/oiizvaW/4My+er2NzIMHl2ELXukjE5DktTUxWh2QzCF9skWG6PXJ+3/IXKsP7nrdXQ7S9f4X5kpOYc/44d1arPLqs8K/yOU4agDnCKdstoG+S7Bp9rcHDknw3883HNu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412564; c=relaxed/simple;
	bh=9Dx7LhrpQdoFG/AROwqFoevkp+AfDAQ4w4Wxydkh9bM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iK4osFHk+lsqV4AIPckJavhsFyKDrkRMq2DE5WrEUSzG8Ga0vSsVJvKGQHPL68JruvBZs5Wx8npkSf62JCp7RZGAy7y5SNRl0CfQptEDsbTbfTRvUYwXAxl1yRIWG24lhJvIIghwqrGq0oUCEr8xOj3og+F1NTHqLPZ9HSXssbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CBIdEUFz; arc=fail smtp.client-ip=40.93.198.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CBIdEUFz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMcbFmR1KVrGl+kgIWPyrD4Tn+YkJUIApErtqoyzmGMqys2Q1pIbCt3XzWMsrabkPCnA71gifpAGXrgaGX0t1LpbbnC1u9NMq3aXx47nrzc561n1ypGUXMzmLcOhuxCOnJYQapMvr7wIwOA/bgY6ycTIVCej09d8YLqO4LeMxoyLd0Si5JCQ20donf1OnhLLqehiaAV+NUwmAK9YIrMM0Q14thpa7nUwDbq/VqdbZzdFpa/TUmMaOhUw3br7gZIchOo1iIPUinMW/n7Ku5E94wLLXGK5XtUPcJV4i6I1nz8BD4iYdVHtMHPQVQoRmysG6KvF1lEjkkOkRVGQPOUFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=429zkqkeU7loyUtKWqCl9RFFkbdKSrCIfA1+ro62eo0=;
 b=v5Gnd+1bl/J9UGkc7PS00KCtE8HhIez2rh/MHM4FJmcst9+B/aJym/6uV4NDa/QqNP+PZibBvRMC2CRKstSHXE5wUk9WxV+y4sI2Vs8/Hev2YqPHZDv8dV1ztAgDMdAt3mnS9f6s5LhMeOoLt6njaRt8V+6h//iFYMTtSbgzagt894CKPSpEX4Xsr+Ypulj305JZKZOnSkU6jbNPWUjZTAUYXY89uWRxXvqqxSe7kR3f7Joz3Ptj3NI6d9ScK4q9LusS1t3fG2Gx61B4ztP5UztzZG1m6+D/+42S3a/yN8fW/gXxJT6YOr93dBfbYMB+fO7UjD9SQXrCo2NAtIU6sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=429zkqkeU7loyUtKWqCl9RFFkbdKSrCIfA1+ro62eo0=;
 b=CBIdEUFz4zk8Yf+S7597BG2KbcBeoAQdIaWTUhCKBITkB6GTS6gIm8Z6Dl+AMdzqNky1CuDoRZqV3i6hReG2hQgvrkYFzWgxRqzqZoYXaaVqHSiHw/+VXR73QgTbFXuwRSIZiSo0VzpHm+18NtHKAqarhHlsyKuZ88EOSnThwfUBuxdz5oCzZtX3qmgJqX+8umGqIPI/moakRJ3imCIEeOMEat54KqFLw5Y3teDjzIuXfoDlQ7+9wwcTzUeH+vpGccx2PsURoDt0rcSmYQRgGW1swBZy18bcmDxYkvTUR/jemEoUl90PL6QTh2hrqBhc4naXPYuTJcJRo+sywc3i+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6681.namprd12.prod.outlook.com (2603:10b6:303:1e1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 15:02:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 15:02:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 00:02:33 +0900
Message-Id: <DIYNKRO2O5BT.1DKRN8KXOACFJ@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 14/22] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-15-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-15-jhubbard@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dc559d5-1f89-41f9-0852-08dec0b7fbef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uq93OSZOYYnBD8e2Ay+PXThz6J2hbsUmntuOy6ZwDgozZmG3LONnqkDqFl2X69cT9eshYqVBZbfGNhiwAHLSZYZ5ZK83Fr9ePAGiaab3x/Jx8cdDktnaeTSejvGyNDyHBuN5O+gfpd4rfQsr43o9upc90sS7fWgLrcO6UorhIcn4/0qAkrtAcKJU4NJOdchN2ViI6bfm7KLqsMzfAqSRHh476JNTdLacR6dWdmbc4ylitkkVFqAyEiTpO/gz8YlRG22UohLhxNtJsHuE0uoOJNPOgLX/8YvlQBu7Woo8JIkGkTEsUoeWS3d7VsiBeiMQ6jW+CumpxaFBbRlwKuSGv8ufOnLHMGttuRDZ7Bm128BJpOHh3Qbh+RkW9LzlSq6rhPnYcV0xR7+LSHUeNvsh39RK42NcjPMnNSC65OSZQyC1KiTa826uCmHxTnl514KeaSJzAVYZRu9linZ7rmJoSYtBTSYVCn9JjCDj1LRwpeqVxNrLWRSTp3Oumqy82qDRlMOCTrKjj+ONuVDffA2bUUjgOXuKvPJYuhO5SzstYvZhf65pK3uAq0pOs7sKO3CVLR+QLeugxzzi6mUfc/m/NYZbT5olDJRtz5dLlfjMjWggYNHSMTZyZm6KkeMY7HgllUC2/GgnyJYiMQmOFkriirIj32+h/o5o8DI8rEirOdj83eV7d+1CnxFef2XARI4M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MW9ia3R0OTgveGM2NXptV0ZvMDh2Q3hrVjZmenVNZlowdnVMMUxvY0ZFWFZi?=
 =?utf-8?B?UmhtUHhmU0RxQVBnbDg1UjVvQUZFcmtxdEMzQW1VWVRZOVVmemVoaEdlaTZo?=
 =?utf-8?B?T1J6NG9UemNyTWFRZG5nb1M3UDlBWWwrMlhxWldDd2xQWjl5emg1ZXRKRjgv?=
 =?utf-8?B?VzVGTnd5WG0vYWsrclZ2VVYzTVRkV25pYnY0NjdQY2NDazhYODF1MzR3alls?=
 =?utf-8?B?QWtnZnFIZE9hT3oyck5QajVMemxVSUl4aVZ5OHpOcFBlOXRwd2ZJMld2L2Z4?=
 =?utf-8?B?RUVXMExKTFlEcm4zaHBFR01HeXd1bTNSWFBZckJOMkp3dTRiTmhDejAvK0Ro?=
 =?utf-8?B?RnhiWWRhZUo0WWRPdGNrdzZ3OVRiTEZMZC9HSmQvbHVxZEs3T0d5M2tLL2hR?=
 =?utf-8?B?azI5bmJPNkU3QzVnQ3dSbUJpRnF3c25TWG1xcitOaGh4aDQrcXdqOWN3QUZv?=
 =?utf-8?B?dWlnNHowN0ZKcXBYb0NSaFhydjY0dkdNSlVlZFVLKzErVHB6VFd2a20wRkdB?=
 =?utf-8?B?c1N0VW4zYmU1OVFudGc5cWg1bUxPUTBtSk95Z3RISjZJYTZMa2VsZHl5U0xJ?=
 =?utf-8?B?c285U3d1bGtBYXhrc1RQZ05sZXZXNjdaTUFvdk5ReE02RmtvU0xBaUtaNXE5?=
 =?utf-8?B?dVprNkJGWldoTU5hREV3VXMrYlN4WEFWdmI5bGpDQjMyTkFlWlkweWdXbDRo?=
 =?utf-8?B?NDR5a3RDdjdnMFhxNm9ydmQwZXpzeWdvOUxSVVg5ZlovNnlWRmpSYlp5NGIz?=
 =?utf-8?B?SmMzTFpnSDFuZzF5NnpGbjlxbXhRTU40VitUY0xVeEw0dGFYTUxZZitDRWZ2?=
 =?utf-8?B?OUNna3E5UUxVQ21sVjV3blFJZ2UrUXRIaWtBYWxBQ2YrN204R2pRQUwycU5X?=
 =?utf-8?B?R3dMSFNlc1F3MWFUMXBKbzBWNERlNngzcTVPTnpiYXRsNFkwcGJzSk1HZVRV?=
 =?utf-8?B?SG1FMGdtLzlMMGFGYnBNL0o4TGthV2RIRHZ0SXFnSDZUNWFmNWRsamo3c2hk?=
 =?utf-8?B?SytYNGtWZmJTR2llanNIZCtsdENxQVc2cHN0TXh6T2lHTWhQWlM2by9aNS9V?=
 =?utf-8?B?Vkl3NmJQK0ErWGVmdmdEZVRZVldtK3RNNU5kWnJFcDBtb09PcVpKa0pVT2w0?=
 =?utf-8?B?bEdrd3RRNVVSTXpkbVVqZ3RTODJqRjVmejFDeVJYWWUrSGFFd21IZGhDWHJD?=
 =?utf-8?B?Tjhrei9VOUdhY1IvdjBzYjZTSmtlMDJ3V2lRY0p1anJIdGVmbThQTHpiaHlo?=
 =?utf-8?B?MzNPU0R0TFY2K3Yvd3l4dWpSc1lZS2xSa1lOSXhJQkNrWDdPVmlrOVdYNlMv?=
 =?utf-8?B?YjBBaEZZWUJpYnJSYWNwTzVQZTNyQ2lGYlRYT1NXVHdiK1oyZHNETFVDdUM1?=
 =?utf-8?B?b0tXc3ZIbWdkdG4ySGl1eEs4SElXQWxKVWRDMEREWUFpaEcrTnhUSmdzZis3?=
 =?utf-8?B?NENyM2N2K1pUTlRnVnBFaC9wWnJEZGRrOWlkT0RnNHFiSDZ4VDNRUU1FUEkr?=
 =?utf-8?B?VmwwckJDNHNjbDNQTVpsSUF5cHZKdzhJZnd5cEcxMzRPTjAxVlFhNHVCL0d5?=
 =?utf-8?B?bTZkZnFIdHlBbkxoSm0wRlUyUUFQVWpYYkRodU1wajVmOWdhMmJoYUVTTEor?=
 =?utf-8?B?TzhGU2IydjN2cVpJRjVHNXVsNXVvcTlJL0R1bVQxU3FCNlpnSGdxbWlmeHlw?=
 =?utf-8?B?NWFJVS9EbFpPdFlzaWxQMVMrUit5S1pmQ05JeGlLb1UydSt4Y2ZEQ1F2d0dG?=
 =?utf-8?B?aHd0S2hVS3lYbzA3SThLT1hYMjRicnJQdTM3WGJKdXVOeDBxQkRJWlJralhs?=
 =?utf-8?B?UzhJR3dpNmhtaWpSRFBjRHAzcStPVUg2WGp6OW13MXU0OW9Yb25ST2lJL2Rt?=
 =?utf-8?B?ZEZ4Y2VvTVN6bW1waEpXWm9ldDhvWm8yZjhyYUNIYm4yQmlBTDJjT2pwZVo5?=
 =?utf-8?B?VFJ6SEJEcStBMzA0eTF5RkxxN0hEL1krVDZtbTZqaXhiL3kyNUFPajR5MVZK?=
 =?utf-8?B?dmp5WElkbkwxR2lWVHp4YXBjM2hIcm15dk1NN3RNd1lNaTF6V3pxRU53elhv?=
 =?utf-8?B?ZjQ0VHI2M0dzZ3NoKytPZDU4VVlYWlhJczcxWmpnZ2wwdDdsSzIzY2MvOVBk?=
 =?utf-8?B?bndIT3hYUEs2QjZhWGFkcnAyUnpBZk54TzdoeHVCTEhFdmZBeHFvWHIwaWUz?=
 =?utf-8?B?MGhpZ0hRTkhybStIbmFITEgyYS9hVEdVOHFFU3FHN0lyVC9BOGVLdDF0Ukh1?=
 =?utf-8?B?Qzk2QTh0NUpnbU5NNTlqT1lxbCtEelRMK1RjeHJDZlJ5L3JvWHVXSlFRVW5t?=
 =?utf-8?B?MjlBTTQzZ2pIL1hIU2VJb3V3eEJjZFFkenFqMVlWbEl3MWMvbEh0aFhiY2k0?=
 =?utf-8?Q?WgcWlZ7/cSqT530rAky0cbd5PnZ9ozpJjULlZrL/pBbFH?=
X-MS-Exchange-AntiSpam-MessageData-1: dNzZDGTJmJKCHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dc559d5-1f89-41f9-0852-08dec0b7fbef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 15:02:37.6047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+ZTPG6qJYHObBlUvE1f+VpDxGzpw9vc9ecayQ5GFlzvJymZ5zfiONf+IvR2NdJwjNFBrUZVDA1zFLORhGHD4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6681

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 130 ++++++++++++++++++++++++++--
>  drivers/gpu/nova-core/regs.rs       |  15 ++++
>  2 files changed, 140 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index d9f87262e8b1..6b057d958115 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -6,12 +6,28 @@
>  //! The FSP falcon handles secure boot and Chain of Trust operations
>  //! on Hopper and Blackwell architectures, replacing SEC2's role.
> =20
> -use kernel::io::register::RegisterBase;
> +use kernel::{
> +    io::{
> +        register::{
> +            RegisterBase,
> +            WithBase, //
> +        },
> +        Io, //
> +    },
> +    num::Bounded,
> +    prelude::*,
> +    ptr::Alignment, //
> +};
> =20
> -use crate::falcon::{
> -    FalconEngine,
> -    PFalcon2Base,
> -    PFalconBase, //
> +use crate::{
> +    driver::Bar0,
> +    falcon::{
> +        Falcon,
> +        FalconEngine,
> +        PFalcon2Base,
> +        PFalconBase, //
> +    },
> +    regs,
>  };
> =20
>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
> @@ -26,3 +42,107 @@ impl RegisterBase<PFalcon2Base> for Fsp {
>  }
> =20
>  impl FalconEngine for Fsp {}
> +
> +/// Maximum addressable EMEM size, derived from the 24-bit offset field
> +/// in `NV_PFALCON_FALCON_EMEM_CTL`.
> +const EMEM_MAX_SIZE: Alignment =3D Alignment::new::<{ 1 << 24 }>();
> +
> +/// I/O backend for the FSP falcon's external memory (EMEM).
> +///
> +/// `EMEM_CTL` is programmed once with a start offset and an auto-increm=
ent
> +/// mode, then each access to `EMEM_DATA` advances the offset by one 32-=
bit
> +/// word in hardware.
> +struct Emem<'a> {
> +    bar: &'a Bar0,
> +}
> +
> +impl<'a> Emem<'a> {
> +    fn new(bar: &'a Bar0) -> Self {
> +        Self { bar }
> +    }
> +
> +    /// Programs `EMEM_CTL` with the start byte `offset` and the `ctl` m=
ode bits.
> +    ///
> +    /// Returns `EINVAL` if `offset` is outside the addressable EMEM win=
dow.
> +    fn program(&mut self, offset: usize, ctl: regs::NV_PFALCON_FALCON_EM=
EM_CTL) -> Result {
> +        let offset =3D Bounded::<usize, { EMEM_MAX_SIZE.log2() }>::try_n=
ew(offset)
> +            .map(Bounded::cast::<u32>)
> +            .ok_or(EINVAL)?;
> +
> +        self.bar
> +            .write(WithBase::of::<Fsp>(), ctl.with_offset(offset));
> +
> +        Ok(())
> +    }

If we follow Eliot's suggestion to drop `offset` for now, then I guess
will method will bring no extra benefit and can be simply inlined in
`begin_write` and `begin_read`.

> +
> +    /// Begins a write burst at byte `offset`, auto-incrementing on each=
 write.
> +    fn begin_write(&mut self, offset: usize) -> Result {
> +        self.program(
> +            offset,
> +            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increme=
nt_write(true),
> +        )
> +    }
> +
> +    /// Begins a read burst at byte `offset`, auto-incrementing on each =
read.
> +    fn begin_read(&mut self, offset: usize) -> Result {
> +        self.program(
> +            offset,
> +            regs::NV_PFALCON_FALCON_EMEM_CTL::zeroed().with_auto_increme=
nt_read(true),
> +        )
> +    }
> +
> +    /// Writes the next 32-bit `value`; hardware advances the offset.
> +    fn write_next(&mut self, value: u32) {
> +        self.bar.write(
> +            WithBase::of::<Fsp>(),
> +            regs::NV_PFALCON_FALCON_EMEM_DATA::zeroed().with_data(value)=
,
> +        );
> +    }
> +
> +    /// Reads the next 32-bit word; hardware advances the offset.
> +    fn read_next(&mut self) -> u32 {
> +        self.bar
> +            .read(regs::NV_PFALCON_FALCON_EMEM_DATA::of::<Fsp>())
> +            .data()
> +    }
> +}
> +
> +impl Falcon<Fsp> {
> +    /// Writes `data` to FSP external memory at byte `offset`.
> +    ///
> +    /// `data` is interpreted as little-endian 32-bit words. Returns `EI=
NVAL`
> +    /// if `offset` or the `data` length is not 4-byte aligned.
> +    #[expect(dead_code)]
> +    fn write_emem(&mut self, bar: &Bar0, offset: u32, data: &[u8]) -> Re=
sult {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut emem =3D Emem::new(bar);
> +        emem.begin_write(offset as usize)?;
> +        for chunk in data.chunks_exact(4) {
> +            emem.write_next(u32::from_le_bytes([chunk[0], chunk[1], chun=
k[2], chunk[3]]));
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Reads FSP external memory at byte `offset` into `data`.
> +    ///
> +    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL`=
 if
> +    /// `offset` or the `data` length is not 4-byte aligned.
> +    #[expect(dead_code)]
> +    fn read_emem(&mut self, bar: &Bar0, offset: u32, data: &mut [u8]) ->=
 Result {
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let mut emem =3D Emem::new(bar);
> +        emem.begin_read(offset as usize)?;
> +        for chunk in data.chunks_exact_mut(4) {
> +            chunk.copy_from_slice(&emem.read_next().to_le_bytes());
> +        }
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 2cb1f02f35a4..da7a10c0346a 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -475,6 +475,21 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64=
> {
>      pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
>          7:7     allow_phys_no_ctx =3D> bool;
>      }
> +
> +    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
> +    // These provide the falcon external memory communication interface.
> +    pub(crate) NV_PFALCON_FALCON_EMEM_CTL(u32) @ PFalconBase + 0x00000ac=
0 {

OpenRM calls this register `NV_PFSP_EMEMC`. For some reason it is
defined with an absolute address, despite at least another variant for
the GSP existing. Thus I think it makes sense to keep it relative in
Nova, with maybe a name closer to its OpenRM counterpart, e.g.
`NV_PFALCON_FALCON_EMEMC`.

> +        /// EMEM byte offset (must be 4-byte aligned).
> +        23:0    offset;

In OpenRM this is actually two fields, `offs` and `blk`. The two
lowest-bits are also not used, we should do the same both for accuracy
and to make users enforce the 4 bytes alignment.

> +        /// Auto-increment the offset after each write.
> +        24:24   auto_increment_write =3D> bool;
> +        /// Auto-increment the offset after each read.
> +        25:25   auto_increment_read =3D> bool;

Similarly in OpenRM these fields are `aincw` and `aincr` - let's use the
same names for discoverability.
