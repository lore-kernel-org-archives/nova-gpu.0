Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794193840;
	b=J9WVNVL0Gn+g5d+D647nXTxQ1+bWWDfS7HCtggEnoDeEhSgmYLXxZe0Yt7jJLaoCv7FY
	 1AjTkrpk9GURodquRIB+TM5d6V4AGyqFEM9aYxRICjHBaaj12Vjc6mSbGFPDW9BJ15eea
	 yNz6Yn0dRVfL8BOcFHJgq5Cu4CUBNea1Qx6i2tOzE4LC51anPDRRZYoLR1sdnvrGtLqOd
	 1GnZDWjfU+P8gxWYEgMe/Rs+fLnIQ8xB679U5FOv46LoFT57N8jpeEoRqakrkj5VTdulG
	 c84xc89W+2A26VDhAtESF7GgJ/HvqoQeSzCkZFMgFCKdT7Vp2zVoRNkcypU0KhjfYcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193840;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=tW6nGmM8EeKf4Kx9zfqvxzBQJe7+fMs2MouFfO3xxR0=;
	b=0Kj+SnurIyTrsR09gIFHxiWyX8ec04SXe87Td9Bqxx699cY/AjGdjB8rBBkZatQI20Ig
	 hHrfFEE1CloLSBilw40WHvQFfkyFA916nKJIxP07slVgtFbFGRmulPEKaTRJ4Jez1X2Yn
	 x1XCeEQCtjXkEWY7C4fl5DRjcL4FoMI6qu+VBXMjyKkYK9Z4XoJmmEe+nC/KMCCsHJzN+
	 AY0APEQLJ4HoWyL61wv+h2k88Bo2MY6uggb4z7b0JWanzLh9HIHY39UK2dyy4tiP7am3p
	 rQ47dLXGEn32mAj0c7miyuZlm28oDgzHL0u08tPp2HXLHOGfz3yqor8r/CroDx75LEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UesLq7LX;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB077606A31C
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 03:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB077606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UesLq7LX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794193838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tW6nGmM8EeKf4Kx9zfqvxzBQJe7+fMs2MouFfO3xxR0=;
	b=UesLq7LXw9bMjlZ+DjKd2P5sUk4KP/oAjt6hLYfp11Cd0p5A5cWd8eJLMvpC4szaNG3IKO
	DfuvWFYQ7N/VhO8+DnpuKNmPWF/CmEPn+UIuvzxmqKTZtV/DLjsQ/LPzeM3zrI0ahJE91z
	Sq+PyZs3jUbmdqq+4DCdg3RE+lCS6Iw=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-kBlnGNgmPpOHPFXMyrUDKg-1; Sun, 08 Nov 2026 22:10:37 -0500
X-MC-Unique: kBlnGNgmPpOHPFXMyrUDKg-1
X-Mimecast-MFC-AGG-ID: kBlnGNgmPpOHPFXMyrUDKg_1794193837
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso702870eec.0
        for <nova-gpu@lists.linux.dev>; Sun, 08 Nov 2026 19:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794193837; x=1794798637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tW6nGmM8EeKf4Kx9zfqvxzBQJe7+fMs2MouFfO3xxR0=;
        b=URLP9H6xQcNJW80a8W+U+b3s5xeV0IoNvc3gBy5yd9r6Z+GkzTxh1A6VLI98+d8VWK
         JmKZBj7Sw3560maeJ+8M1i/AsYe7LAvLnYj7c8Nf/pms20e3llZUytK7S1GMoR30IY8P
         U93v5kkcBAnS2JznJcNxmxeGfimrJ1QxzxUFPTspS3dx5VkMNTM0kE0SxUzCvQzS/nZ3
         NGTmi1L+sgtDhjHqvMvlwtKfoQRyhjELjWfTGmwRwsT3vlEI3MXq8ubdsNeTbbNhrDf8
         ddXXtNm2ih6b5RVLkeHkBfdxXX9i3Gaxw16tclBx2yxtfhaEy7Q50mhuruCqs9LlO3IE
         n5lw==
X-Forwarded-Encrypted: i=1; AL+hErFJ4Z9bqUJS62kNDF3WFxgAZWZizdxmTab3++2x6TH+3XUqvMXSz9jpdbpq3cSqCsIjyA2KEZpvGg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9VxFDjMULenJyQH0KbCLbEXKLsb3uGB//9lS6Nul2l7tCaKeNu
	3GohifNQisw4Dm6SPMYJE+e1l0HFcE8i/AEjtmiJhB+E+l2rmeZYRte0rJgDW6xIvisQysPmEns
	PdkHiXMJV9IqHH4zuPyW4/UJJDipySGmDV2SLhh2qkO6sOjWL3Eke0Hzwsvheneg514HV1tMGFC
	/iIyP2NxgblJ1MOiiw/OceWVGnsaLH5P5K9Fg=
