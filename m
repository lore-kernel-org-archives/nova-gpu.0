Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927E3DBD63
	for <nova-gpu@lists.linux.dev>; Mon,  1 Jun 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333226; cv=pass; b=N+iN+jkZnJzcKUHB49FCnB2r2YNM+DcQl1xfxTqNqwkYBdNVVE5y+PX7z/rOpapuWFPzeLU9KHt1N4BJVrHgLjgOVCdkscTTm+sh2OvITjJ6Wirp+0YpSTmiE7gxsqOK3yUFz8+I330QFGyzLotVpPaZIskVVtgQt6WJ43Xjbus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333226; c=relaxed/simple;
	bh=salmmm95H70q1+9ROpe1qMKo8sa8cqKehQgZ87WFyHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSdUMNUCGSHAJxDxnbYCVSrkZYK8bzbbz2FSU5QVVs6tRR5qw7kLq1ElJva5txR29ohpW7a1iLzvxJJjTFy0XGhr2eanyfDWzcXBFm+s62Bi+f2+/m3QzqOq8laE/jTPRtaYbJVeVNEKikZHAlpBoN1FQ/tD6G0vsOv4mQBqKvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJF35q+A; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJF35q+A"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1363f6f7535so422005c88.0
        for <nova-gpu@lists.linux.dev>; Mon, 01 Jun 2026 10:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780333225; cv=none;
        d=google.com; s=arc-20240605;
        b=DDJMOjjCSeAQFcly/Xj8BG4lkbtj3f9dsjc4i1xbdTGoOFcQPnvgZnCE0WcrcWhF9A
         XsT4AWpB8waLgAVndG1Eag2ZmTBxdCgier+QFYgaQZqShrC0zNJHrqZzl22CNt+bUDTH
         4MGB7DSHx4iDumBHLl+GJi3WqiL9YW8rB94Mgl+Wl4Apkr8dsA7YnFtyIYgr1URGchbc
         4uutZJCXAdutPeWQmX6u7vXljVPsg1lfFXEB1TqGDOjb0841We/X6OrPJ6I5bi6p7PsW
         /cefBHJJFkqEpaRMLcxpwvt2SQv54MIKcDgAoWBsnHSL+3EG5tfuIwu+oAUulbn+HGzp
         qufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        fh=Zx49uco8ETPVa7xicAzWmAspkysovgKKRxhN61aHk/0=;
        b=A9CaqgTnBlYqf0yr81J8tWooQoG1NzJFNEKbALbZtahkM1M95VuJtgiUG4wycNUOOa
         pJR0Lbk+8sXVdeeYXecxCTlOMngNTo/uQqhuZPuz5wFmQpm7SL/Q0NYbwxvTmP/KIPfW
         LsS/H1n5yCSqOWdV/FohaqZzWlK1jE0dS0vvIGEG+gphF7Zi2i2mOdr6Wl96sn7tz8Hu
         oJU/uLveOVDo3eGcyxSLjG/Bsv6JFywRj35VkN8b78zcydY64te3EOy9aOJARgfYSz4S
         JdjKIo+mYsthsG3SmUdWRprujKMmo8bjdi4gXKT+R3FTq+ZSMfaykkAdhhXCDn690etU
         rJvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780333225; x=1780938025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=kJF35q+AwnxsDVbHZ2Y2xW8kNy102pbUoKUwvX2sSl6WSwtWROrJHncjdIe5N6sblu
         7aYeExBU/hOzrWF4pjwetvQphJMFPDMoCPyykr6WEIN71h4RlFmz1T01OxJARIXZxJkZ
         NscGp3DICDXaF5eiwBjXEO2OWoTywsEOBc++r/BGhQsOHCO2rKvuteGn+vMsoGPxzRG8
         eQFHnkl/WEBXMXtZN+bob4j+7ODG7GZ4W9fLSiaXvV803uugm4YOsbgjiZT0jtE4M7ub
         t9P4Xw5ZlNm9HigEBIPkuELdyK1dWts7cpsj/ROCjm8U4m5OVx/DEocrHaFFA8n6XxxF
         0kpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333225; x=1780938025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kYUhb6mQkkMhkxxhyG/H6BneYLT2Y7wBn/vJjSqdV84=;
        b=fIQ8CNxR6XCZrB5kNy8AGC9UOKWUtS+Hn8Sidb2+FbDB7H0MS7k7DwglLw7LoFRlyf
         EOoYcIJ27ms9A1Fe0fAe2be/yG3PsdoTJW5RTNzL53ZDrFYADVEQHWc71FrgimD6jIP3
         nEVdNInc06YcfGgoY7jT9oRU5UGWqj2/uHpOIrxZw8g/BQO2k0OUjo6bWfyVbWcOZsvG
         6H/SMOzwED4YTPqSBaSsIsBgGsvtn/u3kqaOZx95+DmdYqXzcoFZIsXlQPO2l3TYIpXZ
         4H1H9MYNgMavyu3RY83fo53r+8noFuEK0s07T8F12aWPVu674Fgn0vi/+ZGDvC7Y/ugo
         uSfg==
