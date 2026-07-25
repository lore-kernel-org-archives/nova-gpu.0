Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F2E1B4156;
	Sat, 25 Jul 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993023; cv=none; b=DE097an7vTmmkbAsOeq4uNKGA/4cGbZ5LDIzK/FfNeIZtTIcQ6ylOIKoLEGl15L8HesKTgVo+J5F63lMS6c2xJIVmGgtoWzfJ+yi9S07x3Mtx1S0f9msdrZzk42OYAv/NlngaaHemNQ47e/XKxE0Q0z7d9KdVbQFUzK5gvwMsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993023; c=relaxed/simple;
	bh=H/UZoo1jd5DwImMYrju7zqybkVtsq/bF8GTxB3eWQ8Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZdH2L9LJdtbolIO2rXJaTq9PkK9WJxWKGcDIZLw+SqeWgrSIi6AkqqDGRbLvjjdBdRaOz2bmW5W2LikM4jggMQ2FRdQqp+UceAJXb+eqsDSbjYvCdexsGzBgUQK8Gw7qPHl9x9yjd7MBzx5E+fSHye5C6S/syXwXdTbmyzWjo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nkt1kOUO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nkt1kOUO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320331F000E9;
	Sat, 25 Jul 2026 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784993022;
	bh=IrObirDM6JFQjYFVBVhnBldHIACwoPrCRU3wk43L1Oo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Nkt1kOUO3NkQqUDxsXpetJv5q0e/lbbYguCNrmgwuuST0sFbm/8Da1NhuYg2FuuZi
	 x7yDyrmFtBoKxuEXUUcHQsjgi41/IlyLoCJluvVhYoRuM3koH+5hnrGjzQqHaHjJlg
	 Z+DH8GsbJh/2j251JxTRx1B64ukQb+oNykjQFQkuhazqB3wmC0ohDMOZN0huwMMIFq
	 9UI7V2Jla7LbuveLPcj9eyORWXbjdMtY2KrlyNhQUAV7trvWCb1EVtfgqZ9P7pV7wh
	 oXqqUCNNk1+zMhLMgFwvD8DoMzKx8mpXr3dhIx/xBFr9j54Pw/44QLeZRJay3nCvjV
	 8Zrjf2B9Gngmw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Jul 2026 17:23:38 +0200
Message-Id: <DK7R7SG09F1B.1TQISVHUUM0WG@kernel.org>
Subject: Re: [PATCH v3 4/7] drm: nova: Add GETPARAM parameter to read the
 GPU chipid
Cc: <nova-gpu@lists.linux.dev>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260723063046.1265791-1-apopple@nvidia.com>
 <20260723063046.1265791-5-apopple@nvidia.com>
In-Reply-To: <20260723063046.1265791-5-apopple@nvidia.com>

On Thu Jul 23, 2026 at 8:30 AM CEST, Alistair Popple wrote:
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 1156df51c533..855f23877734 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -34,7 +34,7 @@ impl File {
>      /// IOCTL: get_param: Query GPU / driver metadata.
>      pub(crate) fn get_param(
>          dev: &NovaDevice<Registered>,
> -        _reg_data: &DrmRegData<'_>,
> +        reg_data: &DrmRegData<'_>,
>          getparam: &mut uapi::drm_nova_getparam,
>          _file: &drm::File<File>,
>      ) -> Result<u32> {
> @@ -43,6 +43,7 @@ pub(crate) fn get_param(
> =20
>          let value =3D match getparam.param as u32 {
>              uapi::NOVA_GETPARAM_VRAM_BAR_SIZE =3D> pdev.resource_len(1)?=
,
> +            uapi::NOVA_GETPARAM_GPU_CHIPID =3D> reg_data.api.chipset() a=
s u64,

NIT: Given the subsequent changes I'd create a temporary

	let api =3D reg_data.api;

for this.

> +/*
> + * NOVA_GETPARAM_GPU_CHIPID
> + *
> + * Query the GPU chipid (architecture/implementation).
> + */
> +#define NOVA_GETPARAM_GPU_CHIPID	0x2

As mentioned in the previous reply, do we want userspace to extract additio=
nal
information from the chipid directly? Defining it as opaque value would mak=
e
things easier if the encoding details of the chipid ever change.
