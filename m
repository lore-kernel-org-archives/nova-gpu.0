Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943080;
	b=w3YZB0GhAHVKcJSmzp3aCf3aUMWB0KEEDzTB9aOBaALpLym9g3PIGVLbbDxmLfIBIx+m
	 Vbr4yFnADZvdvw/kTj9LyHzAtlCPbcx1C1XEBmdNjma6jMrRiAUojANiEX0buqU0DJvdg
	 /LXDvUG6mtarIv3mNuoxosh5uv9DCkCGreDY/x2RZXtkdhRCr3bjRcFWceVKDOFi7o3B/
	 snRhWFDpUxyYQ3N/VRvh+2prrVFfAsC2BhYTODczf1TaaoBAuK9D1Pq8fhBmubB3uf/94
	 42fjixZfeGwrFhtBZWkvh5dl46Du4k+fm5ODdrWSf0AOoZeqS5yPdMiSck+fY83nf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943080;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=ETCF0+HmnthE7J+xY9bu/qhg07qsCOC241t1Ub+aMNg=;
	b=hkfWRInuuXc+HLii/pIDYqJaZqk4cErlX5PJL/JoCIDN70IbALpMmYUXIGzZ3eXndGQ1
	 EfI4JbQywxx+CbxBqkYevTTYDb8wqKRzhQh26OhjBkKKDtD2jdQR0pZvrd8dgx7zYcDmT
	 KtxfNiKti2cCl0BYbFJfn0MBslq7v/pslDIAOy6PbJF42nnolCZ6Q5yxhQxMDIAK8yzTU
	 021Zaf7y008XJeHuaf255TowHuJ9w3IjzbZW/w2c/aTHgM9DGd7mpO/vvnJwlA0+OFOoR
	 H7Om0goHQweDr4jKEXIgnTfgHuLMvutoxRXs68ufcbYeqsYSZA052UNZWTenSLbzSTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F12dJUjT;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A94606A33B
	for <nova-gpu@lists.linux.dev>; Fri,  6 Nov 2026 05:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A94606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F12dJUjT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793943078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ETCF0+HmnthE7J+xY9bu/qhg07qsCOC241t1Ub+aMNg=;
	b=F12dJUjTjf4IzkowJaDvMYYMs6DximIADGK8AF08rW33GTVc17tQP3K+vEgUY5kJWWfFr9
	t60xWZ4Ra7AlvcRm/6FwClgJSWMByUTNkOZb9AKIMEJvnsfPhOB2wob6sF3PuFftDbfhI/
	+QpVV6gpB/Tw6PhkkQRdhAxcd1w7k1o=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226-YikwA9-8OJasX9xGJhe1_w-1; Fri, 06 Nov 2026 00:31:17 -0500
X-MC-Unique: YikwA9-8OJasX9xGJhe1_w-1
X-Mimecast-MFC-AGG-ID: YikwA9-8OJasX9xGJhe1_w_1793943076
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b238436265so285762c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 05 Nov 2026 21:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793943076; x=1794547876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETCF0+HmnthE7J+xY9bu/qhg07qsCOC241t1Ub+aMNg=;
        b=NYwFmT5XM/kGbt5hgpd18CzwezAl7F/Eltb42vVNLlUGLelIsAzm/WkcDZ4ay25aF7
         7qbol1qiRZuxeYwj+90ZdWx1wF95mexmAa88EvtEzbgt6G01MtMlgVaSuaI9AEOZYZ8A
         9i+wS6o5TvJCgUl80liAdw677RMbxHDmxCNPs3ovILHzC+J667P0t3DhBwJC6dNNIAD3
         ilcSiYwOZ+f737S2t/R5SM7d7LvTU5B47k2TxtMbG3vpW35/MuLiP3CoGwTH4JviVYWe
         QUfzJRnGC4Vm+OZamvYRGd9a8ao4l7ENOIkMar4xtTQAOX5vWIEGH0Zrx7xvUhqIgffy
         9HwA==
X-Forwarded-Encrypted: i=1; AKwUvByy3n8U79RlQeLeHqF0dxUyHpJ2dXPvTY3BTLWxK8qdulH+JRvPg1rFGmuAc2nXdYD7XOyzAOVTjg==@lists.linux.dev
X-Gm-Message-State: APuU4Z++yS67VquP10T3KpFbeehSaESop56WpCZKZ378lQZ07LRCf5+3
	h5h6VTzzDCZ8IN5KKfQPohn2o7QrVj1gH7FMdsQcME3mFPQ5p79XMxkF06CpvXPjHWBGIfhxbbx
	uATle0o+LS1YUd7MIGSa3dS/xNNbpZ1J/5L61Viae4nUvIUdUBwPjvyyCBiYfyYweyMmujK3qAI
	3XfGgvl35xuTkMxYUj1t9P6ePEIudKiPcP9qM=
X-Gm-Gg: AYBFou1IFZG5pB9Z1t56JxmKRmjfPj2+eKV1tDrkXntOWfMJa7nLQUFrgo8OtthBHDZ
	IiBlXT0QUVCsfJTSB+3SgqmtbzdUgmbF4ARnkBaAvpiq42k4sKB0b67Ii4Q8jrz4LvH8GxQ39I7
	qoW7g995DTNDslfEdIRHqSMKeLuXQH7duilfw4P5K8+5U85+KxPXZdQOU2byF/N/r3IXG9nNNIS
	0GOLB5AyBWmNVZr
