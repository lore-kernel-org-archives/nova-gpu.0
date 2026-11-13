Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533035;
	b=Lwi2/CtiKf8YoZt0jV3Ny53FPj2RBlzsYT7BiipOR6j6qNhWB0020uHx9ylHAVD/AE7j
	 D0HB36hyaVY8ZNpGW5LqRsqIIno1CaxBXLMVjLruD3OaKihOSKxPNWccZe4ao7mhZU6Xx
	 DhVuL18adMU+J+cOFx+oCpTyo31AcbGhcJnMVJSbhUNpV+wgXcA9HL2a9V6sZ1VTN+CLE
	 tL4DLZKYPrp1W0/cfoUmxr3OUU1BCo4+fruPVLg7rWs+xWF3l2X0P2pLhu+qODFGF7KIL
	 9v7mCz2DVzFBto0UlILtCs2r4vb1O+8fEeB/pptUwzEX9B0mVEP81B49/P12Vwh6PfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533035;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=DsXff4wUSwO9ldrbmutLQskXhM3zDPw23zXqnnHOUEs=;
	b=Yd9LR0OYGkabnTfTEvXKiUwcQZ7W/561OEUn/MwKdlg6Jv7Wb2MPNysBQb8LhNsUFIfT
	 fyabHqeUXvStt7vVvPnZ2FX/FMz3Dfv/0gBFnjfLwYkvU/TNsGzVpJr9fWzxvMvfdHkH+
	 Z/sEsU2Qa3ygo4CRcwHSCYVfXFO0afWjFTcgcW/jttJmdFX6dU7ijr3JQfE9nTsnIOYrb
	 xkP07eS4sD/DP6C5fL41fIh3ARcmEX/qTmV23NY6s4tojjrPI6f4fY3wV32ZNex/IpavW
	 YSS+KZrQOfmuHSKmyEqbllobv98cLekA1yln+1f7qbORImVLmXSr/2wenBNvV4GbPwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZlarZeFd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFFC606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 01:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAFFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZlarZeFd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794533033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsXff4wUSwO9ldrbmutLQskXhM3zDPw23zXqnnHOUEs=;
	b=ZlarZeFdv5S/Tob0bvl6WaV3wlM5kQJ3JJCVM1Okryj6nmEWGQvgGG8Z0bMqPzOjKSlCzd
	YFWvvtBavtD9B+Rj2YYIKtrfemJB0Nlhdcgx0u5Gpl7pBXKxJHKFcJqeQ8gw+knWfYLomE
	IgzGumG/4dSeLLkSp7zf5v0BhHWTc6A=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-ozEXagSmMtqjj7qn4oOyow-1; Thu, 12 Nov 2026 20:23:52 -0500
X-MC-Unique: ozEXagSmMtqjj7qn4oOyow-1
X-Mimecast-MFC-AGG-ID: ozEXagSmMtqjj7qn4oOyow_1794533031
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-14373747468so354450c88.1
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 17:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533031; x=1795137831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsXff4wUSwO9ldrbmutLQskXhM3zDPw23zXqnnHOUEs=;
        b=1xiPcvIgRPCdroV/mWxrqXkPI8lFVWrxG2fHk7OIi8CLTOc1kZ0LuUMjexNdhrC/Rc
         o053FKDq8iCaOF90jMcggGBWNJZf6hbdU9GtZkg7ILvx9oH8MpfpWN3hIPY3BqQzD7q8
         c3h+wT+/Re0lvooK7o6qh+VpUYGoGktJVFw1ZB4GW+7n0Z6oYmKmiefIKo47cncY/7Cn
         LWIvUeJwtkCawH0k9M5yqDnHsKzyPJ8jAvRgFvwJ6t7lB+lUb62QzSysbOBLHBFr3q1u
         PzQaAHuvzHCYxTXunAL2lK/z1P6zAUle1xyjpjyu9TV8mcpc/dMhamvIchVsmjEcmXSj
         ofYQ==
