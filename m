Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE83876BB
	for <nova-gpu@lists.linux.dev>; Mon, 24 Aug 2026 09:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563411; cv=none; b=h/lijd9TLQ9BiTTjrgm1PrlAol0flgosPMDWYDZIrS5PPEoh6NKye5y+KqRXQJ6IsyFAdDjXjPNSwmJDDjbD+43MLyAZlZ6sPCHTPNUEIIzq0w6HKDXJf53FfGcfzr+TvA6UkdwQfPKU2vR86aqeYWIhjN9teVcYH5fIh2iuHok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563411; c=relaxed/simple;
	bh=aIxOhyasMyJllL3AG6v/HkWpftKfp78A51bnxLcD4ow=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SB6QGYt2Gx2iuYd/DG6N4jYiPN/FVtu0Xa3wR+ygtu6clkMt0rlYqUbSwFYMKU8E8IlTXRzoQcgwStLsSvwfJ6BUD741gS7eFfnw8+XvkMcoYCzRHjAKCGpOI3R8vEUXgsGUTnUgg+Uej05+4i35Cm+3p/UPtaLikn+Rg81WAI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=jZyJIX0k; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="jZyJIX0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1787563395; x=1787822595;
	bh=ms0jtqoPS0qWJLbFtv256SN8hGHM1pUEZO74N6luSSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=jZyJIX0kywQd/58F/OsweLbxsBBFCDOZ0v0p4kw+mAFsjJWMIgqn3bXdzRvMvnO4X
	 xRonx+4SVwFcRYIzvqV6zPsn0TlVpXujxad3sRNJAVOLGZbUFzGXDH46yKVqrjRPMQ
	 v2m/JrIjm6P6EDw97yHa+qSVI4G7I9FaytmaBsRdAIZ6Z4cQsdOrrNV+oOx7jo23t0
	 eQatXC+yoBjf8gGQSrByt4YieZzhb/Lprh/hfJRporIyGFeiAtTkAZBOtBbW+nTKPK
	 FvvnDyGyv562FVIc3COBg6DagGtqqQuw2v+IvbEtJ7y65iksVxmr6bAWZFL/6ts93x
	 CIY67KDamlSdA==
Date: Mon, 24 Aug 2026 09:23:12 +0000
To: Alexandre Courbot <acourbot@nvidia.com>
From: Nanonej Dev <dev@nanonej.com>
Cc: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: nova-core: Extract FUSE registers definitions
Message-ID: <1COg2hERAjDijZlXX0uknmkpjlWBxyXWaxdvBX2tGZgcaYyhUhe25d5WGeosMVh_Tri5YELYViaNEl0PHR_Z01L6IdvfuZdjRZtc2TQj_Kw=@nanonej.com>
In-Reply-To: <DKWTK2FWW5PT.13WXH8LCISUT7@nvidia.com>
References: <20260817-b4-extract-fuse-registers-to-gpu-mod-v1-1-c4924070bbb0@nanonej.com> <DKWTK2FWW5PT.13WXH8LCISUT7@nvidia.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: 6aa8216fe8d7682b1106a6f3af132c077db2435d
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------74c6c43c0c6d611282eb93c4dfadbeeb478350efd09117ead1ddc4c0b3aa0d02"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------74c6c43c0c6d611282eb93c4dfadbeeb478350efd09117ead1ddc4c0b3aa0d02
Content-Type: multipart/mixed;boundary=---------------------9ee4043ec7588ec9708601c8425f6c1b

-----------------------9ee4043ec7588ec9708601c8425f6c1b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

On Monday, August 24th, 2026 at 04:30, Alexandre Courbot <acourbot@nvidia.=
com> wrote:
> I am also a bit hesitant to apply this patch as-is. As defined, it only
> adds an indirection through the `gpu` module for FUSE registers that are
> only accessed by `falcon` (actually, the `ga102` HAL of `falcon`).
> =


> `fuse_ucode_version` does some falcon-specific processing (notably with
> the engine ID mask), so it looks out-of-place in `gpu.rs`.
> =


> Also, the patch doesn't move all the FUSE registers -
> NV_FUSE_STATUS_OPT_DISPLAY is still in the root's `regs.rs`. That's
> probably because the destination chosen by this patch is not a good fit
> to contain them all.
> =


> Now I am not quite sure there is a single, good destination for all
> these registers. We could move these to `falcon` (and
> NV_FUSE_STATUS_OPT_DISPLAY to `fb`), but this just happens to match what
> we are doing right now and if another module needs to use them we carry
> the risk that it will redefine them locally. Or we could have a
> dedicated `fuse` module only to carry these registers, and some
> functions to provide the services needed by other modules, including a
> HAL to read the correct NV_FUSE_STATUS_OPT_DISPLAY register depending on
> architecture. But that looks a bit overkill so I'd suggest wait-and-see
> for now. :)

Ok I see, I actually spent the last few days trying to understand better w=
hat the different parts of the project code was doing and what part of the=
 NVIDIA GPUs it was interacting with.a
And indeed FUSE, as I understand, doesn't seems to belong tightly to FALCO=
N neither with the future micro-architectures relying more on GSP.

No problem, I learned things and it forced me to finally try to deep-dive =
more on the driver.

> There is also a more insidious issue below.
> =


> <...>
> > @@ -419,3 +424,27 @@ pub(crate) fn new(
> >  pub(crate) fn boot_0_raw(bar: Bar0<'_>) -> u32 {
> >      bar.read(regs::NV_PMC_BOOT_0).into_raw()
> >  }
> > +
> > +/// Returns the fuse version matching `engine_id_mask`,
> > +/// at the given `ucode_idx`.
> > +/// Returns `None` if no engine matches `engine_id_mask`.
> > +pub(crate) fn fuse_ucode_version(
> > +    bar: Bar0<'_>,
> > +    engine_id_mask: u16,
> > +    ucode_idx: usize,
> > +) -> Option<u16> {
> > +    let version =3D if engine_id_mask & 0x0001 !=3D 0 {
> > +        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_=
idx))
> > +            .data()
> > +    } else if engine_id_mask & 0x0004 !=3D 0 {
> > +        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode=
_idx))
> > +            .data()
> > +    } else if engine_id_mask & 0x0400 !=3D 0 {
> > +        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_i=
dx))
> > +            .data()
> > +    } else {
> > +        return None;
> > +    };
> > +
> > +    Some(version)
> > +}
> =


> This is moot due to the comments above, but this function should be
> `#[inline(always)]`. The reason is that it uses `at`, which performs a
> `build_assert!` using `ucode_idx`. If this function is not inlined into
> its caller, then the range properties asserted by
> `signature_reg_fuse_version_ga102` won't be visible to the compiler and
> the `build_assert!` will fail.

Ok! I didn't realize that and it make perfect sense now that you point it =
out!
But I'm surprised: How come it's compiling on my side then?! :O
-----------------------9ee4043ec7588ec9708601c8425f6c1b--

--------74c6c43c0c6d611282eb93c4dfadbeeb478350efd09117ead1ddc4c0b3aa0d02
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmqMDWgJEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdXQDZZA9iDn2Yr0h5iJV5ahk5KrzdbBwGGWUYx
gvgNZhYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAADgPQEA7PBA+WabNtXtQTSa
9BtqZKaAqcVmu0H6xdqsGSFgi/IBANm+ch2CB8s728PGsaujO4gPZUrqzx0F
HW/qOzDA4WYA
=d9o1
-----END PGP SIGNATURE-----


--------74c6c43c0c6d611282eb93c4dfadbeeb478350efd09117ead1ddc4c0b3aa0d02--

