Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F23F6C3B
	for <nova-gpu@lists.linux.dev>; Mon,  6 Jul 2026 12:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342015; cv=none; b=OT/aY2IFsnwzyQ64+xXNB8tuGUwhD9pYFJ6kV8TKz6G5Uzg0Hzp08V9BQ0jMOFVI4WSQ3uixgKog4X8VB0Ml24Af5mcibIII04c9g4UvYXea/ai+pbz2Ld1o7CHUD0Z4+Pi8dpxZJ8qmvM0CdyRpZxv4d+dlUuO8MWrXednOMnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342015; c=relaxed/simple;
	bh=/dqoTYg6+fCxwhN0KROjyyeiU+qZU4d6g5TG3/SL/p0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N0Ybbfz3wVN7n9MCcpMbRsie9CpFFHzyuak2+Bw50/13vBIfSU26J9/kSoYeUoIC8dfgWArOC+nqUKG+TZ6UMlOkumigjBP95COZlk3zXIK2shjQFkDcDb4y8UWMxUsJyCye1xD3fNCQ8M9rBv9/pyh96KFQ/H2iA2nmDxy0gF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MYDt+XNs; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MYDt+XNs"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-698557ec1e9so2424597a12.1
        for <nova-gpu@lists.linux.dev>; Mon, 06 Jul 2026 05:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783342010; x=1783946810; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w4Q98ESFsm5V2q2RxX/fy6rfondgx2jkzF1eEys7nYs=;
        b=MYDt+XNsnd1k3DYRphCFsMRRzmqScdqMNFcHv4V4ZwxdTaN5peXgykMc4Be6Q6Zc0U
         lHYr3beifwq5Z39izDThG0uW1jZ1SGAbQoJOppQ6fmjfXDvxJfw5FKB9RaBpHNfAd9/7
         Rq5SbMgNOxzZCFwJppRHra/VyeMxBbgcIl/338B/2hZ2BbG/Wq/4SHDzBs2UeenBsEpC
         M0+PV5qVw6HvQnw06XZ2+a+oza5425+IjNPJ7vCkxb9kGzAtXuSY0LKEEZnUDqfFJgdN
         6FltAI5jtFkU9XHpukVzkxmzNbkzC6tdBY2PSTPV1WCP4/tYkOCiHy0eNDjkmneTvJJU
         v2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342010; x=1783946810;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4Q98ESFsm5V2q2RxX/fy6rfondgx2jkzF1eEys7nYs=;
        b=EeExJP3rmmDKpW06Z0/5eu+RvyAq24Pk0kVcyHncqEJyqudSvXrjHyr5qWuPLgmZa6
         B/To61MBVx+eV6Lin7BPzLBj7AnUOFSfGTElD4l4wZPt7pyB0H7uJKh1RJ04XKNQOw3h
         EVdgw1wO3igSOQa207PBdDafsD4djjypFIlKkzul6/p1eWj/ympl4YK0rVKNKfo6Yv1Y
         qA6Gp8vje3hVfMjPTXCbBYPqnphdyWZ3rRHjhO0LHp+Zy9LgRxP9ksAZtKl0JiLvfGGW
         2jFNHvwoZdV2qCmdCu5kYsVJKyOuaNyqjA+0wmblLbyEZMsZRqjwYiszovLlSkZaI1UX
         tVgA==
X-Forwarded-Encrypted: i=1; AHgh+RrW9jFAJ322SJt8VK0q7M0biaZWedqHF4zWpy4RxSXgnqytEXCIa0GXUcp8awzqYi9RI3M9i6qJzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyiW/W9u67CxIMJkxU6OtugCmgILqfa8FwC6/chJ+klbjUe+SqM
	pX3hMYo47FFH5xeN3lCVd1Cm2nb7D/LlKydFd6AtV/7MqCcmf/45mlDSVReNlp2HvNPR2Qf/hku
	r+CRyFtU9wR37pw7yBw==
X-Received: from edbev14.prod.google.com ([2002:a05:6402:540e:b0:699:e9c6:5556])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4015:b0:698:ad7f:9383 with SMTP id 4fb4d7f45d1cf-69a85b93b10mr266244a12.14.1783342009416;
 Mon, 06 Jul 2026 05:46:49 -0700 (PDT)
Date: Mon, 6 Jul 2026 12:46:48 +0000
In-Reply-To: <DJRGUGMD8CNG.8DWRHJ3PRH3Q@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <akuV_GRAM4QPqf-o@google.com>
 <DJRGUGMD8CNG.8DWRHJ3PRH3Q@garyguo.net>
Message-ID: <akujuAJOZxRJlQZo@google.com>
Subject: Re: [PATCH 0/4] rust: Add support for reserving of ranges of IDs
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 12:53:24PM +0100, Gary Guo wrote:
> On Mon Jul 6, 2026 at 12:48 PM BST, Alice Ryhl wrote:
> > On Fri, Jul 03, 2026 at 07:16:03PM +0900, Eliot Courtney wrote:
> >> Add support for reserving of ranges of IDs, with a usage in nova-core
> >> for channel IDs. This entails adding the helpers+users of the C bitmap
> >> API for ranges of bits, then users of that in `IdPool`, and finally a
> >> user of `IdPool` in nova-core, `ChannelIdPool`.
> >
> > If you need ranges of IDs, perhaps you want the maple tree instead?
> >
> > Alice
> 
> Any reason that the current ID pool is implemented directly on top of bitmap
> rather than using IDA?

To some extent it's because that's how C Binder did it. Though I do also
think that the bitmap fits binder's needs pretty well. Almost no Binder
processes will have more than 8 handles in use, in which case the
BitmapVec is extremely efficient because no allocation or pointer
indirection is used. And the bitmap also performs well for the few
processes with many external handles.

But it could also use the xarray instead. Nothing stopping that.

Alice
