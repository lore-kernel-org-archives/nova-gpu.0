Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521354;
	b=tY7Psahbc8IZh8v4/v9yVIB4BV2RyWJ34gQhz1deyzb76loBYHHgUX2niN2FOHhkJD+/
	 0yS/ulVGaUTJd6tOkm+3h9m8d7QpmFtCG9zSk0RTUHvPsh03AuJJVvn6MKMiPzjFc0OOs
	 2thVYAl2y5iYLYG7ZX9XJaOOgebY6AqRKVHF6nXVas5Iq4KQ4iX1Ef0Vt5uXoW2/2jiMo
	 kBU7/5RrODLuej95FvO22ws0JgyFnoerwnt/TvaMwwCPr4FuWSPCEeWl8N+6ESbPLjfp/
	 ibsOI56e786YZoIebNIOKD5dKCB0Q5wpIlNTuWKI8L1tI+kxptgTZr/6sLU3qPmGl3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521354;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To;
	bh=FCk4hJGWPUnhJXWJTDgKqX8nTAjZ6DEdTfpvOFD9mxw=;
	b=jQizUxfwYJG6VJTfVW4NWhAGKQavpXIr3Iw/sX+WATlswqGyuFK7KUt9iSFaNHvIgtYj
	 HKJy3VgYnAplhu/yuvyhFGm7NqsU6Pv+AYk34z3fdT/XqxysWCwf3+OoR/uHUEZni5l4z
	 wgx8k+1FcEn8bybRNc4akIPs3AANKjM65pLp2uGGYs8e+cUWsbTSNvVLrjsUKPId8JxAE
	 xHUTR8geqOLna1H2qRTmAoAnSuN08RDAlEzyk9eNn/DKwwTUkbsjiMvzxgF45uHZBGegu
	 65B7aVbdy7eIFxRhSu0cBk8VDBzAzFCPRopgC5ce+8OZZdiCAwnKSRpY0H3rzvHDYhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGWcwVqO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C88606A327
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AGWcwVqO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBB161F000C0;
	Tue, 24 Nov 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521353;
	bh=FCk4hJGWPUnhJXWJTDgKqX8nTAjZ6DEdTfpvOFD9mxw=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=AGWcwVqOwcJ6k3arIAzYlO9cpSUxeGk9cZPoWHw7uVO8GhDTUho/5pxLOX4Z+pSEm
	 oNnRJHGLiW52Y8pLS4JzH3xmeJ2hgT990g8+NnhslrZDLXkH/JemRE/zie3Y5DOriE
	 yCplNT4VpMlbCOgvGtrHkzuH563IEwGja23JKNhbIJx28Y1oqbvaVXvVOe2+EjJSGS
	 TYUpWSlpa90tBIPQLeD3dvXzEEObPyP+YhcZafpbdA7ZzmwOT4twe7DvCxYap0IEng
	 yn+5GohlXJPjek9mNpC1hSc0dE4VSIk2IHzXja+jJUeUEo40ucs0w/DhuW1YQTxuRL
	 6Yz6rWD4EuFNw==
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
Date: Tue, 24 Nov 2026 12:55:50 +0100
Message-Id: <DN3F7521O232.LXJ8JBRTSTPQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
Cc: "Dave Airlie via B4 Relay" <devnull+airlied.redhat.com@kernel.org>,
 <airlied@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>
To: "Dave Airlie" <airlied@gmail.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
 <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
 <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
 <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>
In-Reply-To: <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>

On Tue Nov 24, 2026 at 2:53 AM CET, Dave Airlie wrote:
> On Tue, 24 Nov 2026 at 02:54, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> On Mon Nov 23, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
>> > On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
>> >> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
>> >>        logs its failure and lets the probe continue.
>> >>
>> >>        If unsure, say N.
>> >> +
>> >> +config NOVA_CORE_BIND_GSP
>> >> +    bool "Make nova-core the default driver for GSP-capable GPUs"
>> >> +    depends on NOVA_CORE
>> >> +    default n
>> >> +    help
>> >> +      Make nova-core bind to all NVIDIA GPUs it supports by default.
>> >> +
>> >> +      By default nova-core does not bind to any GPU and leaves NVIDI=
A
>> >> +      GPUs to other drivers, such as nouveau. Say Y here, or boot wi=
th
>> >> +      nova-core.bind_gsp=3D1, to make nova-core claim NVIDIA GPUs
>> >> +      instead.
>> >> +
>> >> +      nova-core is work in progress and may not be functional, so th=
is
>> >> +      is intended for nova developers and testers only. When enabled=
,
>> >> +      nouveau must not bind to the same (GSP-capable) GPUs, i.e.
>> >> +      CONFIG_DRM_NOUVEAU_BIND_GSP=3DN or nouveau.bind_gsp=3D0 is req=
uired.
>> >> +      Otherwise both drivers compete for the same devices and
>> >> +      whichever is loaded first wins.
>> >
>> > I think this is a bit unsatisfying, for the Kconfig at least it would =
be nice to
>> > avoid the possibility of being able to configure
>> >
>> >       - NOVA_CORE_BIND_GSP=3Dy && DRM_NOUVEAU_BIND_GSP=3Dy
>> >
>> >       - NOVA_CORE_BIND_GSP=3Dn && DRM_NOUVEAU_BIND_GSP=3Dn
>> >
>> > since I wouldn't consider them valid combinations of Kconfig options.
>
> While I like the idea, expressing this sort of thing in Kconfig seems
> to never end well, I'd prefer to just keep them separate until we can
> figure out scenarios where it's screwed up.

Kconfig can be tricky in some (or actually many) cases, but this one seems
simple and correct to me.

Is there a specific concern?

> I'll think about it a bit more, but I'd rather not encode too much
> complexity here for fear of one or two people screwing it up and not
> reading dmesg.

Honestly, I think that the proposed approach is even simpler, because it
constrains the Kconfig to exactly the case we want it to exist for in the f=
irst
place.

In addition to the two odd cases I mentioned above, each driver exposes its
binding-default option even when the other driver isn't configured, althoug=
h
there is no choice between them.

Consequently, we also force that nova-core defaults to not binding even if =
it is
the only driver configured.

This is not the end of the world, but it's another inconvenience and also
becomes a bit odd once vGPU works.

I think the proposed option is sound; it is only available when both compet=
ing
drivers are configured (either m or y) and defaults to nouveau.
