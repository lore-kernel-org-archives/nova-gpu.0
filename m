Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FD055C1CF
	for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992780; cv=none; b=bu/39drpshTnkzqi+lhB/JEF0HAV3cen0s9ZKrdUPGxlO2BS+Wem2NoCQroDm4u/dEEJcK8HR+jCZRMNdK/5UOf+0ss8QZ1RxkwdGoUV0D0cwaus8eWKekNM/tFcdfgRNEN6cWRG6Kyj+I+hozkJvGIToJtBnlqheYpRKMHVm/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992780; c=relaxed/simple;
	bh=wz8QQ7DeWXQsVXbj0hmgPgxjX+r3acDRS4N1h+N0AKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smRbV2jFEzPoj5b/c43VryL0Z8Z0n8YjAvQFV+8SX9e7klbJOj9utrZy+0E0VRqr22YKrBmcuaNB3tKHcaSdKkh6SW4xyWlJt0ifr4mB8wo6xhpoqz5OnTakfN2K9ckscEoNGsF6XoaYqacj0lOdSbxx53vm+TSqwWmx5QHshjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNl0DbJN; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNl0DbJN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89e31e96173so165653b3a.0
        for <nova-gpu@lists.linux.dev>; Wed, 14 Oct 2026 08:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992775; x=1792597575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sy22pDYfeuvek64LZa9ynQRcmq/GB+YgHcRlx1f8W0A=;
        b=WNl0DbJNcGWCvB/OVbpmMppMk/qUXiB3rYcEdRbKzUuGBBjrtWhd2JdIKzvcrE25IT
         NFbIsavkOb9C8rA5ifvLHeibdOSrffQsAtNw3iv9BZJG6aHWYnzKifmH4VzeUEkRfT/l
         vBcQP/MxEbs21I4y6CGdcFZljg1wHGaCtxBalgil2z9s/0skgcXVswlDqgn+G60zSWcu
         Kd3wlDpJ+5K8BG1Hoau7wYbEPD/eQkgRqOUvUFDoqAm8ZfserA09mg8FU1lF0hzIIw3u
         NTaQF2sIx16S4/3BIV5kYrjE2ajHcH+zZQpfI5wB0iM0pYY5H7ujarHZExyFlrjTZLo4
         OxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992775; x=1792597575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sy22pDYfeuvek64LZa9ynQRcmq/GB+YgHcRlx1f8W0A=;
        b=jtDF6Mn/vIH8Brcbkcr7Cx2ncoXaaO4kt/PoUZoMAIQjU1jxv+jOx1ghCarGBLKyMM
         chdxwKoeWMYriLl/WxXSNw9vFgKx3Mj74y+Pn+skTA+/YPQEHr0o02F8xSyK3AB6qeBO
         +FsuTldCZKJMJ0LkA0PXHehXkwSfpTFfRCjx4Ea/e1k4l30wrzy+C/p/2/bVjVQWNsgx
         IN0jAUyxx6/7LxUrtGTj7M9L/ljLYJoOGPEXRDSB6QNsxChpKCQCF6vIUKNkOdv2zxZU
         tRBp8kePVIoWxFn/TA1ylunpzL6EOyEW+98408+/sf6J0jINUl1g8xu6cBDdolaapfc5
         tKgg==
X-Forwarded-Encrypted: i=1; AKwUvBzjCHyrielARea1vWtPImGkSR566ANaz+6RD+p/Gx6S2Xq6MO3GVM+DVU7tU2eCwlh9qF1g0tn30Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKs3Z5UmGm9HoOCXxMv8nx7p1sxyVRwR3QvpRpJ4yjZ3lwVAXOL
	gZveu2AzIVFG7eGprs5r3Q0bOqIAXzmaj5Y7t7VC4AgbgeWaCluEmVD6
X-Gm-Gg: AYBFou3r1nqwbc53XHXSRjUo+emp1oWscxNnjMUM8DQrpJklVaIlwl2feUKZXufWOXb
	TJsfcHgygc4MyeAlThJrFJesChT81NUE8iLPUwET9AJ/CeOjvoI5ibF1/1RbWlUIbzVD+brlIUM
	n2BCof1eadIlIc4ZHDSJanmMnL9fhOaA2+bHl+wVwzDolv4iz6RcrLp1lc+mX81eF3HSBxUPIAZ
	3R8qsucVbFU6zdkWTJQ4Zei3N4OA7pKZzfacXKdbEkonoDxiDkuNc6GqNS4EGW87NaKMVeuFHZv
	C5b9rEKDl4IBzjtrjevtcI+XY0EJpijIgr2K/hBkfVCEMErLq2DaszBkCH7A4yCs2F9VVN9go+z
	bGrz4by9afJS00s0PunzrT6OSZuLx0jxP/oi42HAyS2QqVkbXBJVjzdxvYhiQz0WC5d0J9LJW3k
	Hgimm1rU1EbAY5FEJ7F/WcfGc7bTtD2Nu4WnOGWvJcb6uXuxYTBnMeEHDV1i0HkDV6g33Nh64z/
	+xx
