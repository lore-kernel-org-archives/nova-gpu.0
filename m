Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805E4466B1B
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759541; cv=pass; b=V8Tl8tOWPUGsuJOdw14slOxRPWyzFNsBwtpy59UWyuhDIBcUYG9MqgIOQPIsfDzIS9OUIv0/Zl9Rc8CiiZCQLhjIMZVnOaEDsaR7N7act+5gunb2wtVrLRO+A5YuocTj6EfNWm7jP7wnxlfMlI5hddGRHTKcNkV8Er/MpwBoOt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759541; c=relaxed/simple;
	bh=7p8DMwyq2mZD7oBNmsoZbD5KB/43vQVkjyvaz1CCGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCvYQ4LQomQBM8Y37jqD80Oip1yT07qpjbWjqdHMTE13IlqmgV0esikcBo4MoeTtVlCtRqQyy6A8lMx+hnY3oFRcAJjt9mNJtzm9pcxw/5O1zvfOUL63VJxMqAKCdMuqEhcDjl6pGaIJJtW0YzDo9A1pJ0x0zLC2rrFJOSK9gfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0p/gCbi; arc=pass smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0p/gCbi"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-1431a73fa1eso333541c88.0
        for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 02:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759538; cv=none;
        d=google.com; s=arc-20260327;
        b=E0L+eHqmMgNbo9kDxTKtBsz69c6dWPZLEueDGyfpPqXDMgwa7csYqGjmVmEJ2r2Kw/
         w486E5nJUwqFsi29na3y8KMBv0SLZoSrANlyoRSoCIiqmq69jMbSTzGP19MmBrHSp9B0
         c4rUj7v2loyFOAdIhimZDS0sJwPIjLplR6/r4FNIx58QTG3qvVM1kHOrKERgRHwzsJj4
         PHxmWHoHN/SQFXJ5VdA34X6jsN29IleNeSv+fUDyODLEjH+eJFso0zsVWoYUotosRkXz
         beTJA6enXhSo1BQzJ23f5x9TaP8UKAoAad+HcjGa55mByDbI3ZXYc4UNmjY8qislTWhM
         Wi2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        fh=rpvs8mdu5LUi2Rx1egneLbB7EFxic12Fo+6rHmSzDiA=;
        b=cOwQigc0vdX8be7jNTnwBmCJGnvzI2/XVUnwB6SzgBKuMQMtK7XN+noAEgXEuF/q+V
         l9F2YC/WHW3mOVrLAl8v8eDAND8INGMPjV9QT2jKEjrb5oxrlyDPu+SA4gkgTKP5Yc2y
         CJ8hh8hnpDfBm2gXkWlzoZhR+QQChV3JXW2cDLt1WDCzSh7R3dNy4ALCHCiP+jsk6RPJ
         viRN3We9JMQ5fulEIfqnywhhmAe0RifB1K9TQOFLJzqkgVrs8yAnBkhZlQcIcVDpYbuy
         7fsL9CoFjJJ3nLkNr9M361LsjiUpb4YtAG8QW+nkKb0uM8KTv8/2kYsMi2WxhoNz0Mct
         A4VA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759538; x=1791364338; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=O0p/gCbiW7Hf2MD8p5HUOYFBr0feTTZZ7GLYxm7tYStp5LKoC74tU/ORLX6o40Eqme
         aTtGwjYlMis+XumFpbSBfU0fI793HLQFpLSZwIDsbKXCyO/AJn5tAl3HmAE2BPFKt901
         +5C+foz5AfaGY/+7r/xAqd70Q+7Jb30j1uMPI7kb0YxUGHnRXxvVCAMaCAjZlCFCTZ1a
         QQ1sRqNW/sKgwr23CFbpXPBv4UfIosuIbuzY6N7JLZ7BWsnc4CFZSdU1zK4EeF2J1DCv
         7FlpftLEsWYGhhH2+RlSsXeAWZ/7MO14qxkwimXfX6E/j/4t6Ki6d2YiPPBNkspAKsYk
         plqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759538; x=1791364338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=v3pzJODtO4a5yH6uYV5dS6MIgMkdb9aKpMD6D16nehOrC1mlCnutmGuOd/ME4dXvAe
         3/QEzw+83+yJEibCJrMqVAsZCvy6Lg8LLDjzb8vDbZe+9Lte8zk3Y+6eqnf6WdRCIOXW
         nUA0i5Y5ultQ3BBN/4D/ygG7Mll8i8fucwP+iQWnOFu9xbgWdtHKy9ZOjWGrkks3AcH7
         lVrgdxqElVt1pfuGMBf77k0gYssZOLx+HZQKezj+CRziwE5fFbfOmNFyt4q1/oCEhemK
         l316g0uObbi9CETx+zWS+uScuPTJay4JnqIEqBUmx53g4vmD5tGtLF6WVNZqvySV8Z1f
         aU+g==
