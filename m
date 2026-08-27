Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B222A4766A9
	for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842542; cv=pass; b=DysQV/o1z6MHZ1K1MpiDBMCkExnl8TDNMXu66LfzHvkj38ji8nP/H2t49gGLUdU8gEKD615VZTV8dGnXvGCeE0z1SWLLsGQO2/0RpmiIErsY10gLnsWx8GwiA66JF7t+LSdyLiL1dXTQOrWsHwFZ5Q5eu4Mzk5PKWaeJF6e9CXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842542; c=relaxed/simple;
	bh=j6Sbc277CLq+ttnOcBKE4l19KOSuBdsv4WwvfnBjzP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pV73jSeYXM5MERLLGfmvQoAcV3FVbIgu7ipk5ri6zIWNn1+aj/grPkL9ClrRbOETsbeBwro9eEjrXDAetdiuSN91xEFNhsFIl9NQtli7vbGYQvi0PmKfOc79WOBDNhFBrEpiM2rVyWHBJPiPNO4vJyh4N0uovHui42zWkb7M0FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPultFh9; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPultFh9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e5733a5aso1134589f8f.0
        for <nova-gpu@lists.linux.dev>; Thu, 27 Aug 2026 07:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842533; cv=none;
        d=google.com; s=arc-20260327;
        b=nP64n7pg1GgubAP9dFEY997nAFF3T/dLamUc5UhnLjO/polKPhQeUumfdiO8W0YZRD
         cQ/Kqn0Upg8UW1lPOU2xRi4HHWr05ImFy+TGWsOMU42cj7Ze5f0CrSxO5kiPRNiODElZ
         QPzabm7Ibo/fG5PjnWRzNBNFW8xeGzAkYb3Pzur6UxnccOsgvvIW3vamLzd2090iFRXW
         gnYNsop1SKRnpM/OxtAEvCws2DSa6ES+1/q7DULlicNU2C54t5lgcmQjMn6l1N5PFX6l
         eBVB7Shcf/58DNEaUGE/9CuwAPlpOTh6050w9CyeVpx10+lmI9hoZrOfX08G/wj2Z7nl
         jJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        fh=JudmYh2TsMc8pTNXXIFnOA8yK67zKvZkbwhb/VGx9zs=;
        b=Q172bUcW+2MCqTmByh8yOb29ucmr0ZWDc6J5pKwYhQNnZmYAqsCaIQsu5Ond0NfqH1
         coskJFjwcpAZwbc0qmGd15AfnEn4ZnWfzhEGn3e5rhzig6IVj7BD69u/kYxnk2B9iw/O
         q3IOhipRmNhuhKHfw0rsBU/TYseuSPpUVsLUBjtBpv/S2mUU+SqJE7QsKO5S14kk8huu
         QEMKiuLQekuDdfJu7FEtd5K4JigL+graTEivuImx93WUbjCjlC1cDWJR6OKx64PmU0eT
         BkndOpvQEvnG23KikYadj/6mMGfzCzu4GL88gJlNhVGfUV0eF5/zzwdxsRy9n7dmm3wi
         isCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787842533; x=1788447333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        b=aPultFh9YBZ4ia8Y/boG453ElkB04cARDNf1p1U98TVZ0UydBbwnssSYLQplA0OX2U
         zJ3Zb+YGJgAfaM13bjkhUvvjWLi35zGUE/0gBt2MbSyT0iHllWeXbACYBkgMQVQ+b3FC
         9vm71XBt/wSysED8tcQpg/ViNHGatM84IdC36jhXPsFay68c6coFjW1u7MtZbVQHaYLb
         YnVScsuQ6hP/BMM1wC4nsEc3A7x5oHUgY9FrosODJhTExXUIUYmq2olKeR2HVj3KEg5E
         hDY+2aqbc4N+PPlmFLCgp7AvXsyXC/enKH6/86VRJap6NskT5WwQECOyrYfNSfXz6fIr
         In1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842533; x=1788447333;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qVBhIMzhe7WHb1kI7rr6+dI+gx2GywitZXgSUgINjAg=;
        b=Y79xWfXfbQE6whpD17h2iQjM29y2LIQKiyJGLKnFUl0MlkLXuvC2m9QR0W0ZF5G9e9
         /YM/NUDtIseRg9wCyhLdCkNhoPgZLCttUAeTCWZJFs+DmDx4bb38CKrXb1yauyrSahoy
         i0bW/x3cUOJ3g8WpHH1NnXLSptFegImrkqBJOZDAcE0j4jzNuhY3IDAQvt3Noqn2l9Iu
         U/kT9C4Ro8fRN+BE2SKGZ1b2fPFQXa4Gx1ctMTYKONbVKPQZNgjY+YgivxtlBv/TpTwi
         bFqkXkz/bF0kFuY3fjAyO1JavJMuOFvM7dtabWAveRxdyobhSze5/xOfTunDc29N/+W8
         cm6w==
