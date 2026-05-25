Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343B62882BE;
	Mon, 25 May 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720384; cv=none; b=duBIkwTLj+mgmzuTcACDDRsz7xZRMdhfmS5aN0GbTrFbL19rnjYVTrdXNEBmEwnhAzO+wi1YnywkANOYzyH+oeRNhABh2d2PFUVeROgVyuj9Qce/Ip87mJKqknW04oJgohx+YkHbEZuPku7EmBxRhQjLQNKYpWquFbfT9oqOj2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720384; c=relaxed/simple;
	bh=3sSy2/BrYS6VUxCQ8EFnU5VUls2W1OMFYaqQ7nj4a1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Fm7D576V6xmb4eaCzLQBugXAOyNi2mRdhE9zUfxV0umwJFQ3Xh7vZ2Jo9RD3vn/1eje9cJrgk4TCo9DykQsbY1+pWn8eptC4uhMAhGzLc30y7AFn/+lVV7eyJm0z9GGtGwKSGTSGNGZ54AeGOjnp2Nu29aMAQs05HfPoyR9znqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPpdPOz9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPpdPOz9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BB11F000E9;
	Mon, 25 May 2026 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779720382;
	bh=p8bI0W/hdn902yJe2xP7w0AZ0/K6OZ+j/YWXcl7hIF0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=VPpdPOz9SBWmfS4IE/Aim3UiRM9wwUCl7UjXZ/kv6ncdjsyNvotNir4Vu30dgnhnx
	 3hpA/OqaSuOrNylGCZkEcQlXmxukgtse2agkad3nWUkC5lL1SNmhkHjq8gHO69EaIt
	 vVVgaTk5vHI1vPstGEzJTrBc+MFba8VoJSuOJ4WtugTbWvzqn15pncG9g46IevsWmA
	 F41he+0vMWlTPAdd3KKZnVLNNUCgU0GrD1PbzvRd6zT/l6QNqM/Dd4+6eopIQeYcnC
	 UAF4xZJAu1fEBL/ulVCp6p3Viivmcm2oeRZd4yvyVYSl7r0/s7fewIwT4QQTiB7Cd4
	 spGiZpc+TlXXQ==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 16:46:18 +0200
Message-Id: <DIRU7Z3NH9J2.2HT7Z93HFCFW0@kernel.org>
Subject: Re: [PATCH v5 15/22] gpu: nova-core: vbios: use the first PCI-AT
 image
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260525-fix-vbios-v5-0-e5e455251537@nvidia.com>
 <20260525-fix-vbios-v5-15-e5e455251537@nvidia.com>
In-Reply-To: <20260525-fix-vbios-v5-15-e5e455251537@nvidia.com>

On Mon May 25, 2026 at 3:57 PM CEST, Eliot Courtney wrote:
> @@ -333,7 +333,10 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0)=
 -> Result<Vbios> {
>              // Convert to a specific image type
>              match BiosImageType::try_from(image.pcir.code_type) {
>                  Ok(BiosImageType::PciAt) =3D> {
> -                    pci_at_image =3D Some(PciAtBiosImage::try_from(image=
)?);
> +                    // Silently ignore any extra PCI-AT images.
> +                    if pci_at_image.is_none() {
> +                        pci_at_image =3D Some(PciAtBiosImage::try_from(i=
mage)?);
> +                    }
>                  }
>                  Ok(BiosImageType::FwSec) =3D> {
>                      if first_fwsec_image.is_none() {

This does produce the following warning:

  CLIPPY [M] drivers/gpu/nova-core/nova_core.o
warning: this `if` can be collapsed into the outer `match`
   --> drivers/gpu/nova-core/vbios.rs:337:21
    |
337 | /                     if pci_at_image.is_none() {
338 | |                         pci_at_image =3D Some(PciAtBiosImage::try_f=
rom(image)?);
339 | |                     }
    | |_____________________^
    |
    =3D help: for further information visit https://rust-lang.github.io/rus=
t-clippy/rust-1.95.0/index.html#collapsible_match
    =3D note: `-W clippy::collapsible-match` implied by `-W clippy::all`
    =3D help: to override `-W clippy::all` add `#[allow(clippy::collapsible=
_match)]`
help: collapse nested if block
    |
335 ~                 Ok(BiosImageType::PciAt)
336 |                     // Silently ignore any extra PCI-AT images.
337 ~                     if pci_at_image.is_none() =3D> {
338 |                         pci_at_image =3D Some(PciAtBiosImage::try_fro=
m(image)?);
339 ~                     }
    |

warning: 1 warning emitted

I can fix it up this way:

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.r=
s
index 82811e42e858..bf61b085d7c0 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -332,11 +332,10 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0) =
-> Result<Vbios> {

             // Convert to a specific image type
             match BiosImageType::try_from(image.pcir.code_type) {
-                Ok(BiosImageType::PciAt) =3D> {
+                Ok(BiosImageType::PciAt)
                     // Silently ignore any extra PCI-AT images.
-                    if pci_at_image.is_none() {
+                    if pci_at_image.is_none() =3D> {
                         pci_at_image =3D Some(PciAtBiosImage::try_from(ima=
ge)?);
-                    }
                 }
                 Ok(BiosImageType::FwSec) =3D> {
                     if first_fwsec_image.is_none() {

However, I'm not exactly sure it really is an improvement in terms of
readability and whether this is a prime example for this lint.
