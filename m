Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025576;
	b=hetYuO1ZChJsGeKlJTiU6958hy+jBDgN+PT+OoKQkJO7XJt76xaMtjdhQBuyPfqD/Iz3
	 0MEzsdQw3VKhCcSWEL2WgGU7tnKFmMWyalo0FmIagkV5EAaCLNEUT9LMLaHuUyiQpZt9B
	 uwp4yCunfxzkBS7BxFAbygzp3KG4O8GYQOz3OhIywZApePmUUTVWumm6VNtksqnicHt65
	 U9MMkDOrx1cQTjK5qYJFXub+vD3Ue65zoSjMx8s9ZEZRdsQFJFIW/eh1Lc+WP2dF5gPOR
	 mGA0S4q5R/DIAT3cdyemu3fdl1uUVAb/aIuTwcZVnfQBHS3YcKEVC5APqwvrYxM/4yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025576;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QwgpircG35eCtvMz6oMeaILv9jzCPrAXDg7hzUVK4Ho=;
	b=gZQQs6hoi4tJjHVJZBZD2Z2aFI91dVyP6VrPxS3tYdHC3XXg7+4Q/R3MsFlTI8sXOFdd
	 9bWd0M9TJJM6xeADSdpyznACFKJnSQ8+JCvkiEVq3/PUqluyrcPWHld65buWQ8AkSnvxX
	 pKx1XMlR5sTmuiNfIJz7mNm9XVedYpIQ/HRfqwDeUBYMoO9sAh65XHEnTWw2WAY+fmccJ
	 TYOF0A0QZnBn5wN7yhskcQwi0MDfIdlGdBOMTIZXXd2XYUYonKhrS5QgAfnComFOVPYYE
	 mKox1A8CXI6UuQlCNOkw7lclKSmXXEA75TAoxypF+UPc+lN4dYwMhbiznEYjty7o9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ealm2dAJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16D606A32A;
	Wed, 18 Nov 2026 18:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ealm2dAJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1F01F000C4;
	Wed, 18 Nov 2026 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025576;
	bh=QwgpircG35eCtvMz6oMeaILv9jzCPrAXDg7hzUVK4Ho=;
	h=From:To:Cc:Subject:Date;
	b=ealm2dAJoXXZpZN4OCx1x80exfqr1VQt4qAIHNwmFSxdJmOFsVdzOtAiykFLfdRiT
	 855jhLIGfCBChLG8SS80NhZ7+9zz7NslKnGyDlAbpydtLE05RUxutp2INYX+LYT+Ch
	 E6JQXaHflaZ85nH6aXfeUECMP4kEHWgTxjIalvB+lDc4FKSUCCNBs7MGPmgjwAUMiC
	 i5mlOl8CWaqLAn3U7enuF3WVLhzjzXFOnbVESSIYamTcAy7AzY4XxSHPFYVEF/ErAX
	 IMuvXw3/ebfysEnBahQyT1lxIBJP3JxYdEMAtgbNdD6s5HTOGzTPP2L8gqS+8Zjp2V
	 3LVwogsNs6KTg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: drm: remove DRM device private data
Date: Wed, 18 Nov 2026 19:07:35 +0100
Message-ID: <20261118181245.2583303-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
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

Driver::Data is owned by the reference-counted drm::Device and can
outlive device unregistration and driver unbind. Driver state belongs in
RegistrationData, whose lifetime ends with registration teardown.

The intended model is that, after drm_dev_unplug(), surviving DRM
objects (e.g. through remaining userspace handles) no longer require
access to the driver state. Thus Driver::RegistrationData is available
(and sufficient) for all DRM callbacks into the driver.

