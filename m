Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B918441DE01;
	Mon, 31 Aug 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186825; cv=none; b=imGJgtfoGQILhJaoTR6u/4WcBSjB3BAgid/qIrKboQiOw1rp6Z25IfiqwYxA4JvlEsCGeIcg0qSjRfv6Eq//XJjSBsGMm/3LUMUY50ZA3WZHSD/shLd94Yntdbpvj+kTnToTP3Ieugh9iqQv9lUL5wWNzEP1aldFEy6fk9oP+D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186825; c=relaxed/simple;
	bh=xu25haCIVd579iAiCSmqBW6uo3BT2Zy8ttRINTKNUYc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=LYye5hlrfBiA7OPgvmKsci27PFJQU0HCbO/R/4YXirKUkpsX397DHL89yBxFcp4fKBsb/VwYoiMAskQu3bYojqOGqa1B0l7boqorC/iMIYdlhrtY/JEPukt4pVtyeFknl/b7wwJev+aQO5n0Y3uQ7W69VJNCCAqmrbF3u/B7AFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMoStvfv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMoStvfv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B011C1F000E9;
	Mon, 31 Aug 2026 14:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788186824;
	bh=ZL5bFu7CsTNzqvus3MEa0m6EG4X7lg8HsHo2/a5DEMQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=bMoStvfvvwN006vdgROgnRCHVv5olC01N//krxZXlxBtjZ7hc7zAOU0H96VgzAYhu
	 Obh0HeH6W2ufSd2LuhWYA7aJU0JL4OYJeFOiWPCYnYUP8blGdS0fJ5rIu0H+YFf5dc
	 aXAgoGsZYrEA3r4o+QnuZ/1MpcDijZd+UzhaKTFtZ/wUlFP61NzunD3pjPyzIZwALj
	 qqzAEVKLn/WQh+qwM8vn4vD5k954/rlJx1uxjeDFFqwJN9LR5wp8yumC+mNO1JBAEe
	 BchC3FAatMdskNmzumUMnYcKRo7tS6FW2sSQRju/pNkYMRc9gJRtr7s91Qlq6gfXfD
	 wDqolbfbwZLog==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 16:33:40 +0200
Message-Id: <DL37BOJC2I73.1BK0RELPBUPY2@kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 09/11] drm: nova: Report GPU name in GPU info
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-10-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-10-apopple@nvidia.com>

On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
>  impl NovaCoreApi<'_> {
> +    /// Returns the NUL-terminated full GPU name supplied by GSP-RM.
> +    pub fn gpu_name(&self) -> [u8; 64] {

I don't really like that we have two separate accessors for this, can't we =
just
use the one we already have, which also does all the validation already?

The constructor of GpuInfo could look like this:

	fn new(reg_data: &DrmRegData<'_>) -> Result<Self> {
	    let mut info =3D uapi::drm_nova_gpu_info {
	        architecture: reg_data.api.architecture(),
	        implementation: reg_data.api.implementation(),
	        ..Default::default()
	    };
	    let bytes =3D reg_data.api.gpu_name()?.as_bytes();
	    info.gpu_name[..bytes.len()].copy_from_slice(bytes);
	    Ok(Self(info))
	}

Could also be infallible if we want to go with a fallback name, given that =
we
consider the firmware not providing something useful as non-fatal so far.

> +        *self.gpu.gsp_static_info.gpu_name_bytes()
> +    }
> +
>      /// Obtain a [`NovaCoreApi`] handle from an auxiliary device registe=
red
>      /// by nova-core.
>      pub fn of(adev: &auxiliary::Device<Bound>) -> Result<Pin<&NovaCoreAp=
i<'_>>> {
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 6453184af55b..b8dc64808620 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -251,6 +251,11 @@ pub(crate) enum GpuNameError {
>  }
> =20
>  impl GetGspStaticInfoReply {
> +    /// Returns the full GPU name as a NUL-terminated byte string.
> +    pub(crate) fn gpu_name_bytes(&self) -> &[u8; 64] {
> +        &self.gpu_name
> +    }

AFAICS there's nothing ensuring that this is actually NULL terminated? The
existing gpu_name() method already does this.
