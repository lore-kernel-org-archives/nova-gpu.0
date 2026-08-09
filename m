Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E928CF5D;
	Sun,  9 Aug 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786281878; cv=none; b=QN2dc7oX+xtAa3HpXnN5Vmm6NZlIroycdd2pDTjsumOtLhR/FdkbnCPA43Qn5JnIcykfAaUOsa5pCnVjGLKZ662CVixXU/S+raZFtnFSCcjqhAJwiTkyBxSVhy80JgED1W5d2HU+8ufBeyMMTxkmqKkN4hXsv3CFmHiIZHVaKGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786281878; c=relaxed/simple;
	bh=+YYPdBN6XNDuWLocpx58EwNKCeHHmqymITRoemd9+SE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=hSPzkSDRHbqtIdIa3i60Z3h2AKSZXYDzUWHWT9fq3DY3XSgGfPHlVjR0StndTaQ3BGdnpD98TITsSUQInNmf4txK+UAYiAag7oluGeLBVAjXPYCpu5Q+f3ORup3sBrkyXvrYrL+iFI6Lr5/JKO8Rc0F2DaCyL1VCvvSMA1hR6bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h33WrXGp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h33WrXGp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F1CB1F000E9;
	Sun,  9 Aug 2026 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786281876;
	bh=zsyN4NALekPNMz5xcq6zqLlVHh51JZ5d0Z+b3R1bHXQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=h33WrXGpYO0YJ1xiVKeWOhbkZkre7AxWuT/FUUXDPF5/IyaMx8sTdc4xc0gLvVOl6
	 3esFt3wptLk9bMRkUIgP5aWxgvoMGpVqcSgn267+vQUYr8by3/hCs9xiYWVRTMHksN
	 5fXXaJKjhQvnmFgppws1OYmpCKfjh0UBVYcdhoTQVllmlpVmW7amXXX1YJyxF/+trn
	 uShIbK95XWwUl9fDn0ay+UkqpsrAa6BpgduqpxmorP0A7QrwnSPk7Jm+3JozicEAoM
	 4dms3q0g9VscrbZ8oCwcLqkJwkCQUVWyWw2zrj+uDUv1la4E/Ak+i6j+d7LNBV34Yu
	 OFjc5IrPuDqBw==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 15:24:30 +0200
Message-Id: <DKKG2QM3YJYB.Z2H2B2UXJ75N@kernel.org>
Subject: Re: [PATCH 03/17] rust: pci: expose the allocated interrupt type
Cc: "Joel Fernandes" <joel@joelfernandes.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260808031120.363869-1-jhubbard@nvidia.com>
 <20260808031120.363869-4-jhubbard@nvidia.com>
In-Reply-To: <20260808031120.363869-4-jhubbard@nvidia.com>

On Sat Aug 8, 2026 at 5:11 AM CEST, John Hubbard wrote:
> diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
> index 4ebf256dff23..87ccd0cec69f 100644
> --- a/rust/helpers/pci.c
> +++ b/rust/helpers/pci.c
> @@ -24,6 +24,17 @@ __rust_helper bool rust_helper_dev_is_pci(const struct=
 device *dev)
>  	return dev_is_pci(dev);
>  }
> =20
> +__rust_helper unsigned int rust_helper_pci_irq_type(struct pci_dev *pdev=
)
> +{
> +	if (pdev->msix_enabled)
> +		return PCI_IRQ_MSIX;
> +
> +	if (pdev->msi_enabled)
> +		return PCI_IRQ_MSI;
> +
> +	return PCI_IRQ_INTX;
> +}

Rust helpers should only be transparent wrappers of existing functions / ma=
cros.

In this case this can be easily lifeted to include/linux/pci.h, as it shoul=
d be
a useful addition in general.

On the one hand there's already open-coded variants of this in drivers (suc=
h as
in [1]), and on the other hand I think it is not that great that drivers ac=
cess
fields like msix_enabled directly.

