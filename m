Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53544345ED9
	for <nova-gpu@lists.linux.dev>; Tue, 28 Jul 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267028; cv=pass; b=YcpYByA6/2A6ovqgNv8C2IGsbPVStD3y6EAZUpept2GQ6KQrxfk4z225vLyJqkjMvjsd6MX8Hqo0JxHA9cQXoW1sZIr2LXCVRSBjgxDudi2o9S32iXiEnosehItISr7uF3qMml3cf4dEO8q6XVi9Us3YnnDuxCMt85RjY2bsFwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267028; c=relaxed/simple;
	bh=OuZdxdtD2MuuyArmy960J2u4SzK0kRJyCn9E2H22tnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2b7J9VT9vRfHVj0RoaEAOYK6wMN5VR1gE5XBWg5aEmZepaG7ZtiyE7U5CbZWEwt8nr1TXLo+lQ5NDyDuD+Sw3LBevWtxGw+D8gtETDkKNs3J3ZqhFnuaQPXNmgYoTguuNRFHb25ORY6oN2JIcJ7E8vW9Kri8bXq3IcGLxIV/9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvEbomJt; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvEbomJt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad68425a7so276385ad.1
        for <nova-gpu@lists.linux.dev>; Tue, 28 Jul 2026 12:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785267027; cv=none;
        d=google.com; s=arc-20260327;
        b=UOo141HfU0pn82OidfmMDuZxzMEXlByG8Dpd0APDw5WaMrKEiIh9BatcAALOqcWX7f
         KDEkRfBRSWnrBErni1hYYfcNihF0NfpVXR+gk3MOYw9F9aKkqu/F9PY47ZZwaNH8h0YU
         ItRRZDbvxJjkoexUsdw4qORnC0P4AB6EEp+KgSiQQBwCT71O8z36//TtCFjw5eFSn6NR
         eiBgos0wUXymv3tQpQW3zD7z/UOv80Nb6Y+gwwkrex2EgGCPSKDr8ek93X2WVtidSXne
         /9PIOJegeionNI9yklo66rVy5Hq92Eumftg2FNEXW8iIFjtKopXCS9RzLPd45L2DSmor
         X57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        fh=E1idJQk9veg4PdBACPR7pP7xbVdzlFC7ArRjmAyt+XM=;
        b=eHzL5eWyvEBqbriHv9SqjZc5wLvgBsKYBq+3K+Dhw/aE4vuScF3bEVYZT07bUplghH
         fqprL9M6uElVcngM8Yyhnr8/UXn6vPu0FljFSCpdXMlcfCrnb+ZA/So8zCalLRWhkv/R
         38wu2M1cqxrnvl+xBUZaEHxmD4VvHRjF/x3jX2OYVdyvbx4+RrIjXHx/EvRftb7G4+dz
         dJInVw88iZJbLoP5dNl4rTzPtR5t4WrurrotIiCOaqtgLDIYNvZw3HxV2MK4uRWInGf4
         lMJmxLgt1k4HNCF9RRpJtUoYfHWgb4oFpiwhTzkmymLBhf0ymPEXM7iEBch0RXDxWVfy
         8OOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267027; x=1785871827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=dvEbomJtsEFobSvoadMqGkawZNDz7xZZjDhGZ1S+rUWLMaOrFc81MdOBn6RtWi9H1D
         M6ReQ4RnznPZ79ZSBKgZcO6NSnjjYoBo5N4ScPi19KoNMpML0ZvviybFQvc4cJRRexYb
         7Lr6tdzSauey2F2JE/1BuIt2MEeTqjhI9bufJzJPTNqyax4bZT9mPTUOl9idnmR7HF8c
         W3aNEvbZcJXzDqJeMyIpanAw0dD5+/Lzuflze02em0RWZTApWuasBxd8rR7kFOQEbfZD
         JtXi/LtcFOb2lXBt+s5ZhroSEt76OzxgFiTUQMNJae7gb+lcTZEr+OzHvUSnMQ0yu7Lr
         +OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267027; x=1785871827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=IfujkhNS6qS8QELX71Bfi2NSwBHYqc73JkHEpPX735GhcDyg2EyFwpOo88n4mArUZA
         9cdT6gcZcyY8xD/rCEu3TuHQqKPgeS1WmUZbe+wwrZ/RS31wEEi5RPsXFEv3M8yZNomo
         5fuoIR90IbamiCQUEVx8JgE+jMHugcw6Izf/OH1axuEpT56E+j2ExQw5AViqfWTUK0JY
         Y1DxHXuOopDz3d4yCNyPUnNmWgsOAfUgq6V0TywU5YbJX9IX7LwGPA5SMMhxHhR6J8tq
         17o8HjNXPhvkBlgXte95i4H2bANBxuyfQu8NXfbz2u2pSKVY0Ki2+jlfw65qpeKnKhLq
         kBqA==
