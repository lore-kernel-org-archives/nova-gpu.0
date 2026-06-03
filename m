Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ACE30567B
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487406; cv=pass; b=Yl9V6bA/bENiRBXIPNhfvJ1ITsDsrqKY8le/M5CvrfHr4oN4zigXu9j3zrrFU08xauToIcQHGAjlOSPpABdFSglEttXVLInXFAzoSvy9jm39eRb6P67maU1BodhCWInppnOXmju68Mb5gBYc7Q3Inejd9vsSAI2V5LqHuXSNMZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487406; c=relaxed/simple;
	bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbsrcvcCWOckWXUTxWdRIKlB11te5g82u9JAuru6VXSmnWCvkhEcdamOiUDgdLblE2eB7eL8VoQRfLUHJOeflqWijTd2Fhzn6Wr3lTWYPRkM1Y1tPjDWUmG38EUDYOBnWu+qbCCrSn5e46268ixn1g4D3jUGEMaNvxoQaS/mK/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0PYjqwJ; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0PYjqwJ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-304e86ecebfso525669eec.0
        for <nova-gpu@lists.linux.dev>; Wed, 03 Jun 2026 04:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780487404; cv=none;
        d=google.com; s=arc-20240605;
        b=lqMH/jIlTgHthV/2xkBOSbF0QLRoqWSfXC1I3KltkWTHLXiRquMWZeh4hlTkueLEKy
         G94gENIx9Ovjg9jtOZfqDnF2hlgDkv5wdecYTqFYK+xqSR62lm3Zvrkm5LGRkfaRRAXH
         A8NfOp1HE8YeVmMPK9LF2GAwc6oVLS19fTrydG575TmR+qcT4/Up39MxV7lxC4kF/Cda
         h/Fi3EHwqV6RIWjY6Yix8qFx49+KheDCi92ByUES5DJyXTG0j4V+TrE0xI91/D/yBMMQ
         5KHHQIVwmRe+kkNTDUFOfID//s8wvB1Umlrn1F/FYEKr49O5wQny0n8jEPKv8D2aVtLy
         TdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        fh=zGXV7gvAOF/j9H/B39m/tQyXKY3jtLmmPSK1n4P5xY0=;
        b=TL75jjscxaTwh/OvP4L/TkyzXs4uuWtB9I1Uucrki9gzsoWPMPW8nU2sLOYwHP63JA
         /0BAvEyIsju3KqpVn3wSG4qTmmbEoZaCaIV3+d5RBnq1Oh4PLjW9VKa6uH4EhNcniryt
         bmR8cW8i1k2v1W8+p1NGkYibB1XHb0ZhdLV1MP5S47G+oRZ4wFQjSigpoamVyLR2Gh9l
         7q7jaAjrs51/PxwKwyT0oVM+XLtkJDTbXU+6UvqdqPGfkC6x2Dz0uGMumAYq+M2z9XfC
         VDp+UjbiPyCylx/LYQqjefcSk0avNPe12jnwRsSPrHJGmXR9swmbuGg3lJYeKkGsNCAM
         QK8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487404; x=1781092204; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=a0PYjqwJTjv7nRLrV9oiMyRntYXCKkEDYYgdCRjOGiylTTOfpo5+v/YRUL8hLL76I5
         itBIYCd8sjyo48P3dbd+xDYXjBEGST7GkAoUnbbWuZ4emguMqfU4DsKGMSpfOhw9k+12
         eQmvhbmKJ/p8euZbTzbDo6CW2ZVHsSbWfmTkcHN9E+c4ZVu5x3S5/q2a0DwgPDNR7MDw
         Ym3Nq2aGmu2TR0hFkjPe/mVaxMetpLqMEVYYL4DXCQZUG/5Zee1fNwVGUS3LJXo4IicB
         iMUVol5Izvkg6pEn6oixDDKJkvlKXKLTR4qOofnWA7Aifk0kEhzCNDA3/dBWFbhpGuXs
         Jeag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487404; x=1781092204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TLZHWIpqN74sQXHrJ+tZtAA2WHcfmMHzbUu8OcbGpHc=;
        b=Kih32L7p3HuV27v+9c9iPCPnPcwt+ydWXK9NhdDgsOL82WIbw+CiXCJu1MWYlNci8Q
         M3y7bnGNOKsDj6+YS7HuqcskK0wXM2JgsRo/Mhk6cFUUbOQsa2a/X8WIDa0nhqG/amVi
         3gL0cV3qFEHPzhMjMPKB3ryFzREtB5tmsZ+0R9MFBIlTxfNQKOKKmvjRp5XLQKMDDI7w
         TwezDujc/REFuPTCEfa/JwHpGAbFJA/kpaTU/68UH5K2Ttgib/jIRp3czY/bUiniThBK
         uzcV05rJoZ+lEP1/y1O0iTS7bylUHX5oabw9TqQNb5vTQPi6+TTN4VYQIZcSmX7vLsVB
         8r1w==
