Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1143B409628
	for <nova-gpu@lists.linux.dev>; Thu,  4 Jun 2026 11:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571435; cv=pass; b=BWUBmQm12lcZmjG3T72u/J2HlsME78QwQGTS6wH5/beBnOvLe094eiwFjUJF9KhiVWVrhYgFdk1rVKOPPgbMkP54DHnq8RJ81Qz+dtpM2MTLCQDDxEum8n3Xl5jCXaeW946GApMwRWvNfVs5F8BCwzT/xfwLMa/7uOMZ715YHsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571435; c=relaxed/simple;
	bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apSqJC74jqdlX/S99yjvN3mwUwHHYqm08HQGNfVlTQAR8gxVH+4C2ldzE8s2d2dkHwn2MTAPSd1ElyoZkzA5biWCcq71JPE/MinUDPaq8nSqInby7iZJ1iNI1geCOJhtd3siuq2SmosZakCIXhURKlB53tAaL2BIp83wHl/y8r0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnh7j8UP; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnh7j8UP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so3750845e9.1
        for <nova-gpu@lists.linux.dev>; Thu, 04 Jun 2026 04:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780571432; cv=none;
        d=google.com; s=arc-20240605;
        b=DbZOy9hxzjXgBCs1W5ZMX/NnpJE78kM8ht52KFwT1uVxMgq/kHT66LAade8Qwar5zZ
         hl3GU+9Aezxh6bNk+WNepZS+b63l6GVatl5XTjvFSlum6kBlZM8jXO/maXPqGT1dBzsB
         bpjs4/fG/3aHcjusjJFRpBSF2SpurwvQ56PQTI7T23R6eM6IXKE6gwK1F7lmoWivY7Xa
         x4x1Uw9Q4bXPeGifJh/bHduVKBTS/CpTDutDyDRuE1b+HtjQiLxFgbsU6FqybAbN/gh7
         ynjOQ2jTwUCjgUOQB1XYaIJUhC3xhOVerWLG1K1VsHGe9T6IXIy2hEicuYyKoI5pXdeA
         Bufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        fh=E5eyDUp9GPsksocE8kXTEpfH/NoM9bVqRMwVmB2C9Xw=;
        b=jIwxjx1qpa2Ya8lc5X2p7fsoFbS9btPQmyMW/+b4q48axQYMcVPkbegTudg5CF5r28
         SjycjHOgB61T0evdM3R2vqD4sgUxOkY035ie6z/UFXFnG3Z1DFij83qS8m/w1jVttvLe
         Am2MyBpCV+KtpTo9gFijDBU5ZsISHS4PdLYPNHAad6v/2Zn0MAG7T62uJCJRJsQK9DjW
         ajcqU7XHBBAHMJ8hoPe6d+xx0bV1M+9S84ntuvUpvZ/OlEVAudo8uLC+q0sMFXD5w2vX
         f50JfkbZm4K6KCkB7/h5QYEBrnsAKhcwLExJc1ShnQOuGo42kQdnGvzAPH62IO7PV4KB
         RhXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780571432; x=1781176232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=vnh7j8UPGeGFbbktq/h9ySPsOVBE6NrW5Bm6OwDOaAaPT9M4hMozewBXXFedjlnJ0J
         BjReBva4JCru232t8Jn1C7cjMdbVSu8mtCnvxrF6xgcnsFP36UTSjntHvo0FOe5Ywtz+
         nD8TG8y9Lxm60FlBFfa9t/FMOCWPQ0aOzbre6WqSvDwnY7Thfj5ITCDWUX2nCvWm+oQ1
         bOheq0Y5DznCAmC4IvwX2B/6aQHyLIQMHhkdQCvc6U1Y5sC9vprQIQKkVkcEru71DyQN
         kXrnVN9gbfUA/1GczMIeWlEmVKnEfbZ+tElBJIdnI2JEIrM6Xb5TkniDLk5taCxRuy4U
         iXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780571432; x=1781176232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSci7xLpxgYHSBUqhNqtJbViKyYVOJoOaMBk8J7sasA=;
        b=Dzwg4DTKDTjmZCV4k711o1cmdgMUUSV3n6BW/Dn5jtdg1+LFFpWJjJ7p6GVCJ+Ow7l
         yImuOba4vqChZWu+zoaT8nrDJ1GsKyYOJJQ2nHXYw4t+51NdWqTKGisHugWJI/AgkGBk
         kZVx+p8vUIzQMdngs3aKUbc+vz9isQcllFs98jRwXOEvaH6ox//OtxG6HcFnWNixZRma
         gyZXNIld0HxmR7GSygE7aOsiO7+qWB9fSwq8/FqKaksY0S7JjHwWSV6g3rDrMIxe2eLu
         JX7ydplxyJO43209nu5ro/AmRPvYAbKuwkKLEtTC1UfGbB7R5ZJFGav0xMXGD1glAFpZ
         7nQA==
