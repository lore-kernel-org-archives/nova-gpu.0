Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324497;
	b=veZ3m6ORXjnDw+tfFmPdg+wpyVCanaMWEUQqNVXKOoDKM4BblAHsEAztKx8nE005S3Jk
	 9jgwzFTnjiiKbZaAZBY2KH2OwrHEi74q8+VHbA2DgcdY6mec1Wng4ISHZgaSLG1cMf0K9
	 BRX89SBUdWXwL5ZTwr9zn9oXxlScBUwE5ZJW/tj2jZaint9ZGEB7h0JI8NuAt+65ic11P
	 pDKLrMiUFCMh3qmPXg1S0TU9yOX1qDjRtOnItJMYztdt33JfC5d9xdeK+BValrnXwYC+L
	 oRT+L8GSsF0yDKWIMUzHmCJjhwBRsKrHlKTJuxHsVg14oUZp+wek6PoRgwfOQHtRSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324497;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8WCab1dfQGKFIAtl8TPq0xziMBqlNKmEQVjXJ5qrQKw=;
	b=TGd3HcYHF5BeDxg9ZGFf6BUeEV7M9vqD8Vh575QcBolqT0iKfJ3u2bwkC2Pmp1DAA5eH
	 fhCIp0ZbZG/0cPb0U09THQzxS7OJY2sAIC/V5F5sazAmC1hpwea64vUE/7fS1dnIJ6Nig
	 pVDb0MIFQgwfLJlM7yWzqVVyN0e3zF25w72Cho+yvakSnahdfT2e8JW14JofI1FD03k6N
	 ManykBf3Hmrt8cmw0zEM6Sw54ha+i4Ekbe3D0LKYKkaX5nOzx9eWibGVG4Pn9zll9qoCG
	 D+vzvWSIuNA7bBLASEaLLbjzwW30OBYve1KXCQV7qdxA9DrlcxiK4ma4ZAtSxLxP9Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dviUlrjS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB80606A321;
	Tue, 10 Nov 2026 15:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dviUlrjS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B1C1F0089F;
	Tue, 10 Nov 2026 15:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794324493;
	bh=8WCab1dfQGKFIAtl8TPq0xziMBqlNKmEQVjXJ5qrQKw=;
	h=From:To:Cc:Subject:Date;
	b=dviUlrjSk4hmIbCuQ1Fe0URP6IMPl6PJNPrXc+qgC/fj09d1x86f8uDqvNYdon3ja
	 Ep/3eVsYCAnVg4P9jrNJWDSd+YFWZxE3QZpVtnPygASvgFBJvSRlqcaJbLX5ZZH2NL
	 z+DYnSPxVLC/utkUc0GPY9IEkT6jhkOke/Qhy4l3DAHHbh13WK5TypSMBRwB5e8TS3
	 tYv23RQSLFYYLhaCHOL8hwaC8jVehISV+3GJatDFckmdU7CSlGYyhqpK3xi0t/lBZ+
	 0shBSVARVeknRzZaDgL2/lvulAs6+J5eUkWjCrLIo+f6dMRclK/xzZA2T69KNcKqiz
	 q6breSk0e/lEQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: nova-core: use pin-init self-referential support
Date: Tue, 10 Nov 2026 16:27:31 +0100
Message-ID: <20261110152746.140351-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Express all self-referential borrows through pin-init's self-referential
support [1], replacing unsafely derived references.

Cc: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/all/20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net/ [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/api.rs     | 24 ++++++++++++---
 drivers/gpu/nova-core/driver.rs  | 53 +++++++++++---------------------
 drivers/gpu/nova-core/gpu.rs     | 32 ++++++++-----------
 drivers/gpu/nova-core/irq/gsp.rs | 17 +++++-----
 4 files changed, 59 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
index eec69aace3b2..94808af3886d 100644
--- a/drivers/gpu/nova-core/api.rs
+++ b/drivers/gpu/nova-core/api.rs
@@ -22,11 +22,27 @@
 };
 
 /// API handle for the auxiliary bus child drivers to interact with nova-core.
