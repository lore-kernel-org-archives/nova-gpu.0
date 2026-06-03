Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012055.outbound.protection.outlook.com [40.93.195.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AE43F23B6
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 05:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780465521; cv=fail; b=sQ2+NMfa0gr6gWQWQ2igObw/wW+tB4TZzl6v4fYgSr7w94NqVnEFhH7Hfcxaopn8YLG0mTJ7RhYZU1FyrHrIrS6aWC0ofwsNxuIa27tTSV5jBZJ5YSaTNhRRpqnjBT4Iqj6mzNNBardVJVKKZHjzs2mBqjvPFVomiZt0aXEecTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780465521; c=relaxed/simple;
	bh=2KI4YU355ocDPEdeRHhxZZbSoPy7IffAsMKZqQhGtzA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=olGoMueNxokARMPgLzPtPg2RIuOw4S44MuLx7t0T9wDd352Q2jN6JBxeiPiOhQ0FK5KJeNT42pEYKSb5NE+9PQRV/lRavWrVdH8XQ8fn4NdB8ELL58mupEmfb+MDjGGjLw4YKOqwstgwBedLMVgldaC7gV0kn1k4OFfLxhIiiKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/LaIR97; arc=fail smtp.client-ip=40.93.195.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/LaIR97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AM9e5vemoGcjPj3KUlyiEUIfdS7NrWnRoxUNRxRyTf/jwCJ9Wmcgo0Y1K7FJHELp1RonqWIoXUNEFXKEFmzbNMBmWxcHPMuHKaDeH3IYOYT/ZkExTeLDIe9pBxlAOWXvCRvxHbMJlTwOBoC84A/5I07oU6sNwe9chqiwMZ8PeX1f/gxIYdjP4SVEwUJFgAq3VAFh+/QhjELqywT3TNI1b+JaA1oybky+9pII61mbpNcEB/SV/VQYcZTMp7AOUeF5hB5wtZWo65bV0IIIK1aeVLwz7yzG1Vs+lWWazqMIwRfaCPUImfJalB6+GtSmP/YC8SAUT/9Q/nZWFbGNqz0udA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OJiby8Ed3LYj2XKLmrpEVnwllO4t5LQnl5pzZ7/VjI=;
 b=MhuJvhHwvMIwffdZRZzetyBU+Dyoj8YkMUIB4cMolTtxZz+phqPAGWNAu76yKxG3+BafMy7uLTCFs/g3c6j2INKQWFo6RvSWaEWYOspafoy2T8v8MOOHe69RTBpY9/BRKBT2vFF/qYzM12Czg6XuFVMQIiyDKo5DD12Gm+Lf6w55piRirom+UVchzXGGvzXV5LpK4S+cgpTWMoGxKTvY5dLUj2U7rFx5vM7Sq1KB7Q4zc3GThZ6IOcEqE+Ws7gFyQHpw79m/wiRY5IJnXODJlxeCv4sysbS/fxmVKjLXQ9Kloaknr6oU6xK9OHh2MjPHibt2tLUCWvE6yWzVOMhHKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OJiby8Ed3LYj2XKLmrpEVnwllO4t5LQnl5pzZ7/VjI=;
 b=n/LaIR97njGFrdYaMapoWlISCHB+BEFW446SawaN4mqNnOGnQzyiYeyaJ6xkd1t8VBBDYbTMoc6jUwKRx9ATUwXvPIivv47Fy7ENIYtSpt2Z2KqtbWyD3H8vPyjGJ6dFx0t9Fonh9H/gPClzz5gTHUXenfNIRJNxkv0b4QR65+6KGUkRUDePuybX2QdcU4dq+dTQ8+5twenvVP15PxeONcQQrz+/j/Vs3iqZYVHC+YsYXWZAF/kZKwWmOvry5auVjIT8L8D3197n2QLW3fheQ7Pw9AZx+OOpDt5jx+kDKjZGr8+1javg60UjFwL29/L/SpjGAbJ5cec5TxyGMyxuYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 05:45:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 05:45:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Jun 2026 14:45:12 +0900
Message-Id: <DIZ6CKKMMMPT.2CFC5GKHCF8TP@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
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
Subject: Re: [PATCH v12 20/22] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
References: <20260602032111.224790-1-jhubbard@nvidia.com>
 <20260602032111.224790-21-jhubbard@nvidia.com>
In-Reply-To: <20260602032111.224790-21-jhubbard@nvidia.com>
X-ClientProxiedBy: OS0P286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:b0::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: a5130f38-70d8-4c04-208c-08dec13349ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|3023799007|6133799003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sbxA7oZRzdFByJl7M3at1u+G3SEyjtLGWZpdXRwCeQexn4cf7NBk904g8eBfH9PbiBYPnasybiaR6VMvI161aQZgKquPJhK7yfW8Ck6U3lgITfSPcKkGjJoJlOCfoFxaK/POCxOXKaEwjW9s1Ror2lnxHQOH4BO3i0VX9iDL6ro6FQ5QuucBeFa9SvmiiwzNmGlLjnK9vy3Yk5uaBc9BP9pRYX6PgEFvmn+c4+wrBfV0Xf/J/4t9Ej2cqtKEREW6mIcGkcY/qafBaghN6IpDJw3mNlBgeqXDE8UodxkHHY+V4RATu/JY8oKRALESNKUNRP5d8JcMoaViRx8Hq26qLzTP8k+rQi/rndopM3LvTv+N8cakq237KS/F2qXmvLNpEEL11DP5TRezJPzwxEiUj9Mzzg5iTYXwkfUyeY3DPESsfS6J0pu9EbqCSxEAt1dc/rQxuWhDbPkS6QeDtK2Lm7yZlhdj5hdwIgmEdRjLrrQSoEPk8q38UOa6t8lVBhX4y9A5RNOJHWoASpYKvvWUrF8QhxbXWcmGBYS559Al2yJL9/RxhbqZghZjwa2CTOvY/V6Fht0X7+zYYDgxmDDS/lAapEgaqrE57IY/18iWtqUhT2u0Z/n/62HbeRXQrROIeq5Hx/NBZepKARUuPWFerTQMwRC8mbhXHbG8zBacDlklCyvOFY4wsyxYUdrXR8ms
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bysxTFhOdWlxVWZaZ1djTmYwakxzZUU2YjlaeUdjdFMyYmI2Yk9HbTNJRC9S?=
 =?utf-8?B?V1crRTlUWmdMTWJ4cTZxZEc0SHJ3ditPcGxxeTBwRVgzMUtHR1ZEMjI5ZmJV?=
 =?utf-8?B?bXFwbFp4RXBSVW5iQUlmU3RScWh4a3BiY2w5Uy9kekEzS1VWU1NQZHVIU0tV?=
 =?utf-8?B?a0xDS21PYktQWTBTYjBJSkRweWdOdmc2OWR2enIwdUpnVlNObVlzcHc3Kyt0?=
 =?utf-8?B?L3ZmOUxua1hjVFJwVi9rTGpVclg2SFhESDliVlNsdmROUUR4aXJ5WUtDOWRl?=
 =?utf-8?B?eGtxMk1LSHdHVjVXZG5Bdm1NcmRpaWd1QktxNHRDVkd5S0FtOWw2M0ZJMTZS?=
 =?utf-8?B?YlhRNVRaa1BuZi9SZHZyNE95b25mSjZKZjY2TEU4WXNiNEtRMjAreDMzOUlp?=
 =?utf-8?B?bzNISkFjUUZHczNydlAyMUgvZXhZdUVRMGZQNm5KdUdzWGF1dVJidzZDZ0Vk?=
 =?utf-8?B?dTh3akdSRHBaODNCOGlpZG1jdFZoUTBTanVSMkxqeEFzanNwNWFBMUNBdDdJ?=
 =?utf-8?B?Um9DcTdIMCtiMUZSem00SHVyaEFRWHd2MHpwYldvNjFmZjg1YWRHc25jeExR?=
 =?utf-8?B?NXJ1UjVLYk95Y3pWNisyMm5STk1qSHZSbGNZaElxa0FOT1V4QStTM1JGSlVF?=
 =?utf-8?B?QVNMUzRoOWVla1hMWnhpZnpLOXp4WGpydjVwWGswckFwUUYxMm9qL1J3aEhn?=
 =?utf-8?B?UC9xSnNlTVhJVi90QVR2L0tYLzlBMUpZTmVHRzh4bWx4cVVVYVBiaXcwVzVB?=
 =?utf-8?B?dFY0ampPQnNUR1ljRWw3djVkbjRHaHdnN2JVcC8wTzM4QTc2dXk2RHhCY2VE?=
 =?utf-8?B?YjhLdEdjdkRHQ29YMEZwajQyTjM4Q3JBaU9ZeDNXa3NkLzFGQUlzOFgwUHBh?=
 =?utf-8?B?U1ZwK0R3cTZsQ0pUcGpERXRYWnhsRkpvbFh2OU4xa2lVRG5lVDFxQ01sSkxR?=
 =?utf-8?B?bnhLby83TkZ2bnRUMkR1TkFVby90QmlVUGhQQ0JueCtsSUp4QkYvWlVnUkFh?=
 =?utf-8?B?L2tiYUhzWHQ5dnBtbzBtbTBqQWN2UGRmdHNQUkY1aDkvK25YR0pEVGZka2NX?=
 =?utf-8?B?VkZRWlZKZDNoc1gwb0ZkWnY2MFE3RWk5UU5DS2xaRjJOTWpXM1p6eHZrVXo3?=
 =?utf-8?B?b2Nia1h5V3k1eGdzV0gyY1ZMVVRjWXBPTUZHSHNOZm1SYjJjZGJJcW1BRG96?=
 =?utf-8?B?VTRlcVhxaUFFb1lPNlJnWDBMQ0hwM0pIQ3I1TGJGOE04QTlPUVNxeWw4ZVVz?=
 =?utf-8?B?Q0lsaHBZK2N1bHQvbkNhcW5QNkZWTmZpVG9QWmI1YnY1b2dIclUrSUlUZzda?=
 =?utf-8?B?dWlxWmQrclRYRFc3ZUhiUUhJaTlLQ3RDQzROd2QrWXpPSFFxUkhsUkR0bEZl?=
 =?utf-8?B?b0YycXNFRExqMnlGckI0elF2Ujd3RFdJWEhZalhBVzJVRlc3TGlOSmxRVWsz?=
 =?utf-8?B?SkRVMHJPQXJERWZBQUNXaG81OFJWVWJEc3JiYURSQWVTeUNiYmtYekdweWlY?=
 =?utf-8?B?ZkdEeWNkeWxMWHA4ZzZzSUVsVFdiSmpSY2Q0L3V5U0E4SW81WDNEM3ZDTUo0?=
 =?utf-8?B?TWFxeUxaKzUxelRtLzZCUktocm9CVjArTkdWaDV0VytBU1oxK1hnZWZDemsw?=
 =?utf-8?B?dzFVZVFLc05lTWhJb2tKL0pLOEh3aXBlMWJFV2J4NE93Q2N3UXZaenpUdFZX?=
 =?utf-8?B?aFgzQmV3OFB1NTZKMHhrdHZsWSs2R0tELzFocnlZVlF3aHB0OXRaZ0tjK1lk?=
 =?utf-8?B?cFBKcVJmOEJxVVo4eW00YXNSSkFxNGgxcW5kb1B2WlJ4Vk9XNnl3Uml0akwv?=
 =?utf-8?B?dWo2MzcvTjRZWGtkU2ZDR3pnclJnY3BoUGVWOVRBRXR4aXBEd01heTNZVnU2?=
 =?utf-8?B?aGVRaW9KM0xDc1QwdFV4Z2tCaDFXVlRRaXA1UGZKUFcrSk9GS2FaUVk0ejYr?=
 =?utf-8?B?ZVZ5WlJEakx1dVlaV3hBeElDYlhPRzdQSDYzZ2VUazUvcGVUWkpvUjJiV1V0?=
 =?utf-8?B?SGtOT0JUVkVCVEdES0RXeW9hVS85OWI1RWROYkZ1ZXI0dkNOaERYTFdZK3Ns?=
 =?utf-8?B?cnpFOU1SUkN5S0dzV0ZQc1NaWFhXa0Myb2xCbjhzUkZrVXRRcDd1Ym9ZcVBO?=
 =?utf-8?B?MmF5cE8wOHFVdUhTSHh1emJ4TDdRU0VqQTdONWIycHdWc0hDOHNicFArRGo4?=
 =?utf-8?B?MkpCbCszdndCNlc4WlpsRWx0S2grbjVDcExNS2psRjhKUWtrK0lRdGhXK2tx?=
 =?utf-8?B?ZUZERHoyVXgwUmVhTkE0MGNpeGJMWkVZbkl1YmRZTEpWNUlLeHo2VWQ4a3dH?=
 =?utf-8?B?NW9VdSsyUzJLYlR3WTJDNVJ2ZnBEYkpHU2J2VTBpcDA2eE1ITGF6ZEtMU2pK?=
 =?utf-8?Q?+/MUqt0+T+EzWIBw+MYx6q2gMtgvsY8p6JArmzRh14ayA?=
X-MS-Exchange-AntiSpam-MessageData-1: 2y2quhadaXz0/Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5130f38-70d8-4c04-208c-08dec13349ad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 05:45:15.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwlIND7ikAoZnbpdD4DUAJzVifYRuR55WOB4GtO9/F2T7lECVEPSaL47WX+VbQenSKpPhxabiRhqRtWVXzM+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

On Tue Jun 2, 2026 at 12:21 PM JST, John Hubbard wrote:
> On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
> After FSP Chain of Trust completes, the driver must poll for lockdown
> release before proceeding with GSP initialization. Add the register
> bit and helper functions needed for this polling.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs           |  1 -
>  drivers/gpu/nova-core/gsp/hal/gh100.rs | 90 +++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs          |  2 +
>  3 files changed, 90 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 352ef7683cf2..aec991afa669 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -142,7 +142,6 @@ pub(crate) fn new(
> =20
>      /// DMA address of the FMC boot parameters, needed after boot for lo=
ckdown
>      /// release polling.
> -    #[expect(dead_code)]
>      pub(crate) fn boot_params_dma_handle(&self) -> u64 {
>          self.fmc_boot_params.dma_handle()

Since this is a short method, let's introduce it in this patch to reduce
the amount of temporary dead code.

>      }
> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index f41f3fea15ff..02aec5281389 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
> @@ -5,7 +5,13 @@
> =20
>  use kernel::{
>      device,
> -    dma::Coherent, //
> +    dma::Coherent,
> +    io::{
> +        poll::read_poll_timeout,
> +        register::WithBase,
> +        Io, //
> +    },
> +    time::Delta,
>  };
> =20
>  use crate::{
> @@ -31,8 +37,85 @@
>          Gsp,
>          GspFwWprMeta, //
>      },
> +    regs,
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
> +    fn lockdown_released(&self, bar: &Bar0, fmc_boot_params_addr: u64) -=
> bool {
> +        if self.is_locked_down() {
> +            return false;
> +        }
> +
> +        if self.mbox0 !=3D 0 && self.combined_addr() !=3D fmc_boot_param=
s_addr {
> +            return true;
> +        }
> +
> +        let hwcfg2 =3D bar.read(regs::NV_PFALCON_FALCON_HWCFG2::of::<Gsp=
Engine>());
> +        !hwcfg2.riscv_br_priv_lockdown()

For this I would prefer adding a method to `Falcon<Gsp>`, as it allows
us to keep `NV_PFALCON_FALCON_HWCFG2` local to the `falcon` module (in
prevision of moving all register definitions to the appropriate module).
