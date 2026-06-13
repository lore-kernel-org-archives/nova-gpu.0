Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC088271450
	for <nova-gpu@lists.linux.dev>; Sat, 13 Jun 2026 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781360513; cv=none; b=PiwMoKoS8hDE4ZfkD3AoxVEJnEz0hS86FREGI2G8cQxnnQIm0JywR6uLU3pX/VI2Ml9rBEL9K8+Xjbc2NCYmc6u2wiMt9/hz9JK5LCRHfASJrP31O6bQBtqxAfVKVYmt3lor7SsKpt5qM4wx0bLok3OrQZavgfYWVDNjpiXOWyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781360513; c=relaxed/simple;
	bh=DP6136tpInxfyXOA0XMtY5nxVvqgeaJQqi3CpwYLOCU=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pXiZqsE5/B70gnLTv4b7W17NF4hQKe+FFltm9hDosqCSHjt+ZbyHV8yUr20bqkBdscRn0CzPTR25NtqvuITSPFn8IUh1f/EEfWShyQtclKsygWqYoCQseNuczHBEo+ml2fdeW52qw2DrclI+vJTyY5pUBXceeBc5aFu0IsqFEkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com; spf=pass smtp.mailfrom=nanonej.com; dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b=MmFblsd8; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nanonej.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nanonej.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nanonej.com header.i=@nanonej.com header.b="MmFblsd8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nanonej.com;
	s=protonmail2; t=1781360492; x=1781619692;
	bh=RBgYG+/wnG88Qki6yof2ao7k/abeZH3EX/1zB6gLt1w=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MmFblsd8Fhq4cvA1F2FFrqULM+iffMGVAXLuNFPduYHNALRk5AExzYKvKrmFjj5P6
	 tldKEYac8Ziw+87G1mg92K8O62hiVzjOZMet3tD3NgjM40aw2Xv04JIaKAf+jYVhjL
	 rVirarYwfIwCHPxi1DOrXtAyXnSRPbla+IROBIuGATVvAzCIpT1Bu7oj1ZMyIwg/Y6
	 k18xLZJ/IQ1Q6qeF4aXh4EyLal9C+65xBBRUmUK1a76+vif5NXWOwOVtsQxBHRP9Fi
	 KdLfxw+yosltTqh/MdH1UHPukBCXXhehR2Giapxh2VWBWR87tHXsrwzRCWx41a9lo1
	 oE3HX5WcpYVCg==
Date: Sat, 13 Jun 2026 14:21:27 +0000
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>
From: Nanonej Dev <dev@nanonej.com>
Subject: Re: [PATCH v2] gpu: nova-core: gsp: Move gsp register definition into gsp module
Message-ID: <JhjbPqUuPM-wFYwy6aUe3Qk7-iA1bBxSt3MbEz-XBXjsuLYoTmYib9WIgAxy9J5WtK6GRjPU40mv-W-gSzEuEdeXDMr2yc8UFJyq-hEifqQ=@nanonej.com>
In-Reply-To: <vvjHdIL6_yt_mjEDbQzZ5naOIbjsntZJ6xoeR495GAgkIFE5m2UJyexmYhPCH9e7Nafptn9rgYNLHZhYPiX4G6l4X75A1MVlg4UzCpjUwLY=@nanonej.com>
References: <20260607140949.152575-1-dev@nanonej.com> <DJ5EN9YOZOVF.RZ2WJGSB0L6G@nvidia.com> <9B2MG9ICH2MOGGwTsi0aCGBlEyEO3p-VTk7iR0wgDgBkAYKEu9GC2mc7eAODT5nilASpnSaPdZZjliM9HcvEY96LscSKHF2iDXDXCESptAA=@nanonej.com> <DJ5U53UC0NV3.3L6GGS2OJ64Q4@nvidia.com> <vvjHdIL6_yt_mjEDbQzZ5naOIbjsntZJ6xoeR495GAgkIFE5m2UJyexmYhPCH9e7Nafptn9rgYNLHZhYPiX4G6l4X75A1MVlg4UzCpjUwLY=@nanonej.com>
Feedback-ID: 32181229:user:proton
X-Pm-Message-ID: b5c3ea6a76a01264ebacb4a54b8039a7981778a5
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha512; boundary="------e458f56171b88a77dbf837a54da80829707ab34efc751019b917beaa10e68645"; charset=utf-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------e458f56171b88a77dbf837a54da80829707ab34efc751019b917beaa10e68645
Content-Type: multipart/mixed;boundary=---------------------56a15ea02298f24b6afb3d610f59601f

