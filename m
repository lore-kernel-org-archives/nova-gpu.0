Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CF2274FD1;
	Mon, 25 May 2026 22:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749938; cv=none; b=AANR60LqmyNRWn5zU6juiXBsvVKI5m/aQbV3KK7/+0iF6Pp8oZ/o5TttHZgMf0VX8KfVpCYwlYQsLZMHavRYoi/NiXgMeQ7M/Dn6eDy1X1u2llgViSz+MrQX8chjEQ2iiuvLuIzFTpur0mpp1r8kgVLqg6hwOpERP+y8RKLhxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749938; c=relaxed/simple;
	bh=8CzfEj9U35G1gL5SzXMZDwiQR6cFbF4SRoxov7zI+aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+xi7KXcF7TdILS1Tq0m6J814/NGpHA3DFRIP0CDrcj1HmcH9OWDF8W8baRuIEYo12eMynawAhfOZ5t8sBTi5hfLgnLtVWUi0Xzba+QUndyAoMes82hCnsRrFCUeKtauQ6OJ02+l+C6JeOAeGNwOWW2lCNQF7hD5cE4kuzk5Lgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k64kbnBZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k64kbnBZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897511F000E9;
	Mon, 25 May 2026 22:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779749936;
	bh=0wLdpY7OzJ5XM7Eqt9X/csqUKifHe9VqKGP6AQhcv20=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k64kbnBZFdGRlVZapqM05Yz9+r3ieZ6h/sOXEXgCWZdMuNT1drKdlGM2PmMbYDuJQ
	 GPZYwryv8gO4/eOuw7kjaYmGoAxHjk54/SdsXqHrimsS0VjejIGxkFo9luOkbPW2Ri
	 v1J6qTQ4y3MH8F5t1uP4uF2JYwMGB1Mm83ozpqUKaXykobJIivr7bHaEyriQn7lUkW
	 yLmeCxqPPcxZKxlFk3UsCn6wL+AjVTTfyo/fWxgVByA1B2ObFv6tSBa9vJ7mPwbv+C
	 9c+DhrjL/yWBgD2DzZAEjpGfb3iCN29pQg8PmBAbELROs0HvyZPzMBVkYlKFsfGVaA
	 Rrp74aQnPVk8w==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	ttabi@nvidia.com,
	joelagnelf@nvidia.com,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/5] gpu: nova-core: use lifetime for Bar
Date: Tue, 26 May 2026 00:58:29 +0200
Message-ID: <20260525225838.276108-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525225838.276108-1-dakr@kernel.org>
References: <20260525225838.276108-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Take advantage of the lifetime-parameterized pci::Bar<'bound> to hold
the BAR mapping directly in NovaCore<'bound>, and pass a borrowed
reference to Gpu<'bound>.

This eliminates the Arc<Devres<Bar0>> indirection, removes runtime
revocation checks for BAR access, and simplifies Gpu::unbind().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/driver.rs | 32 +++++++++++++++-----------------
 drivers/gpu/nova-core/gpu.rs    | 33 +++++++++++++--------------------
 2 files changed, 28 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index d3f2245ba2e0..d4cf4379ee87 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -13,12 +13,9 @@
     },
     prelude::*,
     sizes::SZ_16M,
-    sync::{
-        atomic::{
-            Atomic,
-            Relaxed, //
-        },
-        Arc,
+    sync::atomic::{
+        Atomic,
+        Relaxed, //
     },
     types::ForLt,
 };
@@ -31,7 +28,8 @@
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
     #[pin]
-    pub(crate) gpu: Gpu,
+    pub(crate) gpu: Gpu<'bound>,
+    bar: pci::Bar<'bound, BAR0_SIZE>,
     #[allow(clippy::type_complexity)]
     _reg: auxiliary::Registration<'bound, ForLt!(())>,
 }
@@ -48,7 +46,7 @@ pub(crate) struct NovaCore<'bound> {
 // DMA addresses. These systems should be quite rare.
 const GPU_DMA_BITS: u32 = 47;
 