X-Gm-Gg: AYBFou3CftrTtPGD6soqa01vW/9l5gFqKAeLHb1Dbe1A5iAXvih9b5u5HwUJOVb7pMl
	nFFsyeKr/s2E8gm5lPdaY8thnuQN+/L7UtAnatoDtMdRCOg3i2Zd1kixorKtfktUrxA3Md6x/JM
	3jBuFIEdlCzOxjO1oLE+XCl45ijNLsLTqSXh9nNxvaAH2hDgABZotlnjg4V/4IztPS2aL25zO1G
	yL0XfIfX7vuG+D/
X-Received: by 2002:a05:7022:1701:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b39fe9a6f7mr4227467c88.18.1794193836362;
        Sun, 08 Nov 2026 19:10:36 -0800 (PST)
X-Received: by 2002:a05:7022:1701:b0:1a8:ff0b:a4e1 with SMTP id
 a92af1059eb24-1b39fe9a6f7mr4227436c88.18.1794193835747; Sun, 08 Nov 2026
 19:10:35 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-nova-timer-v4-0-45a7c121d4de@redhat.com>
 <20261105-nova-timer-v4-2-45a7c121d4de@redhat.com> <DMNCVDFYPL3I.3CCYXY4641F13@nvidia.com>
 <CAMwc25rODe5F7MdhWEr80q+eOitKqg-O0LQhEWOMSVWZodfyMg@mail.gmail.com>
 <DMO7FUYY05LK.123ZPLIW24C2S@nvidia.com> <DMPVN025DBS8.1HVI0U45RAS5J@nvidia.com>
In-Reply-To: <DMPVN025DBS8.1HVI0U45RAS5J@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Mon, 9 Nov 2026 13:10:23 +1000
X-Gm-Features: AclHuK_55-IbEj0SHASbnczQ15jOjxzPGzrLVLoFZHP1WelyYfdlCxNf25lfq2Q
Message-ID: <CAMwc25pL8fY=Z6D5wKZ5vFhv_438dp0Vm2Uksvq4db-jDZSF2g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpu: nova-core: add support for GPU timer block. (v4)
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xWFydkiZLKn8LrQpFDpDzBoPeMJzN6vvmsj5l-laxZg_1794193837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 11:51=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Nov 6, 2026 at 11:41 PM JST, Alexandre Courbot wrote:
> <...>
> >> nsec_lo/hi are now used in the register from_nsec for both tu102 and
> >> gh100 registers.
> >>
> >>> I'd ignore Sashiko's suggestion as it looks like it is trying to
> >>> reconcile the code against the comment instead of the other way aroun=
d.
> >>
> >> I just fixed things to truncate and used wrapping_sub, to be honest
> >> being careful here is probably the wrong answer, my local review bot
> >> pointed out some wierdness can occur in 2043 with the current scheme,
> >> so let's just keep it simple, wrapping subtract, and feed the result
> >> to the hardware which is what the other driver does and what nouveau
> >> did.
> >
> > The other drivers do what they do, but here again do we understand what
> > happens when we write a wrapped value into the timer registers?
>
> I checked what OpenRM does and it doesn't appear to wrap. Actually
> `tmrSetCurrentTime_GH100` has the following line:
>
>     NV_ASSERT_OR_RETURN(secTimerNs < osTimeNs, NV_ERR_INVALID_STATE);
>
> meaning it expects the OS/GPU time delta to be positive. The error it
> returns in that case is ignored by the caller, so nothing gets
> programmed. In the absence of a better alternative I guess we should do
> the same thing, i.e. the `checked_sub` and return early (but the
> returned error should be just logged and ignored).
>
> Nouveau AFAICT does not write `NV_PGC6_SCI_SYS_TIMER_OFFSET_*` at all.

I did this in one version, but this seems to fall down the systems
will just stop working at some point in time.

To be honest I don't think OpenRM is doing the right thing here at
all, so it might be valuable to find out what the hardware actually
expects.

Like if i'm storing an offset between the system and gpu timer, why
would I care about it being + or -, it's an offset just handle it.
It's why I previously used i64 to calculate things.

I think the wrapping sub we have now is safest, else at some point
someone will change their clock and the GPU will stop booting.

Dave.

