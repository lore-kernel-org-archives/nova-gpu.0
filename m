Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848400;
	b=lZIm3N93hd4WAW9E7s2ZbN4n3Y3g5DtoIyoXPTS7rPRJQ6o9pIPu7Er1yL2HjejGl/7y
	 t9er3XlLLfuErqMzuhoG9poPb2xwCVKDgyuEHUmSuvEE841BUeVluT5vA4pqYgrKqrzPp
	 CpOfPL9kVlRHSTy4G4GVF7aRB482oN9dfh+6nA4aVM8YOg7XEtUGnHoIMcxHXfhShYWqR
	 PuX3/BXJM6b3nusthQT7sE4WwSpetnmclgyJo7wYTyI7N25o+QiCd9TZ4uVBa/ZYaoCoV
	 Pr1NKEbWik8WJURFJ/Ppdd84zT3hl2IrLl9sixOI+RULGIpjehE+nOpMXPf5TGVoF1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848400;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type;
	bh=3doFV6CnjvFRGoub00kzIpE0tXcclmnDoklWSfWMlII=;
	b=E3z+68HNRaEhoynQF6iq8sWev9bjIkTmustr2W7Dt8HLrSSRTP/5ow0DVpRzh0RB5hBO
	 w5OhDFFCeEvQwZF0hukBkuLkRWHlrlcRoJrNkUEER89bO4FB0PEbL5+o1e1jJ/gJJNH+a
	 W9MenPmQRV8DlEBuC4CXIFdASw8YNvuK3mdDws2qOZu7Mi7JWohr2049mrh2sHplPpli7
	 kXdn6/G+vs1Y8X7812+/sVTCYC4qZgFCmK8I9laX2sgXPg2xoKjUWdesJgLc06frWK3rn
	 6pJMNQaygF15zEiI/YwXQ2v0qWePDGQygjhcz/vQgrmhc9fpnn/xhZXmbyMQOChLmjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EPKSLsSc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36F7606A31B
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 03:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36F7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EPKSLsSc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793848398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3doFV6CnjvFRGoub00kzIpE0tXcclmnDoklWSfWMlII=;
	b=EPKSLsScyzPRLaDGf0xXBl2mWXQihYvruPMXJvR1LNp+Rn5D7lopwp7sO0GF+El3maK+qM
	SgeRrQySw4OtBLK9CE1CQCyGIdqgfXumsYX/+52lw123vf9iyyDhtz2rfLVbld5nrp3C0T
	iPFJLce4m/b9vSao569jBDorJgnxDSo=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-Y7cXhmzDMZeF2JGduAleAg-1; Wed, 04 Nov 2026 22:13:17 -0500
X-MC-Unique: Y7cXhmzDMZeF2JGduAleAg-1
X-Mimecast-MFC-AGG-ID: Y7cXhmzDMZeF2JGduAleAg_1793848396
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso1906684c88.1
        for <nova-gpu@lists.linux.dev>; Wed, 04 Nov 2026 19:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848396; x=1794453196;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3doFV6CnjvFRGoub00kzIpE0tXcclmnDoklWSfWMlII=;
        b=EhBw72Rh7LAbJv/n1r8zmSm6gojmDigHbO+8fXu1wZjSFROlyPhIhW4HuZHgLfsLdo
         wk2jqbIysRpJMHdCBoMK0KWWDe0mntQlmn6KPmq2AEeY4sQ+TpgJqsg4Bf+9/g0/S4B1
         fowmddinFZV0/ZKI/CoTPT7ZSKuiumHZp16jbVxZQ1HWtzJXzt1eTW2AP5CqEjhbujOI
         x9qeyvc8ABVCvyhCk1wnvFz5MpWPSBiE/5mzPtJYfn3H3kS/N3h7EVjSnZXsSudWxF8Q
         OsupP+mjzk06G+loVWKWIZdfmghNxOegirmHLJTf6Y4NpdYFGQfH21PoYKnmtizJuYhd
         5cSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaYmD6zZ+wMDPlOwYF2sF+hT2GPbAQPeMDoPEpsgv4etFVNNLUzRuTbHY99wQnuyBmPO2J2hQtOw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Qi4w5p68eHqPOUGs6vKmdqZ1hl2Zoa5Jx3vCosGuyAMNV3FNQ
	fGN1MMwpMP0s61TFyg8dVBaXW/Qr2knO7TcRE360Jym0ZsFGypKKuLg2yXjT52yvKEP3+prXvWm
	wW2VoXG2XnL26fX9/Z6eQs2VT/B96xq3ohBTnkkMVJY1FudiOTL0bgDRQ/nEGr33P5jDBp+p1nq
	Vns/6/XOryB3exkw1CioTf/b11agVXfdx8/RI=
X-Gm-Gg: AYBFou1eLmb+2ZRungUtZuHddx0WfzSRVQlfz9JU5w3AX+ugvjLcUJKKy4xgHko+/Jp
	oFJf7HsVNApqVHE+RIETZO6eQMaufFAChLWhhQyN7JXpG94w3k1xVGp/bsrsv2Uz7mWNiarxRNY
	A2apv7rnb2Oia9mX11keTfP7vstuhZ1W/66SwZDYKSq+iX2VWYfk6Dp/xT9KCsfOwocjiNlc1xS
	8f2IFSasG2XlN57
X-Received: by 2002:a05:7022:158a:b0:185:869a:8c64 with SMTP id a92af1059eb24-1ac56ca0239mr28569109c88.1.1793848396239;
        Wed, 04 Nov 2026 19:13:16 -0800 (PST)
