Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011000.outbound.protection.outlook.com [40.107.208.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547B8315793
	for <nova-gpu@lists.linux.dev>; Tue, 16 Jun 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598937; cv=fail; b=tbfvImJzRWiVNl1mTltDGtI+JS6vpGYw5pBz+v6Ltz8XGOPmX/6SDTmvjqnh5mb6jWDKFxIR0lGM20jAyWkb2BfRdvyMCLirmUfR0RQ0yJw0w0EQo3n0EKXCjIRetRRi6kdWVDhUcCzvGa+58pnKBGL3d77y9JAIoC6Em7tdt6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598937; c=relaxed/simple;
	bh=xgNlo6D57bl/YcbwY3doU/wwDaIBA4YJlYw7coqBeEQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=qF+4VqELwBzze5LzI9guPv6EK82VhHuM6gyJg3YdLlmgiIYGGUuJ2NVLw7KSaoVW0U91i7/F6FyhVU4ZRRL2Cq4bQHRfV/dK6uDvySmlIZpNEidwiXPRvbltOGdVC9KwzdamzVG1EZx6u/3foSqJPUtr6CUaEKoQMPRxkGhRd9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OmrYx8bJ; arc=fail smtp.client-ip=40.107.208.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OmrYx8bJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/Im168Aq7wTdB0dLgT/HRU8McE9Mt0pR2oP1qeLACFzf3VwwnhYZch0R1BupNeADqx0AgNc6LnuKRipA6Srs7Q2wg1wfd9D70qIC6S4RKAuounbj5Ka8u6dMyBtNK//0vq9p3Ph0BYUGw88YrYTvzwjRhkW0dTPcIq4iwV1Rh8QYDii+oi1MAGoAbNVGnPYU5TBVA5xzXbKn6RHk7tZsUxp0IKYAF3kSxohGgSokLdUvwdP8vWQgSrSOSupJ0qPdDysiiz74+mtftlHiTU9toHgiNQFtiEYqNkpQ0YdlBZhMMV94H/LCLRBv2fC3IMvBHtkG9gE6+ud2yCwl2R5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/bXGKbECqUq/de+XGzHtcQSL2W+7eDc3BJJl+Vy+6w=;
 b=QbODfSfUmEZwFtmPAFGKTYk93xfFqjxm2uoG0DPJx1gw5pV0Q5BsokimHUbH0IfGGNsesd3dWbmE1ljBtmomEm7a+pO/pApX6Qt+yvkhFfepidvM6qeTtaeojteetOG0lK2Z3YCgCTbYLAnzD4BUD0ihTTwlWKX0f9PmTgqmzTzCvJiBa3PTVKVs5o5MQRmQhVMFaBjD0Nl7eOyNVw2BvP0ga60RkXetVcVVFhbPWK70RD3PpIlwCe+lF02ci3w5WRGCR34AFCJRPdA3QPgX8bK9zCk9hsZYe9QtAQ3gpYIuA4fZlfIX8jjEcCBvZFBJW38HHTuEieK8fv1Ryl4VTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/bXGKbECqUq/de+XGzHtcQSL2W+7eDc3BJJl+Vy+6w=;
 b=OmrYx8bJDq67xs00tb7iGvfMbMaOqQS8FNdxzEpRNr0cRF8SWGWFue+ng+Z07ZqsofSMwr+yQh95Qm0X/7tU6dtMShXsRBKqBYINVgFWZmoZuJ31CcNiMm6cGqMATBQRR/3FM7W8eVUzVVhnXJKMmFpemK/wvB1J2zkZ9uQf49jcaVnyoMhADSkIii0yAYHs2E9PbYrh0VhNPyG8PaUKiYvO9q0PONwzA9DNvXN626meIoqvGz26+rt1TrU8DOxg+Ylh6pt6YKcREqFhR3E18ECZHR95jklEA/2mIvyDDmjJSajlPYS7F/iVDdWMaY/l8qW0/lsdwD6xs6U0fA0S1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9715.namprd12.prod.outlook.com (2603:10b6:408:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:35:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:35:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:35:27 +0900
Message-Id: <DJAC408HKZTR.20UBUA67YKT3O@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH 4/9] gpu: nova-core: read vGPU mode from FSP via PRC
 protocol
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260604114339.1565660-1-zhiw@nvidia.com>
 <20260604114339.1565660-5-zhiw@nvidia.com>
In-Reply-To: <20260604114339.1565660-5-zhiw@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:378::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 80073b70-6156-4f63-91c8-08decb823985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|23010399003|22082099003|18002099003|4143699003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	LjVGd3AaNiHvefSrwKmUCKNuNuCxmknA7wnnzglRq4X625AtP4x10IfS4t5xJJzo7cSuHGpHMbbTSppeWIcpf1h7Nt4AYQk48nK3D/17MEJIDT22BVh57U6ajKJqzh4GIvGLvlVmOUUPj6mz80L96muSY33M1vrqxm1Jdtka4YOH/SrBdZY8MKuqh9rp78nPMZPAk+PJBqkR6Ilv8qqRYP+D+zsKVfrxaCf0GT9MJ74dGt4Oud45zU6pWu5um18vLaOGTiBryOKVs1vUSfFH/Y52pEYEthk2XFIdTbwgNmQ5GKaT7U4rYEgoVSOi8xhfOcP9b1LOEtW/6TwI/YhSxpVa21Oft/MZMntv1KIZeZpB2peRSe0wFgUed3dYbSzDAtdhfPpNwFBA1svp/f5K4ekYhp6u6pm9igXmcibXbK42xlOm56Hd3F5BFC7WlP/VQl2/LPFF4sW5ca8XnWvlXqjcED35QubSFzCcal7JwfI8YqCsqGb37r/YQF4cLr0YI9o/MS6lyOr5IBMnKXWYUiHuh6o8b0rxTyVdOEGDq6Yk5smuwHzIWo2kBktwpT59y3RBqXDBFwKQxfgrj0J4aj1Cwxy+sgF081XaT1+sLVl/W4lIfBop4AXYe0c1r0bv9vzXF5kmpPBb0ngogTDOaBxK6N7YVPc5QS6c6SldBzxrFjUMD1UXfYmPZxFRW/VV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVcyQjRMd1l2eHYxamFRQ1RlL1E5a1VXOTZwY1IzYUJqZEc2L24yNmxyL2hM?=
 =?utf-8?B?Q1hxSm9qemdoU3hYczM3RE9OYlNQdzk5eWZleSt5WGJsRTFUK1UwUHhBUTFu?=
 =?utf-8?B?OWowRi9rTnJ1SVJJNStyNlFRSE5Wb2hmU3JvODFKb3VHTnZ0YjY2ekIyS3pm?=
 =?utf-8?B?STJYL1pTSXVFTStSUnVsWkRxN1hacjN5cG5pZkg5TzMzeVFDT1I2bTQ4MG5N?=
 =?utf-8?B?OGxNeGlxR0tHcVpJK0tOYnNqR0VRNkFsaXRLd1FPdmpVZjRocFFDcENvaXNw?=
 =?utf-8?B?S21ZeU1YT2RmL0NhNjNxUVJJZzcxRzFOTHZLaHlVWlQxZzBxcVFRQUh5SXB0?=
 =?utf-8?B?amROdTE1YUppRWs0N1FILzIxWXJIS3pTUjhQRVRqL0UzdTlCbHhKK3N0d2hM?=
 =?utf-8?B?dTFnRUFMd3dBQlBXcnFXVEk5dGVkWVlCQml5dStKZm9tcGhSUDRYQXlHeDdW?=
 =?utf-8?B?bWxMR1RwcFNNa2p2RnNnNGZPTVhuSFJlSTZ6RHZZWlREUHJDT1drNDh2TUFk?=
 =?utf-8?B?Y0RYeWV5MnBrWnMvN2E5amZLRW9BdS9uSWQ2MVJrd1ZnditnK01TTnpHWk9E?=
 =?utf-8?B?dGhHeW1UUkFuL2FKY2JRcm1oN0E1cmNlbFVNcitXNEcwTHVOc2MwV1BWeFpx?=
 =?utf-8?B?YXFGdUFGQzU0V3ZFTXIyV3o4anhRSTVGNXZOam93b1psQ2U2MHNFTzN4SzlN?=
 =?utf-8?B?NUJMRlE2L08vTitRSk1hM0krQzVpazZmUlR4bWRyeVgrRG9OVjNTOEN2SDVp?=
 =?utf-8?B?ZnF0U0ZyVVhubktMclVVMkxNbjNzYjVRYjdVRkt1cUlHTmYvMHExOGlob1NN?=
 =?utf-8?B?Qkx6VndCSkcwSFZ4YndTalArQzZMbTBZQlhhWDhLa2MzM3BYS1V5M3lVUExO?=
 =?utf-8?B?YXg0c3lWZVprUzUvdG1EQVVCd2Y1b0pkWEp5WEhFTFZDM0hZelRkMWxQcFhU?=
 =?utf-8?B?cGFyS0tGc01Uam5PTGY3VW5QU0haM2Y0YWRIYWFzNk15YWNrakREb01tdnAw?=
 =?utf-8?B?czF3S3pCOHVzd0xYczM0OTZrVkZSUTUvM0JmOHZPOVlLT1RkZlpZL3RGRlA2?=
 =?utf-8?B?bTZrQlBDYTNOdFhsQjV1QzJ2a21ISnc3WEwrVnF0RndkeWJZM2ZKQVNibUJC?=
 =?utf-8?B?ZkZ5SVVGMG5RYjNGcTdOOTh0S0tydTNvZTVtcC9jY0c0aFpYZE5PRDdrZ0JB?=
 =?utf-8?B?dEJHWDVHd1JMYko0d0pZYTArdHFzZU84aHFqZlFmVEhPVjZRY0NVZTFqbDli?=
 =?utf-8?B?TlV4RW5aeW9rQjRhY0t5QmZPUS84aS93ODc1dElnQjJLWE1lRzMzOXZpVmxJ?=
 =?utf-8?B?dlArV2xKN1ZXVktUbmdMN0c3eWw1aUZ1TlhYb1pUYkVMNkthSDFkeWdVcmQ0?=
 =?utf-8?B?YkFhRFRPSnMraFhvWWdUOTJNRzRhc0doeUhHZ2pMNGJtd2pWS1dnWWxvS05z?=
 =?utf-8?B?OVlpN1A3TmY0Tm51Vis5eXZ0TDNoSEpyZjhKVG53a0lhYVhleU5MZFllN3kz?=
 =?utf-8?B?SzRsVlQwa2R4ZGh6MjJpanpHV2xqcU4wdVl0SDhEYlBtNElWK004NTA1WXpY?=
 =?utf-8?B?eVJleDRzU012L2pOQytUd25PenQ2ejZwYzR4V2tWYkV3ZXljUWd5aWNVYzls?=
 =?utf-8?B?SEFEeTN3RFh4WjUwZnpKaElMN2Nvb0w1Si9XT2VDNGRTam9Jb1Q0NDBQMnFj?=
 =?utf-8?B?RE1YR2Y0a0hVaGVsdE1UdjJsa0NrK3RZZmRpZVZhZ0d1eHdvdHNseVRrbncx?=
 =?utf-8?B?VjJBTzdobzJCVHhJb0MyemJFMTRqRjVkSS9GVENQbWlzM1hqTWYxdllxeUdX?=
 =?utf-8?B?QS9NN2NVcC8yclc1aG1LZ2tuaWp4dzMxeHJoOGZBclNxbHRxdUpySGNNQ2hv?=
 =?utf-8?B?dFZSdXVrZi9sOFo0SjlzY25qWUlYZi8zSWVjdU1QOCtaYytYbUUxeVVIZVdQ?=
 =?utf-8?B?VlphcnlPWURaTkROdVV0UTVsU2xpclpZMlhEaUpYc0FOSDNPbDVkaGdoTWtH?=
 =?utf-8?B?SGFpblBuT2tVQWxvL3FYSEs3RzZ3OFo2QlFuY2NMaEJWRnJnUjV1UVc5YVlm?=
 =?utf-8?B?RnZSUFpQTExBUnYxdlNJbVNQaVNkVHV4cnRaeXpFbHNlRU5QNFM1ejUvTnRG?=
 =?utf-8?B?dkc0amkzWU1ULzlib1ZraUJSZmVOQ3djdW14UU5UQXhwSk9RT2t4S0czbzkr?=
 =?utf-8?B?RWYybUtmNHErVStOcHBvSlZpVHNXUmVjcnhQSzFBUzBpWklKZ084M0orV2dk?=
 =?utf-8?B?Q0sxbmxhRXYzZzJqRGJiSklObi9wNUlWcG9yTm1DYWE0Vm8vd0VjVkJmNkNu?=
 =?utf-8?B?WkhwcHFkMkttbTFwOXpzNGRyNmhqL2haaDR3S3ZmY0dUeGlpQU03eWJoaktE?=
 =?utf-8?Q?ZPjef7YZMsLbv7hZWBsGoE9zenTrnY0TXR7tCQmSZXfay?=
X-MS-Exchange-AntiSpam-MessageData-1: zyDwlrHwqpUFHw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80073b70-6156-4f63-91c8-08decb823985
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:35:30.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q0yFt9DXTk2CVZP8pKtwPZyNMT7NPFnUx2ir3jZazFa4+YNVlJtrw2foIjdgOV+FtFFaMffhxZ5QUQgL5Aoscg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9715

On Thu Jun 4, 2026 at 8:43 PM JST, Zhi Wang wrote:
> Add support for querying the vGPU mode configuration from FSP using
> the PRC (Product Reconfiguration Control) protocol. PRC is an API
> system exposed through FSP's Management Partition that allows querying
> device configuration "knobs" without firmware updates.
>
> Add a VgpuMode enum that validates the raw PRC response value,
> returning an error for unexpected values.
>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs  | 145 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/mctp.rs |   3 +
>  2 files changed, 148 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index 5fd2e9e277b1..ce11efeba37e 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -48,6 +48,44 @@
> =20
>  mod hal;
> =20
> +/// PRC (Product Reconfiguration Control) protocol constants.
> +///
> +/// PRC is an API system exposed through FSP's Management Partition that=
 allows
> +/// querying and modifying device configuration "knobs" without firmware=
 updates.
> +/// Each knob is identified by a unique object ID and controls a specifi=
c device
> +/// behavior (e.g., vGPU mode, ECC, confidential computing).
> +mod prc {
> +    /// Sub-command to read a PRC knob value.
> +    pub(super) const SUBCMD_READ: u8 =3D 0x0c;
> +
> +    /// PRC object ID for vGPU mode configuration (knob ID 41).
> +    pub(super) const OBJECT_VGPU_MODE: u8 =3D 0x29;
> +
> +    /// Request the active knob value (currently effective this boot).
> +    pub(super) const FLAG_ACTIVE: u8 =3D 1 << 1;
> +}

These 3 should be defined as their own enum types, to make sure we
cannot mix them. For instance:

    enum PrcMessageSubcmd {
      Read =3D 0x0c,
    }

    enum PrcObjectId {
      VgpuMode =3D 0x29,
    }

    (for the flags I guess you will want to use `kernel::impl_flags!`?)

Then, `NvdmPayloadPrc` can have a constructor that takes these 3 as
parameters and returns the constructed value - that way no risk of, say,
using the subcmd as an object identifier.

Btw, is there a public source for these values?

I like the idea of using a `prc` sub-module - to the point where I'd
suggest moving all PRC-related types to it, and all CoT messages to a
`cot` sub-module. But doing it in this series would distract from the
goal, and the `fsp` module is not that large, so let's keep everything
in it for now and do this as a follow-up.

> +
> +/// vGPU operating mode as reported by FSP via the PRC protocol.
> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +pub(crate) enum VgpuMode {
> +    /// vGPU support is disabled on this GPU.
> +    Disabled =3D 0,
> +    /// vGPU support is enabled on this GPU.
> +    Enabled =3D 1,
> +}
> +
> +impl TryFrom<u16> for VgpuMode {
> +    type Error =3D kernel::error::Error;
> +
> +    fn try_from(value: u16) -> Result<Self> {
> +        match value {
> +            0 =3D> Ok(VgpuMode::Disabled),
> +            1 =3D> Ok(VgpuMode::Enabled),
> +            _ =3D> Err(EINVAL),
> +        }
> +    }
> +}

You can even do `TryFrom<NvdmPayloadPrcResponse> for VgpuMode` for a
better fit.

> +
>  /// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
>  #[repr(C, packed)]
>  #[derive(Clone, Copy)]
> @@ -57,6 +95,39 @@ struct NvdmPayloadCommandResponse {
>      error_code: u32,
>  }
> =20
> +// SAFETY: NvdmPayloadCommandResponse is a packed C struct with only int=
egral fields.
> +unsafe impl FromBytes for NvdmPayloadCommandResponse {}
> +
> +/// PRC message payload.
> +///
> +/// Sent to FSP to query or modify a device configuration knob.
> +/// The response includes the common FSP response header followed by
> +/// a [`NvdmPayloadPrcResponse`] with the knob's current state value.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadPrc {
> +    sub_message_id: u8,
> +    flags: u8,
> +    object_id: u8,
> +    reserved: u8,
> +}
> +
> +// SAFETY: NvdmPayloadPrc is a packed C struct with only integral fields=
.
> +unsafe impl AsBytes for NvdmPayloadPrc {}
> +
> +/// PRC response payload containing the knob state value.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadPrcResponse {
> +    value_low: u8,
> +    value_high: u8,
> +    reserved1: u8,
> +    reserved2: u8,
> +}
> +
> +// SAFETY: NvdmPayloadPrcResponse is a packed C struct with only integra=
l fields.
> +unsafe impl FromBytes for NvdmPayloadPrcResponse {}
> +
>  /// Common MCTP and NVDM headers shared by all FSP messages.
>  #[repr(C, packed)]
>  #[derive(Clone, Copy)]
> @@ -92,6 +163,18 @@ struct FspResponse {
>  // SAFETY: FspResponse is a packed C struct with only integral fields.
>  unsafe impl FromBytes for FspResponse {}
> =20
> +/// Complete FSP PRC response including the knob state payload.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct FspPrcResponse {
> +    header: FspMessageHeader,
> +    response: NvdmPayloadCommandResponse,

Since you introduced `FspMessageHeader` to factor out `mctp_header`
and `nvdm_header`, can you do the same for the reponse? I guess in our
case this is as simple as renaming `FspResponse` to `FspResponseHeader`
and using it in `FspPrcResponse`.

> +    prc_data: NvdmPayloadPrcResponse,
> +}
> +
> +// SAFETY: FspPrcResponse is a packed C struct with only integral fields=
.
> +unsafe impl FromBytes for FspPrcResponse {}
> +
>  /// Trait implemented by types representing a message to send to FSP.
>  ///
>  /// This provides [`Fsp::send_sync_fsp`] with the information it needs t=
o send
> @@ -178,10 +261,25 @@ fn new<'a>(
>  // bytes are initialized.
>  unsafe impl AsBytes for FspCotMessage {}
> =20
> +/// Complete FSP PRC message.
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct FspPrcMessage {
> +    header: FspMessageHeader,
> +    prc: NvdmPayloadPrc,
> +}
> +
> +// SAFETY: FspPrcMessage is a packed C struct with only integral fields.
> +unsafe impl AsBytes for FspPrcMessage {}
> +
>  impl MessageToFsp for FspCotMessage {
>      const NVDM_TYPE: NvdmType =3D NvdmType::Cot;
>  }
> =20
> +impl MessageToFsp for FspPrcMessage {
> +    const NVDM_TYPE: NvdmType =3D NvdmType::Prc;
> +}
> +
>  /// Bundled arguments for FMC boot via FSP Chain of Trust.
>  pub(crate) struct FmcBootArgs {
>      chipset: Chipset,
> @@ -226,6 +324,53 @@ pub(crate) struct Fsp {
>  }
> =20
>  impl Fsp {
> +    /// Read vGPU mode from FSP using the PRC protocol.
> +    ///
> +    /// Queries FSP's Management Partition for the active vGPU mode knob=
 value.
> +    /// Returns [`VgpuMode::Enabled`] if vGPU support is active on this =
GPU,
> +    /// [`VgpuMode::Disabled`] otherwise.
> +    #[expect(dead_code)]
> +    pub(crate) fn read_vgpu_mode(
> +        &mut self,
> +        dev: &device::Device<device::Bound>,
> +        bar: Bar0<'_>,
> +    ) -> Result<VgpuMode> {
> +        let msg =3D KBox::new(
> +            FspPrcMessage {
> +                header: FspMessageHeader::new(NvdmType::Prc),
> +                prc: NvdmPayloadPrc {
> +                    sub_message_id: prc::SUBCMD_READ,
> +                    flags: prc::FLAG_ACTIVE,
> +                    object_id: prc::OBJECT_VGPU_MODE,
> +                    reserved: 0,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        let response_buf =3D self.send_sync_fsp(dev, bar, &*msg)?;
> +
> +        let prc_resp_size =3D core::mem::size_of::<FspPrcResponse>();
> +        if response_buf.len() < prc_resp_size {
> +            dev_err!(
> +                dev,
> +                "PRC response too small: {} bytes (expected {})\n",
> +                response_buf.len(),
> +                prc_resp_size
> +            );
> +            return Err(EIO);
> +        }

IIUC `from_bytes_prefix` takes care of checking the size, so this check
looks redundant.
