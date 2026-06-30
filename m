Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBA9416CF3
	for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 13:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824541; cv=pass; b=ghiXQyj41CA8ihYigH9ed5pJZUmQm3SAxrFIYUGGzNOsnbtbgDZvCjXyoa3tkq8Vyu9+S2W/DxHV49xcR0/GRtfHV4qPgyQQ+dNPI33YXpwtpCu2cl00wB4ubJe7zRbpXVlHY+bNn7XMmw909ho+iCZfhqhYaWfzc3z3fI0hVmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824541; c=relaxed/simple;
	bh=zVGN+irJoRn6fLQWlrqbDrVdpoX5ulyKwx3V8NzpaKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHQZwN2IuwEBafYy32I0d4orh/3787fBucjh52JSGplWlWnycSY8QRDuT7tSAmS3XP38oBBvkImQJ/+wRC8Sgf8X1irYkeJwH2NyeM2c4+plUG4kxfw+Xlo3sbredGx+76HlmoDQrVn+CdS7neZ8YTPVt8ItxePRYgcN9PSP0LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eqrhI+Dv; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eqrhI+Dv"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30ecc2e02e7so154767eec.2
        for <nova-gpu@lists.linux.dev>; Tue, 30 Jun 2026 06:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782824540; cv=none;
        d=google.com; s=arc-20260327;
        b=R5ndW92OvVo2at4wG1p/kBA8EHfd1ZVofX9+aeLuh20UayFrAUZ2pnNHtIHnMR80u/
         cvX+bKDZ3opWs+31IENqpxjtYROeCHaqx/1sbONpe5DgzlHfkQb5tKxoQZ4a9V2tfac9
         l/BF53mw1/uMj7tVo21HWuxA3kHPGOwGPcAMwQgZXP9uGV8mtlZ+gfWY3FFMRDMv//nw
         whj7FSO3Vn7LuE5ct7E+agLQftGMReO2OylNil1/FnF5P5Eqh/fgjEc1RaWse5GPWrXp
         vWZZ5R04vzTbFuAiweyBDd870kgyhTg5xkyKkg5hxsfxjVsMA4ZL7dNQLLRp2Wnpj+PP
         fNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        fh=MmwCARXcaSC81VT9k9DmpcGhKN/+7oRBjm1ugXFx8K4=;
        b=BtYokW2YD1wzVcYDOBb2XvgrilzTNdsL2zNa0InNk71r3s8D5kFvhqU5P3FH5JoQs/
         Oq/POFVVTPYf8eBkvMvAYszuve4lnKKPN4C0OTpf9lb1rZ1I7ygd3mJscVTJTMCYtIXa
         7oaKgSuY7zNY3OIhEqFAftUdiI7aM3fgclvXvvcOC0uhBK9nkmfj7P78GR4MMYtWg8PY
         HnqAFqVDgwoUOxWhFuNnUZ0SublAIx4wfrPTHlWhAuIQ1UvKibX5HLO4l92VeFa/urK8
         3EYEnynOaNaECy/A6Vxq92BrYe/XHRquV62h1WjbXja3o70SBXZeMTeX63zYFpSqxJTB
         v0gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824540; x=1783429340; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=eqrhI+Dv60+DTmx7l89ov0yXNRSjVNPMS7tO/WshGer7M2EXVi2R+2wkpa5vTHtde5
         SLz8WFR8jZeutjvCu+owqQq5cY1UIb6sfBQE1uPmYuLJOhtdk6PPmQ4+KC+IdNBpA4E+
         WPX8bUi3Qe7uJSojXNGI2Pm9sAJmo+C71dE2TFEMFFWDrkNiBplPm0t3uq+OTA928DAP
         8dEh+f3U/slX8I/cPkxd7LWVfe7Ys23HrwqQjZTNH9SvBLgPAOzFia1IUZI0+tM1X5Zl
         YV5ED2r7oKvSH2Xxst7bxYQytN+GLtKEhrtdNwjOWUVmcFaTQHlOCGnMN5svu6KTlmB1
         sykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824540; x=1783429340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32JdvvqJTtjWcr4BtrKwmZqPpf2cS3llz4s7uLQdovU=;
        b=QQgDUzbkTNIgYd6NNYIPsuA2KBUR8CgPNS68z3R4LBpFJAU0AtVazjsq+gm6zFCm4o
         i8sXYSJNLdQJG7HElmkaDTZl7c9VmSbzwx0Psq+RnuymT1fYg9d+ajIpg1FkL0VC6/TE
         YmETd9utoHiXkwoTMCfAN7p8o6k64hGSIJPRkFLoftVMFhglmmtxhMtBFuRpugbfM8Bh
         mx9ESdNLf49aK8lX/NqWrMKgla3bS0fHutDvUM17v8OjDg6nmUXqH7mP1TFQUiszjc/c
         sxQ7XzMH91FhQHTBdcGvqHiA/LePsoT03xj15dDBkgz3LZQSd7rUpCCl7O6DT89ueu3R
         76sg==