Remove Driver::Data, its storage and Deref implementation, and the
unused workqueue implementations that depend on it. Drop the data
initializer argument from UnregisteredDevice::new() and update its
callers.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs |   3 +-
 drivers/gpu/drm/tyr/driver.rs  |   3 +-
 rust/kernel/drm/device.rs      | 128 ++-------------------------------
 rust/kernel/drm/driver.rs      |   3 -
 rust/kernel/drm/gem/shmem.rs   |   6 +-
 5 files changed, 9 insertions(+), 134 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 44a52e60b3c7..df3f37d06861 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -71,7 +71,7 @@ fn probe<'bound>(
     ) -> impl PinInit<Self::Data<'bound>, Error> + 'bound {
         try_pin_init!(Self::Data {
             reg <- {
-                let drm = drm::UnregisteredDevice::<Self>::new(adev, Ok(()))?;
+                let drm = drm::UnregisteredDevice::<Self>::new(adev)?;
 
                 let reg_data = DrmRegData {
                     api: NovaCoreApi::of(adev)?,
@@ -88,7 +88,6 @@ fn probe<'bound>(
 
 #[vtable]
 impl drm::Driver for NovaDriver {
-    type Data = ();
     type RegistrationData<'a> = DrmRegData<'a>;
     type File = File;
     type Object = gem::Object<NovaObject>;
diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
index c2b99d67369f..9caedd0fd130 100644
--- a/drivers/gpu/drm/tyr/driver.rs
+++ b/drivers/gpu/drm/tyr/driver.rs
@@ -148,7 +148,7 @@ fn probe<'bound>(
             // other threads of execution.
             unsafe { pdev.dma_set_mask_and_coherent(DmaMask::try_new(pa_bits)?)? };
 
-            let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, Ok(()))?;
+            let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev)?;
 
             let mmu = Mmu::new(pdev.as_ref(), iomem.as_arc_borrow(), &gpu_info)?;
 
@@ -207,7 +207,6 @@ fn drop(self: Pin<&mut Self>) {}
 
 #[vtable]
 impl drm::Driver for TyrDrmDriver {
-    type Data = ();
     type RegistrationData<'drm> = TyrDrmRegistrationData<'drm>;
     type File = TyrDrmFileData;
     type Object = Bo;
diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6b88ade28e24..774db3acb15a 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -22,12 +22,6 @@
     types::{
         NotThreadSafe,
         Opaque, //
-    },
-    workqueue::{
-        HasDelayedWork,
-        HasWork,
-        Work,
-        WorkItem, //
     }, //
 };
 use core::{
@@ -36,10 +30,7 @@
     marker::PhantomData,
     mem,
     ops::Deref,
-    ptr::{
-        self,
-        NonNull, //
-    },
+    ptr::NonNull, //
 };
 
 #[cfg(CONFIG_DRM_LEGACY)]
@@ -167,7 +158,7 @@ const fn compute_features() -> u32 {
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
         unload: None,
-        release: Some(Device::<T>::release),
+        release: None,
         master_set: None,
         master_drop: None,
         debugfs_init: None,
@@ -201,28 +192,18 @@ const fn compute_features() -> u32 {
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
     /// This can be used to create a [`Registration`](kernel::drm::Registration).
-    pub fn new(
-        dev: &T::ParentDevice<device::Bound>,
-        data: impl PinInit<T::Data, Error>,
-    ) -> Result<Self> {
+    pub fn new(dev: &T::ParentDevice<device::Bound>) -> Result<Self> {
         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence ensure a `kmalloc()`
         // compatible `Layout`.
         let layout = Kmalloc::aligned_layout(Layout::new::<Device<T, Normal>>());
 
-        // Use a temporary vtable without a `release` callback until `data` is initialized, so
-        // init failure can release the DRM device without dropping uninitialized fields.
-        let alloc_vtable = bindings::drm_driver {
-            release: None,
-            ..Self::VTABLE
-        };
-
         // SAFETY:
-        // - `alloc_vtable` reference remains valid until no longer used,
-        // - `dev` is valid by its type invarants,
+        // - The vtable has static storage duration.
+        // - `dev` is valid by its type invariants.
         let raw_drm: *mut Device<T, Normal> = unsafe {
             bindings::__drm_dev_alloc(
                 dev.as_ref().as_raw(),
-                &alloc_vtable,
+                const { &Self::VTABLE },
                 layout.size(),
                 mem::offset_of!(Device<T, Normal>, dev),
             )
@@ -230,25 +211,6 @@ pub fn new(
         .cast();
         let raw_drm = NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
 
-        // SAFETY: `raw_drm` is a valid pointer to `Self`, given that `__drm_dev_alloc` was
-        // successful.
-        let drm_dev = unsafe { Device::into_drm_device(raw_drm) };
-
-        // SAFETY: `raw_drm` is a valid pointer to `Self`.
-        let raw_data = unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
-
-        // SAFETY:
-        // - `raw_data` is a valid pointer to uninitialized memory.
-        // - `raw_data` will not move until it is dropped.
-        unsafe { pin_init::raw_try_init(raw_data, data) }.inspect_err(|_| {
-            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_dev` must be valid and the
-            // refcount must be non-zero.
-            unsafe { bindings::drm_dev_put(drm_dev) };
-        })?;
-
-        // SAFETY: `drm_dev` is still private to this function.
-        unsafe { (*drm_dev).driver = const { &Self::VTABLE } };
-
         // SAFETY: `raw_drm` is valid; no concurrent access before registration.
         unsafe { (*raw_drm.as_ptr()).registration_data = UnsafeCell::new(NonNull::dangling()) };
 
@@ -274,7 +236,6 @@ pub fn new(
 #[repr(C)]
 pub struct Device<T: drm::Driver, C: DeviceContext = Normal> {
     dev: Opaque<bindings::drm_device>,
-    data: T::Data,
     pub(super) registration_data: UnsafeCell<NonNull<T::RegistrationData<'static>>>,
     _ctx: PhantomData<C>,
 }
@@ -322,16 +283,6 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::drm_device) -> &'a Self {
         unsafe { &*ptr.cast() }
     }
 
-    extern "C" fn release(ptr: *mut bindings::drm_device) {
-        // SAFETY: `ptr` is a valid pointer to a `struct drm_device` and embedded in `Self`.
-        let this = unsafe { Self::from_drm_device(ptr) };
-
-        // SAFETY:
-        // - When `release` runs it is guaranteed that there is no further access to `this`.
-        // - `this` is valid for dropping.
-        unsafe { core::ptr::drop_in_place(this) };
-    }
-
     /// Change the [`DeviceContext`] for a [`Device`].
     ///
     /// # Safety
@@ -448,14 +399,6 @@ fn drop(&mut self) {
     }
 }
 
-impl<T: drm::Driver> Deref for Device<T> {
-    type Target = T::Data;
-
-    fn deref(&self) -> &Self::Target {
-        &self.data
-    }
-}
-
 impl<T: drm::Driver> Deref for Device<T, Registered> {
     type Target = Device<T>;
 
@@ -527,62 +470,3 @@ unsafe impl<T: drm::Driver, C: DeviceContext> Send for Device<T, C> {}
 // SAFETY: A `drm::Device` can be shared among threads because all immutable methods are protected
 // by the synchronization in `struct drm_device`.
 unsafe impl<T: drm::Driver, C: DeviceContext> Sync for Device<T, C> {}
-
-impl<T: drm::Driver, const ID: u64> WorkItem<ID> for Device<T>
-where
-    T::Data: WorkItem<ID, Pointer = ARef<Self>>,
-    T::Data: HasWork<Self, ID>,
-{
-    type Pointer = ARef<Self>;
-
-    fn run(ptr: ARef<Self>) {
-        T::Data::run(ptr);
-    }
-}
-
-// SAFETY:
-//
-// - `raw_get_work` and `work_container_of` return valid pointers by relying on
-// `T::Data::raw_get_work` and `container_of`. In particular, `T::Data` is
-// stored inline in `drm::Device`, so the `container_of` call is valid.
-//
-// - The two methods are true inverses of each other: given `ptr: *mut
-// Device<T, C>`, `raw_get_work` will return a `*mut Work<Device<T, C>, ID>` through
-// `T::Data::raw_get_work` and given a `ptr: *mut Work<Device<T, C>, ID>`,
-// `work_container_of` will return a `*mut Device<T, C>` through `container_of`.
-unsafe impl<T, C, const ID: u64> HasWork<Self, ID> for Device<T, C>
-where
-    T: drm::Driver,
-    T::Data: HasWork<Self, ID>,
-    C: DeviceContext,
-{
-    unsafe fn raw_get_work(ptr: *mut Self) -> *mut Work<Self, ID> {
-        // SAFETY: The caller promises that `ptr` points to a valid `Device<T, C>`.
-        let data_ptr = unsafe { &raw mut (*ptr).data };
-
-        // SAFETY: `data_ptr` is a valid pointer to `T::Data`.
-        unsafe { T::Data::raw_get_work(data_ptr) }
-    }
-
-    unsafe fn work_container_of(ptr: *mut Work<Self, ID>) -> *mut Self {
-        // SAFETY: The caller promises that `ptr` points at a `Work` field in
-        // `T::Data`.
-        let data_ptr = unsafe { T::Data::work_container_of(ptr) };
-
-        // SAFETY: `T::Data` is stored as the `data` field in `Device<T, C>`.
-        unsafe { crate::container_of!(data_ptr, Self, data) }
-    }
-}
-
-// SAFETY: Our `HasWork<T, ID>` implementation returns a `work_struct` that is
-// stored in the `work` field of a `delayed_work` with the same access rules as
-// the `work_struct` owing to the bound on `T::Data: HasDelayedWork<Device<T, C>,
-// ID>`, which requires that `T::Data::raw_get_work` return a `work_struct` that
-// is inside a `delayed_work`.
-unsafe impl<T, C, const ID: u64> HasDelayedWork<Self, ID> for Device<T, C>
-where
-    T: drm::Driver,
-    T::Data: HasDelayedWork<Self, ID>,
-    C: DeviceContext,
-{
-}
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f6db91e81e79..7b76e6abed9f 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -106,9 +106,6 @@ pub trait AllocImpl: super::private::Sealed + drm::gem::IntoGEMObject {
 /// drm_driver` to be registered in the DRM subsystem.
 #[vtable]
 pub trait Driver {
-    /// Context data associated with the DRM driver
-    type Data: Sync + Send;
-
     /// Data owned by the [`Registration`] and accessible within a
     /// [`RegistrationGuard`](drm::RegistrationGuard) critical section via
     /// [`Device::registration_data_with()`](drm::Device::registration_data_with).
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index ed13e21d06cf..3a72fb21eeaa 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -589,8 +589,6 @@ mod tests {
 
     // The bare minimum needed to create a fake drm driver for kunit
 
-    #[pin_data]
-    struct KunitData {}
     struct KunitDriver;
     struct KunitFile;
     #[pin_data]
@@ -627,7 +625,6 @@ fn new(
 
     #[vtable]
     impl drm::Driver for KunitDriver {
-        type Data = KunitData;
         type RegistrationData<'a> = ();
         type File = KunitFile;
         type Object = Object<KunitObject>;
@@ -639,10 +636,9 @@ impl drm::Driver for KunitDriver {
 
     fn create_drm_dev() -> Result<(faux::Registration, UnregisteredDevice<KunitDriver>)> {
         // Create a faux DRM device so we can test gem object creation.
-        let data = try_pin_init!(KunitData {});
         let reg = faux::Registration::new(c"Kunit", None)?;
         let fdev = reg.as_ref();
-        let drm = UnregisteredDevice::new(fdev, data)?;
+        let drm = UnregisteredDevice::new(fdev)?;
 
         Ok((reg, drm))
     }

base-commit: e55a991e09e3b44f0b0d8206bb523dc57c086341
-- 
2.56.1

