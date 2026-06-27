Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C19313E31
	for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 12:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782563216; cv=pass; b=Do/zkgbkhaG2KSB/L+aepsEPSKU2ZO5p8wfqiWTPbEdh81QVPkbr0EQKt1c60ZG2+5MEKZ1MAcFyXbWwOs7pCnTXHo9wbpgdR0+V3Jw0p3YjYzjVZUHvJr7sKIFBktZIEwvQIv4/KRcTVcmVYRv/Jgr/ZeIOj0EnwMEFZoMMIvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782563216; c=relaxed/simple;
	bh=tiA1M5jTZ3Y/iPMgDja4ldkoTBXhRz6JYbn7HUdPCGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fouwQ/sk9UqUE6rtjvrZC9S1uUt9G/z540ddKz5YSwrBsTestyrpT7FDqa9DZ31/D1gb4QYQm3qsFssvZJEuZmfPlIlMAcyy844BUUsk2R3fiUOWZkhZDdH8pP0ziJLLQtPnGkexU/938f5fINO6xU8Ts7ldfuYaK8qId2FTG0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmpoErAV; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmpoErAV"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bb87c90deso224662eec.3
        for <nova-gpu@lists.linux.dev>; Sat, 27 Jun 2026 05:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782563214; cv=none;
        d=google.com; s=arc-20260327;
        b=o/WTsTo4LWXAl3v6V/dgFVbi6kt6K4MUZfdAv0jLZa0Bt0DLnzHJkd2PDWdy4sISJA
         j1XFJsGwfpLhifaXyzJg+vHmiDI8t5qVZeulSQs1Sd/Qd9cYkzdaCdm0GEL5n+eHeqgq
         fIq7AJoQDLM6enHu3yjZDGlon77P5QoMgLKCxoGbYKC47HLYRl029l19eUjfDR8bvfGl
         zEYLbKc3jIpiPhpqqhWBsNM/P4JE1CIgrZCB8b64wD/oehvIye1vOF0xU/njR1r4Ozq+
         T/wOalRdX4/C559v5atfraBanNThwB+ffltn+mPuNWGh282rcTR7u7UcC/y28tv5LW8H
         8AhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        fh=l5uf/494oIp2lXlq1mtdTNqnsb9kFt7jQLBIdEEuSD4=;
        b=lW5dOgFQmlS54+VIGcvTi6YbIkxByaM1pfOxxxBL/rC+E0l1GQIYCi1go6gvk2rnFp
         lXACLuAN4kyPtDq3nBNWyC2xsOxcBsoPHE5gHKnDacQXk34Mhx/MizRppVwR+nZWoOJ8
         vGjmHWLgwFPlvBN6WCGNIc2ohWW66OCbfcI27eP4mDZOhhxk/0FPy4lStxybYg1sW3Ay
         vxdWsa0P36m4kItPGhfCTapTYQ63abVE0ogPDey0NuzbZj0GHpA69HTBOrehv2LZjOWL
         alYTHMBgVoU8XiCGrxzEHQ3liEtlSlGTmYvlIqatIYU4y/3Yt17IxFDzuGVh0b07ALTl
         322w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563214; x=1783168014; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=OmpoErAVNDgVDAAX3uyYV1lbVXCd4apY4NOPx1WgD5pjABjtlbOyqgAGfSrT6DcYKq
         c8V4kilFBqXNHMrk8qAPM/u+3A7fGnEfdX22TmsO/3ReQc2oo/ZtN7zDZuct9mwJr4b4
         Rhql8RgUmq8iGxNF1y3ieKgB2+t/sTJXcYMZyqrPpLd3e4w4lf1x8e9WNEPPoaxrVRRw
         52ZphLRTDFa3SWtZ3UcIFkEEZhQ2MDZ1pOFMQTKHG96ayh132iKHSH9M1c355LS1fDx9
         7tZLNZ78C4zXXbRVytIrKTgKmlsbk/Tp8sW7fBs/JhLXj1Y76H0u6lB/L2oeOJbo3gOI
         ACgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563214; x=1783168014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FFA3P0ucfKK/nr2i/TjAG0TaOdJ/VCYkxmATJyLWDko=;
        b=hDjsWjmMMdxhldvWq+KeXROXujlE9y2WKCNJCQ24NqXyv/97foIB75TCCoSocolNRW
         U5lp03gtFjEwzhSOmltuRs8i/Ki9Ylv4slHC5RAV8QrWWXUKpnaxuit0H0N32pA7ILFH
         KCXH3lRiByA5CeMwrpgY8jjhbIg7NdDtOEs6xSptGVpsM+Z0bG7Yny6W1JyyC3eCX8Oa
         Iht3E1r+tLDti3ZEIryon0WeHl029wuWeEFZgRw7ixgX1iQd48psA7eCWc2d+VS4kQQT
         zhwowFN8ofcTg5jM4X1w/URbiWiTprL98RulTTKcq4+C3l7nZcQhnlG2nfimVLDYaUtw
         9o3A==
