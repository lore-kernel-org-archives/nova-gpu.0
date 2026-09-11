Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED4621255A
	for <nova-gpu@lists.linux.dev>; Fri, 11 Sep 2026 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789102901; cv=fail; b=OQOvxN8kep0FcaqGz9xo9BJb5WwioLqyENocjqDcX7zcSMS0AguyDL96Dc5ODCRozBS5A/9TxLhatU2YE/yNfshjki5+sx5zO+Jr1vNNjJxxhGOFlcvMupyg2w4hrtt1ncaGShEjerhZyF16Mv291kjFZ6is+uHPQH9LAkyGxFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789102901; c=relaxed/simple;
	bh=W6ATm+/PuDV5QMTKUKizvabHlWlH99HEPPynCitc/0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u5j3/zNRpmNYlMYNZWq7RO1QtmBX4D86Uw1xCQj11w475DRgdzXpueEeY+32XQw0wJHv2p+IMLed+2Vu0i7uChdcEuaiZH4dKxFqqXlecOQx1MwVLrBWl047gQBef3zkQ/GSwlRO3bL+iNP4F3ZhpTLQHgo7dH/LtpJAigebATE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZW0MVico; arc=fail smtp.client-ip=40.93.198.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZW0MVico"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQxNhvDo7ciRxkW6jQCW9FsgMdUmj/e33iopbV3K3tmwKMiw3Pb6YR2BQGsE8Feeqgc3UFipMiFMIaKGnXjyWFzlIJR728Cg/vGa5vtkdGLKt01X2lhejmSpjA9YkrKpVn0svJHwqlBzesDEjdK9s1BmVpNMz9ZbMwHFSuNJ+c+38qHe8T9+C0Ges1M7MkoNj1OVJhpgRdk8k62sSYabcEOVsPyLxBjzfNbwo0TKWsnuv0VOSSQByOLebUl4V4Dt1cRaAiDQ3vyj75o20g+d9coSBWOmRj+HmLB/mHUo+W1v9imJc/p581WX7DmAHdVLT6WaarhbaU8MAG73F2IiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eArWLlq/3dF+NE5rZejAWmwck5Tpa1HVBGJn9fn4lTg=;
 b=QZjv2qTsT7EOAfYCQjreYokjw0UFRDB3SuXgB+x6I0vYUxpqVSIbFGihjZGj6rEEW3e+6ls4EWfU5Ncf7HBfrfja/z06E1jBhdr7xArZ7pByIB5lKRkRZS4SU70x22XamD0JUWuj7G9LCk0tko8jYZxc37K209M3uGaPm531DJ9v0SPiJTFCM5MwPjk4zkc+fvEbTI3zHClbR9tmG2QjrGvgBXlqZ5KxcxV/VWG9nb1JTcFOFLBqxH7z0FO+ct58LSBeHxqPQ3mujyJrSESv2XfFCHg+cYrIMPjaIs1+QzK5TXp0xbLT0HYm/q1Q1pcWzcTnJiEIfd9nYqzeLFJ2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eArWLlq/3dF+NE5rZejAWmwck5Tpa1HVBGJn9fn4lTg=;
 b=ZW0MVicopv8zSY0dOy5s2dnf1GmcQfr3rhMpbdo/1lHPIUrJDsFVgJp3PQZek4xaaUKnFtIsTItaRY7H9yn3nci7hJ8MCacaTx0xjYWkPwdn4AsUo7f3/QVCooJItEuu3sSCH8DJ3S+tbijnfDUTp8mG73IOWe0VL6sBUKTb9u/0SvCfcchjaVu7qwSFrT88ASafyYMgH18lPfWXYD2HYOR8FeQImrTza6YnJ6XoiTmB+nkOfjnfwOkhSgQPn6BrLhMpKDBaeQQdlFs36bxJEhBlkBGN5H3e3YXPiGicuS2/7EaCrIZVu6ZshgIi+6fctwklOxqHbjG607k3yV6dVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 05:01:34 +0000
