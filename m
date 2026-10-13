Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5751474D
	for <nova-gpu@lists.linux.dev>; Tue, 13 Oct 2026 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898013; cv=pass; b=Y+VZ5ixRr7ujMXZDdJ3Xq30IIUw1RePhoU4JZhsf6vVAWcsyNJRHrlcaz6gSbRVO6U08FaKuUQmGjuCyvFWALlQGHUdbDkd0Pjv7e0iIUxe8kOfHRlh0Bb3DmD4XeLPIUEW1ByFXRs0o544p/9feCCP3Nig+IFgfT9Ttp2PHJwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898013; c=relaxed/simple;
	bh=lExLfL8EGZo1KdexXBFgjyFCjMP6bRK4lgga8bV9zCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIx/9wuwufVDU3yCDWx0jXSI5ROubAbsO1f3E9i5gbgP7blUArKl1GK9jqkeEI78z7QgCXCc1UfxrSwgAs6pZoxPp8TxpWQmGwukSCJ0WOpHQMc98i2TXT/AAZLP4k/2ybVCAlyRIrMWNleH6i3YIHxmfAW94C2mNukmCUNv7AA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZD8siJ2x; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZD8siJ2x"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35ca5244753so80945eec.2
        for <nova-gpu@lists.linux.dev>; Tue, 13 Oct 2026 06:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898010; cv=none;
        d=google.com; s=arc-20260327;
        b=i0KiEOkZGV8AYlKifM9QndAjELrhzc6+NfkQIBaVKJEAsREiyvtuHGUt064K8399+g
         nhpMzb9q02ocjGNHCzQ7864yFBH+TC5YX4i/AqeBAu6S8XywtooiceNpgh9Vbt2s+sgN
         6NFxTZAq9xGYbMuAB8342SkUbdqkNLHnCkRBBeV09jIpjQxqva17oWNTJT0bIo9sUp2h
         hH5WbKhae1tfTFJMaprfX/wInBjQiUV1hZqE+P46tq1juZctGeA0uUBHafWmnj9cS/zf
         DVp0nI+wMa1cyxewCVpQco8FptTtwvB1qMjyfuE6G5ib14S2CzuDbXJN4TaxgBlPS/iU
         NoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        fh=8vNbzD5FARudkyOG71ZPoJEG3Y1Ofb0d8OMRkiM7lSU=;
        b=jZVrvANsTV3bzGlKpPLSfe1xS9Qmyq9ML2f+5Chlz2OtNn+LNaInb94v7k0TJrL68m
         e4VZPaftAQgiB5bmooCdCwMAcjbq01ZZIcsGZWewFikvlIhyieKCNkyszEdaofKh6Kz9
         3Vfonb8WiqJiv6I8BLWOxDMu9KM9ZCIJO38vBnGiFw0DTBE65/WajFgEQVAPJNfPNsMS
         oD6IauMrGBNnTRbS78sCTJ1nKTt3hg8gevZW7UtS7RV43RGyGkPp1/N+2JgIGs2H7gRg
         0coX/n5npK6Ug+SwL+6Pe7zIsAhjeOU+zJfgHcTdp/wCu/1Epe07YxcuHux0/EQnDqD8
         VKJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898010; x=1792502810; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        b=ZD8siJ2xJBS3+X2W5mt4O3kjRvIHyxXcBFJaKt/t2jhN2IkI8QO+9KEYL3+twVuS1G
         mEC0Gvq6gfIlKP9HUJyLCGVgDIy/kX9pfN5x8TqJPa/AIdZMKNJHkz5kj4FQtxZea0H7
         iTkOouUxVRVenw2oUj5ODEnKhw2JkhRRNGUptSkUmE3a/ljVIX2Fv+6Yfb3jNrLYkpzC
         UN9puytNOU/YJJn1Y/KywZ4mlyLDSRIUz/xCSniDwrlq2uCB+75RafPdNC42h/yR+/TV
         fS+dfFeneSuQh5Y6vdK47MOfxLnCMwX/gTXAm69PjtRr1zR1tGlmkLOIfZTrvrPCY3uP
         O1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898010; x=1792502810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        b=BE/y+GCu+n46vs5kad6NI72ZiemdvhGcOW2+dMA/UB9JIiX5j+WcptBH2z2uB7kh8P
         fftyjRq+qrss4L3rXhRETLtgnI/q6NiHP7Oxshe+MwMckWPv+jl4pXLSfF/YElD88QDq
         opO3uC8TPTPBiBNMOF+FCcEhi/L9KGg6dAuf71Lr7Ih0+/dcfESuQ/YV71iQt1DA6hQr
         qTQ+3IRlKXPJbICAfVQm5kSsCiIoiLhwXgeagrMErm9oxsyY1ijH+nXlNXvHMEpm3+Ue
         WVjKhcwVwtHlodnBl1mdilk38rkSo28Hl7bxl+e/4Je1NmM1/jkwLGvgCvEQezaIHQzo
         LyoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvAK//I/rea8ptT0JyYEDeB66J0cLaDaNl58JKo3aqHsgJ6Bb8u6g3RgW/EH9VCu+InPD5nZWLzQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJxMXu8BMIDhl5TsXJz4O6zsfMc+xTrwA6fqL5yTZ0t/fZXYOnC
	s09JOucPpRy1Rmp7zAulOjZTiFOzSB/F8PtvZmBsIJeWv/CL1FZ3DOxjlfrDIine50rBq/H1FY6
	thr1FVcB4s2O3qASSEsBmgtbiS4N8Bqw=
