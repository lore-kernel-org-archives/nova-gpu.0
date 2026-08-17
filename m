Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10623B27C9;
	Mon, 17 Aug 2026 20:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997523; cv=none; b=asAC9yaPFhF2C8ZEyyKS+ob6/czNdhRajs/WOjkMJpYix/HfZ2Y4Lx8rvGeIyJgE2RcNcuaOSzJL2fYZlUNSxKUrkt5wbqXJr3XuIpIeTfGf+LVqMQrN/gjwVsqFtXw9EHJTOlgIglq/YPSHH/fattyDlL+Rq6Uof8JT9npfuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997523; c=relaxed/simple;
	bh=DBXtxdN+7uZqKe3C8uP805SgAvhQyLAveUm0WyTJvrs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=XiE23xtDacvnzeS3Gm82O0t5i7AFlYMKcKU4bl89ZgZpAqsBKzXr4opfFsCq60XgL++eB094ve8daApx5T7Vqz4IA+Va3rFlYF1sqnoqsBF4pjexV6sw51/rLtcjOnxh5FnKVsIFIqlZap1gy1TsvbFUh9LIfA79b/ygYwb/9ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XrpHgZVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XrpHgZVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F40C1F000E9;
	Mon, 17 Aug 2026 20:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786997520;
	bh=bE+WsjXgFpqAMnrpxsyFK4q1Z+whv219PvMXv9ZwExY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=XrpHgZVBjEmGYqmOLxoJyfD9Ydx12rZYyrvCeNT/g5T2d4HJhrSj8I4im5hOQQffZ
	 h8rwkhUdIpyYwiWy0tXMmi8zUG//0A8BSMZJh7brsszgnIL5LWmCTMvN8v9HSQ2+KU
	 nw5yGLLzAPlUXdDY0vdQ0mJsab6W4wSDp4du2CHesi+u3HvYtUDRd8as5A6I/ZGoGD
	 Lh2zI9SZrOhSISfoG6JiND36cKQ+Cx+SIdgSnxUT6uMZbslah8OOPphM17qgkjzOUH
	 9Xf3V2vcu4NwPZ9ydyCw0jxXGiN1r1+LclxRrlEjtpvjcO9J5IB7JLqfNOqTMJDErP
	 4iMJw3xScqbFA==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 22:11:56 +0200
Message-Id: <DKRHR24SW3XR.27EE53NSRT1D3@kernel.org>
Cc: "nova-gpu" <nova-gpu@lists.linux.dev>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Benno Lossin" <lossin@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Alistair Popple" <apopple@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 6/7] drm: nova: Use nova-core to read VRAM_BAR_SIZE
 parameter
References: <20260811050657.646799-1-apopple@nvidia.com>
 <20260811050657.646799-7-apopple@nvidia.com>
In-Reply-To: <20260811050657.646799-7-apopple@nvidia.com>

On Tue Aug 11, 2026 at 7:06 AM CEST, Alistair Popple wrote:
> Currently nova-drm reads the VRAM BAR size directly from the PCIe device
> which requires trying to cast the parent device into a PCIe device. This
> obviously requires the parent device to actually be a PCIe bus device.
> Whilst that is true today it may not always be the case, and there
> is no reason to make this assumption now that NovaCoreApi can hold a
> reference to the bound PCIe device.
>
> So convert nova-drm to using nova-core to obtain the VRAM_BAR_SIZE
> parameter.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Suggested-by: Danilo Krummrich <dakr@kernel.org>

> @@ -33,16 +30,13 @@ fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>>=
 {
>  impl File {
>      /// IOCTL: get_param: Query GPU / driver metadata.
>      pub(crate) fn get_param(
> -        dev: &NovaDevice<Registered>,
> -        _reg_data: &DrmRegData<'_>,
> +        _dev: &NovaDevice<Registered>,
> +        reg_data: &DrmRegData<'_>,
>          getparam: &mut uapi::drm_nova_getparam,
>          _file: &drm::File<File>,
>      ) -> Result<u32> {
> -        let adev: &auxiliary::Device<Bound> =3D dev.as_ref();
> -        let pdev: &pci::Device<Bound> =3D adev.parent().try_into()?;
> -
>          let value =3D match getparam.param as u32 {
> -            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE =3D> pdev.resource_len(1)?=
,
> +            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE =3D> reg_data.api.bar1_siz=
e()?,
>              _ =3D> return Err(EINVAL),
>          };

That's much cleaner, thanks for adding this patch!

Once this landed we can remove the

	impl<Ctx: device::DeviceContext> TryFrom<&device::Device<Ctx>> for &Device=
<Ctx>

impl in rust/kernel/pci.rs. (I think platform should have the same impl to =
get
rid of independently.)

If your are interested, feel free to send a follow-up patch (or include it =
in
this series).