X-Received: by 2002:a05:7022:7f06:b0:1b2:39fd:3252 with SMTP id a92af1059eb24-1b25d334f98mr1947920c88.19.1793943075668;
        Thu, 05 Nov 2026 21:31:15 -0800 (PST)
X-Received: by 2002:a05:7022:7f06:b0:1b2:39fd:3252 with SMTP id
 a92af1059eb24-1b25d334f98mr1947867c88.19.1793943074925; Thu, 05 Nov 2026
 21:31:14 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-nova-timer-v4-0-45a7c121d4de@redhat.com>
 <20261105-nova-timer-v4-2-45a7c121d4de@redhat.com> <DMNCVDFYPL3I.3CCYXY4641F13@nvidia.com>
In-Reply-To: <DMNCVDFYPL3I.3CCYXY4641F13@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Fri, 6 Nov 2026 15:31:02 +1000
X-Gm-Features: AclHuK-DTWKg6aYOUpY0pREYQ38U7SrWdoYt0n6El0ClXUXgo4yA4tGhZW8hdlI
Message-ID: <CAMwc25rODe5F7MdhWEr80q+eOitKqg-O0LQhEWOMSVWZodfyMg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: add support for GPU timer block. (v4)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RR7dGIbjSykndsZLKz2Ww3xE3MvfsiJaI2rAxvGwdT0_1793943076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:43=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Thu Nov 5, 2026 at 12:07 PM JST, Dave Airlie via B4 Relay wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This is needed to calculate the system timer offset that is passed
> > to GSP init.
> >
> > 2 HALs exist:
> to build with `CLIPPY=3D1`. `make rustfmt` also reformatted a few lines.
>
> <...>
> > diff --git a/drivers/gpu/nova-core/fsp/regs.rs b/drivers/gpu/nova-core/=
fsp/regs.rs
> > new file mode 100644
> > index 000000000000..d4b8482a6854
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/fsp/regs.rs
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +pub(crate) mod gh100 {
>
> FSP only makes sense for GH100 and more recent, so I guess we can do
> without this sub-module?
>
> > +    use kernel::io::register;
> > +
> > +    use crate::{
> > +        driver::NovaRegisters,
> > +    };
> > +
> > +    // FSP PRI space; the timer is its only consumer so far.
>
> I guess we don't need to mention who the consumer is here; especially
> since the list might increase in the future.
>
> > +    register! {
> > +        base: NovaRegisters;
> > +
> > +        /// FSP ucode version, encoded as `major.minor` in bits 11:8 a=
nd 7:0, written by the FSP
> > +        /// during boot. (`NV_PFSP_FALCON_COMMON_SCRATCH_GROUP_3(1)` i=
n the hardware headers.)
> > +        pub(crate) NV_GFW_FSP_UCODE_VERSION(u32) @ 0x008f0334 {
>
> We are trying to keep registers (at least those defined within
> sub-modules) local to their owning module, so ideally the visibility
> should be `pub(super)`. And instead of accessing the register directly
> in `timer`, a `Fsp::is_bug3957833_affected()` method would expose the
> functionality we need.
>
> > +            11:0 full;
> > +        }
> > +    }
> > +
> > +    impl NV_GFW_FSP_UCODE_VERSION {
> > +        /// Check if the hopper only workaround is required
> > +        pub(crate) fn is_bug3957833_affected(self) -> bool {
>
> So as mentioned above, this method would be moved to a method of `Fsp`
> that `timer` would call, keeping registers local to their module.
>
> We will need to store the hal and `Chipset` into the `Fsp` struct for
> that, but that's standard practice.

I've done nearly everything you requested for v5.

I've just stored Chipset in there, is it worth storing hal? It might
happen later I suppose if needed, but for this I just rederive hal for
the one entrypoint.

> Maybe also explain that this can program some timer-related registers,
> otherwise the name `init` isn't justified for someone who believes that
> this just returns the time without any side-effect.

I used setup, I don't have a good name.

The main thing is I didn't use the NSEC_SHIFT thing, but just write
nsec_hi and lo wrappers that hardcode the values since to me it looks
cleaner than trying to infer that from the register definitions,
especially since I don't see a good way of doing it for nsec_hi. I
remove all falling from these paths and just went with truncation
because that is what actually makes sense.

nsec_lo/hi are now used in the register from_nsec for both tu102 and
gh100 registers.

> I'd ignore Sashiko's suggestion as it looks like it is trying to
> reconcile the code against the comment instead of the other way around.

I just fixed things to truncate and used wrapping_sub, to be honest
being careful here is probably the wrong answer, my local review bot
pointed out some wierdness can occur in 2043 with the current scheme,
so let's just keep it simple, wrapping subtract, and feed the result
to the hardware which is what the other driver does and what nouveau
did.

>
> Once we have moved the timer read loop into its own method, I guess the
> remainder can be nicely folded into `init` directly, and we don't need
> `timer_time` anymore?

I didn't do this, I think resume support might need to program this
also, and it didn't look very clean.

Dave.

