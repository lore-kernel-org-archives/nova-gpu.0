Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015519;
	b=d4/FC0Cn3H0b+i/4ZU9OHzNBTG/BkFXvzn8Ta+uIyzOUyLDHEuUwLYvlZNCqxJFylBJa
	 jl77nZPZKorZVb0jv7JTeX+FnBkbz3bMKWzp6PNl0pbXZ4aOgXwxQZmNzLQj6bYxImWf9
	 ED2Yr0LYxfR0z36Blzc5cVQ3XqFYM9GKI59xiXUCEy982qyl42CCYf7LEaRgi7nHkksey
	 8m/4RMGQpc7SMux7KkukArDRwRI1xtcMdHY0fFz5DdyC/sxg8Nayt/QtFdMSlUV7quZsq
	 vHhDye6Ldv+AxgVadQVvVB541cr4Dnzyf/q8GSl8zJUNfj1SdY2uSNjTv6AyUA9U3BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015519;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=3DKMi402lRON4IQ5GMfyj9glYZKcgZcGdIr3Q4HZEFQ=;
	b=za43QYQGSd7PembvMkeN23uisKN9cLXsoPuDeMo612OuU5QzQd3J9pqDap37pA71XK7L
	 e5dUNe6tqkiVProPCLtZ3s80wcILsuwTp/I9MzjEssSyew0gjbJN/y4HauOgjaGT3KsJP
	 FwgS8ZzT4vGeCK1oS0EktQZqPmnPcc7pzwtQf32G5a/MMrRDkaV6nZaeGJqM2a1jrRo4T
	 GF2LeAW3nSErxH12KiHEr3IKWHwpyAQL9XaOibZP0FAaHKn3P9g97uWhD6NL8DwfpBYOy
	 ncD49a1+pwOrsL8F7lMTXUu33VJSb2FRpDe8bgzozPVq7WAd2RZrV2DcXwxImYicy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrABO07D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9095E606A326;
	Sat,  7 Nov 2026 01:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrABO07D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C4551F0089F;
	Sat,  7 Nov 2026 01:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794015519;
	bh=3DKMi402lRON4IQ5GMfyj9glYZKcgZcGdIr3Q4HZEFQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=QrABO07D0LJYx0EiYqliUdb+bqI5sTgUqIBG6/ohJuuivw3TljzNJLZDpcAsHulqa
	 904MmwN/RdyNAmjqh1miY30nhJ8QWHQUZrEzCvrXvUQ4COLjoufHbRRVzHoFrVdrNf
	 d+6CXe6KhQ6UeieWC15SDZW3tDRNys3tRC+x5IX0X9xpX48dW9Uqxdxe2k3uyS2P5y
	 UG6bhcl0/JzUjIShGridEwNgK7nToCtzW1Ipn2J/qpxaTgOFeYbrz0fjZe18umgiRs
	 c7Abkx7ZptiC8VTjxOd7LY8odOIiRLmsVD/Z+v+KeSDa7AG/RwFZ9/YRmbDFSCWN7+
	 ETMd6b4nEg80w==
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
Date: Sat, 07 Nov 2026 02:38:35 +0100
Message-Id: <DMOLFAB4UNSV.1A99UVEZAI527@kernel.org>
Subject: Re: [PATCH v6 0/3] gpu: nova-core: retain the GSP-RM log buffers
Cc: "Vladislav Zaharov" <vladazaharova2018@gmail.com>,
 <acourbot@nvidia.com>, <aliceryhl@google.com>, <ttabi@nvidia.com>,
 <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
 <ce4c6b64-98ff-4b50-8454-9cdb5aa6970e@nvidia.com>
In-Reply-To: <ce4c6b64-98ff-4b50-8454-9cdb5aa6970e@nvidia.com>

On Sat Nov 7, 2026 at 1:39 AM CET, John Hubbard wrote:
> Specifically, (as you mention above), I had to add "retained/" to the
> directory path in order to retrieve the logs. That is awkward, because
> that means that if I ask for gsp_keep_logs=3D1, now I have to know/rememb=
er
> that they are in:
>
>     /sys/kernel/debug/nova-core/retained/<BDF>/
>
> instead of:
>
>     /sys/kernel/debug/nova-core/<BDF>
>
> We should try hard to avoid such complications, especially given that
> debugging is often done when one has a thousand other complicated things
> going on at the same time, late at night, too.

It doesn't bother me too much, but I think the concern is fair.

The retained directory keeps a clear separation between live buffers and
retained buffers, but I don't think that's a strong reason to keep it.

In nouveau we don't have that separation either, but nouveau also keeps the
retained buffers until module unload. I.e. after the first retention nouvea=
u
never exposes new buffers (including the live ones) unless you reload the
module. This works, but can be rather unexpected when e.g. doing multiple
rebinds via sysfs.

Rebinding via sysfs can be especially useful in multi-GPU setups, where you
don't want to unbind all GPUs by unloading the module.

So, getting rid of retained/ is fine, but let's not follow what nouveau doe=
s.
Instead, let's make the same files point to the live buffers when the devic=
e is
bound and otherwise let them point at the retained buffers.

Thanks,
Danilo
