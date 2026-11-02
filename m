Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599359;
	b=MgI+DlOIIu+th5EP0PGo4dj12dfV7F6j8IziGchICA3eQ7OkyEfx8EXgPPNNgegMHg80
	 r8Fog0pmTDkwdJgHtyL3hvCZ1ODm+G3Owo7rwA8W402ZAlzP/ex4lkDE4zTRUjmkda62s
	 j83BTWlphxyrrpu1vrS3U+ttGrryJGgX0dFu03hvsVXf0m3ylrWD1BUG18i3BY+GNqn8n
	 BS2/uJmnmTg9lOOOMHEUk9WZFQn1KW0kMiBTpu6GESoS9u3UFIO7wf06fPF9zWHA+AtOc
	 jiuHmx/60NqIAtPxuC2vDqhObeuHIwAN9D1K8MFJTTJ1HO3JvlCVqCRCXOwp3JKGDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599359;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
	b=Y0b6YEcBaBwPQQQgNdBAN1mR/fL1AGdi6JW1lFnZA26RtWJ0YVGWCOJ7/riqN1aWS1As
	 Xzhs465asWlIrTX4nFLG5G/ZS0qFq/DEQRe4Bf21JwGdGjx15GhVC9GSaW7ixL0Na0jr9
	 E/3EAYJBj4eAkQj00nu6ohJGjcTr88Vq1tvriUfcr2khiaH2rhtkoWdgvvoBApS1wsbJl
	 56Mpa6NU3ZrYM2LBIPdcnN0PvziI+iudRZgiE5Q/quCPA3mzPfc+6Ui3qdLmPtaGKvLQD
	 /F2m9m3f3i5EY7ss1VO3aQ2nHeyP64wVZqfRELcMLNimMgkXr/rFi9QoKahPQJk24GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tc2RVoSh;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A34606A32C
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 06:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A34606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tc2RVoSh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793599357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
	b=Tc2RVoShe7XPy42P55C0xp8/Yl1sATU4Sa2PCxKp0eB5vJOmoC0/VoPT1QWz8Nk1bnCNdG
	hdtgn7MM4y3Wfi3BOyqRatO3RRcSGwI+I4d0BXfk42w/nncJ1jmwg+TaNtafF7u3TgdjHB
	ZkxM6X2QyxM4wLO1WWD6+Iu4m10FHQ4=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-vOvks6F_PU202OY6XLHU2Q-1; Mon, 02 Nov 2026 01:02:34 -0500
X-MC-Unique: vOvks6F_PU202OY6XLHU2Q-1
X-Mimecast-MFC-AGG-ID: vOvks6F_PU202OY6XLHU2Q_1793599353
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1af203073e0so2377421c88.1
        for <nova-gpu@lists.linux.dev>; Sun, 01 Nov 2026 22:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793599353; x=1794204153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QVqvMqk4u+JlZzNJJ2w9X65onVE+yQ82LguoHb35TXU=;
        b=YRgP2ruO0bv30UV0a65W8Z7hjQ3hvmJwzaRS+JQIvAPSfYcETEaNFmB0Mei2kQdDz9
         0inDgnuhEWEDsx1tnJhxKbvlpWWw+D731PFyyzNlCx/eOunzUBhmQqCmo6rWwLXEq5YQ
         F/O3VC0mnSZnN/FE7+yqEQFERzgw1trB9qkOkNsb9SyMJ0uhDxZsphlL1LKV+7ihICV4
         Ajq2DJsnD5pYnl9TN0c6AFgqb6gxbM7Hv+u8wp1W/0NB1/UNS8eo5qbzhHaYEaDe86Bq
         Dn1DUqQl5mQKGyskQu4BWe0nJPtHDz8X9ockuiKHUeCLVFl4KqKEcSh2D3EgNAP/v31S
         CsQA==
