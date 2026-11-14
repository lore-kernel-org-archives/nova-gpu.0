Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631404;
	b=jVsxWi3pJBS60dLwmCiEjvrIWuGu92BXXR50GsLYf/man6OwL4fUHM0FelCvQOsjgYIf
	 c2vG4sllcf0RMKpMJFfIg+e8ePLVoU51a2kcScnbP6X5cr+T6BE1Mb79Km2oV2Dwk4xDr
	 XWAD8tUvd8q1FuaxMTmwIt2Z06/6vRe5JWKq/fsZPcsP9m8o7Tu/Hc2ty6/nKl4gJ2uzd
	 F4xeP0RF/ECQ0DKOlJtlVUS8iCnrTnlGTdmxBrQq8v/RgG0lqurnjmh0y1k054mtEvOwE
	 F3n8OzP3PKvur95thb6LfR9gl5Mo4UMoqFBswEW4KjZeEOEe4v2153bxMuuSowkg4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
	b=DmpTuk7/PtU60EVWKPFSyRLLAnP+NpYMORk1fPEzQzpY83T8+QHBJjg76xXrSx2+jrrQ
	 4+pjnOUG3M03DufHOH6y32LiYhPcRMoJxzufJ0Be7wAaJS9iB8F5Uoyuo/YLekX95NBxy
	 faLJ5Hhpu5kaqwTTyYxIThv3imI3FVST1lCCWD4OkeK4WbfuvJJPgbPdGzK81OGkWe3q8
	 UwoDaj7LfimwipjAIy+tMFuRuYx97sVUTuhKDGAopHr33Fm6glmKW4cbuR3eKmFICRmr8
	 UMj1E1G451exNxHHt73AVT32tyXaG7n1Jfj4aN9jgDByqzcu1XNoMOFGKKiq/2KqN9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNrILM1o;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A632606A32E
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A632606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNrILM1o
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso662116a12.3
        for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 20:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631403; x=1795236203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
        b=pNrILM1oEb7edKS2X1hP5mtKyYXPUgtArbVNbNAdQ/PHEOdSNTsgPWti9O7aivSalt
         /JgseFQNIovZQymiNaH9f+cKgMTT9tyh5KKqlNPHhkYjDJvGCHYhfp0ET/LmfAkeKHoO
         V56unqQ0iU0hhqqB3CP1tZb+yv2FhjgmHPELKk7VsasosfiEDNq7wi6PXLXQK+GxPNGn
         rPa7jiyLeAmKBjmpTYdfJX0uv3cmECxachAZVTSy8PfT5abvuSEyyEmBg33tgUcfGoXb
         mSpNcn9XfLHNt6tVjPqDascUqCysIG5yf3BcWqNLXF/NryxUM4/7SeD/tt0yoUGaZYW5
         Y75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631403; x=1795236203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfARJ3dPkm65eyZHkZTOuZn9KRZO6mvdFKT062tV4Mc=;
        b=Q7hoeKKNBMqxAh7HxSSSA8MMrOAG5KEoFS5V+lJZuGqghRWN0NiUyS1RmCKARKgVZ0
         vl49EpnQpjwmbCli9WujQzGUPC/dSRKEk1USU4d4V64QAkyPt95XjSuUMZeQ+4HN6YO2
         5wFagO4XzWJpVrHfE+55oIEl/mY9/R1ZzctW1CWlG65+b0VmgveuHTA1ZzVEU8ZnDoE8
         xO9vfq50wSBy9D7TwIXT6wqEJV6lV2hbCrvI8BRBkU6Pn+rFazyy6atO5scfZgN0s/9n
         tJ12YlXe6Qw31dlVJUYmU8tsfzmuOj2Rl0xTVuoae6Ni8CWgU9XxCrEM7cjteD7KVPlL
         L6aQ==
