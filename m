Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFF03F12C5
	for <nova-gpu@lists.linux.dev>; Wed,  8 Jul 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524332; cv=pass; b=frlH+A27JfEHjvzO81a3M/3ROlkdT4TLIaGrFJaTkPpyAmVYNA9c9D/gEDR9uD8bQgei8yZFdpYjIlBXRs7hSvVfPkt8niwzttPE3xcOsq7Ol+42fD3zIG3JspkY8lrJsKjkiItUvlRFL4WlWxoW3DIHZ/8kXvVEmOVBFwno29w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524332; c=relaxed/simple;
	bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwzwXFL+ETchwqYujIlrCXykRxNmb/sJ6pvnqFJ8PAlqi/yMjL2BUaF0hNBQP2i7Z6JcED4kMyw4cKZ3BikxXaG1cRgGZse8SwyMbMR77Sx0upAgHD0wGsFmVkWe2SNVkERgYDsIUJpBbQwA1/kMfp/8DeQ2HotvR+3Erl9Dx0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLTAFuzd; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLTAFuzd"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b173eed2bso1414931fa.0
        for <nova-gpu@lists.linux.dev>; Wed, 08 Jul 2026 08:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524329; cv=none;
        d=google.com; s=arc-20260327;
        b=sFI/zT69+MfDsWNegBR0nMprSyPBFNo8Lsj2lWciRBYGvTgXsmrfpL2M5yeXSXjIjk
         wmcbme8NChvi/E13UdyHrJGfxXSBztsDnVrVS5NnTQj/zuJZb/SW7uK4tUQKtlYV1dnS
         wQ/2y++fUryfMJsDJ+J9zvVdQtnB2t28GxupD20l6TdLGdK5pF9OCrM87xFF5nfP4eJc
         ekSZ1vYOCuNKAACwhLonn/iWyWi80xExfp9IDHCUpyqV0CBZVYZIMazPUINKPd9I/SKb
         bFBOg7mj15RTcbm5prRfxNS60WRsHRPvRV2zzKoDMVdlTm/kkGiG6LgjpR5zDu6aUXVn
         IsNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        fh=eUGsDE85jnVt4hFduns/eWbjmrYmF8axYIxNjWRITQ0=;
        b=Tjxf6kcaG+Vl8aazlyyk8wXU8DStJLVqUITKUjv6KUcCvYWFkgx7m9SshtY77tWizu
         +sjwLCfEnPa62+SiEt9S9HS9mgKCAKGGm9LGmBzSlr8w8fP/Ik4GiLPp0inKmpcLIYIK
         wyxtwwk27vM9UHMYg0Qq8lioPozM/ILwWDTw4B2n/3AwzOy7GppE/kLera+7OsgCwuGq
         kzSBuQG1z25GC0HPqsqs2cHHLldrGt/+Wz+JC1DMUVE0ul//siW0mE9ZaUERb/MT3RYp
         2VcYanW7aqcqznKKbVku85xqee+J84X9bGFgo3mQ1XeNevn06ZhGy4usuW+MNmlZuRn1
         a0lg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524329; x=1784129129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=YLTAFuzdEqBzBPuVAaLB6lP34iImFbn3iM0K5ywXRWut2vASFdaP0BQb0IZIQSKUpJ
         LNa9SI4oCTH2y3BuhiOZU6r2xWtt5B9+DZd7QluC/wzta6EYi25uaWXNWrS8xNCP2DbZ
         hYTAIZumxx5QBqHdkI7UDB8zsqvrx4xClBlOgp6PZXf4DDjZhH018zHnMVHjc3gdphKz
         FFlLAPTa4qqAMxH0SQBZ/HuN74FcLIsTB12rbr2PNshs99dZ7LGoQl00gwEBtX2tfAHH
         2zi5ROvReGDaBCpe8bNaLxDodZKP9kXHo+SsjzjC6oHGDtcD6XkNHOETFsjIL39ZBr1K
         +zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524329; x=1784129129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=Mjmw9ASjVBxLYYBGXemxejFBACq4V6I4158RHniUEZef/36cBMD60R9V/Fu5g1RXYz
         X5DrpVIR/4QIGSR5kmtZnTe8y+JK2bQa61Lo0JhDkwVLGPyEKMzJH2zg1Ws4bON5y4ZG
         MXxr7IOR120O4KlTwjyz3Kf/HmtsYVEWhWhtYV7jm/Ln5GYqgNN3HlagzlwqXV4xk+xk
         skthEr1kNsk+w9GSbp1+X5RJnw5/fvPrUwmSXzp/kkYbfpE0g7d1gqY3lpNMBsPLZ06I
         7HFHE9roPyqbj2jxLMALV0zS4NrS579NG74d0asCWU1z57I3Na8EMktjm6ZsQfX14gI5
         4H0A==
X-Forwarded-Encrypted: i=1; AHgh+RqOfGgzAlALlucvFtTy/MXvYmhSXeLo5/pRs93mjaBuGQCmoH/uvQaY0i8vhenjaFvt8qbkAE/JNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8a8bgn7k/Frk4g2gEyscJpzcJAH9oLTBoX9k3bfU4hM52Cl26
	1bykSLmjF0BAQZFQTaAQKY8t+vj+2FlOWhKyrvMPMLlCthcx5qa5ijNo/RRblf+sWDlSW6NjLHj
	8H/RN/XUUjWYtTbScXgo8OYGpauuAK5A=
X-Gm-Gg: AfdE7cn47mz15OuW06znSVlzXj7/vr3iUosbTuqm0X59UtIezaVzwauidLK70NE/evk
	d0xYR6w2Zc/UvuaYc0ixb2xc/BriAdazuTdfg46cbn8b5YS++ZwL7wxbnNZGHuogrEmRCIrtKsL
	a/y69nSDjzl8IX9mo+xZFwuldiqawrjQBe5PHI0plgrauVpCdg4Cdxl1f2YV6i+y99EpCG/TrOS
	8x9Wig3ptToEg+b0OV8kmJdO0CyVtUjqK4dQ5Vb8fNxehQ9uXxbQFcdomA8pZByGKr0PireiBWp
	DUjS4aWx+CRpjjjkgHzf1YVFJ5XnxhX73OwTD2Losa9twoX24Bz7yS3EZ+NDqLub8SjFCNBTBLv
	bTIqD5MVs+4B6
X-Received: by 2002:a05:6512:3987:b0:5ae:b9b3:9f96 with SMTP id
 2adb3069b0e04-5b0115c01f7mr445459e87.6.1783524328462; Wed, 08 Jul 2026
 08:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-9-72cd5d055d54@garyguo.net> <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
In-Reply-To: <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 17:25:11 +0200
X-Gm-Features: AUfX_my_GxC4KLJmz5i_4DX9QExeJawd6XQyKpw76D3pBDNdQQvLPjQ9qPUqEYs
Message-ID: <CANiq72nyEK7cMphaawV73bN7VmAKG-UOE4SPDWDpAqoLs8zzKQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] rust: io: use view types instead of addresses
 for `Io`
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
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
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:37=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> You mean to avoid that cryptic =E2=80=9Crust_build_error=E2=80=9D when th=
e assertion fails?

My reading is that it avoids the assertion failure itself -- if the
compiler decided not to inline, then it would fail to build when it
should have succeeded.

i.e. it is not about improving the error message, but about avoiding
the error to begin with (not sure which one you meant of the two,
though).

Cheers,
Miguel
