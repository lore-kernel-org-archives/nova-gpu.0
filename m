Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D80346A08
	for <nova-gpu@lists.linux.dev>; Fri, 10 Jul 2026 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693417; cv=pass; b=Mk8V70RGg7lj6X5Te7JyFcoXwj2LfU8A9We3fROwpZ6tHGgf6MJBTN0Zu2Fn0gzPJPpoWNEga/QAKyiTtNwguL9I0HEaFXcqYN2mHBEuKNunJ8X216UssQV8LFHw4+io5eXplBx7ew58envRV1VAlJ0lrHn6fuqGJiuOvPr2GeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693417; c=relaxed/simple;
	bh=GUhA3jFSbJcIsCXMljVbvLOXIxyxqgu1sDVkQU4+pPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYccOiq3GKPSEGKHfOttqPZcp7H2eWoCd/m+4pEwk89X82wHpF3O7rYtP2CKI048oPnHnI8TB4rIng9gIGS9GGOk+gMOodAjgXvM3EfK9Fj3htTB9OOrCx/rSrOKPWkMGVoiw4dpD9WVjLg3EK2cFzn2sH4Wj4FU4hi+BOTTzyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i0YwvPm2; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i0YwvPm2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-475417f010dso492989f8f.2
        for <nova-gpu@lists.linux.dev>; Fri, 10 Jul 2026 07:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783693414; cv=none;
        d=google.com; s=arc-20260327;
        b=l72PFXFxWQm9apJbKdNIB4of/mRcEdMbTZLtZ9wtAEZO7yYGHszlPzQ0FvocwxhteR
         YQMd02vJb52drr8+0Z2kz0l/9XD+MK5woOq4xTpQZQvnSsdIsNgPDYASazdwLkQyYUBY
         r/rzml4s7Y/2IARirtJeAlEoPFzZWV3GlUAcTfPOfUfIJgkd5oTDQ3qKaOVVsMq8frEt
         7zrgecIfV8BZ1t6vdC3pCR2bd4kZ5nbPQd3UQgTzYn+pTKdTWmSOK1u1wXec6UH3pabR
         C64xHJvjtdk+9FWC5KX2zsjpwXl25r2v/v12JZ19kVC1No0pO1OZwMCzs0y3NM2g0zOq
         HOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        fh=JpNissZUx3VOkdM/OtPNDh30gr4Gps5GgWqnsJygXpw=;
        b=k9vV0OPPSCdN1FZn2RfLyEG2wVGWOeVz/rLik+jFojnhXjiA1trKP940iwIooyvHru
         h5WsQ+AVnKFvD6qUSr746W3xOzEKUcke7+j91ZiYEHt5pIdeZwFCyX2QT5SbWSStw4q0
         aYo9l/ii3RFA3QvOXenO010SlUM0NcpZIT44YcAQIIxsoYYG9bz/JQTWMhmWY7lPmfXj
         IW+vLjjQo+8zNNI40mOaciXQ/rd/CSNXLc4IUZUS9PEvKMp/mRu8sXDjKwkSbNRFTYXQ
         I1rBKOnXxe8hha88vhKNSh72Ky25yVdKnCcwPHLYBHkEcWUd5dLNOZJWz5RJItsUL3i9
         r5RQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693414; x=1784298214; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        b=i0YwvPm2z301S8QGGcdiM/GfrG587IACjOcSxVMblrGiYW9C25H4CdX98RMRs6XhIO
         +qhYaeQ4bsDFCVRoTr5t03ZDaSj7B/aWXsrhy5DkM0CCQNIclZvQASLTJS99Pzsk+VKB
         hErGjbp6T6+As3E7c+NcLb/Wat6WSJYKK4NsGDm1vIk2004JVWRVxmiQoVRPOYpvk/CE
         RANlV9oS/OJNwa+JbKeq+ATVSENsf1KEeGSaAfaC5mddlKpS7aKA1yQybOSkT+0wYMw5
         EKRwnoQ99BcSzIkNp59fpwx419MJShytVsakJNRZLWyEu8dExGjdylDZfiiCOdzbFREw
         uMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693414; x=1784298214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        b=FNNqlOTGNYK5qrpW81LI+hncyMEwLKhLW5Sk0eH0jmloBOtoM35UalDAvixl2hl0rI
         fD4gpaF0+U7qUdfTRfPZbNwBpeWShtEbUyyZonX4lVz1p72Q+9l8cFnTsUcs/uwzzRgF
         mpyJ2VMGzBpDYh/f6rrzjxVscaD3FbgCQq+JQ8kiirI5HtwSAdqYcYaF0Zsj7Q54sk6q
         Ly1cg8hzzS085vyNHxqYZGlkHT3Pt/jQ3PBXQeR/ocdSZRq7/u0ahDfq5WeXITS0oM4S
         LbUtkKCTtPoamu4R8VwTfNjrq6AYj3uxfPKe54X+sWqkzwkq1CdWlKn7jlfFf60EEuTo
         iWBg==
