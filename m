Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012026.outbound.protection.outlook.com [40.93.195.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF3840682A
	for <nova-gpu@lists.linux.dev>; Mon,  7 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764372; cv=fail; b=XRavybeS1zQbGroaTLpVcEhDgzWRydqAJCug1y88k/Lv8Li7ZF2Vk0L9h76wbIlY9e8F/NKqpXjZF4YpgtHrq9QP5ZbNDv2s3Bc7bn7lZoyI4bFddx/TTE8KPaIWYVkh5tw19VdhejKPv8mr7Lu5BcYavuy+qZMCgM7X/1k+pVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764372; c=relaxed/simple;
	bh=0G0ojkcufg2OwTcpWaDhdg5bdwHBvxLgHIi5z5Vy7o4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=L163u7igq/DjRCOPoRanPVGSFfyJ5GM+NvungFXIqRctxm0+xj6nQMOhoaBenVX7xfSQEw9uT0kZ6Q85ZUHPhmaWXRhcszX1jzFLeZbZYqkhTTwdxvKmgu6m186NP4CabJvrgIoUpkStb99S+UcvkXRZhtMRzhWncpDpRgAOGgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uor1x1jn; arc=fail smtp.client-ip=40.93.195.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uor1x1jn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJxhubNcUC5EOHvZMkLX9ZtFqToZfLviCb1/KqU4qNoiZ62D0zVpaJ++2IppnGET36gvSM50iL7l8oGxOe1pIbHvM/DoXvRUiIAUW+rz5FZOBLcXDWguGR8v5TMBUH5eUINA/P2i70SeuOHTb3cjQeqM8TkM3usC8IDXVpNskDbZTmuFpgWc2e162D9FUTlJJ12qw5O/iChLG5/1KC0BBae3HcERq4enUhPiOAFocb7tat0Q5VGLJMTDPwhyfmRja2gAeevgRj17CZpmVk547DKBtRgql8LornqwHrA6+yrAZcYfqMULXqkQpauwWnFHJ+hor0ZZVVSp9fg5LEp8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrD1ngQN0YM6Qdm4x9NjSKfu6+kiGjHKgw2Q+lPy1FA=;
 b=B8NntdwToB0LHQhBA4rEBoFpyrpMo14L67b0dUbXinJlfhkf4JWOHqdyHntz/yieRQ/naIBVhSBfXt/hIQMvEZtvGUybj4QwqjKiP/+y1KhJdlpkLQl/KqTKDP2sSL9z4FbI0Uj0FtwEfSA0s00wReKlR5CIJlSJHN2KG6LpyHqqogfAr/PDZc4KNp2vDBaolGWBH2YTOsRcgUihPBQuRsfVeqfbBohxneYL1WN73DCMk5z00YdEaPybxGLLJlIrDSsz2Vbxnmj7qe4Ra9D43tdkVcRjGphd4cwDFyesCjV9k9Zu2M1i0c3e8Q+Zn2v8X1Whk9uTJzBYYYvBNJjM7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrD1ngQN0YM6Qdm4x9NjSKfu6+kiGjHKgw2Q+lPy1FA=;
 b=uor1x1jnDzw74WQwJa2Y0IGn/wtaIEyG69unRIeZ/Ky08ya5sx9l8YmBR7c2HLd3dmAMClFrearph8+ZpXgjSR1rE84pcS7zV+EUD7cGkHYawjm5JJIo07kQOX6Nju/vuvkJY86ODrtx25eAOAM5CW1KSPQJarHIsQxrUGqBt5CCB/pLJlSDg/wmmGitEfUCp7HjOLTNs188qvDGGkcQ1fkBRwDC32AgDMetNMWk1fuCYiwCrVrxAsrwb3vaGPcIBlJuYmAMnZjmNHdEB2r/Yu6m3YRg+WBAMM6/8scDJDTQJwav7Ll/wqXeXijC6wu3dUYmDNT06AjBV4cbWpAz0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY8PR12MB7314.namprd12.prod.outlook.com (2603:10b6:930:52::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 06:59:26 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Mon, 7 Sep 2026
 06:59:26 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Sep 2026 15:59:23 +0900
Message-Id: <DL8W1O8BW36T.2HVKESOX2KAWX@nvidia.com>
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
Subject: Re: [PATCH v3 12/14] gpu: nova-core: drive GSP events with the
 SWGEN0 interrupt
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260903031514.1515905-1-jhubbard@nvidia.com>
 <20260903031514.1515905-13-jhubbard@nvidia.com>
In-Reply-To: <20260903031514.1515905-13-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0107.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY8PR12MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5e667c-e20b-4e80-b971-08df0cad8e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10070799003|6133799003|3023799007|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9adajhmnw7JUAjuik3fZg4L8EeB2w7oGSLFaxcGva2lU+aOxZiHDWrET96XQQ37oRdXGXhAAFPLzhTbrTn6NbhLPdHQCiy1XEuRNp7iCMF+oDn0EjiNJhay7o8XXx0tBk8IjIva9aIqc5MwZ59Alj97LeLXzOvi71arV6+zs3LwW6zAMm3YCX3mkswo9SOTE6iyKT9Jx0YTsBWoYR200Q3/20LCxQ++njruJaZ/hNRLOOkAkUixVHktvdYxS5VfQ80FpwTWSMKzQ+btiaDc4D+rX+mVjSFjsWwpK9oScu+JiWASh9mxnS5VJEIFt6KgsfFdHueVT1tteVouImqYhbNalxFfJFa7xttALuvoqkLKC6u3/+g41F/wunuxS/y4HfW+l73bWot0kWz0uahiPJ/GhZj1wwAK66T6mjX3JA3o1sQfCfOQ09YcILC3hLS52lgVni8LCHq8ued2BJKFGA+2pIBmIzGHzGiTpK3D4uznv30AEG8v5xGljfXwpclwBknuKaPYGO7FtYdV2zlQAS9u6tKfFKUS3Of7YUcgWHVidLvRcxH04AomxBXmfYOG0YOMYgfLM2QeRUIhbRzyV+JJr5zNdMEdQyX1rL9SxFJwBkwXMSGJfpcJnMgyBts9BLhHc1304mSvInboIbbrRk4mTtwkKHIYM6tBi7cTbA0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10070799003)(6133799003)(3023799007)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERvbEhEQUo3UWRMckFBTzVjU1ZmbU9od2hRVG8vWTJwMXcwYU12bHpOdW5t?=
 =?utf-8?B?Yyt6SXkrL3NaSFZWcitYL3BqL250QS9TVnJyWHJBbDBIUXBTdmp1R2lFK3VB?=
 =?utf-8?B?bXcyVFk5SE5tKzVhWGgxdnQ0clF1azN5aTdXaUtSbzBOQlF4Vk5EdDhoSnIz?=
 =?utf-8?B?R2pHMHZUN0p1a3FkbzBjcG9ocmltOE9MRW8vVno4QVB6SzFpc1VqdW14TlZY?=
 =?utf-8?B?TWdZQnFXelU4SkZld2ZnVHhMUmV0RWFjbVRPMlNkNThGMkNIeVJUZzRiN2sx?=
 =?utf-8?B?RDJ1ankzRWlaYjl2WEQweTZrY21paFd1YVZjZjFud3F2TEpCd2ZQN25OTUZw?=
 =?utf-8?B?QUQ0M2tvdXJERTlDUFZnNVNNekt2ektBaExFM1hITDlLN3NDVVR6Ty9TOGNS?=
 =?utf-8?B?cnN6TVh1S0hxR2dlQkcwZlUwYUdKcUEwU3ZiZlMxTXYyR2w1M0IvSENOR0l1?=
 =?utf-8?B?bC9QeFp4cjVyYU1WT3VJUW1FeEFqUmlVcVJ5a1ozUVFqVitGMmhPVGI2QnNZ?=
 =?utf-8?B?b0JORXo4WWF3bjNjTjBXL3haVS9GOE1RSXVuSXRsaEwvUUprZFhTWkJPYjl0?=
 =?utf-8?B?aUx3MVVvTnhPU3QrNmlZU0ZyUmIwQmEwQitQYWIxZjRXZ3ZaN3kxVEV6disv?=
 =?utf-8?B?UVA4d0txa1o5Zlpvc0RTcm5GT2ZBVWNFVG9MemJnT0xobFVNV2dEZjVNaE5T?=
 =?utf-8?B?WWZDWm9xTTQxU2w5eGF1RUdEVHM4VFRzb001NFhQRzdNQ1QvWUxtWjRST1RL?=
 =?utf-8?B?WkRlU1JsU3BiNDIwM0FLSDVCVHRocWJWQk5BeCtuMnJ6Zkl3NXdHSlY0QU8v?=
 =?utf-8?B?L1dxcWZwcjBXMXhNbUpuWitMVkN4OTZZaSt6czRBeDZBa1k0V1NnZjRsNjl2?=
 =?utf-8?B?bnc2STJnVjN0cjJpd1VaRHZEQjJjTFRtbi9zL1drdExiTWN0QWtrN2VCV294?=
 =?utf-8?B?Y2QvZHV2TFE2UU94eDB2OHVPWDNCdkRFM0ZoYnJaeHRpOFd3c096ZEhyNjhw?=
 =?utf-8?B?OWlWUXV2SnJ6TmZDNTcvczdFSjJJNTIwRjhLeHpJV0N1ZGdFTklwUGdWeWk4?=
 =?utf-8?B?Yy9nVmdVSHBXNFQ1UjlGSzlabzFvb2I0dERtbURSaVFNOWM5TzBzeitvdE5T?=
 =?utf-8?B?S0Q1RFZ4WG9LVDY4a1VTb0UzdHc0djhvYVRlNGFYWVJ6TWVXaGRCNjVsY3hI?=
 =?utf-8?B?anUyaHl5cXo1LytHdU4vWWpGem9JUDhZbWUwbEJUQ29CZG4zNDdZM1FtcFFo?=
 =?utf-8?B?TjN0dlJvU25zSEQyWFRwbllFNkNWSndDazMvSHlxNUZjRDZ0cy9TdVhNNUhi?=
 =?utf-8?B?eTNUNm9vTUY5di9XSUwwNndMbE01SVVuMXpxWEFSUmpFOU9tcXBHZGtEQUlC?=
 =?utf-8?B?TmxkVkt2eXpEcTdycUNDY3NPdU5EbnYxVWVEa0lRQzNlREw2Z2ZPVGtyalhD?=
 =?utf-8?B?c3lYVXRDNGVac21QaG55QXlhTnFYWm83NHlIVEZJbE5NSmFDTEMxclhMYTFx?=
 =?utf-8?B?cWJnVStaWno3eW4raWVlL0R0Z1p2L0ZXcUc0NXZFTmZrVWE3bWZhZjZ2VVQv?=
 =?utf-8?B?UGM1amd4eW9PUFpVYkVzblJDYlFiaGpCU3BwVjIrTVN6TE0xM0Nsa3VHME5X?=
 =?utf-8?B?c3VUeUM5WXZPS0tIbWJneXVZQjYzS0ZaWnJ2YzJ4YU1XRHZIaWVXT0xER1lX?=
 =?utf-8?B?MWk3eEF4OGdLM0VmODR0MEtobzdvbjNjeGFRTFRFT1Fpd1QvZVlzR3k1Wm5J?=
 =?utf-8?B?djh1M2w5UFVaNkJFZXhQT0lCWE8rckJLOTZ4UmNqc3JyUkF1azMvMjg2WWF2?=
 =?utf-8?B?c2ZZRTZESU9lSTlFQ3VwZ3dnMDdQR2JFRzJTRVJHUjFWOTNmaE9JSjN5UVRn?=
 =?utf-8?B?V3hDcW94dnpXbjhpNkhGRDQ0M3NUOHdIeWpJRzMrUzNWT243KzdaQ2hzSWJv?=
 =?utf-8?B?bnJlV0xoN1ZYclJVV01qYjJOakpFVnZ6azVSYzM1a0gyclI0TDRIb2gwZHhJ?=
 =?utf-8?B?endmQ0FEbWxaZmtEQU5xWXFuWUJrdXgyS092d25SdkJkbHFBeUsyZTB6RmVo?=
 =?utf-8?B?eGgrOHZxWkhTV1E2TE5JWFJBTzBTNzhXUTQrMUt5eXVBTEdQZEZ0Z3JBek8y?=
 =?utf-8?B?ME9CdWtxeFZGWGtJdGdwdU1nUkdkVk5lR1NWa292WW1VajREYS93d3d3b1l6?=
 =?utf-8?B?d2J3bmpVY3ZEYlB3L3ROZmRGdzJNbWF5bmpPbDJLYzl5bjR4SWRrcllpL21P?=
 =?utf-8?B?OVJnOThHWnAyM0d6TDRsTVJicUZsSUZjdzdsMUNtUnJoS0syMXZieHk1WWNJ?=
 =?utf-8?B?NEVrRnA4cHFEVW80RnNyZHBSKzgwclZSUS9DV3ZoRk8zT1B5dEVLU2Y3cG1y?=
 =?utf-8?Q?iSYOETO2x0lPd8sX2rU/dOziBVHqanBshshZCRcqiz8vr?=
X-MS-Exchange-AntiSpam-MessageData-1: GYpacrZMpledmQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5e667c-e20b-4e80-b971-08df0cad8e0c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:59:26.3807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fp2slSNq4mhvPL9BqLzRJfiIaQ4JkAFHUBku8oaf1XXqPsmI12TyPeGU9cyzpjdQ/1HQsIdubP2J5MxTiLk7mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7314

On Thu Sep 3, 2026 at 12:15 PM JST, John Hubbard wrote:
> The GSP posts events, logs and error records to the GSP-to-CPU queue and
> raises the falcon SWGEN0 output. A falcon signals the interrupt tree
> only on a transition of the causes it routes to the host, and IRQSTAT
> also reports the causes the falcon keeps for its own RISC-V core. GSP
> boot polls for its own notifications, so it leaves the SWGEN0 latch set
> and leaves pending bits behind in the tree.
>
> nova-core drained the queue only while polling for a command reply, so
> an event sat unread until the next command was sent.
>
> Service the queue from a threaded handler on the GSP notification
> vector. The top half runs in hard interrupt context and touches only
> registers: it clears the GIN leaf, takes the causes pending for the
> host, writes INTR_RETRIGGER so that a cause arriving while the top half
> runs still signals the tree, and rearms PCI delivery. Draining the queue
> takes the command-queue mutex, which can sleep, so the top half wakes
> the IRQ thread to do it.
>
> Intersect IRQSTAT with the RISC-V routing registers the way Open RM
> does, so the firmware's own causes are left alone. Clear the latch of a
> host cause that is not a posted message, since nova-core has no recovery
> path for one and the retrigger would raise it again.
>
> Put the interrupt setup on the GPU rather than in the driver's probe.
> The handler is then torn down before the queue it drains is freed, and
> before the GSP is unloaded. Quiesce the tree and clear the latch before
> registering, so no boot state reaches the handler, and keep the subtree
> enabled at TOP for as long as the handler is registered. Quiescing
> disables the subtree, and under pre-Hopper MSI the rearm is a
> configuration-space write that never enables it again.

So this is a mishmash of many different things which makes it very
tedious to review. The falcon HAL stuff belongs in patch 11, the new
`SubtreeSet` method in patch 3, `irq.rs` changes where relevant, the
Cmdq::drain should be its own patch, and this patch should really just
add the handler and wire things together.

> Assisted-by: Cursor:claude-opus-5

On this revision the AI assistance showed mostly in the tedious comments
restating what the code does and the unneeded churn. These really take a
toll in terms of time and energy (and dare I say motivation). We need a
more thorough human pre-submit pass because otherwise the net effect is
a shift of labor onto reviewers, whose bandwidth is very limited.

<...>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index 7e532889a1f4..5272b3b63ae4 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -1,8 +1,15 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
> -use kernel::prelude::*;
> +use kernel::{
> +    io::{
> +        register::WithBase,
> +        Io, //
> +    },
> +    prelude::*, //
> +};
> =20
>  use crate::{
> +    driver::Bar0,
>      falcon::{
>          Falcon,
>          FalconBromParams,
> @@ -12,6 +19,7 @@
>          Architecture,
>          Chipset, //
>      },
> +    regs,
>  };
> =20
>  mod ga102;
> @@ -72,6 +80,45 @@ fn signature_reg_fuse_version(
>      fn load_method(&self) -> LoadMethod;
>  }
> =20
> +/// Returns whether `chipset`'s falcons implement `NV_PFALCON_FALCON_INT=
R_RETRIGGER`.
> +///
> +/// Turing falcons do not. Ampere and later do, including GA100, whose f=
alcon otherwise uses the
> +/// Turing HAL, so this is keyed on the architecture rather than provide=
d through [`FalconHal`].
> +pub(crate) fn has_intr_retrigger(chipset: Chipset) -> bool {
> +    !matches!(chipset.arch(), Architecture::Turing)
> +}
> +
> +/// Returns whether `chipset` carries the RISC-V interrupt routing regis=
ters at the Turing
> +/// offsets.
> +///
> +/// GA102 moved `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST`,=
 and GA100 kept the Turing
> +/// offsets, which is also why [`falcon_hal`] gives GA100 the Turing HAL=
.
> +fn has_turing_riscv_routing(chipset: Chipset) -> bool {
> +    matches!(chipset.arch(), Architecture::Turing) || chipset =3D=3D Chi=
pset::GA100
> +}
> +
> +/// Returns the interrupt causes a RISC-V falcon on `chipset` routes to =
the host, in the layout of
> +/// `NV_PFALCON_FALCON_IRQSTAT`.
> +///
> +/// A cause reaches the host only if the RISC-V core both enables it and=
 directs it there, which
> +/// `NV_PRISCV_RISCV_IRQMASK` and `NV_PRISCV_RISCV_IRQDEST` say. Every o=
ther latched cause belongs
> +/// to the firmware running on the core.
> +pub(crate) fn host_intr_routing<E: FalconEngine>(bar: Bar0<'_>, chipset:=
 Chipset) -> u32 {
> +    if has_turing_riscv_routing(chipset) {
> +        bar.read(regs::tu102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
> +            .value()
> +            & bar
> +                .read(regs::tu102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
> +                .value()
> +    } else {
> +        bar.read(regs::ga102::NV_PRISCV_RISCV_IRQMASK::of::<E>())
> +            .value()
> +            & bar
> +                .read(regs::ga102::NV_PRISCV_RISCV_IRQDEST::of::<E>())
> +                .value()
> +    }
> +}
> +

Why not use regular HAL methods here? This completely breaks the pattern
we introduced for HALs. If the current HALs don't fit the routing you
need, then we should introduce a new one.
