Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3235A3955D0
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731824; cv=none; b=AOEwh6bLdr+6381opuodlUYFMRNl7rKLmtpj34sOJSxldDlT9kWMKK3qUKDaWY42JNopJSvV52236RE7+l1DmzoEG/VnUVhGZIQ/esPw4HBOzEbe9H3EILNVh5WYxi6JPghBbXaDOrtmR8f10UCyYN3KQ0cIJyz3ZlJGdHcBdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731824; c=relaxed/simple;
	bh=eXKifjwGmgyNkfNyz4AW5WzTlql2ov9lymuZ6YjJItM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WA0ZOG2oPbFsT8H86XzsF9DGhbTeSHUxO7kuh2R0ipYMaOIiUdhn5qg/GfTVlD9XLEsieKQD95Hxumk970oPL9g67hzKRW2JUo9ly88l9p2G5/C0PVuopuEMPZyHcj33YosnLlclGuyweM9twHiSrmFKEi7Csl8JaXgGlBWYT6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lViowg6N; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lViowg6N"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37f72212544so2647911a91.0
        for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782731822; x=1783336622; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf9modGDEu51qoKMDfa6F2dR4atoz1mf0fTmi7rEwIc=;
        b=lViowg6NQDwLCDJmujoiUQ6lKHbLxbBVBybo/yNgy1cWZoQIUHZuer5dkZmIJUxVxR
         t+zRgNQK9vfhJH7YNDYZVo73Qs4B9FeqdXRoFXsvnCJnETKJDTq7OszfgGBU9qywV3ck
         5oC5feYLZtyp17Pli+QodM7UsqEt5cvfNZYUhFfzDCzSZJYwKyBxHLxZ5aY5PEgm5LuF
         S4IxxU7JnndCbT2qrufM7g0cy6zXkshtBzko28ixqCp8O324vk/9JBO5M7rIPfa+vUbh
         AsWGttWoWbOJ4dH6JX6eapaibiDr1e3EeJfi0HLrXvLx23S9M8nlfv5i79fSkuZArfyE
         ho3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731822; x=1783336622;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sf9modGDEu51qoKMDfa6F2dR4atoz1mf0fTmi7rEwIc=;
        b=owV72bpnpyuXLdVNdmCkniUbyDu0uybyLwoMKNUNDbCqUVwBedJbTKkJKkwL4e5Pzx
         YMC+ZE7CLkiOxyELO/pqPhjH3zQxy/QlRMfEvDrugb5TpUmlU8Z2Fw8OetR+CaoVG+Ps
         9fKs/W0v1bnNnWrMeFymrbacLmYRjTsdk4iU3Jb9+GrDyT0tenHfnunsIIlWd8piIG84
         KubaZK1fmLvww6LgdTcTmy93WYYxWiWIauaHwFWsdsZMWLtqkZNr7VCs/XDn+XcqG8QB
         NU3wpDy+iTpdQheVCoZCKwFsS/7/nec6UfQnBQcpH+xRxBuA/0ePitW03m3o9Ht2Lqo0
         Vn1g==
X-Forwarded-Encrypted: i=1; AHgh+RoPx9mSY6tGi7NaCLSpgMzM424LcZQzLsoJYUvBUafs8589NfzgJRI4MRLaAhW9oXjdxVeognFDwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcWipXxkpmCT1OWQJ6vf8vSeMlI+C/HTpRMSfvPae24/uqVqZk
	pECV/gxU8ltI+tQuk0s0y8ss38pKbELWHdpFtOiPZfqR9O8irs3MUu6B
X-Gm-Gg: AfdE7cmAFp2/Ge7w3CelCj4iqJCl9hopKvOQaAVR8lMNpvyauGFmfV9trgUEj66UcVY
	CmGEMkwWia/UxpEcOTd/tqCDBgOLnN6mZr3DEbtOU0jRGeHhc2R2gGg4KlsNGN5cmdO5mVPIFTM
	z8ePDVxCJjsvqHmQsDdSTYT8O2//F4yA4deCT3KZQbMO4BY82eb44QLkxlDF+06d4F4rNKe4j2x
	rPDj684heoOkN9hKKRVYz2x3o8sXU8ezTATVhc8J15ROD0F1pLQgNBmLD+WW/7vj4QEOwz50JIr
	9z5A+vMeLzfeG713XPXNCCXzpu/aFisKkPiqdpB/5bDwMYR1FLFeUsbonIzh82SpiXWlY61haJn
	DelIexoqVV5g5FUBqIe7If3KyfXz/LMpdCkW+j3aU4gcZwNG5cpVFflEEXuCf6ZDQ5XLfZO0nQW
	0l8MMTWGWKG2854KScYKSaH3C1ssSQvWaNblhpH3s0/TvK7ZhjBfPEOKRW/cIySQ9dq+APOXBvj
	duPBJwAzoaSoGDs9honM1O7bEQzvyMEsP+edOxC
X-Received: by 2002:a17:90b:5830:b0:380:38d2:80bb with SMTP id 98e67ed59e1d1-38038d2824cmr453534a91.8.1782731822431;
        Mon, 29 Jun 2026 04:17:02 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac7c9asm91594835ad.4.2026.06.29.04.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:17:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:16:56 +0000
Message-Id: <DJLHOQA5UAP4.340P2TKXGMME5@gmail.com>
Cc: <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 0/4] rust: dma: bridge zerocopy-derived types into
 the transmute byte-safety bound
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha via B4 Relay"
 <devnull+engineer.jjhama.gmail.com@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>
In-Reply-To: <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>

On Mon Jun 29, 2026 at 7:17 AM UTC, Alexandre Courbot wrote:
> On Mon Jun 29, 2026 at 2:10 AM JST, SeungJong Ha via B4 Relay wrote:
>> DMA-coherent allocations (CoherentAllocation/Coherent/dma::Pool) bound
>> their element type on kernel::transmute::{AsBytes, FromBytes}. This RFC
>> lets a type satisfy that bound by deriving zerocopy's byte-safety traits
>> instead of a hand-written unsafe impl.
>>
>> The bound cannot be switched to zerocopy wholesale (some DMA structs are
>> unions that IntoBytes cannot derive), and a blanket bridge impl is
>> rejected by coherence. So the series bridges the two per type:
>>
>>   1. add the bridge macro impl_transmute_via_zerocopy!, which emits the
>>      transmute impls only for a zerocopy-derived type.
>>   2. re-export zerocopy::Immutable from the prelude.
>>   3-4. worked example: convert nova-core's GspMem and msgq POD types.
>
> Can you give more details about what the macro is for? My understanding
> is that it is a temporary fix for the generated bindings; if so, I'd
> prefer to apply a definitive solution (like using
> `#[derive(zerocopy_derive::most_traits)]`, or updating the bindings
> generator tool) rather than something that will be removed later.

This macro is giving safe manual derive from zercopy traits to
transmute. However, it is not necessary if the transmute is going to
be fully replaced with zerocopy. I found it seems to be true [1].

> But intuitively I'd say that we can (and should) probably do without
> this intermediate step. But please let me know if there is something I
> missed.

I agree. The only useful parts remain in this RFC patch is explicit
padding in GspMem. AFAIK it is still necessary after the auto
derivaiton of `most_traits`.

Best Regards

SeungJong

[1] https://lore.kernel.org/all/DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org/

