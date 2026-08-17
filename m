Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D207B3BF692
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786999211; cv=pass; b=hlyYN9MXqk1goa8MpcORrKo8bHvf88GXSZWH/iTkgIvA9PJirX1goGPwB68hBZ48xPBnj1ckiW2+TddsqY+CM1f0+HllQdgq5XwGXDPCBOzofKrLCN/3k/QfJT8aeGJpuSzzUlzOPeddvoOEK2JkPg0yjjE6PGngypZ9cDG3aXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786999211; c=relaxed/simple;
	bh=/4ST/+IAuY33E7u8BsBn6YuaintaQycWaXrvTZVwPKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttz0o4OCmsMMTdOsZOU2LmlM/5fi7/LZxpIkJBexcmzW8izoYOFICAZTzRBvtAIVdriSSadcA8sbW5L3oJtGfOFVSB80rhhGK5P1T73yGQ4HreSZWm4BqfDwQLIMYcUsDPA9Utz9jfuw6EJ5hyiXDF5Ar/5/GHBuqP8cZkG+8vQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTQIXHiX; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTQIXHiX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3811f512167so5455492a91.3
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 13:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786999207; cv=none;
        d=google.com; s=arc-20260327;
        b=NDzMxsTPmERgq6jA05xDhecpYl/G4ZndkP37zvbh1yEUghsbj5VAPoJukLSRDkybBW
         GAf8oLiDa4/NWhS6m3RiIVl0BD+WNaFE66MOUcZycgz9zpmHE1tx2gjQ487NvIsSqzsJ
         r1DoKWAbsXHxMfQtsQfG1RhL0WRRhj+gO5/a5Snf5iZgkvPiuZwzOy36Ku++BAAslerz
         aARf2wzIixDDxRin5HBQLdyaI4LkQOzwDaoPNt+3jYKFX+IVJCZodTFcY+vupgaIeOv6
         WNlG/8fLXI+FXoF2fhXhk7LShtT/lwnSX/n2UdbvNDvkYsi/eTz3f1nrjj7nKk1Udkvk
         ctxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        fh=J4h8rHrmi5mLx+dWBX0dgljwM+SZR/XQ990TUDj2gWw=;
        b=NdcyS1u4ARvqhcKMRRlTPFvQzfajIM+ITufogIY7pXa2O3ogcmUkZgORux+s8eU6QE
         VE9U2UF+JMsQiTLsfnhcLC+dQIM0ZhIlu+s9Hd6SEVVnyvSJssNuvGuFdq0AV9gIZhAV
         ts8LG3y2dc4woLbidWl2RSRLud2VeQp48bjlZXa/ScY9pV/NDHZGWjaSFf8Xitf+4EtD
         X0RxMTcbx+XSgatGHgKX2l8wcRccMENVd2gLZPtvwX3bVUiJW6zRJJUP/BFX82zNSNCk
         DockfRBt4MwjqPqefzt05Btxw9NjS5eYqxTumxKArchpVSeS/30s4cqZn5eNTy/Ru7pF
         h4uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786999207; x=1787604007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        b=XTQIXHiXVjq6kTIo9AY3tR/fBEKdDU9JXuOUbvT2zZKaQVnESqdGwBsmhfuuGdtOFG
         s6GwHvIjJFLUVbsXRvN0PLCPJu6SCYmZmcjhNPfm3SO9J8aehrCOOS3yCZCOnwS7hn7/
         duiEJFSq8BDZFzoM8UhT9cvoe4Sw1u8ZTFqynCZPM/j6rSjZRtauzUHlR+KtSdfDgr4c
         YFaM4sHmEj7Bu81gydq9xs978j0GIRygzfQibDnnm87LMktNmDkKsBd3259aFZXwTguh
         cJlAbpGXwqzf1P9LNkDe17B3vPhC+P6DQYYj6mNCNd3AR9w/HsjTCFJh+NSxBK0SjBwW
         MolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786999207; x=1787604007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tJ3MqtcDmZdkhQroQUtoHRF7FRZVKalhzLPmlyTLoiA=;
        b=eQxCevsjAB+zx48uws3f/OFtwufBDsZ3cWpjv+7q34LcM5xa4YUKzDlWDqGY6P7Ofp
         IsKiXeKefEZBKqci1kARncWKv2VLXa2rt0+Pl3CR9+JR6mT5QcPDOyMWmOldBd5/XDCz
         X/sWuq2H4+qYeqSUwe1Q/UgMC5T3V0QH21KJJ8vd1oYYcZmtB222SujoGNB8RsYSS/w9
         YkC3+o0ey6H/GNgO2DwNV9iwAVEOuCzjrRkHHFLAoKhGO7zCDYLl/lTG99Wqyzwa6pJT
         o3Bd7Sya9k9DgXx0UC1gNrTEL1ZoWmIil7UC2Pvo7ndlUgyvpO/RQuSzFqM4NQx8pWR4
         RL6w==