Related to that, msix_enabled and msi_enabled are fields within a C bitfiel=
d of
struct pci_device, so accessing this under just the Bound device context is
formally UB (though in practice it shouldn't be an issue).

However, this makes me notice that pci_alloc_irq_vectors() and
pci_free_irq_vectors() both mutate those fields.

Consequently, IrqVectorRegistration::register() is technically unsound by
requiring a Device<Bound> and instead has to require a Device<Core>, such t=
hat
the C bitfield access is protected by the device lock.

Now, I think that there's already fields in the struct pci_dev C bitfield, =
which
are not protected with the device lock (such as block_cfg_access or
ats_enabled), so this is already racy regardless.

However, even if that wouldn't be the case, pci_alloc_irq_vectors() has val=
id
use-cases outside of bus callbacks, i.e. where the device lock is not held,=
 e.g.
in [2] where it is called from a work item during device recovery.

IOW, just using the Core is the wrong solution (and insufficient anyway); B=
ound
is the correct context, but we need to fix the C bitfield issue.

I've also reported this in [3] for the is_busmaster field and it led to the
patch in [4]. However, I still think that there's quite some more fields in=
 the
C bitfield that should be converted to bitops.

We recently had a similar rework [5] in driver-core that I suggested for si=
milar
reasons. While not every field would have actually needed bitops, I think i=
t is
simpler to just use bitops and be safe.

[1] https://elixir.bootlin.com/linux/v7.1.7/source/drivers/net/ethernet/aqu=
antia/atlantic/aq_pci_func.c#L196
[2] https://elixir.bootlin.com/linux/v7.1.7/source/drivers/net/ethernet/mel=
lanox/mlx5/core/pci_irq.c#L773
[3] https://lore.kernel.org/all/DJOEYVBS17MJ.1YD3TNGQBWHNK@kernel.org/
[4] https://lore.kernel.org/all/20260714-pci-dev-flags-v2-1-a1d7dc441cf3@ma=
ilbox.org/
[5] https://lore.kernel.org/all/20260406232444.3117516-1-dianders@chromium.=
org/

>      /// Resolves the vector at `index` to the Linux IRQ number that deli=
vers it.
>      ///
>      /// # Errors
> @@ -177,9 +187,21 @@ fn register<'a>(

Currently this function still uses devres::register(), but we should change=
 it
to return Self being constrained to the lifetime of the &Device<Bound>.

This way the IrqAllocation type goes away and the IrqType and cound can be
directly on the IrqVectorRegistration type.

It also allows drivers to explicitly manage the lifetime of an
IrqVectorRegistration, which is something typically used by net and block
drivers.

Note that this also requires a borrow chain where irq::Registration keeps t=
he
pci::IrqVectorRegistration alive.

This could be done with adding a generic on IrqRequest which defaults to ()=
 for
non-PCI stuff.

If you prefer, I can also send a patch for this that you could incorporate =
into
your patch series, so it doesn't conflict.

Thanks,
Danilo

>          // `pci_alloc_irq_vectors` returns the number of vectors it allo=
cated.
>          let count =3D NonZero::new(ret as u32).ok_or(EINVAL)?;
> =20
> -        // INVARIANT: `pci_alloc_irq_vectors` allocated `count` vectors =
for `dev`, numbered
> -        // from 0.
> -        let vectors =3D IrqAllocation { dev, count };
> +        // SAFETY: `dev.as_raw()` is a valid pointer to a `struct pci_de=
v`.
> +        let irq_type =3D match unsafe { bindings::pci_irq_type(dev.as_ra=
w()) } {
> +            bindings::PCI_IRQ_MSIX =3D> IrqType::MsiX,
> +            bindings::PCI_IRQ_MSI =3D> IrqType::Msi,
> +            // The helper returns `PCI_IRQ_INTX` when neither MSI nor MS=
I-X is enabled.
> +            _ =3D> IrqType::Intx,
> +        };
> +
> +        // INVARIANT: `pci_alloc_irq_vectors` allocated `count` vectors =
of `irq_type` for `dev`,
> +        // numbered from 0.
> +        let vectors =3D IrqAllocation {
> +            dev,
> +            count,
> +            irq_type,
> +        };