X-Forwarded-Encrypted: i=1; AFNElJ8Wnya0TmxgUESVB/MsVe5zZYYK9PYoKibtmqQFoT0pgX9Vdlxad8SJO14/mS2H/hQUbsfD/ln54g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJy+J7AzYwqrFxPJjom2lcxUYpaTyLu+ygrdWCMT3em5wdR2mv
	c4Wm1jkbzeSdqis9TyweN0KnN/Lmp6NixGT3UpGxXYpOMu8A+0NNc0eG/DUjc/SwCp2rBrXRbLb
	iU146BeOo6TaH/YxSC0s7K4GxkdKob4A=
X-Gm-Gg: Acq92OGfDZl39AHIE42FoZSeNfEMqAf5TGz9n+mFpClPuIeSpzAFH18tHEkP/YR4tCD
	oES9vafoDrUSekyClXNGhK/zKDHhNApSzsVUozPaLC30E/rnHiBKCvCeh+ssOCTjuQYBSikOsKq
	r76LF5C9qpjqqf6DtqTZXz5Ay3CquIEdVOKbpfG5CCRhv2Foq/uvLcef0yVZf4DcCHm1GCUtfkS
	l3grJ9oZ7qrxiaRtM3YN9qkfArq2CdpfmEAoQesJyQyMyRfb47YafSS0gU/MnkkNZqZhSyq/T7N
	VrPVVFnFcm698QoBqQkBSSGefqPGfgcQ/dZ2KsbNd1E6QPgmG6n2Eg83mrA5x91nv2b4nTQ4PK6
	F+3b4Xu08djwQt1q+r5oq/MpbcTtFCUJJKQ==
X-Received: by 2002:a05:7300:cc0b:b0:2f0:ddce:8468 with SMTP id
 5a478bee46e88-3074fc26eb6mr769327eec.8.1780487404307; Wed, 03 Jun 2026
 04:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com>
 <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com> <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
In-Reply-To: <DIZCF27FZH6I.17CWGBTLDNSMP@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 3 Jun 2026 13:49:50 +0200
X-Gm-Features: AVHnY4KLkt_lJ3NQBEx4139A-z2PzHbNSKGJ40zqfE6a-mpUvOd_VHKVite3y1s
Message-ID: <CANiq72nTEPWds0VUKC02RLh5a3TLNyShikJD1h5TDc-26rrk_w@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 12:30=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Yup, I just want to have something that allows us to call from
> `nova-drm` to `nova-core` as it becomes increasingly pressing for us to
> be able to do so, but will be very happy to replace this with the global
> support as soon as it is available.
>
> This patchset won't make it for the 7.2 merge window, so if support in
> the R4L build system comes during the next cycle we may even be able to
> skip this altogether.

Sounds good.

> I haven't thought about that, no - in that case the parent `Makefile`
> would need to be the one in `drivers`? Or am I missing something?

I think `drivers/gpu/` should also work. Maybe it works inside a
deeper one, but I don't recall trying that.

So essentially you can move both `nova-drm` and `nova-core` (and the
exports of course) there, and then since everything is in a single
`Makefile`, we can just add the dependency between them as a standard
Make one.

I think you don't even need their old `Makefile`s anymore, and that
avoids the double building and so on and so forth. You still need to
emit the metadata, but I think we can pass the flag, avoiding the
custom rule too.

Cheers,
Miguel