X-Gm-Gg: AYBFou3iaUTsicJ0bPS/ruzqcmOnw6aj4GMEe7+1kXPEsGDNBeRanFJ3uDela+JVNeY
	5pbJkSbASwaduczM7ANzmMExFymTn8xTj/BJ1hjyTsAm+wKZKLNJnCq2arJ6quuLo7M5yuq8zGO
	OAoCaGu+MzYqSnvYarH3vjZ2Raiy9xKhBg18vYh5NXn8DdoPi0VqzePoE7tvIrzbwksXGCRGja2
	XxhxERIDzT/0QZzY64x+jhinwDYhmqZt6S1hrOICpXUh8aKwhuEzohT7XxH7qhLVWzS9k9KHxqU
	4POMlgi8cnYbJIVdpWvk8buPw8/WM3g55b/AdZriTAxSIkT7D9fHGjVvf2P/bqvqbEt4taFJ+OC
	RWUuIeIEoYzaw0bDew5dYEZUtnS0N3tN7heRedTT7WqTPhLDzoiyDGSZ+HLURtq6erpPCUJrVuA
	lTmMe2BGsZ57n/swZZ+dTFiZOZB/zrfK7YpZSbCWctS6sPvfXQvjQ=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr7485005eec.1.1791898010056; Tue, 13 Oct 2026
 06:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-0-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 15:26:36 +0200
X-Gm-Features: AclHuK8MId34SKofgkVHxoilN91tJK91SiQlB8ktXLqMDzqKOFOns7JAmHwAjko
Message-ID: <CANiq72kohkx1-9iendYSD4gML8wv5bF+HrY7RO2vagLhtXYSKQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] rust: Add support for reserving of ranges of IDs
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add support for reserving of ranges of IDs, with a usage in nova-core
> for channel IDs. This entails adding bindings for the C bitmap
> API for ranges of bits, then users of that in `IdPool`, and finally a
> user of `IdPool` in nova-core, `ChannelIdPool`.
>
> Channel ID tracking is needed for allotting ranges of channel IDs to
> vGPU guests, and later for regular host channel ID reservation.
> nova-core needs allocation of a contiguous sequence of IDs with a
> specific length and sometimes a specific alignment [1].
>
> About the tradeoffs between different data structures:
> - IDA/xarray do not support allocating a contiguous sequence of IDs
>   (ida_alloc_range() allocates a single ID within a range, not a contiguo=
us
>   sequence).
> - A maple tree works, but is not as good a fit. The ID space is small
>   (limited to 2048) and aligned allocation needs an alloc_range()+erase()=
 retry
>   loop (plus a Mutex around it, or new mas_empty_area() bindings) that
>   essentially reimplements bitmap_find_next_zero_area(). See the maple tr=
ee
>   version at [2]. For 2048 IDs a bitmap is also considerably faster and s=
maller
>   [3].
> - The bitmap API natively supports aligned contiguous area allocation
>   (bitmap_find_next_zero_area()).
>
> This is based on drm-rust-next and depends on the cv! series [4].
>
> [1]: https://lore.kernel.org/all/84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvi=
dia.com/
> [2]: https://lore.kernel.org/all/20260710-chid-maple-v1-1-4ee869055268@nv=
idia.com/
> [3]: https://lore.kernel.org/all/20260717053241.916441-1-ynorov@nvidia.co=
m/
> [4]: https://lore.kernel.org/all/20260917-cv-v4-0-547ef5727451@nvidia.com=
/
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied (the following subset that Alexandre suggested in a sibling
reply) to `rust-next` -- thanks everyone!

>       rust: bitmap: use function-level cfg on kunit test
>       rust: bitmap: restrict bitmap length to at most i32::MAX
>       rust: sizes: add sub-1K size constants
>       rust: sizes: implement SizeConstants for Alignment
>       rust: bitmap: add contiguous area operations
>       rust: id_pool: add contiguous ID reservation

If someone does not want them to be applied for some reason, please shout.

For the second one:

    Cc: stable@vger.kernel.org
    [ Added a few intra-doc links. Added backticks to C types. Capitalize
      tagged comments. - Miguel ]

By the way, I didn't modify the patch for the following, but we should
migrate `id_pool.rs` to the vertical kernel style. Also, before I
forget, we can clean up a few consistency bits in `bitmap.rs` before
we keep extending it (like in one patch here) -- I can copy this to a
"good first issue" or I may just send it:

  - Fix the broken intra-doc link for `c_ulong`.
  - Add backticks around configs like `CONFIG_RUST_BITMAP_HARDENED`.
  - Capitalize tagged comments like `// INVARIANT: ...`.
  - Make periods consistent (adding them) at the end of bullet points.

Cheers,
Miguel
