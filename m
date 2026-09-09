Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9CB39DBE4;
	Wed,  9 Sep 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979402; cv=none; b=rtpk0+p001DQlzbNQdTqE7tKic4OjjhdSGHipZ9AP9VlcGbJQGDUakLd+yLld4FRB2s4qdHjUaKKBJ2VvlaQPxh2iUlsojt65QbzzCdR8GNXqIwg73TEn9k+CmyKWr2UeJBBP068GLKJF6gcy3zQ8thPo3KInVHZ1hzfndBGK7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979402; c=relaxed/simple;
	bh=ghspr2GSIqZWvRvTz111+Iv78zcWeufsdXHHwzzGLcA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ekdE1TzWjGfb+ZM49ThKlQz9R/vpNFRSKddk9JElXsAemhiGE+XR5M+MaLz+OqgGMdL24dyQPt8IDYNh+5d3YRF1Zu+xG9FnnSXeCDuzJNCQKl7bJ3rSZIPTvRl0vtNGkwg9yU42H/QWzCPWzOGpAPMZ5+8o1RiWmW1cTQONspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXRgxnKG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXRgxnKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7F61F000FF;
	Wed,  9 Sep 2026 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788979401;
	bh=XmUiWAIJa/MMiRXo9fjop8aZ2CU5tq4Sckastbsy9ak=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=UXRgxnKGQ2mrmaRShty6KDEz3wifKRIkGMC50w+q1Mlbpxlpl1AEk0GuHBGaV7arv
	 bbU3JAueqk/yivsSkV8SizMJXeve4We77LxtGv2SGkbKKJ8Qb6+4xNjZIAewdlwl9h
	 CIESqXhB+OxQ1rhs+2mZnhiLD/nWsGDYBWOmgkZfuQGVg5WeCqBhCR310a6e4bFeDs
	 bikuujuhXfPzFrH2GEz38net3R1NEs/AA8BXt4tSqXpmSlUajegatlOlgwoa0b+lx6
	 rw+hd+dBLDSK0wJZMro/uYzE1h4ywCc1WPnlBunX650kJv84FgZbpyt77dSUEdgYu/
	 B+/TDU1ISFZ/g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 20:43:17 +0200
Message-Id: <DLB09PIR3ACS.1CTHUJA4H9PIR@kernel.org>
Subject: Re: [PATCH 07/16] gpu: nova-core: mm: Add MMU v2 page table types
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260909-mmrebase-v1-0-8dd5d4225d2e@nvidia.com>
 <20260909-mmrebase-v1-7-8dd5d4225d2e@nvidia.com>
In-Reply-To: <20260909-mmrebase-v1-7-8dd5d4225d2e@nvidia.com>

On Wed Sep 9, 2026 at 5:59 AM CEST, Eliot Courtney wrote:
> +impl PteOps for Pte {
> +    fn from_raw(val: u64) -> Self {
> +        Self::from_raw(val)
> +    }
> +
> +    fn invalid() -> Self {
> +        Self::zeroed()
> +    }
> +
> +    fn new(aperture: AperturePte, pfn: Pfn, writable: bool) -> Self {
> +        let base =3D Self::zeroed()
> +            .with_valid(true)
> +            .with_aperture(aperture)
> +            .with_read_only(!writable);
> +        match aperture {
> +            AperturePte::VideoMemory =3D> base.with_frame_number_vid(pfn=
),
> +            // Sysmem PTEs use VOL=3D1 to bypass L2 for cache coherency.
> +            AperturePte::SystemCoherent =3D> base.with_frame_number_sys(=
pfn).with_volatile(true),
> +            AperturePte::PeerMemory | AperturePte::SystemNonCoherent =3D=
> {
> +                kernel::pr_warn!("MMU v2 PTE aperture {:?} not supported=
\n", aperture);
> +                Self::invalid()
> +            }

This looks pretty odd. The aperture argument should either be of a type tha=
t can
only contain valid Aperture variants (which might be tricky as v2 and v3 ar=
e
different) or the constructor should just be fallible. The same goes for th=
e v3
code and the Pde code.

Besides that, please don't use pr_*() print primitives, please use dev_*()
instead. But with this being fallible there's no more reason to warn here.
