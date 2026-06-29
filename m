Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D3D3E2740
	for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733093; cv=none; b=Ki7Tb+8fRHVwRp88f4Bj0S/Db+57Y2mfU5Jfml4eUJAZf1ofPpfy31BmQNfQHfQKuVF8eymMHsBx1nj0LET/WMdQqtSWpT2hvJEoj3jxB0/cRVgOmd+hhndAVlMJHh+A02GZousgH2mVZcWYO+DdtMOAMpoLkk0D0wzYIKLyUB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733093; c=relaxed/simple;
	bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=dVvtA9EB9ks01t+Jf7VM6B866k28ZdiHP8pvWtBZvFyX54KQBilvns+jvLJ+0x+GmRfPqhBMx3VOix/Qa8op9iyQsxX/UdcWuXgLrlyaRFMRADF+lQiIwzt4vrq70iaZzE49oAT7TP66kHCX28zhX5UHIV/3EQwpjwlz5AykV4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDEhT1Rp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDEhT1Rp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37d82f3a244so1287982a91.2
        for <nova-gpu@lists.linux.dev>; Mon, 29 Jun 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782733091; x=1783337891; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
        b=nDEhT1Rp8N2DLZP17B0ysNXAalGz70Q7AHPvAcQWAYHhjrnZsZUpbdoDV70UfYIuvI
         yhXYRZrhAClu5yM4fcEcfn2ScLJBLxt+MjCGlwD6iTnMau+gBFUB/mPYhKAe2ScmAJRL
         tJmDbgvCSZTK0B+5LaxRA+uZ0/vYZGi26wopgleSip2QcNViMHEGaRFgrFBpMtfPKj+l
         klKylTT2Mtm2Aj0Vli4ieFgkRY9lmmeF/OvZfm3onlMfeIQmFO3AYIpLqTAyPww0Ohfb
         9q7oYt0sJA1z5NuwA1gGqGXAnsKPR8nCyuCbFUM1+Vi2XmNrfV6TvJqU0yxQt7hVSDf5
         he6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733091; x=1783337891;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TePgk28pw9nEpIK9yqXWWcC9xjXv9gsRt+7mXvf+SgM=;
        b=cOD1By2mHbG6y534ed27OAFC/kXyEXMzOUY0N7aV8cK/pcqBbe3pUK45E8gjkVnlmo
         SG7jz4WPfNiss0KZtVfe3h9ZOOTyXWjOJ8IrQ8sB4p3AVVvh967azyqzaHPvMWXM0U58
         46PrnydQ37MPzUHmNM56qDRAiKSHRoogETTRhR8WPZ6X2H+IQ5VaZQH6tIPkZan8qXbb
         WqfDCRoB7epqecp9R3xDujgfzZFh1yWrmjcpsxKAJNOprMHt1jLqaIlEmOGvbL0L/kUJ
         5LXk6GEacr/rGK+MCeQWGTES7Pd8j6taslnYyKXnYR2KtgMcBfC3tnWD2AqsDA/MWJrT
         H6ew==
X-Forwarded-Encrypted: i=1; AHgh+RpPCxV8NBGQkubbeCOWGbDU7Dl7HJeq+aCRve5/UZAvg2fh7xntB5DGDUq1pmrM11V5P7PKL80Mow==@lists.linux.dev
X-Gm-Message-State: AOJu0YybcnwXrf+W37n4xM1T6nlgXCfO98nj9g6L8+0mBYKf+FnLSBtk
	EVNqwslGECPcuxj4DRXtug6dY3HURWdHCwIj6ZZ2cJEYv7GySx9mfDXZ
X-Gm-Gg: AfdE7cmFHpN/OXR3zNf2+TS+dQlCMWqP+CZYNX5CkmpWq8iUJdKEN0yd5rapkjs1ZAe
	KYU9iog5Vzc7ssn53mnfn036GPq+bLWlASE6EHWNIE5paXoVtgKiV/agyinRT6ivPxf7Pc6EFAE
	f6JEUy1sojOS3KWXLfb5EW2gUDtd1KE3iKBcotNH8/pdJc/oxq2JQzwrIEUkDpNsm4YdVXY2Psq
	Z7yXpY+BU+XGAr31P7TITiusGWktEtOtGY9YWGj5t9n2L29pZyjYzZqxOzkkcMBmrOB7SB0iXEJ
	zvAi5cyfR7vYwRiNnAPWwrY46pzUqR+kRjaFTSnJZ0pddPqAM9eCwbNiYUpPXOCOAoWqC/VO1sl
	lic2LupRps9tRon8wZKGPgmdx4gZEHKxa15DzEZK4PRg6NybzWi0tlxd9cB1uzzSN8rxjb2IszX
	EYUPq7SyiVWhetFj0gxWL5/E5T+NLSsPnt0ZWZOPWiFj9RZ7erazMp5zMZ3KQyKWBca+KzWmDLh
	AlhQYV32GjrGq5II3TXXQvWSnJseIClNEQXa2TQ
X-Received: by 2002:a17:90b:560f:b0:37e:1cac:d2f7 with SMTP id 98e67ed59e1d1-37f7a557912mr8306827a91.6.1782733091454;
        Mon, 29 Jun 2026 04:38:11 -0700 (PDT)
Received: from localhost ([143.248.188.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e24b13458sm5549594a91.13.2026.06.29.04.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2026 11:38:04 +0000
Message-Id: <DJLI4X05N1Y9.322KEILB5Z6RG@gmail.com>
Subject: Re: [PATCH RFC 0/4] rust: dma: bridge zerocopy-derived types into
 the transmute byte-safety bound
From: "SeungJong Ha" <engineer.jjhama@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "SeungJong Ha via B4 Relay"
 <devnull+engineer.jjhama.gmail.com@kernel.org>,
 <engineer.jjhama@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260628-dma-zerocopy-bridge-v1-0-9a2895ebe30d@gmail.com>
 <DJLCLH7GDSBW.28J4PZW0FD60B@nvidia.com>
 <akIpejFWuKZ61n_v@nvdebian.thelocal>
 <DJLEQ0UIBOQ4.2AQ93XKMH49X0@kernel.org>
In-Reply-To: <DJLEQ0UIBOQ4.2AQ93XKMH49X0@kernel.org>

On Mon Jun 29, 2026 at 8:57 AM UTC, Danilo Krummrich wrote:
> On Mon Jun 29, 2026 at 10:20 AM CEST, Alistair Popple wrote:
>> I think the context is in the description for patch 1. It's not directly=
 related
>> to the bindings generator. Basically the problem is that these bindings =
are a
>> little bit unique in that we access them using the dma_write/read macros=
. In
>> other words we use these with Dma::Coherent which still requires the tra=
nsmute
>> rather than zerocopy trait bounds to be implemented.
>>
>> That said I think the correct long-term fix here would be to fix Dma::Co=
herent
>> to make it work with the zerocopy traits. Not sure if anyone is looking =
at that
>> or not.
>
> I think it can just be done short term, please also see [1]. We can just =
convert
> the DMA code right away, no need for the proposed indirection.
>
> [1] https://lore.kernel.org/all/DJLEHDNJCUD0.38PFZ5773D6BX@kernel.org/

Same here [2], It'll be better to make full transition from transmute after=
 the new
version of zerocopy[3] and auto derive is merged.

Best Regards,
SeungJong

[2] https://lore.kernel.org/all/DJLHOQA5UAP4.340P2TKXGMME5@gmail.com/
[3] https://lore.kernel.org/all/20260625231919.692444-1-ojeda@kernel.org/

