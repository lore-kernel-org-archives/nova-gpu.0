Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795089009;
	b=X3fY+h5JXR5XJlgMLfrAlKdGUjMBVDji3mKjTK0kV7G8MZZTjp5Oj7+wclCPhzC9uVPe
	 3RB8T6q1zsbYHlwnBhfGC3CH+k4DdSg2CJGyKnR1kq5c2oiT/IXpZcL0TbbInmjy51MAb
	 Y3tPMGAagyPDwjRPwoRo/+M2k+sKcq5y9PZwHLnMeh5z/4r7TJUZ91YX1PEoAhNQAyXmq
	 2bUNPEhPIXp3g0rj/LnYI8PP5HASz9/S7Szv/CXjEtXiWWfOqHQ3NjCLXR+U5JmqWFqv5
	 o2mTxpLms+h30qHU2CSy/+7/vslsSWVU4Rhwy4m5yNxFApbfknmJvlSNK6J9dD4CgpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795089009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
	b=OAoxQht/wPlc0rSTOA16cAIGrwlvKKOH9x5CtCsjSG8vjB6OgJaGYQ9qnQutgw6niV+r
	 v3WxWIg5/bUVA1ZlVpSGky3il9YXyv1ywKna6s7BRkTIEalPJv+UZX8TCbZ6TziwIPEBX
	 LUPcOT66ZCWo/gCIq3e1r1ddy/mXYSaU4s6j1FRQ0Ox2GT5DDDqPG35w19xZMsQ0TSsa1
	 H454BadI+bUEpsi7zCOts/Ue51XPDnNl0cdFrkS8TGEwjJj/kfQno9QzWNgY6EZKYcvIY
	 bECGho72RiD6mUYT0iSOhfAXJJbBp4iqnHqq5lH4tHCKbcBDuKEZFKUBrYpvLdTk+HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbyPwdMy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79501606A326
	for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79501606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lbyPwdMy
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1380326f8f.3
        for <nova-gpu@lists.linux.dev>; Thu, 19 Nov 2026 03:50:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795089007; cv=none;
        d=google.com; s=arc-20260327;
        b=qRp4OWCdbRHtu0y2IVLKmMU2Yqk48F1iFofP+RuxpfwRgGf5WJic8p3oFXNRsKiha7
         LbzWJWOsfXbPviOEHElCA9dsIvur8wxtjUZGKEU+woOKbIXxsmj73/MPGadh5ECvjAYE
         I8s0i/BmBHwS1hVk7Z9OSfmKaFhrTKyfsaJygF8isS+ncTqpPk6EGkOr+1bkbgzt2fQf
         uA2mW1sgQOgvmvILUJXzhyWhTWhF5iVqFcg/xtVYyB7GGBQMkABAdPg+jzhdU/UM+NeO
         2Hodx+mjumtr52sKNSONTehKFKgz9R53yaPHU+kSJWaT+ePerrRHALFvIam3OXGFyYR+
         gizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        fh=9uMYj2RfpBpr4PM67Pg6GB58e7DB3Tw7aZf1uSmmY1U=;
        b=k0FV/MEmyGrkZzLgijyVcMoAwIrxZcC7u9ZOsfKjBsyC8U+tVQV9jp+CRzqge5sCWl
         MrDQFi4JCsqQApp4S7ZLx1tMnqydZHFxlUAZthcutW/RE4CC/5rG0cRRCD9XAH5MHYDw
         0H3lTfI/GCrZEnr070Wb6w0lGd2Qm7aeSY5x/I5SQgQKKcMsFoTaeQSnGp676liX3Cx8
         c4hL+Rn2Cd5bjF6WoVDkXMRdgH1pqZ2KDmoin3AWWaj/oYj42dpJ3/fWZOeGcDD4va1V
         5KqW7GKvrHaSIsPHKkOkQAxuznFfywgU70uUtqwo97Q5FCCoOOSvbf1F9gCyP4D92TET
         Kzpg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795089007; x=1795693807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=lbyPwdMyfYefXkq/4jAprUPIpzt/b96euM/v48O8LZ3PlgclhIZ+Oj7JsMG+3Ny3Cf
         WYQgHZUH4soZAkd7zWXZBSElIqVb6smbyybQpwvF63IcvfXXl062qfBTTyARqrMlpsd6
         nUnYug8V7OCwpYYG3RBHV6shDme9ch5VNPK8CJyalnRVoPtlHeMNGCjxQeJCXHy4hbh1
         0Wq6YFd8L2dGWiL13iYyqqX6B+6pM5MbALBFQC557RV0W5yoEDhTk8tSMDXNC41GgEdK
         KLS6oGMCuM1nrrFbHPmSVtHukjAbNyeaf/+jeyeKE1c1DvopXtwIyeur0BWx6nGiNIqJ
         r/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795089007; x=1795693807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOO8IN3WTwfTWmmyHCF/uCzTotxA10dmHaLxKg4Nq4E=;
        b=vuhxl6k86K37pKdOydBbIf75RC8UT71QoQ8qM1FH5lKGgsjyM/jamq8ctfq1VVMzSJ
         08xCEt8LDfQD/9UTHZ3eCFphqO6fihQjFyj/Zot2AKH+tP87RhaFB77TDkuB9ru5MXKq
         QfCNOSR7zxRi/uOihPBFbLEhjVtFpCKXtKkH4h8+9pqEZRN4EG77jZwwsHRDrtMKm6j6
         j5DYtdhLFa1ZjigRNlPUeFSPihwzZgW6+HqzMwjVvAMTq61/GHTLwtlVVK3JWxwUfiSY
         hpWRJRs8/CR4XrSREhf5GDYs4iYahXqYs1GJL6uhumFtxvp1w7Uel9LmdehGHWCW7XU2
         fabQ==