X-Forwarded-Encrypted: i=1; AHgh+RroPRdyFBVTQxVAdfE6evI5eTAyNVHu/PvaM+10ePUxG+hgVzH/FJvmZkUAR8r6RehVF0U/MQu20A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzxNVPMIqf0ugyWrYWfV5UyzjVnquqW8CrvR80thrhu1Sal2jfB
	+GagRZYF8qtJGNwsadRDJ6ZH4wQRBt1jRUL93B1o/oOp72bWYxlTbGJaeBArNHdedlFSKfGm+Tf
	gTBeb90mfqndR5Lwtk4VWF9/QhtCFQxQ=
X-Gm-Gg: AR+sD11O9OFkuqDi80DVRDalXG2qBtt7Z8doKTo7QrGnM3bG1DCyInL8hIXBcriHYvx
	qcwopocoUr72W26i071UqRY0MnfU6bN/C8/ZU3+9xaLJXavQnjNQ3+qnpZhN66MBJjPfUnsv8mu
	OPBcP8zhicSqUFBWxNoJbTqq6yIgLdNnjwOok2OXELlYTQqXNsHGIiUkH0eGjfr0e/fTLlQhdev
	v/MOe2zM/qjU3GlFkdgn+xgGuBYT7Q67hSixOrNZpdazoBLYR7m0e+Q8Pam1OjCduYQDoVdCmXn
	yLFHsQWMjKF6U7uefyE+e4sCCj3xi8w/2yZYIXC2lxDCjGVRN8NbEaxmHrb6BV1TU3GIesh9Km0
	nj2Azm4y2y1okFN/xup+MQGIxnTtYDg==
X-Received: by 2002:a05:6a20:43a3:b0:3bf:9aa9:b2a4 with SMTP id
 adf61e73a8af0-3ccda966591mr3211458637.20.1786999206862; Mon, 17 Aug 2026
 13:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-8-a5872e64d8f4@nvidia.com>
In-Reply-To: <20260817-chid-v7-8-a5872e64d8f4@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 22:39:54 +0200
X-Gm-Features: AcwNN1V3e1yEbV4HQwbBf0qIGYbj3GVTsQ2fE2mh4DfZX2sLIE0e2kB1-JqFpmo
Message-ID: <CABwQupOweosKS1hP188GdZZrik9E1Ab7r9DZBuwnO6X5zD4F-g@mail.gmail.com>
Subject: Re: [PATCH v7 08/10] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:04=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Current code in IdPool::with_capacity rounds the capacity up to
> BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> smaller than this and still uses an inline representation. Remove this
> behaviour.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/id_pool.rs | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/rust/kernel/id_pool.rs b/rust/kernel/id_pool.rs
> index 382a5645767f..3e7c3d0c9dd9 100644
> --- a/rust/kernel/id_pool.rs
> +++ b/rust/kernel/id_pool.rs
> @@ -115,14 +115,9 @@ pub fn new() -> Self {
>      }
>
>      /// Constructs a new [`IdPool`] with space for a specific number of =
bits.
> -    ///
> -    /// A capacity below [`MAX_INLINE_LEN`] is adjusted to [`MAX_INLINE_=
LEN`].
> -    ///
> -    /// [`MAX_INLINE_LEN`]: BitmapVec::MAX_INLINE_LEN
>      #[inline]
>      pub fn with_capacity(num_ids: NonZero<usize>, flags: Flags) -> Resul=
t<Self, AllocError> {
> -        let num_ids =3D usize::max(num_ids.get(), BitmapVec::MAX_INLINE_=
LEN);
> -        let map =3D BitmapVec::new(num_ids, flags)?;
> +        let map =3D BitmapVec::new(num_ids.get(), flags)?;
>          Ok(Self { map })
>      }

Could you modify the rustdoctest unit tests of shrink_request and
grow_request to cover a few cases where capacity is < MAX_INLINE_LEN?

- Burak
