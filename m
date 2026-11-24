Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795485236;
	b=RLGFGJ1bdupb70mXdXF38DUZAYdZ5UDe8P6PGYsFD9cNl0a6qjZ4uyn+XmtNu/QGFxQ8
	 kZpX/5W+UO0ZSoGpsGSVimSOtbUjqTrCV6RQQT7m53aTm2KzK7m1aolceuS6fWNA0l9cZ
	 SRUSrUmBmX59b2mTs5CzGE8ohq4jCZMX1AxvjuDmVO3ITMpapAaANRIh7rJJsk39O9k0W
	 KDfEcZe5vV25P7Bh84RPe5p5ycbmt3S1DAPdnBNokl76ge9IPzseA5hbIoH2cfPNbx+qC
	 w8tQ0iUlwUuJzhDflh3mxwKYr5FqhzY/tWPtAxXn+JjauN1vWab2VllikcTQBrqB3YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795485236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
	b=GrMXoTaxuQNr7aRVP68XfLWCGsC9EACWcjLdmnpGkjHn7azU8/tXE9qAeQ9mIKOCUprx
	 1PKtGNLhIt+UWqbjn2bRYt1Xd7YGMKBJdw3MadsxaLKyMOMff5kvXkbkkoplDr80nVYIK
	 izvc71Uwj0km01frqX7Jb6/alc0KO2PY/XAkeTh6GEsP8ZrlteXgCn13keh3C5zr39oEb
	 Ar3QwzZqe0RfjBeHC01H7YPAdOPEAmna9wyn4ZN2PLo+bV5cnIPXluowivY89EpLUr8PI
	 dYr5eU4QCUySJ3+Gu18XXwenhRVS56dYQTs2bxFTXqvz3J//ZcWqCD0hHANn/woCvFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWmL5wEP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF762606A31E
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 01:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF762606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWmL5wEP
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-92125687442so40146426d6.2
        for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 17:53:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795485235; cv=none;
        d=google.com; s=arc-20260327;
        b=WfCUMP2FqrS5c3ryslZ+OjdKMZ0IYZw4HH9XpJiLCtZuhtasaxWODremeNHF3aREs3
         qVzUL0E9IJK4XJORD0DDFlneq3xnnnjCNEyDYW9/b5KGcVkIgrJ9BFhoIgTUXCfR5xSb
         lvD17/LWr+itrzaX2obXoVaA3uXK9uCF2f8oOmqBnFkxys034tK+wOw9aL0Mw68gCwrQ
         TayaKrDyP0lZf3kYIG75Wsdra/N+gGRaeRriO2a6n4XSMBSjq2yBv2M9zLfwwbpeXif6
         o70fX9WcFzb8LoFJYpjqo7CT1G3AV++MZIXVIyJ0VNpmawaA61oyz4xDOCCS1d/EbDuz
         YudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        fh=PssYV8Gx47Sv8uASVvHTYYvO4zr4Mx0BaMLQ+ohevoI=;
        b=Uos4vRHNaIqL3soyQnHNqdmcSPHofpc9iXiuHyx6yY6o9eYDNsUhHpBOyqSq+REgPg
         OPqBl24Ei+4iEpOXzv7cGA47aqNoYUGei6jqE9VAiQJ5lHcdPwmVX2rF65bYC07FnpoJ
         fK4qRi90l30J+647X9zg5/JEUXhmCEDnLmevbAec0e9Tnvllp/8EXmYKnjQ9kyClOelb
         9PMiBQtpJPpzaCrTUZPkxzQp4nKkcNqlZlTY8ggCf7J8Z+1xvVnKR05ub+6nnH1u1Guj
         FX/A7koyD0FOC02nfgoGa6R64GPk8L1/AH4bFC670u3pykiPbDvkfj/Oiv2BNf6JPULO
         Vv5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795485235; x=1796090035; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        b=nWmL5wEPHaZTRCOkeJyeWwwxnCAivutNpB0f7s1bMVRBU76A0BowBMr0avNfhBaIJF
         GVEQLXS9cGYbChVUKsgtOfMI3ONWF3xHIf1xqRIMQYLgUM+HekimUW5kBl+musk32Qck
         iULnFdL3OMUEzZDSVvr+aysnEVn8E47KMElvDsRYsC+cycYhsvhkFJqgpBUqileq9FjO
         djgfBsAuEHbIhPMo7oYuvBnyFY90SDJEdPOonRNTXVapdpvNlYxn8xlGotrPnz/LwXym
         blsuU5QUos/DLO1lIJ/NVHBZk9zGPhvMD3vkFMqDO/f3k3DuoSzhAMpibPpD5kZB7ot8
         zJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795485235; x=1796090035;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cqXrnujEt5rPik7Z3L5BcXXRInlNZ0roSGhQAAJNBos=;
        b=ossU+T77i3FL7xNJmmPUInVpJu9xVGyPFjRt+JbxbwAGFsG0KAvKpDtjci7QYmeYvQ
         RBx66IUuxDKr9xpnZZNvCzg8wnXCRMRWT3BQYsUXF6yxY9mUzUwH+Zxq9Xa20/Wrzxfh
         61gC7ZmTNnciDIroJpZQmHhL5gvQRPWOD8SdYXYvyNqlql+lxB96eF9Xi9tIO3cJehls
         AVnX+natAZpfdlqyuZblCeOg5RwUaT75i1Wtj4dwclCjBxdAcSyF+Jf8kwIPSlOSky1V
         ndkDrCzBnEzvwo2suITIbHVrnQp2Yk8V+tj3HK04KnpFaKmCnQFPmiC2rd9ky16uFt80
         Q+CA==
