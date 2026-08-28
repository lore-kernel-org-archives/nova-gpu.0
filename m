Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B8238C2A
	for <nova-gpu@lists.linux.dev>; Fri, 28 Aug 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919390; cv=pass; b=R9EVq9uMwgsF0QqjhmrOw8A3YbQ6eEWQU6nozA3bnDjT/z6akO2rv2VzgtbZXl7z8mwBthDBpRXdv/jQeOMAG1T1Hjxi0x5W0ARgDKzaVyE1BMtQmWvV87jQ0xBDSasW6y0XyYdc4OLEDUNXPfaZBjk0rYlggyApvBz6+7pGG3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919390; c=relaxed/simple;
	bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjNyMIE7suB0fHwT4lWymFpElUXdRYeuTqP4DVDO6ryF4g2d1Kcn9v81LTyoK2nn1Z5oZjtiuWtlFdA/1CA3AnmsiRNkEIaVPmWKULSNirwvCC0ttBjDcyoZEqCszct0npU0iWblye2IqNc0FSyHxuw+NAMk8qAZbXtwXx1dzqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCA/xP9R; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCA/xP9R"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d319b84213so925495ad.1
        for <nova-gpu@lists.linux.dev>; Fri, 28 Aug 2026 05:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787919382; cv=none;
        d=google.com; s=arc-20260327;
        b=WyTUIEdOnWXVPChBz/SPfpk8TEy+JHQ6DftfhLVbaaUimWubB+rrisBgOMVlWzDIXr
         V+/uNrGZv90fu5GsHCH5BYjziBt4yjyBsoXn1LchbOgsckqIRcC6edypK9ZYIPJ0nj7x
         bL1PuQNnAbuA3bXDLDDxec8BBt0AEGsI+HAw0QZdO5DQJRb8JnQE9GSJWyoznmoJqkqF
         vjg4yqQzODi457l7PuVJiVLXSDGOciAJb2x6jwKvq1xLUVaAblgqPmcEaQ7vjjfE64td
         yzq8a2kWUu1MhFHklkQLGSZYzrv+oranuqAcp6u1hYl5nSmzEL37ZBdc16GnSpYskl0j
         bHwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        fh=pAIXRqMF9nfdZhw+ZOAXtnj4vbiw6jO5xYXaLumfzL4=;
        b=J1NHPyIsLA4n6px6HAZ0eRN7hQ0ivJxxkkwCmdsGO2sNuYLwKHDOSfsUCyAEkhf/tu
         6PlPAoCfEqB1IWRDpUf8tAYWcI4ZR9O5zZ4+hy6r7etFcCPknWRjNujjhkg3U+rdfrUn
         vjfSOsk1J+uSHFIAza6EYxrtYvX25+9oL8r46SPNglaee1s2jGqTImXRGsY+AsAYTh3+
         /HXcn4aD+axVgo/EsQnnCeYqNNBlTLzJmzzoFjWCg6MzDfhKeyRu06cmxBUt96c2rHRt
         IGbMz199rJA2wzdmN0U3Wl7gxTQ53NtRqhmmgc/9pJLynczEgVQUfsqkK+1mbIiHKULj
         MfzA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787919382; x=1788524182; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=SCA/xP9RXbkBmv8v6Vix39qrdch5j7ywfr8cZfiyvzp0nrY7coyFiQH6zkff7A6AAt
         7ZlMkOC68888uc9iOmx9PhElQpC11N5lzpQeBfxZDlZ4boForsVrkXRcr44X2uF4qFDH
         ZSSO0ptLYSLyq30F8HD3u1pVppIAGKvhqeGlkA+7mSMipitu1nsFzjDkMqItmF4YfWZj
         FMl9HaXo8srvabFVsgABc0ZLRI3dpJdbYB+hkX/mofLP55ArqpxvEO/FsFEQoU08/CHl
         adiS/DMQ3H8uB6H6ks4yu0knaXykCp4HTWnemhnrROOzBxGlAx3EnYseQ2wCHmMtvIZS
         L7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919382; x=1788524182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJeEPyBPzLxDNEZ0JnLBB6831Z29vJZEqt0XxGqWMq4=;
        b=d1M6AS5pyQ5B7rcufSCw9QZJzUGdaHdkXDO/CAPowFEkuJIlqdsk3Sj+7rPKuZUTse
         RGS4NExNh25qpctLTImwAP3Ud+xHIIvGZQe0kBcrQMZyZ5ra255Clkq63islgWuh9xan
         f3vR1+TxmkwdNYkQBH/UnWD/aaRR45vVb9liBe6QPSDLiZkI/fEudMzCe9rsa5JACNcl
         M3Y774CFfN2tSs45AgBMG/YkaA3wduOllpdCbpi7sY+eEuL/Bxw2YHyPN1pqd+ADDRDP
         PGm5Ksn81Hh59aHOn/CfzsCKjXMwVVj/zwBYvRvMXvqw+S0RPnERQOBNBjK72hLm2bqV
         GfMg==
