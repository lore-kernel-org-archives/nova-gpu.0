Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BE3D4121
	for <nova-gpu@lists.linux.dev>; Thu,  2 Jul 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978908; cv=pass; b=YScUfX1gVUAvSx++FIj5v0C86/B+dN0/Fg7GZPHJviRtMj3OqsZF9ffnUQJbme/7+alP3rDEwRRyJy4xgVkcyJYl7+1ffBtWZnzKjSsnAkAsCisvrETbU3cokc9FRCHUeqd4FngLIIsikBvkU3yNlhULxVeJvwr8gL6JQDo5CJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978908; c=relaxed/simple;
	bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umHWXPPDkAm+R6ra6LMeTxCmOhiKAoB06fWopBJmstKcizBpheTq/7Juqi2TF48vK1iyuehISgCRszvcimmqBmNS48zG07cVczu0iZueJhzI9iu0gSC53enx63mhWaLZW3fMCtNYVsQf1hH6qfwhH08lpvFeLjnNB9RAVPys/rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OSj9H5D5; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OSj9H5D5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37fa897003bso154673a91.0
        for <nova-gpu@lists.linux.dev>; Thu, 02 Jul 2026 00:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782978902; cv=none;
        d=google.com; s=arc-20260327;
        b=fwmW/DOWBsXhWILBde6oUgV3fk0MRx+GYzWrmo0CKhp3j/vxHNlTaFfCSKm0Tt+fEd
         H7GSN3nSprLdyFuvU/rdCUN19up6ZiBpr9Mfq4ibbZcqqgRcn/dQilPSe1GFwbK9Ep4A
         k6uoJfl1zUCPOl4XfNipmWdJPSgwvfUDLWCjAUrXRAjByCFAUwOQf3WagcCZt/3EKVez
         P3KRHvV9fQyKZihwA5hcVLnlIgIQeFqpdhp9EJXpA6rbPDZy6za1cRA7SherX21Z1/8T
         fUKLtTzIPMRFAbzlwZTUxzjcqiSVImqgW5Jvh2H121sNgtIZ59uFBsp/XzJ6GS5XQJ0o
         Soow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        fh=gZizBkOBFVaNjXl2gI9ZePQU0fj8AByts+6AYMlw8Pk=;
        b=gcXBprmAkgk8HO7hMnMtOBNDp/eOHHcR1wxbS/2yqhjpjiXStt2wcbzAKPhFkXA1Oe
         PMAd6RPc16pMVViJDcU17X9CDVEnrGw3HVvoMGqrtNhURreTFggCZ5nrTWBNasCEZK/x
         l8DjqwMHLbH+FAS2eywjiMkag/6XVKAz0TOD4TMWy9j8/z9ZBf9KAT38guK9TIHWhCZY
         KmIgO8/dFVvJET/xrrxcs34Bpr62BtiSGzNqTxUS2Hdkqr8yuWjN2lA6o1VqT9bHJB6q
         tHvnz5pRkzc8l8Y/6c0MJ+TbV2yl30o/prkvjpR3MlpfWQNIk0mUoZIfJigVW1od5yi3
         c3xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782978902; x=1783583702; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        b=OSj9H5D5A8sqA6HaAwc7qtYs8AMJKL93W076EqSPrdZgc/uFjLVwgKyG/CbJQfN+gf
         EsK5ReWac4JYo6JAQKu1jPIbtXJaDznGQSEGhCKFvt7GJrsAtD3OZlGMmYTeG7rdLU99
         QdaiDZ9LrfEcEE2m0hDxgqJA3NyYKsd0McdRPm+OPjjgQXf45dBGEx0y3a2HC2OzdRDh
         rQij8kd4D2mGKRZMHI1hHM4JUk7rPfzesnclooEftM8fEzqy0WYkLshndTkJmDXKYZTH
         E5aYeKEjyr/WuhlR2aCKPbVdAFqKwW506SNZR+RiHvZM/9E2+lThlvONIdkqkSWAXbWk
         hO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978902; x=1783583702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        b=WD3k0z+94MpcYLrLOa/0mG6u9AREjH7n0jNPRoxaVFaRlw3sK7SE8nDedKxodU4vIG
         xN7rRSKUJrMlG9pAAZA165hwYmIxGu1HX+yIMGfy1t/UtvrldsJXEO7C21kC4mpXMOZm
         9QTFsRvTLaDKP2MSebpHvIFaYSbntJ017IqtSZR6xFvAR/+/5LBjf1kAu7cgMUhbnjj9
         GFraHqDsTWmnqdUhrXiIeL+ppC0oXj6yfQkz2x3wY1bqmuNOgglGWPuaqs95hsVqWYsT
         JOGq7QC8fbtlU4Tya4yNfh7V/HBiffgRllIJnjPCcYPmLt3HcH4piL+GrkZuFZMCn8xW
         DAYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr8rh4mYwzR4TYUCPSJedDoS7ox3I2M03quTNQihU9bJBO7Jv0chJOqPj4jfPilgOIYRGHameSptQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzoBSpkEHeBrvDCZ69Cqn3XemxELqS98AsGxnGnd4ONd6Kfk9S7
	ey2j2jYyz6gVt0RAVVnZScuR7GAkFIg2x11e6dcranwFd3F6eibLal4pyOtHGMHi6YSEwsKXihH
	7GLPFkzh5YX9JY23czGmsq5s4Hn+5TNE=
