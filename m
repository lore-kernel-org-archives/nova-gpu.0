Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823CB3242CA;
	Tue,  2 Jun 2026 03:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371527; cv=none; b=K+wMZ2KlPm4DvT1lVIpcSstNPwxNAUBxfsq+8JF84P0U7AMaN23lda8D2KkpL4BBqoGFZwIKiy9VpA09/CX8JzAKyQL6tYvh10VX6fw6XT5oP15nEHK1dwgSQwdqDg94CtTe+EvTwVG4VdUUiweHEUiV9Oa+HXGuPTenck3gwXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371527; c=relaxed/simple;
	bh=PSqOC0/+94Cf6BNs8zLIQnQeqZsDHqHjqy8WixtuF9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=c8EAWSWETm9sqGp7J3v2w5k36jy9pr/qhi0REgbSyA74P+nfFuDira33EcdJGuJPy+w0hISpWScL5vkugr3nFLMvd93kGeRTZyWDRgfruI3D/m+vf696wqJH54IDteuOjYtL1C3Q37QcLb25HAXflPvDXFnm/QzbhOFT04Xn+1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZvLIvK+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZvLIvK+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0839C1F00893;
	Tue,  2 Jun 2026 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371526;
	bh=0kmB+EcdORUb+SQARPr5ULRwg3zv/p2bHC1OsQx9OBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZvLIvK+c8QPzZQ0Y/s2PeQJQA/b2t11RgSWWyXQ3ugokT1HlHNE7apQawBK8aUzC
	 IxFdCPJe56SJApu7zvUDIaDNhR+AiHjcz/k8bPQuILv+zEKk95M6Pwk6JJyuoxTLOg
	 z2Sbw/VHDWWAHuD28qzz1ayxwYeqVcpIlS814YfxWHibiyGy77rzc7RmgtaXt2zMeU
	 h1gEJS2lTswS8HLMO0exi5LklvFYcIj/FhuGlGSR8+zm+9/1zexC0eJZc8n9GmSXRj
	 GNIA7jENxhvU9BdJPf6cNWI6OEQ3iF6/o0sFv6Cu/Yn+kMCSGrPHokukvLJvuZuc/1
	 /Llv6+4a4GYSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 20/22] gpu: nova-core: Hopper/Blackwell: add GSP
 lockdown release polling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Gary Guo" <gary@garyguo.net>, LKML <linux-kernel@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "David Airlie" <airlied@gmail.com>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, nova-gpu@lists.linux.dev, "Miguel Ojeda" <ojeda@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Alex Gaynor" <alex.gaynor@gmail.com>
In-Reply-To: <20260602032111.224790-21-jhubbard@nvidia.com>
References: <20260602032111.224790-21-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:38:44 +0000
Message-Id: <20260602033845.0839C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `io::` imports do not follow the vertical import sorting style.
--

commit 61efdca79645fc25a7eb578eb89ac5e6fa3b4971
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling
   =20
On Hopper and Blackwell, FSP boots GSP with hardware lockdown enabled.
This commit adds the necessary register bit and helper functions to poll
for lockdown release before proceeding with GSP initialization.

> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index f41f3fea15ff2..02aec52813894 100644
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

[Severity: Low]
This isn't a bug, but should the io imports follow the alphabetical sorting
used in the Rust vertical import style? If so, Io would sort before poll and
register since uppercase letters come before lowercase in standard sorting.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D20
