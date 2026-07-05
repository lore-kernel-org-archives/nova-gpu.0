Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC06378D8D
	for <nova-gpu@lists.linux.dev>; Sun,  5 Jul 2026 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254158; cv=pass; b=d6HCDUdHjEeYqf2pcXO/dYlVzEJDBTIJ9IWwh7xk0zbUEpll8d0RjJkT5uajbjKgXZ7uSbEsBF1j0WKsvMaH8wWdTR0Xc1W5aEyLayoxwiY5ekzasZwD+hav+zAZQ7itcgwQiKg1nrEHt4twGqFe/pdTlEtIDpO9nRY3yquFykY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254158; c=relaxed/simple;
	bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=KknYbSY51wZQdYBoz0ypVhYTvphBiecfNn6xLWXeNrk2iauU3Z0kKAKDi4Etjua7lzzWk4kPrc6JM1awmxWpTj85E1nspo/1EoStJe72M/0yJ5pP+9UVF2nqrZ14+Y4QB+grKw7YQE7g13mpUkEccx5TCrlTF4/UmGvvwLzHGhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzBNXuFe; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzBNXuFe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3800f0907d5so363387a91.0
        for <nova-gpu@lists.linux.dev>; Sun, 05 Jul 2026 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783254156; cv=none;
        d=google.com; s=arc-20260327;
        b=o5O15QIzNK6wIC8hX0FuQW/cpP+7LFafjRIZf01ZIbaX5EzbpMC9Z6fxVx6e1PlmOv
         2F9NL3+NzRngV1PBjNsXA805MPeXa2vq1d/JGyptu/TzZXaor/CDGNUwzjBtwOhh+FAR
         CZKqxFrXxnNC+vQ91MxEKYB731FmM3DUOMN2tEO2zoJiTW2DDxwvuxFWoRtOPJmIct+6
         Yf8Oa9uwoK4Pd33dDJMwqaugSVs7LbquAnD1Ycb4P8d7j1bXCLoO37AxfXpgEv/UaeFM
         mbLkXeihNRSY9BFfNtkMOMsN9Zw2k+3SZTzre4q/CM+qLi+6nKJBykrrpKyLT6I4wcfr
         L+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        fh=14gnEu01AvKsm3So1Fbt9gVO+JMUeChtI1W/aHJtk4g=;
        b=enP2PoqWTnqS0J0bBYDcX1QTbwCXzRPIUWq8C9Cl1F40NbmUo0/sdSpSuSAa2l8Q6k
         yPcX6QITs39NY+muDtFVkkUr0BMNcyOXggimw7CuLFurFvi/asXWCqhKpoJ/3Bt2Dsv2
         4ErSf/2alnXfzooP77/cGfYla8kxCcDpr0Hp4AWHTirHlPAIYc7i6O+yXt47R1mXEMoo
         dWjL2h5pGVjqa9b2UN2zDuH6klD68CPs0TODjLmf8kZgDkWCmXJRdxVPqPK83fERE83K
         gUzkp8sFY0gkUIBw8J3NW4X5Rgo2YOpP5TrhbBEmszn93ig6f7jVp3pyBHs38EB/+svs
         ow8g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783254156; x=1783858956; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=VzBNXuFeXCaDWHRctHOq2OVFGDi+cOXgOuXJS9HNZKJhqDh0unQ7tdokFueuyCqram
         IY1F+bgS9Yy0tLEpcNEMlY5icUmFiw6aUAKgmuOFkGw3jd1ArC0dR5m1n51YHYqr4Ef3
         OAQpQnOHSY7KJEKJndI7/xEkHTQj9Z9YWmv3JB5TEUsXH3g3Mehqt/OrqHw9PW7Z9e6W
         AE7oxUHQiok3RaK95C7aiG+QDRXlWj6GEjGsSkq5TlJosUnF2g2W2kQ1rl4tIQ9BfzOy
         NJOmJ2aQyllsw9DcpRdq+c5j4QqUIol5Q7MDHlps9oZlmpE7Kh4B9mIPgCD7WzZ19Z+3
         l/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783254156; x=1783858956;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=d1MnhhTqRz3bFobk1+yPjMDhNWlYOtLE0jYhgQhd8qdSh6NuMFRsMEzwfuqJKrGfbp
         3i/IBVJ4U0tvxNHBOupMr4Pa3i4660bioIexqetKxeO2keIzHepNrjTVq0btpr3JvCTA
         DHvUUela5Qz/L6Sx5DMxNr5fv6riyIr/SutW9NA0gxUv52II1x6hFzcoYGZOFz7XbCnX
         q5EeDyAuFZRyYp9I7IiG7zfoAWuogc8OtLTIPYv5qkQoVl2j9/avsXIV6dnkx2MV1Zf4
         xx/twCIvBluu79wMsEPE9mLr8TS194eXfocJqodW8UuUE3sFXI/mHldg3YmQt2YotAc7
         oLsw==
