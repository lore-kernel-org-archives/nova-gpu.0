Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F03BFAD1
	for <nova-gpu@lists.linux.dev>; Tue, 26 May 2026 18:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821370; cv=pass; b=NfLHtODnndZCKUqe/Ie9Rm4t1vswOd3ZE1v7+IxhLsJTwT1Cf2kC6xVWugzB2dyy3MTpr6yi0B8VLk+AVE94f/iN9FsIMond7seUn40mUjpc9R5vGjCL5PGSIGMLBrv85voXWK2paYH9gr8Ky88ZQgbbgwsgSSm6uk/eFKk4rxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821370; c=relaxed/simple;
	bh=Ee8xVylefUxsgAC7/wUPXBUGosnDj2MjwQFydFBfjuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVj5kM69yZWA6H8hr0anjTkoeZiFqxzAhUw1wu1ddZwmlOpEtjwqEkGzl0LHqYUbNGJh5oiPW4Z+Pa2qDUzxIgxmgiEVc6/s/+oJ/rJQfQXpMi2XSEkbGQFfZIiYA9ypNbmpZb2no/jmVq8CAGKtFUlRFbUfMXHRyPD3SDJKL+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ou8O/c/E; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ou8O/c/E"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3042a99f0ceso525949eec.0
        for <nova-gpu@lists.linux.dev>; Tue, 26 May 2026 11:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779821368; cv=none;
        d=google.com; s=arc-20240605;
        b=LmXQGah2tD54zjcX6ug2gnfbV4sbS+UBSeXC9jwhPgVGZsoY0PV/rVWmfxtx3DCx/s
         mfbCMT1DYVRwikUOZxpRKPy1rVhr9nxah3aJ95Vl6y2ARzlDFB45eh3xJh+zyz8ZaSDf
         3+g8BA91S8E2RGogIH4bpCuQpbYQ4vZg1wboBpdN3ZJB2KSJy+IfAd+35xJGwh4U3cfA
         149vJRga9nuP8vx7/d33Nq+L95VkelYemLU+coGBiLztRmAlVKLwWGON1EXnUF2k+ctz
         0OpKsxp8GHB23ZVwB3b+FGa9LOebdhivIvQ7lO3Vx+PG3Cu8KWqObT1VDShfSyk8LvqM
         SX4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        fh=JeTw5QZXSlqzq2CiBqPFiQmuIyPLekr0wdG2A0mG5eY=;
        b=Tb9QOF6V92zJ2t+HDQVq5+BAhLZKASzecMykyMH/4JQcJxF6LVdsC3NnmikpyucDew
         AVChdJYDRZ/CuGiz9Qn20kNaeqiZ2YYz6tX/fTz8nQssHMuMSFFO4OMRaUcy0isMAV9Q
         Ieeg9dfhnEd8K+OemboHyj1AuOzf2/gNtLF2uvm7YFKoBLhuIYCxQl+0RZqlxfKbfirz
         LLF8Y26iQRSTqt0UFM11QYXUbHSbvnpyUbngUKz/MMCVwxpE8nQxhjZy6pB8KNABm27t
         XQ/IwtsARennlQsNx04Kw7JQdVt6oeBn2adwGdVTlPX0FYeIahC4OK9XWEOeAaai2H2u
         V3lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779821368; x=1780426168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=Ou8O/c/E/0aOruZxSzE0SQWzR9KY2ugWaZqp91YfkjMEU/Fwa54ip/Wndi+qk0FsOG
         7t4j8SrUfKdtXf0P9AZFiWejpA9Ml1RuIBkQYeRHo9mElL4jYEJW5pSya+/fxTngOt21
         yaPG7B4PiCq4r+BoYdbCYxU/W5i6+T9v8NDfsXt78ZreoEtVPLE6JbqyxB6cBMzYl0YS
         7A+icEf/26rBmAaJFl9VdHFUbahc11JGfIlFuC5d8qWauWitJfmOKIeHBWgyp4y0iq7U
         fEISfnSsI301liNxlHjo36z6Dbxp/w7s1zMsUq2VCK5Yb8VciJn57ZEZ7borR1cUG4Os
         ei4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779821368; x=1780426168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gq/O5ZHqDltDecbFmxpc8E+jT5oOcbB4Yuea57wtwdA=;
        b=jogQj3ytOqfg0XaKuyQQq7a3fzsldhymkekhJxY/qqLasGytHSw54i2ca3kTnrx95q
         QYM8ipUwvuEc+bf7ekXtSEHu5pczTkS1S9JLEyDMbvy+Kw/j3RpCbT3XuYkFZgLvvFzk
         yU8CEmE7Wx5be9iaYTnkT4TCm6hylqZALltHaZUHuNZAJNMNU4Ao1XhTJ8K8S8vZEoPJ
         WoVyFzrZxvirPTtPh7wYjZXGafzq4h2PJ1knFhpy9WIcFvg1uYl7tfzVnIo9dYfjdhjc
         15pJz1zXRIHOnamAtr3sd9UKzGdrWm17UV2z+xVc8h73NfgUkJ3zubiwVE5nBBL4/CVM
         9JZg==
