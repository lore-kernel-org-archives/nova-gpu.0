Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA13955E2
	for <nova-gpu@lists.linux.dev>; Fri,  9 Oct 2026 18:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571726; cv=pass; b=oA7jZnc5W10ZuEmLmhB4biPYRlIb9tZWSIA2Tmni7+98mMNznDqCWXxIN+wagGnbIjuEqOvUk60XaoIcbJ5x4D1LLARXKSkgcb29DptV3XmCvspXWHzpym+tv2/JizAeGF5oc4FIiW0ZtwDTNj/qen/52KGyryMnG7cMCNN8AaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571726; c=relaxed/simple;
	bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHy6KR/PDUAlNM+Z8gnIhDw9+HU7zRCOS5NXanQMet+P77l+XKViD+Uyurs2SGADnWDJRpPAl6IPJCANjGwiyDt3C7ehYNTj/4C7Vb1i3WKpnlnZNlEUeWXK3ydjoOBx80ekBgUNVcX8koBSKtq7uL/SyWG8SqQUuzsn1ccwM34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfZevYOH; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfZevYOH"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3515f9a5d25so30473eec.0
        for <nova-gpu@lists.linux.dev>; Fri, 09 Oct 2026 11:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791571724; cv=none;
        d=google.com; s=arc-20260327;
        b=RSXIJLQ9mMGdi8k43Mvi7UZw8hhydj2zjpcNZH9Uof+eX5lcRbJh/OufwwR0RlB77O
         SBvNuda6qqeRmiiPugvd5O8Qx+3z4A/g6VcmlGlgpY1+yxKT9LZ0rM2U/Oj8M6ZzOu/2
         obZme8LEtpnK8CI/HPtJqMWRgW7MYk+e8zk4vtqEcfjbLiVbm7emvwX1uFW3m10cqa/6
         ZDm7AdNz7wFYefbdzt7/V8rwYY1Cn89R+1+n04WCW1doeXrLHlBTeDAkQQKWtfbGF2wA
         tEosuAjK/Ba1G8tlthtLo/D7AcHIoqPyI41GCBnpP3HjSCvhRwOeGiWoAus1AP0lTC3C
         mASw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        fh=x4WD1M04DcYQNZXZWM9ZE8v4afpX6ynlISXB0SlxJZc=;
        b=Be56L8noj8fKQDJvWJwIyrq4NT0GjJ/jxXR1pQygp4wrke4Y6Wh3UWZAH0Qc4YMT6b
         heIel/DUWjwWSSlUsbkfOU10yP8XM+eyYW6b7YifGb00rTt1125IUhHpB4SsNJWf9bOH
         9J/53wuqYAfmK7u8wqbcJR6/4GiORzLBCmMzcap0107M3elkjUUp8rNyLqZMY9jS2m22
         tkba63RcDZzu7GVEe66IvLcI4MYcd1JJ1TbflJYdxmmpxrfCM4W1H+VoYtY9ZxO5OSyY
         wdAlqBnbGivYig/eTxvzjJ41VqvnyyIjUiygmgzuHC6abGBfe+a5eiKpW8RW9tyLHPiP
         7UGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571724; x=1792176524; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        b=AfZevYOH47r0TfRgFmXc5oSFcQdjFmbOJ6fPBnDbZHUl9QZjzjzSy6fWzNm4xLvyC9
         wIc0cyUUyDPaSp0gt7P9CA+6GL9aVit9BmD9GEEedmW1H4qPbQODh6CnlgYIEkATtd/B
         p78KYhRQhbC0ks0/mIhVz+cFOuxEMgvyid0lygK5vXCtrWPinnHMKMMwL7nnq01E0PJl
         TyH3E499/xZJrUMSLJzOWhwqfBK0bcmBu6lAd8JtgncI9mYEBhAN6R/r8gEpWhzPURxO
         S4IPJwi5FpQ93Etcz4wx+va4QRoUUQFLNOAbk6roRISuPfO1u1y/d6n0h+aY0PWgfYqW
         vMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571724; x=1792176524;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0l4CaaLZ9zgaLsOego2cb1kl3aoONQoA1AOZZaKe/2Y=;
        b=iQi3JQUm2ux6ftwk2QND5MBwfiJS/w+whK2wEhYXkCB5euldzDoH9HBpWPuavm6RuQ
         kRZKCyr2un8E9ZoHKiMvUnnJlGL/HNV5ncKbOyan1+34vCuRt00HO4+ZfBQw4XpHRkw4
         I4tGui0stuoGHfjveVp5rmAwRzjocgZ7apcz0e6evobGTHO5bYaBFms7hru5ElUpDEtv
         AywsPljjZopePxctpevd0IhG39jJ+rQewxE/9FKUbn1LkgzFs16B2ojXEAbbtzStBFjh
         TSVM0Kt2x4FrpkUn/tJmZAfuiT3g8XM43amac10+dSKUYWZjdvnjS/XbAjUCZeXErJPW
         31RA==
