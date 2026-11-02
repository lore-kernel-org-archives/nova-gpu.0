Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598354;
	b=3zq21wDH62nnisGomh1pcKaRpVoF2EIj6Ggn4NeaEAN8Y+8qSlCoyqAWPIcHMBmrTmQj
	 c9qzaGjXkUZ4GraNDXMAyfW3h/Xp/eviUyFP9GC1Trruti9GYT+btmuY6mIFO7DE0dWPU
	 JXdR0539XbIQ65u6kUpaD74sJfmvd/T1DQYUQedcXOwFzUtqG2I7PNjBhHx0Oy9JgM3o2
	 5FFAw8iIy1/0KuWuaAojU7kTnov28ltYekjiCS533GXbSj9yD+5Iar04ZWAUdc5BhNGR4
	 JOcrEyZOL9rulzwJ0uy2QbBHcEeTy3cQ8hvEjMEM5HNLA2p+uSpXgfGwu+Iuk8IjtOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598354;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
	b=wfJXu7FUttJXV3I6P6QQ3tiFiBNULrWlKebTsV/YDlzBWJzS6Bai5XRKdGOunUY3Mrgm
	 Me5qe0moBKp5PU5VFQoZNDDO8DhE7p5FyPyZw1DLhSkgj9JNST7oDG/u2/MDo2Xgg14gO
	 pxgVPj/mlqls2fXdxpJEeW99Gjdz3yeWQUu2gXAWV1vcRIpWtajxqDRvWsoWSp6DJql2L
	 KC92XPXtNTj+e5TDz2Ifda1jmG5K64GAvRAUCDHADtcJKJw3niGIalbPemPM+JGMenTbG
	 GVdNtj3Mzm+vZNfGbRAQgfNfQ1yrO5S1tVK7zf50BfU2gjk1qOEufIr07sxgd0yd/NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFfNIr+S;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE1606A326
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 05:45:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81CE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZFfNIr+S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793598352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
	b=ZFfNIr+StHPksHOP1R1EhaN93iyTXILP2EOcEQ/ohHx2Vp/7bAD0xuc7YrICYRjNHGFc0E
	AqfenI3gTAVOeH4qbNRla2oRGRUHsgsRY912nVKT9dyDNvPACIcP5MXLHjlugf/v3BSlmG
	NragMVLcwV3SShYuaAcgknrp5GX1tfo=
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-USINWMfaO96xNzcj-6nsQA-1; Mon, 02 Nov 2026 00:45:51 -0500
X-MC-Unique: USINWMfaO96xNzcj-6nsQA-1
X-Mimecast-MFC-AGG-ID: USINWMfaO96xNzcj-6nsQA_1793598350
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso3270594eec.0
        for <nova-gpu@lists.linux.dev>; Sun, 01 Nov 2026 21:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793598350; x=1794203150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EWff2/RckXT/gjbZywWMm8CMyCYWgzGjOrw+JSfBks=;
        b=ML1wkinPw3YbwEpsvo+ALbXNGPWInOH9ZZU1jJQ0Zsk6IrkmrXVbOhfXe+TMCqQ1U7
         ew66TuvJ78ZcTJAM+nO06Frjo3kJC9YbjmmWlvsHmusN1BCL2Nuu9YgOAeEDIGdsfyvz
         rDZNaRVtoUPpfDsNsvxqYsGWLIaeKJxgnwf4Wyacc/k4jhagSKWah1PVM5YVdwWlrlxd
         A+33YnxXCP1D/+hDSA+UrHJd4kz9srSN8eEXnWH5dElvy3ELbteJNxuYl5MHEhlACuzg
         bEc3g/pdV6M4uN3+3HTGeZZzsJ0hAp9Pja/mC/+en+M9RythW+PVPUwoX+MGHZZADPIC
         H4Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwdpLaPnvycTImHZTtkTswdmHjiDcDHcmTSTr5vOv91H0ug2dTsEeVJ5PFm75UgWU0qNHlX1VszTw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKbEDZqnc5M/9KhiYSfjRvZRQx3Aw//8cHgX3cuFiByga3Iu6Vn
	3SLk7nNS992ScOY9GviMFhqkpFFdqiApd/HqvxvwvlpWHxKkbcKSbDw54C58Bv5svh882vu7XU+
	KusNOK4qSewFAmjbIcklCfufT0KYE+DN2/RSbwf1ScTrZyffd6X4FqT53WGn54NrFSRkTXtOjEo
	lr0r+H+fofuc38tLNEw/TcUPMiD+QWJgKdixg=
X-Gm-Gg: AYBFou3q0ND0vZfBKzyKEdl9APFcH/P84kDUbbpmVgLcyxzaqTXMXjSlL4eNxMwh8dZ
	lZ4y5SNH1S0nuUSwxFtzerd/hQyJYH4QaHIkVzTGUPsUTMEeGj6ui3OCLUkrZTWch79HURAqf1h
	qcJv9C3EDIbcQqQVpWlEsQC99NpA1hUfnvn0DgFW9f5p5/lX57njBMHNl4diDoSLjSOMRZm7bia
	BbmdJFt1ZE2DyGH
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr17383088c88.27.1793598349728;
        Sun, 01 Nov 2026 21:45:49 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id
 a92af1059eb24-1ac5c92de5dmr17383031c88.27.1793598348917; Sun, 01 Nov 2026
 21:45:48 -0800 (PST)
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
 <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com> <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
In-Reply-To: <DMF058O3CRIB.1C2PJYOCEBTXI@kernel.org>
From: David Airlie <airlied@redhat.com>
Date: Mon, 2 Nov 2026 15:45:36 +1000
X-Gm-Features: AclHuK8exQT8deCs0skNOyZ9XxNBt9vf9v6qGrUakoponbSopJ5SLjaDTOgiRKc
Message-ID: <CAMwc25o22q1LT61YFAeZQBpVxmFZGYNr7Q3TvHoC+bd1HU5WAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
To: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Lyude Paul <lyude@redhat.com>, 
	Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: deUH60XHWJ4M7wElCipECwutyZd2NdUp-ljfowqDHYw_1793598350
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:04=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Oct 26, 2026 at 3:56 AM CET, Dave Airlie via B4 Relay wrote:
> > The nouveau C driver does ktime_to_ns(ktime_get()) to program
> > the cpu ns into some hw/fw, so allow this method for rust drivers.
>
> It's kinda implicit, but I'd rather justify the change through how the HW=
 timer
> within some NVIDIA GPUs works.
>
> There's also other HW that works similarly (e.g. a bunch of net devices),=
 which
> share a common abstraction through struct cyclecounter / struct timecount=
er.
>
> Having similar Rust infrastructure seems reasonable for use-cases as the =
nova
> one.

Just to clarify what I talked to Danilo about, I've no intention of
publishing the nvidia timer hw as a timer for use in the driver or
system.

We have to initialise the timer hardware for the GSP init process.
Depending on the hw platform we have to read the timer once to do
that, but we do not want to provide a time source from this timer at
this point in time.

Dave.

