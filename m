Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795402538;
	b=tRGw1ovYxtogW2uZ0aD8v1WiSmUOuZp3eWBaNE04wN1FdYKc3EQqoctcQhQ1Mp7CZm/O
	 04uGB+jxKxhL0Ey1Afk4PGBXrUAZDQfw6trMkW3/+hn6BmyC3p+mCkWBrQRPIripTHGQY
	 y+6voNz22FyBz7M7PdQMMmlFObqrZotAE0DDkRKbmbYtCnP/9G/M7wVFSUe6imSQHfvS9
	 GlbdtHI0f0ceK0jhbL11sdoI7dp6mNECqFeZdbKHLgyffaERcICeEZZ/SIhpOOzMxT+jv
	 fcXWu/yYRqNR0tPy/tNMAkGta9lF29YaCxpDt2wOA/81dQjGhUzL1Iltbbli5mU2a2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795402538;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MkHpwsvOELaYT7+/y1zNuSUxwVP+fJwbBJeLBDDa+z0=;
	b=WvVa96+qAYnYSVaHyqaEdbOlLNhz029IeWBRucyrhIiwSh6g2rXF/pgeIaVX4M708552
	 wFUaTAAQL/b71BzCBVEYpBYW354eXyqSooCHkO6sgMizLQiL5VpR7cqdp7ujqccCA35xz
	 /qwEbsVXuQDg7vV0NCZQBX0Cco2KUNCyGBsOT27o8TVpf/BMaVZ0+qSXrnAM3DUiTa+lq
	 vu02W8Kb8DWYXEhPaPG1/CnKhAI0aNrGhyEdL4DXXFU6TdOifFM4uKzFa91899G8PjET8
	 YfFzUDksRp98ZFaSUrzsDbwjZnXv13ktMf5xr/RF9NFPwt92OqANPHeVfTKejvNJAtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laJsSoAm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982FE606A31A
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 02:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=laJsSoAm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93DB1F000C0;
	Mon, 23 Nov 2026 02:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795402537;
	bh=MkHpwsvOELaYT7+/y1zNuSUxwVP+fJwbBJeLBDDa+z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=laJsSoAmlCcmMURPBFFCGj3tFusQ6wpvH5qoW8JJ/ck6y+pbpXN8T8t06W2b8NTfx
	 hz/f0SEmuX67GIhtDj5XAdcA9EgdXe+1ZeZhdC3xyiJ/dstdkpE+JSnEZV77VHaVMM
	 J+NzJzRaY5aroftozjUvBO3bL2v0y+ODqR0T4oioGdvU3y3OIDpr1LZ4Q3/x2FwaJ3
	 tKYbsFob0VKkV0wXZ5O3Wxk26YWhGe0P4EhKeug2Nuns+Da6nvz6wAtKOk8IkWH58d
	 /PjuFEOwOpcdGDjlbt80M3eVXVLlnIPXtzsnDDDxEgNCR9Z07Nbn5eI8drLTe+xI7F
	 nDwvmQ1jXwFpw==
Message-ID: <sashiko-outbox-228572@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly
 requested
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Airlie" <airlied@redhat.com>, "Lyude Paul" <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 02:55:36 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] nova-core: missing Signed-off-by trailer in commit message
--

commit 5f7cc6c15454e28a85afc162fef5c8d7a26c0ba8
Author: Dave Airlie <airlied@redhat.com>

> nova-core: only bind to GPUs when explicitly requested
>
> nova-core currently binds to every NVIDIA GPU it supports
> (GSP-capable, Turing and later GPUs), competing with nouveau for the
> same devices.
>
> Add the NOVA_CORE_BIND_GSP Kconfig option (default n) and a bind_gsp
> module parameter, defaulting to the Kconfig value and able to override
> it in both directions. Unless one of them requests binding, probe()
> rejects the GPU with -ENODEV and leaves the device to other drivers,
> such as nouveau. The PCI driver still registers, so module autoloading
> via modalias keeps working when binding is disabled.
>
> As nova-core is work in progress, the default is to not bind at all.
> Developers can enable binding with CONFIG_NOVA_CORE_BIND_GSP=3Dy, or
> nova-core.bind_gsp=3D1 on the kernel command line, combined with
> nouveau.bind_gsp=3D0 (or CONFIG_DRM_NOUVEAU_BIND_GSP=3Dn) so that nouveau
> yields the GSP-capable GPUs.

[Severity: High]
The commit message is missing a Signed-off-by: trailer, which is required
under the Developer Certificate of Origin
(Documentation/process/submitting-patches.rst).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-nova-nouve=
au-gsp-v2-0-5e8c27aa8555@redhat.com?part=3D3
