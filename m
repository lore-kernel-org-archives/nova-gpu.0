Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792507050;
	b=Si66jI0tG3xcfAhBvQBiFhasjkkT722nzBFX8FQAQe1vpzr5vgfj3LhbVwgF0xcOo5Ev
	 LkfXNfeA7O6su73hyf0oCXO62EWm2KCajgAwIHSLpNF9LCXF6RyH+INkbpDGBuS9OWgaO
	 pTw8LITbbvJr9VDl4Pnn7LfgFXCNu03tTFxUiU4fWgx4WnlxKqqa17vWPoFudpkFUrWvB
	 uKuDsJOC+uAEYp1XoO0QuBw6ctroCG/DO2wN3JdONXScvp+UxWHdPzEUtA335t/ZVMu43
	 OzWmH/e5UsQEusONDQLIOPTePmxyB7v2Fts9Y74trv014S7JH2kHdOg0FOBzF5V7M2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
	b=Fcaf9CBxwlGOAC26IZxpkf2221RCi0ACPxhR/w9bKm6xIZsULmfpB/DJPsW7i5iRLsQ5
	 2Mkc01FC9pzD6QOTVrzbZ17ul9cNYjuUtgEO4Z0fneu7jBCJHSPa49YSMmbCtzNAWrGRl
	 0sxM17TmbrilOUrwZpjkgLyuTx7mQMyesaWpopzmRwc28YrYYMejlvgzQwa5MR9H0wiAQ
	 fA8X6v0i3djhHzdaK+8r0Er9EJ6XO18vNKDz0YCPzTGy57QJhqCrz4UUoZ0ObmDtez+Dt
	 lnlmRIKkVH9YCQuaAfmQDUCD3xEc2hf0ejuX6ReT/pFi/VKFhfR9+DpjYPgXiA99wAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=darkrefraction.com;
	spf=none smtp.mailfrom=darkrefraction.com;
	dkim=pass header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=F4du6pEt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80363606A319
	for <nova-gpu@lists.linux.dev>; Tue, 20 Oct 2026 14:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80363606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=F4du6pEt
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so3563552a12.1
        for <nova-gpu@lists.linux.dev>; Tue, 20 Oct 2026 07:37:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792507049; cv=none;
        d=google.com; s=arc-20260327;
        b=NYPq6LKcTDNXLT1LnFdm8nXxSEYn3coq0yh9b2y9KUGeQBYvZ/gGKnlWexY2tHbKPl
         /LjVxhRDtcMvKRsrJZoNgGLLiwHrny7n2pYBNV8wrp21a3WsoQauZBDDFyUibZxNlBlF
         sfhviN4n+T83hfSZuBU7eoRmYo4z0vS5hwgyTDGu3DVfWiswWwARK695wkEibWeRtloC
         v8KMSKR3XhkdQojrTQ93sgTsBvhfh9OA9nL2mLW8mOo3ViD1SfrHbYykG32RygsiHuOU
         DIbx8zYv4G5Nz3qngWkdyvZVin4Ae69mtDnhMkFA1ysXX3gz8PPIApbIhE6Xr4W3BZVz
         anPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        fh=9eF9rlUEGr9XgcivSXkeks7NIWg+G+yxAgPtRzNilPI=;
        b=d0i/E3774KiFXl5kq4WEAfh9YyErp3EVKJE26CNq2o2EbVI3GiIIRaT8S6FzQA6wSi
         vovzrf9xnS0oXKVkEWhTArcwvFoovWp+X9m6yebgoJf8qPd/4loDMcA66ijxwpx1i/Sx
         vloiSBzR1Ll20iIdrdRIMbSs6hIvjcEfsGt58X5iPymrxIPIaNaHs2uQtawbRbR+4ieB
         IXRAj9nhlgV8swlLwRx96IoJkg+mXZgQb797slIoJ0aPch+j1KqLKkw2PpKn2XgqSbYy
         ePwS019qCufuGAafordnGiaiQ7jAXYy4riQd12MKCxew+btkRuSSDxzNx3vybtERh+q5
         3+Fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1792507049; x=1793111849; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        b=F4du6pEtHc6kMzdSiuIfgCTouPhQGD7waXfhVgl1lx3bDemMIc/FG3LG6RQ9OuB/wU
         WOynHLASv2YFQd74QmDRMs+34arRHyyGJcH6eMMEhU0afAujVL80MxZrwRcNx/qiEU/+
         tTpRZmmevMHxjqFpv9eWR3Cloy3r4Wf+Fo3FnnBf6x6L5vQWvZxQTE70ubu1WwDJsrzl
         P+zptcV0Yn2PGMY3lkOHLP52tVKXb9ao1cSR5w1ovNNf17Pz1FvHGxqVU0DOcfZAGFTR
         Bn2l7Emv2mbLVqyp1TgpbDQwvAWG8kD/IPHN9B4SNTPqVqIq1rt6qZ4Sf/B1sLNkUa2q
         llbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507049; x=1793111849;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th2n2oDQlswuf1BVeMTn3nKsEA75XKAvSzInb/NsZ8c=;
        b=1I2VAqwRBrI5h6Inr/JwCQclr2n6HayfyDTi493E0cusw1IALQkIUtiGka4aLKI9cC
         oESVK4VYQuncjhBej8zn+iEAlEuzeqJuc1UWUHr3g8U1FoIe+/XeazkY/TSaS+x2ZzGi
         XR29eD69qNkRtJ/QZjkmuLNnyMM1WJy1egc4DUUkdAWfS8L5H+Uyn7K2Zfc6kpjRcilJ
         9BE2wNBRvgQWdUh65IiKNc6df02xZanKF0uIoVnT1NakYKgSHQTPy5dSY+ZEhYuLwp0L
         mp9pXXWYFukaaGv/sdI+8rrzxxPx1r9QvNIqIx6Mo3WIkPJjtT3gVSw21GFqRyovHyQH
         Ia8A==