X-Forwarded-Encrypted: i=1; AL+hErHGyw37W7e7q134IDy5GyUSHggjRkdkqn0DJ35y2ljIwOBb6c/xS28ImoV6D1sgY/X4wlGoDw/gmA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8J1dnajMHRdlOsGBc+7iPC/+vKILv4nyiT2z8i6gglKsmCIAuB
	3/LRC11cSVukofBuKTu/uaRuqP9ciYApMR3UXvJlSaPUSVzr6aiK+lH7kF4oiQW6dopGhTeiYZI
	cWw7quvCgMyH7N9o6vus1RziA0NfE+V3naQ==
X-Gm-Gg: AZFdTZeZV+bmqLxg3i16EwLxDcPXtSEyNCmryTSRC6/z1Pri9huXkNk882RoE9oFuwp
	Y3qD/j46c3JYgxBHP+Fvtopf9B8iji3p4dvjfeilkFA4+8AOeZj3mAfTohpa1aMAiXI1aSSEmof
	zH8Vg+irxiM3pvKQnjgTMvtmZ76j7De5N8EBAkT+aA6fr8neg2sWK9YfbeL+mpbvSn0Rve9qy2P
	y1CGkfTE/nmyPuf9ojYETK9S2vuIItxO8G/kOKgNCbs5QtJyznwrxzFWrBn0g6QcDJtTfsGFFMR
	8Szp8/yeaXft6sc+WtJTbFZSNv6m1m86DzxZbUxyAyU7HVi8xGI4GjkQE1mgVu/S3WkA3vSf6jy
	OUWjFAyyhyQs/b2RlnrN5SnczM2p8mIuBtja56IKeUJtpH5CxuBJihqXyssZHIdNRkFsTutQhxi
	yGfn4rQIw5b45rosWxJTNhhQ==
X-Received: by 2002:a05:6214:496:b0:921:425e:ce17 with SMTP id
 6a1803df08f44-921425ece58mr177583616d6.53.1795485234693; Mon, 23 Nov 2026
 17:53:54 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-3-5e8c27aa8555@redhat.com> <DN2OVF03FAL6.2EKLEYINW79YO@kernel.org>
 <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
In-Reply-To: <DN2QWVWVB2FP.2DL4ZSBMYRXEC@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Nov 2026 11:53:43 +1000
X-Gm-Features: Aa3M54oEI4QoCcO0MeXwp_iIffckWQaTxkpH1_V4RY3XhRFR0hSACFK4S3mzVE0
Message-ID: <CAPM=9tw4_Kn2+q0JTZ5Y6+m6PFORJSgq4qSrqtutwWJniusgvQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] nova-core: only bind to GPUs when explicitly requested
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, airlied@redhat.com, 
	Alexandre Courbot <acourbot@nvidia.com>, dri-devel@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Nov 2026 at 02:54, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Mon Nov 23, 2026 at 4:18 PM CET, Danilo Krummrich wrote:
> > On Mon Nov 23, 2026 at 3:50 AM CET, Dave Airlie via B4 Relay wrote:
> >> @@ -30,3 +30,24 @@ config NOVA_CORE_SELFTESTS
> >>        logs its failure and lets the probe continue.
> >>
> >>        If unsure, say N.
> >> +
> >> +config NOVA_CORE_BIND_GSP
> >> +    bool "Make nova-core the default driver for GSP-capable GPUs"
> >> +    depends on NOVA_CORE
> >> +    default n
> >> +    help
> >> +      Make nova-core bind to all NVIDIA GPUs it supports by default.
> >> +
> >> +      By default nova-core does not bind to any GPU and leaves NVIDIA
> >> +      GPUs to other drivers, such as nouveau. Say Y here, or boot with
> >> +      nova-core.bind_gsp=1, to make nova-core claim NVIDIA GPUs
> >> +      instead.
> >> +
> >> +      nova-core is work in progress and may not be functional, so this
> >> +      is intended for nova developers and testers only. When enabled,
> >> +      nouveau must not bind to the same (GSP-capable) GPUs, i.e.
> >> +      CONFIG_DRM_NOUVEAU_BIND_GSP=N or nouveau.bind_gsp=0 is required.
> >> +      Otherwise both drivers compete for the same devices and
> >> +      whichever is loaded first wins.
> >
> > I think this is a bit unsatisfying, for the Kconfig at least it would be nice to
> > avoid the possibility of being able to configure
> >
> >       - NOVA_CORE_BIND_GSP=y && DRM_NOUVEAU_BIND_GSP=y
> >
> >       - NOVA_CORE_BIND_GSP=n && DRM_NOUVEAU_BIND_GSP=n
> >
> > since I wouldn't consider them valid combinations of Kconfig options.

While I like the idea, expressing this sort of thing in Kconfig seems
to never end well, I'd prefer to just keep them separate until we can
figure out scenarios where it's screwed up.

I'll think about it a bit more, but I'd rather not encode too much
complexity here for fear of one or two people screwing it up and not
reading dmesg.

Dave.
