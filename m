Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F54D2EDB
	for <nova-gpu@lists.linux.dev>; Tue,  8 Sep 2026 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878957; cv=pass; b=V899Nf+8WssqH5/cXWMSDfxJP7JvgbhYlOKsJaoEqfqCddBo1ifwHPJ381mKfqnRF3UMinUOUOfqhoWvD/wJVB6SfA5++W8+n6FVW8+ceNV7hDBe2UppkXtCmiM0kV2dNUJPwLv3LhjyoAAl7f6UJraeljyS86d+min2vZFBsDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878957; c=relaxed/simple;
	bh=vBTnbXlbtE0JtfGMQ2MHvqNX3t4tOrq8IAFxQ0wndOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N8ZYdGFtptiBbG3LiqDYZx04OFNvp84spT20asX4gDbGKGLVjOPkCaBFHrGJv+YU//bIf9wQ/gLrqX9bzQmEKHuvoekH5SB7XanvjmVUoN2V8BLs0dQa7MQR8V/SC04rCFLrO9U9zWMDqLOvBOoccH5pOdpYAUGYaZsk7n+DEmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com; spf=none smtp.mailfrom=darkrefraction.com; dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b=iBdX5DwQ; arc=pass smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=darkrefraction.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkrefraction-com.20251104.gappssmtp.com header.i=@darkrefraction-com.20251104.gappssmtp.com header.b="iBdX5DwQ"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bfc5b77c02so4176728e0c.0
        for <nova-gpu@lists.linux.dev>; Tue, 08 Sep 2026 07:49:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788878939; cv=none;
        d=google.com; s=arc-20260327;
        b=X7UfcUUxPBRR3M4Kg8i3P7fzm+CUcvbZA9JEDGDEtTA2KZ7shy9qMC851VjfwPIeEP
         tiuSI2zEskdeuJQUEyiIhdHtYPCPncrqJn+tKbaeELbJDMoh2IxvVuc1agz01h/2WutR
         zA/mmWvILjwtfJdYSgsPXYGPqu5gjgD6MEKIkFmIUVnldYTEQxViBK5PQRci31LB0BPt
         /RaVEMzYGEQqCTovVmAydw9Qi7992C2Kse4lqipoBMtdjlid0FnABSV28GSqsyqVn1Bm
         zn6r7oJRxDyZNPK3Pq63p35Kuq03I1DZUIT2x/scezkqCWwiP41VICiphAfRO7tig8ko
         N4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        fh=TaODlbMpZTVzqx/pOcAtDhDoZHIIVPSCT8tacoS6F+g=;
        b=DTScCWQqGvc5VGqHszi5aEy1F8idkOczP+QP9CHblmVNf5XYL3aPiCnICTAeg/VoCQ
         a0YMRl+3ChLsx6jfj3utHw/R9yWRRd592ObpeH/12S1Em6eKyc3XThJE7CHFcoL/iBV/
         r6+mB3I7Yilwk9pj6Mn0w+mpPnBHIccTv43yU8W4EDL4ZEu4CNpZiS/zwVkxhgganlNW
         4hQja1y0kco+mdh8+ksbpypMN4203lgsubpfiKE2iLG9C5H9HuULwaWO9JM4XjAgpzDp
         5kjck3Npt9oQMRIjn9Jk8/ZGTDMRrgZUlP0gECvC3p+24gABlcydITOtckubWId0XYO1
         WIYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20251104.gappssmtp.com; s=20251104; t=1788878939; x=1789483739; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        b=iBdX5DwQxJvNKkrtEs+gBg0w9di+nVOKouzrhg9w6OFzxt6FySjv0/FfPPQytZ+F6D
         jHHngbhpKE6aV9T8pnukX0PMogejv0Qh7ntja34CRzqlzayAM6/vLlHHSQndO+ELC2pG
         d6+ic3kXLF+a/nJzHZturOnK9O9DDUhvWki+Omksak0eone5Qu0LC+zIwti1RlDgPr8d
         xDo3NHBJptqwaxkEBo0sLGLix7XlAmZdazuH0YRxvZAP0Ws8a88CTMgL7wVSiXEUP3nT
         woCkwSm1zb0dJbBpzhNxg/N44x6fIuHz59MbmLR5fzGNP6LqXPC11+/8ewAQf58rXfff
         hwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878939; x=1789483739;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mn26V6U9AHVIB3sm1/v6lJDDiA+oJxKcvjPFvuodVsA=;
        b=k/PvOGSp+mBS3CIi3auJfPsTPbjuvMJYtRw/jxpryJmK732Qpvuoe5TpBRUPP/swft
         +gUf8u2YFeaXRiiFg0gLBoa7nqKlMyPHR8nwo4cegLCIxE1cU00c5IiB/mQrqs3hHwue
         pL+X5f7QYO7t4CmBQyS/E3gdHm31hUnjAaT8oj6jqAqHsJjK8D0JWJhQDdYZVpCSQG/j
         mDDRONaM1uzjYSlwecWu/2xAWEjjn5JTIbiq2IEzDe/hFxjAgB2rSxaBbEM6zzI485em
         6Oz5N314dvkLKnlh6ZC4g/vVNx4vuWFT79zsGCADxNy+SXFycvLQCHm8Y+Hzhz2Ho6TN
         2/1w==
