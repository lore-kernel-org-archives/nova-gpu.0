Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817EC3B47D2
	for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 09:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613577; cv=pass; b=j6jzlkJZ9CYDmN5yoUhafkBb6MXPUgkEwXjT8wR2d2uNQXeKiM1nM7T8pmTTjVqnAPhP4uh2dCgCU6OmTE5YPidNDzIvg+9vzwprCJi5l8svmjwtCYOJXgRLwhEMxrSHwdACKyVRhgJD3frlHdO21/IWlG9gnmdSvqKRaHr31ak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613577; c=relaxed/simple;
	bh=hxPH+ehBPzRCWk6w7xeKnqdyk50jcH5XyZCkn0NKK1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=omtcjjLfBdfunTrjy72wuw5ala1mevCSAISm1jmhcenmyMVgn84w8Vm20l+/d7YFH2+yAmqrTQKCm4uct816HMej3YanPrmL1fnfxnmhp0DWcYwWL77x7Zih2ugyl5a7vwhQ7XTZIJdZ2pAsZ3ryaSfQT8XBBleXB1C2GCv7U4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIgjMVnH; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIgjMVnH"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d01548ac96so3665835ad.3
        for <nova-gpu@lists.linux.dev>; Thu, 13 Aug 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613575; cv=none;
        d=google.com; s=arc-20260327;
        b=PzwyIf7eBuKjggwJjVla9y8g42+1LC7GL5gKIUZNqMk2eDNqjo/oRZoIg9E2U3xI1Q
         /l5QpQajgYnWYY8rlvbdIv8j3ddDB69vbzn6IqqNshM+Awvfpt+Qf8yAKhSqtV5ACEbU
         b2tSdcb+gLXQ6JCxXEw1TDbJPcM/+pBMeNkcSfwZlOxW93JpFlADzvY2W1p0ugoaLLDY
         mN96uTToYBXH2vy5VtiE7WkLPtByzykJIDCtPr6BmGyeGKFPy+fIZR7O6LSrnE+LmQwR
         PxcF6DoPcpZVg0yzNelUYEnGH7Yd0d21rQLrogTSsmwx6ys4QQLR2cWZg0YEkSkcPe1P
         O8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        fh=Yho2AfatdoI4PbPEXAs3FoRfaHcqHMJ8U1NThnTOYNk=;
        b=E+vRyj6zCcNvYFDdXtsNmnBVyS4uYc2FjFYw1YbAA/Bl/7OQYyHzmbx2q6lsoEPtZh
         3RqGXWiG/YM5o7AKIr9L05psD69yCPYsdiLQJFSarpZbf4Gz/H7B/nrQ12aurAfTlUMn
         Xx7nyHR9batbO5TiSN2YJXlR3DmKjlg1fkW0KpNQzDHj07gAaHASl38bxAXnzZhEpuBS
         ySFM9Oz+IMKGQQbYAERySE4gUmMfMiu1V9R1bMtQJ5KqKvSy/1+ivlGMB3j5KszLWNJX
         tBQBcms83Z1ldtAJ8cl/9FMELBgUZQgxF2vQ1dV/5f6KDHOcnTCY5qoMvULY8U4mogqi
         5oHA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613575; x=1787218375; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=RIgjMVnHB2lWhIlzcg6ZxsbfO20enyN3GuT01Lb1PSHYiH3Ayb5Nedn54r7qA+9Iig
         rZB+VqkZ4P3rLsI9NJxaeJ4Jx5GaM6IRoCBwqQ8wUmp3MyjxI1v8ZNYDYVzSo1IXyR8C
         vfjmo0y9nUCU+CIcsYGFWHx5fGhBd4XrppggmgpUzk3qzsENwf2+GVz1bM6tbU8QLIa7
         p0f0Zi/+avFyC7cU/20L999q1+bbY2aI/FJ6Q5jXeu+B/lq8TUBhgyzT5h49ESwX/czr
         KAcWF/jkFcrQnGhyoEfJn3e57s4pO8o19Djp1h7TN0zfnOywoqsDkqcmZL+hvWPb5SyW
         O7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613575; x=1787218375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxnZHFdFswxuxe1B8yyzSCFANjk8+GYT1StreigHL/8=;
        b=ble3mZ402CKmMp8LWtjzA2Xu0/zAiI9IUCuyBc8jpZ4Ts9EX1B82KU1K0gNxdsQ50a
         RiG9k4Kc4jFBph+1nkjjJ3VjU2sY+RuJVs8ijhY+8F45CVrl9fr7QyhLumsiG8NF9h8V
         f9X+ViPJtK8QIEqQPxV8CWoKk0PDbi9VT5dwlIjenikToiWeiFr+qBi9yOsqlsyZRflO
         9FfyZIMYXfaPtx/WN5lvV1evMsiDecC8cMBxUXa8zOwOJFKApBzFZh48h7SNjN9Z4O1O
         j9SsFFVdRtHISF7CU2GVHYSgEFzBus3OimfWWVJOGZ/36CqKBseDTbwrudymjg6TQr1p
         AU1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqAwRmBwii6/fLVuc6fSI9YNJOR6VWzgmvwP4KCgq+E5sy9c+WiLnpX4+MaW6GK7JrDWOiMd65V0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6xfRyhw9kvs4P3GcZy5ZRF7bcWsSwMGTQWHaesqO6jk8p6cqZ
	/kn3fj7VGEw6Z28zNVkwIW6F0VXNmYOP/SJA172rqX9xXEg1q/r989tzEkPKL4uW4hjtDZUwdmU
	HVLeUj+/taO/TrRRaemyCxPgmME6l5kU=
