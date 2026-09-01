Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011066.outbound.protection.outlook.com [52.101.57.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E5C3502A5
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 07:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246197; cv=fail; b=QJucugI+iu2PRcuyc/hskiwCpPTlWaiIox4mhfJNHduFhRgaWrU6Y1X0rXLKSekJ5YILeQCCxMOSsZybyTOnpBEToHQ734TrFKo6y4QilgHdgW1ZeJYNwp8M1aNKoA88SZi7NTb0wrCdNKMQ7sYpXJA8oQxJBEqFS2kBdCo1K9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246197; c=relaxed/simple;
	bh=MG5oevEPda4cwsOVy+lWscq/IDMVTkStD1LkUalNxMo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=V2NVt2EKkfe1l21oniz9B7/kA9/JcenNSET6zgpYvO8FP0sEWQMxNa86kixEHQkGaej+jCvpFC+l5wqK/aaAMkCRUGz7KCnT8O1eeov1ViVvyz74t3PDZo0JbOlYzRDKLwNKEffWuR0cEjr33b0jHCyD+yG/4aLk4t1Dh8QR1UE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pivm8vlP; arc=fail smtp.client-ip=52.101.57.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pivm8vlP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBSa2XNcTZcaBFr4dI609o4wjr8XIsYB3nYHHZ+RArLHGTVLt+hiUWseREUlKGHHiPZ753c0a6ED/Fu/uS2/YWIC+x3MVlnO0jzQRQlVbFUFAYj1V7G1Y1YXZaGGlLCkPYeBP5A64DVuY8darGhL4dmysx7BVAJ3XjEyW5Ml9gg9QlE+MGJcmx3W1ammPayh6PxRkC1ZOKAazYpMe+8352ZmY/0UIgBj48S+0+be+ST1reND7hsq61Xftz55cYDG/979ry6JMMf2I9hMIlxwmkNh1e7dGgoaKHtBcGrdQaQlJbtmzly9UsTgtv5viy3CJZiG30up7VPsy+Xdi0rtQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uYOcllOkkpKxSL4g9ISxSi2DdklATU1W69vj1Ue64Kg=;
 b=kG46uvnPL/Wl4gpxNBBIwrwSrtNm/KXZMC3sDfDV0kLUyXdBWhaO7uRZq3yRNCEPTWZNsiUAo0cr7le9yWA5meW5tMdNvl3nixI1e7dFx13Ju29UjB7yDJRc8PnCdSEN1a0UT+sPY3CP1Jx8vjzkZcZECPVHnmVpZQGdOwiigdGmgCQxKORkBZ40ZBSbIyHSHqFcR/8/WbFjC7QgbMWWOIQhcMCpczF16TPRgcRxzAXWM1UnWmfWM6sYO6qxcMR5uIkEzy2m4clYJfaZRgDc8ZkT9Y+yiLpdgrzRFzyG983Guc4U30H9g3LR3+xrqStbM9dpuraVm/JIbOj9smXJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uYOcllOkkpKxSL4g9ISxSi2DdklATU1W69vj1Ue64Kg=;
 b=pivm8vlPbQDde8EWIOkPDko5mo3KPWS3ixLp6SV2Ndpsi/nfeK5EuV/aFDlzrgaOThOWJjrJXousIMHCPjzSh8iYHpCoXkaB92jc0zgjDfiziPomwuVGFGBnoORJa8KAoMcZxyuTrJSSD86Th7FhsiQYsq2BBLjrk5dsMz18ikx1kEhsr3Z+3T4PFMsb7fNC2bw8qgW8dF4zUcFduFX00IazNgmdJd+/yleCxY2uyLbbVvrDBfUxcwQIeGrE8WCtysNs8txVIHtNEjkFAIG/n/f/a8gBTz1zg9SlO73tLKH/RAmAthm4RGH9/oKU7DeUpfE9PJ0LBGpkx771568/GQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 07:03:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Tue, 1 Sep 2026
 07:03:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 16:03:04 +0900
Message-Id: <DL3SD82Q6C81.3G32WDNS642Y3@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Will Pierce" <wpierce@nvidia.com>
Subject: Re: [PATCH v2 06/15] gpu: nova-core: add the GIN interrupt tree and
 allocate its vectors
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-11-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-11-jhubbard@nvidia.com>
X-ClientProxiedBy: TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e55f66d-1f5e-400a-db29-08df07f71345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|23010399003|366016|56012099006|10067099003|11063799006|5023799004|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uqtpcD6tLSeTsba61ONcCoUj1e0ighkRyznatqiF0HWw7DwFOYrCJezBqNrtS1R5svEjgJ3ySYjPnURDZfU4Dof1PRzY6QeJBuRxGQldix8O3OdySUegYafQdph3Zxyn1SeApIciwnwXIKZt+xL5/8AqJs029gH5tbCjII+i14UNQlvWwSCO/5S1o2WxkeSPeCZVp4kN7uqJOO1/P/vzSNMD3izlF76b+h3iLXMR1uiWRL6uQb8z4xxYRdabL05AxA1CkisN2Dapzi/ZVlByrOG19YWsOizzlaYuXWq71OblrQ9HUqL8w/uQ4zKgfu7t42ChFzSLJbfxfdPEkanqtuvwf38Qg5Z5/OOpCj8g1AWvq/v7EHmgadSD8zvOUkGz3uKwa1xlN/JgmlLU8fSFmoBPn5VyXesIE0YrNavbFPFr+oEsJ0HpLd6J+UIaNT2c3Z9j918cWC/kUtQYWgYYB60nkWawblBQsp6HifKOlW7ydu/1F5jBQIBTNgVjmaN+50HWKmiEGHoiuOuKL1gWRaQsrZn0XaTRvU5UX4EtNF/9Kg8uLtE3TLL9XnydAsrs2Ks35B49JN+qfN5T5DhRXrNvoauwOrlaCln2dMamyzY7nmw/lA1p94aIbCHv8rOT+No2nhQ7avaXbzBY3a17EAG/pIyTtwP2FBWvbok2eSs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(5023799004)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFZLMDhENkVkMnFFeVpMU0JxOThaMUlqOERlZlpGVkV6dzJISWhRbmp0VHVP?=
 =?utf-8?B?Zm5oeHpTU0FIL3VaZmcvbjlPNjRyUjNJOENFbXVCTFRZZ2ZIUUVsTXpjcUo3?=
 =?utf-8?B?U3djbmRHd0J4T1dJTDd4VnZreXA3RkVEeC9xZlNmRjgvYWM0K0dkR0JLbUZT?=
 =?utf-8?B?S1RxdFhKcXV3UVJxQ1dUaFR1Q29WaUdObVBnR2c0SDYzOWJnalRuVVR6M0hO?=
 =?utf-8?B?NzhzdVkrVEVMK1E1ZHVPbCtmckJIWEJXVEJ2Q3dpWWYyc2hPazlEMi9HdmVh?=
 =?utf-8?B?UTNjTmpoV012ZXZiNU84SkF4SU85emQwMGRjRWxZZHRucG9McThmNFhyb3pj?=
 =?utf-8?B?TWcrejBJUno1SmNmUTIzTUlubzFnVzd6N3lERFlrT2szaTJ5MmNDU1U1Vktw?=
 =?utf-8?B?dE1aSUFBNE9Kd3gybG5vQWVwK3pLYk54UTRWWW5lOXhQbjh5K2ZzcXdlNVRZ?=
 =?utf-8?B?dkRqNnl4QmVQcWcybG1IRHJMbnJFcFF6VllNdmtoajFvVXNEMkVIUERnL0M2?=
 =?utf-8?B?YWQ3TXVnNDBzYmlLUjF3VGwyTWpVT1lqV3d1KzVzeWlsNzZyajhkbDJqY3Q1?=
 =?utf-8?B?NHZUVE03SWtRTjdYYk50T04xRXZhT3dLWW9hQjUyOUR1TE1tVUN2c2pVU1lj?=
 =?utf-8?B?T3pSdE9XTTA0RFFnUm9BT0hLZEtsRFlxQUxTNEhWSWQrcDdlVUVRaHlvU1BF?=
 =?utf-8?B?Y0RWbG5QODY1bXNVQkNUbGlreEpQbzFaS1RyQW1JeDNpWE9GUVFBdzZKb0F0?=
 =?utf-8?B?NnhGclhraTVGQmkwOVZnNjJGWVVNT2tFbWlIRHBMbGNJNFRtNVpsYnZYcnRQ?=
 =?utf-8?B?NGlGN2VUYmFmSTFqdkVkUW9BK0hkTTh5clc0ZmVNNDg3RVJHQW4zWXh6enA4?=
 =?utf-8?B?ZTJURThaQXgxaHB4c1VZTHdENWk0RXErR0YzMHlVODBUU0t3ZVlvWjRQaEZs?=
 =?utf-8?B?L1hFdHBaT1lScTIvQXBhdVpYTDM3dGFOcDdvSEE1dmZhRlNhN0pmMFRrSnZs?=
 =?utf-8?B?MmhaK2xHWVBpTGVaQVdpeGhLZWhkSVp2dUpDOWFkak56WU9iTlNtSTFmenV3?=
 =?utf-8?B?c0pzbUFNRjM4clkvWm83RE9qakNhWTVWSklDeHhYbWgxdE9qa05IMzVFb0s0?=
 =?utf-8?B?MXIybGp1L2h6TGZsTmFvd2NRREluKzZXU0RwaXZONGxZOFp1QWZaQWJRWmZ6?=
 =?utf-8?B?S1lQemI4THB6emlPOHNkNTFOM0NHUGNuazdIOUVyTEo3dzhNU3p0dU1xMW9o?=
 =?utf-8?B?cFQvQVA5bWpYMU9CZ25Mc2UxcUZDYmVmdHZYN0dCM3NkYlczMGgwYm02ODRn?=
 =?utf-8?B?d2xlbkJRVklnNks2Y2JOQ3lLK242UWJsaW1mTEhUK05MWmc4SDZHRXZ3TW11?=
 =?utf-8?B?YnFGeWd5MGNid084Vy9XS3JIWnhwSEpVSmNzeit3V1dBRm85NTNlOWJFSmhz?=
 =?utf-8?B?ZllqQVhFR3RoY1RCNVNxcXAveTEyaFQvbnlKdDAyQnl5REJBVkFDSXoyd0N1?=
 =?utf-8?B?ODBxbG1hdExkbkdvSjVhRlJmZGpGS2E4RSthM2FYdHZ6SE04ckI3VmpyeDR5?=
 =?utf-8?B?VnRxeHo5dDE0UDdnT2tLUUhmTk41bXFqejh6VTJ3M015SHFMcDlvVDV6M3Mr?=
 =?utf-8?B?cmJYKzVOa2VYSjdid2h6YTVCR09lcnVOT3RFSFNMM1NqeHZrZlppYk1rc2N3?=
 =?utf-8?B?cGRwVmsrOVRHcHNkeGY5cis5aXJ2dkRTUWN0ZE4zdVdWT1ZWbXlsMG1hZnJY?=
 =?utf-8?B?Wk4rZTFDZVVTNTJBNUwvRXZadmhHVEFIWnM1WW9yUWNWbytmeC9PUHA2N3Vk?=
 =?utf-8?B?S0dVRjNlU2RoT0tTWUhMdW1sb0I4ZFZpeWg3eUFzdW5hS0t0UlBWSzI4NmRz?=
 =?utf-8?B?MW42bVJ4ODhwU1JBcVpQb2xIeFFpTDlzV2ViUkZzanlhSktMSjQvK2hReERD?=
 =?utf-8?B?YWN0SG8yYnRNSTg5Wm1qeHIzSUI3aW1WYUJnbkdPVDJmK2U4ZUNxZndObjlw?=
 =?utf-8?B?VTRhdW0vTXVZMFRrT3pmQXRPME1MY21VMkpDVkhaaStDcFB1Z0NEUzdqM1hx?=
 =?utf-8?B?L0xtTy9PNzRUNk82dE5kZ1U1cE50NitYaTFqOXVNSThvZHcrSjJNUXZKcmNO?=
 =?utf-8?B?eFREYWpRSkEwQlJlbXdZVEFyRkxoaEZDRnUrNHBWTnp6WThzdlRxdHZaUURs?=
 =?utf-8?B?TWt2azl6NnFPbHBlQW9rRzJtbXYrQmZ4ZkZNSFIwK0tuMExpeGp4SWlPelVw?=
 =?utf-8?B?UVRQNGNxRXQzR3VieEFqVU15WTNJVDJLTGtKY24va2V0cW8wbHFBekRrRzQ0?=
 =?utf-8?B?cXBwd01SZ3d3cUVKeUp6azNCTFdBQ1doUkZNQVN4K0Z1ZlpoK1JJanlWRkNt?=
 =?utf-8?Q?ZDtnv749iMlpHpKsvj/IDBObfNInKcgmJndaOF6SVZXgX?=
X-MS-Exchange-AntiSpam-MessageData-1: R8c1zNtyOoKlpg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e55f66d-1f5e-400a-db29-08df07f71345
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 07:03:07.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kmxYn91y8H1kZDjtxHwpOZbp2lmKXw5OeJGQttmJJsgsYHtYzUyGcbQzG/nHtwOII3jtVwJcPEiLGTRR8gSURA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Servicing a GIN leaf has a required order: read its pending bits, then
> clear them. Clearing a leaf before reading it discards every vector
> latched in it, and nothing reports the loss.
>
> The driver must also allocate a PCI vector for every subtree it enables
> at TOP, and register a handler on that vector. MSI-X gives each subtree
> its own table entry. Linux masks every entry the driver did not
> allocate. An enabled subtree with no entry of its own raises interrupts
> that never arrive, and its leaf and TOP bits stay pending and enabled.
> MSI instead has one message that the whole tree raises, so a single
> entry serves every subtree.
>
> Add an API for one PCIe function's CPU interrupt tree, in which reading
> a leaf yields the handle that clears it. Size the vector allocation to
> the serviced subtrees, requesting MSI-X entries up to the highest
> serviced subtree and falling back to a single MSI rather than a shared
> INTx line.
>
> Reviewed-by: Will Pierce <wpierce@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: name the module interrupt_tree with a Tree type that owns the
>  BAR mapping, use the canonical NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_*
>  register names, express vectors, leaves and subtrees as newtypes, let
>  the read of a leaf produce the handle that clears it, add the enable
>  guards, take the leaf count and the rearm method from the interrupt
>  HAL, and read every implemented leaf in drain() rather than descending
>  from the TOP registers, which cannot see a vector that latched while
>  disabled]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/irq.rs                |  89 ++++++
>  drivers/gpu/nova-core/irq/interrupt_tree.rs | 284 +++++++++++++++++++-
>  2 files changed, 369 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/irq.rs b/drivers/gpu/nova-core/irq.rs
> index 02ecfc47f4d0..c6bf1dbacabe 100644
> --- a/drivers/gpu/nova-core/irq.rs
> +++ b/drivers/gpu/nova-core/irq.rs
> @@ -11,3 +11,92 @@
>  mod hal;
>  mod interrupt_tree;
>  mod regs;
> +
> +use kernel::{
> +    device::Bound,
> +    irq,
> +    pci::{
> +        self,
> +        IrqType, //
> +    },
> +    prelude::*, //
> +};
> +
> +use interrupt_tree::{
> +    Subtree,
> +    SubtreeSet, //
> +};
> +
> +/// The PCI interrupt vector that delivers each serviced subtree.
> +///
> +/// MSI-X raises a separate table entry per subtree, so subtree `N` arri=
ves on entry `N`. MSI has a
> +/// single message that every subtree raises, so all of them arrive on t=
he one allocated entry.
> +pub(crate) struct SubtreeVectors<'a> {
> +    vectors: pci::IrqVectorRegistration<'a>,
> +    /// Every subtree nova-core services.
> +    serviced: SubtreeSet,