X-Forwarded-Encrypted: i=1; AHgh+RqffQKhEN6zFkl6lIRf8Kwd6dn25Lvg71ifJtlTyJ4hxhBT6hMwQoly4XajpBeGzm2om8WVVYD+7w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAratapT80f8OxEAtPR/IcsWi8tOvFjbMUeomk0+rWNnGB7WMO
	dn3rDEjUDk6dvRMK+Ui1mGA027RdiEZ1eBTvqulmnAweT200tnAujF1mQstEFPnk1XWVl8eVhXE
	xNEUAWFvJk/4uPq5VoG0caAWgFWB16SK44T2QkmuR
X-Gm-Gg: AfdE7clBAb62gqSgbPtlzJYR1zLEjJsj2Xe3QdYE5jaLRaedNbO6DYcklqIGBGulwrP
	w7gpfgjs7Hbey4HhmximqR+7oGJt7FCWHjNOBlTW5pYBNG6ujJ8O9w0KFLFzY90NpPGXl75JbcU
	3ZFzRp3XoJ5D5MZezYAv5vktBukW1yC/22a6377tb24Z8HsTDa9iDO1k4m6uw69Z5MXBBd52tdD
	kBR6DMRcXvzrjmoynG9dXK0CIVkhB3jSHHFboY35ToVe7G+FWxKS7Cua7o0FmYPTg4TYoHCLOGk
	0aZIb6bqL35x0RDKsH0V6RfS8BcJC729RBuTAhxnQoSWSTMXnPibMAeAg0U=
X-Received: by 2002:a05:6000:2482:b0:477:6874:5415 with SMTP id
 ffacd0b85a97d-47df074605amr12898798f8f.26.1783693413737; Fri, 10 Jul 2026
 07:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <DJUYI5EL9MCS.F6LWYD6821YM@nvidia.com>
In-Reply-To: <DJUYI5EL9MCS.F6LWYD6821YM@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jul 2026 16:23:20 +0200
X-Gm-Features: AUfX_mxGtzRTvhuK561wSbk819Xm8Or_NDy_i70dNzRqnXHoPTSZcfN6JkQkc_c
Message-ID: <CAH5fLgi3tndgpVc_qNMCxk4PCB57EZLf9X7OwpEr=mg8FwGf7Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Yury Norov <ynorov@nvidia.com>, 
	Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:21=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> On Wed Jul 8, 2026 at 2:33 PM JST, Greg KH wrote:
