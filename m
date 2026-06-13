Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0193637756A
	for <nova-gpu@lists.linux.dev>; Sat, 13 Jun 2026 10:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781345146; cv=pass; b=aEYuc4XnEzCYxJ4gSh/AZwCOMi+ZUR4pcmIUPcJfaYoLW70QEimZ5osVKUqsqYobKIrXabWSI66ZhMpW/D3w9eb0e4+TCWtEamExjwGZm2xFLw5YXZMIPHbYZdUStItoyog/oewH3SFUODgsKojG90sBJn+z3MD/AtMYMYqK4yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781345146; c=relaxed/simple;
	bh=a9H86iIlJln7zNImJOs7H3Twwdm5fUP3s4vZPkvhH/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sHJjf3J1+hnfBOzV0YwacxmdmGB4X1Zmya8zQpatvEg9RByw0RIEcx3rH2DSxUtsuJT8FwD4XKrCecgX7WNH+Gk+kZmgZ2P95vuz32r9d8OuwEM151X80W2kSLpS80Ta8lF6lnhfrl0zR5iMPlqhiBGa8q/Lf0+hNCM7KYogx6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2WP5XCx; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2WP5XCx"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304e86ecebfso116937eec.0
        for <nova-gpu@lists.linux.dev>; Sat, 13 Jun 2026 03:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781345144; cv=none;
        d=google.com; s=arc-20240605;
        b=OsHzRJ0ACQYizoDRlvcDJMsmBhaMuPmbxL/JwB/YZVXm6XhQNnT2fZJxSGgKrSmppO
         grdOohh8iHYcbp3PISni7id2aKFcCntxLwlqWuLkMFJPF23dyh/KiZPsXRCdNwQYWRtw
         37NftTezmfrHqERBT85eKMOLvFqcn98jgRanCPEBwAyG2bdu/Wc0Ofdml7HDL4pIZ784
         TO//CLdgZZKPyZ28zfCG+DMIfk8pyfI83h0OPt2si1WWf2m55m1FH2BGXYrHyY9AY0i9
         rsEOtRjmwxJpJRzsJyoh/zLYIY3GKbCW4NGPSPiUBqLLU53FJfEe1spjWTbWBw8EBhpk
         J8DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        fh=Gqv65hq2O/V8HCjCsxA4vc4V7lVvRKBJOG41tsqJ3cg=;
        b=YoryPLJmgY8mI+o1+YNJzG2eL8fn7uprAH7xIuT8loBWjQgB7Nm+mkfz0cTxkx75aS
         /EOi5n0jq+p7w/msjH+sPqpwvoxlgpUjQ7TV+TPcbXStj7HyD0zmrAwTEYGT6LxDWCxY
         5CI06L03v1FpsbWkVj24XxKGAn1V2ioKIYUIdcTjjfSorHrSYGOcZ2AI/DWsiQr2htcz
         hUZwbQku3VFIx0CK4zIfQtfPbw3HRx0i69XBWqXx+tafKKQxSp7aZc97SCfRO9C2PM/d
         ZrR+cRzg5b6AiklytaCl7aYR/EzLCvyBe+Gmb50D25LBsnyTScycvSwWiQDt2h7faXpv
         pe0w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781345144; x=1781949944; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=U2WP5XCxt7YroHfOQRAV6+lR+XIcerwVpLI/hNgPF82huHD3tn3bL/lX4J/5f+QHqd
         Qyx6RREUfG9dC9sUsGtmzXiTIMyOHwQFQ1MACO/BGCGOBNAMF6mOXAMb1I9xB7bYZJgg
         wbd3gRb+fHpMeDQWCjuezPNmL4kGgyuVHgCkQezSt43mww9ZDyOErv4EewtnWiRtRmme
         JgLrT4lvtR25ENf5nQB8hGkIvEHPsHalFPyXoYJNajT4+Jpm7t9aZLEmo/wHvuq2fEv7
         9BNUFgaOHBGjI8WAnk6hhjk+slmNGO5LAGsfC+km2uLsqRehkZLl4VLQLTpr2ja7+k0E
         WJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781345144; x=1781949944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CBjNOSpJlw+yD+1WI2YpvIUWPKEOoXhGnrq65FYW9Fw=;
        b=H4fHZq7l0IvA6GjsfIkvgqTkcLatZ4P4vXszrhqYaGXmGFY1WZkYcZSRjUWAoQyMOH
         DH9yMJ0rJzwimszyKpJ4i0jayPaI25A7MSYCFWzpLTLvPukCvCPT7PptipDUYnmYjPJ7
         8bcBgtOnNt6ALNYDgCUuaS/SkQ1m4KD1hQc8icXhj4GaYYQnq96slIdiJnUVx7kBlaBO
         Vpfwcf1hHYwTjhSx24LSzAnnk3lDQ7QqIC6AXduuQaGQa6Z2b+IS0Xy473uxCEYcshGK
         FL2wPCZmyYW/nxEtS5GYa0i2ZNXgpVqHBPo8s+Vq65xVzCYRlxyp+LtKYFQJVmE5k7j5
         ZSrg==