Here we would also store the `MsiType` I proposed on the previous patch
and return it in `irq_type`.

> +}
> +
> +impl SubtreeVectors<'_> {
> +    /// Returns the interrupt type the PCI core selected for these vecto=
rs.
> +    pub(crate) fn irq_type(&self) -> IrqType {
> +        self.vectors.irq_type()
> +    }
> +
> +    /// Returns an [`irq::IrqRequest`] for the vector that delivers `sub=
tree`.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `subtree` is not one nova-core services.
> +    pub(crate) fn request_for(&self, subtree: Subtree) -> Result<irq::Ir=
qRequest<'_>> {
> +        if !self.serviced.contains(subtree) {
> +            return Err(EINVAL);
> +        }
> +
> +        self.vectors
> +            .index(entry_index(self.irq_type(), subtree))
> +            .map(Into::into)
> +    }
> +}
> +
> +/// Returns the index of the allocated entry that `subtree` raises.
> +///
> +/// MSI-X gives subtree `N` its own table entry `N`. MSI raises its one =
message from every subtree,
> +/// and nova-core allocates a single entry for it. nova-core never alloc=
ates INTx.
> +fn entry_index(irq_type: IrqType, subtree: Subtree) -> usize {
> +    match irq_type {
> +        IrqType::MsiX =3D> crate::num::u32_as_usize(subtree.index()),
> +        IrqType::Msi | IrqType::Intx =3D> 0,
> +    }
> +}

This is only called by `request_for`, which is just above, so can we
inline it there?

> +
> +/// Allocates the interrupt vectors that the subtrees in `serviced` requ=
ire.
> +///
> +/// Every subtree nova-core enables at `TOP` must have an allocated vect=
or with a registered
> +/// handler, or the interrupts it raises are lost. Linux masks every MSI=
-X entry a driver did not
> +/// allocate, so the MSI-X request covers every entry up to the highest =
serviced subtree. A part
> +/// whose MSI-X table is smaller than that falls back to a single MSI, w=
hich serves the whole tree.
> +/// nova-core does not fall back to a shared INTx line.
> +///
> +/// # Errors
> +///
> +/// `EINVAL` if `serviced` is empty. The error from the MSI request if n=
either type can be
> +/// allocated.
> +pub(crate) fn alloc_vectors(
> +    pdev: &pci::Device<Bound>,
> +    serviced: SubtreeSet,
> +) -> Result<SubtreeVectors<'_>> {
> +    if serviced.is_empty() {
> +        return Err(EINVAL);
> +    }
> +
> +    // One entry per subtree up to and including the highest serviced on=
e.
> +    let entries =3D serviced.span();
> +
> +    let vectors =3D match pdev.alloc_irq_vectors(entries, entries, IrqTy=
pe::MsiX.into()) {
> +        Ok(vectors) =3D> vectors,
> +        Err(_) =3D> pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into())?,
> +    };

Optional style nit:

    let vectors =3D pdev
        .alloc_irq_vectors(entries, entries, IrqType::MsiX.into())
        .or_else(|_| pdev.alloc_irq_vectors(1, 1, IrqType::Msi.into()))?;

> +
> +    Ok(SubtreeVectors { vectors, serviced })
> +}
> diff --git a/drivers/gpu/nova-core/irq/interrupt_tree.rs b/drivers/gpu/no=
va-core/irq/interrupt_tree.rs
> index da24f3d35893..523b26d55137 100644
> --- a/drivers/gpu/nova-core/irq/interrupt_tree.rs
> +++ b/drivers/gpu/nova-core/irq/interrupt_tree.rs
> @@ -1,17 +1,49 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> =20
> -//! Vector addressing in the GIN CPU interrupt tree.
> +//! The GIN CPU interrupt tree for one PCIe function.
>  //!
>  //! A vector's number fixes where it latches: leaf `vector / 32` at bit =
`vector % 32`, and that
>  //! leaf belongs to subtree `vector / 64`. The types here keep those thr=
ee views apart, so a leaf
>  //! index, a set of vectors within one leaf, and a `TOP` bit cannot stan=
d in for one another.
> +//!
> +//! Servicing a leaf has a required order: read its pending bits, then c=
lear them. Clearing a leaf
> +//! before reading it discards every vector latched in it, and nothing r=
eports the loss. Only
> +//! [`Tree::read_pending`] produces a [`LeafPending`], and only a [`Leaf=
Pending`] can clear, so the
> +//! wrong order does not compile.
> +//!
> +//! Serializing access to the tree is the caller's responsibility.
> =20
>  use kernel::{
> +    io::{
> +        register::Array,
> +        Io, //
> +    },
>      num::Bounded,
> +    pci::IrqType,
>      prelude::*, //
>  };
> =20
> +use crate::{
> +    driver::Bar0,
> +    gpu::Chipset, //
> +};
> +
> +use super::{
> +    hal::{
> +        cpu_interrupt_hal,
> +        PciIrqRearmMethod, //
> +    },
> +    regs::{
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF as CPU_INTR_LEAF,
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_CLEAR as CPU_INTR_LEAF=
_EN_CLEAR,
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_EN_SET as CPU_INTR_LEAF_E=
N_SET,
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_LEAF_TRIGGER as CPU_INTR_LEAF_=
TRIGGER,
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_CLEAR as CPU_INTR_TOP_E=
N_CLEAR,
> +        NV_VIRTUAL_FUNCTION_PRIV_CPU_INTR_TOP_EN_SET as CPU_INTR_TOP_EN_=
SET, //

I'm not a big fan of these long imports - can we just `use regs::*` and
access the registers using their full name?

We used to just import `regs` and access registers using `regs::NV_FOO`
back when they were all declared in a single big file, but now that
registers are properly confined to their module, using a local `regs::*`
is much more appropriate and should become the default IMHO.

> +    }, //
> +};
> +
>  /// Index of a leaf register, bounded to the `0..16` range covered by th=
e leaf register arrays.
>  pub(super) type LeafIndex =3D Bounded<usize, 4>;
> =20
> @@ -97,7 +129,7 @@ pub(super) const fn contains(self, other: Self) -> boo=
l {
>  ///
>  /// Exactly one bit is set.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct Subtree(u32);
> +pub(crate) struct Subtree(u32);
> =20
>  impl Subtree {
>      /// Returns this subtree's index within the tree.
> @@ -115,7 +147,7 @@ pub(super) const fn into_raw(self) -> u32 {
> =20
>  /// Set of subtrees, one bit per subtree, in the layout the `TOP` enable=
 registers take.
>  #[derive(Clone, Copy, Debug, Eq, PartialEq)]
> -pub(super) struct SubtreeSet(u32);
> +pub(crate) struct SubtreeSet(u32);
> =20
>  impl SubtreeSet {
>      /// Returns whether `subtree` belongs to this set.
> @@ -199,7 +231,7 @@ pub(super) const fn subtree(self) -> Subtree {
>      /// # Errors
>      ///
>      /// `EINVAL` if the vector lies beyond the last leaf such a tree imp=
lements.
> -    pub(super) const fn validate(self, leaves: LeafCount) -> Result {
> +    pub(super) fn validate(self, leaves: LeafCount) -> Result {

Why are we losing the const here?

>          if self.0 >=3D leaves.vector_count() {
>              return Err(EINVAL);
>          }
> @@ -207,3 +239,247 @@ pub(super) const fn validate(self, leaves: LeafCoun=
t) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Returns the leaves that subtree `index` covers.
> +///
> +/// An index beyond the leaf register arrays yields nothing rather than =
panicking.
> +fn subtree_leaves(index: u32) -> impl Iterator<Item =3D LeafIndex> {
> +    let first =3D index * LEAVES_PER_SUBTREE;
> +
> +    (first..first + LEAVES_PER_SUBTREE)
> +        .filter_map(|leaf| LeafIndex::try_new(crate::num::u32_as_usize(l=
eaf)))
> +}
> +
> +/// The GIN CPU interrupt tree for a single PCIe function.
> +pub(super) struct Tree<'a> {
> +    /// Borrowed BAR0, through which every tree register is reached.
> +    bar: Bar0<'a>,
> +    /// Number of leaves this tree implements.
> +    leaves: LeafCount,
> +    /// The subtrees this tree enables and services.
> +    serviced: SubtreeSet,
> +    /// Method that rearms PCI interrupt delivery, or `None` if the inte=
rrupt type needs no rearm
> +    /// write.
> +    rearm: Option<PciIrqRearmMethod>,

With the proposed changes in the previous patch, this can hopefully
become a `PciIrqRearmMethod`.

> +}
> +
> +impl<'a> Tree<'a> {
> +    /// Creates a `Tree` for `chipset` covering `serviced`, with the rea=
rm method that `irq_type`
> +    /// requires.
> +    ///
> +    /// Each serviced subtree must have an allocated PCI vector and a re=
gistered handler, which
> +    /// [`super::alloc_vectors`] sizes the allocation for. Subtrees the =
architecture does not
> +    /// implement are dropped.
> +    pub(super) fn new(
> +        bar: Bar0<'a>,
> +        chipset: Chipset,
> +        irq_type: IrqType,
> +        serviced: SubtreeSet,
> +    ) -> Self {
> +        let hal =3D cpu_interrupt_hal(chipset);
> +        let leaves =3D hal.leaf_count();
> +
> +        Self {
> +            bar,
> +            leaves,
> +            serviced: serviced.intersection(leaves.subtree_set()),

Shouldn't we error if we cannot service some of the requested vectors?

> +            rearm: hal.pci_irq_rearm_method(irq_type),
> +        }
> +    }
> +
> +    /// Returns the subtrees this tree services.
> +    pub(super) fn serviced(&self) -> SubtreeSet {
> +        self.serviced
> +    }
> +
> +    /// Rearms PCI interrupt delivery to the CPU after servicing `subtre=
e`, the one subtree the
> +    /// calling handler serves.
> +    ///
> +    /// A handler must call this before it returns, or it receives no fu=
rther interrupts.
> +    pub(super) fn rearm_pci_irq(&self, subtree: Subtree) {
> +        if let Some(method) =3D self.rearm {
> +            method.rearm(self.bar, self.serviced, subtree);
> +        }
> +    }
> +
> +    /// Enables this tree's serviced subtrees (`TOP_EN_SET`).
> +    pub(super) fn enable_top(&self) {
> +        self.bar
> +            .write(CPU_INTR_TOP_EN_SET, self.serviced.into_raw().into())=
;

With the changes in patch 3, this becomes

    self.bar
        .write_reg(CPU_INTR_TOP_EN_SET::zeroed().with_subtrees(self.service=
d));

(also applies to `disable_top`).

> +    }
> +
> +    /// Disables this tree's serviced subtrees (`TOP_EN_CLEAR`).
> +    pub(super) fn disable_top(&self) {
> +        self.bar
> +            .write(CPU_INTR_TOP_EN_CLEAR, self.serviced.into_raw().into(=
));
> +    }
> +
> +    /// Enables this tree's serviced subtrees until the returned guard d=
rops.
> +    pub(super) fn enable_top_guarded(&self) -> TopEnableGuard<'_> {
> +        self.enable_top();
> +
> +        TopEnableGuard { tree: self }
> +    }
> +
> +    /// Enables the vectors set in `vectors` for `leaf` (`LEAF_EN_SET`).
> +    ///
> +    /// This is the per-vector counterpart of [`Self::enable_top`], whic=
h enables whole subtrees.
> +    pub(super) fn enable_leaf(&self, leaf: LeafIndex, vectors: LeafMask)=
 {
> +        if let Some(loc) =3D CPU_INTR_LEAF_EN_SET::try_at(leaf.get()) {
> +            self.bar.write(loc, vectors.into_raw().into());
> +        }
> +    }

There are a couple optimizations you can do here.

`LeafIndex` is 4-bits bounded, so its value is guaranteed to be < 16.
But `Bounded::get` does not express this guarantee because it has to be
usable in const context.

`Bounded`'s `Deref` implementation, otoh, *does* include some assertions
that tell the optimizer that the returned value is < 16. So you can use
that, and the build-time checked `at` method, to get rid of the
`unwrap_or`.

And with the register field types set in patch 3, you can set the field
direction without converting to the raw value. So the above `if`
statement becomes just:

    self.bar.write(
        Array::at(*leaf),
        CPU_INTR_LEAF_EN_SET::zeroed().with_vectors(vectors),
    );

(also applies to `disable_leaf`)

> +
> +    /// Disables the vectors set in `vectors` for `leaf` (`LEAF_EN_CLEAR=
`).
> +    pub(super) fn disable_leaf(&self, leaf: LeafIndex, vectors: LeafMask=
) {
> +        if let Some(loc) =3D CPU_INTR_LEAF_EN_CLEAR::try_at(leaf.get()) =
{
> +            self.bar.write(loc, vectors.into_raw().into());
> +        }
> +    }
> +
> +    /// Enables `vectors` for `leaf` until the returned guard drops.
> +    pub(super) fn enable_leaf_guarded(
> +        &self,
> +        leaf: LeafIndex,
> +        vectors: LeafMask,
> +    ) -> LeafEnableGuard<'_> {
> +        self.enable_leaf(leaf, vectors);
> +
> +        LeafEnableGuard {
> +            tree: self,
> +            leaf,
> +            vectors,
> +        }
> +    }
> +
> +    /// Reads the vectors pending in `leaf`.
> +    pub(super) fn read_pending(&self, leaf: LeafIndex) -> LeafPending<'_=
> {
> +        let pending =3D CPU_INTR_LEAF::try_at(leaf.get())
> +            .map(|loc| self.bar.read(loc).into_raw())
> +            .unwrap_or(0);

Similarly, here you can just do:

    let pending =3D self.bar.read(CPU_INTR_LEAF::at(*leaf)).vectors();

And drop the `unwrap_or(0)` which looks a bit sus to me.

> +
> +        LeafPending {
> +            tree: self,
> +            leaf,
> +            pending: LeafMask::from_raw(pending),

... and you can now assign `pending` as-is.

> +        }
> +    }
> +
> +    /// Injects a software interrupt for `vector` via the trigger regist=
er.
> +    ///
> +    /// # Errors
> +    ///
> +    /// `EINVAL` if `vector` lies outside this tree. `EOVERFLOW` if `vec=
tor` does not fit in the
> +    /// trigger register's vector field.

Hopefully this error becomes unneeded if we convert `GinVector` to use
`Bounded`.

> +    // Only the interrupt self-test injects a software interrupt.
> +    #[cfg_attr(not(CONFIG_NOVA_CORE_IRQ_SELFTEST), expect(dead_code))]

This Kconfig option does not exist yet as of this patch IIUC.

> +    pub(super) fn trigger(&self, vector: GinVector) -> Result {
> +        vector.validate(self.leaves)?;
> +        self.bar
> +            .write_reg(CPU_INTR_LEAF_TRIGGER::zeroed().try_with_vector(v=
ector.into_raw())?);
> +
> +        Ok(())
> +    }
> +
> +    /// Disables every vector in every implemented leaf (`LEAF_EN_CLEAR`=
).
> +    ///
> +    /// Boot, or a driver that ran before this one, can leave leaf enabl=
es set for vectors
> +    /// nova-core does not service, and such a vector delivers to nova-c=
ore's handler once its
> +    /// subtree is enabled.
> +    ///
> +    /// This clears enables outside the subtrees nova-core services, so =
it is a probe-time
> +    /// operation only.
> +    pub(super) fn disable_all_leaves(&self) {
> +        for index in 0..self.leaves.into_raw() {
> +            if let Some(leaf) =3D LeafIndex::try_new(index) {
> +                self.disable_leaf(leaf, LeafMask::all());
> +            }
> +        }
> +    }
> +
> +    /// Clears every pending bit in every implemented leaf.
> +    ///
> +    /// Disables this tree's serviced subtrees at `TOP` across the walk,=
 then enables them,
> +    /// whatever their state on entry. The leaves cleared reach subtrees=
 the driver does not
> +    /// service, and the `TOP_EN` writes do not.
> +    ///
> +    /// Call `drain()` only during probe. It must not run concurrently w=
ith an interrupt handler.
> +    pub(super) fn drain(&self) {
> +        self.disable_top();
> +
> +        // `TOP` summarizes enabled leaf bits, so a vector that latched =
while it was disabled does
> +        // not appear there.
> +        for index in 0..self.leaves.subtree_count() {
> +            for leaf in subtree_leaves(index) {

I guess you don't need this double-loop and can replace it with what
`disable_all_leaves` does?

This would let you drop `subtree_leaves` and its associated tests.
Actually it could be replaced by an iterator function returning the
leaves directly.

> +                let pending =3D self.read_pending(leaf);
> +                if !pending.vectors().is_empty() {
> +                    pending.clear();
> +                }
> +            }
> +        }
> +
> +        self.enable_top();
> +    }
> +}
> +
> +/// The vectors read pending from one leaf.
> +///
> +/// Holding one is the proof that the leaf was read, which is what [`Sel=
f::clear`] and
> +/// [`Self::clear_vectors`] require.
> +pub(super) struct LeafPending<'a> {
> +    tree: &'a Tree<'a>,
> +    leaf: LeafIndex,
> +    pending: LeafMask,
> +}
> +
> +impl LeafPending<'_> {
> +    /// Returns the vectors that were pending.
> +    pub(super) fn vectors(&self) -> LeafMask {
> +        self.pending
> +    }
> +
> +    /// Clears every vector that was pending, by writing its bits back (=
write-1-to-clear).
> +    pub(super) fn clear(&self) {
> +        self.clear_vectors(self.pending);
> +    }
> +
> +    /// Clears the vectors set in `vectors` (write-1-to-clear), leaving =
every other pending bit
> +    /// set.
> +    ///
> +    /// A handler that services one vector uses this rather than [`Self:=
:clear`], which clears
> +    /// every vector the leaf had pending.
> +    pub(super) fn clear_vectors(&self, vectors: LeafMask) {
> +        if !vectors.is_empty() {
> +            if let Some(loc) =3D CPU_INTR_LEAF::try_at(self.leaf.get()) =
{
> +                self.tree.bar.write(loc, vectors.into_raw().into());
> +            }
> +        }

Here this would become:

    if !vectors.is_empty() {
        bar.write(
            Array::at(*self.leaf),
            CPU_INTR_LEAF::zeroed().with_vectors(vectors),
        );
    }
