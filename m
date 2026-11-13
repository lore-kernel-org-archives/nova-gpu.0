Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556419;
	b=LIzcEcMZIYgMPWcixTwZtp/psjTeHP1wc/zOXkrCa5d1B61+B7db01J8zeIbehv0tcHK
	 QD2JpScObhmDoYyD2/z+bC4HiNRpIhWi40qPnEcinVKPZ+e+R7VFWwEAVYMLryvU+0VWk
	 6u/XK/IPFimNF6MSiEb5VNar7kMN7fnxnbv0BMQC711fq3W5MiznQla2DOSCfkbexElFG
	 KZymFYmgRk9/v+O1R8ciSGX4FIGmBH/ATfeMDtbAEGtrtvR2IED4swhd59DiOeDXEV3tK
	 sjN7mjFPcJHB3l3pQvqjKoKwDuMlkShe6SLSxuQWS5+i/lEq40WXn4ne/zSxRH8gz6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
	b=XR38FdSFuTewnCP9juXUuMPX8FpjG5nzbjXtXVRRtDOIfTqoW8Z+Djo4rHDR1+bVAc7y
	 W7el7we7EHGcMYa7NAd0YBddGIqc6WhGDS6CFLpEEhQ4m570fapNKXUvKE42YOwyXKFlu
	 2BPyeikYwfnlJI5xPmgg5WNySQuFYXjw1lZxsstCwM0tcpJAWN1HgeTbASCXegWVelLB4
	 6pZ8YKWFenbDIq8/vVd7sA/G3ZzOcJzDHHC7W3CyoWESior3e/q7UWagPFyqUCGZn8RcG
	 NKh9uG5jsBzMDibaJvi2hzntjqGxhroz+z2N7qn4l/BSipYObFG9xr9UHx/Uqx/AT+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2adBRzK;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75196606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75196606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2adBRzK
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b17cf2fa0aso1402115a91.0
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556419; x=1795161219; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=o2adBRzKt8vkz6W57cc5ffoBrMvkrRFacXuHMg/o0fWa6VE8cvn1xfyH2T1abcV5iG
         DQgLkSUaFFS84DdbbjZUfZMu+8VCDBnKkoQ7KKjnGJNLN+GKMDI8ngrs5OyJkZ3h1GiZ
         YadU1EzZAlqlnk69G5rHHtOO/ylqN0d26UTmNWL379OCWmtbFapBFNUhkZyZ2GPRp8Fs
         9ZzNRV+K+0zYfk0m4rarrD0u+VabPdGRLMV6GCGzFDNOSwVU+MbdS8vH56uHFGTABu/q
         eZzHitM1Zvm58+MP9wdWh1exDFOJg3xChDKNQhJLIeXodY3fd33lnXIzpCZXQE8DHZ66
         KbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556419; x=1795161219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwU7tBpZX44iULEudpXOZjxGHCjhyfh7bS2JLZeD11k=;
        b=wj2qoWCSgqRx+Ty6DRir88TNWMlvTQkOPMFQqpGBH6QvJOPIW4iOSykV9d8luI+oc4
         iH99OtcCivsx0ypT6PwRyw0bMNgueUNvxIgfNfkLbEba4J3yftQ2eI105g+QKJRnElYz
         CeDbDD/G2dGX3br40FVUg78BNZy5MICTowTFB15+Ghhge9eRZmFULntkIDMAB4SXkFih
         vpRjnXS7zqKqLYE7/m7ieYuA9nQHceunSQLJ53LE0zDWl054vq4WHQIkkUfDCGMI9vRD
         aLD95+RvDOi9RKBZ6SQ7Jw8PKjQ/rFY1iwzM7XUcdrRj5I6AErbCY/vRk7PWzAkvbdYm
         etxg==
X-Forwarded-Encrypted: i=1; AL+hErGnfmBQ8o3f8o8E2xViq15BtjgNnnC7f+9VdviYxkFlY0PIQEd8e1w9kv08ZOSD7Lu+t9Zk3UjeVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+dESL4IpZkQLNqddReTgJn48LwEosSf1Wshp6xeFlblu64zIpO
	zqoaQXRun1WWBewQsb4wjF9tM2Q1LK3he62jD4ckcUxjgXF9AzH7BFpC
X-Gm-Gg: AYBFou00iEU43EncohUtP4WBkS6EpZV4eYPDO0C0Gjy9h+YwVA0bLyvHEm0ls6TaKy5
	HbkuItNbZOCev0nKcsb027DT9eDW47zUFjAFk4Ui4Tj2Xptl3jgj6ZSQi52c7dybpqxBv+olIlL
	pfBUEwQBrhAy5GJRZ3llcnWIliCfoRrX4LsHq2jb2xBKvsYYatJ0JmSNB4HMfM5OmzQGm3cjP1+
	JYuyAcluZfAmmaXvPvGMMDy9+5XfWrl8n5msrFn3DVWCrS1BFx3hnSfVvw2iZE2T5ENK/yZI5IN
	JRFWdUbE8d635fnHe5tBEOCnXbVKuPzlMHO8vYnAoxCvb3FfItCpbWcNo7sdr/rJvz4tgASNmE2
	BNf0n9V44MZL9LFfaU42gYqzuiosnhLjSRSxhvRE+4U/cc5PcWztaSH6oBwMJaKoBvAFYVhhWlQ
	rXa4hkYEzP88wdnQTDP/CLkE2Nxo2t6mXBnrE35fQNNkJT/1S2yg518Q1xK9hlQLkyrzN0JnDkd
	v7p8ui8mlQtRL/qg/XuooypArJwf4kkWudjuuBXDMOh2mmlnwSkriq43SI2MHtBOHVTUis6hIdI
	skDgvAqGsYdOj94QUOoy6LR/1/TrtOTwm8/45fBkNhSknwQ+0ZTSuJ1e
X-Received: by 2002:a17:90b:3808:b0:3a0:ca1d:b40d with SMTP id 98e67ed59e1d1-3b1b0d08ec9mr1691398a91.55.1794556418764;
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:38 -0800 (PST)
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
Subject: [PATCH v7 1/4] gpu: nova-core: move the debugfs root into the module data
Date: Fri, 13 Nov 2026 14:53:14 +0700
Message-ID: <20261113075317.934264-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113075317.934264-1-vladazaharova2018@gmail.com>
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
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

