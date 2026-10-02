Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ABD4F5DF7
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960388; cv=pass; b=Katud5DRlbBR3uHgA+4boASeg+xnvpUHQUX5xNccFTtuWtfXMz1k3oTXYS4FMBBsrgxVf4y1/yTVMNrNlPz97rzAfT3GVu+jzQD3oCUJJrOv/8H2IBCPQNi8xlh8J9DI5ZBtgpHrlu2VnzbWQ2dbfL8QZEHjIPO39ziae5MLcBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960388; c=relaxed/simple;
	bh=EHkJtd8Eu6RlYIDachMsn7gB1X9/FWHuhTARdLq36AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o1Kkg6fd3bX+i+oyctBkh2Re8Kf6U8Sr8/qyuoQKgvb2eBbSvlQ382ZdrIY2Nu32bEHsZcL7oG9H0ctLYQPcyjqDQdsqoGF/ktCgZlRoBrJylZ/7YmyY5yjnmq8iBrK04xkp+hig/WS/0guYNav0PV0VzDgHTecHlJgOxibFlfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6ySJgHZ; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6ySJgHZ"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso1188945eec.0
        for <nova-gpu@lists.linux.dev>; Fri, 02 Oct 2026 09:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960386; cv=none;
        d=google.com; s=arc-20260327;
        b=TNqSIFSrNBXN1mqRu1O3eRAC7o/YBYocy+NM4NnR5rwJV/RfKvr6yD8inu97n1NVE/
         aNPCf4wgoFs/ELexJoF5ksEBWTpVFPD+ojTaxCevJAM/LnVKwqC+vRbZfpA8plNX0EtK
         5dZ5z3Cdkx2Vve/pcGDicFHRwbHm+Jdxkwo/SBl3V8n6gnAJzmIDOC262sCxJWs0+/Bx
         cHA2HFsLM/DUBuc2MGNhAR9PwT3IxCtx+yKqqFIqWLkULUZMPlqjVsKGq2o2BbkRfC0P
         deo9qMQ4E/jzKo3dww2A2ffdYZ88lfGAsC51Vb/pzD4hp4m7l/Hb2HnnFsBkpzXzZ8L+
         0tEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        fh=sKAosauINRZ5I0iwcFknsTSAq4pn24rJGkZOJUHFKH8=;
        b=GuF/V+JH/Xfkr+cYGdDvr3QI+D7ktraVjGUi8QsLvClje0S5ZgahK/i5SYivlvaXDG
         JZvZrj+IbrA2jQXbYvDtdTvcJUBdmRgbn9te10o0BafhH6989jMP8B5H5s5NgY0Ibqqe
         MIoKE8brXz6GRKaqgr4BQ1CNfwLcvywFCXes3pmsoSPydbde2oTSbHIbZExQYg2OW9Gl
         +hyYZwnC8h8SfSyUq9WI8PyuSr5Xm8C8ddz7OxsFl/W/N5uQgAjxIaLSMERlqzX+FeaF
         o4J080b8qHsuLzvlhVvxKx2BWrXK2mZHnW2u3iFCtzpqXFQueslXh7sIy4Me6WCxILwX
         vxmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960386; x=1791565186; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=d6ySJgHZxj362HyGZfg06uaME+igXnmtS2FiOdSbqBdRxK+c2PclrEvThjtFzpZx19
         Ry1mPUADTvz8M8NRVwIUAGis0AyuonAfzGbi3wvg3omDbNjGZSBvEPoh/MVRI9awZFVE
         rwKMek4Jgrx1KLX6ak7+lnPQ687s0KSZ6xhUzXjlXdHDnu4t6Gw7gWAXGzW+vnqvVEWG
         oUoT7T3WlRoBla/JfE8EZf61RluNsII+Zqjf/HVoBF5fgarvN3ZNhgPtpjoiKJdsE1Uk
         jn7p7g3yN+ZAx6bNIZypr3cx1lYjF5BeDIQ+ev3y0lQkqqE2CcuW/6EgAguiy+v+dSqD
         pWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960386; x=1791565186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=Rb1Vw9APw5P3M/4ksAO//Bns7t6yf3jMtA2naSjxVYtqWiGVVbK/V4NMlp5cGcu6Ml
         wBLSdvkrwbDQKBypiNock3z8vHU6OFSS+DNifQKbBPGGwR0JtukbCYlqrMxJvKabmytB
         KkjieCAt7ITt7ixUBwTrQqp2vizspVo0MbZLL4bzwl8m7fw093nN2rGhkKbJz8J7qDSK
         GgFcQIToD49GQxasOSiHPFUxd58V6RPOLRGfUyvJuC2jiktB4R5vl8kTHFxD2Vm7TWnY
         dsI7RVtNCbkzzYngQVpD+rsS+/TRy+1a0Xi6tYld6Mn8Pl31w/gdb2l1hk/Knh8ZCuLu
         KJ0Q==
