Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1A3BFE5C
	for <nova-gpu@lists.linux.dev>; Sat,  4 Jul 2026 13:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783170023; cv=pass; b=BWK3o6NpbzQdRaW/9ozh9ZO4ECm3AKfaUzIAcjAIB75+PKmWCOB6ZrKu6jF6UtBpBECN7oznxwGBe13SbVgpdDIfJBpT8xLQx42jhq1gUCJL+VKvCa4TXPANGrQrb0iiaLoQ0wGWyDvz4SXh+xsMZ5f4EA+rC7RudDXxGzYDXF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783170023; c=relaxed/simple;
	bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKttjgrW38x5MwEObKWcE/6PGuZj85jz7ekBPqMYVdEqbMlhtcTSYYPHYJ1D4p6eHyaQqEnBEVkaRkNnIyT6B4e/cfo+3zobxBIMzQZYGKZruzbu0RnRz3YAKTz9yrrOTL8Zmfx1/uYhWNLMbsLDNvwongN5R1rcCLylRg2DrYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsKcQR6p; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsKcQR6p"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845bcf58d36so138815b3a.2
        for <nova-gpu@lists.linux.dev>; Sat, 04 Jul 2026 06:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783170021; cv=none;
        d=google.com; s=arc-20260327;
        b=BLRXdV6kDcUJZqF2PMm2sgPkXlfoHoscVzlsGkZw0Ah4P1SHwuRLIaQNZY5m/59Jzf
         us6Yu1Wfe0FtZ6NiHfnf02nKfBjaUodGjUcMDagChts8OIuy7ntWm1xGjMpTzvsqbh+r
         sb2cwJMmmI0bJpSRmHD+zJTYnBdnRvvb88clFR5Z4Mrb5UH0Za1WKTKUmU5fZ+sbRzUZ
         439p4FHnCZVcp0V9U4OJ989nHrbmF6g0WmGIA1jaD0jac9HV/CoccdzPPuVlYAtdgGLw
         xCS3xz9Lp8drDFPUe+s2mpuyAkLJ0c+zX+ySObMDYmJxJ5VXX2BXA4mipmtPBn/DnKI4
         tuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        fh=wZskUUYZd+EGOTGjjlESQkw6ouBlfouTce2bn+6wkag=;
        b=U60xWR/9dDLp6Iv6Jl9W98eOXx0dI26opgzlqLL4KSGv31+o4yci3WpUdTRG4NlPq2
         28IepyX3oNBVWTZNUQfGzhvNhImbFDxP1WjJ5iVHzZWnE5Ksy4utHZCfOGu2e2XpG+A2
         5+OIAOKXwy8YibMtcCP9sssoP6Oq1pa7gHfO0CNGOn0toubttP5Srl39BbPqf08V7Ai+
         eOoPoovH4as0iXOuya/13vW92QWsFfeS65hv+b0giqtmrhUvUb3+aaWQQB2lfufc7VWv
         s52j85LF8hv200iwIDm504YsBRyXMr6o9Q+0uLGEbUDBssdgYY6KVkwFHCKd2BC4zhFA
         0kDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783170021; x=1783774821; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        b=IsKcQR6p5B9Iwx7+I7VNkZ4BdjS1fLypLMdRhRPKbf75nSXfv5SIKTTSGWLUZ6XcQa
         xOGwAQPU4kwAHX1eW3nJRltX5I3WxcUMk1qpsq0gwt3qSby0BIYMCf4EWl4RyXiqmM6Y
         w2l3cG8APmK6/l4d720FYR2JFjjR6PDwE1nWHOlZ3Wqu/SVy1dMmCVuUFdEmeRrTZoYg
         I1vSkZxRAJ8N/oLpndJ6nhwAoENqFoD15PaXHzmsU/8yYrKERBljIY3fkZ0B6NBYVeoY
         t1kXxkB7gZkW/iUlEmKU6Qpe5NCKUIhlxuJNj+sLgQ5tdSvqoRnI3PUJwAEHDs/MD3lF
         pSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783170021; x=1783774821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIb0LAhy6ZohB5fTEBHLOSF58e1DkPpYw83fCrDECVs=;
        b=pwdDiqjd8GE0DPyvTYj6/HgSZg02MLR2lTUjx256fySGMQYa3sq4xUzZ/8tAx/f1Gd
         +dSAQZPIWBbIJLg675c+OpvlezultHbRni0I16ISPM/9YuTvs3MjvEOLmru88X8I95QV
         FtqWg7wu+a3NQ6a6T2x2wgqSTm5AGdHzGD9nWvSlX/qq7278P4YmJslpeLfRnMPOgVcF
         3/GdheQZ/QMk2AkDMn/PwzjYT56/LkyQ8tAYdAKtR7VOjmDvq/TTz2UhxKEdKpC6WF6q
         23u55wtfALZFQ8UxqZkbhDb3sJarqARq+gGZQLIdPfHRaBsmhgf8r2aH0rbr7/9rx+xB
         nKgA==
