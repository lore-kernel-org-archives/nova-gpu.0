Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30D030FF08
	for <nova-gpu@lists.linux.dev>; Mon, 15 Jun 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524060; cv=pass; b=h7Dk27H202t2S3CBMF7JZNpKFu7RcXyzhBWQQ7QOISCNGJuFgHBivlrgNvBYVDxA/n9lQXkC3UbhLCei5CylfCf63VF9TZnK1SLGAQU8wdqKIi1pTiN/jvd431HVRC64Am8mEaBJ1PP4o1BuGNan5cOrP+UIpTKdi0nBddyT7Ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524060; c=relaxed/simple;
	bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkvM4UmWm2Q7Wn4g5IxkfcPKCz3J8VOl16s/Mj3OVdjoYj2Xu3odjXZ1HK8oa6wPTG7IKyelH0FYFTsEClx1AKx59lFHh7AFLmwg1WQCMYI10FlshCUdmTIKerbzUvKtPciZx2Wm1fzi/y5RfDrytovOjBg1mrjvqHWGjXJlPA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyngYQQh; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyngYQQh"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-307b668e1f5so252728eec.1
        for <nova-gpu@lists.linux.dev>; Mon, 15 Jun 2026 04:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524059; cv=none;
        d=google.com; s=arc-20240605;
        b=Q0rOh9Cqv9PgEEM7Rybs+q0OLHbm77f6m3eiCTShqQLOP2SQtIDw00BDZuOyOeRIsm
         JXHJv4h9aQ3GmyGCbMnSItRlRQJ3cZe6iX/sfHZErGPEMSiBfiB1URmSkL8O1oDEB1VI
         Kshj/ibjYN45YKevXXSVPaHJBquNhnFjyWYvvY0VwTRy2ATmhE07l+8HyC7F1homEE7H
         1d8WKVWqYWd3tFfDRGuuwvBbW9Or4JMsLfimZkc6hWG/d+lMEfUc0pF6DAjegyIsfYgK
         ZihjZJ7GUFpzMpvm+RP74gGoiSGTKo79HaTw6kkg+qgvki3IsD92ZTMXyXwJwDdZ3ecg
         mscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        fh=qQG8Ve+QHKLaayVcn+fk9sj0nDpKer4iy9oLTVBrvQo=;
        b=OOHBDJPwd5mH91O63StD0udl6tHS01rF/ex9ys51X0k6XoVzAMgzjgJoKrFsKNGi1t
         aL2tT5nJRTV394Ce7/hjo9uqdxeUHXdNVTv4lO3jsH5f25nzdpFOSoQojFTw5abDtDTf
         payqfWbroIzYR31IxNwNpmAqtOPQYJjGQ4TOuW/ffLIkwSbxIa6M2k1KQRICC+DTePj6
         FwyrtN+NKze2fQ0D77WbQ9byYBIOzTcPEbXdVhV8iRahS8/MoJAcsgU8RpQgfebfVp95
         +v2ws98GUpHMSUDwlkLPeIyTEKYUhNTei6RLh9+KZVic8a0byfN+PPbKjoz/cgY5/nfk
         8+Lg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524059; x=1782128859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=PyngYQQheaxi50FLTXSiH6D4DhESs5KRhp4b9plCUGQFSKccYqGf1TOBFOINV2ZcqV
         4d9YXPCFXprUB9SY+Kw9D2DhBdn7wJrAGPwvXX9YhxWJGLcrjc1fwEJvi6eb3lIMb+bc
         GiwdprWQyvcjeV8Yw3lI2/eekjhL40mT8jUB3gDo+wH7j53CZaU9/R2q+0O5rwoz55zM
         sumM7qEhZUj9wjzW/hP54BeilUOLqZtjOTTLuyhoer1iGC8rwULrWexndjcPThVH37lq
         PYQzmFnRBB0O92fKnsF/tivoPspwe9dOwTl6xYGwt2WAqPz4UgetXnmj7Sx1X/AicG6m
         cLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524059; x=1782128859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=VeivPLp5TUQH/79y+ATEkF78brsItn+O94s5cpPYogRttuo1LPMwubOJwhNJI0HGV1
         JEpjRtYalwvw8m1rhbaYLREXFaSjfgbACvLTpBtM3MvzScRg1oLBhLpUrZVvNff3O8wU
         DITWnfdf08LXmgGuFNcOVMlBcEcMto4UPbaHEQyyqdIQysWASd47kI9qh8AFh8S4v36s
         at7hkgPL5bC76rXXrOFWnOssHBbx0f13MnYILoS0heGH3ERf8fUT1T7mJIr9Qp+0u34U
         U9xVoKPS1rOJFQ4XHVRyS1i6sxtMeVxF6KDfkv1fJWcx5ytiTCsiZVP6oN4QjF+BfkRS
         dNQw==