X-Forwarded-Encrypted: i=1; AHgh+RommH2N/JInAZb3FlUHqAAxq2JmU3v/+rSJVNTaWrhaEJ4Il5oJua5rC7NyIfXuvMjVu0OYTWiOFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJN66TMY0wjpQzJaQWyoWXZgxRCsCY6dXMtp2WOOPH2DuiBqEJ
	ukmhlFWlepe8GGyT6tQRPtPlqyqYHZ2Xd1FZUQiuPQhra11NOUgOPCL8tmI0IxMSjYf/BXVvFch
	DWQrek2Y+o5SiBiWFq9umSTa/yDLiXeE=
X-Gm-Gg: AfdE7clSYF/fGEVrfB9k6+QXPu3Lb5jZ5Rpn2TGhle2BMF41bngOt4zh3cd3hBdZJD3
	w35XDaec4RO4n2/O/iIz90LKEAydhUnK05ddyqLBbv6IrLx4u/dmtKabNtDzDcmZ19stLV1jQI3
	ICD/v74uarJSxoj2fUoZaj6uYOiRMmc2PlXH1priP2dGl6SDYVK4tN+yELAoeedDdZXbK3ICJvu
	sDwfOPJfuoLGlCTTUwrO9rypHr2R9b4Y/wmWDGxS09GwHZVcS//g/VZ6HxvgZz+esdb2ATstdnF
	+rP+6hxHrummIZuBMSkkWq2Fh8cIcj4RyKrFoybvlBtXJYy1eZK0KTyXSHEnuC2VDylzx+qUdFg
	lr6UbcwX8/IJu
X-Received: by 2002:a05:7300:fd13:b0:30e:b3e5:cc43 with SMTP id
 5a478bee46e88-30ee13cd8b8mr1307107eec.4.1782824538764; Tue, 30 Jun 2026
 06:02:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-io_projection-v5-0-d0961471ae50@garyguo.net>
 <DJL2T5XDC53F.3C2QC5L1V2H6@kernel.org> <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
In-Reply-To: <DJLLHI7FIYM0.2YB1QJ6TB8R6T@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 30 Jun 2026 15:02:06 +0200
X-Gm-Features: AVVi8CdlaW0HC3qcToqh7v3q0JT2Ai7s9vfzaVZXIxvGTDn0q6fiJzf_f2XS20c
Message-ID: <CANiq72==81FEfMxTnUCdrFBtj9fnCnhF6jXgx_eqE-VsLgW9Rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/20] rust: I/O type generalization and projection
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Laura Nao <laura.nao@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 4:15=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Hmm, this looks like a false positive introduced in new version of rustdo=
c.
> I didn't get this with rustdoc 1.85, but do get it in latest rustc, howev=
er the
> generated link is correct despite the warning.
>
> This pattern is used by other code, I'm unsure why it doesn't trigger the=
re.
> Anyhow, the following diff seems to be able to work around the issue.

It seems to me that the issue is this line at the end:

  /// [`include/linux/iosys-map.h`](srctree/include/linux/iosys-map.h)

should have been:

  /// [`include/linux/iosys-map.h`]: srctree/include/linux/iosys-map.h

i.e. not a false positive.

Or do you mean something else?

Cheers,
Miguel