X-Forwarded-Encrypted: i=1; AHgh+RojnBjfv+EXy3OmQsSl9XEinMmDTMscfS0XB9tlO7LXauiH633mwhsSUv0tOy0SzO2SyTTgyiKXCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6ScvkLjyShkkc0gHBKA0m5nRqQLaFfaDFhiI4F1kXWA1yMBFA
	de5bUf6aFTgWQ+dunHqgN8NcVY4Ta/ou5LKPxRp2OJzKIk7MLfmW7xOshx0s888aWRXhku+astC
	ILpXN2aaNkwHunRPh0NamaEztGaY5XMY=
X-Gm-Gg: AfdE7clUbdESIdfy6yHCveo0twp1H3CpMXWoWY6zy3Zx51+2rwxgR/h8M9pN+CymY+1
	cHyF3KveopyI0ZkBeySqdurS3gfByCOekmW7lgywSk23qi93hcHN3lR1V1N9n0VuhqKYFJIfrmO
	+0xVZsnUEuoO8KSXclWbQXXhZhjXT4+Hv2XrHxu/rp1IKK/EduQnLgkRPi6TEuWrn40xEblq5KR
	MRl+EsxZAswaz76p7I/2YN2O8ImGFb4xLSgDU214vvp789aK6FMuVu7t9RTmqX7s8S5qiT4hdor
	Zg7aRpQ0PKM7YAEfKzHwvPZO8if56byAETtubflCMa9sOvUd0dNutvn2hQduRXd4bptUoWSr1z4
	mOrK0GW3JQYZf
X-Received: by 2002:a17:90b:3e4f:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-382802bcc65mr2215108a91.1.1783170020948; Sat, 04 Jul 2026
 06:00:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702120324.40388-1-niyudi.honda@gmail.com>
In-Reply-To: <20260702120324.40388-1-niyudi.honda@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Jul 2026 15:00:08 +0200
X-Gm-Features: AVVi8CdSg2ksdLfnEyguJvA5pU1IOucVtgAfWvHPCYCaaf11PZEGGbNUW2d7mys
Message-ID: <CANiq72=g2mXOPtobn4oQUUASKgJzX6LOpuEvUUBH75UvbcUVdg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 0/5] drm/nova: replace `transmute` with `zerocopy`
To: Pedro Yudi Honda <niyudi.honda@usp.br>
Cc: dakr@kernel.org, acourbot@nvidia.com, apopple@nvidia.com, 
	nico.antinori.7@gmail.com, aliceryhl@google.com, airlied@gmail.com, 
	simona@ffwll.ch, dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 2:05=E2=80=AFPM Pedro Yudi Honda <niyudi.honda@usp.b=
r> wrote:
>
> Resent because of wrong target list and wrong email in "From:".

It is good that you mention this, thanks!

For future series, please also include a changelog between versions,
i.e. so that reviewers know what changed :)

Cheers,
Miguel