X-Forwarded-Encrypted: i=1; AHgh+RqaqqzGICcy0yfF6pbD3NYEYQdJnY+IJaBJ1U4H1DAoVMk8RDHjoCitWn3JBh9JvEAHSrepgTfp6w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0767e4sapzt176kjiIrIjEHESZzDblsnrMLpHIw1xx7q9AfVN
	p3Hfb54CKDHnweAoO+WGaewOXqNiV4YX5Q1bhftAThSf2Uvy9mBsea91NNONGl2RqxHjtZ51qQA
	YGGYGdENfkH9bAqItdWBp37sKcFlIw0Y=
X-Gm-Gg: AfdE7cnOErlnvQXzs2Dp94TtFyBZ+mbUpKWoqo+ezqyP+zLVnVgvakWtp8kK4MuBxZ9
	KLyCEmb6ZBA08k3LyE4XGS/25YyXD6hkxs/c+3xJCR5nMBr1CD09wA8eRLXuaStV5JWwVIOLBpN
	0TyoWo4oLrdXGRt7A35RDTDOcvz7JMZLJA3AoOhn0/h/9QJjrpeDTN4KxQ3Epbe97YcucTmK/vG
	fdPyC0mwVI9wBAjFh1cbhUX+OmfPpcmuSwE+p5Yv2RLSR/hvW7ta48oQA3mMe5gFB4WYisVwNTd
	iwnRbmPJS3hvW4G8brjeae7WP6d6Nt9Y+GlneIgZj8M6A5WN210KjZ79w1i8Y0mx9JMVy72m5d/
	XNEt35ZX4zkbKMlboCEdoRUs=
X-Received: by 2002:a05:7301:608e:b0:30c:a4bb:71c9 with SMTP id
 5a478bee46e88-30ca4bb7593mr2120179eec.0.1782563213899; Sat, 27 Jun 2026
 05:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-3-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-3-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 14:26:40 +0200
X-Gm-Features: AVVi8CfTJDNVo1KxD-2qMWkEFrV45PAxG53CiKejEkAqP1d75q9UdnCynZyU0Y4
Message-ID: <CANiq72=0OOgc6NtbpF0Ysdk3ytRWCGGbWg00u0Le2AzQmKGKxg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] rust: types: introduce ForLt base trait for CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Add a new ForLt trait as a base for CovariantForLt:
>
>   - ForLt (non-unsafe): represents a type generic over a lifetime, with
>     no covariance guarantee.
>
>   - CovariantForLt (unsafe): becomes a subtrait of ForLt that
>     additionally proves the type is covariant over its lifetime
>     parameter, providing a safe cast_ref() method.
>
> This split allows non-covariant types (e.g. types behind a Mutex) to
> implement ForLt and participate in DevresLt / registration data patterns
> that use HRTB closures for sound access, without requiring a covariance
> proof that would fail to compile.
>
> Both macros share the UnsafeForLtImpl helper type, distinguished by
> a const generic N: ForLt! emits N =3D 0 (no covariance proof),
> CovariantForLt! emits N =3D 1 (with compile-time covariance proof).
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

If this goes in at the same time as the move (as I assume), then am I
understanding it right that if someone else was using `ForLt`
(trait/macro) things would either break at compile-time (which is OK)
or, in the covariant type case with no `cast_ref()`, it would build,
but someone could in principle have relied on `ForLt` providing the
covariance guarantee in unsafe code?

Acked-by: Miguel Ojeda <ojeda@kernel.org>

We could take the chance to add some missing intra-doc links, but I
can add a good first issue.

Thanks!

Cheers,
Miguel