X-Forwarded-Encrypted: i=1; AKwUvBzt1XjmEmHhjpGwOuB2aO/T8oNiLwpT1NTWNL3DLEjLWKe/IccUxhlTUxBnKGkNvQOElclYMHsfIA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIxYj3x0IBeLniZT30X/yuiQcSrxBcalMmOFkD8uln7RAv+PWhT
	TI+doP+lFhDPeik9m4JNHx/yMA+QLjljapLG6HOsgm/2SUUgqCOQWjGRvNCqmT+Uwq77FSSXJQF
	RKKs1jhVs5HcZw5r8bIRI8/28iGAjolr/nk4gj74+XA==
X-Gm-Gg: AYBFou13HTahqpxfwFzsW2fcK8Gn2YjKLUTX0LnA83I2BjzBXxYC37TNf8AVhu3G5aC
	GG/8ih7NILt4UUZCpiqUem8SPQa9Pc4cxmgwthtbZMUYHAMJWRylrkM1Ghq7dxmqpx7Oeylh/u8
	yFAA2EFeiPv/gTTZbAE1yiKiI24RG52sW7/tjx1ZfhKB+eCp7+YQXW+jELIRSBxvI5TUHkjJFYa
	5RdZx1cXQn/pD3ws4czsxAMUTOKxxTnssVE0MXuXquQE2+9RK5F6ZufqX5SvB2nX2hW7b5md4fV
	OoVR9fYrwojhAEodxqzd2LCvngsHO14ZOXY68UioQa3URKtKtSwOQNn8YLIy3PlsN+SHLZCMIl7
	TYCxilwAzkGhB
X-Received: by 2002:a05:6402:46c3:b0:6ac:a1e1:3f88 with SMTP id
 4fb4d7f45d1cf-6b3e479af2cmr1805659a12.14.1792507038070; Tue, 20 Oct 2026
 07:37:18 -0700 (PDT)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019212535.88390-1-dakr@kernel.org> <20261019212535.88390-2-dakr@kernel.org>
In-Reply-To: <20261019212535.88390-2-dakr@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 20 Oct 2026 10:36:52 -0400
X-Gm-Features: AclHuK-6VS79fqbsrkK5l4dmV47FN6lL1AdlVauDg0y-CgJGi7jnOJDni7bx-HA
Message-ID: <CAAgWFh30UryzqyU0As6qi8AaHzQbO=pp-Y+gWMs0ap7i1D4qKw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/nova: mark the uAPI header as unstable
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, airlied@gmail.com, simona@ffwll.ch, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, jhubbard@nvidia.com, apopple@nvidia.com, 
	ecourtney@nvidia.com, lyude@redhat.com, kherbst@redhat.com, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The header already documents that its uAPI is unstable and intended for
> development. It may change incompatibly as it is developed upstream.
> Rename it to nova_drm_unstable.h and move it out of include/uapi/ to
> make this more explicit.
>
> As individual interfaces become stable, move them to
> include/uapi/drm/nova_drm.h.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Mel Henning <mhenning@darkrefraction.com>
