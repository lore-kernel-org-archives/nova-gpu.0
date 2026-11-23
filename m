Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467132;
	b=AZMZhHfu5hWvfmRZCiji1YIpawrGjAdhgcamOb95bZ7TWEhLoIVmqgZyFH8Cf4L3iYLc
	 vFkodsqDdiFiijBG908oZMtbIQR/rhjUeWpS1MSgGdAHZ4BW4gzaHbfpHGtmwx/OhfU5X
	 N3gTGcUDRwNNa5buLkIeG7nivVu42cYgVS/41GWcJfxarDYaH12QNa6+RRdexzirIwZCg
	 9ue2D7LTRH13oag+XjcMNMacd42bANjUWNwpfAE76k4phk0Okc/UJQ2z5iNusHRRVLynP
	 M9hSdDTdoom835CXop4MUp2bjzZyOXtpzC8TjlhI5m3E1s/+XDEiDa13aw8JsoyqnBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467132;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=M/swXvZU6mbp1m6LU3eMa/1rd3k8YHG7bvPyy7Nwqr0=;
	b=whHb47czdbDaCxQt30ZNvdwA2vkbNXHiK4qY6umW3skIM0ESadUMC6zOmEL8qi/b8Ij2
	 zQ352ib0rXHVH7piRBtQOz5P55hXom+eUEMBp3xs2I8LvFrz6bPbD1AoleX8+3iS+dS7g
	 WBVVjTTjiPv+xLSubM08vYRyUQAkILXyUOTmvkpRad8ga+NY/kbJv01QiRw8sZHr/ytAn
	 Q+Z/Rdx5+YvDSSR2VeNzSY520vbd8oyE/eQG85PyobvS/TJGKyEiHe1BVgOnWptaKF7aj
	 45NWHfCDxrjNeealz1JL/GHq+ehy3gkAR3hpqQKEnhQySk58x1ruZL612bH2FHtlm3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqpufP6f;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B7C606A32D
	for <nova-gpu@lists.linux.dev>; Mon, 23 Nov 2026 20:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gqpufP6f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02501F000ED;
	Mon, 23 Nov 2026 20:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467132;
	bh=M/swXvZU6mbp1m6LU3eMa/1rd3k8YHG7bvPyy7Nwqr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gqpufP6fgMtXo7jWM0GEEs/XWKHivF26lofCDAxTy1EBHTO3ijWipbJyX6hPPrACQ
	 61nywHN4vwIE8a5e9N3UxnvX0e/QZlGqmvKAgXyhEiNrIRncjHhqleCXWXEG1iKgjq
	 9dvVgjU74y6ZwDAZWHcBBsZUMAHpKezoJWj5X7HQUm9wt6zOB0DFAWe6Yl7PY9wgtX
	 xk5pw1SPftK8yRJP4qjscpRDPp+SXCBsQDf45XnHu7xhWqycuKhV83rM+Hh93ph5uS
	 DJXlfB6ea3TCoZGjdI0Kh7LxTViQVMoo8bz09H+qy7ncFLkXruWaWLSssKTN0Qqd/s
	 bliZdXLosqIcw==
Message-ID: <sashiko-outbox-230028@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/3] rust: dma: require device configuration before
 DMA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Matteo Kloiber" <kernel@matt3o12.de>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?utf-8?b?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?= <kwilczynski@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev
In-Reply-To: <20261123203926.1787169-4-kernel@matt3o12.de>
References: <20261123203926.1787169-1-kernel@matt3o12.de>
 <20261123203926.1787169-4-kernel@matt3o12.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:52:11 +0000
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] rust: dma: missing INVARIANT comments in Setup::new() and
  Handle::new_for_test()
- [Low] rust: dma: missing #[inline] on Setup and Handle methods in
  kernel abstraction
--

commit 24aab1a18402fe872441d89737705384f9f15bd1
Author: Matteo Kloiber <kernel@matt3o12.de>

rust: dma: require device configuration before DMA

This commit replaces the dma::Device trait with a dma::Setup token passed
via bus InitTokens, requiring drivers to configure DMA parameters and
obtain a dma::Handle before performing DMA allocations, scatterlist
mappings, or IOMMU page-table creation.

