Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795773334;
	b=V88VAt1QHTH3QW8LUNGoPnkMhCJCEe0y+eamzvQYOYOYTxZaM71T/UlJ/1LmccGhbtSD
	 Y2Db93yubAd9UBpkL5RDtiASQhGBlpPIyJkUj3XWAZhGz3idqHTGKG4PdRV+tt8/TQ+4a
	 0qUm8yLNCvmikL2EWd8eR4Yh47KEiPQU0FwOv92zyNO9qBJ6OyzftGUkDaM3WoCYjDsry
	 srmhmAEUxpJlQLTJqNdVmDGtAYONsBXgOsaKnocS6j/nnlNG2ps0lav9svSXuaPypzawh
	 TMmUpDFWUY/QxH3EMKvX1WOV45Yggq1CijgHRpnBNLgS+/n1NBvr+kRWnQ8al9gzc9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
	b=20LYa1ovf9AyUjePQJn8SiyTsNlh2orWcFnUCVhUiMSaMHvYg00sRmXQuZQdJ28ufdoV
	 1HKikFLotJiCIqC3ogF4FVUpzJjH2WE0zNVqnHY5WAUXASCb+3Gk8BTzkYzNj2sq2AM7L
	 bsbE6+eLfH2X3nmJEDeqss2Tsp10PR3L7bjF1def7g9LbEBuJnySblR/T02C+ZKlu8SVT
	 vOUJxWPg3WQT8jYf1MY2kyFr0ikpKiOx74eu6wDJxK/UEQgz+inJ/r6zvcieK77p5zm6y
	 4KZgYnJS/zOPH7oO7F6N6G6sq5w7CpFxof5Sf4b8WZT5k1fIBS/iXQjvoB1Y5GQDrhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MGdnrnQS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF884606A680
	for <nova-gpu@lists.linux.dev>; Fri, 27 Nov 2026 09:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF884606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MGdnrnQS
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so4155333f8f.0
        for <nova-gpu@lists.linux.dev>; Fri, 27 Nov 2026 01:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795773327; cv=none;
        d=google.com; s=arc-20260327;
        b=hy1Jfb1nqG3uZIW7QhrbZzKqJkz+iaW6eqAtFqhegxizLlAqXQBS+/Zndg4ujcSbG3
         5rB5r/oRT+e+kD8GUlF/AjKmRyNtpxrEvYDNlEfEYYEjdU8Qa5iRPL9Y8wPaJDviBNcX
         buWIUBLQ2IqL0u6Xvwg5Jf2KnW4e1zNxfTThOyu1LFQP8m0qHgUJCDTUEDJO59i8Rft1
         PQyZI7QkPs6fh/NrNNLfzO5DOx8jC4WJ1oDgxRgbvIuQ27rM2IGnxOFeWdxUGnYiHlCp
         6dWDZqRYd+xwkxpiyMTHJdV3oLUeJO7SfITzRH9nu99iz/vAXuC7aa8x650VpvOf4eWy
         Foqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        fh=ca0APDSBP/y+6SwJ7FOzzoUc7P/2Aw0nk1yxQ6TmEcU=;
        b=ZKoEkabAMjF6SLS8QykzvIoNodZr7sZSx4f3X52+zucv1VohGGN6WoWsnPjUhpk9Ga
         04NjVgfvylNw1tKsFVB2kSJ8O8yZQthxuJfDo1J38zfab0TuGzpjxT6ELG3MQBHoyD5R
         powQwwuyWZBHpJtgKdjfTSzIARhhzX8Mptr5gQAn53QEErtYCuiP2Hwepvh42m2iUNg2
         3QkOy5AKfC+2GQhzLuVSRv0lGC9wS1Bwg/97aDEWxBPKnfick3GErcoB9PUD6JcWR3Ft
         RgEEGhpfb3MxZKt/T/hNUrIDAr7URjvY3OFDZWlHBY081BaxF41S0uga1OAJ4wBD2ITt
         mm+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795773327; x=1796378127; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=MGdnrnQSsK1Sf+04zqoYvDg8IVa+mzxIyLTz2FSN7XDJdBjGxbLQ0sPBNVUt6utsVv
         4mlMQXA884t7xFa+TgPiNTnAdPOrJpZInoAPtq8BaIJjN/cI9UKY9uDzOQv6+sxxQkFP
         o85W2gEDC+teCnDlHucA76P6ymiQupZE1sVBeiF6K65HEwHcYu0H2RZkERXFIG09nzg+
         ONt9R2CCtVYAZHrrAPLh8WLpHl9pjZLKfrYiFXIeZ1/5CONIQlvAvtww5KRaP6YCTkzJ
         /6T2AmvWbWT0SephWhTCjJmnc6we8h8Vvf5U+YRow0DhGoGGoPXoN4TzwcQP2U3e4naz
         BZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773327; x=1796378127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vpy+L8ilFk/xVj47uBuvADr4xljwNe7U/d1k7VvtaJ8=;
        b=stNtjvxCy2ho315cid7xcepJtoaNY6nI2C4baghhFc6fer2eDH++GLztoJRxYmv7iU
         1JTGdZsS6z/oXYze4/HM4mdhr+SvHEqdoLiCEt3QTQObyJFJQ47MJ+5+2Live6YQ4F+A
         b4EynilfbllOs0AkmasngF7BfJ91it6yACxRjWbAoOQmmQZOvpX1e/KakQFujdd/HJx3
         y0ay2JBCXXG8k+vij3rp8KPe2WN5KT2dO7qCAfKpM/e6VHRTk6ARS4BPdu7JPkoARlPF
         MP+2VH62gvYU2r+ovm7QOrlYgx5dm9WHSyYKSue3MQVohl9HR6EoyubED/Irjyq86euH
         waVg==