X-Forwarded-Encrypted: i=1; AKwUvBxAq9tgEnS/Szn37zDmZIjMugZaHxFVU0sKa8DKn6MCZW3a40AiiOYA0kcijf4Wq77BqJaK1XGxHQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kRmfSg/RVY1oJI2f/1/UHpDAe6af2lZt1+IVYenGglhNvx/TiN
	1uxbMHXUpbIU7wjawjiSgdhx4T/TShL6Rgtu6S0IaUM6oHOHEcpqYAgtQAVdLG/ckitAIz3Jw4J
	mbASvmWhXVooUqzer4EjxBnYjusj0JlgOFgApbzk4Xw==
X-Gm-Gg: AYBFou1l2eWh0pfcLsLGkDI2mqy20+++Xfj+8SyBrWz8OwgvdszNwmnZrp+5jVr8cjN
	1B6Ec0KtZT6oJXs0DT7rRQgHK3EWA00b4lvr8dtt0vO0DX6mdHbCwaI+JkCAbdwIiDsmou4GHkr
	Fn3lCiOG+Xm6be9V1EVZ3vCor0JfZYdfAhWhFITPoKoB67VR5/71FkKlKQzy0FheGXe71hJ3HjM
	NpZLYpDL+YWWD9bHix/DoXoM1CUdRmfO3BbpjoIZ1JkYqaMiC7OurH8e7a9oa5pzb0mW0XNIv69
	ZqiMv51BI64LMvAGbWRADmsET+cTFv57G1anll3kz38l
X-Received: by 2002:ac5:ce1c:0:b0:5c7:ed31:3c11 with SMTP id
 71dfb90a1353d-5c7ed796b9amr13188562e0c.3.1788878939466; Tue, 08 Sep 2026
 07:48:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260828033531.1117754-1-apopple@nvidia.com> <20260828033531.1117754-6-apopple@nvidia.com>
 <DL3WXUPD5JKE.2GZ1CNJH539ID@kernel.org> <DL453EFS03T6.2VGI5TJEQ52QO@kernel.org>
 <apdvTgAp5eGezO5t@nvdebian.thelocal> <DL4QCAZXM8EU.2K8MLAM00VNTX@kernel.org>
 <apioGUDamrCur_oR@nvdebian.thelocal> <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
In-Reply-To: <DL5MA26KZEF9.3KHKQXZ4JD2G6@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Tue, 8 Sep 2026 10:48:33 -0400
X-Gm-Features: AcwNN1VMoN6xdNn8eWXN2SwQNMCIT94e5yatQIWCSWj7WmgOlqVF8kOh6QLwKIs
Message-ID: <CAAgWFh2iPJzQ5PJfFpPBTdgZ=GFjy7Eoz5C0e1WwFMuOuyJSTQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>, nova-gpu <nova-gpu@lists.linux.dev>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
> Because userspace otherwise has to figure out the architecture itself bas=
ed on
> the chipid, while the kernel already did derive this information.
>
> There's many ways userspace could do this, and I don't want to incentivis=
e any
> of them.
>
> For instance, you previously showed how userspace derives the SM value fr=
om the
> chipid with sm_for_chipset() in mesa with its own lookup table.
>
> Then in NAK (src/nouveau/compiler/nak/ir.rs), there's this code.
>
>         fn is_turing(&self) -> bool {
>             self.sm() >=3D 73 && self.sm() < 80
>         }
>
>         fn is_ampere(&self) -> bool {
>             self.sm() >=3D 80 && self.sm() < 89
>         }
>
>         fn is_ada(&self) -> bool {
>             self.sm() =3D=3D 89
>         }
>
>         #[allow(dead_code)]
>         fn is_hopper(&self) -> bool {
>             self.sm() >=3D 90 && self.sm() < 100
>         }
>
>         fn is_blackwell_a(&self) -> bool {
>             self.sm() >=3D 100 && self.sm() < 110
>         }
>
>         fn is_blackwell_b(&self) -> bool {
>             self.sm() >=3D 120 && self.sm() < 130
>         }
>
>         fn is_blackwell(&self) -> bool {
>             self.is_blackwell_a() || self.is_blackwell_b()
>         }
>
> That's two unnecessary indirections for something the kernel already has
> available.

Userspace mostly uses sm id and engine id for feature checks, and I'd
like to keep it that way. They correspond to either the shader isa or
which class methods are available, which are what it relevant for the
related code. Most of the checks don't look like those functions
you've pasted above. Most checks look something like `self.sm.sm() >=3D
86` or `info->cls_eng3d < MAXWELL_B`, which is to say that a
completely opaque enum isn't practical for our purposes. We typically
need to check if we're before or after the point where a specific
feature was added or removed.

> Yeah, although if SM is correctly reported by the GSP, I'd rather have it
> exported in an info structure than have userspace create its own lookup t=
able.

As others have stated, the sm ids reported by firmware don't always
match the sm ids documented in cuda-related materials. and nvk follows
the cuda conventions here.
