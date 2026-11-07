Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060150;
	b=NUC/NEKCdis4jHl5y3HAlVy/gJb5AsZ3+41TMp1MmHhTPtLAj5jEUKVD0aDpBTVzbaXy
	 AGGiq5xwi9T2qBF/dQYAhDtcYrwoWv5gt13lk6vwgbwiEGVpa3vMDz23Fw5hFL/gsB4DP
	 wU0Z13/f6pru7Wdmy82qpImG3B7lR7oQOtX6UkOW0hKzFRemyuBjEVjDK3edpfAoljO7X
	 aKgVJUzI01+C7Aac1iPxmS34vkJZSCMdv9kI4K+/maUbsrcFQTCkAp/dGWgQGLda/zBiU
	 Iq9RrdwMSqsXsn/GLuATFWZDs4/Npaxfl9aIL4E5Mf80T/xfPJ8YFzquwMLhYP1fXXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
	b=44KgXA8kn3vYB27eiJYDAm6FbBdROxP+wBBegs4gRZoHO3yU1jHIFRIYonUPmKYSBgBA
	 gOfwmlW481hBSMQMUI1FV1QHYK6NW9hU6JADxluMRHlfz1D42izwsuoq0ZI4u7YeYfu/F
	 Y+2cKcRug9TpY+FjUhILJK8fcN5woOzJxsDAUMXmJLSSwSEdnr2pokZETf+/DMbi8uamu
	 3YPpIN3Xl1mpnMUYAAU3H3fQRIXGcXKb761gobOfB4U+XYTfKgcblMt5uoB4t4Y5QbQpA
	 Fe/I5FhHuTWn4OnR3gfyX4+M75r36xBNPQqD7QlFVGsdQqBf+oYyewSTxcAPnrcNoUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tADxLf02;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4B5606A326
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 14:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB4B5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tADxLf02
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so2140009eec.0
        for <nova-gpu@lists.linux.dev>; Sat, 07 Nov 2026 06:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060149; cv=none;
        d=google.com; s=arc-20260327;
        b=DprJ4S5bjy8x8ijYFpuC/CFMP+ZGSZu2WCtOd0yKMsRxt8WwKgDl7p0/k35UemwND4
         5fLkdUQ3EtEKxYfvDshTc6Pk3JnFA/L32qxagQbfTX8gnFp1CIaF4TNipnDdXDATitXh
         CTgzBpVc7EZgLGgoA4/xoqh0xypUekmbxMPuz0szLOV6Pmxdg6vIH3eL7MfVypeddVWO
         /w9l008YFlwUKhLyjArmrtk5CrBKjAruA3kAPN8PqtGn5vrPbOmB4cfRU0uBgCnEhx/R
         xqgnU6RJ4aViRvUaRuJLo8NJR/lkCCxiyzLaUOZmz7Sr6zrA1MCQRssFd6vzd1qsnn6Q
         4GCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        fh=Ec2RuPxEGFkuDJb3aPhnblwTWqxOPf7p3Bbra+Wc0oA=;
        b=C3HgQaVuxGN9qwqgqvD/H2X6PGD5PE1VsrEs0R1Vr67P1SO/mTiQftO3sv4jyMhoeH
         32v0wF3Ytb0hfusgufhvYc5ciwYbiiSEB8MZh+qGkRGBFuX+4EpCDE+N00xSA63vZR/n
         /xmpkHqlCV/tukcWr3oUmsz+E0JyfFKr5qQNR8LJbjPznKQO462z8d9TmcYdimNcbxSY
         8yc9WCDT7c34qx1wzhdtoZarxbF2LuOrWLMixqvwyATr9TdR/fAoap1oo9qX3ucIzt1F
         Bh7wgrRRSR7VBiRfCCJPB/6zuLsbXfTrnSRN5NdwZGuh9U28TC1r5TUlhpmwExQAOwci
         FSJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060149; x=1794664949; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=tADxLf02uMEqAtRiGnp4BFJtlcj4+rCV6tiFzeGpeNPmyB9uAnP0gfKvlwcvNHRjNl
         /FgLxhD+5halZPWMa2sQbpZ6a+GBUDdlUAGSSW3pdrjNfVjqYknd76gUUA+00NDiisuD
         dJXaI3390FjAfeZDdNJzYSkGlNIDZJaKnzxKMEQyR9eA1oci5jeUdkylYB12jXufeTbW
         0JW4EEZSiAi6pWkjTRJihUWunwNf638mgo6z46cYw4nIxpcr0rohgdD06HurKKY005fy
         mDH7sphseFUY1geBC24kEjQF4TSqR+rSStpilviDsbteKyD/wmvh/hSOmhQQDUGI6IjR
         WFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060149; x=1794664949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=oeoyuyw3Oi72G+Nn3XQqIOXahW/eOJasEnyzuKkpo6Qya+IuhXrvAFJ0+R+VaAPtDv
         PQXBl0Lg9Y4CflAasncr9VCrWsRBUVQ/1Le3ZYdmH2fTpMP77J2tmmnz2cRB0RJGfiKj
         EOzyoVUBqSefdZ7fMV5b1t3mTOSsE8wxOKS/P+ilU5ZyBoC/UpguMp2FeBpwcgtgM2qY
         StHmueyB1PoDoelrl26MRfvSD7EkfsLe8TJJugBExPAUNDg/LmLxi3PcHBxElYYaPMzy
         rMTGkD1/LcBzdZTi6lLpKTz9qwJUVCOiGoYp1mR1jBuUpT3GiVNnATmyKEWQ7qrvfsa6
         R/PA==