-----------------------56a15ea02298f24b6afb3d610f59601f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hey!

Just a quick heads up, to tell you that I spend some more time looking to =
fix this mangled patch issue and, indeed, B4's web endpoint seems to be th=
e best solution if I want to keep using Proton mail for communication.

So thanks a lot for taking time looking for it and suggesting it to solve =
my issue, I'll try it on my next patch.

Take care,

Antonin Malzieu Ridolfi.



On Thursday, June 11th, 2026 at 17:00, Nanonej Dev <dev@nanonej.com> wrote=
:

> > Don't worry, you did nothing wrong.
> >
> > This is just the (rudimentary) process by which we state that we have
> > processed a patch in some way: just reply with the tags carrying our
> > name/email that we want to stick to the patch [1].
> =


> Oh! I must have forgot this part then, my bad, thanks for the info.
> =


> > Normally `git send-email` or `b4` should do the right thing, but after=
 a
> > quick search there seems to be recurring server-side mangling issues
> > with Protonmail, so you might need to use another service to send
> > patches. B4's web endpoint might be an option [3].
> >
> > [3] https://b4.docs.kernel.org/en/latest/contributor/send.html
> =


> Oh, thanks! I didn't know about b4 service. I'm gonna check that then!
> =


> On Thursday, June 11th, 2026 at 03:40, Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
> =


> > On Wed Jun 10, 2026 at 11:57 PM JST, Nanonej Dev wrote:
> > > Oh! Didn't think to add this extra tag since your review, sorry!
> > >
> > > Can we add it now? Should I do a V3 to add it? Or not that much of a=
 big deal this time, but should think about it for the next time?
> >
> > Don't worry, you did nothing wrong.
> >
> > This is just the (rudimentary) process by which we state that we have
> > processed a patch in some way: just reply with the tags carrying our
> > name/email that we want to stick to the patch [1]. In this case, I've
> > reviewed it, so I signaled that by giving my `Reviewed-by`.
> >
> > Since I hadn't given it by the time you sent this patch, there was no
> > way for you to add it.
> >
> > The common practice is to collect the tags you received on vN and carr=
y
> > them onto vN+1 (unless the patch has significantly changed), but in th=
is
> > case this wasn't necessary since Danilo applied the patch and added th=
e
> > tags [2].
> >
> > All this to say that this was a perfectly normal kernel patch review a=
nd
> > there was nothing more for you to do.
> >
> > [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.=
html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> > [2] https://gitlab.freedesktop.org/drm/rust/kernel/-/commit/3e4bac7b8c=
a7688fb3aa9c0bf005a5a4256ad578
> >
> > >
> > > Anyway let me know and thanks for the feedback!
> > >
> > > Also, I check for Proton Mail, as I understand they don't support `f=
ormat=3Dflowed` so except using there "uservoice" service to ask them to i=
mplement  it, I had probably nothing else to do. But I found a git-protonm=
ail service dedicated to use proton mail with git send-email, so maybe it =
will work? I have to try as I don't know the email protocol well enough to=
 understand on which layer the patch get mangled and if this tool can prox=
y around the Proton implementation.
> >
> > Normally `git send-email` or `b4` should do the right thing, but after=
 a
> > quick search there seems to be recurring server-side mangling issues
> > with Protonmail, so you might need to use another service to send
> > patches. B4's web endpoint might be an option [3].
> >
> > [3] https://b4.docs.kernel.org/en/latest/contributor/send.html
> >
-----------------------56a15ea02298f24b6afb3d610f59601f--

--------e458f56171b88a77dbf837a54da80829707ab34efc751019b917beaa10e68645
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmotZ08JEFKmzSsu6sDwRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmdz039PfqCAQScVZ0Oc9Apytjx4ThQUkd+Od55K
K7HB3RYhBI+99gDJjAW7MoHJ0VKmzSsu6sDwAABZXgD+Jf/+RjnNxTKd0mLh
MZlrKqiIhtFPkIDh6Iw7d83lWMkA/jvNpl3ffR/1F891Svny3Up+ESKCSaSX
TWGCmBFm33YJ
=3c5V
-----END PGP SIGNATURE-----


--------e458f56171b88a77dbf837a54da80829707ab34efc751019b917beaa10e68645--

