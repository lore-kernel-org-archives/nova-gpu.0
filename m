Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664526;
	b=fQQzOf5BQ2CXgyhvGJG6hdrMBZWq4cBO7SLvPLDPDzfDcqDnbUb8K9PYo8TCKSpiOCzs
	 oMBS/mRCq2LM2lnnVBgp6gCrNr+VtR1vQwTTxAoeVCTJUGYcXn2rPh0uN1chUhVovI1V7
	 KvX+A/G9TKV3wKKTRIItsOLdJCjXmyzYELw6jGOQrRb8pPPtVdHLtl54YgqTxZAePGppE
	 GqQJE9tu2PPkoQ7FvVXOh0Ab3PPFWwtmnynYyXoyT1KfntMAAl6kXga1Zr+haqGHG/dgt
	 +3bLak48Hu+2J0fzRYW6Wy6Iu7U/YIRsuNQMz6WRwtJxJB/DNO1+LKnTOV9zI9UbvOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664526;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DaDJ6RWHOYbjgUyhmQflBc5uQryAuOIwPKCMBQL+K8U=;
	b=R8646/49tK9k33pgM/fDBvPBPlUdzKrYIg9InN8dwJmDfeb5GWn5AXva3glTT3n+nbJV
	 +/n/7YfKC/7vb397dqI5twlnfy9wnfPZUJXoAGIjEaVt917qT59Pbw64RpZA0k7G900qm
	 R/jwCOag3UkA+y9Bot96kKoNjQT9+6eDjbAj3dVNHfK3JtxxHH+ibLRpuWR2Jlb1urTRm
	 oF0BduZ1cy0rywCtRkEgkDQ2yfHnWLp7cUow3r7Un7MDtWWqTekLhpmVY+lDBOFwe9a87
	 Zt3qc//KDP3GYvnFXXAB5gGOc798sCIWFC1e16GoqTSDSMUuyhMGD2w/jWTcYUA8Xzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d/LH/VLJ";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4FA606A324
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d/LH/VLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AB41F000C1;
	Tue,  3 Nov 2026 00:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793664525;
	bh=DaDJ6RWHOYbjgUyhmQflBc5uQryAuOIwPKCMBQL+K8U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/LH/VLJcN1xcX0Kr+5J5Z7JzJP8gYh1nlxUvCJlJqnPIcGTJueLyiza+JYlMhLuV
	 cqTsGfWsknhre+oKevaEdBzd5Ro68IIQgIELQG0Ct/YTCaqsSh6GJkqUw1Df/QNGzr
	 O2KtuGRSom+sDBcgwF9+IrXixDF7QMW5BOAuKCSHvwmAU07IQAXmyld5yoAZFo8wG7
	 voXBQHVq4KbmnSTsZXErto/yQP9K134gUkx9nXlJYDI3OPpDc7eHUQGPcBdctvxHQy
	 23U6vQe1Q8gIya3cHg60ZtQzRW4URpVIP6KPYBit3xM4cEVhlBaZ9i6fJt8gYhlABe
	 De/Cp50ZlY/jg==
Message-ID: <sashiko-outbox-194361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: cmdq: add the GMC send path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi
 Wang" <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, ojeda@kernel.org
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-3-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-3-189f9ff3bfd2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 00:08:44 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] gpu: nova-core: return type mismatch in CmdqInner::send_gmc_command=
()
--

commit 1e1d150084c3f6fc3d6e13ffe004caffa1b2a4a0
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: gsp: cmdq: add the GMC send path

This commit adds the gmc submodule to the GSP command queue in nova-core to
support sending GPU Management Controller (GMC) API commands such as GSP_IN=
IT.

> diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-cor=
e/gsp/cmdq/gmc.rs
> new file mode 100644
> index 0000000000000..b035f30479a84
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
> @@ -0,0 +1,194 @@
[ ... ]
> +impl CmdqInner<'_> {
> +    /// Sends `command` to the GSP, and returns the sequence number of i=
ts element.
> +    ///
> +    /// Unlike RPC commands, GMC commands are never split: a command tha=
t does not fit in a single
> +    /// element is an error.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `EMSGSIZE` if the command does not fit in a single command que=
ue element.
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
> +    /// - `EIO` if the variable payload requested by the command has not=
 been entirely
> +    ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> +    ///
> +    /// Error codes returned by the command initializer are propagated a=
s-is.
> +    fn send_gmc_command<C>(&mut self, command: C) -> Result<u32>
> +    where
> +        C: CommandToGsp,
> +        Error: From<C::InitError>,
> +    {
> +        self.send_command_element(GmcCommandElement(command))
> +    }
> +}

[Severity: Low]
Does this compile when CONFIG_DRM_NOVA is enabled?

In drivers/gpu/nova-core/gsp/cmdq/gmc.rs, CmdqInner::send_gmc_command() is
declared with a return type of Result<u32> and directly returns the result =
of
self.send_command_element().

However, in drivers/gpu/nova-core/gsp/cmdq.rs, CmdqInner::send_command_elem=
ent()
returns Result (i.e. Result<(), Error>):

    fn send_command_element<E: CommandElement>(&mut self, command: E) -> Re=
sult {
        ...
        Ok(())
    }

Wouldn't this fail to build with a mismatched types error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-r000_rebas=
e_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com?part=3D3
