Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA353C2782
	for <nova-gpu@lists.linux.dev>; Sat, 11 Jul 2026 12:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772925; cv=none; b=ftRBMPGMs8qmMQkkWdrRAIJk8SA+fgF3yKrUtZwJrHZc1eVOZR/auVIvSySdirjSP6O+/wUt7ertulWRc9aPWIxix+fwldnK2XlIMdDlsRtjAH8wpjcKTL52kutHeyiVfEoMQ8fuuqQkP8dospSxj1to/Va/mhJtrWm2Ia6ahlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772925; c=relaxed/simple;
	bh=QM0bVPxlx46ODCacqIIoJuIOnDtNgXJ0Hb7nJeo8Aqs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oQaMlVUZwCD+R65AsDZZ6aXO0uDVNetJMGhXwvGT6JQ/YxRa71V5+Db8ony1zvUk/5EXHJqUgrCYfINXARRroniDFN8tYGGULalZh9r56jG1mmizjL+x3wmI3VX2rjnRIhIaTf5JNeAqEyMkhBmvhZO8T06LPdxeEPuW9rZYz7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KIZGI/5g; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KIZGI/5g"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493e3ecd385so17196195e9.3
        for <nova-gpu@lists.linux.dev>; Sat, 11 Jul 2026 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783772922; x=1784377722; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zqV6pU7J/up3BiO4WkzdnwyvKk4FnHi04KFj10WU3o=;
        b=KIZGI/5gUvDfx7vmcUvdKTJwQRbOLh4mgTOLgDT2hw/WgKOxPa3BcnhhUofAWM0/VV
         rY9OmljZqyQ7X8n3XxP7qG+r47kwJNsAuiTuuBNQESjhWuKynHuT7Ec8HvSWacs+5/R2
         DL7liSdjAiDxIL1aNW1L9/FNiEE/98gvRR7bcinQ+Ir0WskPLqQl86gcQbYadGZnoMMH
         iqEEdjvKShRsZwrikhQV3S41jUFl/F97WgY1L/pPXzjUsKh3GiiulJlKPGIsPrY2kaYi
         xUz6QoKrS+n1muAd4+XX7hcQcTSUG0bq1DW1MRroc6LUrp5HZiArFZfjrC37YOAtlBhZ
         qzpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783772922; x=1784377722;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zqV6pU7J/up3BiO4WkzdnwyvKk4FnHi04KFj10WU3o=;
        b=caaHCj8J84gjOjbVzkEsjfUsvW388lpWBq6EeuwwXBaef4RRu4i24/K7yqvHRE783b
         Fz9iCtmI6W0wCw+SGly7CPnmBDkHHxavhaiMXFTki4UxjqdeBCk+20Fon/cV/IXQPHy6
         KYVvEtjgR3aJMtQgiPFhfgpKOM5ZlZTL3ZvUjV0n5stqrOgQzUb2vlYibZ+R7znvejwQ
         MBgFMHi/dNJIxkDjhHtN8riHQjgfkSDWKU4HWKOwz16Ug9XgG2Ql9Xiypy5BTs9Y9Mqr
         yWHqDTECiuuaXrZvZKjc04DvdlLUbxZQRT8rkJTeYn/jyts5rdhud4S95Vk/gGoYqa0M
         s4sg==
X-Forwarded-Encrypted: i=1; AHgh+RrD2LL24TJZ+RSpwSYED37N+3fh9C5KCFuW3/uqhqF841VTDHfIRUzeAyfKTvGMxyLtpHFjD97jgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQwusPRmkAiYQmtM7QWVQ7sNe7SjzEjsDKCdGzapfJH8jG60X6
	QQtS2epwZK4TYEpfRBMn0T9NfXUf+cAUxXM4DgvOTSaKx0uPwwsQS15802oNr+EZYm9ppQsh0Gq
	JU57KPWyH6Hoo8v1aSQ==
X-Received: from wrue11.prod.google.com ([2002:a5d:4e8b:0:b0:46c:d068:1ef8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6692:b0:493:bf84:53d8 with SMTP id 5b1f17b1804b1-493f87e472cmr24827145e9.9.1783772921797;
 Sat, 11 Jul 2026 05:28:41 -0700 (PDT)
Date: Sat, 11 Jul 2026 12:28:40 +0000
In-Reply-To: <84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260710-chid-maple-v1-1-4ee869055268@nvidia.com> <84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvidia.com>
Message-ID: <alI2-KaHDTmUvNK8@google.com>
Subject: Re: [PATCH] gpu: nova-core: add ChannelIdPool
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 10, 2026 at 02:29:39PM -0700, John Hubbard wrote:
> On 7/10/26 6:42 AM, Eliot Courtney wrote:
> ...
> > +use kernel::{
> > +    maple_tree::MapleTreeAlloc,
> 
> Hi Eliot, Alice, all,
> 
> Eliot already laid out the maple costs (the alloc_range+erase loop
> replicating find_next_zero_area, the extra mutex, allocation on
> alloc and free), so I won't rehash them. What I can add is why the
> alignment is a hard requirement, since that is what seems to make
> the decision clearer to me at least.
> 
> Pre-Blackwell, USERD sits in BAR1 at page granularity, 8 channels to a
> 4K page (chid = page*8 + slot). Giving a VM its own channels means
> giving it whole USERD pages, so a VM's chid range has to be 8-aligned
> and a multiple of 8. Blackwell moves submit to a per-function doorbell
> keyed by (runlist, chid), and the constraint goes away. So it's a
> constraint we're stuck with pre-Blackwell, not one we can design away.
> 
> Given that, the bitmap version is hard to argue with. The aligned
> allocation is the one call the API is built around, roughly:
> 
>     let mut ids = self.inner.lock();
>     let area = ids.find_unused_area(0, count, align_mask)
>                   .ok_or(ENOSPC)?;
>     // area.acquire() reserves and returns the range, drop clears it
> 
> One lock, no retry, and release is a bitmap_clear that can't fail. For
> 2048 IDs the backing store is a 256-byte array. find_next_zero_area()
> is also the existing idiom for this (IOMMU, DMA, IRQ), so it answers
> Greg's reuse-what-exists point as well.
> 
> I'd go with the bitmap id_pool.

Completely agreed. The loop in this patch seems like a really bad idea
to me. If the maple tree doesn't natively provide a way to allocate the
range with an alignment requirement, we should not attempt to hack in
support for alignment by looping. Please use the bitmap.

(Even without the alignment requirement, I think that the 2048 size
limit is also a good reason to use a bitmap, but the argument is less
strong in that case.)

Alice
