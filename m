Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041449;
	b=U6ECd4bWdGTCLzqD+lagr2RNiXY4kQXNWODnBS9dPVf/0QUVWuZkNpWEE2rUCAdqzTrI
	 gk0VwVbYpe9IjPYVwopVIjc0UxWVjua49Mh8hHJ78thn6oFR5C4AnNBuJkpr8zE5m2ucj
	 EDTnMJIkKMukiwUEyzJ8pMJOnyN/h1qiLTaY6sS9LWiBj9qpQzoAuXievwglFslspspD4
	 bxIAmqAnXBlM2ZIAB+TyREIEL/lAuWzoAi01LCOxAw5HD++6gzlCZrOHAjba95spIa4j1
	 Y3sOwZMU7rNstyErWYqcgp+h6mzXhoMHOlNc+ZQvJ/ZkNJ2VHpVz0M0WXQs4sh55Nbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041449;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=aAMhYy95KiZEANw8I/vyYkSPedoOGINZxgF0cpycPaE=;
	b=hAZIg1nF1Afynnqm2Cb5ROuo6L9Svbc/4FNnHb20UA9asGYdd7k8paPKxLYS8oQmdAwE
	 r4ORgd47GSWkEaqnSaLU1y04L6viUM35+2utKvk0Rpxzh10+tN7lanPq3iuDg0Cf9cRW8
	 ydnIy9grT4FOlY1R50Kt1b63C2Q7EN8qVNiSVGzuDlOUjf64juZ1PmolL6UDJZCXWgxAt
	 1zass/s+mKCqzPu+A1OACnJD67yOddwqTDOMXNcKUAipcRlShLer1i2yz7FnWIMxlmxnd
	 9mVP9DvWqxRyo7RGlAcGBodm+oFgF75HdOvpHFOm2mXzSNi/TiWNYDxbb3/D3ZiDi3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="kz+/O3tC";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ABE606A31A;
	Mon, 26 Oct 2026 19:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kz+/O3tC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180E21F01825;
	Mon, 26 Oct 2026 19:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041449;
	bh=aAMhYy95KiZEANw8I/vyYkSPedoOGINZxgF0cpycPaE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=kz+/O3tCgZSgnTow86cSK/D+FGbQC/aJCuVNaH1PbAonteDYHp+7k7OJtDcdAToCI
	 hDJlWyYz8zDCkau7jrePhhi98RmvYnkUsXvprQQ9nc4w3Lo29Y46RNeEqoVJGpkDQA
	 EA9pimByKp8XDGyrU0Thf53AZ0LH0qKWdcabs3wTNouUwvLtx2CJFlBNRx4CY0Tqsb
	 2z+TJXGaDNFNGPgVB/8WWXewV2L1jeeveJubmx3ZZTjuVWat0Iept94va/UjL4SB2l
	 xDT3n2iY2Blp5bndWkMoToJh/s8A97VfJ7lOK13IFOjIAA+ttG86IY2a7XJjM3w3dy
	 8Devz5fHzOYEQ==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 20:04:05 +0100
Message-Id: <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
Cc: <airlied@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Lyude Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>, "Alexandre
 Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>
To: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
In-Reply-To: <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>

On Mon Oct 26, 2026 at 3:56 AM CET, Dave Airlie via B4 Relay wrote:
> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> the cpu ns into some hw/fw, so allow this method for rust drivers.

It's kinda implicit, but I'd rather justify the change through how the HW t=
imer
within some NVIDIA GPUs works.

There's also other HW that works similarly (e.g. a bunch of net devices), w=
hich
share a common abstraction through struct cyclecounter / struct timecounter=
.

Having similar Rust infrastructure seems reasonable for use-cases as the no=
va
one.