X-Forwarded-Encrypted: i=1; AHgh+RpCx6H25vJual3bSoDLEEsk/1oJbAaSJBBnZkaHPNeyz8y1np0tCc1GJLSOMUpdPZTDlx9so72f5A==@lists.linux.dev
X-Gm-Message-State: AFuF++loZR5C5u3sR50oImaFOm6z1e9PLSWC55+cvaB4lFJAn54c4YLf
	2QjmJ6uXv6eVCh/JEVdP2igG9xk1/FyV9943NgKpP9jsbCXEpGwV8QjZlwbBOhBP7zqlOkUjDij
	OyigBNH2b0fYip9+VCJeJMQbkRt2aSvDnwVJvoLWt
X-Gm-Gg: AR+sD10bKyW3paaOcFvKtybx/KHy8Vfhf0UottvKln4LQ2lRxakSz6bhNUE84cPVuVR
	2YbT7zfAySnUZuf9Ac0/iOt/g5AOSbbeI6gey3ecaLZngUi38w1sn5GrrMudYywFVbl/bGkAzro
	F43ZzFF6VLCFS7fGaONrtK2wHR39Ix6FfPScNmo5p5DAkOAAP2pMKpsyxHklNejOEbkME2ehjJD
	BZMpCPvFoR8d0WOxdi4N4HHaA//UlXTyVdEVegW8zaV1tBhtdXNT2rh7mHThUbrdcz63qN21ZLm
	q4FSbA+gDDd61SjKqUu7wk/St6R2xu69f7cXXw0noBMh92noD57dEd1FFHVy9PS4ypNFFsRMaU+
	glfByn6lTetqmkySXoTZi8sh1cBf3gmA=
X-Received: by 2002:a05:6000:3106:b0:482:e2f2:19c5 with SMTP id
 ffacd0b85a97d-482e2f21d8dmr18185624f8f.4.1787842532050; Thu, 27 Aug 2026
 07:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260827-chid-v8-0-bc74c77d0214@nvidia.com> <20260827-chid-v8-3-bc74c77d0214@nvidia.com>
 <apAEK9CUZICDTL1i@google.com> <DKZNWJZTS063.3Q91LQ4LNE4Q6@nvidia.com>
 <DKZOJLLRFT75.1967F9U9JUTVV@nvidia.com> <DKZRUNURZ645.1R1EVJ9ZEXFDE@nvidia.com>
 <DKZSPZS1CQ29.11DHEBVKWF21O@nvidia.com> <DKZSWB7OFDRY.1QKAIFC1QP9RA@garyguo.net>