X-Forwarded-Encrypted: i=1; AKwUvBzu9nk0f594JXUv+1wT4qLlU/b/PeTKHpPIndO7yH3VZSAdOYOy/lcSCIa4r+2IPtGYjcNtpyL8XQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUOvg1HZOX0QJLG0ahg4VrQSZXhcWghaNkhvEGntN5IbaBGoKl
	rB4GLJpIP084DNf1fsL9qTbqV5uiVadCgP115tnCzYymQgZP3na8IY1/ilb2aBRu3W5Z0I3xkAC
	3ui5/025BCIRz4l9isZxBpbbmQUh/Z20=
X-Gm-Gg: AYBFou18PLMvBtBbClKwLCIam5NuNLPXtPuexnYjKiGXvEtWQPQyraGTQpv6PfbrRWz
	Jw6ChO2cBOLSNJ7KyxjSAyX8xZmgFbCOR9pTp6CYlAwNg2N5lLE6x0ZQYUr0nLIM8LA41g+j1i+
	HRxHp4XvGl0umu3dnl7nWBhr8VYwCsMu4sX4R5THa56Cqg1o8t8kxBv7zkTK9py675TFbo/tgpu
	11GSpOkue4F4RmRi0wo4cDp8l8bwjsNvwvuCB8a8ZvMeMNZShMyomUVV6C8pogSPrvCLcl2aNXQ
	1CcSlRpsJIWLpX/4xu93pPdmZuRFAU9M/8k8Zn4CQk28mX1YPjTa1aZ7TPSNi8xsrE7p2RqucVf
	WoWUMCGF7RWOUmGyutneL7lsiFaYhPWgLV3YN3rIjdA==
X-Received: by 2002:a05:7301:77cb:b0:356:b370:a0ee with SMTP id
 5a478bee46e88-356b370a395mr1072744eec.20.1791571724058; Fri, 09 Oct 2026
 11:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-8-0d6cca376cff@nvidia.com>
 <aryYkkB9j14xnWo3@yury> <DLTA93JE6VF2.37UGB3SWU6ID6@nvidia.com>
 <ase7IBtZjQsPVWSN@yury> <DM0D75ZTTQXJ.2XADVI38UGH7C@nvidia.com>
In-Reply-To: <DM0D75ZTTQXJ.2XADVI38UGH7C@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Fri, 9 Oct 2026 20:48:30 +0200
X-Gm-Features: AclHuK8Xj8QHFk5-TbzyPwVsH20KRa9KXwlVq0lwopsd7qnglTdkhqow-XI0c1A
Message-ID: <CABwQupMVzUOsqP_fTZQdwUU+xEO1k2Q4=RQQuq2qd5HCYY0ZUg@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
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

On Fri, Oct 9, 2026 at 4:07=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Fri Oct 9, 2026 at 12:47 AM JST, Yury Norov wrote:

> > If you still think that you need 0-length bitmaps in Rust, can you plea=
se
> > give the clear and thorough explanation why rust needs those 0-length
> > bitmaps. Are there any in-kernel examples? Any language concepts requir=
ing
> > it? If not, it's still a NAK.
>
> I don't know of an in-kernel example, but please look at the
> `bitmap_vec_new` test which has been here since the API was initially
> merged last year: the first thing it does is create a zero-sized bitmap.

Well, yeah: I wanted the behavior that the implementation rounds up
documented so it can be recognized as intentional.
Later, the `new_inline` method was added, which is a clearer way to
get the largest non-allocating BitmapVec.

I think the problem in this discussion is that we want to treat
capacity like length, which is maybe suggested by the BitmapVec name
and its len method.

With the minimum capacity behavior documented, it is as if we have a
specification right now that no IdPool instances can ever have less
capacity than BitmapVec::MAX_INLINE_LEN bits. This patch here proposes
to change that.

It is not clear though why client code would be happy about *less capacity*=
?

In other words, why should the client of the IdPool have the right to
control the *exact* initial capacity, even if it is below documented,
free-of-charge minimum capacity?

The IdPool, despite being backed by a BitmapVec, is not meant to be
used like a vector: it does not grow by itself but client code calls
grow and shrink explicitly, and client code has no control over how
much that growing and shrinking happens.

Like, you cannot grow to 65 and expect to get a capacity 65. So why
insist on exact small sizes?

> It is also easy to imagine a user starting with an empty pool and
> growing it on-demand. Having the ability to create a zero-sized pool is
> convenient to avoid special-casing user code, and in this case I'd say
> expected, just like you can create a zero-sized vector. Again a size of
> zero does not trigger anything that a larger capacity cannot trigger, so
> I don't see a reason to forbid it.

With an initial capacity of minimum MAX_INLINE_LEN capacity, it is not
about forbidding, it is that the added capacity already comes for
free.
You could say "not enabling" instead of "forbidding", but pretending
that the capacity is somehow not there does not seem to buy us
anything.

Do the other patches in this series need this, or can we just drop this pat=
ch?
If they do, maybe a demonstration of how significant the special-case
handling is that can be avoided with the exact small capacity could be
part of the commit message?

Cheers,
Burak
