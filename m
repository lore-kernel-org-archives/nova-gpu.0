Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0D337267A;
	Mon,  8 Jun 2026 22:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780959454; cv=none; b=XakW9xrpKrBFJHwUR+ePv6/l9ZpA0jNTrNP8kiYqK+gty4EjQCA/wBl322zIe0VA81jqKk5Iztj+fn96eDRY+NVOunK+9FW03X9EubLLKdbQXJAlWdQmpo3Ou4smqX/fRJxms1/Y8LJY8rRMX7KeXHzfuKdN+VkFHX6Rkovq82Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780959454; c=relaxed/simple;
	bh=WH6XS6Y+L7gEsDYB9W+TuVDKftPIRwzoX1OngDX8zvQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=HqrEK3hs+tKdRXWc7SVs+036x9PuONAO8VQIn660RvTyNtkhkPnH9yJOEY/nzJ0EbbwsgqDb1BbL5OsWPhSHLpF8wyAC0BnrzRy7aKPRXNgKb4b+Dcf4epasPyKui23Eo4416r08KCT6VlsR6GgpUF99KOP1iRdIkyGLaHDjN2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+IY/gXj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+IY/gXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586161F00899;
	Mon,  8 Jun 2026 22:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780959453;
	bh=8KJIlVG1DOJf2xhDfmUPwUZUFjWZyog/EgMRcmytkvs=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=j+IY/gXj9W1URXGm4b9NicdLraIYwQ037chFiU+YtJbDV4tILcr30lif4VZx2NF0Y
	 CauTW2NNfptVPA0mHhlm/kkh0hhdcVh1MjK+JXENp2XaT1mS9myg9olUucSbw0BOrb
	 cXKW8NuE1uiWeG+s00FBvx6YzgKAweLRL+lvahZnofFtxUd8G2yiVJxN1L28eth8CU
	 o23hIiuatYlnNWOVoDCDeypk4UAv6LGkKKI7Glhl3djIO0my6bVLltJcLs9+5nLJwk
	 aaIc7kcaVxZ4UFqBoZBIT1BMToCBM2yw/yCOfTeobIk1n1QFhGHoGWkAC8ho/4xjYw
	 YaUdruET0kLdQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 00:57:27 +0200
Message-Id: <DJ41FNJHLCJG.4YW9GS4MDX2C@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: don't declare booter firmware for FSP
 chipsets
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nova-gpu@lists.linux.dev>, "LKML" <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
References: <20260607230539.144382-1-jhubbard@nvidia.com>
In-Reply-To: <20260607230539.144382-1-jhubbard@nvidia.com>

On Mon Jun 8, 2026 at 1:05 AM CEST, John Hubbard wrote:
> The module firmware table lists booter_load and booter_unload for every
> chipset, but Hopper and Blackwell boot the GSP through FSP and never
> load the SEC2 booter. Those modinfo entries point at firmware files that
> are not shipped for FSP-based chipsets, so initramfs tooling looks for
> images that are never used.
>
> Declare the booter only for chipsets that boot via it, matching how the
> FMC and FWSEC bootloader images are already gated on chipset
> capabilities.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

> +        // FSP-based chipsets (Hopper and later) boot the GSP via the FM=
C image
> +        // loaded by FSP. Older chipsets use the SEC2 booter instead.

NIT: This is slightly ambiguous, since despite technically being the same
generation, by architecture ID Ada numerically sits in between Hopper and
Blackwell, but does not use FSP.