X-Received: by 2002:a05:7022:158a:b0:185:869a:8c64 with SMTP id
 a92af1059eb24-1ac56ca0239mr28569052c88.1.1793848395411; Wed, 04 Nov 2026
 19:13:15 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-nova-timer-v3-0-0cf9bbae8fd9@redhat.com>
 <20261103-nova-timer-v3-2-0cf9bbae8fd9@redhat.com> <DMLZABRA2JIK.1T11DDWNFKGJM@kernel.org>
In-Reply-To: <DMLZABRA2JIK.1T11DDWNFKGJM@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Thu, 5 Nov 2026 13:13:03 +1000
X-Gm-Features: AclHuK-CpByyje97VulgjdYHSCBFSmYY7L1ssu-Sc06OfQsPUh1PUO5AMJaUFbE
Message-ID: <CAMwc25q9_Gdtjem39SG66_cUKJnndmHeU6RRpHhMOU6DCUqqMg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add support for GPU timer block. (v3)
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qDnMlGt-MtcOjjSien92RBceaMC6JJBH-3HcZ4NyvpQ_1793848396
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

>
> I feel like this should actually be TimerState, as it is not really a timer
> (instance) representation in the sense of carrying the HAL and providing methods
> to interact with the hardware (which we do not intend).
>
> I'd suggest making Timer a unit struct and giving it an init() function, i.e.
> something like this:

Thanks, looks cleaner, sent out in v4.

> > +    // this value will be passed to GspInitRequest SYS_TIMER_OFFSET_NS
>
> NIT: This should describe what the returned value represents, although in this
> specific case it may also still make sense to give a hint how it is used.

In theory the value doesn't represent anything, since it's hal
dependant, at this
point it should be an opaque value we give to GSP in SYS_TIMER_OFFSET_NS field.

> Please use intra-doc links and markdown where it makes sense.
>
> > +    #[expect(dead_code)]
> > +    pub(crate) fn sys_timer_offset_ns(&self) -> i64 {
> > +        self.sys_timer_offset_ns
> > +    }
> > +}
> > diff --git a/drivers/gpu/nova-core/timer/hal.rs b/drivers/gpu/nova-core/timer/hal.rs
> > new file mode 100644
> > index 000000000000..fd702867b470
> > --- /dev/null
> > +++ b/drivers/gpu/nova-core/timer/hal.rs
> > @@ -0,0 +1,27 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +use kernel::prelude::*;
> > +
> > +use crate::{
> > +    driver::Bar0,
> > +    gpu::{
> > +        Architecture,
> > +        Chipset, //
> > +    },
> > +};
> > +
> > +mod gh100;
> > +mod tu102;
> > +
> > +pub(super) trait TimerHal {
> > +    /// return system timer offset ns
>
> NIT:
>
>         /// Initialize the GPU's system timer.
>         ///
>         /// Returns the system timer offset in nanoseconds.

Just realised I missed this one in v4.

> > +                < FSP_BUG_3957833_FIX_VERSION
>
> I'd move this into regs.rs and make it a method of NV_GFW_FSP_UCODE_VERSION,
> e.g.
>
>         impl NV_GFW_FSP_UCODE_VERSION {
>             pub(crate) fn is_bug_3957833_affected(self) -> bool {
>                 const FSP_BUG_3957833_FIX_VERSION: u32 = 0x44c;
>
>                 self.full().get() < FSP_BUG_3957833_FIX_VERSION
>             }
>         }
>
> so you can just call
>
>         bar.read(regs::gh100::NV_GFW_FSP_UCODE_VERSION).is_bug_3957833_affected()
>
> This also keeps FSP_BUG_3957833_FIX_VERSION local to regs.rs and gets us rid of
> this HAL function.

I don't think we can get rid of the hal function, since GH100 vs GB100
need different behaviour, which is
just setting war flag.

>
> Can't we just use unsigned for the argument and return type? None of those are
> ever expected to be negative, no?

No, I think I got lost in what rust needed to avoid crashing the
machine, so I just stayed on the side of least likely to overflow.

I've reworked it in v4 back to what I had in the first place with checked_sub.

>
> I think we accumulated a bunch of those comments in nova-core, I think it would
> be nice to consider whether we want a prefix for this, similar to TIMEOUT or
> CALC. Maybe OVERFLOW? But this can be a follow-up of course.
>
> On the other hand, this is a fallible method already, so I'd just go with
> checked_sub().
>
>
> This looks similar to NV_TLB_FLUSH_PDB_LO::from_pdb_addr(). I think we should do
> this in the register impl:
>
>         impl NV_PGC6_SCI_SYS_TIMER_OFFSET_1 {
>             /// Creates a register value from bits 60:32 of the offset.
>             pub(crate) fn from_offset_ns(offset_ns: u64) -> Self {
>                 let nsec = Bounded::<u32, 29>::from_expr(
>                     ((offset_ns >> 32) & 0x1fff_ffff) as u32,
>                 );
>
>                 Self::zeroed().with_nsec(nsec)
>             }
>         }

Done in v4.

> > +    register! {
> > +        base: NovaRegisters;
> > +
> > +        /// FSP ucode version, encoded as `major.minor` in bits 11:8 and 7:0, written by the FSP
> > +        /// during boot. (`NV_PFSP_FALCON_COMMON_SCRATCH_GROUP_3(1)` in the hardware headers.)
> > +        pub(crate) NV_GFW_FSP_UCODE_VERSION(u32) @ 0x008f0334 {
> > +            11:0 full;
> > +        }
> > +    }
> > +}
>
> Hm...I feel like it should go into fsp/regs.rs regardless.

Moved in v4.

Dave.

>