X-Forwarded-Encrypted: i=1; AL+hErHC9yBXvj7el+WA4ySASepG8AnaUIh1LhyOVcnBwTMz6G2pVTKr/wZ0LfL5YWLAEB7WTyKpUp1y7A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8vgl5B0FTycoA5NyGrIolcvmKY242+6BdcxJ+E+IPNMbANjUXW
	nqYi4UP0wZmNohCxQ5nKJAGR0AWLXHr3EyReVvoupkzIvLaveuMC2v2PjMZXAVwrsxDUrRYWhJz
	I7iHTSl6M34/AhJ/xGXo6lyjRcYIVQO8sn3wU6yn1
X-Gm-Gg: AZFdTZfbtyUl4C4atjWlgrNEOFv8wt2bl84uN6YuF7pn/zggiNnWAKzSnCzVv12CwDj
	CDogWt/4wtu9gBTqtgB55LJD0MDFVmPSlpCFGUedSYTLroB4LSdUUyseZeitdy3+JqWy2d34plX
	f8muqMyiVj72p1kb/iY7EcvUZuNrycyrxW3SBnSAG4s0EmUuE7WbBnIOOfoBxs8meM2ot2mS73t
	PVDwJevbqNDMX0oc9MD60dg+OMVBMjluvVRp0/C1SpSqJ7fDDmcR/wEwiLBRLu0hQ/25AvttHa5
	DK9GCjL/p46A8nKw9NdvEZfIGbW0cg/gaDZRE093lyr8FszfLc2apjHapD6XUP9LQsLMpOHDmL2
	yiJ1C/CsQjLYQj8OGrNLFIN2x5KiPwuQdkVLxQzUdc6LTuB9q5C1bfSPboggT5xV7yghBFE4uoN
	QEIaGdXoJny+Obz43JFl3t+HUVbbVaayVM6qwWJkhuWVUQ
X-Received: by 2002:adf:e183:0:b0:4aa:8de6:6648 with SMTP id
 ffacd0b85a97d-4aa8de66db5mr1569581f8f.45.1795089006191; Thu, 19 Nov 2026
 03:50:06 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118181245.2583303-1-dakr@kernel.org> <20261119111746.3049044-1-aliceryhl@google.com>
 <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
In-Reply-To: <DMZ5ER6XTNLG.2ZJOF7F4100XW@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Nov 2026 12:49:53 +0100
X-Gm-Features: Aa3M54oh8HJOrpuOfJ-i5QqnZtSXVPWrGr-cWZKRejJI37TjGzDfWl8zYFwePng
Message-ID: <CAH5fLghc63zD9c1F437pQiX+ohgSkYQe4nt3xP4gSTsqAVLzBA@mail.gmail.com>
Subject: Re: [PATCH] rust: drm: remove DRM device private data
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, airlied@gmail.com, simona@ffwll.ch, 
	daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Nov 19, 2026 at 11:17 AM GMT, Alice Ryhl wrote:
> > On Wed, Nov 18, 2026 at 07:07:35PM +0100, Danilo Krummrich wrote:
> >> Driver::Data is owned by the reference-counted drm::Device and can
> >> outlive device unregistration and driver unbind. Driver state belongs =
in
> >> RegistrationData, whose lifetime ends with registration teardown.
> >>
> >> The intended model is that, after drm_dev_unplug(), surviving DRM
> >> objects (e.g. through remaining userspace handles) no longer require
> >> access to the driver state. Thus Driver::RegistrationData is available
> >> (and sufficient) for all DRM callbacks into the driver.
> >>
> >> Remove Driver::Data, its storage and Deref implementation, and the
> >> unused workqueue implementations that depend on it. Drop the data
> >> initializer argument from UnregisteredDevice::new() and update its
> >> callers.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > Makes sense to me. Both in-tree users had `type Data =3D ()` anyway, an=
d
> > nothing uses the `WorkItem`/`HasWork` impls on `drm::Device`, so this i=
s
> > a pure simplification.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> > One small suggestion below.
> >
> >> -        release: Some(Device::<T>::release),
> >> +        release: None,
> >
> > [...]
> >
> >>  #[repr(C)]
> >>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Normal> {
> >>      dev: Opaque<bindings::drm_device>,
> >> -    data: T::Data,
> >>      pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationD=
ata<'static>>>,
> >>      _ctx: PhantomData<C>,
> >>  }
> >
> > With `release` gone, nothing ever runs `drop_in_place()` on the Rust
> > side of `Device` anymore. That's fine today since all remaining fields
> > are trivially droppable, but it is now an implicit requirement on the
> > struct: anyone adding a field with a `Drop` impl (or a pinned field
> > that needs a destructor) would silently leak it.
> >
> > Could you add a short comment on the struct along the lines of "no
> > `release` callback is installed, so no field of this struct may require
> > dropping"? That way the next person adding a field knows they have to
> > bring back the `release` callback.
> >
> > (For what it's worth, I checked the lifetime-parameterized `File`
> > series [1] against this: `open_count`/`open_count_wq` are both
> > droppable without a destructor, and the two merge cleanly, so no
> > ordering constraint there as far as I can tell.)
>
> Instead of a comment, a const assertion of !needs_drop would be better.

Good idea

Alice
