Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAE42F28FC
	for <nova-gpu@lists.linux.dev>; Wed, 10 Jun 2026 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781128840; cv=none; b=DSTTQZe8kRc6Uf6I/U/vdgl1n+IcW+R67uAihoOM8UIgThaBCPVKiG17qrVvXiHKpEAmMI3oA1U7GluWgDVtD+CNVy8JHahI8spKHTUMT9Knhcrl6T+bNizJTiR5pL919+RnRMSnNXmsBYTijL9PoyLEZPCgUWz5J76u1PHXJNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781128840; c=relaxed/simple;
	bh=4yDDg6qljHdgp+GHhcV2CYl+u1is5rha+ejlMTKd6cw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hPscQNPdGTBpaXFC96EMgbYAF3H7lMjtj7m6qOdIp1pEToJ0f0z/xidLQZ3F5IUas4wko+fmtv1yulanRUGauLaMO1nQ453unUYHHzdFrPlfwTQ3ClZwspcOZx4WUXPZoUXqJ9sIByISSlpVMJ7FU8PB8tegmVxMXyZ5Gs41FpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=afVOpk3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="afVOpk3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6C81F00893;
	Wed, 10 Jun 2026 22:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781128839;
	bh=dSPHAJbZ3omnPLl3xmfyJypWqxHXwFTQpWItGo0iZTk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=afVOpk3cIy+2fdPHZ33MyIisIIb3BUYRmuy00p3CIdNK86xx5nS1I9iyDfgNuEr8b
	 BQ32wJGCKeHApsr6L26e6W8Kqgshxk5XwRzLN5p9dqC+XpTMG/yxJLIFMy8myGTX9o
	 lq+p3Opmd4AfjOQP5zR27ZcQ8mWmoxlCq/tUvboKss9vulk3UCkqTb3AS25vCF+Izi
	 UQ/EHPlTzcHHJXlAm6DeAh5s6rGpNterzivf6a/n7btfwMc4GwGU+Yh7hvwl6RiUO/
	 AUb/TPSmaYvbCUMiuGaDQuLK/ZuoKxemqSPyCxPIFop6wiS9v0ueUuWCV5sTjUXTU/
	 jqvD+6RWY9omw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Jun 2026 00:00:36 +0200
Message-Id: <DJ5PH7GLXQMC.3MB95TLS6T86D@kernel.org>
Subject: Re: [PATCH 2/8] gpu: nova-core: add request_tlv to load TLV images
Cc: "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <nova-gpu@lists.linux.dev>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <zhiw@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260610174929.744477-1-ttabi@nvidia.com>
 <20260610174929.744477-3-ttabi@nvidia.com>
In-Reply-To: <20260610174929.744477-3-ttabi@nvidia.com>

On Wed Jun 10, 2026 at 7:49 PM CEST, Timur Tabi wrote:
> Add function request_tlv() to load TLV firmware images.
>
> TLV (type, length, value) files are the new image format used by Nova
> to encapsulate firmware images and their metadata.  Unlike the firmware
> files for previous versions of the firmware, TLV filenames are not
> versioned, and they have a .tlv suffix.
>
> Also add some #[allow(unused)] statements to two identifiers that will
> soon be removed, to keep the patchset clean.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 279fbacd0b8e..2749c196416d 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -33,9 +33,11 @@
>  pub(crate) mod gsp;
>  pub(crate) mod riscv;
> =20
> +#[allow(unused)]

This shouldn't be needed, it can just be removed when once it becomes unuse=
d,
no?

>  pub(crate) const FIRMWARE_VERSION: &str =3D "570.144";
> =20
>  /// Requests the GPU firmware `name` suitable for `chipset`, with versio=
n `ver`.
> +#[allow(unused)]
>  fn request_firmware(
>      dev: &device::Device,
>      chipset: gpu::Chipset,
> @@ -48,6 +50,21 @@ fn request_firmware(
>          .and_then(|path| firmware::Firmware::request(&path, dev))
>  }
> =20
> +/// Requests the GPU firmware TLV `name` suitable for `chipset`.
> +#[allow(unused)]

Please use expect instead.

> +fn request_tlv(
> +    dev: &device::Device,
> +    chipset: gpu::Chipset,
> +    name: &str,
> +) -> Result<firmware::Firmware> {
> +    let chip_name =3D chipset.name();
> +
> +    dev_info!(dev, "loading firmware image {}.tlv\n", name);

Please use dev_dbg!() instead, this should not be printed under normal
operation.

> +    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))
> +        .and_then(|path| firmware::Firmware::request(&path, dev))
> +}
> +
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> --=20
> 2.54.0