X-Forwarded-Encrypted: i=1; AL+hErFYcYP4xcJ7pJ4FicoGs7zPfy8h8bz0dcRsQ3SREyYXj4WoToKHNqacLCybGX6/HZZ7AgTCwMSY2Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8LMfdSN4tbbmBpYHrLx8kaRibJ5cAs6SUf0uhjfwJL9fupuiNz
	X9V2kPTEb7ZJDK1ekbAI2VC+nnQ8G/5GdYWBp9+Y4LFqvauKwt+b3UYBe0jfvJJfu1E6OA9P+Fy
	jhUiQkq/ltYSaajVGF7nHTZrt1kt54r8ebRnnAk9n/RV697wsl17/cScaCLa/tS7Km1BwjoxCs1
	FUfp69fHeANhdstSaopQyUSY/FW4ghnl+K2bICsob/dp4=
X-Gm-Gg: AYBFou1mLgX5z1e9aea8cS6SJe5ZRzBJkMwovriJh6ew+lmEW+o6GO4zsQxReUWUfVW
	w5KJwefqlbWavbW54OrM4+fUI3kNSshboFqS/EohLBGQLTPFeElIgbYZ9LuJuVtIA9/nU0Of1hP
	uiO/x2HoOM7ob96BA+F0K5VqtQC2MDKXdsLSI4v175IZ1+DBfxggIo7DmMhciqrnDL5MYmUMNDu
	0OhnqRMgydmwwko
X-Received: by 2002:a05:7022:f106:b0:1b2:3bdb:35cb with SMTP id a92af1059eb24-1b503098c42mr1091852c88.11.1794533030819;
        Thu, 12 Nov 2026 17:23:50 -0800 (PST)
X-Received: by 2002:a05:7022:f106:b0:1b2:3bdb:35cb with SMTP id
 a92af1059eb24-1b503098c42mr1091817c88.11.1794533029655; Thu, 12 Nov 2026
 17:23:49 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111-nova-timer-v7-1-3031c2476551@redhat.com>
 <179448764517.621816.16006004780926601543.b4-ty@b4> <DMT91N7BGPUU.17BEZWQDLH3CC@kernel.org>
 <87tslmupje.fsf@t14s.mail-host-address-is-not-set> <DMTASPUDKG3F.1H8JUZ5C0A2M3@kernel.org>
In-Reply-To: <DMTASPUDKG3F.1H8JUZ5C0A2M3@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Fri, 13 Nov 2026 11:23:35 +1000
X-Gm-Features: AclHuK-zYR3AUvkF_u5QDgTC20BaU9keQdeygM7H-nBWqghbHRTVA4F7Q-vtAO0
Message-ID: <CAMwc25pvQ6tz7BBtKT4RGBmjnUZC=ivOQHO4M=3EHeASs8WEdQ@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] rust: time: expose as_nanos for clock sources.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bn1hCk8bWJcMqdLT3eTLjJuoJPsqrNU8Vs8wGfc3GUc_1794533031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 12:22=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Thu Nov 12, 2026 at 2:50 PM CET, Andreas Hindborg wrote:
> > "Danilo Krummrich" <dakr@kernel.org> writes:
> >
> >> On Thu Nov 12, 2026 at 1:47 PM CET, Andreas Hindborg wrote:
> >>>
> >>> On Wed, 11 Nov 2026 15:23:24 +1000, Dave Airlie wrote:
> >>>> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> >>>> the cpu ns into some hw/fw, so allow this method for rust drivers.
> >>>>
> >>>> This is needed for following nova patch.
> >>>
> >>> Applied, thanks!
> >>
> >> Do you mind if we take this through the DRM tree? Otherwise the subseq=
uent patch
> >> in this series has to wait for a cycle.
> >
> > No it is fine, I can drop it from my tree. I asked on v6 what you
> > wanted, either way is fine :)
>
> Great, thanks!
>

I've pushed this to drm-rust-next.

Dave.