X-Forwarded-Encrypted: i=1; AL+hErFxiv4EfGu2w2MTxYRJD3PZ1kieUDhaYQ5X7byJVaL6N2iK5tug/smppLnXFGbeaX8Cg8ryACX0Cg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+df4Y+vEcUomhyDNlsrJGK1sI+kpXQe9K7GgZE0AKxBwNkGDvd
	mKSi6uX819M2y8HKvY/p+PPS1zofhKilVID4GFW4o3YMZQAoYrOpLnac
X-Gm-Gg: AYBFou2AnYKsKg2fcumwgPzLIWflhKfEN1ZksScL5j/+2WEpyyJrBO9gcrgBryGLmr+
	nHDfRBfFKIy89qIakkU1tLJyHkt3hmF28nIdRAkN18nV9HVzuZQt4P+MftAJIjklUlPf3LNk5Yv
	//ZAM4DAmQBC/euofsmsB4XFwtQKvOZUNmnidbiaWKIF4357gWOgs7p/7eYZIlX7cIT9JdjiX1s
	BqjJbWztwMUCvOvnTF+k5u+DSNkJryctOUUcj4zgrYrOJdFqIgrki5sARKbQxZoUkGX3aAKHG32
	b1HSVsiMN0WVpvgUs6/zBDBo0uJce6oNOrg58lEJIyt5xPrXxKw8EdHhVX4lMbxO7ybLlWwSaM8
	ofJNrknofAm9uQMGW09khes4QE/YhUpNRwRmtO5/vtQsdTzSQiSc/z8mgnC4USeMBSsXnhuSu6a
	cifs8N8VUy4aI3VfJUjKZxa/y7PjCFEBfABPxI2auvWW7JYt1DT42ctZQ3kokyfR9MXT3UC9xZo
	qErYC0lMF75HtHkyHX2Pmjgv8v0oXvuWf5bBtcJUStXyF8FJj6XMIEfU3AfRENIzLuprGxf0YlC
	xeDUESaaGFTLZQPEQgx3/kphOPNMjtcYSTM=
X-Received: by 2002:a17:90b:5703:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3b1b0b659b2mr4801830a91.56.1794631403381;
        Fri, 13 Nov 2026 20:43:23 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:22 -0800 (PST)
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
	vladazaharova2018@gmail.com
Subject: [PATCH v8 1/4] gpu: nova-core: move the debugfs root into the module data
Date: Sat, 14 Nov 2026 11:43:01 +0700
Message-ID: <20261114044304.245684-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114044304.245684-1-vladazaharova2018@gmail.com>
References: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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

The debugfs root lives in a static that is cleared by a guard field of
the module data. The guard is built after the driver registration, so if
the registration fails, the root is never removed and the next module
load finds the name taken.

Move the root into a DebugfsData owned by the module data, and keep only
a pointer to it in the static, for devices that cannot reach the module
data yet. If the registration fails, the root is dropped with the rest
of the module data.

Fixes: 09691f5d8070 ("gpu: nova-core: create debugfs root in module init")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/debugfs.rs   | 29 ++++++++++++++
 drivers/gpu/nova-core/gsp.rs       | 11 +-----
 drivers/gpu/nova-core/nova_core.rs | 62 ++++++++++++++++++------------
 3 files changed, 69 insertions(+), 33 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs

diff --git a/drivers/gpu/nova-core/debugfs.rs b/drivers/gpu/nova-core/debugfs.rs
new file mode 100644
index 000000000000..6c6ed129f0da
--- /dev/null
+++ b/drivers/gpu/nova-core/debugfs.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Debugfs data shared by all GPUs of the driver.
+
+use kernel::{
+    debugfs,
+    prelude::*, //
+};
+
+/// Debugfs data the module shares with every GPU it drives.
+#[pin_data]
+pub(crate) struct DebugfsData {
+    /// Root directory of the driver in debugfs.
+    root: debugfs::Dir,
+}
+
+impl DebugfsData {
+    /// Creates the debugfs data of the module.
+    pub(crate) fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            root: debugfs::Dir::new(c"nova-core"),
+        })
+    }
+
+    /// Returns the root directory of the driver.
+    pub(crate) fn root(&self) -> &debugfs::Dir {
+        &self.root
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a4b832f6aec1..79ee74a0a16f 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -200,15 +200,8 @@ pub(crate) fn new(
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
+                    let log_parent: &debugfs::Dir =
+                        crate::NovaCoreModule::debugfs_data(dev).root();
 
                     log_parent.scope(log_buffers, dev.name(), |logs, dir| {
                         dir.read_binary_file(c"loginit", &logs.loginit.0);
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index a8f6dc22057b..f5d08de8a212 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -3,7 +3,7 @@
 //! Nova Core GPU Driver
 
 use kernel::{
-    debugfs,
+    device,
     driver::Registration,
     pci,
     prelude::*,
@@ -11,6 +11,7 @@
 };
 
 pub mod api;
+mod debugfs;
 mod driver;
 mod falcon;
 mod fb;
@@ -30,42 +31,55 @@
 mod vbios;
 mod vgpu;
 
-pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
-
-// TODO: Move this into per-module data once that exists.
-static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
+use debugfs::DebugfsData;
 
-/// Guard that clears `DEBUGFS_ROOT` when dropped.
-struct DebugfsRootGuard;
+pub(crate) const MODULE_NAME: &core::ffi::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
 
-impl Drop for DebugfsRootGuard {
-    fn drop(&mut self) {
-        // SAFETY: This guard is dropped after `_driver` (due to field order),
-        // so the driver is unregistered and no probe() can be running.
-        unsafe { DEBUGFS_ROOT = None };
-    }
-}
+/// Pointer to the [`DebugfsData`] of the module.
+///
+/// A device currently has no way to reach the data of its module, so it goes through here.
+///
+/// # Invariants
+///
+/// - Only written once before the driver is registered.
+/// - Points to a valid [`DebugfsData`] for as long as the driver is registered.
+// TODO: Drop this once devices can reach the data of their module.
+static mut DEBUGFS_DATA: *const DebugfsData = core::ptr::null();
 
 #[pin_data]
 struct NovaCoreModule {
-    // Fields are dropped in declaration order, so `_driver` is dropped first,
-    // then `_debugfs_guard` clears `DEBUGFS_ROOT`.
+    // Fields are dropped in declaration order. `_driver` must be dropped before `_debugfs` to
+    // uphold the invariant of `DEBUGFS_DATA` that it remains valid for as long as the driver is
+    // registered.
     #[pin]
     _driver: Registration<pci::Adapter<driver::NovaCoreDriver>>,
-    _debugfs_guard: DebugfsRootGuard,
+    #[pin]
+    _debugfs: DebugfsData,
+}
+
+impl NovaCoreModule {
+    /// Returns the debugfs data of the module.
+    pub(crate) fn debugfs_data<'a>(_dev: &'a device::Device<device::Bound>) -> &'a DebugfsData {
+        // SAFETY: `_dev` is bound, so the driver is registered. Per the invariants of
+        // `DEBUGFS_DATA`, the pointer is thus valid and not being written to. The `'a` lifetime
+        // ensures that the returned reference cannot outlive the bound device.
+        unsafe { &*DEBUGFS_DATA }
+    }
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
+                // SAFETY: The driver is not registered yet, meaning that no device can be probed
+                // and thus nothing can access `DEBUGFS_DATA` concurrently.
+                //
+                // INVARIANT: `DEBUGFS_DATA` is written before the driver is registered below and
+                // points to `_debugfs`, which is pinned and dropped after `_driver`.
+                unsafe { DEBUGFS_DATA = &*_debugfs };
+            },
             _driver <- Registration::new(MODULE_NAME, module),
-            _debugfs_guard: DebugfsRootGuard,
         })
     }
 }
-- 
2.56.0