X-Forwarded-Encrypted: i=1; AKwUvBwCS0atj8HLMkVehFabnC2AiIT/RBlX+kOzcPv9e9z0BzRJ79nFlQQPf9XiqMdATOtdy5fg41sKbQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKmh+/liWRJHG1OJ0VdWrUyDJun92N61NkqcRmt56Ao9eP4nVii
	4dIBYesOV5oEZpqbAkpAHrzaGr4WWIrQzYSUGbcD+fwfnA6HIR31yTYMWiQjUQMSvaE27YupUwv
	W1/Ez/sTfp1tOUwtPpx7QIZMUUCl+iGDoei2J1z4yZ+jjxtZ+3WDNKKmrH93haCrDjfIC06U4bl
	TBggxa+Cr3hSvZO7Zcz0FzpgYK85gkG0iqchg=
X-Gm-Gg: AYBFou2ZpZeKLw5cnKdHBlVcPJh0kkWVyK+o5noT3BtN8TJLF2Rzf6dZUz49ohRHBjD
	QDlk8JRMsZzE0mi+tfLRG6kqWN32Cl0MLQ4e7cJuBez3u+EbtusoYVCw1I1AbM4HaQvhzY9ndew
	/8Ejzma7eTFAhUwjwFiS6YVagT5Us7djtSN/m3QsIoVYJl8QgSvIi3J3EMLSyEeaILxSQtieGv8
	wUfCCwTktOdwypy
X-Received: by 2002:a05:7022:f903:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1ac56d94becmr14324055c88.4.1793599353188;
        Sun, 01 Nov 2026 22:02:33 -0800 (PST)
X-Received: by 2002:a05:7022:f903:b0:143:3c9f:10a6 with SMTP id
 a92af1059eb24-1ac56d94becmr14324025c88.4.1793599352617; Sun, 01 Nov 2026
 22:02:32 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
 <20261026-drm-rust-next-v1-2-14a4ae469175@redhat.com> <DMERUEZT5R3O.2K65JB1FXYVR4@kernel.org>
In-Reply-To: <DMERUEZT5R3O.2K65JB1FXYVR4@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Mon, 2 Nov 2026 16:02:21 +1000
X-Gm-Features: AclHuK9LHWn1BebolAfE1FBkDldbsia4yVg1MKh18rCBAaEY3IqcLaZpvevtFHY
Message-ID: <CAMwc25pKs4jT63Ai2hE7qLu4kQfsf6h86EE3CbTB86hU6gjtXg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add support for GPU timer block.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: desiDJHRB0PHbGgAchS9BFLRayaQ4pxqtWMBeMFhdTw_1793599353
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> > +#[pin_data]
>
> Why is this #[pin_data]?

cut-n-paste fail.
>
> > +pub(crate) struct Timer {
> > +    chipset: Chipset,
>
> Why does this carry the Chipset?

indeed don't need it.
>
> > +    sys_timer_offset_ns: i64,
> > +}
>
> More generally, what's the purpose of this struct? What does it represent?
>
> Nothing seems to tie this object to a particular GPU or prevents constructing
> multiple instances for the same GPU.
>
> It also doesn't seem to provide any access to the underlying HAL's functions?

At the moment this object has one job to store the 64-bit value from
when we init the timer to give it to GSP. Do we need an object for
that, I'm not sure, but handing around a 64-bit value
sys_timer_offset_ns seems a bit raw, and there may be some time in the
future we need to add more timer stuff.

>
> > +impl Timer {
> > +    pub(crate) fn new(bar: Bar0<'_>, chipset: Chipset) -> Result<Self> {
> > +        Ok(Self {
> > +            chipset,
> > +            sys_timer_offset_ns: hal::timer_hal(chipset).init(chipset, bar)?,
> > +        })
> > +    }
> > +
> > +    #[expect(dead_code)]
> > +    pub(crate) fn sys_timer_offset_ns(&self) -> i64 {
> > +        self.sys_timer_offset_ns
> > +    }
>
> What do we need this method for?

This just gets the offset value, I've added a comment on where this
value needs to end up once more GspInit is done.
>
> > +}
> > +
> > +pub(crate) fn get_cpu_time_ns() -> i64 {
> > +    Instant::<Monotonic>::now().as_nanos()
> > +}
>
> I don't think this helper adds much value, let's just make users call
> Instant::<Monotonic>::now().as_nanos() themselves.

Done.

Will be sending v2 soon.

Dave.

