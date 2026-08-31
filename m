Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFDB49EC5A;
	Mon, 31 Aug 2026 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186192; cv=none; b=cz82yqMdk+UV/agllWjDlFaiKUQptpskV67VB/muDpfgern4lJ3hS3frFpsG8jJCEmtkn+IrSjztIVZOkmrLNgbVwFPnrlBcH4SaPKglFhT2DdCf7jUQkgZQDOFy5lbYEik91f0+JdbUnfXGFGRaLPKMTCEM7eyTuwI7xBXnJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186192; c=relaxed/simple;
	bh=ERs2tMdWbAT8+KZwRD7EcKoycyB3va8nMspS75hqNsM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=LeCFo8ObjaDTSrBd5zo0sGFHOexXaOoG3VqWbuc6p3RKwppXjl+YDP7esKeRo7bLBKdy76T8WJ5eXzS5gWsjNJjnoSVB3ILFi09e5aV58HrY51lBAv7sqdtyqR7FGCyMc0tKDQFzdDjzZ+U7Opfq1nKKRD8BTBS5qrMoL2P0JlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M4f0BJfA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M4f0BJfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D0C1F000E9;
	Mon, 31 Aug 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788186186;
	bh=ZfhCnlNwaOt0kHN3M0pPLUZxE3ygK6m+vGelvT+G1+0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=M4f0BJfA/Apjjv5W54jmYEjD2CgRVcStQsuC4B5ShDTGdj3m1zpbb0XeTo0GCQhmO
	 sv/oTnGIzML+mcXQR/H/QH5SKjgvrUarpyqsiDnJOx9xQ/6XdEFrLNAesdWRNhAD0M
	 dUVv4dsgcOXoidnB1VrNe7zY5qkc7M57vJJPC0Qq8EG2dwSpE4oxGFm5C80a+lJdcm
	 7puoA12SfC+OAQl7C+ytIjwGP1MUS5v4mM5l4/XLFEi/rZBRh1aDf7YdUBJPuttO3X
	 2n3O4INPUmYVrsBdnUbSETvVeVFYUY0Fhfj5Ke9HYsqe9fJjmnKoXaajdIMCsPnHjT
	 RduguPWE1vl8A==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 16:23:01 +0200
Message-Id: <DL373JA1ZANX.21L51RTEUQ2UG@kernel.org>
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "M Henning"
 <mhenning@darkrefraction.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Benno Lossin" <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 05/11] drm: nova: Add an info ioctl
References: <20260828033531.1117754-1-apopple@nvidia.com>
 <20260828033531.1117754-6-apopple@nvidia.com>
In-Reply-To: <20260828033531.1117754-6-apopple@nvidia.com>

On Fri Aug 28, 2026 at 5:35 AM CEST, Alistair Popple wrote:
> +/// GPU information returned to userspace.
> +///
> +/// # Invariants
> +///
> +/// - The layout of this type is identical to `struct drm_nova_gpu_info`=
.
> +/// - All bytes in the value are initialized.

I don't think we need those invariants. The first one is covered by
#[repr(transparent)] and the second invariant is trivally satisfied by the =
fact
that we create a value of that type.

Maybe you meant to say that we explicitly initialized everything despite
uapi::drm_nova_gpu_info being FromBytes (i.e. no "random" values)? But I th=
ink
even that wouldn't need an invariant.

> +#[repr(transparent)]
> +struct GpuInfo(uapi::drm_nova_gpu_info);
> +
> +impl GpuInfo {
> +    fn new(reg_data: &DrmRegData<'_>) -> Self {
> +        Self(uapi::drm_nova_gpu_info {
> +            architecture: reg_data.api.architecture(),
> +            implementation: reg_data.api.implementation(),
> +        })
> +    }
> +}
> +
> +// SAFETY: `GpuInfo` has no implicit padding, kernel pointers, or interi=
or
> +// mutability, and all of its fields are initialized before it is writte=
n to
> +// userspace.
> +unsafe impl AsBytes for GpuInfo {}
> +
> +fn write_info<T: AsBytes>(info: &mut uapi::drm_nova_info, value: &T) -> =
Result {

We could take T by value I guess? We don't need it anymore after it has bee=
n
written to the user buffer.

> +    let mut writer =3D
> +        UserSlice::new(UserPtr::from_addr(info.data as usize), info.size=
 as usize).writer();
> +
> +    info.size =3D writer.write_truncated(value)? as u32;
> +
> +    Ok(())
> +}
> +
>  impl drm::file::DriverFile for File {
>      type Driver =3D NovaDriver;
> =20
> @@ -78,4 +112,27 @@ pub(crate) fn gem_info(
> =20
>          Ok(0)
>      }
> +
> +    /// IOCTL: info: Query device information.
> +    pub(crate) fn info(
> +        _dev: &NovaDevice<Registered>,
> +        reg_data: &DrmRegData<'_>,
> +        info: &mut uapi::drm_nova_info,
> +        _file: &drm::File<File>,
> +    ) -> Result<u32> {
> +        if info.data =3D=3D 0 {
> +            info.size =3D match info.id {
> +                uapi::DRM_NOVA_INFO_GPU =3D> size_of::<GpuInfo>() as u32=
,
> +                _ =3D> return Err(EINVAL),
> +            };
> +            return Ok(0);
> +        }

I think this check can go into write_info(), so we don't have to repeat thi=
s for
every info. I.e. we can just add

	if info.data =3D=3D 0 {
	    info.size =3D size_of::<T>() as u32;
	    return Ok(());
	}

at the beginning of write_info(). It may construct the value even if
info.data =3D=3D 0, but I don't think we care. :)

> +
> +        match info.id {
> +            uapi::DRM_NOVA_INFO_GPU =3D> write_info(info, &GpuInfo::new(=
reg_data))?,
> +            _ =3D> return Err(EINVAL),
> +        }
> +
> +        Ok(0)
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
> index 610cfc01111e..cff730a38c1d 100644
> --- a/drivers/gpu/nova-core/api.rs
> +++ b/drivers/gpu/nova-core/api.rs
> @@ -12,11 +12,12 @@
>      types::CovariantForLt, //
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::gpu::{
> +    Gpu, //
> +};
> =20
>  /// API handle for the auxiliary bus child drivers to interact with nova=
-core.
>  pub struct NovaCoreApi<'bound> {
> -    #[expect(unused)]
>      pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
>  }
> =20
> @@ -26,4 +27,14 @@ impl NovaCoreApi<'_> {
>      pub fn of(adev: &auxiliary::Device<Bound>) -> Result<Pin<&NovaCoreAp=
i<'_>>> {
>          adev.registration_data::<CovariantForLt!(NovaCoreApi<'_>)>()
>      }
> +
> +    /// Returns the architecture identifier of this GPU.
> +    pub fn architecture(&self) -> u32 {
> +        self.gpu.spec.chipset.arch() as u32
> +    }
> +
> +    /// Returns the implementation identifier of this GPU.
> +    pub fn implementation(&self) -> u32 {
> +        self.gpu.spec.chipset.implementation()
> +    }

We should make the NovaCoreApi just provide an accessor for &Spec and make =
every
subsequent method we need public. Otherwise we end up with endless forwardi=
ng
methods. We can also add as_raw() methods to the specific types as needed.