X-Forwarded-Encrypted: i=1; AHgh+RqKZEp27gpp+Uv6MDfm2ksrKUa5DCB3EUC4UCZOX8sbbXP2ME+VsUQalB00SwMjnZsYt3H62gS+vg==@lists.linux.dev
X-Gm-Message-State: AFuF++m7p2Go8dCva9m7clBanoHWzfm/Xa69nLUd7xycL/XMzh9HxDYj
	rd60I/QpD6IzUZxnepVY+xhOJd8Q1XEPW2JHBKa/Mclh+w7dd4pR2nAEPOy5aPFWF+dGSgamwA9
	o5/KdZFTEXIbfmBfwC93Gl5vnnhwfVm8=
X-Gm-Gg: AR+sD12gnGEQL/ujbMuIE5+XXPu4Q92EOgfNmKiMcqvJ5fOXzBPBHHPAUhx33lXWhUX
	rVza8w2yjhAe95eP15qKzKnXmkLkkE4mgW8f4aRRf6kkboc+xZbRd3KV40zh7ar9fwdvtVOtRVY
	yXpKulpIa69sWZVQXM/jyJU/xtYPy/8SxeXhXDmc7ErGY1kY9QrT4VlOTYBf0QpdKMttMmcKZn6
	EbU1oxEj3SMLzHLFNvlGCmKM0t37mzFK8yBPJ3V6HaAssEwTUc3smg5OJLJCneceC+gYAL83G/p
	R1dQJTgBORuSZOSgcFO+SFhIgNfDd1Yt5z+BPrmmmnH3w/2nHQEWxEgBHTvrSWW1nqbUaG7d7Dm
	YQZ3pf670KhsaWSvSxD/kxtOUoxtvx82ue5RkPak5qgYmMw1e+OuTmnxz3aYL
X-Received: by 2002:a17:902:e742:b0:2d7:d12:552f with SMTP id
 d9443c01a7336-2d74ce2e25dmr61601145ad.0.1787919381589; Fri, 28 Aug 2026
 05:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828-nova_num-v1-0-e21f17ba4127@nvidia.com>
 <20260828-nova_num-v1-1-e21f17ba4127@nvidia.com> <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
In-Reply-To: <DL0KDAXUZOXD.I8FBZZ51EIIF@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 14:16:07 +0200
X-Gm-Features: AcwNN1XLnWNk0tl21KUKDNYvB86AzsWOBloGy7JyyvYK182UvGVrdB50k0AdYw4
Message-ID: <CANiq72kBF4xyKpB2oSvq+MgRuT2xk-VYSbtXW8HQaT0wmc3ehg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpu: nova-core: use kernel lossless integer
 conversion module
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, ojeda@kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 2:09=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> But honestly, the former would just be unnecessary noise. If we don't do =
the
> latter, let's just keep the nova-core num module until the dust has been
> settled.

Yeah, keeping the nova `num` for a bit sounds fine.

Cheers,
Miguel
