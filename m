Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AA1435EF2;
	Tue, 28 Jul 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247242; cv=none; b=bhl65WG68eUkMuzMKNayk6HZab5NCNGj+w5K/W2lr7nbVuTBMpkAtaX43MF61lidY8v07FwanufNNeKvSHeg3NCMwJPOnms1hqMFITyy20z7frz0j6Mt/scE2ayNFAMH0A3e7zsmC0fu4tXiaALVyKv9ohgvVkAmdoM3IO2V59w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247242; c=relaxed/simple;
	bh=tEe7sQZEvCqeGSvaaMzIF/z+DTMG76f8Vh3zBLaECWo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=DuJW0RHl8ox1W7/g8Ay+440wkJc/al2KkuYaGvPbz9ZGRJYAjA9NmVGv2IclpTsrHBgQGi0FVPypwVsmpDR5uIGItXwnv+sswwRjuffW6wSPqOVQ4/XS/bWq21fKnoNucW6hKsq4mZAS1lkBEUdjYLGQY8Qskmi0jPi1Wedm65g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9We/73g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9We/73g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227EA1F00A3E;
	Tue, 28 Jul 2026 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785247240;
	bh=pr1vRv75P3Jq8SN5A5e7cCnzBkGW+yIIc60BaHcuzac=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=E9We/73gnCP20b7oLKGMh3gzsjHVFEl4ahBBhneBBkNWQSBwuEdPoHMNE+dVk2Nfr
	 UwNH0WcxTU9S3Heu7J9QKMDbqiNe6LMDWw66NGIfe8w1CtUuewO/EGh7gE8nU83QH6
	 +tqpgVZnRc++y9M6u4scjXfYOXnt7r+TCl21G3P8gxISve60dF4On4UORHzz1yqHCF
	 Iet97krNbCRVNtLQzEM41xamobWlZdXdDXSzIeVK49cnH8mPsHj108mZj/f48Ssmre
	 AtlPyuDECCi3iuJVC6kbxgl0lGgaTspr76Sk6rZTleDFmWw4IC2wBgzQLyWW1QGZ5G
	 Ndx2Vro1/6MAA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 16:00:36 +0200
Message-Id: <DKA9BUHLJY6R.9PNR3BP9FSBI@kernel.org>
Subject: Re: [PATCH v3 4/5] gpu: nova-core: split FbLayout into FSP and
 non-FSP versions
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260724-blackwell-fixes-v3-0-01aa6a54e3fd@nvidia.com>
 <20260724-blackwell-fixes-v3-4-01aa6a54e3fd@nvidia.com>
In-Reply-To: <20260724-blackwell-fixes-v3-4-01aa6a54e3fd@nvidia.com>

On Fri Jul 24, 2026 at 8:56 AM CEST, Eliot Courtney wrote:
> `FbLayout` is currently used for both pre and post FSP architectures. It
> contains ranges for each region of framebuffer, but on post FSP
> architectures, only the size is actually used by GSP. The offsets are
> not decided by the driver.

GSP may be a bit fuzzy here, it should be ACR, right?

Also, maybe we should be more explicit and say that with the FSP architectu=
re
ACR defines the location for each region and the driver only has to provide=
 the
corresponding sizes.

> +/// Framebuffer region sizes needed for GSP-FMC boot.

Some of them (e.g. frts_size or pmu_reserved_size) seem to be hardcoded bas=
ed on
chipid, architecture or FW version; could this eventually be handled by the
firmware as well?

> +#[derive(Debug)]
> +pub(crate) struct FbSizes {
> +    /// FRTS size, in bytes.
> +    pub(crate) frts_size: u64,
> +    /// WPR2 heap size, in bytes.
> +    pub(crate) wpr2_heap_size: u64,
> +    /// Non-WPR heap size, in bytes.
> +    pub(crate) non_wpr_heap_size: u64,
> +    /// PMU reserved memory size, in bytes.
> +    pub(crate) pmu_reserved_size: u32,
> +    /// Number of VF partitions.
> +    pub(crate) vf_partition_count: u8,
> +}

[...]

> +    pub(crate) fn from_sizes<'a>(
> +        gsp_firmware: &'a GspFirmware,
> +        sizes: &'a FbSizes,
> +    ) -> impl Init<Self> + 'a {
> +        /// VGA workspace size to reserve at the end of the framebuffer,=
 in bytes.
> +        const VGA_WORKSPACE_SIZE: u64 =3D u64::SZ_128K;

I assume this could also be handled by firmware?