X-Forwarded-Encrypted: i=1; AFNElJ+LNg/xkoBCVCvy6j1DJXzzlz6iZ3w/OF5dZ5yO3/pfmMMvUxxgFKVyMrs1rLUfTZOt/YaCISkdVA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0uqXaUQDGt7PLfZcjldPUfgylWiBuaLA7zqiMCuhbSvPtv0Z6
	VcC0NJNhd3jq4Z63bhXOqpPE2zbBORGJML+r8kH679KtHv7zCSqMzmY2dBllYU6pkyNyL1QTPUz
	fya6SL6IcyX3SdgOcAULCHzMoVHQIStA=
X-Gm-Gg: Acq92OEbz6pZNI3tLVguLdvCKoLOyjvom5RkBb2qzgEyISRUJBDuaIHabkzrV+s4Cn6
	zOP6jY3Nke1Su5un3qJ1+bavVGQ6zbFRaOBoEmwXKAlm+iEQGw8L9kg2vFm7K3v3qcWTcNsxLNs
	EEHB69UmJib3e4uI7nJK3mHi3HGFAa2lfYJQ+rWzoaDgbktBCvUPyNfqc6r/nghPx4/p4RBtET7
	CinCdpiEycDwlHnaCDatiPD/Pi0uM/V7qfSSpz6/H7Qeztd/oSVUGPmGfrsbk2REICTSno68CUp
	DQ6sOfdREj68k7+Y0KXXaLEyxcjWRBC+HgVCgnKq5n4DxgoVRQ4PUY1tstusC2HUNnMb8hchrMq
	m4oy1NujJXOFeiWGGfxyoVhzKG1Wy8Hk7nA==
X-Received: by 2002:a05:7300:d508:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-304fa30cb81mr2563311eec.0.1780333224237; Mon, 01 Jun 2026
 10:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260530-nova-exports-v3-0-1202aa339ef7@nvidia.com> <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
In-Reply-To: <CANiq72kbzmLeFv58mkiKn+LvhCXmH5g7UsnTYTcVmJ6kyc+vLw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 19:00:10 +0200
X-Gm-Features: AVHnY4LIwUudBe8SRqAYvkFU4tYqnuQ9elbt4jHzXY4lB4fo93aHUJvNuPfUj8E
Message-ID: <CANiq72nAOpowra81qOHHCw6EVyWVTymDoL8xPdpjT=xc3eS5bQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] gpu: drm: nova: enable calling into nova-core
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 3:50=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> By the way, I think a `.gitignore` entry for the generated header is miss=
ing.

A few other notes:

  - The `exports` rule' `awk` filtering is stricter than the one we
normally use -- it is fine if you don't need `static`s etc., but I
will likely export `T|R|D|B` when I replace it, not just `T`.

  - Similarly, you don't use `EXPORT_SYMBOL_RUST_GPL` and the "dummy
symbol" is a function instead of the simple `int`. Is there a reason
for that? i.e. the ones you want to export are functions, but using
the global one (even defining `EXPORT_SYMBOL_RUST_GPL` the same way)
would reduce the divergence (so one less thing to think about later
when I replace it).

  - I noticed touching `nova-core` and then running a build twice will
only build `nova-drm.ko` the second time -- you may want to use
`--extern nova_core -L $(objtree)/...` like we do in `rust/Makefile`
instead of giving an explicit path to `--extern`.

I hope that helps!

Cheers,
Miguel