In-Reply-To: <DKZSWB7OFDRY.1QKAIFC1QP9RA@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 27 Aug 2026 16:55:19 +0200
X-Gm-Features: AcwNN1W6xr0Wm3p3I71rq2uMxpgrJyrhaLEP44TiP1BL4sxWyBuOjb97Iy1a-84
Message-ID: <CAH5fLgiGcOn+HQLj4w9yDc31V54PbqNUQv8cUFRoEuFzQrAAZA@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] rust: num: add cv! macro to create values from
 constant expressions
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:37=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Aug 27, 2026 at 3:29 PM BST, Alexandre Courbot wrote:
> > On Thu Aug 27, 2026 at 10:48 PM JST, Eliot Courtney wrote:
> >> On Thu Aug 27, 2026 at 8:12 PM JST, Alexandre Courbot wrote:
> >>> On Thu Aug 27, 2026 at 7:42 PM JST, Alexandre Courbot wrote:
> >>>> On Thu Aug 27, 2026 at 6:32 PM JST, Alice Ryhl wrote:
> >>>>> On Thu, Aug 27, 2026 at 04:28:31PM +0900, Eliot Courtney wrote:
> >>>>>> Currently, using NonZero/Bounded constants is quite verbose. It's
> >>>>>> unfortunate because it disincentivizes using it in interface bound=
aries.
> >>>>>> Introduce a macro to make it nicer to use. The macro `cv!` (for co=
nstant
> >>>>>> value) takes a const integer expression and widens it to i128 (at =
build
> >>>>>> time only) before passing it as a const generic value to a new tra=
it
> >>>>>> function `FromConst::from_const`. The trait is implemented by NonZ=
ero,
> >>>>>> Bounded, and Alignment and lets values of each be constructed from
> >>>>>> constants without a verbose turbofish syntax. For example,
> >>>>>> `const { NonZero::new(1).unwrap() }` can be written as `cv!(1)`.
> >>>>>>
> >>>>>> Suggested-by: Gary Guo <gary@garyguo.net>
> >>>>>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >>>>>
> >>>>> This doesn't work in const context, so I don't think this is a grea=
t
> >>>>> strategy.
> >>>>>
> >>>>> I would want to use it for cases like this:
> >>>>>
> >>>>> drivers/android/binder/netlink.rs
> >>>>>         const BINDER_CMD_REPORT: u8 =3D kernel::uapi::BINDER_CMD_RE=
PORT as u8;
> >>>>>         const BINDER_A_REPORT_ERROR: c_int =3D kernel::uapi::BINDER=
_A_REPORT_ERROR as c_int;
> >>>>>         const BINDER_A_REPORT_CONTEXT: c_int =3D kernel::uapi::BIND=
ER_A_REPORT_CONTEXT as c_int;
> >>>>>         const BINDER_A_REPORT_FROM_PID: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_FROM_PID as c_int;
> >>>>>         const BINDER_A_REPORT_FROM_TID: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_FROM_TID as c_int;
> >>>>>         const BINDER_A_REPORT_TO_PID: c_int =3D kernel::uapi::BINDE=
R_A_REPORT_TO_PID as c_int;
> >>>>>         const BINDER_A_REPORT_TO_TID: c_int =3D kernel::uapi::BINDE=
R_A_REPORT_TO_TID as c_int;
> >>>>>         const BINDER_A_REPORT_IS_REPLY: c_int =3D kernel::uapi::BIN=
DER_A_REPORT_IS_REPLY as c_int;
> >>>>>         const BINDER_A_REPORT_FLAGS: c_int =3D kernel::uapi::BINDER=
_A_REPORT_FLAGS as c_int;
> >>>>>         const BINDER_A_REPORT_CODE: c_int =3D kernel::uapi::BINDER_=
A_REPORT_CODE as c_int;
> >>>>>         const BINDER_A_REPORT_DATA_SIZE: c_int =3D kernel::uapi::BI=
NDER_A_REPORT_DATA_SIZE as c_int;
> >>>>
> >>>> `const_as!` [1] should do the trick for this, provided you don't nee=
d to
> >>>> create a const `NonZero`.
> >>>>
> >>>> [1] https://lore.kernel.org/all/20260825-const_as-v1-1-1ce712225fe2@=
nvidia.com/
> >>>
> >>> ... but I agree it would be nice to be able to use this in const
> >>> context. And there is an overlap with `const_as!` that becomes more
> >>> obvious the more I look at it.
> >>>
> >>> In for a penny, in for a pound of macro code as they say. Since we
> >>> agreed on using macros, how about unifying both under the same `cv!`
> >>> macro, with as many branches as we have types we want to initialize f=
rom
> >>> a constant value? For instance:
> >>>
> >>>     // Does what `const_as!` currently does under the hood.
> >>>     const BINDER_CMD_REPORT: u8 =3D cv!(u8::from(kernel::uapi::BINDER=
_CMD_REPORT));
> >>>     // Calls `NonZero::new().unwrap()` under the hood.
> >>>     const SOME_NONZERO: NonZero<u8> =3D cv!(NonZero::new(kernel::uapi=
::NONZERO_VALUE));
> >>>     // Calls `Bounded::new::<{ ...}>()` under the hood.
> >>>     const SOME_BOUNDED: Bounded<u32, 2> =3D cv!(Bounded::new(kernel::=
uapi::SMALL_VALUE));
> >>>
> >>> I.e. we would have one extra matching arm in `cv!` per type it handle=
s
> >>> instead of implementing a trait. The syntax of the macro would look m=
ore
> >>> natural (bye bye `const_as`'s awkward `=3D>`), albeit it would have t=
he
> >>> limitations of such a semantic dispatch.
> >>>
> >>> Even the name `const_as!` wasn't really accurate to begin with: what =
it
> >>> really emulates is a const `try_from`, and we even discussed
> >>> implementing it in these terms in the future.
> >>>
> >>> I'm sure the idea needs more polishing but I think there's something =
to
> >>> explore here.
> >>
> >> Yeah I agree that const_as! is similar and if we had const traits we
> >> could fully merge them and have it always work in a const context for
> >> both duties (which are really a const tryfrom as you said).
> >>
> >> I am not sure about the suggested syntax (e.g.
> >> cv!(Bounded::new(kernel::uapi::SMALL_VALUE))), since it seems very
> >> verbose.
> >
> > A bit, but what I like is that it looks very close to what you would
> > naturally write if you had const traits (minus the unwraps), so you
> > don't have to learn a new syntax. As long as it's not *more* verbose
> > than natural Rust, I think it's fine.
> >
> > It also has the benefit of relying less on type inference, i.e. `cv!(5)=
`
> > requires the caller to specify the type even with a `let` statement,
> > whereas you could do `let v =3D cv!(NonZero::new(5));` and it would wor=
k
> > as expected.
>
> Even with const try_from we'd still want `cv!()` to avoid having to write
>
>     const { Type::try_from(...).unwrap() }
>
> I think having `=3D>` syntax is great because it is a good place to *opti=
onally*
> require type annotation.
>
> For enum repr for example, I think it'd be great that
>
>     const BINDER_CMD_REPORT: u8 =3D cv!(kernel::uapi::BINDER_CMD_REPORT);
>
> would work directly. It might need some tricks, which I have hard time co=
ming up
> as I'm not feeling very well today, but I'll give it a shot over the week=
end...

One could potentially define a trait with a MIN and MAX value
constant, and then implement cv! like this:

1. Verify that the value lies between MIN and MAX.
2. Cast the value to uNN of the same size as the target type.
3. Transmute the uNN to the target type.

Since the trait has no methods, this works in const eval.

Alice