X-Forwarded-Encrypted: i=1; AFNElJ/5G6byjxpwsbP/ld0gYUlpn9mwIAIwURN87J4wB1RuYuUMKPbLPLqap2XXmzxv7+DF/U4qp7gOKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDSrf3pCr8hGiEfFsyOPceSqa/87w7VjinCMkfdwSwXcsPFFr6
	b2phe+NC8IQtjQC6ywR80nh2c253RAeC0WT64OhYTTAN1JqCNe9xsb4YxYvCIM1t/L73YEZcct9
	2y2OvIzNNovhGu1bb2Qc5NaZhmovii+k=
X-Gm-Gg: Acq92OG+ptOXwEkCTAvhlFhDOZs4hxqJkF8HrridlWKPLwBVBZsKoKLifIJ3UIcmYcK
	4S/xrsn9lILT7UsVLbWMTQ0gbFzjvYOSsNXXFZviicgJMpNRgL2pAP/xvjhmzZsHt8lH/A8tyqW
	4LuuJjuUfYr1o/y2jor0M3i4WlPtQ3Rhi1MZA7KS95Lnp8IL3gWqMZqRVGskT4LE5znDoWcRp1r
	zvpCOdNhY+VFMB26A9tCIo8hdgUBv8hnhxHhcJFO4mvh+g1VEqa4FM1X7R5ZMgQQjjmsy660Xwt
	rTntni171o2oedHkxjkAYvGizMSbEpTG+4NX9JcC3JGxitrO1GJVKOx/iubrEYbCj46FT0b4oTb
	sJ3sWHAMfDm9fmLAP7QU4t4E=
X-Received: by 2002:a05:7300:ca1:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-30820093556mr3538872eec.6.1781524058794; Mon, 15 Jun 2026
 04:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net>
 <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net> <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
In-Reply-To: <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 13:47:26 +0200
X-Gm-Features: AVVi8CegjUXU8O3nUA4IWQxEABTAWlEoMDkVbcmMfj4RlduFup8ycaEWEgohXlQ
Message-ID: <CANiq72n4LzuHdu+D0BT0iew29rck1OydryyTw5j8JKhtW0prNA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:03=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> s/should/must? I guess we are running into all sort of issues if we
> create regions which runtime size is smaller than the compile-time one,
> and this is an invariant of `Region` itself.
>
> Maybe this method should even be made `unsafe` for this reason? The
> caller will need to write a `SAFETY` comment before dereferencing the
> pointer, but IIUC this comment is bound to cover the pointer invariants,
> not necessarily those of `Region`. Making the method `unsafe` would
> force the user to cover them here.

Given e.g. `dangling()` is available as a safe function for any `T`,
this necessarily can be safe too.

In addition, in general, in Linux we have been trying to avoid
unnecessary `unsafe` tagging, i.e. we try to avoid using it for
"merely dangerous" operations.

Thus taking those two things into consideration, then this should be safe t=
oo.

However, I think you may be pointing at the safety vs. validity
invariant difference (terminology is still up in the air as of a
couple weeks ago, from a quick check) -- it is true that technically
dereferencing a pointer doesn't require library invariants to uphold
right away, but in most cases (especially so if it is not your own
type) one needs to be very careful when dereferencing pointers w.r.t.
the library invariants of the type too (because otherwise it is likely
you end up with an unsound module or just UB soon after).

Cheers,
Miguel
