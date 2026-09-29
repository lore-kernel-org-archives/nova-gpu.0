Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E83B37C0FE;
	Tue, 29 Sep 2026 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790708432; cv=none; b=SzqGu9f2xnzqVDFpcWKbzY+OZ93LuDVOkQFSQWcoWPpxFxuBEj18DEQM6jTX/WaH4oYcoEYKX+910BWjTkS8dn9McAo9vwnAEAd34uNh+mVdrtWskWkMUBmb4cKte2fuxg8w6cHNap8N3bjdeIpVby7dtuJT0vckrXVBOQuG1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790708432; c=relaxed/simple;
	bh=dhqVqz+SiAESsSV6D00FPsIc7eomWXgZcbEs+w43ruE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oTIs4FfAtr6emMR/XLVik8JIr0JhT2inF/C8AhU8+f+oLjmhzopms4Ma8O6zWUXgnKZsSO7fZlHWoOiLwUC97qbP56UE5gkOTb7X9sxs3oPHZjrp8j2DbeFjoOzyt5Nclm5zPrWiBmS6nz+xMeFDROCUvFTqULI1mMNfMkMpwso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/dI7hh7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/dI7hh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F21241F000FF;
	Tue, 29 Sep 2026 19:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790708430;
	bh=d2KNc+edJ1xpzJQNDTc+4zFjbcgQDd8/TWXP72PyXjw=;
	h=From:To:Cc:Subject:Date;
	b=P/dI7hh7UPtBdsA5HVwnKYBz21QFzLqZjgvusWayRfPNAErMqFREn1zHPPB4WuobY
	 ewm9lmwwQLUtQp1Pmwdu34elnQAvvceml0zLcGD73vsDLIZoaFCR7N8zIbhgUwH5n9
	 ATuT7t9SL1yjPPi/vWmo6Is/Te1CL1sWT/HhSEK2krEUX0dboFekNsGz0oISqyH1M8
	 wxX8UVj6rPFe+zaQAGBczdUnjoGjbuviBLb9UXYcca0L8dGrkM7l2dswF8wW2pE2Yf
	 bM9FPiNdMG40E58LZtYHT2zsVqL0ZOwbV16f8g4nJ62ePG1gdUb0L1cGhMX1731eXF
	 gD3Ol2phtNLWA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 1/2] rust: drm: Return impl PinInit from drm::Registration::new()
Date: Tue, 29 Sep 2026 20:59:30 +0200
Message-ID: <20260929190024.2248099-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert drm::Registration to return an impl PinInit<Self, Error> rather
than creating a separate allocation. This removes an otherwise
unnecessary allocation.

Update both in-tree callers (nova, tyr) to construct their bus device
private data using try_pin_init!().

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs |  27 ++++---
 drivers/gpu/drm/tyr/driver.rs  | 138 +++++++++++++++++----------------
 rust/kernel/drm/driver.rs      |  76 ++++++++++--------
 3 files changed, 130 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 46e13fe795eb..50537efe8d94 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -25,10 +25,11 @@
 
 pub(crate) struct NovaDriver;
 
+#[pin_data]
 pub(crate) struct Nova<'bound> {
-    #[expect(unused)]
     drm: ARef<drm::Device<NovaDriver>>,
-    _reg: drm::Registration<'bound, NovaDriver>,
+    #[pin]
+    reg: drm::Registration<'bound, NovaDriver>,
 }
 
 /// DRM registration data, accessible from ioctl handlers via the registration guard.
@@ -68,17 +69,19 @@ fn probe<'bound>(
         adev: &'bound auxiliary::Device<Core<'_>>,
         _info: &'bound Self::IdInfo,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        let drm = drm::UnregisteredDevice::<Self>::new(adev, Ok(()))?;
-        let reg_data = DrmRegData {
-            api: NovaCoreApi::of(adev)?,
-        };
-        // SAFETY: `reg` is stored in `Nova` and dropped when the driver is unbound; it is
-        // never forgotten.
-        let reg = unsafe { drm::Registration::new(adev.as_ref(), drm, reg_data, 0)? };
-
-        Ok(Nova {
+        try_pin_init!(Self::Data {
+            reg <- {
+                let drm = drm::UnregisteredDevice::<Self>::new(adev, Ok(()))?;
+
+                let reg_data = DrmRegData {
+                    api: NovaCoreApi::of(adev)?,
+                };
+
+                // SAFETY: `reg` is stored in `Self::Data` and dropped when the driver is unbound;
+                // it is never forgotten.
+                unsafe { drm::Registration::new(adev.as_ref(), drm, reg_data, 0) }
+            },
             drm: reg.device().into(),
-            _reg: reg,
         })
     }
 }
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index 730b84e37a54..6e1008290b5f 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -57,6 +57,7 @@
 
 #[pin_data(PinnedDrop)]
 pub(crate) struct TyrPlatformDriverData<'bound> {
