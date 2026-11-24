Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539187;
	b=xoBu6Lbs0vzhEtjfcKvs5S67TmzbSjMZf3ztjfHSXo88Nh5/RyyWmW32JNyVgxFiLj9a
	 6OxHFBKCPXBGTjiib6iEocs4aGNKl6iEL/5SWP4BpWSkjvaoK8QnRbBP5z1I5wSxNASx9
	 24/FOZH1loG4rW3enQJFxWNXKFhFCWKCv5TcDI5Kk99tBPUvEKDrOj65U7VRC4NeajdKm
	 TyfeNh/2QZmVoWh0EdBu8vZnV+/q4S3Fv+0X6zwqK8zlatuKhWPbOh335G6JbsFZ4pcv3
	 c1vNh2XR8OO/hqUkI75d2JsrIj5wy18fzKgIq4alJnPtG+GIS374SmB0agDCE21YDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
	b=sM2FDt/5T+TLvPPXuMsHkmIIqSm46FDz5UPUjPRTQ3RIMmtzzIiiwMPgOXobpIdpx4Us
	 xbW/4l4A74SnmAb40Ejsw2xwJXMmmeHSnm3ouz5eA3UT1pnYTVejfZ9uQRn0bJzKlYbFD
	 1yQE7MMZcd93CFTmq2PkOcPlRCSB3o3Y//86o2mxyI+EjpClOY2g/ucxZ7zCdSmKj9wv4
	 +xifHQqPxwXLcXCpEaeMW8+FBcb2pisKVzJHYu4PdScehrBhfFAJAK/wfG+cvbyn+SysF
	 znfwzyM5+7XZIj91Fi7oMXuCHhLmoSzEHbizhcOrsZMCSBIs50dGoOqXiD54YaNDzWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mw4KsIDb;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D632606A33E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 16:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D632606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Mw4KsIDb
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-492b5408dedso2772905f8f.3
        for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 08:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795539184; x=1796143984; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=Mw4KsIDb4xFVVmvkNSzZ6cK/LM3xuR5+5659HADlyunTw3ggiy/clkJuKOovl6JDvy
         Jkr5JQ6d/ML+on7PX7iyPEbXKebNaczNKk6MIHSGMJWg4C1joBK9j4l30at1QZNBrq6n
         onWZW890tkgFufaYxgZZElZhyndSYBo8e+qd9/C0DcTKyvDOpy8LG19KFvoTyeqAoODs
         wj7rNCONySxbMsRvuQ+Znj66G2aG9SCWuEuRU3HEjjUwJ054SSePq7TaQJFIHrMBo8+6
         T233MGV8969vEKtEfz1tOsRzGSvN7XLal7pLhs4JhJz9dCpruCOrpm5IaJDXJ8x4Hw++
         aNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539184; x=1796143984;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6XqvUEASgW1nzq6zUn3qY0teVOPvQxrwEX3381OA8Y=;
        b=ioJdBd1A+hRZk1nI9x12Q7LPpfvMgye+/VMKoYtU5nLUQqIvYYXA1qDBrSkpYLjpcb
         tCmbRaTX3nV+QQS60+ln2LMo/j11DPe/d+INU0LBaMkvNiyR/p3mr6xgwjb+o9x65jJJ
         049IJvQQGuz9LEBSnVK1p/ZdvHiA8zMjvvqDOKqfrg0ZP4ggnhWyGyULhb+a48fJIMG6
         VNQ1d0ca46kmO73EL9+1tQFbMRlwc1tI5TGXvcRE3DxqloUxRbRTIdvIATfWmkKT6YnN
         i7PZVWJRN74R+SHihVgEcu4WCSdbtBdcFHGDGJssfNK5nj8nJHewq4BHgLvP0f7AUSbT
         rp4A==
X-Forwarded-Encrypted: i=1; AL+hErHGIixIpiBXUBKEAgBwRYx8BYeBMrp/SU65w/og4A2lq7JUCO5ieOHGcXSFArOEzIaGgHdKXX0aYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9VcV/Fh9PtT4jzOsuzJ+ZwqWd8CUiKjCMezlwRHm0PnZ8TWLLi
	U6doV6uNrwa/P0OzsE1waW/s99IF3feqN3D4WJYz3QIPQCi7eAOCd1jTgnlMG1Te8VehkPP4WEI
	QczVCY6FhVosO2asAGQ==
X-Received: from wmik5.prod.google.com ([2002:a7b:c405:0:b0:4ae:362d:4d6c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:154e:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4bb887c3b63mr334954395e9.4.1795539184204;
 Tue, 24 Nov 2026 08:53:04 -0800 (PST)
Date: Tue, 24 Nov 2026 16:53:03 +0000
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
Message-ID: <awXA70GWssuU991c@google.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
From: Alice Ryhl <aliceryhl@google.com>
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> +        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
> +        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
> +        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };

`drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:

    type Object: AllocImpl;

without any constraint that `T::Object::Driver = T`. I think we should
introduce one similar to how Driver::File constrains this?

Alice
