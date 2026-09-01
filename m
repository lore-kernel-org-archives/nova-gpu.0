Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079C30D3E8
	for <nova-gpu@lists.linux.dev>; Tue,  1 Sep 2026 04:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238245; cv=pass; b=J7kdUz6E+hphk/cgj8U1NP4CN+42AHs85FWMrfKwsYZpOx0is0tcTh24TDe5G0tSCt89racWOvpHOq3mKOTITwgNB7pcKhl7uSbcyYevFwegGwflFqVB93dF7GVPMMBzlMbFAQh2+P9Pl80cJPdnnDPFSMvK5BWgszrk4ge8l3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238245; c=relaxed/simple;
	bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jbgWgNqjQe2SyQgZPFr34wwr2iJEYRXY6yivo4/kCW/xWq3UpZOLqB8NB9gNd5Gev+i4So+iN4ewY1JPRIUf0626YYA8RGBcjZGjff42p9CxuqCUCnb8/1zwzDcsOaQYcQgQs+SAA7yv5aW7nzd/CqPwt0dKIWoEL3FPJsG9Yyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtXXx92w; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtXXx92w"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-90d7fa95a58so24562076d6.1
        for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 21:50:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788238243; cv=none;
        d=google.com; s=arc-20260327;
        b=I72gtDcZS2g1B6MBAddXu5GtW5dMrxYaw/vnRBmvXRmPEDfQnssi++i7rFr4ms+ChW
         jpK2H6P0x1iseYQaCMpRhqkRXp+ZCEWIKcRuSfzMYWNTpIBA0wMyL/B0253k6c7UO2j3
         Mkvu67TsrIOTl/+JPwDryqLcre8dfPl7XY9KqqU62DUMAnoJ1Nz/xAu8yBjC1jPwD7k4
         11dxCbSY2W+Spw4tYttcbJtlqS1OlKNPe6qWEdvLD6WjRV+PcDK7HxZnXsDXhjneULfb
         yHt2r7JeIVUfptAaZs/hntmOnRVBKWqaV2JNZPeByIJr6+va9Ivs+9PJZ20oZgdrkjMP
         cE2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        fh=3bs3Rt0o341Rq5QbRIwzupCvZpnQXniXt/hJ/N8gKx0=;
        b=RwvjTldytohF4YjnXHTLW72QMjEyGynOjtodxebDSH9aPEWkPAIT45gTaDLWima1RU
         m4UewIh3rGYIYjhqQGpeaU8ztgwkkMhcOScZOv46hXi2vBPdiSkOm9/qB9zCRi6IVeoi
         142GnL8Il8/QR25OwFwaD5uIw8oYq9E7Ff3wc7D/9MHOYHRQBpep6PEqhSPdrsqqmbdv
         ATmz27ns+X8jJL3xzJpn8pSrj8CUsBsqZK6IqSlyCpEJg5Qe1CUoZYKUo0YCrEK8OChx
         nGHwo8SvskcbbYkinjZwOx1OuvHONfU08I1Eg1yO9AMohykAPYUxzMUe2T0hojslKOGK
         ncjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788238243; x=1788843043; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=EtXXx92wXwga0KrkGpBmnUBLO6dj9oodCrrcQJ0AAa5sDui0kWJHMBcS2zz1kgIx9V
         B1xcFGhmSUyXW9V7UFNr6lxcXinmlhf4D0GGJdshH/JTgeXJKCpkMnWw4GDZFuzdaOL7
         FWiowSPKFFFFwxpOm1oslgU/I+GSuedICi96v7jd4KHUXTiOExLZNOHvsNFTZwoyreXB
         2EADkgv91Jm/xm24Pg/pqAUxbadMCGrGpDeJL6XwDAFX8fODM/ACsjVfxg9qNoLQp8aN
         mzQslCePByW3Uhspuo5zGRpt/mPkvfZYsw3Ke/D3MUQef2leDzUSLi4xx6BxYmvoggjf
         7Hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788238243; x=1788843043;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xQOAFB2GujcBxNli5xeMXaMaXjpMEs7ZhLyYYxFWIos=;
        b=bjfexOxZOamyO6ajq0o5vmN8uiJiOPnQ0B/R1P7XM24p5Ab3RtAFFmzbAFZp0WUl1O
         D2IqOpTb8WIpifPCaKb99gORCXDOYhq11TyqZzy0PVUeKrZCsfCGilewosMUSn3Y8e2N
         CobbTgyOBxfYov6L3UMoUCS3Q+iCb/F6/RvbIZS50MTQbTOQAdrmWSEgUKU22ne+LODz
         yGfd9Sbfry6nu1WqG+xbyoz23P0C0NHv8bz/buyX271Anug7s7eMdE+NitpJyJNYOjZK
         N6s5QrzwkvzLmiOydxhs/FHKemvdZ0oZdnBGU4NE4gmCrqwCZFSHQSx9+OUKDbtP3/zK
         NPlA==
