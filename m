Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C28F26B08F
	for <nova-gpu@lists.linux.dev>; Tue, 11 Aug 2026 12:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451496; cv=pass; b=W88hSYVnAg6+KMYB4+em2LvdOhzadRU8vsbp+kQEv8WDDny+NVx4gvTvMXBH5NO0t8XXoCZBHmmPeF/9Lu4vp+gWikXxE5JzqzXbEv6J0Ud0FQFTHHlVfCBicwJypkCP+AytCfVeuOfNPcJN9XcZwxIIchBjIEwhzw2FztSoINA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451496; c=relaxed/simple;
	bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T/lqFDhOiNBkF2DDZ2D8hIFA59XGsvLylcmhBj1lk6GBcTHnFJle45C64XJrQ9MklPYrJCPAJWJwYzaSaAMUx1V1luPTejuMJ86yU2K/6DeeReFXSH7QqV92xT8WdljSpATbeJadC2BlmKYZ1gOROXbPc848r5WDsVrCwm06cSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G94dNUHe; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G94dNUHe"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d30c22b1eeso1194645ad.0
        for <nova-gpu@lists.linux.dev>; Tue, 11 Aug 2026 05:31:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786451494; cv=none;
        d=google.com; s=arc-20260327;
        b=S6LIe9tJXF+jUveHVOFkm6obIABSRVYEUvBhtYBVrXjD95mKV1Zc084YZWhksLoK74
         E7Z8NKkljZABFDFLZjnhAuxEds73QlPCq3CxHx+aGdixrVyJnA3fNyH0jCV2IRh9FOvm
         reT0Qg8Lhtbvp3d6txEcrH3a1UF9m8qdD530VGZKvYLEkt81K/2pFDOCE1u4NheaV0Yu
         12QBc7Z7n8UOwZSYWueIbiNXmspyIKudgKzh0tSKT9ng52H+jT4+tHQdZe2DC/NRe6cA
         Kef9sG019ULJlHwu6A2lrk8hX1EyQ6tFdImQSVJnDKvHMLmnnZa4qQ51KCyFA076Urze
         RJeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        fh=GWoExmZR0O/4thylI7c2NukhMtVmVe7xEwF6ODfFhY4=;
        b=l3gOHYbI3dSLBdgQsaEHVc6TO+9I95l4Q6dM/ATzRX19OFQU9UJxh1Oy2/yOGCuz+z
         23uR1HiB135tMMNUFYqOf4t3P4gXPpNNjkR9XYlvsoT7IusE/7knoTP171PbUKxy8UNr
         akQOQ64mQ+wCr8ocp4lldIqBHj64OkDJrs6mwI3gW3x5VYp6uBtCCV1NQFXlhHNmH12z
         p3/IkpVjSu/Arm9Fm/B5XaDxocJhNYSdiOzJ53NdYG1f3IOjsJgl7EMUk1lwP2JRmqjm
         m5aINX3T7d9zw1RUp9Bah49U1fo0JzdD1GJqgztcTYq/iY9eeoE8E8mdh76ruDXm4IUV
         hmtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786451494; x=1787056294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=G94dNUHe+DdtYLLj7o+Ur6PNU6Tw/8vNp0zBxlog0K2//iPFc2hIaSEbX37uYXS6tb
         aHtO59luZHoR89cl+6YAbpJCivE9N/lOBY5GQY2h9PRhwB4MFjgjuXr23FkOYUzNjBt7
         WNIjkjMy+PExxzScOlpJUI4KeduZV1hT0tAXlYE1Ct1OWKsLG/Pzyeb0HyiZEWMZfw3T
         dMOqJ23LD6EeSzlBwADBW4KorqGY2gfPX+AIV4lDn1dzqjmVnbkhpiE/gvmslh4sPVXF
         3FzAdj0rHkeZTVUlaFzGBEKoPluRFz+BbNiuojmKfFz5Cn1DUgU4Z8fFBsOTCsuoiBS/
         d2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786451494; x=1787056294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kvo9TKdttK5rv8KXZKEyC8pu8fV4Pu3XcvOG69wPlb0=;
        b=lHLIBRhzT8mRYwbnwrrUxBTZ7cqQLAetnUJk1NyjCNDpYOZkZjkg3jSuztNpwxMuAr
         xah4kmllCHVNZDDTrY5Zz+QBqkwv+Wihyec+xXAmMq2hVw9qAx6C538vKLCDRjS8TO2S
         iwqBDG7+RTBRMbmLqogR59NJRZ0FDzqYqbnlEixfpcPS1nRE3IdhPpN3Pg/9frW8/pFx
         NN/5pay6bFoBYOC1tpLze62REKtJM8xFq2kGsIb6QAi3fL+PmPLXYrKaAGtRKBBSHSii
         NnSU4QHfYM2Kz7RcyAu08p7/rBassFBbuFUiOwJqbbvzZeHiPG+3RZ6bxhKMe9xQ4cWa
         XZMA==
X-Forwarded-Encrypted: i=1; AHgh+RoKsrzkmFnMOsR8jdYbQVQx6n4mnoeXFdLt0V/VQGFrGlRCc1GKphm26bzYooRkLoXQD5hzsu6V2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjR22lPTNuszqMUre0hmh9bkK6DWkKeQRQrfiRPrpx6gg4PF7f
	iDsPR2kQk4gqpnzfbVU15zS5oxc9t7iOtdVp+nAJkRLFm6IO3NB9yf0n137odHYHYBh34x0cZ1u
	kzDtbDAP/6QKyJ0wAla3oiMgdFMD9XxE=
X-Gm-Gg: AR+sD10wV8h01H/4VdHJvreIEfqzchuVIsQ0IK0/+TtaM5lowvtG5iREV1ZzTTtVuLx
	iOa5kNgINOIYFUUebb/h72lg8kCPdijY8cRmVo1iFT66aB7OiKlBZoy3T5eXzOoxHoqj8N0kelb
	9unYk+568xSX889L3R9JclfuJDHN2uWJNfCWu79dY2dcVmWUSEOqZEPFMqKhBiOwibAvlLRepNA
	So/+xZhd92bBNrbefSb0uCDUBv84tzxCQWrS9vPGp6ZY8U4N21320OxrOgZucS5qxSIQKMBRw+a
	yZ8+isWuiZ714b8D54yAvF80qfXfUBgizI7+chkJV4xn4wPTO38uV4BeSwliF5sQTnhlmXiE93s
	tchOdMphFuboUApPFcGCSSlcXdpbWXaArntTnUyLThtVRyWtztFvCe9PCvs3ocDQ7kJciMUsO
X-Received: by 2002:a17:902:e806:b0:2cc:d6de:d58e with SMTP id
 d9443c01a7336-2d317966388mr23897155ad.4.1786451494065; Tue, 11 Aug 2026
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810-pramin-split-v2-0-65a00b3c7309@nvidia.com> <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
In-Reply-To: <DKLM8GXJGFL1.302CSI4V1NF27@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:31:21 +0200
X-Gm-Features: AUfX_mz05pylmKA9x8ysF8Rltnon1TiS8QMQm-gLy33uo5KYaSzY0l5rcB4vQvc
Message-ID: <CANiq72n_DLiGKpAq+a=a165AjN9zcYJFR8q1eFb9AbBaYKToyQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] gpu: nova-core: add PRAMIN window support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 12:26=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> I think it would make sense to route them through the Rust tree this cycl=
e.

Yeah, I asked Alex in v1.

Cheers,
Miguel