X-Gm-Gg: AfdE7clRY8C/oqbEgOh03cm/I5LP7gTc6o/x9cgT7K4sXsNPf8kCny+p04k1nMCQXSW
	J1pnX2oJdTs+gb+2qUmfGbf5I9YQVP8/r875vETpL5H2Bjd/WnURPYKgYeQqUX8SBmNBdGzaWSF
	r0U/pifKWao4YwI1UYIv7JS5lEwYr3/pw074ENYvCfeGg8GORA3l6YHfh8bzw0keZa6BFzEy98h
	5oDQMKRV8JN/xfDFZwVme785bx6LoTrBfz85KhqnO2OPwW8zHWU5i1DZ5xu84VfmGSts7EmR5tV
	K8nD9lE/y9Sz0fvjP91vpPKfhBOyOuZzmdh9W+75CwuoaOr0oNgF8Fd6j0vzWErH5yRavrO3Xa6
	QzWC74e226tz7p3K72gEkjaY=
X-Received: by 2002:a17:90b:164a:b0:37f:e7e7:ac3 with SMTP id
 98e67ed59e1d1-380aa213029mr3471079a91.3.1782978901663; Thu, 02 Jul 2026
 00:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
 <20260701123703.152958-1-work@onurozkan.dev> <DJNON0M9N1LM.SSDDO8N9AM2B@nvidia.com>
In-Reply-To: <DJNON0M9N1LM.SSDDO8N9AM2B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Jul 2026 09:54:49 +0200
X-Gm-Features: AVVi8Cc-jeKWuhlps3fpukVFGOkqyU8Zzqr229Z3ERQ1vr56XgIj4S5V-0WLn90
Message-ID: <CANiq72=NSt8bKamtL8BpkwBAMRs9cnbXj5XvT7yB11ZY0wWdbQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova: fix rust-analyzer generation
To: Alexandre Courbot <acourbot@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:09=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Ideally yes - I expect that this is something the improved build system
> will handle correctly. The current Nova build rules are a temporary
> workaround, so I wanted to keep this "fix" as small as possible as it
> will also be reverted eventually.

Yeah, the current approach is just a workaround for the missing
information, and we will be able to just do it "properly" instead.

This is fine for now (and it is not the first "magic comment" in Linux anyw=
ay).

Cc'ing Jesung too.

Thanks!

Cheers,
Miguel
