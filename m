Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B563BB111
	for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309793; cv=pass; b=X52IOmN9OJbifcCVw4wA/d3xb9AfwqUqJ4l8TJq/suG+zkjlYNQuYumhcka8Edu4VcuVYp5r1rLRw0hHeSju+1nNBaDXXzHaQE4vXcnQ47IGw9bYhUIPtA8Td6zI9MLeuESzlYVQuHVVNXIl0CSrvcXVbMjiCLn0S+1un5FuVoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309793; c=relaxed/simple;
	bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aNhUtmXTXN230mHa5YWzE8x2v96yhmjDamfxSNg63SbhLZP+z+GgS1nHBdCKqhf8/o1EahcQwDB/fp15DIAzWCq/dC/YDdOR+mEYecIyqDl3SrVyFkBQS4JqjueoU9dEde3IhQLQ+N0zSj8snTQvKqx+jXULW4WOeNX3P3h3qW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hAXQoHab; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAXQoHab"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30bb87c90deso164465eec.3
        for <nova-gpu@lists.linux.dev>; Wed, 24 Jun 2026 07:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309788; cv=none;
        d=google.com; s=arc-20240605;
        b=hJQGldMtIOuzp/4s1u/xVa1ZwWIqYGq9QlrnQs0RX93k5WN1bPulNBM6FuZ41oHogY
         h1SeroBMDykfWiKTR7phynYMkFwxuRIf13bibblMSi0baetEG/Px5Y5tjsc4WGs6KO2p
         3KTsV3y+BrWuyiYoGA98LERiZrqVx9EZSQnlfIAy1Oo7Ryo3X82Pnnc2LiCeRIx7FW35
         sL/FDMLtfxpetLQ66FQpWhTEaVWU3glQytMaimFZZfOGfuQa/4MZlXVUMApaSZk6H9I5
         HpQZL02kwAg/AZ42Ni2ewnbqqp4odTP+MDBLLDGvbzwtKxrGjyJIPME63+m0tbFkD1Oj
         5ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        fh=NEWmqw40D6yKKi0L9XinFSvj7tfrFo2KxSR67tFBy/Y=;
        b=B/F34ywIPVTKg4fGX2/nvW3Rwf1niaP4Qsv3A99A7V6iIEWqZc+DJw3BPPkEetUStl
         fnX5x2d2A/7wUm+f4TAKtvDznXsiXH+G7LvAH3UFKZ0h/2uD6jo3YmR3AydW+FqhQzQC
         g82AIm2GScK7tK44pJMAxRTfRCoDgIPSWfgVEaJ4HOLqNcPwcgZ15PqQtTKWcKdFDPps
         rDGrDkn9GvElUVnLdJvlKBXDv/VUxg+jjEUS+gjK8nUtD5gLVJnw6sX/8OEVLXkGCG00
         2Cqinj2+hOobeo8zVjz557scCn9C/qu+OeTyl59rubsWCVOYT4hk+SFg6nxmaftMC5A/
         44gQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309788; x=1782914588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=hAXQoHabp2gNK2S3fmUGePB34xpQmc8OWTrKiOiSRoGI7kLOoDrGWbcASvxM1Qewo4
         6B8KC2QjeIvuciLwbxffkpgmuKZJwLT35L3Fqq5SYpSgdYhBairDx9afO6gQOsfavi7o
         DbBgfn33qIsSwz0F5n0f4JRGzpuMFDOWMqYeVSbIIyERtoYt4xc25kTrGCNPUDjJT0bS
         OQm6Y8wTchVmxpr4HcRrEY9kOqK8efT34epsF86bEIi7k6CiUH2kV5elx1uyH8xDz4Wt
         iDXQZOiEz91jABLHcJkv25uWe3A/C76TuoJ7jDbJG6JG7U7zaQuBV21JgVip2AgZ8ni3
         bvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309788; x=1782914588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=ZHVkWtSub4mW/8Dp5SPMLwbjnnj8WbUJBh18+UBHShMPvrfMFVMxcZ/6c/TTc5il3G
         m3CzarfdbsC6sUfwzvOvw3iGBlW+MKNc/Of7ybwtbvDHvqVLmbUU2yokjEgTsFZPsVCf
         RAGkTW5M/zSR/BPhzSdI83GYaeAvZminvCSk0JvKyo+BQ3U2r6lPVZgJyp8WnXGvGKbb
         jXThNGFsCxbjJGmUQMFQdHRvJJAEa9OewaiW/CYNOGjX72jvS9AB9lGT0sDFvKirnE9A
         8dNKtp+lhQaMn0HPUhcWGLZqYKLphOI7Rojee4beqq2VSq7McLGI3cTBl7CI3D95zpNk
         DsBg==
X-Forwarded-Encrypted: i=1; AHgh+RpaO2xzXYy/z7SrnmF1HTcXkxqppYZ4NSYsIoj6OHoqk06mFW3VsIDj5yZERMjPFJroANPS2fUsUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yydla3sen8QzBrkCZQpthwVVkTxf0nRI4F9MmhOiWeCWyg306Ik
	rv0EUSl93wipsS151djKHIGbivJmzvToRKXcoRM/mY8jcD0UAY1m+2yLXf70nZGEv2SBx15kPw8
	HwdqhwWLo6/n1yPwSPWCJerOykztCtUw=
X-Gm-Gg: AfdE7ckgwABKRFZcHexddLJe0EHwYzCWAwhq+bDOXVoyMkBy98/s+r0PXisTNyU7Zoa
	ZaiCNBkgdFdCXpaPwkUbN0n08xQy/Jgq0o1Y6Tx4EjTF7H/ubromx0pDJBkVjrunYy0sin3GGC/
	SZmNyAS7eBlx0tb/5J0zAL/cL6eV57zpirUkRUFTl1mmWZu+Hin98ezOHfkrtWNk4B5AxhVnhx1
	OotFmo46YGQ1XLVQwQLZVwDfvb1PGCsLDp5waIxruyf+JInH3ODxkTSZzJMvZW/3rPeedHCplhC
	bnlOnKHeKz3i+G1UPy97sA0Hk+YXtfrzEO70c54dhFiqzcA9+rQe85P2SLoUUUwQlC3msuX1QXQ
	xjLRxPweCMCwl
X-Received: by 2002:a05:7301:658a:b0:30b:c8bb:588f with SMTP id
 5a478bee46e88-30c5240f7damr3538472eec.5.1782309787929; Wed, 24 Jun 2026
 07:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624-fix-fops-owner-v5-0-aa1cba242f05@linux.dev> <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
In-Reply-To: <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jun 2026 16:02:53 +0200
X-Gm-Features: AVVi8CdZJD474qdF4GDgFLlfJ_vD8WsFaomaTI3YSRH6pluhcoRUR51gh_iz4VE
Message-ID: <CANiq72m_LakPxHt99+3eBn2rXokr3vZbdJf=Wk-Yi8_ufQ2mvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Fix missing fops.owner in Rust DRM/misc abstractions
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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

On Wed, Jun 24, 2026 at 3:23=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I would only suggest adding the new file rust/kernel/module.rs in
> patch #1 under the MODULE SUPPORT support entry in the MAINTAINERS file,
> similarly to the other module-related Rust code, so that the module
> maintainers are emailed when changes to this file are proposed. I think
> you can change the existing 'F: rust/kernel/module_param.rs' to
> 'F: rust/kernel/module*.rs'.

That would be great, yes -- thanks!

Cheers,
Miguel
