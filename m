Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012071.outbound.protection.outlook.com [40.93.195.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790164A8414
	for <nova-gpu@lists.linux.dev>; Wed,  2 Sep 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361239; cv=fail; b=cXhx8mn46jGuvY8siJBDnQwcbH/A55YdeVAiq/OM4lrF9qtFjiaR9kIWoBcAl289D6LLAj1pNb37OEQwMSUTnj+v9IjF4BzcJDzzu6ZNsugDOP4zSA3SRPnJ/bsw5BijYFma3zVh9DSc14zpxR5a9H/UWl4euCp7Qi13uRyke+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361239; c=relaxed/simple;
	bh=EUT/yKcWHCyRNeOA8vWm1ySVjclSlNwni8IeGnwjtNA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=pKoVQYTGte22XEVIqTi+WODMGBAyoycuV/plw8vUeDzB5o/+bIcvQ2b/VzRy1RCWkqL1HMHK1/c5yG23YoLljQ6OYw59SJVE6ubRY6wsdqH+Yxn0vzfoL/7d5FrmZlnCGlK3YuLnuSFzVzLwBMol2f9GJYXuOKilqafzU0705HE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oVi8Sctk; arc=fail smtp.client-ip=40.93.195.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oVi8Sctk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoJBZsAC9m8/I0spy+PYk7X28fkBUhamHCrNpAXCSgTFyZUraWA36tq/HbMRBvc3DYKmTXM/7ErcztZzN4tZ04BIDrNVWw4aFzWvi+hfQu5t9cybkG4+2PYaPledcn/IUr9DcJag9Yv2JyYSf2QnifbSeer2XwdCYxf0nSnLw2npClls1EK+Rilmahx4LDRH63aD1GSiy6q1AQ6LP8HgXofYHLJYD/pM4XisXdRQpmYpATV1Ex4a5sx4bzhcdpTO0O02LI63igsccQpJ85A5rlVfYeKhDmzfyCTOnVzB4ty2iw1f9bSIjJSZo//hshEiaUklGcazm5bv4rWDX1fJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtIlwH+ezV4BOZyWMP8NziyEOVHfOTm3IOh7/aMM2Ik=;
 b=D8oGsAt6lLtykLipVZCYmjmhQNUOxMYvDwSJLY8xDdC8TZDIrJH5V/mv243EjTfRiUjvQE0Lwzd54UgjrD+Z8fCDQAegyWAjlRVRe4Q3Ale82jgrodZXelgPnNneU1NrNyvTWOIzLMU4NcssNJ+sJwMmt+mDZInHEphZ7+5LDXWXdsppedUcvWV55H2x07R9npeQ/VjuFQgHIBmlicWoyunzI60eO1HNjvU/q5oAnJxwVc1jIa5MC89IuPSSRvdQVlqGod7g8nVR9SWZ2/4R/RXxmvxE1kTJ45vnn6a3zx7MLWELmKL6ZmqO47U1mZn0uSVDf0G0g66HjI1OhaBt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtIlwH+ezV4BOZyWMP8NziyEOVHfOTm3IOh7/aMM2Ik=;
 b=oVi8Sctk4JSUnLTRRyYlagPqGbjzGk0PUMwo3kj1zV15QN0SJjrAAecnHIksYTa2QwYuig60KWLJRNG8ezU39x6hTBizA1cnNQBj97KKRNRU2JSIqML1NDNrc2O4/djCK6NA5bBa5sQHYYUyYvl+u1vJ5JlMJA7e2c4wQc7RM5nzX+EOPZbDGuvXsk5Q7trmp0EVCpBML/TbC7XsIuvnqXpe0JEufLF1UYiyAPyJjJcQ+877upd+kPGCInC7teykn8JMzc1gO0xH36JTLW8HCRpFT5y7ZJQzEvTkpQZsPKIvUzfJ2y35PWZj8ZI7Rd213EHWgQKkefqvmeUW7E3NBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CYYPR12MB9016.namprd12.prod.outlook.com (2603:10b6:930:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 15:00:32 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 15:00:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 00:00:29 +0900
Message-Id: <DL4X5B86OROD.22YISVN1ADX1E@nvidia.com>
Subject: Re: [PATCH v2 13/15] gpu: nova-core: retrigger the GSP falcon and
 clear every latched cause
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Will Pierce" <wpierce@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-18-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-18-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0137.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CYYPR12MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: c374c32d-f218-4e73-365c-08df0902ef65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|10070799003|366016|6133799003|4143699003|10067099003|11063799006|5023799004|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Kou5SqMdAhvAp/Qo20WKEBo3EXeLLdInvbWbhg3n8Ej3qZlwMUDdggt5bNayBmYnYGPVNCA1JhFL8Gfz49XuQRDax9C7j5k/9SoLDZ0fE7lZILWugyjE6NwppFXzRQ/g1J8anXTnLoRaECKdo0BuMbmfs7H8zQPNy6dG9genyXOa6Sq5A+q66W5O2qXQn7fMqTIEm+Rik7DUiB7phj1CO6bOFDMNXwGzz/J5iMSaH7nC0TQ2HMdpmbdlFDKArTXdImhZYu8LZTzFZoAHnLEMHVtP4ePIayGUNLuNgjzgv+lLuNiUm3Z0kLhYH8phk4kBPi1k4+JnVwyaEGi5t8Ob8mgmO7gcJiO+psbcDd3PblQp4A0pPp9PAYt4opHRT9sIOTl8K8llkjcBchuCBnwzoKQDcB4YgeOtCzfJ+zq/oXKNjDVgHZVQt14EWuZ+KatkPBEdK/T0sJPVl7U/al/GvnLLS51k7Z691GHHU/NwjitWi3jq5Wf5T01ldy6mmXQSOUSGM7MpZQ3RtOKgKwRhA1lzGuycM/L0qbGMt/+xzVfumZF+J2bWiPArbPgwibEdMh0hqym2acD8Bo9vGfv6IxNyQ6DO0LkQg3X6wmc4qwXOhcbCBRyog+VdFsBKf//Iwe2jNEI5id7VcTJIfMK4O1LSzuseKUT3Z2PI3wPEcBI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(10070799003)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(5023799004)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NBdUtvakp4NWJZVkJOc3VCOVdUUWpLSlNFSFhPSTV5ZGpzbmpPbXJneSti?=
 =?utf-8?B?Z0k4UFJaMWFUTm1kSFhzS3V4Qkd6SG5jcDhFUU9ackJMNE9KcjBaNEFqNm9W?=
 =?utf-8?B?WW1zUndsejlaelRDS3M4Y0tzdEJ6NDV6NUIwZ1hDWFhIRlQ3Y3RDbXR2ckVk?=
 =?utf-8?B?Q0VZa2Rxd0xnRytJYjM5QUh3MGpocUgyMkhwQktFMVFXT0IxNWorMndiTVVU?=
 =?utf-8?B?djNpWTBYL0JMdTFjMk5ScUlaMHFWS2F6YlpoRDM5UlNlUVVCVENXUkllRFhP?=
 =?utf-8?B?ZzAwWGh2ZXl5VFR4anFqTEt5WEg1MUpiTG5WVHVvYTlSdzRrWi9LQ1Z2KzA5?=
 =?utf-8?B?QmZLRlJmcXYrWG5ZbW1aTGhIbDFjb25IczFTdU1sT2ptU3JGN3Q4M2dpcGI2?=
 =?utf-8?B?V0VLRldnZitpSFJlSXNMZ2c4bXUvVytEQ1VRdVl3WGhzM1dSSXR2S1RleGRz?=
 =?utf-8?B?SWZZeFI2c1JFRWNSZHpadGdkK2tXT3lhOXY2cGt4QTZQU0RlZE45M1Z4NXZh?=
 =?utf-8?B?ZVNMaG9zY3VFWDA3UDh4ZC9MNkVwaVQ5UHdQUVhxVnZyMkpESGNmUUdSWkZr?=
 =?utf-8?B?WDc0Nk5IYkpaSmFrN3ltak12Nk9SK3lBMUVKOGRIdWhiSlFFSi9iUGJZWk5D?=
 =?utf-8?B?TWtjVy83cXUvWnpsdHR4RFp6MjA3K3ZEc2ZqaitiUmFWajhkZ1NVYXg0YW90?=
 =?utf-8?B?QWtzZFE2di9mL3hSdkxLL1FEVzBkSWF2a0VqN29xOHZyWHdzODlnOE1ySmpj?=
 =?utf-8?B?elBuR3Z0WUlBbzFYZWxGc1UvY1FRWjF0Q2ZnZXpraWd6THg1RktWclJVRHUv?=
 =?utf-8?B?T3ZlZDA5ZUFTc29sRzZuUjFxcWJhSXlYNDBvSytaSTBac2tjc3ZVSmoxQzNo?=
 =?utf-8?B?NU9WNWRrTk1IZjdQTGY4ZWt6NVlMcTNLVE9ieFcwVGp5TmVFRmFDbExzRmlT?=
 =?utf-8?B?dURjS2JxNWxtS3ZTSnNJNmxEQVY3Yk9pS2VLYWRuYXZ3bm43NE1UVnFCVnBi?=
 =?utf-8?B?a1hHWEpoVzZldWJ6dTlBSU9xYVBmSnI3eW1wbm5Wa21YdDlzaWpMSEJhSXV5?=
 =?utf-8?B?REYzR0gxT3J1Nmk5UlJ0M3ZrVXFFb0tDT21LQmE1VWNDcEF4d2FVNkd3RkY3?=
 =?utf-8?B?Wm5OcGJ2SlFYMVdiZG1UVExyL2trL29OWE92UHZZUW1jdEl3YUk5bWlPM1Q5?=
 =?utf-8?B?UE4yZXZXdGFEZk5BRlN4MmtTZUNYMGxJdXNQUWZnOVFXc2QrcUtNZkU0NE84?=
 =?utf-8?B?QUU2dVBHVzc3TTJCOUw2RGZxeS9FRDdzMjMvY3NoeGdtQnVHNzhzTHhKOVRq?=
 =?utf-8?B?QXF1VE1IeWp2cWw2VFk5a2Y4T0VwS1Vwd0dRb3JTM0lKY3hNTEluWWlvRjln?=
 =?utf-8?B?M2FNaFN6eDlBczViOGt6QTY3cWprYS95dHZ3RG9Ca2FuRGpsZkNvTHFiYTN6?=
 =?utf-8?B?SUJDQW5neExaU2tTbzNSakZPd3p6UVdqMVd4NjhhRkRjcnBKRUZ5emczS2tY?=
 =?utf-8?B?S244SmQrMW5wYUpuLzFndzRFS0dXQjRVUzlHK0dpSmNva3hlS2ZYaVI4L2Vu?=
 =?utf-8?B?UDQvNWNoZXdHWGlhM1BUN2NRUG9nYVZhbnBIazVaZ1ZHTW8wTk1vaVROaGRJ?=
 =?utf-8?B?eEt6LzdQVTVvY2FLdXFQQUtJZTZkdDZEbWlObWhrZlQ3VmowUVFqZ3VaVklv?=
 =?utf-8?B?TGVqTGFwRXFtQUNCRjlzY1IxV1podXVKNFZJdWNkdmxkU0JoSFJyMWNqd3B4?=
 =?utf-8?B?d2kwcHNrMEhXM1FRQ3Y3N0xyWnkwUmM4WDBYOFRObVlVb3pwRDF6VWZ3a2I3?=
 =?utf-8?B?d1h6U0N5cUMyU2ZnYlZoZFQrVWZRam9ZTTVYVXY5OHFldTR6SXpmL3BFUzNi?=
 =?utf-8?B?MkFHejNkS0tlNEdwQ1ZiVU51VUNLakozV3k5c0U2NUY0TzJ6eFNYd1JiN2g4?=
 =?utf-8?B?R1EzbElhVSsrUlpDV1U3dFJCT21Ec3ltUVAwc0FKQnBsZDFHVEdjdWdnaHBQ?=
 =?utf-8?B?N00yM1RHTVVqMnp4NG9CMXZZV3NtTWlvejhaOGtFeURkSzV0dlVEWFBoWmlE?=
 =?utf-8?B?blNUNVVYOTAyeGM3MGtnQ2laaHVOMlQrcWNBejhDSm43YjNnanU4Ri9kcktL?=
 =?utf-8?B?WnZ0NXIwd2o2M3dyQmt3S2FYTTFqNkhYLzdzaXg5WmJDSWxtcnhyWTRsYmFw?=
 =?utf-8?B?bHVhQStOa0ZQZlFNTmZGOHpHdkNNUWVFRFV4bCs0OXpjbThKZXE1NW1jcjFB?=
 =?utf-8?B?c0F1ZWZtSmxvVjBOUlRPWmdxSEF2YU1nVlpHN0ZKTG1YRVhqeGd5WTU5bjQv?=
 =?utf-8?B?c1oyZi9SZExMcG9rOUJKQTVPVko2V2QzVk9xYzdWWWhpV3JuSGdqQUVBaXZo?=
 =?utf-8?Q?sQvLwgt3LW6fH5ZwjhuVLUVDZjXiM3C4HWJ8hdDnCltVK?=
X-MS-Exchange-AntiSpam-MessageData-1: EBAq5zgih31o5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c374c32d-f218-4e73-365c-08df0902ef65
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 15:00:32.2031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKHjWe1Eka9+OezbIxqbydObEY8Tg+NnkbPRl8/2lBjJ8t5LMYc/WnWcdz7hMsN8qODYpDVXu/TE3LlLk6cU8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9016

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
<...>
> diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq=
/gsp.rs
> index 6366380eef98..a1030d66cc70 100644
> --- a/drivers/gpu/nova-core/irq/gsp.rs
> +++ b/drivers/gpu/nova-core/irq/gsp.rs
> @@ -50,18 +50,17 @@
> =20
>  /// Clears the interrupt state that GSP boot left behind.
>  ///
> -/// Disables every vector in every implemented leaf, clears the falcon's=
 SWGEN0 latch, clears the
> -/// tree's pending bits, and rearms PCI interrupt delivery. On return no=
 vector is enabled, so the
> -/// tree delivers nothing.
> +/// Disables every vector in every implemented leaf, clears the tree's p=
ending bits, clears the
> +/// falcon's SWGEN0 latch, and rearms PCI interrupt delivery. On return =
no vector is enabled, so
> +/// the tree delivers nothing.
>  pub(crate) fn quiesce(bar: Bar0<'_>, chipset: Chipset, irq_type: pci::Ir=
qType) {
>      let tree =3D Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into());
>      tree.disable_all_leaves();
> -    // GSP boot consumes its notifications by polling the queue, which l=
eaves SWGEN0 latched.
> -    // Clear it before the tree drain below, so the drain clears the tre=
e state the clear sets.
> -    // Messages already posted raise no interrupt of their own, and the =
caller's queue drain
> -    // covers them.
> -    GspFalcon::clear_swgen0_intr(bar);
>      tree.drain();
> +    // GSP boot consumes its notifications by polling the queue, which l=
eaves SWGEN0 latched, and
> +    // the GSP drives no new signal while it is set. Clear it after the =
tree drain, which erases
> +    // every leaf bit and would erase the one a message posted since the=
 clear had set.
> +    GspFalcon::clear_swgen0_intr(bar);

This code was introduced in the previous patch and is now immediately
moved around, and the comments for the two versions contradict each
other. This patch's order seems to be the correct one, so let's use it
from the get-go.

I guess this stems from the general ordering problem with this patch: if
its new falcon registers were introduced before patch 12, then patch 12
could be written in its final form instead of having its code amended
right away. It would be nice if you could reorder things this way for
v3.

>      // The `TOP_EN` cycle in `drain` is the rearm for the two enable-cyc=
le methods, but pre-Hopper
>      // MSI rearms through a configuration-space write instead. An interr=
upt delivered before probe
>      // leaves delivery un-armed on that path, with no handler to have re=
armed it.
> @@ -80,6 +79,8 @@ pub(crate) struct GspInterrupt<'a> {
>      cmdq: Arc<Cmdq>,
>      /// The GIN interrupt tree for this chipset.
>      tree: Tree<'a>,
> +    /// Chipset, for the falcon retrigger, which Turing does not impleme=
nt.
> +    chipset: Chipset,
>      /// Device, for logging from interrupt context without taking the co=
mmand-queue lock.
>      dev: ARef<device::Device>,
>  }
> @@ -98,15 +99,18 @@ pub(crate) fn new(
>              bar,
>              cmdq,
>              tree: Tree::new(bar, chipset, irq_type, GSP_SUBTREE.into()),
> +            chipset,
>              dev,
>          }? Error)
>      }
>  }
> =20
>  impl irq::ThreadedHandler for GspInterrupt<'_> {
> -    /// Top half: clears the GIN leaf, takes the falcon SWGEN0 latch, an=
d rearms PCI interrupt
> -    /// delivery.
> +    /// Top half: clears the GIN leaf, takes every cause the falcon repo=
rts, and rearms PCI
> +    /// interrupt delivery.
>      fn handle(&self) -> irq::ThreadedIrqReturn {
> +        let bar =3D self.bar;
> +
>          // Only service our own vector: require the GSP bit in the leaf =
and clear just that bit, so
>          // a co-pending vector in the same leaf stays pending for whoeve=
r services it. The subtree
>          // stays enabled, so there is no whole-tree disable and enable.
> @@ -119,27 +123,40 @@ fn handle(&self) -> irq::ThreadedIrqReturn {
>          }
>          leaf.clear_vectors(GSP_INTR_0_VECTOR.leaf_mask());
> =20
> -        // SWGEN0 is the message-queue notification, so wake the IRQ thr=
ead to drain it.
> -        let status =3D GspFalcon::take_swgen0_intr(self.bar);
> -        let ret =3D if status.swgen0() {
> -            irq::ThreadedIrqReturn::WakeThread
> -        } else {
> -            // The tree routes every falcon cause to this vector, so som=
ething other than a posted
> -            // message fired it, for example a HALT from a GSP crash. Th=
ere is no recovery path for
> -            // those causes, so report the status rather than discarding=
 it.
> +        let status =3D GspFalcon::take_swgen0_intr(bar);
> +
> +        // Every cause the falcon reports leaves the falcon's enabled se=
t on this invocation. A
> +        // cause left latched holds that set non-empty, and the falcon s=
ignals the tree only on a
> +        // transition of the set, so no later SWGEN0 would signal at all=
.
> +        let unserviceable =3D status.with_swgen0(false);
> +        if unserviceable.into_raw() !=3D 0 {
> +            // The tree routes every falcon cause to this vector, so a c=
ause other than a posted
> +            // message also arrives here, for example a HALT from a GSP =
crash. nova-core has no
> +            // recovery path for those, so report the status rather than=
 discarding it, then mask
> +            // the cause.
>              dev_err!(
>                  &self.dev,
> -                "GSP interrupt with no SWGEN0, falcon IRQSTAT {:#x}\n",
> +                "unserviceable GSP falcon interrupt, IRQSTAT {:#x}\n",
>                  status.into_raw()
>              );
> -            irq::ThreadedIrqReturn::Handled
> -        };
> +            GspFalcon::mask_and_clear_intr(bar, unserviceable);

Is this correct? My Clanker told me (and looking closer it seems to be
correct) that `IRQSTAT` also reports causes that are masked, or routed
to the RISC-V core itself rather than to the host (i.e. GSP-RM's own
interrupts), and that OpenRM filters these out: `kgspService_TU102()`
gets its status from `kflcnGetPendingHostInterrupts()`, which for a
RISC-V falcon is `FALCON_IRQSTAT & PRISCV_RISCV_IRQMASK &
PRISCV_RISCV_IRQDEST`. Without that filter, any GSP-internal cause that
happens to be latched when SWGEN0 fires gets reported here, then cleared
and masked out from under the firmware.

Also in RISC-V mode the mask gating host routing appears to be
`PRISCV_RISCV_IRQMASK`, not `FALCON_IRQMASK` - OpenRM never writes the
latter for the GSP. So the comment about the tree routing every falcon
cause here also seems inaccurate.