X-Forwarded-Encrypted: i=1; AHgh+RqoiEFIVbSrFpaJoKtN/9x2kaK8lHR21b8MsNltbXGN7tgJQr0bhkILiLIzatDsWweolUTUaAo2Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXFNpJs40wkjvgpO6qOJg8je4atRJJpmERpVhWLL625GygwrMM
	YjMyShCCsUihSOVIiuhWfwomHNGplgMDKMzdjgyzs6ERGuJYLsitJU0F+9ZYMHesDr3o3BYqfXA
	bAW1dyuB5QUXofvydNokuxSLh/1mT2rM=
X-Gm-Gg: AR+sD13DlMSpbtjiN9/cIIxxjAsnpxBqNFXoPe7ojlmnnW8k3czekfRy2mARNmJOjO/
	Rbsx70/ZGNXDYlYvKDn5M91ac9qBt4O75f8XFmuH0tzY6iS3uEpMAwl+ZRIRkRImz8DdJvoXFaa
	3SR9mn7zKozd3uv19ODSjrNs1FuWqFW8ycvGe9RifnAfsTP9cXHBqZ0cKjHPGB67vgquFMWBIB4
	6/uAGU5eBRxDNN0cJJ/eQfTi/98DzcNMlFhbvHLayGuCYiu6YZcPldzgDQIMfUCuD9mXZ/SSGkJ
	A22yIjyyyzydKk2dG2Pn/r8Sy/Q8r7hM2+8osXwOMqhAE04LVKzsd68Atkpn+6BUt9uRUDghzdz
	An1HtXWOKnjaWhEc8WByT2c9tlCimQoBtR/pVPHkPNJFvEiKH5XTl0GKomMRK
X-Received: by 2002:a17:902:e88c:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d0157877cfmr34510465ad.0.1785267026639; Tue, 28 Jul 2026
 12:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-typed_register-v1-0-452d72b60262@garyguo.net>
 <20260721-typed_register-v1-8-452d72b60262@garyguo.net> <DKA02Y5RE1YJ.2FGI97Z60X96R@nvidia.com>
 <DKA4Q5QUBUXM.1K6QS2QPXT12H@garyguo.net> <DKAASRCK3M06.G9XODK0T5AAK@nvidia.com>
 <DKAD64Q7CEQD.Z15OS6MRHEKE@kernel.org> <DKAEZ4LDA10F.1RFA9JKBGY2CF@garyguo.net>
 <DKAFMD8X5LFP.UPKPHK5FYZPH@kernel.org> <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
In-Reply-To: <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jul 2026 21:30:14 +0200
X-Gm-Features: AUfX_my7ge7MYUh2zUi3Gt3zgCDTbiWd0Gi_L5P50g4KhlbsBg8SdJA5xeWd3II
Message-ID: <CANiq72kqRh=ucvE8ibPmesyrWdLnwbOwcsmTx2A0iD34DdUsVA@mail.gmail.com>
Subject: Re: [PATCH 08/10] gpu: nova-core: use projection for PFALCON and
 PFALCON2 registers
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It'd be a compiler bug if const folding is expected to happen, the whole
> BUILD_BUG_ON depends on it working.
>
> `build_assert!` is a useful tool that I'm not giving up. If there is a ne=
ed to
> use it, then I'd use it compared to having two variants to do the same th=
ing
> with different syntax.

Yeah, and on this topic, the overall concept is being discussed in the
C standard committee due to paper:

  N3846 2026/03/10 Grant, compile_assert =E2=80=93 optimization-enforced
conditions at compile time
  https://www.open-std.org/jtc1/sc22/WG14/www/docs/n3846.pdf

I gave the author some feedback on the prior art in Linux (at least
since 2002, originally using the linker approach) and GCC (adding the
compiler attribute in 2007 from what I could see), including our Rust
macro too, starting in 2022.

Hopefully the discussion will continue -- the thread was active up to
a few days ago.

Cheers,
Miguel
