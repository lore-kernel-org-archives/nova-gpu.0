Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054A0353A90
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787002585; cv=pass; b=Qi5Yl+WDRpo8rDiQ9K3BRpC1KPTOY3gmvVta/InSK8NOxsbHDDTL7RKRNIrOCLz5sj2dOGj5I62i1HAzCbOd6JYbIeIrP06t82GKUuZzw05AKlyigGPDQpTvIpecJLTRlW5oUCQjSg1m+qGf0e2ssoPxqNzSDpt/2jtAQ80DmXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787002585; c=relaxed/simple;
	bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7U7LLf5rP8W8Gq0rpcrZtclGajfej8hMXnqwpAoXV9SQgbNFVdaMcoc5zsw5uB6kZg3tIuqyk/zyv9inehEaMzUQ2B+zdD8MRvPHLGZG6viqJ5mMufVfEdo+52qlQvGMfB8KgZx9BrqQhEiQApTscZ1wWhv3Ip5r9XTgdGzvWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCYLfROm; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCYLfROm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so52257275ad.3
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 14:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787002583; cv=none;
        d=google.com; s=arc-20260327;
        b=bhV+h4+g1ywSGU+x3ZuUrp0gTgA+5c+uCVDGr81OA/ceN5XfNWIknQMjEH+aWkYkrL
         HzwJ46ggEUSWKJ9UEUeVdH6Dg6ifmnydbhj5tXihhJKf6l0PbxrGSMtQIiJTPuQeKcKb
         6Xr/jjM9aIj8dhGJO+2df++yT4pYZlM+hDxQlCzSn5Y2DT3BHFD66CpaVmkL2Z7DaeKY
         l8IcVfUd4s2tGBTNtKBk9d1uMOOY9gt79fBz/vHqktlJX8Mi1vEr4lBM0ED/0eUQwmb8
         UtHMM5ypl+kxVZfJHafdoDOOdtVCbdaMfqOHprPefbT7E4aReyknQOKEmIk+KYPVHGMO
         9hRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        fh=vANnwHfs9MaTWYu/VLgWShbCXZXhdK78XWHiQiJflaA=;
        b=GMYgpSiWEfBV7/iR8E3xnYD6aEpRcEdsyIOVhD9Mhx0eZopbFi8dsI4H79sBQYPRHc
         2QC6UoWkXXfX3djs4FiPTgkdwuqR6B340lWx23IqpnvJzgsmdHXN4X+4o+tO1d/NelJr
         onBbBhtX4D5pq24PhRWA6sM5nFJCiLw7j5l+vK02eN+V9SDvC5r5bYp21xEeW4ZB0kZL
         3kfnqshZz5HlQc8UhJUP/3YTekskFTySaokogSfkdBKyjb4Fty8nndY7s65CrrvT+xNd
         datlO+XIqqR+DOWPnudfgHBB07Zs10XINbrX/haiNBZWFPbI9mya3KEauLxP7HalSvSU
         l6pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787002583; x=1787607383; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        b=tCYLfROmtPmbPvvDXOM4YFT0P150iOXYExxlAq6l2GKSKDCDhlDT5ui0FDmHnZ86LV
         peK+dgGw0hcZUHNBGco1TIwo5EWYJ+1eLs0GEU8DJPjpv1v7W3MyN7dARJNZ91LtOz3+
         y27ahxai/VYmQFGwwOy1O2xBFw9yz182izlPuqjPh5fo1p9UmJbQY39v3A/9Vn/ohxnQ
         kssNpLI3Sb64ATH13L2jKrlLxR0jil9ssakD257/HBr/9SfnQ9Ly5DgyzU2RHv/JQ0YI
         T0Ifx0vwsZ3unGIA1eu1gmiFQd0NKQGdzWJFoC6zUF6i1Hrsx9jh5Pqv9Hm4yjIxD4IU
         Ka8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787002583; x=1787607383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Y68zBPMs4znH9swRVTxBCKPvlMjSod2fiik0Befd3E=;
        b=Yg+de51EFw4saRmxYh1ko3yTGfFKZ/ZdviBYH71i2OOaFc7ubcczp+IPgp2yhzEx6j
         +LT6zg/bipMIN2tfTr7I+VteCnSBxYx+YiwlFCEWadUyPpnIGxWe9rmeYbOspPHCnBrv
         onhwC6nrNmtbJKE+mg4c/Vqpm5pUIEsMrKb4HDea06bI5fRo/nxGTuRxCLpa8B60Sk9D
         Rfl1rzy6g4M+LfGtdBYvDHuTvb/FAiueJwBxeqxqATWvRVLZLxZ5tuPx9Q4p0bfrkguV
         NOIH/N+YkI276rWpF9bE6CJE3tWZaWNFCOF5deR8qrMFaKy4sATYhZ8DJpxipQwVjVq2
         dKCw==