X-Forwarded-Encrypted: i=1; AKwUvByCVRfdO1LUSlGvKcDrhkxHiRUKTWMDI8nmKKD52dEJeUpDxGzZuE4s/Y7cMHOkjoPXo01b8dUGxg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJzyCuB2f9/ON21TtOWxkNwvJeirxVhlQ+NV0HKyzPcNZOQaM5n
	qxsgnURPeH2zgwFQyo+poUSXqIy0eIgcL6sIa73IVJYhe7PvNoKLO2RhUncLSCQIqT6yAhi7/hY
	SaxbWsSNv3NAt/QxiS84BgNWnmwp2ztA=
X-Gm-Gg: AYBFou0kfAu/Y0Be/JWuxm7MBuVgCsQvC7VPZjI8SoG3kRgKTpCQudYBetPenq1UfLn
	fGZxHQ+nX7dSEExobxkbJcdmrGA0DHB0EFtAj+KZnE22CfBqk90DJVARcnXXHcOLZ4MtRwZmDTa
	Ccse5hY+1m3YLSF1VmXYLeMIj7y/AK52PiV5cW/pt5twqbyOr8uf2cOW8D5edtsM+JqTnUlohrp
	IKbKBFNpMLSm4PT0rerfUftytD6D0/nry+AyJZhxmQk2BAGJHYcabmqOZm/m1grmd2bGgNYZfNM
	cD88aF/IKXBIVcMUThAGFS/Y+QSNoV3gJA/nkXfFObZ0A9mwjGwrUkzrM82nPtebJ4OFsZ3OEEi
	r+8Q+KBowClj6tDnxPA9IgACfqwlZQ7acBECUQ7eOwGow9cHfCygCf59rQxvYD1POeqLqaImy3j
	9KqxG34AUJLyZZhJHHULXuhtA90EAvj8b8qs559/HvrejeE4okZlinGDkHI6/1fg==
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34f1507015fmr4716231eec.2.1790960386330; Fri, 02 Oct 2026
 09:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 18:59:31 +0200
X-Gm-Features: AclHuK_QhqfJYiyMedO2piq5-wcrguEMff8QxYGEopB8UiRg5ASf89kljYpIsb8
Message-ID: <CANiq72m0PLhT=-ODzQtX7k3jn6=XXpESDUbnHcAmR-1gFqR7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as

Word wrap or newline?

> +/// Creates a value from an integer constant expression, with validity c=
hecked at build time.

Maybe:

  ... a constant value ("cv") ...

since we explain that in the commit message, but not in the actual
documentation :)

I would also say "at compile time", and possibly mention it is usable
in const context (we use "build time" for things like `build_assert!`,
which can be much later, e.g. link time).

> +    };
> +    // Using `FromConst<V>::VALUE` means const generic expressions can't=
 be used, since it requires

Newline between these two lines?

> +/// Types that can be created from an integer constant expression valida=
ted at build time.

Ditto (please see above).

> +/// Implement this trait to make a type usable with [`cv!`]. Use the [`c=
v`] macro, not this trait

The second intra-doc link should also have a `!` for consistency.

> +    /// Fails the build if `V` is not a valid value for `Self`.

[`Self`]

> +                // CAST: the macro is only used for types up to 64 bits =
wide, so `MIN` and `MAX`

"CAST: The"

> +                // CAST: the assert above confirmed that `V` fits in `$t=
ype`.

Ditto.

> +                // SAFETY: the assert above confirmed that `value` can b=
e represented within `N`

Ditto.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

One thing before that, though: are these assertions expected to fail?

    const X: i64 =3D 1 << 31;
    const Y: i64 =3D cv!(1 << 31);
    assert_eq!(X, Y);

Or:

    const X: u64 =3D 2 << 31;
    const Y: u64 =3D cv!(2 << 31);
    assert_eq!(X, Y);

Because that is quite surprising, especially since we say "with the
target type inferred from the context" in the documentation.

I hope that helps & thanks Eliot for working on this!

Cheers,
Miguel