Received: from MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28]) by MN0PR12MB5977.namprd12.prod.outlook.com
 ([fe80::d8:f725:258:2f28%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 05:01:34 +0000
Date: Fri, 11 Sep 2026 15:01:29 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: dakr@kernel.org, acourbot@nvidia.com, alex@shazbot.org, jgg@nvidia.com, 
	yishaih@nvidia.com, skolothumtho@nvidia.com, kevin.tian@intel.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, jhubbard@nvidia.com, 
	ecourtney@nvidia.com, cjia@nvidia.com, smitra@nvidia.com, kjaju@nvidia.com, 
	alkumar@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	zhiwang@kernel.org
Subject: Re: [PATCH 02/13] gpu: nova-core: mm: add VramBlock and Bar1Map
Message-ID: <aqOE4FJ6eq1qu_kQ@nvdebian.thelocal>
References: <20260905081116.106613-1-zhiw@nvidia.com>
 <20260905081116.106613-3-zhiw@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905081116.106613-3-zhiw@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0112.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::21) To MN0PR12MB5977.namprd12.prod.outlook.com
 (2603:10b6:208:37c::22)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5977:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: 04b31553-924c-4571-b9e7-08df0fc1c074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|10067099003|4143699003|56012099006|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	lz3nHUvcUYNlPs1kT56R0xM1dPumK/TSuCuENdY3yIT3EQtBPMWrLJifdhy6qp8MNiHq9huTjN2Q+4liL7W2w29GBxNvknHr92HOoXNZ9Wbl6gYoL5BUTFoppr7gQ3a/UiqnGMAhpF4EPHCCEff6O+IvAXSKCbBoH7YfObutZriO0U4W8FErcq+JMEkf6fVZTN2aVi1X1KIUX7SmmGQbhfcYzrAyzw/1nlBi2R6rAPmsV8DG34ToWqNcb7A/tLWOvkgk+VOif4mtPc6Dki4icV87WVtMpZ3ZPkDVaBEouzv7jbsuSWVnn6Y5FVpTUUjU3DDI4+9/eYntQhVNvyrnApIfwwa0z91IL8BlboW5swKNWYE+XtT3WhxW17AgjvJxHPhHLNWcdlwmM3SwqiQAHMdbhUizAJuPcqsfON+8hZ+F9qRibF11/Ygd5yE7sYdHqQiJYj2W0pd7ABNXfXLN5hQtEPcNjItphLpmsjJ4IA6s0dmf6e6DOnSTA/qCpo1qZHec9SsIA8cMB58BEQdcXAs8OwL9Gw90h91YOL8+7VuHrGUYuM8D5kIVCth/m21MtSI/Rrj3S6TXlR/TsP/3CGJGGI6lQ3vs8crEwDWoGfWUNHN/lJXsAxaGEoYk45PHLI6ilKBC1rE2oEexr1iL5tuj9s5YhwzpVca7JZ7vGyw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5977.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(10067099003)(4143699003)(56012099006)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1W0RZxF5xX5DUZ6Z+nBKvPgVrfajET8TAi9y4whY1dCnMWV3hkkORQDG3TM+?=
 =?us-ascii?Q?ENPTAi0hDDhGmzimlRMzEJxBz3CV2FL8qlcAIYP+ZlXa2lP+2y4oGpEhfp1W?=
 =?us-ascii?Q?ZRfaqlCbqmTUCCu3T0kz3qB/herNvN/HFcPnpxc4MkEs/723kYYb+ijlT2y8?=
 =?us-ascii?Q?uCJhT+EPLaBo9QNx62vu1nkX2uediEX6oWNAg7DMWkdytb1LIxHJqTe7aTu4?=
 =?us-ascii?Q?FhdfvC9fdx5Q/4CAnxvqkBatYevejUdx1ShzPWNbwRiAhMJjaV4THwQWtmqQ?=
 =?us-ascii?Q?Su+VpMjhTajCTg+lbIVIy/hAOcMmwFI5m0ghsZoYrUnzjvx3XXv8qAF3Acb0?=
 =?us-ascii?Q?IK6OnM0i6HzbwgTseFeD0tlMQSOy9Fbv1a21s7Pwya7OqbB6Qruwe7E0/utt?=
 =?us-ascii?Q?Etq+KF4u8CfSVl2yvTaE+Hy4ezbX/bsN/5Cfb66a4AzmcwyoLue/1EvfNq+t?=
 =?us-ascii?Q?S+jHDkjQlzD/hfp+QWySzg2kl7sLZnx1+brsCRicBOq+TNfAgS6geLKw0im+?=
 =?us-ascii?Q?Brs9hj3DAurdN47eaIvK2G6ivotkYkgve8/lQZBVM03GcOMQ0WrFonOeAQv+?=
 =?us-ascii?Q?TAs9PNnDFxn43qZaDTF36GSRGAg6jfQDC74zboLIqM3rL5n7qANkpAGyzXX1?=
 =?us-ascii?Q?qnozBYNB0o8KalwmgId2g3j9s/BoVJ2uZm3X1kFiDcJJcsQRqT4EPvAxL31l?=
 =?us-ascii?Q?bpr0Qw2UMnEmRs70XGnIT/6yersg7yWJ28To9gOpqe4ebepcX+A13U3TnRnR?=
 =?us-ascii?Q?OBb70sC1tca04MWj26hjgGBEXQtv+jVldQjQXuJg47yS3tHRbKr0kV6dupgL?=
 =?us-ascii?Q?Q8KjmrnWvE3RSYflzJuo3rrinMPRCVvKeFH+sw6pCSX9RPfyIO2YE7LCMwYa?=
 =?us-ascii?Q?0fr77dfeo+2QSnW4UtybzsdOmu4HVKzgu+UNVDLg6XRHShdIVVN627reDOLk?=
 =?us-ascii?Q?TGgswL/8H+SwcaaaAmaAXaXsmSsOecU4zT1dHnWUP1wEfPehXat+xwwzyGfB?=
 =?us-ascii?Q?OiQU7hW5xHZp6AYx5wjBtwlJA08vFoQxD+1HfLyYBOnWw/7bvtKptv5qWzo0?=
 =?us-ascii?Q?ecBgR3kJbzoubDbZejMnfqnca+rfyRmhGyX7Nb7tzVRTRLja/gzT2cPh0A6J?=
 =?us-ascii?Q?XKIkq+pc9UbbmwM3trCZCZ6iSwXNo9hpt2oKubNWiIlv3aa7mWKB36j2NVn5?=
 =?us-ascii?Q?MPAxf/na3tFvAp7pZrmBajn82Zy3gsKSi0rNycWxKoLkTLGw2pCdh/ZIdEfd?=
 =?us-ascii?Q?b1aaPFTj+VhPzWF06V1/F8xarJ/+lmTsHbI98r/O56VqF5F25o+MP0rFHJJJ?=
 =?us-ascii?Q?+cHgwiZIPpEceCLi0ltdaGc9tgaQUVdI2GdhLl7s6jnHeIrlpU+K3C2/Lgv/?=
 =?us-ascii?Q?OFBQvvOd5Iy1Hm4l0eTNBGP2xcbjHRNgZKDqwQArJQgVwPjw/nBheizNm+H7?=
 =?us-ascii?Q?vFkXphiKU6xv3cZnxQ7NhAoBWmgqS/d2xTESD3kZKnga8RmYGLPQZ0pichXD?=
 =?us-ascii?Q?jVnVh9ejGASJyT14vuhCH33izPFWRSQ422QX9DoDmQLAjpu790q1jDOjnxJj?=
 =?us-ascii?Q?zHN1+OfammblkrZykHcjCXr0bDZDF7G1QFXun7r4yiB4IxKk0BNIZFloR361?=
 =?us-ascii?Q?Oe/aiDqXTkXsmoyVwnvCyqzUimJ7bv2cFescyGCTG90vukllnXTQs9UcgcL1?=
 =?us-ascii?Q?14PZo+6T0xsBnVZVbnzzqeA4nw5vJKOqaLFKYLfm5pDUqafyEr0j2iS7s2Oz?=
 =?us-ascii?Q?nnWkN8q6Bg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04b31553-924c-4571-b9e7-08df0fc1c074
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5977.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 05:01:34.5423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLDYfvaM81hrPZ2MfRjIy2X4kxlvRqh2qXvaDC4Piv1JjO+Vn2RCbWLTuGRNlOPGO1ATmzpWGMlGa0eDlxBsdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232

On 2026-09-05 at 18:11 +1000, Zhi Wang <zhiw@nvidia.com> wrote...
> GPU page table setup and VRAM-backed control structures require the
> driver to allocate physical VRAM and map it into the BAR1 aperture for
> CPU access. These operations are common to both the base driver and
> vGPU paths.
> 
> VramBlock owns a buddy allocator allocation. Shared VramRegion views
> keep that allocation alive while callers select byte ranges within a
> larger preallocated block. Bar1Map retains one such region while mapping
> the containing pages and bounds all CPU accesses to the requested view.
> The mapping must be explicitly destroyed to release GPU VA resources and
> invalidate PTEs.
> 
> Keep BarUser inline in Gpu and let short-lived BarUserAccess objects
> borrow it. Bar1Map owns its mapped VA range and borrows the driver-owned
> BAR1 mapping; explicit destruction returns the VA through BarUser and
> GpuMm. Its MMIO accessors remain runtime checked because BAR1 and the
> logical mapping have runtime sizes.

This patch seems to be doing three different things that build on top of each
other, so it would be a bit easier to review if it was split up into three
patches. One patch adding the VRAM allocator, one dealing with the shared
VramRegion views and another to do the actual BAR1 mappings.

> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs         |  20 ++-
>  drivers/gpu/nova-core/mm.rs          |   6 +-
>  drivers/gpu/nova-core/mm/bar_user.rs | 143 ++++++++++++++++++--
>  drivers/gpu/nova-core/mm/vram.rs     | 187 +++++++++++++++++++++++++++
>  4 files changed, 329 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/mm/vram.rs

[...]

> +/// Allocate an exact VRAM range relative to a usable region's buddy base.
> +pub(crate) fn alloc_vram_range(
> +    mm: &GpuMm<'_>,

Given this operates on GpuMm I think it might be better if this was a method
implemented on GpuMm.

> +    range: Range<u64>,
> +    align: u64,
> +) -> Result<Arc<VramBlock>> {
> +    let page_size = u64::try_from(PAGE_SIZE).map_err(|_| EOVERFLOW)?;
> +    let size = range
> +        .end
> +        .checked_sub(range.start)
> +        .filter(|size| *size != 0)
> +        .ok_or(EINVAL)?;
> +    if !range.start.is_multiple_of(page_size) || !size.is_multiple_of(page_size) {
> +        return Err(EINVAL);
> +    }

I think these should already be checked in gpu_buddy_alloc_blocks() so no need
to repeat the same checks here.

> +
> +    let align = align.max(page_size);
> +    let align_usize = usize::try_from(align).map_err(|_| EOVERFLOW)?;
> +    let min_block_size = Alignment::new_checked(align_usize).ok_or(EINVAL)?;
> +    let buddy = mm.buddy();
> +    if range.end > buddy.size() {
> +        return Err(ENOSPC);
> +    }

Ditto.

> +    let blocks = KBox::pin_init(
> +        buddy.alloc_blocks(
> +            GpuBuddyAllocMode::Range(range.clone()),
> +            size,
> +            min_block_size,
> +            GpuBuddyAllocFlags::default(),
> +        ),
> +        GFP_KERNEL,
> +    )?;
> +
> +    let mut address = None;
> +    let mut allocation_end = None;
> +    let mut covered = 0u64;
> +    for block in blocks.as_ref().iter() {
> +        let block_address = block.offset();
> +        let block_size = block.size();
> +        let block_end = block_address.checked_add(block_size).ok_or(EOVERFLOW)?;
> +        address = Some(address.map_or(block_address, |start: u64| start.min(block_address)));
> +        allocation_end = Some(allocation_end.map_or(block_end, |end: u64| end.max(block_end)));
> +        covered = covered.checked_add(block_size).ok_or(EOVERFLOW)?;
> +    }
> +
> +    let address = address.ok_or(ENOMEM)?;
> +    let allocation_end = allocation_end.ok_or(ENOMEM)?;
> +    let expected_address = buddy
> +        .base_offset()
> +        .checked_add(range.start)
> +        .ok_or(EOVERFLOW)?;
> +    if address != expected_address
> +        || covered != size
> +        || allocation_end.checked_sub(address).ok_or(EIO)? != size
> +        || !address.is_multiple_of(align)
> +    {
> +        return Err(EIO);
> +    }

What is the purpose of these checks? Do we ever expect to hit any of these
errors?

Thanks.

> +    Ok(Arc::new(
> +        VramBlock {
> +            _blocks: blocks,
> +            address,
> +            size,
> +        },
> +        GFP_KERNEL,
> +    )?)
> +}
> -- 
> 2.53.0
> 