X-Forwarded-Encrypted: i=1; AHgh+Rq603zwrH+JeaaqIf2LIjVLhoVfFz3cF/9w+3kyHeb/EYIrBV8LkJ3++Qzl+EpcMB2ReVv7dbMBvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiknxK9MupNcJKLI3NAoP3aZIWbWe3G8XUyd/ugYSIqMJvQWVG
	4INLMAYVpFneFmWXT5+7k6rmJ4eGjWk6WqpFIoYW1l8WjROpLvK/A5mQ6bwYXHj1agbu/+rCzRA
	sLj40MEay5E+h/0CYP4/EOQ3LZR9TR9M=
X-Gm-Gg: AfdE7cmKxc6QyAee+eeQeJeeVllXZ57qOnzTOvY5opxdwj16PUEJFflMiEowSqDP55k
	ihVp4lAbWdBqdsf3TRD3IFUDgLsuL68SUxnkKVs3n/VuX62hhyWpPgwSpJ9dhpGe5ceeQsvuEJh
	Pl8MCGmfgTu4hOFhqAkvOK47OuU9XZRm4QMMH6CEEGIiCeYJa6DBcFI/5wg3cK5frVcqbJUscVA
	7LWYoH8fOfsofF5JT5VuOktjf7OmkO7wY8gELcmiaIRZTvWBo5lgg63RB6WzVST08hVJylrOSRz
	sKdWtILZC/Qz5HACXu228AgjJvv9xAewr6PfDy5fScZgqlAUWJNUY08+Rd+5MMcehD+nkLsleCZ
	MsQhRU+rVw691
X-Received: by 2002:a17:90a:a416:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-3835a16bddcmr2702118a91.4.1783254156186; Sun, 05 Jul 2026
 05:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch> <akmnh0AKFfu9-OYn@gurudas.dev>
In-Reply-To: <akmnh0AKFfu9-OYn@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:22:20 +0200
X-Gm-Features: AVVi8CdKZk1uQg3RyoO9gWWnGdg1D5rtqZ5BcTTqS2w4TtsLqn1TqMImL9QufHY
Message-ID: <CANiq72k0zokLC_L2wPJRDb_CyvnJznOSKUgTaiHo87GT6Pwyag@mail.gmail.com>
Subject: Re: [PATCH 0/7] rust: Use kernel style vertical imports in various drivers
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 2:38=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> Miguel, could you please indicate if you have a preference here?

Gary is right -- it depends.

Generally speaking, it is best to do changes through each tree;
especially so if it is the kind of thing that may be prone to
conflicts.

In certain cases, yes, I may take treewide changes, with Acked-by's
from maintainers (and very exceptionally I have done it without that
if e.g. it is trivial enough and enough time has passed -- trusting
that people trust me to do so).

It is part of why the Rust tree exists, i.e. as a fallback and also
for convenience in certain cases.

I hope that clarifies.

Cheers,
Miguel
