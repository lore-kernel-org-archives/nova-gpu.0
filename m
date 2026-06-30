Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CC91E2858
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782808516; cv=pass; b=o9p9Ks4OAVl/vqbnMGHlT2P9ebDbzab287CGzUnnvWCI6Eo3Fw2K9ap9nFURt8IidMqDzwyCvAhh4QyuoZVKJFYb1yLJcoNVSSCYyx21A14J4FYQN603kvsth/JHDEMXMeVn2kDupNwBPbVNmEi2urpDUXFA7y0EnVwgkSbWMcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782808516; c=relaxed/simple;
	bh=12uAIaSCl7tiswRNJqqBaN64Jz/2PQBPhlMgm7mCoFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpp0HmRgEYupNqGoeO9JFwF1Z+sSeIRZh7hxQpQnLlKZMiOjl/wGJOJtFFegLTiyTH+QWxTp7NKHNyU0e6uKrCsYzsMRpiTuNRluJTFb/T5hGhniOa3uYOQJEiK3nJWhWWoXqJJW1wYIzrXokMNb9mISz+NTetDTM6/ZS8Jgalc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMkeQR4M; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMkeQR4M"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c5912314fso555351eec.2
        for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 01:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782808514; cv=none;
        d=google.com; s=arc-20260327;
        b=VSj5iNLdHfL6hMJxVov8jxqG09GdyJj+D95I8aA+hTcrUsoezFgvzraoTATJWDcV07
         7mTY4Us/1eV4pEfrlGeDj2kM1KsrKlcwZtMe9qPwDBfWqBWYL6aTr5G7MOLkHtrR6HPe
         5ejvEfDtn0JbHVzdzg5UTyzzNS8+wkH1psQ6wUbeoh6r+/UxNDEk+B7hWsSBxLJwwOa9
         xcSNgH/+BeiVsIz0/u1toTGYh4mbuSCdBQcQqGUJ0QOVyd/q5swEdAkrN8z6mOXV+AX1
         3JALMzoGDCeeyj7V+w+pfC0FZxkUIQ5AJxT8MYopBiRo36DNDSDJZg5A50mgoQBN9EDt
         sV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        fh=/Niy2tK27aF+GW2LSokfULyjZCdREkp7lSUuSgJGVP0=;
        b=k+dS1tQHKOhFz8Mi6EfJryaBlIbubSJqZZP3awwSKbIB1it9pA4qkNU7o/pWscylcN
         bqs6Lz/QEMc9j6srcEfPRVIkSDAmQqTiwguptWYFQMdhcoLvZ6xc7I9eJ5ZiEaH/Q1Mc
         KivhpDWwayUcEnvZwYi384yeJFD7HzCF5cgU2rUYh5A7scOpWiPbkpmGYGZh7buOFwMt
         lx7qbGyEG2Hyqp3oH5oO4UqnBLmthY0yGU5cuqe84JtXQlMQZ2FRieEULvZEH/c4acdj
         fLxn6rJ5tHgTlp4V7GQ428oKpZZ5z6asfVLh4+ktFirPly1DJTlMwgNFBR6IqQ42ruSM
         QmRA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782808514; x=1783413314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=ZMkeQR4MdmM+Kpw3cjhgNiRiTO9dewsPeKpheg/u+EjYLdrQkVxnHDoe74WIgXnAm6
         LXdINdAhMGcdK54PRwsPqKaoyc3ZZqh9RWPIo249ZpcUzhw4zpvOoRwR6c4uEWGk8aJ9
         sH0nXUAgbT+JBluRIGuaZES/vcmuGXpArWC5T0WYss0PB7buyEm7o/Y1dBN/OEJ2XTAN
         emjs4f0Kvl6VvurUOf85OspyAppGjcO4TqGNTZhW7EBC/fpzCv7l1Ec9QWkVTkxmR0Vf
         nZ3NzTW9Z0Uk3plikPwA1E4QXOCzx5aTDF6Bef2uqypNc8Y7uI4+YynNULnxTZOa+YS1
         QzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782808514; x=1783413314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2h4fg+PROtgYOgPDGjwjg1prtaKYRf+MRnb5H8GnFAw=;
        b=NY9NVHslF0+3uD5q4Wuql6Em4/g9FuVbLA/Z/WONJ9SQwYJVvZtoIyxY1PBtXvMXgc
         cqZsg4XbcxIQ5B6TO5dHGaSswrhkJUDcrN0yWY7gjjwfAZRxO+rxu+roxH2fmm78FYUS
         yibgZ9N3oGpqNXfFf681Rb/elakojW7aNoxdnkjfeafv8/LC8nHfBn1lYIxTcOsLhs69
         +kmLI7FvdDvQJtxX8OBlw5/AefJgE7BoGFTAyct8NxJEKvbnkPvrU8+PlBNEhVwfzDbH
         Hm2TBNPICxw9ndnfw3Il4TbGqxjcXzcWsAb6AlKGBkFfDcwOQM+IgYjEQjq7YVKecHB7
         SL0w==
X-Forwarded-Encrypted: i=1; AHgh+RoEKEqmubkvzhK6/mOe5OwfGXIexkyzJwlYiadwACMcgxWQgnl4CFBQxErx7YEDNHvX/L9hrugbkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0/cOGCQHWkTRdJJgKo0evl9h2elYean+Xyhw8X4hCi98FpKcG
	v2AYCBWJBQFmU+PXhtCzHhpAHRrFGpClpnEDebeHbonScislnSpuY9V+v/xaT0GQsvxHXda1tko
	ZaIjMoTDPRfTiqbxMw9X4zao2J6D4ZbU=
X-Gm-Gg: AfdE7cn3UHGc05Bn5EAxp5Acdhnt077maI5wW0EkvNkP/Pn3JdvfgdKfUfT90x12+Nx
	SN6gkkz9qnn232aBoEA9Q/mxnrKY82279KYe9nDWOq4ywLyKCIyStHskJu0mtKTDt7l1VxTf+qb
	dstWOLCPRpclNLXEp9Gk+vsl72Kws6ltA4j4q0JmsHUR0DEi06Dyvb694Rzb8JkPtM60ynPps2l
	/keB+hpDJ+7XELEe0bzBHZYd1YmTMJ3+OM2w3OGb/9Su1dIUIalwwy5fn3ryzs1BuN4D5As5yBs
	jjWoiMGHFPbNxbnzMWsrD96LXptr0EGeqT96tV9Lad5/CCtOX9jHnmrlJ+9pPKxqmuGuF2qFMlT
	vPckx5n/ygFKo
X-Received: by 2002:a05:7300:6ca1:b0:30e:dda8:e0ba with SMTP id
 5a478bee46e88-30ee150954cmr1003565eec.6.1782808513710; Tue, 30 Jun 2026
 01:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev> <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
In-Reply-To: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 10:35:00 +0200
X-Gm-Features: AVVi8CdhtqV-BYuDJ7-_rhOqSdDxdGUExu9BuuQ1x0bjmiH_24JXcG_HI6rxurs
Message-ID: <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 2:43=E2=80=AFPM Zhongqiu Han
<zhongqiu.han@oss.qualcomm.com> wrote:
>
> If the preferred style is to place each imported item on its own line,
> shouldn't imports such as
>
>      cpu, cpufreq,
>
> be formatted similarly as well?

Indeed, good eyes.

To do what we want, `rustfmt` needs the `//` at the end of that level
too (in the future, it will be without the `//`), i.e. the patch
probably passes `rustfmtcheck`, but it still needs to split that line
and add the other `//`.

Cheers,
Miguel