X-Forwarded-Encrypted: i=1; AL+hErH6a0t4cl1+z95zVX2+liNolfLSAezKaSFGGGeznLySyh16DEJYfv7gxon6Fbq+IyOFXhPfCPMpQg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8Ft2u1JwFQKMqs1j8F7emYnbBiS+NCBEMHVMRyeFDomjUA4+K7
	Kof3eIYZe4oU+3mJ2s4fJZLrAEAVJjgbSwvDeTJHyY9VOEbaQ48a1B8yPBUeELJXP3kgGKwNHOF
	pQFV4LapA0PQc052L5zAYbaYE3J/KsTC0fBPeoYQT
X-Gm-Gg: AZFdTZciuJFtbwr+/4tVG6C9SHkzdsMKvMxj2wTNuGF3RJQ06Jdgtn/nAlG9CP4CitO
	6jSC5Hg+o2kNnzfeYmOUC/TydhDu9sXZ5oImrhgTLMpKK7TpSWxUZNECjbCuNTto9LAqb0Tc+93
	uh4crAuc/AUuHdNtKBxmGmQKtNZ9gNXmhAWAQ/H9mvSvZxvo/KjSIp9bAMaQ46qjdElJZshKqa2
	1K8E3ekNawKB4ddbm8/BNdiuqaT25iTneCNJgaLWuZyW7wsPB3nvWZ7LxWCf05Oe5A/qSPYfhNp
	1jzxFhlpgDb9cDhuxG3wPyqAFTTi74KMtt1B+4QuEidw9O/DYOH5jqawhyZRQED1koxeXGaNErq
	0PRXTpcHrauGBHFfPkvC04QIkGgYJpe4MUL0+i64IPKFMsgof+M4WPGybdG2e2ZlmWsaOxM7miQ
	riUdEkthKJD8ku9eS4/3v6VWqDfzxdc9pgunooXACmPhLq
X-Received: by 2002:a5d:588b:0:b0:48e:66d0:664c with SMTP id
 ffacd0b85a97d-4abaf64be12mr50144469f8f.15.1795773326393; Fri, 27 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
 <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
 <awXA70GWssuU991c@google.com> <20261125113846.GB372978@robin.jannau.net>
In-Reply-To: <20261125113846.GB372978@robin.jannau.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 27 Nov 2026 09:55:14 +0000
X-Gm-Features: Aa3M54oiZNSDgmAEoH9NzLLBRhpgjBRE2cJGZY4MeBf6M2cJPAdsD-3P1zcRduo
Message-ID: <CAH5fLggRtEUopYT0ZacNvczLRTNk4sKDrE7q-isgW=MDn4mqMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
To: Janne Grunau <j@jannau.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	nova-gpu@lists.linux.dev, stable+noautosel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 11:38=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> On Tue, Nov 24, 2026 at 04:53:03PM +0000, Alice Ryhl wrote:
> > On Tue, Nov 24, 2026 at 12:37:45PM +0100, Janne Grunau wrote:
> > > +        // SAFETY: The DRM shmem helper only invokes this callback f=
or a registered DRM device of
> > > +        // type `T::Driver`, which is `Self`'s driver per the `Alloc=
Impl` impl below.
> > > +        let dev: &Device<T::Driver> =3D unsafe { Device::from_raw(ra=
w_dev) };
> >
> > `drm::Driver` in `rust/kernel/drm/driver.rs` currently declares:
> >
> >     type Object: AllocImpl;
> >
> > without any constraint that `T::Object::Driver =3D T`. I think we shoul=
d
> > introduce one similar to how Driver::File constrains this?
>
> so changing it to `type Object: AllocImpl<Driver =3D Self>;`?

Yeah that's what I meant.

> I think it's hard to get that accidentally wrong but since the change
> relies on that constraint and we can express it sure.
>
> I added it locally for v3 but feel free to make that change before
> pushing this series to drm-rust-next if there is nothing else that
> warrants a v3.

I'm ok with adding it on apply if there's nothing else.

Alice