X-Forwarded-Encrypted: i=1; AL+hErH0sFXpQmZnZKhy5m2EvQ4s6ilVUNcozXShOx8m+8bc5TnqTwqOj4pJrIxzxUpSgA0PkezyUkO42Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9etL4kYDF6szAI39EtGMrE+rQ3Txzskd4zzHiON+v02+oVoxz3
	4FRvKtuO/EEQEwGk78n4Ns0tRAoa/0JXFRvhdgw3g1xl051wtG6pTx/hf7t0yuWkq/PgZRII1Fy
	wA7wgSeeTC3Gox71C82G5YpmOLcprCxY=
X-Gm-Gg: AYBFou2eawjbcYmvLcljLRNZ3tzAt2BNk+iefIBRc+4s7x3nmUrU8vPy/TjiMS41fOg
	iiHcZa3+ir6Bc2pm6yRO6YmNXYeVMZW6QzOjmzMWaHZxM4D+hxtJNZZJnc+ZVBRYDx8cMNFcvPc
	s9KDkSNYilFPaYe1YwgZz6fpFH3mrcA8czBH8SETjVCtEhmvNKAJO/i17+ioq7RXw0ROREjcQpR
	3ECkgyF7lyVMoULtRsX9pjN6IOCDXcdjEF0DwzMC7BrEi4L78w8szz0NEozP8W6hlimdNfLzusn
	isvGxdpIvxL2iHEY5Hrl9g4hYwJCb4tDhw1oqxv+OXp43Ou9fc5ehZOVNZIqPxm2v1kLJE6uC2p
	rTSeQtZONOx6AgckhamiNxzu9E2WXOn95+hWK6pHgr9yYFpv8WjGTzIlaOLdMioUK6utQETbWYv
	TIy3sURFC1HX5du4LMIAnLg/ISnB6zM5BpRYfLx+oqWylxNbl84baAnwlJagPfRIFJnNuZONI=
X-Received: by 2002:a05:693c:68c3:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36f754414a0mr8478739eec.9.1794060148890; Sat, 07 Nov 2026
 06:02:28 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
 <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
In-Reply-To: <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sat, 7 Nov 2026 15:02:12 +0100
X-Gm-Features: AclHuK-j_BUOtjpwGmqXWoxYJLK8ze9j6ufmkDg9fB821Uo8UGX-BRotwpA_pnA
Message-ID: <CABwQupO1Tp2EM=iNq24_9_krZ+6vhvXxQ2TxJ7LUC30oSXJ66g@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Current code in IdPool::with_capacity rounds the capacity up to
> > BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> > smaller than this and still uses an inline representation. Remove this
> > behaviour.
> >
> > This allows specifying a real capacity of 0, which was not previously
> > possible. This breaks `grow_request` in this case, so change it to grow
> > to at least `BitmapVec::MAX_INLINE_LEN`, mirroring the capacity floor i=
n
> > `shrink_request`.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> > ---
> >  rust/kernel/id_pool.rs | 38 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 6 deletions(-)
>
> Alice, Burak, Yury: I would like to get this series out of its current
> limbo. AFAICT, Alice and Burak are ok with the current design [1][2],
> and Yury's request to change stop using a zero-sized pool in the example
> has been fulfilled by this patch [3].
>
> This series would need to go through drm-rust-next as we have
> dependencies on it for the 4.5 cycle. May I ask for an ack on this patch
> to push it through drm-rust-next?

Reviewed-by: Burak Emir <burak.emir@gmail.com>

For me, yes, it is good.

In particular, the thing that Sashiko finds the panic of using 0 size
with find_unused_id and CONFIG_RUST_BITMAP_HARDENED=3Dy was explicitly
discussed before and is intended behavior.

cheers,
Burak