X-Forwarded-Encrypted: i=1; AFNElJ9f0b7PeWrGn9NQUOEBRP9RijS6xGN/H+SEfjb3zhyZ974k6+T5+ISDUMkY2ehDvauSvN0I6qOOYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZuTPGF/jYXrMiQ9qAXrQ+t05fyyWNYLBJA3dsR4Pp/eZYhUmb
	YgooBioFrRcgynuEv04lKCF53Zg9s/vDdNnn87VJdj9afF6mxZlMfmUYPvnRFaC1oU24tfavHPs
	iGDWQ54Dg0LY1Btbpm9n1xP05/J5rWtw=
X-Gm-Gg: Acq92OFH01vSCGrs6RUFS2litCo/QJ6pgLCTxt8aHbGu8LN5lMxej81Vd8lZL3Ex/Pr
	7XEtciRvDeLVlvuJfDI5qkI9q9djKgsILLbiJcHowRthY4GwbyQt0YfXYlCw1Cj9mrAgG8CvLwI
	9rqvgZEUkdz+AoXDpEi3rXBsZxyQsMYVAArCD5bb05rOC94kDEHFdoRoTAbn/yGIoTHru2wB2bj
	wwxclpSmANM3uso+G30m1fjJvqiMAZ6Py08fXPKoR4XzIKyb3YyT85xPtliaxqsLQMvwB4Keoq6
	6P8OXDUC3c1y2yByhuNNirAnaxzDTdRa/AT8MmBX5uI5Rthtxz/l6MDkHzkZPgrBLrPwdvhdhwK
	UqDuQpoA6YZUG0NDYVFc7pm0=
X-Received: by 2002:a05:7300:5711:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-30449099a11mr4340063eec.3.1779821368216; Tue, 26 May 2026
 11:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525202921.124698-1-dakr@kernel.org> <20260525202921.124698-23-dakr@kernel.org>
In-Reply-To: <20260525202921.124698-23-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 26 May 2026 20:49:15 +0200
X-Gm-Features: AVHnY4LynmVmerdJFsxXUCWY1urLy48wQB7u14V2mO2sDmYd9U9x9x1s6x7Cz50
Message-ID: <CANiq72=iLUncNw35tpRinUt15W0aqsEiNn+rMcjC3VGq0gx0Rg@mail.gmail.com>
Subject: Re: [PATCH v5 22/24] rust: types: add `ForLt` trait for higher-ranked
 lifetime support
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	aliceryhl@google.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, viresh.kumar@linaro.org, m.wilczynski@samsung.com, 
	ukleinek@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org, 
	abdiel.janulgue@gmail.com, robin.murphy@arm.com, markus.probst@posteo.de, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	pcolberg@redhat.com, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 10:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> +/// Representation of types generic over a lifetime.
> +///
> +/// The type must be covariant over the generic lifetime, i.e. the lifet=
ime parameter
> +/// can be soundly shortened.

I wonder if we could keep some of the commit message around here -- it
was a well-written one!

> +/// The full syntax is
> +/// ```

Nit: we are not fully consistent treewide about this, but please add a
newline before (and after) examples/code blocks.

> +/// ForLt!(TypeThatUse<'_>) // Equivalent to `ForLt!(for<'a> TypeThatUse=
<'a>)`

Nit: please end comments with a period (most in the patch are already OK).

> +        // https://github.com/rust-lang/rust/issues/152489

Linked to:

  https://github.com/Rust-for-Linux/linux/issues/355

and tagged the issue with our label upstream.

> +    // Currently the Rust compiler doesn't check this, see the above Pro=
veWf documentation.

Nit: `ProveWf`

> +/// Obtain a type that implements `ForLt` for the given higher-ranked ty=
pe.

Nit: [`ForLt`] like below.

> +/// Please refer to the documentation of [`ForLt`] trait.

"of the"?

> +#[allow(non_snake_case)] // The macro shares the name with the trait.

We normally put comments on top of attributes, but if somehow that
messes up the formatting or similar, please ignore it.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
