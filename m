Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D1281530;
	Tue,  2 Jun 2026 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371505; cv=none; b=bY2Bw1PEHXKEAsWBHBor+F3CBUkTKFkQ4mxTTzaVMqx62xPI4ok+kLuklZ2+KQkiJ28n+r9onJqal5/a2T9FwoGcbVIsyMs48ErhCuNm339tzWWo+yfzJafVxIAE/2mAjHqsfw7lFPntoj96GBNVnOVQijs4qqZfgWmf++TO+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371505; c=relaxed/simple;
	bh=keje1P0eYYnvib/HJdS3P/y7YRWGnDWeP0lfsYqFlXc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A7iJgZ2Cn3SwFV41sAkW9k5TRduIaqKwDuBA83CCR+GLRGqwUaVNjDzCnBN66sJJaZ4+plzf6laB/bnT7xk6EJ5t4tUiY6ovWUWR12UbK62xpYJ+0ddbDTPbyjedYbt5WgmmzqDlu/zEt/VpKuLZBV6jCuew9/P8UXpfEP5cmpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcSKCIpb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcSKCIpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805C61F00893;
	Tue,  2 Jun 2026 03:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371504;
	bh=kp+s0iJEKjxYtAJ3VCq8omSB6oCNfJMVtd4vd/uH6w4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcSKCIpbZmAOrQRAj6tb5zPumFahNvBk+HmRDJivF92xmoFyQciD3ZQ+OVOxlCun2
	 GqJAsR67bEprDWeexCTmDJTNSjfJbuProrFyUcwhO8A5SXIGv2ww5wLcL2oCi3gv/+
	 pWsBft1N6FNOAqzf/D9F6Fz5Nw/sepuGEZkBITIUt3/yhmGa/nub497amebo5B89Gb
	 qqlrNgiu+D7+AIMNiGV07D+NiLWoRLR1NwDMT2zcqbcp/CBAG5jgswMSQ7PZjd5aQg
	 1zF3KjYUxheUBHbxOPDmixeREcKySZzcBJ5S0JoMTae9GZOk1qKQWUdoSihEoS5b7G
	 HiHTFoRrAJcWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 22/22] gpu: nova-core: gsp: enable FSP boot path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>
Cc: "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Bjorn Helgaas" <bhelgaas@google.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Zhi Wang" <zhiw@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Timur Tabi" <ttabi@nvidia.com>, "Shashank Sharma" <shashanks@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, nova-gpu@lists.linux.dev, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno
 Lossin" <lossin@kernel.org>
In-Reply-To: <20260602032111.224790-23-jhubbard@nvidia.com>
References: <20260602032111.224790-23-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:38:23 +0000
Message-Id: <20260602033823.805C61F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] DMA Use-After-Free during GSP boot failure path due to reverse=
 drop order.
- [High] Unconditional boot failure due to invalid error check in `wait_for=
_gsp_lockdown_release`.
--

commit c4510072c2995001dbf13cc4a2db6eb978b85b10
Author: Alexandre Courbot <acourbot@nvidia.com>

gpu: nova-core: gsp: enable FSP boot path

This patch enables the FSP boot path so Hopper and Blackwell devices can
boot. It accomplishes this by removing the hardcoded ENOTSUPP return code
and returning the boot unload guard instead.

> diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-co=
re/gsp/hal/gh100.rs
> index d372ae85c5bc7..93d8a72fe9303 100644
> --- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
> +++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
> @@ -166,7 +166,7 @@ fn boot<'a>(
>          );
> =20
>          // Wrap the unload bundle into a drop guard so it is automatical=
ly run upon failure.
> -        let _unload_guard =3D
> +        let unload_guard =3D
>              BootUnloadGuard::new(gsp, dev, bar, gsp_falcon, sec2_falcon,=
 Some(unload_bundle));

[Severity: Critical]
This is a pre-existing issue, but does this declaration order cause a DMA
use-after-free if the boot path fails?

In Rust, local variables are dropped in the reverse order of their declarat=
ion.
Here in Gh100::boot(), unload_guard is declared before args (which contains
FmcBootArgs and its DMA-coherent allocations).

If wait_for_gsp_lockdown_release() returns an error, args is dropped first,
freeing and unmapping the DMA memory while the GSP RISC-V is still running.
unload_guard is dropped afterward to execute teardown.

Since FspUnloadBundle::run() only polls for the GSP to halt without issuing=
 an
explicit hardware reset if it is stuck:

drivers/gpu/nova-core/gsp/hal/gh100.rs:FspUnloadBundle::run() {
    read_poll_timeout(
        || Ok(gsp_falcon.is_riscv_active(bar)),
        |&active| !active,
        Delta::from_millis(10),
        Delta::from_secs(5),
    )
...
}

Could this leave the GSP running indefinitely and capable of reading or wri=
ting
to the freed DMA memory?

> =20
>          let mut fsp =3D Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)=
?;
> @@ -184,7 +184,7 @@ fn boot<'a>(
>          let fmc_boot_params_addr =3D args.boot_params_dma_handle();
>          wait_for_gsp_lockdown_release(dev, bar, gsp_falcon, fmc_boot_par=
ams_addr)?;

[Severity: High]
This isn't a bug introduced by this patch, but will this function unconditi=
onally
return an error for a successful boot sequence?

In wait_for_gsp_lockdown_release(), read_poll_timeout() waits for the lockd=
own
to be released. The lockdown_released() function correctly handles the vali=
d state
where mbox.mbox0 contains the lower 32 bits of fmc_boot_params_addr:

drivers/gpu/nova-core/gsp/hal/gh100.rs:lockdown_released() {
    if self.mbox0 !=3D 0 && self.combined_addr() !=3D fmc_boot_params_addr {
        return true;
    }
...
}

However, wait_for_gsp_lockdown_release() blindly evaluates mbox0 !=3D 0 aft=
er
polling:

drivers/gpu/nova-core/gsp/hal/gh100.rs:wait_for_gsp_lockdown_release() {
...
    if mbox.mbox0 !=3D 0 {
        dev_err!(dev, "GSP-FMC boot failed (mbox: {:#x})\n", mbox.mbox0);
        return Err(EIO);
    }
...
}

Since fmc_boot_params_addr is a DMA address, won't its lower 32 bits almost
certainly be non-zero, causing this newly enabled boot path to immediately =
fail?

> =20
> -        Err(ENOTSUPP)
> +        Ok(unload_guard)
>      }
>  }
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D22