X-Forwarded-Encrypted: i=1; AFNElJ/cJ19H7SJs8fUHhaMktQzvjpoBRIooygjhqE/mF5796YeS0vBUuf+tQts6/RWNTlwlKZBlYOJtpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvQLkNwnlqxmJazvLvqd3qexXnwQv1YLAiK1xAgNoW9mZRnMNB
	P/qVgDtBKGx/M10fSxUhYy3E3J1gW2C/EEJJJPXAvDTR7AepudU/kaTiKhkq96wcFD1+K8O1vTD
	l+KeXvcbM4Lv9kaIIuBXaotuugefXlrE=
X-Gm-Gg: Acq92OH8Y84u4twJGc3bqnWdXU43Nq6WFge63g8fV0UlQS0vDiSXlnAQn1CDSyk4rMN
	Q1tcnfeucC6bjDxppcJ7sitTVX2migMqy7f87iuU3Q4TAJPz1KNgODYW1DSNs9MB3RWerFOagvI
	euN68I1mqNTga6chXoiekGUVPeAYJ31EFfg5w0EbsQtfGSMXBKUs/rjnUTAK97nzKAArx8yFAin
	FbGkMzoNim3OQSlZBD42T7v/sb9+9xXoc5Ohk+BmmfxbqQFLJ311cYcxfnUCu/2PhcBgufb5uWH
	3kjZaHAIuNvJzL53UzzG3Cuvqe1mlYB9haaS9aIR/dEigr8sOg9VouPR1OaSXDYO7DUwYbD3Qsv
	g/R6O1qsuRdEPSh3H0g0AJRo=
X-Received: by 2002:a05:7300:641a:b0:304:e327:aef8 with SMTP id
 5a478bee46e88-3081ff62e8fmr1477519eec.2.1781345143929; Sat, 13 Jun 2026
 03:05:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net> <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
In-Reply-To: <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Jun 2026 12:05:30 +0200
X-Gm-Features: AVVi8Ce5ZWN0tgHXx4wgAxeDGhIDTq9KOdKjeJ9s14OzuckvDKwA8hSyjUXURv0
Message-ID: <CANiq72mLqrcdZEAGM1wJ6OE7yUxzDT4dRsYjO91kPzoB5h6mfw@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Create a raw mutable pointer from given base address and size.
> +    ///
> +    /// The alignment of `base` is checked, and `size` is checked agains=
t the minimum size specified
> +    /// via const generics.
> +    #[inline]
> +    pub fn ptr_try_from_raw_parts_mut(base: *mut u8, size: usize) -> Res=
ult<*mut Self> {
> +        if size < SIZE || base.align_offset(4) !=3D 0 || !size.is_multip=
le_of(4) {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self::ptr_from_raw_parts_mut(base, size))
> +    }

Hmm... I wonder if, at least for the `try_` one, we should have `//
INVARIANT:` on top of the `Ok`, since we at least checked that part.

> +// Stable since Rust 1.87.0.
> +#![feature(unsigned_is_multiple_of)]

It indeed appears available without changes since Rust 1.82.0 <=3D MSRV.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I think Danilo asked for the Acked-by back in the first version but
you dropped it since the patch changed, so here it is again :)

Thanks!

Cheers,
Miguel