X-Received: by 2002:a05:6a00:22ce:b0:89d:7832:55f2 with SMTP id d2e1a72fcca58-89d78325697mr3135446b3a.36.1791992774636;
        Wed, 14 Oct 2026 08:46:14 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:14 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 1/3] gpu: nova-core: move the debugfs root into the module data
Date: Wed, 14 Oct 2026 22:45:52 +0700
Message-ID: <20261014154554.231015-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014154554.231015-1-vladazaharova2018@gmail.com>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The debugfs root lives in a static that init() fills in and a guard
field of the module data clears again. That costs a `static mut`, an
unsafe write on each side and a guard type whose only job is to undo
the write.

It also leaks. try_pin_init! drops only the fields it has already
built, and the guard is written after the Registration, so a
registration that fails leaves the guard unbuilt and the static set.
Statics are never dropped, and the module is unloaded right away, so
the directory outlives everything that could remove it. The next load
then finds the name taken: debugfs_create_dir() returns -EEXIST, which
Entry keeps as it would any other pointer, and the driver comes up with
no debugfs at all until the machine is rebooted.

Have the module data own a DebugfsData instead, built before the
registration and dropped after it, and keep only a pointer to it in the
static, for devices that have no other way to reach the data of their
module. What is left is one unsafe read for the users and a single write
when the data is built, with no guard type. A registration that fails
now drops the data that was built before it, and the directory goes with
it.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs       | 10 +---
 drivers/gpu/nova-core/nova_core.rs | 74 ++++++++++++++++++++++--------
 2 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index dda58095f40b..01ed4adffe93 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -199,15 +199,7 @@ pub(crate) fn new(
                         logrm,
                     };
 
-                    #[allow(static_mut_refs)]
-                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
-                    // after driver unregistration, so no probe() can race with its modification.
-                    //
-                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
-                    // registration and cleared after driver unregistration, so it is always
-                    // `Some` for the entire lifetime that probe() can be called.
-                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
-                        .expect("DEBUGFS_ROOT not initialized");
+                    let log_parent: &debugfs::Dir = crate::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..ee3a6600f320 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 use kernel::{
     debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -32,40 +33,75 @@
 
 pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+/// Pointer to the [`DebugfsData`] the module owns.
+///
+/// A device has no way to reach the data of its module, so code running on behalf of a bound
+/// device goes through here instead.
+///
+/// Written once, while the module data is built, and never again: what it points at is dropped
+/// only after the driver is unregistered, so it is good for as long as any device is bound, and
+/// is not read outside of that.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+/// Data the module shares with every GPU it drives.
+///
+/// Reached from a device through [`debugfs_data()`].
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the shared data.
+    fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
+    /// Returns the root directory of the driver in debugfs.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
     }
 }
 
+/// Returns the data the module shares with its devices.
+///
+/// The bound device is what makes this sound: the data is built before the driver is registered
+/// and dropped after it is unregistered, so it outlives every device that is bound, and the
+/// returned reference cannot be held past the one it is taken for.
+pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+    // SAFETY: A device can only be bound once the driver is registered, which happens after
+    // `DEBUGFS_DATA` is written, so it points at the data of this module, which lives at least
+    // as long as the caller's device is bound.
+    unsafe { &*DEBUGFS_DATA }
+}
+
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order, so the registration goes first and no probe() can
+    // still be running once the shared data is torn down. `init()` builds them the other way
+    // round, as the data has to be there before the first probe() reaches for it.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
 }
 
 impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
-        let dir = debugfs::Dir::new(c"nova-core");
-
-        // SAFETY: We are the only driver code running during init, so there
-        // cannot be any concurrent access to `DEBUGFS_ROOT`.
-        unsafe { DEBUGFS_ROOT = Some(dir) };
-
         try_pin_init!(Self {
+            _debugfs <- DebugfsData::new(),
+            _: {
+                // SAFETY: Nothing reads `DEBUGFS_DATA` before a device is bound, which cannot
+                // happen until the driver is registered below. What it points at is dropped only
+                // once the driver is unregistered, so it is valid for as long as any device is
+                // bound, and nothing reads it outside of that.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.56.0

