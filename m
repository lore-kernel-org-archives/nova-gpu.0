Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725AE3B71CC
	for <nova-gpu@lists.linux.dev>; Fri, 26 Jun 2026 13:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479743; cv=none; b=aVgkyV/1mG8O2s73IkvEe/NZukJjrSMwrGKAJW1OSiHlJHJrTnXcYyZeTqP+SDshBvST17Mk42RYQHWK1nLqAb2w58PdEyHVXZ1xb57TfTB6gmaxHqKZs1sTRjwxgZvvqP7U0BguthsmILAJf7e5eI1lZhX7pR217DY1zQm2XbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479743; c=relaxed/simple;
	bh=aUZS8arJTb9jzjwmvDWy0scqNm3RC59q/slorQATQUw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hNTykmjjNHs9l/UiyZi/F6Oy3o06imacZ1PKFBNh1ipE/GA4ES60FVtizFTKqZV58v4rqP85MltafzcjMK4PGScYn+EF3Ru6iz4nUOc2Mpabmg5L/Q7QuYVM7M3G4V1uJh3qq08fuUs4UnEQcK5CbT8QpfxXbpOxJoZUzCxTV7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUCdrM0a; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUCdrM0a"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c591fb1cbso1447667eec.1
        for <nova-gpu@lists.linux.dev>; Fri, 26 Jun 2026 06:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782479741; x=1783084541; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUZS8arJTb9jzjwmvDWy0scqNm3RC59q/slorQATQUw=;
        b=WUCdrM0aUOwhHIiblEUovrglLTf1tc7IBPDS5NPoLodOYOMldGjrPDrUigFCyfyfwx
         qmkdoqxOCcRdpmFHpB9VT9DfzLTfkLD07K2ekgXLTxRd87hp0J+MWqDxwmtBxTHz4o0C
         m8HfKvJX2nLCDpuZQVcGsc1GJrMjD2Ed8JmndoVQD0w20KPsc3ovwSsPkWoRg1l8cPz2
         nVSxyrY3oJDx9A1nKk9QMopFcI3+AEBpFinoeGz1ejM0mP0+o3A3zYIhZeWHDCNMNihv
         0x6muwCW+qLBVVJgRTCYWNNKjhemus7ryK7PxyaQ6rhPh+8nZJzCqI/+9o1bMrO7cUWa
         qddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479741; x=1783084541;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUZS8arJTb9jzjwmvDWy0scqNm3RC59q/slorQATQUw=;
        b=exkjsEfrtL3sj13lNHdP85pW/d1pkdqx7e10yAlIkuNXDqAKRTu0jJtK2+iI4t3FvN
         5atFiQfJxPwypt2ixHe1jB+avYLjcuL6Gp001IIFe1w+iBljA+jP99U3rGLG8ReWldIX
         qjmNdJNT60EpKrqun1NeHujqb0pasH5xVU/pZHf+Evc6Pk36WzGLUJ2p1BZgGbjphc2q
         9nBllozSvKRt2RmPMfhGG58IenGYBlifhSesXru9bvMB+1Jd1Xgxhm8c0rGs7+FghFmF
         UN01UH/pscYJChLTriec22VsHzLoVT15JGjBKyAQWkdu4mud52tERQeJjYW6pVGUG04d
         SJpw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8CaaA3XnYI86vT13smuYTdUjkj36992LDKdXjNTnxa7DW7m1BoaoLSII3bBp2/f1XYcbRYFG1Gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxtbu9ck2tKfpuyuP3LWVCnN58dHpfRIuQ7mlf8gCXjSS8pnL+3
	4/Oyc7I21jRQrrmN2RWgyr/tDL2Kn9pI639+3XAHYZjFPlVbQ4oGce8=
X-Gm-Gg: AfdE7cmLnDGCXhjTP+vkN5D00MzSU4wGFs2Q3E3ajvwN4BGZiOiEE+lB6Uxh2+WMqzY
	pXs3hSm9M5J3Ecmbyk7eHVxjKWyAIdUKxwR2DZ9b+pjayjuxEiQM/Pqd2C7e2u6XE1ftnYHEPeu
	jaflzTK04IMYMMAyK7eXIj4PUyCs6ZAhmAb+RctqvOUUIAHOYxgNIXiVaQZO9VXheWDT5miNCII
	cugdzHVOb/RHkYl64D3n2z5ryDew/8vos/4l0NvEYy0SJbPoUngDrY2X2tA7O7PjPuMKjiv//BN
	s1YmhdbNll4pUXdnelXG1Q9sxuVPSUmPzBZ4Bu1wVXOXt1orJG11sXvviEddMT+9o7VGuyV1Fwz
	LbciUQqCPxsOaY1CZPwLrMw+EcZ/po6eZvg6wulBuXsTTcTbwI4GsPDvMbeDB5cMu3uKan+P4wG
	uMnsSFckZZo40+34qfmr2XXzGGMUqlOlInQ5QJr/UFt9fbLpD2
X-Received: by 2002:a05:7300:2321:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30c84b84f6dmr6776480eec.11.1782479741405;
        Fri, 26 Jun 2026 06:15:41 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c4c691dsm17366960eec.5.2026.06.26.06.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 10:15:34 -0300
Message-Id: <DJJ0BXFYH05I.3MV4GC91I0HTX@gmail.com>
Cc: <acourbot@nvida.com>, <nova-gpu@lists.linux.dev>,
 <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ojeda@kernel.org>,
 <rust-for-linux@vgdm.kernel.org>
Subject: Re: [PATCH 0/7] drm/nova: replace `transmute` with `zerocopy`
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Pedro Yudi Honda"
 <niyudi.honda@usp.br>
X-Mailer: aerc 0.20.0
References: <20260625190553.7245-1-niyudi.honda@usp.br>
 <DJIGEANGKENH.3L3T55PFRGY3Q@kernel.org>
In-Reply-To: <DJIGEANGKENH.3L3T55PFRGY3Q@kernel.org>

On Thu Jun 25, 2026 at 6:38 PM -03, Danilo Krummrich wrote:
> (Cc: Nicol=C3=A1s)
>
> On Thu Jun 25, 2026 at 9:05 PM CEST, Pedro Yudi Honda wrote:
>> This series follows the introduction of `zerocopy` to rust-next and
>> replaces `transmute` traits with `zerocopy` traits. These changes are
>> mechanical and don't alter functionality.
>
> Thanks for your contribution!
>
> Please note that this patch series does not apply to the development tree=
 of the
> Nova driver; patches for the Nova driver must be based on the drm-rust tr=
ee [1].
> Please see this related explanation [2].
>
> Also note that there's already a submission implementing a subset of this
> series. Nicol=C3=A1s mentioned to resend once the backmerge of Linus's tr=
ee into
> drm-rust-next has happened, please align with Nicol=C3=A1s and base your =
changes on
> top of his changes.

Hello,

I'll add Pedro to CC when I send the v2.=20

Thank you both!
Nicol=C3=A1s

>
> Thanks,
> Danilo
>
> [1] https://gitlab.freedesktop.org/drm/rust/kernel/-/tree/drm-rust-next
> [2] https://lore.kernel.org/nova-gpu/DJFVRMR67B0W.2AJBHU1PWDPFT@kernel.or=
g/
> [3] https://lore.kernel.org/nova-gpu/20260621143647.264770-1-nico.antinor=
i.7@gmail.com/