X-Forwarded-Encrypted: i=1; AKwUvBxmX9zY4G8k+0NenJK4ndnLJsqNkz3OEMwKV3ei3qqV7mHzvgUNj7oB75w1SQpVk4qlMkmqgRni2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++k9sG0JCl1XsjTCLIBiGwTan7gpdRjHhANoaxfJylVDhAFNB7mZ
	c0jAA6rnkfh885eeTc4UOFFiZhsfCDWjDUaGhr0XqFYRwl0bGps5WOAhoR0dJGbnwLAXwcDrvVz
	JBhcLmqUzkl7gZfwvbIKtGzOSlaWXYQs=
X-Gm-Gg: AYBFou0BKwptGlSUzpaV7iiWX7Dh16aiGcGaoXudC4zt/Oi3TtBDbn9TPXaODgfvzv2
	tR5Dl/Mi6d5w94je7q+6qEFBTu7cbEVm59RXothXhE1751lxt+Yj6qy4TG3v+fV6BHvvdFnoUwu
	Hx2NjcAv4jexzUdi+NZrtKEY1rCn583z2w9Oce1LCtLigDcI22Qlmm81G7OnP7qDIHapAuVSiVW
	1YHTfBZcfTockKmWIizPy1/Ze+UB8rJXL803ueP5EKMHmcuNhZZDMISJd+rRnqc7idKv2ZAGX67
	C/Kglk0uPh63sXcjn2nM5qlBEEn+qmyGOHBjTotVx0ZNr3jHGYX6TF2aYIboVRVh4AdeptQrNX6
	kRolmRRfaKf/hsLHYcxwnQrIGQVAeTA==
X-Received: by 2002:ad4:596e:0:b0:90c:c53c:a032 with SMTP id
 6a1803df08f44-90e9299d230mr66652406d6.25.1788238242750; Mon, 31 Aug 2026
 21:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org> <apZCTUYiN5FHCkCm@nvdebian.thelocal>
In-Reply-To: <apZCTUYiN5FHCkCm@nvdebian.thelocal>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Sep 2026 14:50:30 +1000
X-Gm-Features: AcwNN1XIuYNBe-g3Y3LazWrOuydw4Epc379VZwO4H3KcbFvHD9yFkSuEhDJtL5I
Message-ID: <CAPM=9twQxnx5DDkjwXWi-vXM4kqUQQdPaL+=1ASS0tpf2GmnYw@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Alistair Popple <apopple@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> >
> > We should make the NovaCoreApi just provide an accessor for &Spec and make every
> > subsequent method we need public. Otherwise we end up with endless forwarding
> > methods. We can also add as_raw() methods to the specific types as needed.
>
> Ok. This is where I don't have a good instinct for what we think should be an
> accessor/forwarding method vs. where we should just expose the underlying data
> structure and required methods to API users.
>
> In the past it seems there's been some resistance to exposing nova-core or gsp
> data structures like this which is why I added the forwarding methods. In future
> we're going to have other data-structures that NovaCoreApi will need to access
> so it would be good to understand what we should do here so we can keep things
> somewhat consistent.

We can expose structure defined in nova-core, we cannot expose
structures defined in gsp bindings or firmware.

In theory we can internally between core/drm but I'd really really
like to keep that boundary as the limits of GSP for auditability
purposes.

Dave.
