Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7FB470E89
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 20:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997650; cv=pass; b=Q70XX6PMWhTkxve5H6yWx0/JvRVz0KNYFKwIQ+tZktGEuOqORtHyMq6l8uvH3IlflJzYoJz+44DMJxP61Demo3nE/xdqap3/KUvdGWKcZV/KEB9yo3fFKnVJ54ICBunzkyTuYu8VyAGPpoYx1WnE1NuZGOE+oLWFKguFMlK7y9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997650; c=relaxed/simple;
	bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWTmy24i0yLffGnuspvNJxOHaf1Nodm8nBzWdv9sfwyWmmiqy9ISDl3Tvd9wqpbniFF0xmeIwj6CT+OhcUy7RuAjV86FPQ8o2RvW2F4R5c7pfJlhmAcAlLkvWphiz2wsX4+HsMiN1vBFaKZa1buqY/bc9R2pJrqxuRv25uEKwMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKOm/hHA; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKOm/hHA"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbb7926836eso2731533a12.3
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 13:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786997648; cv=none;
        d=google.com; s=arc-20260327;
        b=UZM4LpGVaPEVKdQh9PXz8MOBAE93UDKIkdkKRUhsHmKByCNF//H5tXvd1nplwTqFOJ
         xMxbJsWVvwAEFpb8Yr3vczZHy//2B5fvNGjK7ajkH7b5yRJ+dGgVHqkeHJ4oO2jmsf8n
         wfH4GudAb3auNKFfKFa+CAM3NxV0jEn5fkrR8E83IZJdy2/ldwOc3sGfhhelca927TYw
         iafC19luUSo2hSDgjBKXSeHS6/rUwgovcfZxQOvVG+lh+6e+rKc2duPbOWABg3rycR2D
         MR4xpQvsJPJYFvZVOj9qQA9usrOj6QPW47Ldq5jx2/qqHJ26vJfob+TUWfrtDcUco2hu
         nbfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        fh=4QPFiTyzYD41CbyYti8/T1Nmxk1jSmD03z2yplp94Ko=;
        b=dY8CzH2KFLs1klCiE8dbZHwJ6UXdNgEwyXc4h8wfYxhMrGQ2rikE6kCHRINgl0h8uR
         8ThLHWXocYLm9cWdCAOSZCZIC5r/54kUt9FdwennY9VlaXpZtpKutA2Rct+YAU2YZHMm
         esqWRRtDr/KcXUiqsrLvjQ6vopVMLLbdcxFeu5yTFNpEKtK/O98hYfowvCRfXxqfGr7e
         APKEN3gRxMkbLIoM+DnwXa56gjxIu9rBptKP0VR8UgYUotpfSVZ5ezl2dpY5OUOe+Gjv
         MRByJfinWRR5PiETatDFMgYifUvtXRsCBtzT2vhX9UdKjVl0P8wVXQvcUoC8weIysc3d
         /0lA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786997648; x=1787602448; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        b=MKOm/hHA0/t85k7OmFit1MCXatS/NrsLuVRHbLcD1e4lAX0JZ3xxNjzo5s57XnAiZF
         hu+3H/wafNn/CT65nR/APsHJ8v7djC/NAy/19wop90wI67TDXLAmKIFD7tcRGRkX9yPF
         RwmG+cOElTDcFhtsE65B5Kfz01/YEtoEvBoKA3evjOIk4znG1t0eVtTe7wBQj5eoOaKK
         i2FfSFcZ0E1GTaIMrUMffGUPWXqHWap7lzuQiY1P/LaheTJU9RcSbtw9wr67UYHeBQCP
         3wzl1LHM8XCWHxalbKDl19mRn7OMqZHiKqMrNFS38L8xH3GlvYp3ZaQr4qwhVoceffM6
         L5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786997648; x=1787602448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLVsMWdtExaM9s+oU+lazgOsPzVgtcsSdhrjyJ2RQxM=;
        b=jMGueSsGq7oTnzSvxItv67GTLuMMqSDc+DmFWUjDf0QCwsVjlU4oF+UVXbuGIHria1
         7sVgcl9eua0THadGxJfgIjfb3J7K0ZNGRu/wdGuNcCQq0swWdibRNRoOh5lpk3qQG+zQ
         S4vqgexPSJ+HgR3IMeWZDRhBJRWzT53ESILWNkVhcjw11MUE22QpPfknn/UrD3R6Jwq0
         j1SZfVaAUXaDjclytwnTWayBoZU181mUJ00+pcz1MAF/3fKv1lSt1IfxdZm7fg458wCi
         e8uW1wG2AKezcrQU9mcMWMbbjvuWbfaDP4Xi2mS1s99t8PfDaYZEQNE6CexAVojFze2f
         zNTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rose2MB8vVUhkN4NZh2l25TSEAL+mQvZNgpkFRAHg3SZqoaMqtsZptcMxLu9SJqaWzhWtV8r4p4aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyT3JqY8TnkeD9N6Hn4kehqE0Baub00OF7bbV68m6xex/Sk+GkH
	JEikbjYEuqnfc2M4Y/OtbGnD8J0pkQqSf9j7PKbGnm5DoRhu/edzXnH4zAdVAJUq2aRC1/s4bZK
	s0gx/t6HeXeOqkkbhRaku8Bo9af5QG20=
X-Gm-Gg: AR+sD12MVJp5qZBXKmZCo7VSSmh84i83uA8TTQVS9sHydqHjDnMdkUMKetWkQNs9zpm
	T1ghEwnRZQzqEhhOaKcwC5d+gMyXXPvqf0L+THTGjdtaFXZJM6fnn8bgDNTOz2nXQRjh0u9kp61
	xHXjaYJeqbD4eojwK3ie7Ai7wV1A2w6sTFgUQdjYAmX0HO1+YYNLTcoWLFuVys4nZkGxs+LmZqV
	g1eF3IdzehY5+f3YaWC3jtlOgiUKrKFq29N2o396xCh7Y3txpsPevb7xbmGhJBdUFIpqlcEAvHD
	on7whRdon3nL8xH7h/lK5Ca6c0jNU8EmoIfwIxVsZAmKd3ILuM90wbOM4I4UzINgW3gROynml30
	ejfjtVc/0bJXtR7ouqTE5AAweIMePYQ==
X-Received: by 2002:a05:6a21:150c:b0:3c3:af85:85e7 with SMTP id
 adf61e73a8af0-3cc72094353mr31538761637.34.1786997648060; Mon, 17 Aug 2026
 13:14:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:13:56 +0200
X-Gm-Features: AcwNN1VtNSRUVX_S4c1aAwvBlBumGK9sX5NggnTFPh0VlTehKX72W5UNOW-1T3s
Message-ID: <CABwQupOTqnF8iSccT+imXKeOBbTxeUWHR--em3C3LAnwVBwWZw@mail.gmail.com>
Subject: Re: [PATCH v7 06/10] rust: id_pool: take a NonZero capacity in with_capacity
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> There is no good reason to allocate an IdPool with zero capacity.
> Reflect this in IdPool::with_capacity.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Burak Emir <burak.emir@gmail.com>
