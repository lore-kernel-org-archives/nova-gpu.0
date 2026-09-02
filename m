Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1800F39EF33
	for <nova-gpu@lists.linux.dev>; Wed,  2 Sep 2026 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377910; cv=pass; b=nyuha2lqxYXuYjdRUnl5HI7WqF3y+z4Cov+j3C/S0g3XdivXDJ4FLck5b+IgkLyD+hgA5hlSjR1l/91swRNW3Z3o/dhe6H2PK4jQ93dCEz0R7pJmC1Fi0SGGZd1zhb3Qi8Z4kPv5osMeuzTJT3WjMvcN4B4mPkUCktFQKj66zT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377910; c=relaxed/simple;
	bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bu8+8ynxowUhqE+/1FUh6ZQLVpRJIexmF4IHp2fFrRCL/w1VN91c9OXnDAUD+gnY7Ls9CkivwmjNZFb/6nZ42ZaS742cA5wBwHfKKU0vpqK69x3/+zVJkq6vS/hVeSwbP+aqT13bO9XXTkv5U+JyxAtXQqlgaweXhkYxavkLWEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TnSPP08o; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TnSPP08o"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e7fd978beso21854516d6.1
        for <nova-gpu@lists.linux.dev>; Wed, 02 Sep 2026 12:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788377896; cv=none;
        d=google.com; s=arc-20260327;
        b=HbVmVX5r3FlTV/dJXc9iNn9DGgvudCdy6HJRcyNbwZLt8LR/k2KNv0mvESXca2Ux/f
         wfS3RmhYfeARpSdvHekwap8P0mOsj1/22AUjUpgypq6uP8yNZ4HptfCUvGdLlNvanvgt
         X74rBfrWlFqLUDDwj2sqHEZfuJdmfVzXFwPAKKNo46ZVHinypmPsIWU/mBXoUN12t45H
         0l+9+MF+1MQnDAFLHqHf0n9A1RY0gfUcvimi8qIDWsGB8pEWAMg/n12sDpEpv6jgbIEL
         NyHeEQy1XNx2Dv5VIFQ780CFJ8z4Ag4i+ixlfqeDczWO5P15MYE0ZcIdQTrRMjvcyNiU
         Qi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        fh=7dHWc2G7lAn+pWcBq3DfJ5WEd4NbZD0izLso4FzyDCE=;
        b=tDoeiyj1814nq9K2Koa2ZqUFojexA4alyiNL8tzcNrCsxhviURUVGMUwl68DMHwEOD
         ixpuPAbwiqO1s+iIppfGANL/3HaY0PxSvm+3iV/KmPy+jLLS3R+fQBNz+fB+BxizKM4Y
         QDdcVKXpBI2H+5IjASVwBdzHyZ5q4X8CmytvvhdJ1YnyBTJXjaR3o0n/0+H+Sq+M+nml
         UVlO14AxamMLt0pBEC8lF68ZwSAQ/nDIUzEUx8Vxs3i27xZj2bgux+DqVZMpY5oY5yDJ
         5PuQKXU9FfY8A01yy84BIMdBKmjnef/ZgxTXGDurBuXxwTLJOLZKgpmusmxG7p38NUNy
         IgEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377896; x=1788982696; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=TnSPP08oY/JgqH4YI3VwH0cZJy8k9ULAe0JahyL8c0bhWJSIi+GNgOQCi2Du45EBSE
         YK/q+Hr/jgLOmcaQEutA6TWEzU8XWGFBq64/mrcZVQWYeJYpJPTabA/TeWEfb7AH0wVn
         A/gjssxUpZHDxWIN3atHEVM/mII7Ibl+w3JWi18yqge1xWTcCqECXUb89Qm5lt8WkLq5
         hVjNC1BkoiELwNVtXRX20mgEsShcs9e2ujzhN5pdPd2nBN2Q9BkCCVvnTqbB0ebzLXKo
         H7b5VHsgOyNEynmWsAwv9C6gXsMGC30u5hliD8TX+LM28dYDyTA0qwSCelO3Xiix4HAE
         JW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377896; x=1788982696;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qi6IviIPOnYguj19GkTxZ7dEwOM9cpzsCiuJk6eQ3R4=;
        b=rzCHTJGiaKAbihuUhE9Dm4HyeoLFCc6u+OcS7rw8yuWGQr1CcwzCZ/rt8Zahng9TW2
         /H/NtcrNYUiUViSy8ZWMMAKoLJ4Zg107h0pBgzD2IP41oXjo/DisADR7cnO6o8bDRvzd
         CxPah+ii0cnP1sDHs1f+4NGKMzVb/KVZ2X+PP0IGo9MZy9OXHYxd9uLIkZz92wdXVpgF
         +ElwjLgGZ+j+pgTXXIn+4JrHO/UnMvmS3ZBdmXgQQF3IVuzwtuXFJsuriFk63+haKMj3
         4EIMoKnK5fYsMQMjO1q7yvXAh7gTmKR3j2tMQX4VUwJEq7WCEuvX/GbXD2cfNC+D4k3z
         udhA==
