Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426664;
	b=rRnwtciVy4RuoBWG2r+gKrxyRQ4N8LxxZfhGN4L9ecYSS6Wojno1Z0qbYNdr32HPO/ib
	 CCbnpvkSnLYnSKrqCLW44lbz1H3nnW63VXZpkoHvOFkPoTQucao86iS57nKDwFKMddmMl
	 /EcVbkgN8x8/4/auCmwV80gfyav42dBaBWdbb0q1IC618s0MS8SXRnAN9UNJk8h1WQVHB
	 Pxp8SUWTBlCXCB8aiPIzU4Qieig9lsQ/gFmNPAqt6CwPXZQD4wIDSgs8Tn/oa5vwY82Zd
	 F7D2/r7I7+xaDQrgVQ+SFU1eCjeefrThLFAK4UXvVW8c2HZdkBy/bKistvCWe0LE8uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426664;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=pd24Km/P434HUb31zAN/wsWSEZ40dQ4mBIne5ONpsUE=;
	b=RpRUhJUKliyRr8FC18t1B2K1bRo55BHJigWUFUWkggySHnKkS+2ibS5SmhFkM5qMRzJr
	 HP9jbOk/m+o/tmrercYSLn7nFRPWt4dsVnE8Iasy0s18dJbCviDL0jNLzg5hp4Hh0WyFo
	 Pj11iGJgU9aw9lTFzebF/CIBBDMVlcWqEG7KmODcEKt8kjCiCNa7em+f17xY7iveckpal
	 h1zXeyuqM41YzRWHqLM4rLwQlz+n80ew5bVOWLC+j0zeYuEdlYE/3KogkSOZ7zeRZWCBI
	 Fr9dt54k/txWhh554HAdKVZ4TjOIMhZpQywoKU8szBKhH/vqzp13yf4OPDd68rXUrpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="YtXQQme/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07D9606A324
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 19:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A07D9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YtXQQme/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794426662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pd24Km/P434HUb31zAN/wsWSEZ40dQ4mBIne5ONpsUE=;
	b=YtXQQme/Bibafi2mPIaY8kZm0pfCf7Cn0oDBtwy6tbpG3uRx43ooS7J3SMJrhy4wv9krtY
	5DyaKmX/gi5KjW9xxTQw4d7s8TXpwM7BpXj5f9sKaCcZtVD9xuM+9hkC5hSI/serYAAKiQ
	wCLC+b21hT4JaQ8MB3VBirc8BRCjM0U=
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com
 [74.125.82.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-wCsr5_IMOzOpvvxjuUvy_Q-1; Wed, 11 Nov 2026 14:51:00 -0500
X-MC-Unique: wCsr5_IMOzOpvvxjuUvy_Q-1
X-Mimecast-MFC-AGG-ID: wCsr5_IMOzOpvvxjuUvy_Q_1794426660
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5562330c88.0
        for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 11:51:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426659; x=1795031459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pd24Km/P434HUb31zAN/wsWSEZ40dQ4mBIne5ONpsUE=;
        b=DxRp2otXlU/+GAlv1P5TFfz2dA2WwViCOAJE4YM7UqmBHMTiOXNOehtyoYs7Y3EGOp
         UJjmLNnoqlZ/vv8NTDyLTiPi00xidGDYL7l3vDF2tG+Rz9vrQjT2R0p6zj1zZ/pPReDy
         dT2AuSeu/OTyX097J97XXQv1foX8ejxoYx6d220xHp8HxPDMph+H4JYAUSSgBgBlD0sY
         O2+uGM7A0JrqpsvlP2Q0SlTZdzXRu5evXlcr+DZoYU1tPwqbfaVJEep6JZMuSqeXcMLs
         UJVPTScpOKq+AxPuDtPhGtIFt7IDBuYvzQZGsrbgz0FyNTsl3SCLXX8sE+ooEvkrsLQe
         S2yg==
X-Forwarded-Encrypted: i=1; AL+hErH9xKQK5gkYnaSTFXjWpNKq09mqveftbKugzcydHJNN+CEZTM4fZmzo36MmwtgvNEPezoJml4sTyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9itfo15DSJs7U/nO54z16EbthjEirb4vBaECBZCXBBt7gZ46lo
	z486cF6yCKlRNJ5qhMvUVU6Mvz/dL7+XD/rZFMKmOGoCJ1nYeW2Rgd4XRA8y4FgBCUrp+YMn7td
	ntpj+1TiKh6dJYEQhgbFC+ioiDTRDgWUmQWfBNIGoYjQBwnuzu1IOLEmwO5CPj2WzWBGdFoxMHC
	E/kt2kzz8+x19ShUDil3HqtNOsrPU9iZRP6ro=
X-Gm-Gg: AYBFou1Frc2/b1VN8OI0eGmL2LGeUmzoVsZtwg/s6wn6lf+f8MhvA1MlfyASbWyhvhm
	CINEZlyY/dnsAD5C9FXjvz2kuhBmXEUZQiJjfV4/VaCWFLq91vUth4KB9nQ03uJNUruI5pzTKi5
	5xw11a1hiENnV91apnieWF4V/kYNGqjNLYkzp2r/U0Wk0AamRSJskoQxZ0kFtzt/7WCvG2gxD17
	99pL57++9Yad68E
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id a92af1059eb24-1b3c032edcamr2843620c88.26.1794426659200;
        Wed, 11 Nov 2026 11:50:59 -0800 (PST)
X-Received: by 2002:a05:7022:7f0f:b0:191:3c:aae7 with SMTP id
 a92af1059eb24-1b3c032edcamr2843612c88.26.1794426658701; Wed, 11 Nov 2026
 11:50:58 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-nova-timer-v6-0-5544a3bd8b28@redhat.com>
 <20261109-nova-timer-v6-1-5544a3bd8b28@redhat.com> <HgxksqDneCpV2KCW_EeAGi_PEZ4HXYdwPqm0pHMkGPQlo0kktMkB-lNOjxQyUZtYhs1JzEFfjHyQAgDlVAqMMg==@protonmail.internalid>
 <DMRKZL0RNSG4.3P7B0RM71I0CG@nvidia.com> <87zevfup32.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87zevfup32.fsf@t14s.mail-host-address-is-not-set>
From: David Airlie <airlied@redhat.com>
Date: Thu, 12 Nov 2026 05:50:47 +1000
X-Gm-Features: AclHuK-QOvDZJWTA27jrdMVki7iIGwSXEqRY0dpTdrg7OUvqQUE59SM30iopFhc
Message-ID: <CAMwc25qTnstXbR_z2pfWRKSezdGXBiX+XsG_37CQL7EMr3__zg@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] rust: time: expose as_nanos for clock sources.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kXFaT1rtQtIBez5558q8HmaDFcaz4GfkeSnGVq671kM_1794426660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> "Alexandre Courbot" <acourbot@nvidia.com> writes:
>
> > On Mon Nov 9, 2026 at 10:55 AM JST, Dave Airlie via B4 Relay wrote:
> >> From: Dave Airlie <airlied@redhat.com>
> >>
> >> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> >> the cpu ns into some hw/fw, so allow this method for rust drivers.
> >>
> >> This is needed for following nova patch.
> >>
> >> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> >> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > This patch has also received a maintainer acked-by:
> >
> > https://lore.kernel.org/all/875wyoydqk.fsf@t14s.mail-host-address-is-not-set/
>
> You guys want to take this through your tree? Otherwise I will apply it
> to rust-timekeeping this week.

I think we want this to land through d-r-n whenever the timer patch
lands, I suppose we could merge it to d-r-n now actually.

Dave.