-pub(crate) type Bar0 = pci::Bar<'static, BAR0_SIZE>;
+pub(crate) type Bar0 = kernel::io::Mmio<BAR0_SIZE>;
 
 kernel::pci_device_table!(
     PCI_TABLE,
@@ -95,14 +93,14 @@ fn probe<'bound>(
             // other threads of execution.
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
 
-            let bar = Arc::new(
-                pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?
-                    .into_devres()?,
-                GFP_KERNEL,
-            )?;
-
             Ok(try_pin_init!(NovaCore {
-                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_ref())?),
+                bar: pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0")?,
+                // TODO: Use `&bar` self-referential pin-init syntax once available.
+                //
+                // SAFETY: `bar` is initialized before this expression is evaluated
+                // (`try_pin_init!()` initializes fields in declaration order), lives at a pinned
+                // stable address, and is dropped after `gpu` (struct field drop order).
+                gpu <- Gpu::new(pdev, unsafe { &*core::ptr::from_ref(bar) }),
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
                     c"nova-drm",
@@ -116,7 +114,7 @@ fn probe<'bound>(
         })
     }
 
-    fn unbind<'bound>(pdev: &'bound pci::Device<Core<'_>>, this: Pin<&Self::Data<'bound>>) {
-        this.gpu.unbind(pdev.as_ref());
+    fn unbind<'bound>(_pdev: &'bound pci::Device<Core<'_>>, this: Pin<&Self::Data<'bound>>) {
+        this.gpu.unbind();
     }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 78c4195e6132..108dd094e354 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -2,13 +2,11 @@
 
 use kernel::{
     device,
-    devres::Devres,
     fmt,
     io::Io,
     num::Bounded,
     pci,
-    prelude::*,
-    sync::Arc, //
+    prelude::*, //
 };
 
 use crate::{
@@ -246,10 +244,10 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
 
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
-pub(crate) struct Gpu {
+pub(crate) struct Gpu<'gpu> {
     spec: Spec,
-    /// MMIO mapping of PCI BAR 0
-    bar: Arc<Devres<Bar0>>,
+    /// MMIO mapping of PCI BAR 0.
+    bar: &'gpu Bar0,
     /// System memory page required for flushing all pending GPU-side memory writes done through
     /// PCIE into system memory, via sysmembar (A GPU-initiated HW memory-barrier operation).
     sysmem_flush: SysmemFlush,
@@ -262,12 +260,11 @@ pub(crate) struct Gpu {
     gsp: Gsp,
 }
 
-impl Gpu {
-    pub(crate) fn new<'a>(
-        pdev: &'a pci::Device<device::Bound>,
-        devres_bar: Arc<Devres<Bar0>>,
-        bar: &'a Bar0,
-    ) -> impl PinInit<Self, Error> + 'a {
+impl<'gpu> Gpu<'gpu> {
+    pub(crate) fn new(
+        pdev: &'gpu pci::Device<device::Bound>,
+        bar: &'gpu Bar0,
+    ) -> impl PinInit<Self, Error> + 'gpu {
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev,"NVIDIA ({})\n", spec);
@@ -279,6 +276,8 @@ pub(crate) fn new<'a>(
                     .inspect_err(|_| dev_err!(pdev, "GFW boot did not complete\n"))?;
             },
 
+            bar,
+
             sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
 
             gsp_falcon: Falcon::new(
@@ -292,19 +291,13 @@ pub(crate) fn new<'a>(
             gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
-
-            bar: devres_bar,
         })
     }
 
     /// Called when the corresponding [`Device`](device::Device) is unbound.
     ///
     /// Note: This method must only be called from `Driver::unbind`.
-    pub(crate) fn unbind(&self, dev: &device::Device<device::Core<'_>>) {
-        kernel::warn_on!(self
-            .bar
-            .access(dev)
-            .inspect(|bar| self.sysmem_flush.unregister(bar))
-            .is_err());
+    pub(crate) fn unbind(&self) {
+        self.sysmem_flush.unregister(self.bar);
     }
 }
-- 
2.54.0