X-Forwarded-Encrypted: i=1; AKwUvBw7AB33MNU93t4lkJNxqfz8eX5fDpltnmMhfD/Tupdf02I84wbGIRuNjt5J1x/WIfhcjTpRC92Hag==@lists.linux.dev
X-Gm-Message-State: AFuF++kB7XSfuZHqxXefkj9PT3uG3fA5qBlCMpaEK2JnMqazNbrdDamm
	48zbwInuKZkpIJRnXcwBU0Ju3anCaGEBH/x2CuhoJnCiQssZFk8BulIyUfEzG3zRswM4Lpn+nF6
	grTgfbUgb/c5sl2yjlq7vwGCwzlYVUms=
X-Gm-Gg: AYBFou2Ptsv8ZDkWNAknrz16iKALX77flxjp3B2kBTJbukJk+8wpiWipSYY/1qAlmL3
	C5X1Q49nNQkCZOFlc7d6i5RwQ7pq5pHZpHZiTg1MsRm/E0lc34Wfq6cOMO1Gl0Deu39XBGHKLps
	J5HXN5XXnkH2Hdn3hSLxpSw85u0qSxCN0DVROPiN3Deeo/Og/rWjvzlVwOB9ZSAo1ulqmK48wXS
	Wx2iyNuweU0Y26rarwk66qHI//rqnMctCmNe+vgsrKWUVYcK0avyHBTUk+SAdP+ClCGu8i9RMK7
	aUgjQgBOuAzmCM1PwjeFApkCluoe0KQ/vqUsWdoWJ+7SYmJs7GxBB6g8XHtXaGtl/fd0K5yryZt
	jXYGRFgdCA+rXjrFs+YkbnFLlJeD4X/sNnNw87vUl
X-Received: by 2002:a05:6214:2123:b0:908:951f:415 with SMTP id
 6a1803df08f44-90ebb005390mr85498866d6.13.1788377895624; Wed, 02 Sep 2026
 12:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
 <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
 <apZbKc5xMQ1yTBTu@nvdebian.thelocal> <DL3SXIIA4FID.2V3K5YC91RM3V@kernel.org>
 <apetgjQ9zWpJATj3@nvdebian.thelocal> <apfJhtr6BpMosz1q@nvdebian.thelocal> <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
In-Reply-To: <DL52TB47MFFY.CICXD0XQ3T5K@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 3 Sep 2026 05:38:03 +1000
X-Gm-Features: AcwNN1V_5ha_snCzThXD4CKKNnM_EsprQAGBXp8YrnRXkYcD_qK4vrhdwG6Bj_k
Message-ID: <CAPM=9tyXx=BVy9E6PZNwYwab0SWWpFOFgX2jktqPVumiqY2viw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 05:27, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Sep 2, 2026 at 9:05 AM CEST, Alistair Popple wrote:
> > On 2026-09-02 at 15:21 +1000, Alistair Popple <apopple@nvidia.com> wrote...
> >> Ok, so just to double check are you happy with an accessor to return
> >> gsp_static_info as well?
> >
> > Still interested in your thoughts here though, just to avoid churn because I'll
> > probably pick the wrong answer :-)
>
> Yeah, exposing that for gpu_name() seems fine.

Though userspace doesn't probably need this, but we could I suppose.

Dave.