X-Gm-Gg: AR+sD10qASQcwpEpu8QCJUTeRJ2L5MhzfWj015DtE4fliFngPnlXgaJP4pFmhGLrIF0
	ZJOMut9iybYgiJK3UxwM4VAlIov6vtIPpbBKYasukZNBqs0N14rEBTOf2/ZvnoKMC+611DrXxnl
	YImwTRkO2QX3j/1L04b8Z+Fg+yPbB30jLlwtDxL585264qkM1SUr9sjakNYJgZr4qBNXlqG9IVb
	PbUrd9s3WbxOy3EQJPU5zUSzbxgavUE083pUTEBIj4ExNPwBXeWz7AauLvD9qdK5LA3kp8ytgo2
	F7lX78D8TH3vJ28fwwa0ePtQ9xAuM7QBfrreDt0oBtgDx83UYp8z518zKH5smdIn7Z5im57rUyO
	vlne3WNWhr0eMfJEe94XuRSY3jCxzynY5esnZyvCzudoYgHrTxrbsIyuP1K3itA==
X-Received: by 2002:a17:902:d4c1:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d389a366b2mr27617905ad.2.1786613574868; Thu, 13 Aug 2026
 02:32:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
 <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org> <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
In-Reply-To: <DKNDF3WD27GM.5VP6RBRXZBUS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:32:42 +0200
X-Gm-Features: AUfX_mwSjTSmX5g9cpyULDa32fuXt2Yd5-MIkCd-iXvVUBlQKiet4rzS7F5uPZo
Message-ID: <CANiq72=SP_nT7Z6NSH-GT51-8hJ8qLUa07Cs+SarSFTO9Z7vUw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>, Alvin Sun <alvin.sun@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 1:57=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> IMO this is the correct way, also consistent with
>
> https://lore.kernel.org/rust-for-linux/20260811-fix-fops-owner-v10-3-7e71=
776f9dbe@linux.dev/
>
> It might make sense to add this to rust-next.

Yeah, it is also consistent (in the sense of adding a fallback) with
the other fix I added when applying the series for the `macros`
doctest; and the `kernel` crate is not an actual module yet.

I guess yet another solution would be to have an even more local
fallback, but that would be too local in my opinion, i.e. we will want
to use it elsewhere sooner or later.

So I could fold [2] into commit 98f256e27262, but a commit on top is
fine, I will reference that commit from the new one instead.

Ok, done -- Danilo, I took your diff and converted it into a proper
commit, please double-check you are OK with the Signed-off-by:

  ec6fcf8a175a ("rust: kernel: add `LocalModule` fallback for
`#[vtable]` `impl`s")

Thanks!

Cheers,
Miguel