Link: https://lore.kernel.org/DLHH0K25NLX5.616R4D860TXU@nvidia.com
Link: https://lore.kernel.org/DLR1JCUWS824.35QJU45D2W9ZE@nvidia.com

> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 580e1c3427bc5..03f48bd1f9406 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs

[ ... ]

> @@ -48,83 +48,124 @@
> +/// Token for configuring a device's DMA parameters.
> +///
> +/// The bus passes it to the driver's `probe()` callback. The driver can=
 access the device, e.g. to
> +/// read its capabilities, before calling [`Setup::configure`], which co=
nsumes the token. Drivers
> +/// that don't use DMA can drop it.
> +///
> +/// # Invariants
> +///
> +/// - The bus has initialized the device's DMA parameters.
> +/// - There is only one `Setup` per driver binding, and no [`Handle`] ha=
s been created for it yet.
> +/// - No DMA allocation or mapping for this device can run concurrently =
with
> +///   [`Setup::configure`], and nothing else changes the DMA parameters =
while the device is bound.
> +pub struct Setup<'bound> {
> +    dev: &'bound device::Device<Bound>,
> +}
> +
> +impl<'bound> Setup<'bound> {
> +    /// Creates the setup token passed to a driver's probe callback.
>      ///
>      /// # Safety
>      ///
> -    /// This method must not be called concurrently with any DMA allocat=
ion or mapping primitives,
> -    /// such as [`Coherent::zeroed`].
> -    unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
> -        // SAFETY:
> -        // - By the type invariant of `device::Device`, `self.as_ref().a=
s_raw()` is valid.
> -        // - The safety requirement of this function guarantees that the=
re are no concurrent calls
> -        //   to DMA allocation and mapping primitives using this mask.
> -        to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw()=
, mask.value()) })
> +    /// The caller must ensure the invariants of [`Self`], including uni=
queness of the token.
> +    pub(crate) unsafe fn new(dev: &'bound device::Device<Bound>) -> Self=
 {
> +        Self { dev }
>      }
>
> -    /// Set up the device's DMA coherent addressing capabilities.
> -    ///
> -    /// This method is usually called once from `probe()` as soon as the=
 device capabilities are
> -    /// known.
> -    ///
> -    /// # Safety
> +    /// Applies `params` and returns a [`Handle`] for DMA allocations an=
d mappings.
>      ///
> -    /// This method must not be called concurrently with any DMA allocat=
ion or mapping primitives,
> -    /// such as [`Coherent::zeroed`].
> -    unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
> -        // SAFETY:
> -        // - By the type invariant of `device::Device`, `self.as_ref().a=
s_raw()` is valid.
> -        // - The safety requirement of this function guarantees that the=
re are no concurrent calls
> -        //   to DMA allocation and mapping primitives using this mask.
> -        to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref()=
.as_raw(), mask.value()) })
> +    /// If a setter fails, its error is returned and parameters applied =
before it are not restored.
> +    pub fn configure(self, params: Params) -> Result<Handle<'bound>> {
> +        let dev =3D self.dev.as_raw();
> +
> +        if let Some(mask) =3D params.streaming_mask {
> +            // SAFETY: `dev` is valid. The `Setup` invariants exclude co=
ncurrent DMA operations
> +            // and other parameter setters, and consuming the token prev=
ents reconfiguration.
> +            to_result(unsafe { bindings::dma_set_mask(dev, mask.value())=
 })?;
> +        }
> +        if let Some(mask) =3D params.coherent_mask {
> +            // SAFETY: `dev` is valid. The `Setup` invariants exclude co=
ncurrent DMA operations
> +            // and other parameter setters, and consuming the token prev=
ents reconfiguration.
> +            to_result(unsafe { bindings::dma_set_coherent_mask(dev, mask=
.value()) })?;
> +        }
> +        if let Some(size) =3D params.max_seg_size {
> +            // SAFETY: `dev` is valid and its DMA parameters are initial=
ized. The `Setup`
> +            // invariants exclude concurrent DMA operations and other pa=
rameter setters,
> +            // and consuming the token prevents reconfiguration.
> +            unsafe { bindings::dma_set_max_seg_size(dev, size.get()) };
> +        }
> +
> +        // INVARIANT: All requested setters succeeded. The `Setup` invar=
iants prevent further
> +        // changes while the device is bound to the driver.
> +        Ok(Handle { dev: self.dev })
> +    }
> +}
> +
> +/// Handle for DMA allocations and mappings on a configured device.
> +///
> +/// Returned by [`Setup::configure`]. It can be copied freely, but canno=
t change the DMA parameters.
> +///
> +/// # Invariants
> +///
> +/// The requested DMA parameters have been applied and do not change dur=
ing `'bound`.
> +#[derive(Clone, Copy)]
> +pub struct Handle<'bound> {
> +    dev: &'bound device::Device<Bound>,
> +}
> +
> +impl<'bound> Handle<'bound> {
> +    /// Returns the device associated with this DMA handle.
> +    pub fn device(self) -> &'bound device::Device<Bound> {
> +        self.dev
>      }
>
> -    /// Set up the device's DMA addressing capabilities.
> -    ///
> -    /// This is a combination of [`Device::dma_set_mask`] and [`Device::=
dma_set_coherent_mask`].
> -    ///
> -    /// This method is usually called once from `probe()` as soon as the=
 device capabilities are
> -    /// known.
> -    ///
> -    /// # Safety
> -    ///
> -    /// This method must not be called concurrently with any DMA allocat=
ion or mapping primitives,
> -    /// such as [`Coherent::zeroed`].
> -    unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
> -        // SAFETY:
> -        // - By the type invariant of `device::Device`, `self.as_ref().a=
s_raw()` is valid.
> -        // - The safety requirement of this function guarantees that the=
re are no concurrent calls
> -        //   to DMA allocation and mapping primitives using this mask.
> -        to_result(unsafe {
> -            bindings::dma_set_mask_and_coherent(self.as_ref().as_raw(), =
mask.value())
> -        })
> +    pub(crate) fn as_raw(self) -> *mut bindings::device {
> +        self.dev.as_raw()
>      }
>
> -    /// Set the maximum size of a single DMA segment the device may requ=
est.
> +    /// Creates a handle for `dev` without calling [`Setup::configure`].
>      ///
> -    /// This method is usually called once from `probe()` as soon as the=
 device capabilities are
> -    /// known.
> -    ///
> -    /// # Safety
> -    ///
> -    /// This method must not be called concurrently with any DMA allocat=
ion or mapping primitives,
> -    /// such as [`Coherent::zeroed`].
> -    unsafe fn dma_set_max_seg_size(&self, size: u32) {
> -        // SAFETY:
> -        // - By the type invariant of `device::Device`, `self.as_ref().a=
s_raw()` is valid.
> -        // - The safety requirement of this function guarantees that the=
re are no concurrent calls
> -        //   to DMA allocation and mapping primitives using this paramet=
er.
> -        unsafe { bindings::dma_set_max_seg_size(self.as_ref().as_raw(), =
size) }
> +    /// For tests only.
> +    #[cfg(CONFIG_KUNIT =3D "y")]
> +    #[allow(dead_code)] // Only used by tests of other, optional abstrac=
tions.
> +    pub(crate) fn new_for_test(dev: &'bound device::Device<Bound>) -> Se=
lf {
> +        Self { dev }
>      }
>  }

[Severity: Low]
Both Setup and Handle document an "# Invariants" section, and
Setup::configure() includes an "// INVARIANT:" comment when constructing
Handle, but Setup::new() and Handle::new_for_test() construct Self { dev }
without "// INVARIANT:" comments explaining why the type invariants hold.

[Severity: Low]
Should Setup::new(), Setup::configure(), Handle::device(),
Handle::as_raw(), and Handle::new_for_test() be marked #[inline], as they
are small accessors/constructors or forward directly to C bindings in the
kernel crate?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123203926.1787=
169-1-kernel@matt3o12.de?part=3D3