> > On Tue, Jul 07, 2026 at 12:31:08PM -0400, Yury Norov wrote:
> >> On Tue, Jul 07, 2026 at 04:13:30PM +0200, Greg KH wrote:
> >> > On Tue, Jul 07, 2026 at 10:25:27PM +0900, Eliot Courtney wrote:
> >> > > On Fri Jul 3, 2026 at 7:31 PM JST, Greg KH wrote:
> >> > > > On Fri, Jul 03, 2026 at 07:16:06PM +0900, Eliot Courtney wrote:
> >> > > >> Add support for contiguous area allocation. Add a new type,
> >> > > >> `UnusedArea`, following the same pattern as `UnusedId`.
> >> > > >>
> >> > > >> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >> > > >
> >> > > > Why isn't the built-in idr library being used here instead of ro=
lling
> >> > > > your own data structure?
> >> > > >
> >> > > > thanks,
> >> > > >
> >> > > > greg k-h
> >> > >
> >> > > For nova-core in this series, we need allocation of a contiguous
> >> > > sequence of IDs with a specific length and sometimes a specific
> >> > > alignment. IIUC, IDA/xarray do not support that (I checked
> >> > > ida_alloc_range and it only allocates a single ID in a range, not =
a
> >> > > contiguous sequence).
> >> > >
> >> > > For IdPool before this series, I think it could have used IDA/xarr=
ay.
> >> > > See [1] where Alice has posted some more context.
> >> > >
> >> > > w.r.t. the structure choice, the IDs we need to allocate are chann=
el
> >> > > IDs, and the total range is limited to 2048 of them, so IMO bitmap=
s are
> >> > > a better fit than e.g. maple tree.
> >> >
> >> > But again, you are having to "roll your own" logic here, please reus=
e
> >> > the data structures we already have in the kernel for this type of
> >> > thing.  If a maple tree works, please use it.
> >>
> >> I asked exactly the same question when Alice and Burak added wrappers
> >> for bitmaps to implement their ID pool. This is the answer:
> >>
> >>   An alternative route of vendoring an existing Rust bitmap package wa=
s
> >>   considered but suboptimal overall. Reusing the C implementation is
> >>   preferable for a basic data structure like bitmaps. It enables Rust
> >>   code to be a lot more similar and predictable with respect to C code
> >>   that uses the same data structures and enables the use of code that
> >>   has been tried-and-tested in the kernel, with the same performance
> >>   characteristics whenever possible.
> >>
> >> And now it's in a commit message: 11eca92a2caeb
> >>
> >> They measured the affect of their wrapper on performance, and it appea=
rs
> >> to be ~5%. See lib/find_bit_benchmark_rust.rs.
> >
> > You are comparing the C vs. Rust data structures here, which is not wha=
t
> > I am proposing.
> >
> > Also, is this code being used on a "hot path" like the binder stuff is?
> >
> >> I didn't see any side-to-side comparison between any native Rust API v=
s
> >> imported C bitmaps. I'm sure, I asked for that, and I still believe
> >> it's the important piece of data to avoid this back-and-forth type of
> >> discussions. So, Alice, Burak or anybody...
> >
> > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm askin=
g
> > to use the C structures like maple-tree and idr instead of open-coding
> > logic around the bitmap code.
>
> Yeah, I agree that using maple tree avoids piling on more ID allocation
> implementations.
>
> Channel ID allocation isn't on a hot path (absolute peak ~100 per
> second, on average < 1 per second, AFAICT).
>
> I prototyped the implementation using maple tree [1]. It has some
> awkward points:
> - Allocating aligned IDs needs a loop on top of
>   MapleTreeAlloc::alloc_range + erase, which essentially replicates the
>   logic in `bitmap_find_next_zero_area`
> - Since aligned allocation may take multiple tries we still need
>   exclusive access in `ChannelIdPool::alloc_area` to ensure an allocated
>   but about to be erased non-aligned alloc doesn't make it look like we
>   ran out of IDs. Alternatively, can do a try+restart kind of loop
>   instead (needs adding bindings for mas_empty_area). [1] is using the
>   extra Mutex.
> - The alloc_area and Drop path of `ChannelIdPool` now allocates memory.
>   I *think* this is okay but it is a consideration.
>
> These tradeoffs weren't obvious to readers because I didn't include
> enough context in the patch series (and was going to add actual usage of
> the aligned alloc later).
>
> Anyway, maple tree does work for this, so if you prefer I'm happy to go
> with it.
>
> Thanks~
>
> [1]: https://lore.kernel.org/all/20260710-chid-maple-v1-1-4ee869055268@nv=
idia.com/

If you need to make multiple allocation attemps to handle the
alignment requirement, then I don't think maple tree is a good fit for
your needs.

Alice