X-Forwarded-Encrypted: i=1; AFNElJ8PxTQjY+7Kl/ZD09oawaTy8djhQvQEMcgSm6GfooxLyaVKIqXpx1y8BvrkWkoYo8tVix2MVLvCXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzsArUkpakSV0GF0qriis2bZI6cura6eQsuhFILN0WTOSYBkz8W
	p6qsmEKw2TLcEVmFH8AGFQ9R19h0Z/tQPmxQcR5xkyqLYRYhDEqO6TSwBEfhPy648FLvx9p+Ziv
	zbflfEewz7hQ/4NK41I+sq1vZR2GZVaXjwi9MbQgB
X-Gm-Gg: Acq92OGovUZwV3hKT60dYAmVJEyG5x2V0iudqoOXOwkt+z7ISjCbv++odSyaI2Z91re
	KKg+aYLBfdebQyXXjoq30UJn/x3eUw588002z9VN4qRms8vaE4ObzUwCHdsnn5a5E2JIYqQ61WQ
	j8TdvfiXw7s5iaxCbqZhF7uqR0zL8uzfH+NUQBBduoobVb+qBGwIH6Q7yAMugVYbk2xjNdTst8I
	AmNZaDNqkfY3Rw7yPb4LPGkpsypH8W/DK4yUHm4BcjPKjFKHmjVMnr32ErlUW+KzytzR0+K7uwk
	fyfSOuo6cYNbtNtaBOfYu75Z0lt2asVmZkS8QnQI0uTFX9KlzC6OPHvB8NRZwUkNFUmk78XzgsN
	NFEE=
X-Received: by 2002:a05:600c:4fc6:b0:488:9bf8:7f17 with SMTP id
 5b1f17b1804b1-490b5e95f44mr117890035e9.14.1780571431900; Thu, 04 Jun 2026
 04:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 4 Jun 2026 13:10:20 +0200
X-Gm-Features: AVHnY4KT0fbb0zrOV-n0xIWvnd6M6oIkQFpOjNPef2gzJpQvDH0c138r3Ikq7Iw
Message-ID: <CAH5fLgh8L0gshrfaHWxdAqQMtXY5XEm=TT2cx6C8W519Pj3+Jw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 4:18=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This series reworks the index projection syntax in the pointer
> projection infrastructure to use the keyworded syntax to be more explicit=
.
>
> Doing this allows adding a new panicking variant of index projection,
> just like the normal index operator. This is useful for cases where
> compiler cannot prove (or cannot reliably prove) access is inbounds.
>
> The new syntax looks like this:
> - `[try: index]`: Fallible indexing (replaces `[index]?`).
> - `[build: index]`: Build-time checked indexing (replaces `[index]`).
> - `[panic: index]`: Runtime panicking indexing (newly added).
>
> DMA sample driver and nova core is updated.
>
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
