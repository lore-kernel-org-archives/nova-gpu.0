Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB223F9F47;
	Thu,  9 Jul 2026 10:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592305; cv=none; b=OBsL956PTJZrrh4zSKlyYrEazWl0qVadqqy6m+QjV8y0T3vY6y9phiu0W1XWaSPYIFZ08J6FHDVzC+L8BdHjtkxVBwaooGWEJg84s+JiJA78kZHbHHWim/7fawWq0bMnVvYH0OkFOrpZh2ESE3ZPJrN22NYjh3dv2MrXPi7+k7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592305; c=relaxed/simple;
	bh=L2z8gKFHa+Fv9UVV5fYM72xMTGx6WMZf3MFZLqI2YPc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eGTxyohjMy/N/XN8b/4SzeK0q3jMDCSwA9zJlyxwMqQgTtq3rO6eBadc/VII3Bplnct4tFXUSIMTdvyQGkqVGWDmRCQJnkD9bIQNWhz7N74B/C4DCYOYeQ19DRW8OGYFLE730EYCGtVVE0pH6gS3vFm4OoBatFh+R8LWOTWJ4tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jct1N4Fa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jct1N4Fa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FD971F00A3A;
	Thu,  9 Jul 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783592303;
	bh=L2z8gKFHa+Fv9UVV5fYM72xMTGx6WMZf3MFZLqI2YPc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=jct1N4FaB/jZWmHDROlv2/VbK5FOPisO/l/4+y0lhT0fI0vIvLL1pDkepDzvv/yj/
	 Ohd1TDjfSKP10SBv8of+0bCVpbf45W81iyVQxl7Db9HXHDYMCMamSgMzwYKJ8h/vYG
	 veJBhSrFxHIp/A6u9vh3PMOSmbXfKwdNUKVXs6ns9JIxG8iEQIbmUuQkp3qKGQrv1O
	 J0668pkqH6uEtqUUsgayTOReFtSaMzioj6tcVt+BML+MkcI0wiSTevsWJnH3ukLHtp
	 R5ICFJVlKYObXZ2SZKE862j881IWL/kv9u7AGDk6rth2ZXynZ4YgWNaYBZC+k/kVka
	 UkjP68LpZ+PWw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 12:18:19 +0200
Message-Id: <DJTYPAM8RL0F.1LZHKFSTIURPF@kernel.org>
Subject: Re: [PATCH 3/4] drm: nova: Add GETPARAM parameter to read the GPU
 chipset
Cc: "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "gary@garyguo.net"
 <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260706053413.154135-1-apopple@nvidia.com>
 <20260706053413.154135-4-apopple@nvidia.com>
 <59948bff927bd4ad3af5fbe68d5d5e7565c5f729.camel@nvidia.com>
 <DJRP5QO5JKVT.Y7LCZARVCWJ8@kernel.org> <ak7lU9X4pTwx5NDB@nvdebian.thelocal>
 <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>
In-Reply-To: <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>

On Thu Jul 9, 2026 at 2:49 AM CEST, John Hubbard wrote:
> Unless all, or nearly all of the ioctl values would be the same,
> there is absolutely no value in trying to make a small subset
> match.

As mentioned in [1], it would also require layout compatibility between
structures and at least to some extend the same implementation semantics.

So, no, we're not going to do this.

It would probably be good to stick to some common tooling that exercises th=
e raw
uAPI though while we are still building things up and can't yet run "real" =
test
suites.

One option would be IGT, but I also created [2] back when I merged the init=
ial
nova-drm skeleton driver.

[1] https://lore.kernel.org/nova-gpu/DJRP5QO5JKVT.Y7LCZARVCWJ8@kernel.org/
[2] https://gitlab.freedesktop.org/dakr/drm-test