+    #[pin]
     _reg: drm::Registration<'bound, TyrDrmDriver>,
 }
 
@@ -117,73 +118,76 @@ fn probe<'bound>(
         pdev: &'bound platform::Device<Core<'_>>,
         _info: Option<&'bound Self::IdInfo>,
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
-        let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
-        let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
-        let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
-
-        core_clk.prepare_enable()?;
-        stacks_clk.prepare_enable()?;
-        coregroup_clk.prepare_enable()?;
-
-        let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
-        let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
-
-        let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
-
-        let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?, GFP_KERNEL)?;
-
-        issue_soft_reset(pdev.as_ref(), &iomem)?;
-        gpu::l2_power_on(pdev.as_ref(), &iomem)?;
-
-        let gpu_info = GpuInfo::new(&iomem);
-        gpu_info.log(pdev.as_ref());
-
-        let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
-            .pa_bits()
-            .get();
-        // SAFETY: No concurrent DMA allocations or mappings can be made because
-        // the device is still being probed and therefore isn't being used by
-        // other threads of execution.
-        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
-
-        let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
-
-        let mmu = Mmu::new(pdev.as_ref(), iomem.as_arc_borrow(), &gpu_info)?;
-
-        let firmware = Firmware::new(
-            pdev.as_ref(),
-            iomem.clone(),
-            &unreg_dev,
-            mmu.as_arc_borrow(),
-            &gpu_info,
-        )?;
-
-        firmware.boot()?;
-
-        let reg_data = pin_init!(TyrDrmRegistrationData {
-                pdev,
-                fw: firmware,
-                clks <- new_mutex!(Clocks {
-                    core: core_clk,
-                    stacks: stacks_clk,
-                    coregroup: coregroup_clk,
-                }),
-                regulators <- new_mutex!(Regulators {
-                    _mali: mali_regulator,
-                    _sram: sram_regulator,
-                }),
-                iomem,
-                gpu_info,
-        });
-
-        // SAFETY: `reg` is stored in `TyrPlatformDriverData` and dropped when the driver is
-        // unbound; it is never forgotten.
-        let reg = unsafe { drm::Registration::new(pdev.as_ref(), unreg_dev, reg_data, 0)? };
-
-        let driver = TyrPlatformDriverData { _reg: reg };
-
-        dev_dbg!(pdev, "Tyr initialized correctly.");
-        Ok(driver)
+        pin_init::pin_init_scope(move || {
+            let core_clk = Clk::get(pdev.as_ref(), Some(c"core"))?;
+            let stacks_clk = OptionalClk::get(pdev.as_ref(), Some(c"stacks"))?;
+            let coregroup_clk = OptionalClk::get(pdev.as_ref(), Some(c"coregroup"))?;
+
+            core_clk.prepare_enable()?;
+            stacks_clk.prepare_enable()?;
+            coregroup_clk.prepare_enable()?;
+
+            let mali_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"mali")?;
+            let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
+
+            let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
+
+            let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?, GFP_KERNEL)?;
+
+            issue_soft_reset(pdev.as_ref(), &iomem)?;
+            gpu::l2_power_on(pdev.as_ref(), &iomem)?;
+
+            let gpu_info = GpuInfo::new(&iomem);
+            gpu_info.log(pdev.as_ref());
+
+            let pa_bits = MMU_FEATURES::from_raw(gpu_info.mmu_features)
+                .pa_bits()
+                .get();
+            // SAFETY: No concurrent DMA allocations or mappings can be made because
+            // the device is still being probed and therefore isn't being used by
+            // other threads of execution.
+            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
+
+            let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
+
+            let mmu = Mmu::new(pdev.as_ref(), iomem.as_arc_borrow(), &gpu_info)?;
+
+            let firmware = Firmware::new(
+                pdev.as_ref(),
+                iomem.clone(),
+                &unreg_dev,
+                mmu.as_arc_borrow(),
+                &gpu_info,
+            )?;
+
+            firmware.boot()?;
+
+            Ok(try_pin_init!(TyrPlatformDriverData {
+                // SAFETY: `_reg` is stored in `TyrPlatformDriverData` and dropped when the
+                // driver is unbound; it is never forgotten.
+                _reg <- unsafe { drm::Registration::new(
+                    pdev.as_ref(),
+                    unreg_dev,
+                    pin_init!(TyrDrmRegistrationData {
+                        pdev,
+                        fw: firmware,
+                        clks <- new_mutex!(Clocks {
+                            core: core_clk,
+                            stacks: stacks_clk,
+                            coregroup: coregroup_clk,
+                        }),
+                        regulators <- new_mutex!(Regulators {
+                            _mali: mali_regulator,
+                            _sram: sram_regulator,
+                        }),
+                        iomem,
+                        gpu_info,
+                    }),
+                    0,
+                )},
+                _: { dev_dbg!(pdev, "Tyr initialized correctly.") },
+            }))
+        })
     }
 }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 74f6ed690d8b..13aa609350b1 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -12,7 +12,10 @@
     prelude::*,
     sync::aref::ARef, //
 };