-pub struct NovaCoreApi<'bound> {
-    pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
+#[pin_data]
+pub struct NovaCoreApi<'bound>
+where
+    // `Gpu` is invariant in its resource lifetime, which outlives this API borrow.
+    exists<'gpu_resources>: 'bound,
+{
+    #[uses('gpu_resources: invariant)]
+    gpu: Pin<&'bound Gpu<'gpu_resources>>,
     pub(crate) pdev: &'bound pci::Device<Bound>,
 }
 
+impl<'bound> NovaCoreApi<'bound> {
+    /// Creates an API handle.
+    pub(crate) fn new<'gpu: 'bound>(
+        pdev: &'bound pci::Device<Bound>,
+        gpu: Pin<&'bound Gpu<'gpu>>,
+    ) -> impl PinInit<Self> + use<'bound, 'gpu> {
+        pin_init!(Self { gpu, pdev })
+    }
+}
+
 impl NovaCoreApi<'_> {
     /// Obtain a [`NovaCoreApi`] handle from an auxiliary device registered
     /// by nova-core.
@@ -36,12 +52,12 @@ pub fn of(adev: &auxiliary::Device<Bound>) -> Result<NovaCoreApiHandle<'_>> {
 
     /// Returns the GPU [`GetGspStaticInfoReply`].
     pub fn gsp_static_info(&self) -> &GetGspStaticInfoReply {
-        &self.gpu.gsp_static_info
+        self.with_gpu(|gpu| &gpu.gsp_static_info)
     }
 
     /// Returns the GPU [`Spec`].
     pub fn spec(&self) -> &Spec {
-        &self.gpu.spec
+        self.with_gpu(|gpu| &gpu.spec)
     }
 
     /// Returns the size of the PCIe BAR used for accessing VRAM, typically
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 560a70c4f5a7..ac5a9d9f8331 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -33,9 +33,11 @@
 #[pin_data]
 pub(crate) struct NovaCore<'bound> {
     #[allow(clippy::type_complexity)]
-    _reg: auxiliary::Registration<'bound, ForLt!(NovaCoreApi<'_>)>,
+    #[uses('gpu: invariant)]
+    _reg: auxiliary::Registration<'gpu, ForLt!(NovaCoreApi<'_>)>,
     #[pin]
-    pub(crate) gpu: Gpu<'bound>,
+    #[uses('bar: invariant, 'bar1)]
+    pub(crate) gpu: Gpu<'bar>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
     bar1: pci::Bar<'bound>,
 }
@@ -129,44 +131,25 @@ fn probe<'bound>(
                 crate::irq::doorbell_test::run_selftest(pdev, bar, spec.chipset)?;
             },
 
-            // TODO: Use self-referential pin-init syntax once available.
-            gpu <- Gpu::new(
-                pdev,
-                // SAFETY: `bar` is initialized above, pinned, and outlives `gpu`.
-                unsafe { &*core::ptr::from_ref(bar) },
-                // SAFETY: `bar1` is initialized above, pinned, and outlives `gpu`.
-                unsafe { &*core::ptr::from_ref(bar1) },
-            ).pin_chain(|_gpu| {
+            gpu <- Gpu::new(pdev, bar, bar1).pin_chain(|_gpu| {
                 #[cfg(CONFIG_NOVA_CORE_SELFTESTS)]
                 _gpu.run_selftests(pdev);
                 Ok(())
             }),
 
-            _reg: {
-                // TODO: Use `&gpu` self-referential pin-init syntax once available.
-                //
-                // SAFETY: `gpu` is initialized before this expression is evaluated
-                // (`try_pin_init!()` initializes fields in initializer order), lives at
-                // a pinned stable address, and is dropped after `_reg` (struct field
-                // drop order).
-                let gpu = unsafe {
-                    Pin::new_unchecked(&*core::ptr::from_ref(gpu.as_ref().get_ref()))
-                };
-
-                // SAFETY: `NovaCore` is dropped when the device is unbound;
-                // i.e. `mem::forget()` is never called on it.
-                unsafe {
-                    auxiliary::Registration::new_with_lt(
-                        pdev.as_ref(),
-                        c"nova-drm",
-                        // TODO[XARR]: Use XArray or perhaps IDA for proper ID
-                        // allocation/recycling. For now, use a simple atomic counter that
-                        // never recycles IDs.
-                        AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
-                        crate::MODULE_NAME,
-                        NovaCoreApi { gpu, pdev },
-                    )?
-                }
+            // SAFETY: `NovaCore` is dropped when the device is unbound; i.e. `mem::forget()` is
+            // never called on it.
+            _reg: unsafe {
+                auxiliary::Registration::new_with_lt(
+                    pdev.as_ref(),
+                    c"nova-drm",
+                    // TODO[XARR]: Use XArray or perhaps IDA for proper ID
+                    // allocation/recycling. For now, use a simple atomic counter that
+                    // never recycles IDs.
+                    AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
+                    crate::MODULE_NAME,
+                    NovaCoreApi::new(pdev, gpu),
+                )?
             },
         })
     }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d185e927233f..cbd720a4d11f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -342,15 +342,15 @@ struct GspResources<'gpu> {
 /// The two drop as a unit, the handler first, on the drop of [`Gpu`] and on the error path of
 /// its constructor alike, so that the subtree is disabled only after the handler is freed.
 #[pin_data]
-struct GspSubtree<'a> {
+struct GspSubtree<'a, 'gpu> {
     #[pin]
-    irq: GspIrq<'a>,
+    irq: GspIrq<'a, 'gpu>,
     /// Must be kept declared *after* `irq`. A handler still in flight enables the subtree again
     /// through its rearm.
     _top: TopEnableGuard<'a>,
 }
 
-impl<'a> GspSubtree<'a> {
+impl<'a, 'gpu: 'a> GspSubtree<'a, 'gpu> {
     /// Returns an initializer that registers the GSP event handler and then enables its subtree at
     /// `TOP`.
     ///
@@ -362,7 +362,7 @@ unsafe fn new(
         pdev: &'a pci::Device<device::Bound>,
         tree: &'a Tree<'a>,
         falcon: &'a Falcon<'a, GspFalcon>,
-        cmdq: &'a Cmdq<'a>,
+        cmdq: &'a Cmdq<'gpu>,
     ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             // SAFETY: this function's caller must not leak the `GspSubtree` that owns this
@@ -383,7 +383,8 @@ pub(crate) struct Gpu<'gpu> {
     /// any in-flight run of it has finished, before the command queue that it drains and the
     /// falcon that it reads are freed, and before the GSP is unloaded.
     #[pin]
-    _gsp_subtree: GspSubtree<'gpu>,
+    #[uses('tree)]
+    _gsp_subtree: GspSubtree<'gsp_resources, 'gpu>,
     /// Static GPU information as provided by the GSP.
     pub(crate) gsp_static_info: GetGspStaticInfoReply,
     /// GPU memory manager owning memory management resources.
@@ -403,9 +404,6 @@ pub(crate) struct Gpu<'gpu> {
     /// Must be kept declared *after* `gsp_resources`, as the latter's `PinnedDrop` implementation
     /// requires the sysmem flush page to be in place.
     sysmem_flush: SysmemFlush<'gpu>,
-    /// Borrow of `tree` that `_gsp_subtree` holds. A field that borrows a sibling field is
-    /// self-referential, which `pin_init` cannot express, so the borrow is taken by hand.
-    tree_ref: &'gpu Tree<'gpu>,
     /// The GIN CPU interrupt tree and the PCI vectors that deliver it.
     ///
     /// Must be kept declared *after* `_gsp_subtree`, which holds a borrow of it.
@@ -456,10 +454,6 @@ pub(crate) fn new<'a>(
 
             tree: Tree::new(pdev, bar, spec.chipset, irq::gsp::GSP_SUBTREE.into())?,
 
-            // SAFETY: `tree` is initialized above, is pinned at a stable address, and is dropped
-            // after every field that uses `tree_ref` (struct field drop order).
-            tree_ref: unsafe { &*core::ptr::from_ref(tree.as_ref().get_ref()) },
-
             _: {
                 let dma_mask = hal::gpu_hal(spec.chipset).dma_mask();
 
@@ -513,19 +507,17 @@ pub(crate) fn new<'a>(
             }),
 
             _: {
-                irq::gsp::quiesce(tree_ref, &gsp_resources.gsp_falcon);
+                irq::gsp::quiesce(tree.get_ref(), &gsp_resources.gsp_falcon);
             },
 
-            // SAFETY: the GSP falcon and the command queue are fields of `gsp_resources`, which
-            // is initialized above and pinned, so both references outlive the registration. The
-            // registration is a field of `Gpu` and is never leaked, so its `Drop` runs, and field
-            // drop order runs it before either is freed.
+            // SAFETY: The registration is owned by `Gpu`, which is dropped when the device is
+            // unbound, so the registration's `Drop` runs.
             _gsp_subtree <- unsafe {
                 GspSubtree::new(
                     pdev,
-                    tree_ref,
-                    &*core::ptr::from_ref(&gsp_resources.gsp_falcon),
-                    &*core::ptr::from_ref(&gsp_resources.gsp.cmdq),
+                    tree.get_ref(),
+                    &gsp_resources.get_ref().gsp_falcon,
+                    &gsp_resources.get_ref().gsp.cmdq,
                 )
             },
 
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
index 1abde8e0a405..f4fe7b5d691e 100644
--- a/drivers/gpu/nova-core/irq/gsp.rs
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -50,15 +50,16 @@ pub(crate) fn quiesce(tree: &Tree<'_>, falcon: &Falcon<'_, GspFalcon>) {
 }
 
 /// Threaded IRQ handler for the GSP event.
-pub(crate) struct GspInterrupt<'a> {
+pub(crate) struct GspInterrupt<'a, 'gpu> {
     falcon: &'a Falcon<'a, GspFalcon>,
-    cmdq: &'a Cmdq<'a>,
+    // `Cmdq` is invariant in `'gpu`; the handler borrows it for the shorter `'a`.
+    cmdq: &'a Cmdq<'gpu>,
     tree: &'a Tree<'a>,
     /// For logging.
     dev: &'a device::Device,
 }
 
-impl GspInterrupt<'_> {
+impl GspInterrupt<'_, '_> {
     /// Clears the latch of every host-routed cause in `status` other than SWGEN0, and logs them.
     ///
     /// Returns the causes still set after the clear. A cause driven from outside the falcon stays
@@ -83,7 +84,7 @@ fn clear_faults(
     }
 }
 
-impl irq::ThreadedHandler for GspInterrupt<'_> {
+impl irq::ThreadedHandler for GspInterrupt<'_, '_> {
     /// Top half, in hard interrupt context. Services the GSP vector only, so another vector
     /// pending in the same leaf stays pending.
     fn handle(&self) -> irq::ThreadedIrqReturn {
@@ -145,13 +146,13 @@ fn handle_threaded(&self) -> irq::IrqReturn {
 /// The declaration order is the drop order, and it is required: the vector is disabled before
 /// `free_irq` runs. See "Enabling the GSP event" in `Documentation/gpu/nova/core/interrupts.rst`.
 #[pin_data]
-pub(crate) struct GspIrq<'a> {
+pub(crate) struct GspIrq<'a, 'gpu> {
     _leaf_guard: LeafEnableGuard<'a>,
     #[pin]
-    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a>>,
+    reg: irq::ThreadedRegistration<'a, GspInterrupt<'a, 'gpu>>,
 }
 
-impl<'a> GspIrq<'a> {
+impl<'a, 'gpu: 'a> GspIrq<'a, 'gpu> {
     /// Returns an initializer that registers the threaded handler and then enables the GSP
     /// vector at its leaf.
     ///
@@ -171,7 +172,7 @@ pub(crate) unsafe fn new(
         pdev: &'a pci::Device<device::Bound>,
         tree: &'a Tree<'a>,
         falcon: &'a Falcon<'a, GspFalcon>,
-        cmdq: &'a Cmdq<'a>,
+        cmdq: &'a Cmdq<'gpu>,
     ) -> impl PinInit<Self, Error> + 'a {
         let dev = pdev.as_ref();
 

base-commit: a7cdb17ca0d7ce67e9f3a52d39edd60f03223729
-- 
2.56.0