X-Forwarded-Encrypted: i=1; AHgh+RoyvbdQ48qndoHUNL8T6lgVyyxzQbFjkYiFgoUECWOi8L4Qib1sOf3LlitKCeeksRrUxsDF1uzhuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6mfoRkbhn+lJhHZ3deJI1rrlUuwcbwtXK1U1GnKwtRmsS8mpZ
	ucMOGOUy0VqCAr+TQqjCVrekv9kRfTT4ekPPFZUJ4bZBuOxAmBFtS8yAtszoeKU8a+t7TNnvVr9
	/NwwctTOZbQfNicmsgzNpghKdEV1vyfE=
X-Gm-Gg: AR+sD13ThquzR9J6TfJy5WBPhObXgyG7ok6HJt5ojcX4gnqpYXtqrOBn8AgIpB4prkn
	t6P31dO2nm9cR7Yez3zg/gx8Z0Il8GqcUgiLoqp9cCCwhFLjbXFuY+azH+GLydBdrVBhCub5vX5
	FDC8NK8BvYkpxeQC+cdTEgr+fk9bwbQsCeqf2UiJOv9QlRpVDjinacXQaVwMcQrT5Y4KtCMZ0ab
	qSdqA4FuhJBU5LiTCuRwUOTr6Cd1wtrCqb0I45hTaqFOtspv8dAM47V7H8myZumaPdHI/Hp7ft8
	F4MY9mZyIk7dkYVbRxPY8P4Hfc/vd7mcX7sy0Jq2PKegyhMTUnkm8iNCBNpkBCB1Di1oo5VNb7Q
	J70b2SiFNsblYp11QAyni/jBMRHM3/M4pF/eYWdnY
X-Received: by 2002:a17:902:e54c:b0:2ca:329:3da1 with SMTP id
 d9443c01a7336-2d3b0f3e8b7mr293499905ad.16.1787002583324; Mon, 17 Aug 2026
 14:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com> <20260812-chid-v5-5-6c767770b3f4@nvidia.com>
 <anzxKO0X1OrNRD32@yury> <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com>
 <an4NvQBt3389jP6E@yury> <DKO414SNC0B2.248FUBGJGSPLU@kernel.org>
 <an4xDp29VX8Am0uR@yury> <DKOAY7J1IFTP.DMKSXK625EW5@nvidia.com>
 <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net> <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com> <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
 <DKR8MCRB76L2.1TV4D7261PVTH@garyguo.net> <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
In-Reply-To: <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 23:36:10 +0200
X-Gm-Features: AcwNN1XmXhLOponMxlBCxSPGSKMVYcO46R_BeY41tQkqF8gOc9dMzRGpz2Bx5zg
Message-ID: <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Danilo Krummrich <dakr@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Eliot Courtney <ecourtney@nvidia.com>, 
	Yury Norov <ynorov@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 4:08=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Aug 17, 2026 at 3:02 PM CEST, Gary Guo wrote:
> > Now, with `NonZero` or `Bounded`, we are doing none of that. The only t=
hing here
> > is that there is a range restriction. Other than the value restriction
> > themselves, they carry no other semantic meanings. How you interpret th=
ese types
> > still fully depend on the API that accepts them. Therefore, it is very =
common
> > that you'd be using these with literals, and it becomes an ergnomic pai=
n.
>
> I agree that NonZero and Bounded are on the weaker end of the argument. B=
ut
> there's still the flexibility argument.
>
> The API itself, i.e. alloc_area(), does not need to bother with how the v=
alue is
> checked. I.e. is it a runtime check, compile or build time check, or is i=
t even
> unchecked (or panicking) because we can derive the invariant from another=
 type.
>

To add a minor point to this, if rustc could figure out that a
suitable non-zero number literal can be treated as NonZero<usize>,
we'd not need a macro and it would all be very ergonomic...

cheers,
- Burak