-use core::ptr::NonNull;
+use core::{
+    marker::PhantomPinned,
+    ptr::NonNull, //
+};
 
 /// Driver use the GEM memory manager. This should be set for all modern drivers.
 pub(crate) const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
@@ -143,9 +146,15 @@ pub trait Driver {
 /// The registration type of a `drm::Device`.
 ///
 /// Once the `Registration` structure is dropped, the device is unregistered.
+#[pin_data(PinnedDrop)]
 pub struct Registration<'a, T: Driver> {
     drm: ARef<drm::Device<T>>,
-    _reg_data: Pin<KBox<T::RegistrationData<'a>>>,
+    #[pin]
+    data: T::RegistrationData<'a>,
+    /// Even if `T::RegistrationData` is `Unpin`, the registration must not be moved because a
+    /// pointer to `data` is stored in the DRM device.
+    #[pin]
+    _pin: PhantomPinned,
 }
 
 impl<'a, T: Driver> Registration<'a, T> {
@@ -159,39 +168,41 @@ impl<'a, T: Driver> Registration<'a, T> {
     pub unsafe fn new<E>(
         dev: &'a device::Device<device::Bound>,
         drm: drm::UnregisteredDevice<T>,
-        reg_data: impl PinInit<T::RegistrationData<'a>, E>,
+        data: impl PinInit<T::RegistrationData<'a>, E>,
         flags: usize,
-    ) -> Result<Self>
+    ) -> impl PinInit<Self, Error>
     where
         Error: From<E>,
     {
-        let parent = drm.as_ref();
-        if parent.as_ref().as_raw() != dev.as_raw() {
-            return Err(EINVAL);
-        }
-
-        let reg_data: Pin<KBox<T::RegistrationData<'a>>> = KBox::pin_init(reg_data, GFP_KERNEL)?;
-
-        // Store the registration data pointer in the device before registration, so that it is
-        // visible once ioctls can be called.
-        let ptr: NonNull<T::RegistrationData<'static>> =
-            NonNull::from(Pin::get_ref(reg_data.as_ref())).cast();
-
-        // SAFETY: No concurrent access; the device is not yet registered.
-        unsafe { *drm.registration_data.get() = ptr };
-
-        // SAFETY: `drm` is a valid, initialized but not yet registered DRM device.
-        let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags) };
-        if let Err(e) = to_result(ret) {
-            // SAFETY: `drm_dev_register()` synchronizes SRCU on failure, so no concurrent
-            // access to `registration_data` is possible at this point.
-            unsafe { *drm.registration_data.get() = NonNull::dangling() };
-            return Err(e);
-        }
-
-        Ok(Self {
+        try_pin_init!(Self {
+            _: {
+                let parent = drm.as_ref();
+                if parent.as_ref().as_raw() != dev.as_raw() {
+                    return Err(EINVAL);
+                }
+            },
+
+            data <- data,
             drm: (&*drm).into(),
-            _reg_data: reg_data,
+            _pin: PhantomPinned,
+
+            _: {
+                // Store the registration data pointer in the device before registration, so
+                // that it is visible once ioctls can be called.
+                let ptr: NonNull<T::RegistrationData<'static>> =
+                    NonNull::from(data.as_ref().get_ref()).cast();
+
+                // SAFETY: No concurrent access; the device is not yet registered.
+                unsafe { *drm.registration_data.get() = ptr };
+
+                // SAFETY: `drm` is a valid, initialized but not yet registered DRM device.
+                let ret = unsafe { bindings::drm_dev_register(drm.as_raw(), flags) };
+                to_result(ret).inspect_err(|_| {
+                    // SAFETY: `drm_dev_register()` synchronizes SRCU on failure, so no
+                    // concurrent access to `registration_data` is possible at this point.
+                    unsafe { *drm.registration_data.get() = NonNull::dangling() };
+                })?;
+            },
         })
     }
 
@@ -208,8 +219,9 @@ unsafe impl<T: Driver> Sync for Registration<'_, T> {}
 // SAFETY: Registration with and unregistration from the DRM subsystem can happen from any thread.
 unsafe impl<T: Driver> Send for Registration<'_, T> {}
 
-impl<T: Driver> Drop for Registration<'_, T> {
-    fn drop(&mut self) {
+#[pinned_drop]
+impl<T: Driver> PinnedDrop for Registration<'_, T> {
+    fn drop(self: Pin<&mut Self>) {
         // Use `drm_dev_unplug` rather than `drm_dev_unregister` to ensure that existing
         // `drm_dev_enter()` critical sections complete before unregistration proceeds. This
         // is required for the safety of `RegistrationGuard`, which relies on the SRCU barrier in

base-commit: 10a6623a24a85708650efad7be15182289403cd7
-- 
2.55.0

