Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478343ACA42
	for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301132; cv=pass; b=KjaUdUbHmf5m3GUTkqyUMTgAcusWNC85KXWPO12Ta25dtLRJ/FaW8eG9ghgoOnlY3OZ1USaFpTa0I50OJwn4gQuJGfV+FbmH8fUgPWHD/r7cd1rCThZTIc+IZbeRDMvKZjrc/Mgv/XkyekuVXTGsqLLy0+umuLOSBJE6ses/IOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301132; c=relaxed/simple;
	bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OJWTxu9NtlMEpoDYDF8VXt+ody974aa5FIpLFYtYVjJn/pCuul0sqoN54Sstu8yeEtReO0IAgILGVkrGn+QGDICjuc0lF/CDBve7R1ZPBGKlQThI0+cGwec1csnDMQLD7IZ6PuwBP+PqWF04W+ZadYTQZR3h983/1gtvaugVjgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcURt0e1; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcURt0e1"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca5b707b78aso96221a12.0
        for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 01:32:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787301130; cv=none;
        d=google.com; s=arc-20260327;
        b=YYDgxU35jxLa+N04tRypG7JBJDbjsYuSyDrVrZCmSUH6FIaa03SPOtV5EhfqRmPlky
         YVT2A2QvMVZ3AwrvALTd/2c8+lj49o0k9XNrFa1Y0dgsEMAuI56iSdBTxLZ417gQx4Oo
         rFz+5F5nwufE5mD2hi33MBRMR/nOo4CHrab11mVetn1IKvqf6Y7z9RxmmC8rmDKWg5d0
         VLxJnwOiY+I3rFfuHg5GT/nT7cWlgVP/PbbXwviETVqiVEv65VVI2EH21BcItfG+HAye
         uF0xIHGSBI4lm4hvcLHeFpKzBTnyJrKqw1K2VvrT5YFjdm0jPRb0/kBpMXydCvddraP9
         jeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        fh=EHdZorooCKjjMA2S9bQCwOASgaiCFc8+uwEpRm+HBQs=;
        b=P81foPd1L0CpmOqKRJkAywNWl5ZjJALE3DPDiCLpizA6O8bqnfD2zx9ytP5/C44LZ6
         bfCNNq1ztyvXEft69+fDW1vja03kV1nkZGfw7bnzOpZZJrnuZqd9zc72IducwcKa/5lZ
         BxHOmcaV5/cdcBQAw+NpOFyywVof76BSVIaeqyMzRODQ6xxFZFCBxJZuzDOsP98vQSlX
         crEz8EXo0GFSPea5FuvCrziNIb6vNKohSDaFiWbAnwz7R1kCHwicN30iFHT84GnLN2KB
         zdAhvdKJbbLE5poRGbGJ/GZaT26xJymx+ZpWhdTpx4duaFpcMl3GZCCP0UyUbKlcPAsW
         vm2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787301130; x=1787905930; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        b=LcURt0e1xwiRJnNBIoebK2QWMTBG1t2/VM0PCUYmSilrl2Ff77KBVCAj1umn25jCqY
         Y6gw9qVnjMMkKue8AElolNV1J1uRFYEdxMdDu401TqDM24zi/hL1JAS7oyh+W/PDZYOt
         i+b3pVukB3kQEx/2zyWZtcaOTnYEnHPqBX/imoQkrMnp6k210PIVFmQIki8Gy6QNv2Ly
         gV1To75mP/5Ib0o5vF0hM6wz3tGVcWw/DQA5GdRy9MhgUVbkCdL5dIYwmu7zZF8Ww+Hs
         7+0T9TxypaD9iiWeW5RqewQyTNMQ3Snh+K7W6sEvEc42g7rKKEfrMNn+b/44P8j07RXO
         SlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301130; x=1787905930;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAJaZPrYdKpg7XFLHJhHHgjNPw07ISwWrW3nvc2Fo0U=;
        b=metPvmhVEy6QhKdZBFkX8jb9Z8LY4kJRfIq0xfaxBbYwUlAmEuVSnDp29Dcv/s2+n/
         FyytvcqFPSrPTEZnjb8iE+5j2NEC3jsGL/LSP/6V5EDwGTg5oB8Sa22KDov37g5VgDA8
         zbljlap2wLMSsQuN6tpHpzqgikUHsioMeP680sYBRVrnG+D/lMLX/tJa5qILzag/infl
         odamdAyzzdBzjK+Eyhuk9jgzICEXkoLaUMSLTiXiB58GzAfXveLtWcwa3TihcsbRGShe
         uGAUwDW0GGGSh7j/b3mNJMM06XlEn8UuWZ6/DpyIDmwdXBqbp799PVv8KaUNGWFZS7AD
         3WKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMkfj7N5bqdjm4mOgAljWDECknOxo3nf6FLS9yDVWMBrIvICQnnJDqCFHGoILrUZWdHhZOJZbY3g==@lists.linux.dev
X-Gm-Message-State: AFuF++l5uxhKbajcfSdvGwk2j2OCxB/uXvQ6yM5olnEVY+3e/XNAORNX
	sjw6LxVRwHCuIURPeKQGOgj8rY8GLJ8aFYNl6sNlksd2DfXnNEW5cDPx8ihhj7Fs2tF4LZQfDWh
	pmcTxp1LCctodCRbEkia1mjUx+oTxD79UaIFJ
X-Gm-Gg: AR+sD11cheW+tEajVmKHD6wzgVCY2drxlYZcipzOnnXyliCJgZbggBQvlvN4ljfDTQN
	+SlpzwVJ91eR4fr+g2DWh1kkSfAc1RwHKmR7PXTEf6g2YF9W6d+zt+Qw/MRNK5FO16LO981CCuX
	anmu4nU0QkkHSGQcCiQUhLk3o4q32ROY/BOGIuGkDE17himnBCDUvX5NWi11zvlHO9Nsfd0jLQf
	mrf3O/6K5klTDYw4nzSu4qGhrwIDv20VRT8M48lRXmN9XyEA9QZS7HbJ990QtE6rHO7p30wrHpd
	iy10xSRWdRMBLM2gI/KM0v0g6tNsshsYbG9X8kZY8P3REtEncQbUWq+DO8Ok7IMkixJuOsZf8lh
	1/FKlP9odNaymqVmS/zr/hP6Mql40dLN0qsTgy+cwfyVZe6t+XfPimVGK603R
X-Received: by 2002:a17:902:da89:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d64ad9ed06mr43504345ad.1.1787301130519; Fri, 21 Aug 2026
 01:32:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
 <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com>
In-Reply-To: <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 10:31:57 +0200
X-Gm-Features: AcwNN1WPzmGqvT3e2iXW87UG3n4hOQXFPsxJelyLou4Wnmg4iCK3mbz0zVXSqfc
Message-ID: <CANiq72=ot1SVQRxzX5NmyTspzf-eMKca7DQMdUMSHtThn+kfpg@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, Aug 21, 2026 at 10:11=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> Mutating methods should definitely keep that check, but for querying
> this looks like a legitimate way to use the API.

If there is a need to use the API in a certain way (and there is no
other intended/"better" way to do something), then yeah.

Otherwise, having `debug_assert!`s or similar are more than welcome.

Cheers,
Miguel