X-Forwarded-Encrypted: i=1; AKwUvByLvNKVPO1OvnVsKl6mXAFGYwYeBZ4YnQvsdi2yc07ltakD2xM4omxyR750LjpVxyD7lANTnxKUug==@lists.linux.dev
X-Gm-Message-State: AFq9FYIa357l/t40iO5GhcnVcPojLnvzLwPByB5GnavPUz7UiId2C/Og
	X1slJgphbeKzm/7TMf+87y29dNcgxQd/HWXg1PMq47PJ1ZOlZ5dWheitYTXxDblSgS07uD4sBpz
	HVMO1gdCJ5zCCKPzaVzWvZkJLhlJSSPo=
X-Gm-Gg: AYBFou3osMrBAXdfZSeCmhinjwz3NjGw/ztGnRdX8L9odm0rV7rm8kT0NSPHa1AFCNd
	33Qi872POrlXWmZPRk5kQ9aRhBb3m71IxseL09XJBQAl74wbZqp3GbVmq1ST9Pw3bfoQvy1G90s
	5MK4i/GD8qvBq/SoP9okLiuEbFh7PuCwY2PBKt7uJqkUklJ59Nw8RLpyBlTLDYrZxOabndth11i
	srkmWT/k2pEsjBSlDxEbD6KCFiubFlkQVMiMvdDn3XV9ZZliGudeqWUSHNYA2WJyOjPcFDKdpEd
	2xbdbag6+YEnAZTGGVl3AHAKnVKO4GsEkAFUlUt8W+UCHCXe1Zk0+dCCGQz8NjxhBQiBbb6yCqQ
	qK6H2qU5UhRTcEf+6S4DaEZdsQBABJyl5CQ3lEXsRf1Zsif7YduThZoz1k8T2DQoz8l4fA67V64
	h9sX1mVfrdCn+eUZuwE6YMa5GwJwKBeW3g4DCwaZ4V2YACAKQ+a3k=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2001616eec.1.1790759538076; Wed, 30 Sep 2026
 02:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:05 +0200
X-Gm-Features: AclHuK9QlKMhXKITkkBnbYFPptADooLzR8_3Lk9f3AVt-2WcqKF5YbgcQH-UReU
Message-ID: <CANiq72nuhGkeDFwyWG91xJTAV_uio5PM_PoYvXLCWF7ebKBLeQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] rust: sizes: implement SizeConstants for Alignment
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, constructing an alignment is quite verbose [1]:
>
>     Alignment::new::<8>()
>
> It's unfortunate because it disincentivizes using it at interface
> boundaries. Implement `SizeConstants` for `Alignment` so we can write
> e.g. `Alignment::SZ_8` instead.

I don't find the former disincentivizing -- it is how I would expect
to have to write such a call in general. We do have the other size
constants already, and `SZ_` is well-known, so the short form is fine
too here, but I just wanted to mention that I don't think we should be
scared of seeing colons and angle brackets. :)

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel
