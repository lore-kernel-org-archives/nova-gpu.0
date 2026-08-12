Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F3435514
	for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534681; cv=none; b=lDXFpoFCEFG/JCPprFOYZ3T437t17AWQhsTHlWggZn77c0EThMgpo+hzdNDQJ2pFefpsc8t/9TNlrRVShotQmIWjJjS65LfinVSHanq0jRDhXjQq+4744QQUdFvGfIpf2Cb1GkPxN32sqQ1G2myWL9PQG2JuLx/G2OmMpx1phfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534681; c=relaxed/simple;
	bh=oS0PvTuqhyggOPjpWB6RbynlEDTPw38X+3MkNv2bAQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D27ujagHWHI1WAYppffhluxLbyVz+XoYwD9lQ9aDNH4Qo7Pkq0WiuDCKDWnDlGRggkTJ8FGt5phzQiDjS/a2yNpdAlEZQ6Ng87ZMDzVfHtGyvlqyjnCm7ZLBB0Z//3q3CKsTp73bSvWwX7BZmMsGWWyBvr1RgY0Bdxj5JS8WtrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqqsor8L; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqqsor8L"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c8dbf4f38so9035631fa.3
        for <nova-gpu@lists.linux.dev>; Wed, 12 Aug 2026 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786534676; x=1787139476; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Skc9TGm3BZ6lSzX6nd3YfhnaYDhv65XZP7LQD83XwFc=;
        b=Mqqsor8L/n2SR8CuSl2PRth1JH2f5Wjy3118EXVaWuE4Q0JcUohw7dMCw/pQwivo1W
         t7YXpemDWR9zzpooNqUUNIYh+B4S0qCRjYgzzvldT36fgj46o9XL+nco02qOfI53w1/g
         dYCdYdPyfLZ1uv5PpvZpI3OSsQA2Aea1yBJEGEVziEXT+AGEN8lwuiWGSE9UWxfpe5wy
         ILJhgRK3HfI5j1oG2SMyU21KZ9efxg137J//09mTkJ+OxxG2hMHo3BWDsK5YAdjpj4e9
         mPt7DCtYmTS9kqYFgGqsKuRv+8Ogz3PNHcgubQb84PESLyRmCO8cMg16fWOj+/WIHws0
         77Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534676; x=1787139476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Skc9TGm3BZ6lSzX6nd3YfhnaYDhv65XZP7LQD83XwFc=;
        b=sqK1qz6xoii3E8oVEi5je3DYjZr9my3HcoMfAA50hc0gg+iy84byOi3z8Jlhrq7XEC
         +SdKQ0tpoMOW3p5LR4c9+qgufRNJoI5SaxnagHpdblcH/+AGZiwq+x9ZKi7HpsewmDI1
         laPKMUhpYteEZIjz3xIJfuRKrLXdKIe9uZHFL/4IhGf0V0d407zw1bN71uN0agnpyt6Q
         MNaiItxZcBHfJiiVBac3I8QCne+RNlmTx8pQ62wM6guys2Idlbm7sL2eJKa2Ns8EHglo
         BfuC9mql2q4EjHhkC8fqwc7c0zutkU3QB+szI9HmFBpwKUq/g6I2KhbXOXbwFiqM5Vke
         mwXg==
X-Forwarded-Encrypted: i=1; AHgh+RoxxRXm2arNDSxdc3mrcpfmsUZidizUtSN8l/6hiyULCjM5WpixXy0K7irDQuvxCAqraHG9cZ/uIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF1acmG5ZiSyb2yiacjyWdr3qhAA11LtXEwa5PudRLMtV3Oe0d
	7kKSMSfEyOzWa8sSZun7w3gcctLbf482Sw/9LotwvrzKPiwJt8/pGp8a
X-Gm-Gg: AR+sD12p0CvJ+8GnTO/ZpuumEjKAb3y8e3FHI/ILvFsk9rBONiip4AL3bGMZpFukw7y
	KIFKgc/NwoFUYM5+j7GOY9iRHYfPxmEETRUqyG3LHttH4xyaQhTsHA9iJ3X07LAn7+UlWwD/DC3
	8qwbu6BuSPuDIPLHveRBXHa8ez0CpbN5eMQfSc2LbKAnohUvIMpS+RXpTM2XRUqG6OC4dd/Rsmx
	zTHuvRhhzA3l7ZPiC7pHPJumzS2W1b3/3V/7+22j0886zFj0d9lBm5xCs0Xjcq1txNceQ05bhbZ
	FhLeS0v5L2wzOMXQ/U7a1a96SlHN3JOy0XhQjHavzRIQCJCLxwMt79idEKjYpAAcnGcK9AjAAM5
	dxUDmzqyTX4RD0kjp/7AgzORCr3GnrD13jE32TV/b/goc1LLYwoHls01YsEhRr/SK4dML4TD5vL
	scWNN9sNpcnR9Ef/UCMaPwmrP5wG6Wodq7ak1UbUox95nDhV+IMYFWzq3vTmqjTH8M3xq4
X-Received: by 2002:a2e:bc87:0:b0:39a:d7f7:9818 with SMTP id 38308e7fff4ca-3a10d60670emr5040901fa.28.1786534676252;
        Wed, 12 Aug 2026 04:37:56 -0700 (PDT)
Received: from localhost ([176.210.177.198])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1082d11b9sm3881101fa.33.2026.08.12.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:37:56 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: aliceryhl@google.com,
	ttabi@nvidia.com,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Wed, 12 Aug 2026 18:37:51 +0700
Message-ID: <20260812113752.532537-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812113752.532537-1-vladazaharova2018@gmail.com>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the Scope that
owns them lives in Gsp, inside GspResources, inside the Gpu built by
probe(). They are DMA allocations of the device and cannot outlive it,
so the entries go away as soon as the GPU is unbound - and, more to the
point, as soon as probe() fails, which is exactly when the log of a GSP
that did not come up is the thing one wants to read.

Add CONFIG_NOVA_CORE_KEEP_GSP_LOGS. When it is set, dropping the log
buffers copies whatever the GSP wrote into memory owned by the module
and exposes the copies until the module is unloaded. A buffer whose
"put" pointer is still zero was never written to and is skipped.

nouveau does the same behind its keep_gsp_logging module parameter. It
recreates the entries under the name of the GPU that just went away;
nova-core places them in a "retained" directory instead, so that a
device coming back does not find its debugfs name taken by its own
history.

Tested on a GB203 (RTX 5080): the buffers survive both an unbind and a
failed probe, an older copy of the same GPU is replaced by the newer
one, and everything is released on module unload.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/Kconfig      |  18 ++++
 drivers/gpu/nova-core/gsp.rs       | 146 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |  19 ++++
 3 files changed, 183 insertions(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index f918f69e0599..d87c146f0f26 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -15,3 +15,21 @@ config NOVA_CORE
 	  This driver is work in progress and may not be functional.
 
 	  If M is selected, the module will be called nova-core.
+
+config NOVA_CORE_KEEP_GSP_LOGS
+	bool "Retain the GSP-RM log buffers after the GPU is gone"
+	depends on NOVA_CORE
+	depends on DEBUG_FS
+	help
+	  The GSP-RM log buffers are exposed through debugfs for as long as the
+	  GPU they belong to is bound to the driver. They are of most interest
+	  when the GSP fails to boot, but that is also when the driver tears
+	  everything down again, so the buffers are removed before anyone gets
+	  a chance to read them.
+
+	  Say Y here to copy the buffers into memory owned by the module once
+	  the GPU goes away, and expose the copies under a "retained" directory
+	  that stays until the module is unloaded. Buffers the GSP never wrote
+	  to are skipped; the rest cost 64 KiB each, for up to 192 KiB per GPU.
+
+	  If unsure, say N.
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 13f361406a6c..7e2aa2dfbea3 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,8 @@
 mod boot;
 mod hal;
 
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+use kernel::sync::aref::ARef;
 use kernel::{
     debugfs,
     device,
@@ -133,9 +135,30 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         Ok(obj)
     }
+
+    /// Copies the contents of this buffer into memory that does not belong to the device.
+    ///
+    /// A buffer the GSP never wrote to yields an empty vector, as it holds nothing worth keeping.
+    #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+    fn snapshot(&self) -> Result<KVec<u8>> {
+        // Offset 0 holds the "put" pointer, which the GSP advances as it appends entries. It is
+        // still zero if nothing was ever logged.
+        let put = io_project!(self.0, [build: ..size_of::<u64>()]).try_cast::<u64>()?;
+        if put.read_val() == 0 {
+            return Ok(KVec::new());
+        }
+
+        let mut snapshot = KVec::zeroed(LOG_BUFFER_SIZE, GFP_KERNEL)?;
+        io_project!(self.0, [build: ..]).copy_to_slice(&mut snapshot);
+
+        Ok(snapshot)
+    }
 }
 
 struct LogBuffers {
+    /// Device the buffers belong to. Also names their debugfs directory.
+    #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+    dev: ARef<device::Device>,
     /// Init log buffer.
     loginit: LogBuffer,
     /// Interrupts log buffer.
@@ -144,6 +167,127 @@ struct LogBuffers {
     logrm: LogBuffer,
 }
 
+/// Copies of the log buffers of a GPU that is no longer around.
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+struct RetainedLogBuffers {
+    /// Device the buffers came from.
+    dev: ARef<device::Device>,
+    /// Contents of the init log buffer, empty if it was never written to.
+    loginit: KVec<u8>,
+    /// Contents of the interrupts log buffer, empty if it was never written to.
+    logintr: KVec<u8>,
+    /// Contents of the RM log buffer, empty if it was never written to.
+    logrm: KVec<u8>,
+}
+
+/// Log buffers of GPUs that are gone, and the debugfs entries exposing them.
+///
+/// The copies live under a `retained` directory of their own instead of next to the entries of
+/// the GPUs that are actually bound, so that a device coming back does not find its name taken.
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+pub(crate) struct RetainedLogs {
+    /// Parent directory of all copies, created together with the first one.
+    dir: Option<debugfs::Dir>,
+    /// One entry per GPU.
+    gpus: KVec<Pin<KBox<debugfs::Scope<RetainedLogBuffers>>>>,
+}
+
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+impl RetainedLogs {
+    /// Creates an empty set of retained log buffers.
+    pub(crate) const fn new() -> Self {
+        Self {
+            dir: None,
+            gpus: KVec::new(),
+        }
+    }
+
+    /// Releases every copy and the directory holding them.
+    pub(crate) fn clear(&mut self) {
+        self.gpus.clear();
+        self.dir = None;
+    }
+}
+
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+impl LogBuffers {
+    /// Preserves whatever the GSP logged, so it can still be read once the GPU is gone.
+    ///
+    /// The buffers are DMA allocations of the device and cannot outlive it, so their contents are
+    /// copied into memory owned by the module and exposed through fresh debugfs entries. Those
+    /// live until the module is unloaded.
+    fn retain(&self) -> Result {
+        let logs = RetainedLogBuffers {
+            dev: self.dev.clone(),
+            loginit: self.loginit.snapshot()?,
+            logintr: self.logintr.snapshot()?,
+            logrm: self.logrm.snapshot()?,
+        };
+
+        if logs.loginit.is_empty() && logs.logintr.is_empty() && logs.logrm.is_empty() {
+            return Ok(());
+        }
+
+        let mut retained = crate::RETAINED_LOGS.lock();
+
+        // An earlier run of the same device may have left a copy behind. Its directory carries
+        // the name about to be used again, and its logs are the older ones, so drop it first.
+        retained
+            .gpus
+            .retain(|gpu| gpu.dev.name() != self.dev.name());
+
+        let dir = match retained.dir.clone() {
+            Some(dir) => dir,
+            None => {
+                #[allow(static_mut_refs)]
+                // SAFETY: `DEBUGFS_ROOT` is set before driver registration and cleared after
+                // driver unregistration. This runs while a device is still bound, or on the way
+                // out of a failed probe, so the driver is registered and nothing can be modifying
+                // it.
+                let root: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }.ok_or(ENODEV)?;
+
+                let dir = root.subdir(c"retained");
+                retained.dir = Some(dir.clone());
+
+                dir
+            }
+        };
+
+        let scope = KBox::pin_init(
+            dir.scope(logs, self.dev.name(), |logs, dir| {
+                if !logs.loginit.is_empty() {
+                    dir.read_binary_file(c"loginit", &logs.loginit);
+                }
+                if !logs.logintr.is_empty() {
+                    dir.read_binary_file(c"logintr", &logs.logintr);
+                }
+                if !logs.logrm.is_empty() {
+                    dir.read_binary_file(c"logrm", &logs.logrm);
+                }
+            }),
+            GFP_KERNEL,
+        )?;
+
+        retained.gpus.push(scope, GFP_KERNEL)?;
+
+        dev_info!(
+            self.dev,
+            "GSP-RM log buffers retained until the module is unloaded\n"
+        );
+
+        Ok(())
+    }
+}
+
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+impl Drop for LogBuffers {
+    fn drop(&mut self) {
+        if let Err(e) = self.retain() {
+            dev_warn!(self.dev, "failed to retain GSP-RM log buffers: {:?}\n", e);
+        }
+    }
+}
+
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
@@ -191,6 +335,8 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                 },
                 logs <- {
                     let log_buffers = LogBuffers {
+                        #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+                        dev: dev.into(),
                         loginit,
                         logintr,
                         logrm,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..59146450ab7b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -30,11 +30,23 @@
 // TODO: Move this into per-module data once that exists.
 static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
 
+#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+kernel::sync::global_lock! {
+    /// Log buffers of GPUs that are gone, kept around until the module is unloaded.
+    // TODO: Move this into per-module data once that exists.
+    unsafe(uninit) static RETAINED_LOGS: Mutex<gsp::RetainedLogs> = gsp::RetainedLogs::new();
+}
+
 /// Guard that clears `DEBUGFS_ROOT` when dropped.
 struct DebugfsRootGuard;
 
 impl Drop for DebugfsRootGuard {
     fn drop(&mut self) {
+        // Retained log buffers own debugfs entries below `DEBUGFS_ROOT`, so they have to go away
+        // before it does.
+        #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+        RETAINED_LOGS.lock().clear();
+
         // SAFETY: This guard is dropped after `_driver` (due to field order),
         // so the driver is unregistered and no probe() can be running.
         unsafe { DEBUGFS_ROOT = None };
@@ -54,6 +66,13 @@ impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         let dir = debugfs::Dir::new(c"nova-core");
 
+        // SAFETY: Module initialization runs exactly once, and before the driver is registered,
+        // so no probe can have touched `RETAINED_LOGS` yet.
+        #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
+        unsafe {
+            RETAINED_LOGS.init()
+        };
+
         // SAFETY: We are the only driver code running during init, so there
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
-- 
2.55.0

