Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6920942254F
	for <nova-gpu@lists.linux.dev>; Tue,  7 Jul 2026 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432575; cv=pass; b=RszX4HJHHiE2s6k/XKOreGOVjzzzGlv7HW04qiNW3kEezyJbuc7BE+tjXctmEcT++Y/2o7iqZUuqgenidIGB89y/kkCFYFD8ysPB6tIEVNSfzOWevQN1WeuXc7dRZiYS9rZ7Nv6KJmQyTvjuB34B1PB6jPvHtOzDGa4QAWMnGn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432575; c=relaxed/simple;
	bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mxm7c+8HBHFQ+gduVzqzHnIooRlkMMTAMB9RKbsp1+SYdVko/5gZ5XqRjkWEpgyaAYs0611mWspwHZ7bswUmf3LwxHnlx3D9hbZ2lmu3hyS/eJpJ8ZxsLfRYUo/MttmOwr5vEi3i2BWp7Z7azRkH1vRdi+a58R0tPxaoxi8ZiTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ffr1/eiV; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ffr1/eiV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so2622181f8f.2
        for <nova-gpu@lists.linux.dev>; Tue, 07 Jul 2026 06:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783432573; cv=none;
        d=google.com; s=arc-20260327;
        b=hWmD6yop+pI511+v94QZgYXqzEANFykAVrlAgGCSmxVIqTQ97ghlmrZT1zqcGkTVce
         b3eOUqfzTqqUDgBJPxd9MplUFSjAvbdZDBYI941VX0CcLcJfs6Md2fFX1gtNnvkZoWQI
         9eXg8hXiKnRJ/mMy5akJxaHMM6F14ix8D+p5NTLQ9312E8RLiPqFEE/GpieaU3/wkr9S
         88vipKNvs10uejPT/+KEYObpxRJvJDq0WQ6fsbeZkbysI3bFxjYzAKR+Fx+X3FtP4tnU
         c3elgsDG7KZqG84oTtb790hEdouGqmuUt8xSJxcOpQyu/OEFowjwZGm8SGE5G1+vaHof
         6NDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        fh=GQDpOEVkbDmu54uhxYBAWWblgGEUctAih6Tie0hNpLg=;
        b=fUr6XW0xiUKQxStMawrDExukJPkXe6fX8j2cqKeu1it/8UKLjga00o9QsjYuLD2vDy
         PYVykaYVoSwx4EUXIhUyatuOsDFcxggi/4lB/nNDW/jkF+1sN/m7y8D/6e3Ps/LK5xAt
         xMtdKo7Xwe3/b4WI2GOYf/08DRffIGipvPuhGyNqXxUJXpP65BKT/ixCYrmz9g/lOjCV
         KQQ6TLvEayI1aZA0Ut4Z5b2CiUAmBhQdp/bt5lmhBr+vAhr+JPSGfucoGjWRKDRUtGEY
         A4ZTRW85tA1QOr0CzNt6ssU8ZV2P06spOOhKZ/N45xdQcp7IOKKb0Wzyb821EFEfbRpE
         IlYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783432573; x=1784037373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        b=Ffr1/eiVkfZzz/l5oiviNMU+RIMovVATQne98pG7QNS1gJivkWY7KuiUP+uw9fjqIf
         4wY3e7Qsh2cwRZlHAxnG5sRpyGtOihM/DXyPBBT6edjx0VfBngEPL6uuTQwivRGByFCx
         E8fGMufmKEMLhLEsTo3lB1kjBqCRZaP7xFESgoDfgpGvleDLf+OH2McgI8Zj69nIBkUl
         rLJWIfcZfD01xRBQP8cWDbGI808EZXAvWy00AEt4Hgrxgkp63tiW/xOxjekzkx6tvmeu
         WrXgoOgWdgbLAU9AgXkIF3v2+PW6V2aAQB5LCx92Cwz5roRnyx0WRx3fFmK8rAK+89k+
         I9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783432573; x=1784037373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nNxmK9/0e1DDLDiWJdtnZznbYGrC+zqRTQAuKd0PNlk=;
        b=YL90gDYz1mRZhhD7oIF34ChvtxyR7SOlwFr2IfNlcKDrtzGe/NXoV8QgCOrcdh3eTz
         E7uFk6yfURYTjWq29XsshulNnnGHudP1faWelJk9L4FiOo3Qw3I9kp5g7583SigPyAl4
         bEpikjks/kqCZExq7NXqwXQtnB+4ke3vJmL7qHi2O3yFnlOYZk6jFqiHOEp4kKv2Q+7k
         STInm7ORgHOKRuYoeqJDieBnI2v6vyIBAge5dWj+GujFu9T0D/lKkQZw/QHsguwAHFi7
         StEx1xyAP/hvAcrb9hFde/0FA7TWrPk/xrm/89qKqy5RxWTNenOzYiQTUcP/lGh+OMTU
         shrQ==
X-Forwarded-Encrypted: i=1; AHgh+RouHl1t757foc0IcUkzKCv34VLnTVBqqBOdYbSH7a+c8lib4zEdhSHetf4H2dMgujUEN05MfyMovQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSZtixZkGWiycNbTub4KGu0UxTtxLidWK7qv/qhOGZhmDWnbcT
	PXkwStYlv7GZG2hDAHLdd03xAlONa+o08G8Hprzo+RPSReRQURxE2+mreLBTXigGSNMWbkN6t3O
	p4GUpRyq6vDBu4PiLQ9OxYrp9hi//IkT62xcZBtOg
X-Gm-Gg: AfdE7ckW3EIfgU9WxqtlqXaI7woZA1OiWWWLQaEO/k3Xo+7kUpMONZw9YiWK5rmDOdA
	hsrBAByTGmHxjLzb9kNEqVKEClShj/71JqDAsjQcXf5ubYQNcZewo2EmV8BA9OKuIyATzNjL4cS
	PYl8JuYFjYpOxpRcUGQLF1OpCBMPa8Pvsd+Nu7zwqD9cb9s0r9dyQVMshGegfPKKsS1BxFipaR8
	xC2l659nrBfIl2oYbbARvFIwbiQw8DI5e70PzqhJX+rWUZn7bRxqn/38tEa5rSRVh37dCxTnADk
	Cpve8vGQ8S1FCZRqQ89lrDD/dFbEQ3bpi7VGmg==
X-Received: by 2002:adf:f290:0:b0:477:2e75:522c with SMTP id
 ffacd0b85a97d-47de66cdccdmr4577090f8f.28.1783432572316; Tue, 07 Jul 2026
 06:56:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-1-84fe8259e46e@nvidia.com>
In-Reply-To: <20260703-chid-v1-1-84fe8259e46e@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:55:59 +0200
X-Gm-Features: AVVi8CdHfosGlUDJEhRFxdK1GHnnIUmv0dXkgaoEgKtaKne6Vk4-CO1ueEwiEf4
Message-ID: <CAH5fLgh1Gh0ypT3R9E1NrDHXha5G-BJJdTzGxz240QJ0inZ5wg@mail.gmail.com>
Subject: Re: [PATCH 1/4] rust: bitmap: use function-level cfg on kunit test
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 12:19=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Since commit c652dc44192d ("rust: kunit: allow `cfg` on `test`s"),
> we no longer need this workaround.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
