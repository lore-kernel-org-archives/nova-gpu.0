Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943D3F1AC0
	for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 07:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197533; cv=none; b=W1tdmfw4vmDwYL7yZCqu+kRajSILOTA1mh6PG1BqdpigS2tB0WphVOZ4MKc6ZdsEwdbSFkGTE6W0wGJMt3vNK81eZdB9KQtfwV3IqLTrMpKDDJBnVYIh/0WG0yJ/NB7rgMV0Eiv0iJWbIW1tU2/PU6EKC+82BK4ZY4RtFlfsBwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197533; c=relaxed/simple;
	bh=XxXI80OwyGmv4bN+rIUNOLMs3E0LrjiW4rPKyX782Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZRs/4SS+VlI4tMlTnbWYwC3O7zd2OO6tfMROR51LyaiXJr14KPq/eJ+kYXRrC0WKCuM9dyT0EYgbSVxft2xQKFbkIZyPgxW84s8fnzAetyTz/t0Xg6IUSmFKUjJd8njffJIZG2LT26gNa0cb6wLqjGvZV5k9Ptg5kG77ks0RN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VMYOpiWT; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VMYOpiWT"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso334117e87.1
        for <nova-gpu@lists.linux.dev>; Sat, 12 Sep 2026 00:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197528; x=1789802328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uM5UvQub7UUt4dzxjz2gzlJaZCMP9QvmISolGD0vvk=;
        b=VMYOpiWTSIbV1xCOpmrUdgNBvUd2KoTWIxGDh3k/7Pa1t/fQw3FAABilIISqzAgDyU
         N9OmvhvuNEmkO17cXqSRC/+sv9tT727wd31cRcqQPL2483xYN0nTrwmkV/FaAmmHb0Tm
         hzmU0mteJyecf8NST/RLCWp9py8aR5klYyOIFbxSDup//fZf505GzosvzdXRtR47hvPx
         t+7TCBk0wDx1V8sArHGZVVGVr7AJoa77AtWcZ2LZpzLGuvdJ96F62PU5JnhIsqFaP/fj
         U5BH1TMndV6E7s/FHgq79lu8zqT8jtQtCXm2eLfeCTUIwb2lA+8IfunQdkRtEvq9q2Zv
         V+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197528; x=1789802328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uM5UvQub7UUt4dzxjz2gzlJaZCMP9QvmISolGD0vvk=;
        b=YVevmn8m+EvByd0B3OM3EebGMXepEzn0xQx2t8JIBXwytoRSP/fsKM6lRxpapVljAH
         XPgPpF92rkNbMmdH3w9FM0QqJiAmPBVQQi44L1gxKk/vIIEMvnifRAOEwhfXqkOIcIq/
         ZB2Ydb2Q6J8CrY2jqBu+PGgHgImPWEQgN54c/Wm0NZDRoyXL4KTPyprYafLujhQojnSr
         WNybQI+UdfyMFT35kv0kwDMOgtQvHGDoS4/95BHqW2TAb3fM3Z4KS04Lw5fejg2z/5e2
         Kt015KmWBloOiYSXaAHTdYPIthRQjDOZ7GHAwxjXFIDUhHLF55L9tztLq7+TrGYckYuS
         gJ8Q==
X-Forwarded-Encrypted: i=1; AKwUvByepN+/Hj/bCXV1Amh1nLGpMo5sTP3EXp8D5HS1IlKL+OJLfpyEPegq2Iep5Frl6dl7PZzOT7k2Qw==@lists.linux.dev
X-Gm-Message-State: AFuF++l//L8DO9bRWKm6w98G9pGBHLGosZEDr6TrZx+ulQN2q6rsw2lD
	OmrGjsWW/dV/ABgnVMDisgBPqNI5dkZcQ7Pq/HVmV4GNPrtU7xUQ5VnI4+S0IE/1V7e+xw==
X-Gm-Gg: AYBFou22qbsZcQcq5U1ftCcMtHu7o7juId7TpP0jEFGCRIkxH2U5SCFhZdW5xHisZd1
	s2R6H9FaiQfYg/+lq94FLGprrErD53JwcV3c+xjxptiKqSKkE2ab5QNZpBWticYcFCTO5H0wvW5
	8aLKpeFDMwDE5GPaqnNhBqMDPLdlmsMUVmagY10SqfokHujnopb9Xp6RFYZbvfRuYYOYLWYIIfz
	HdnZvhdCKeKvKBp+PvWkipchWCuT/t1dhf7I3ztOj29ytv45jYt+Dy2UOIpx4/AKyI6tmR1k3gE
	KR7NBCHovHv/TdV4ZoxQRHrcPOZIUPSw/iHguJD2t2k8stCD1e6UfiTL4pJXt0+B+8o6ASAgfF1
	kvFAAyrS8pR/5GvMB2+Vg9bBNxvXHPvbsu3nefOCNEL9HXpkTpAkakgafKMkr7/BqscvDnnyhKd
	vnJFj9hJm/+XhFQvY0TNr2Tkh+yKepW1QnOeVrbnd38FLRFa1WllxPjzi0JFZHl4vHMztK2N3QQ
	TDmTZ5j0T8PgGPM
X-Received: by 2002:a05:6512:15a0:b0:5b6:180e:3d6d with SMTP id 2adb3069b0e04-5b8a8ebe61fmr274523e87.9.1789197527758;
        Sat, 12 Sep 2026 00:18:47 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:47 -0700 (PDT)
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
Subject: [PATCH v3 2/3] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Sat, 12 Sep 2026 14:18:41 +0700
Message-ID: <20260912071842.622696-3-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912071842.622696-1-vladazaharova2018@gmail.com>
References: <20260912071842.622696-1-vladazaharova2018@gmail.com>
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

Add a gsp_keep_logs module parameter. When it is set, dropping the log
buffers copies whatever the GSP wrote into memory owned by the module
and exposes the copies until the module is unloaded. A buffer whose
"put" pointer is still zero was never written to and is skipped.

The GSP has normally been stopped by the time the buffers are dropped,
but a boot that timed out can leave it still appending, so a DMA read
barrier orders the read of the "put" pointer before the copy.

The copies live in a "retained" directory, created during module init
rather than on first use, which keeps the teardown path from having to
reach for DEBUGFS_ROOT. Keeping them out of the directory used by bound
GPUs also means a device coming back does not find its debugfs name
taken by its own history; nouveau, which recreates the entries under the
name of the GPU that just went away, has that problem.

While at it, move the log buffer code out of gsp.rs into gsp/logbuffer.rs.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs           | 100 ++-------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 267 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  32 ++-
 3 files changed, 315 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25ea43f1cbe9..1a1eb7f37075 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -12,11 +12,7 @@
         CoherentView,
         DmaAddress, //
     },
-    io::{
-        io_project,
-        io_write,
-        Io, //
-    },
+    io::io_write,
     pci,
     prelude::*, //
 };
@@ -24,9 +20,13 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod logbuffer;
 mod regs;
 mod sequencer;
 
+use logbuffer::LogBuffers;
+pub(crate) use logbuffer::RetainedLogs;
+
 pub(crate) use fw::{
     GspFmcBootParams,
     GspFwWprMeta,
@@ -77,10 +77,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
     }
 }
 
-/// Number of GSP pages to use in a RM log buffer.
-const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
-
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
 #[derive(FromBytes, IntoBytes)]
@@ -101,49 +97,6 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
     }
 }
 
-/// The logging buffers are byte queues that contain encoded printf-like
-/// messages from GSP-RM.  They need to be decoded by a special application
-/// that can parse the buffers.
-///
-/// The 'loginit' buffer contains logs from early GSP-RM init and
-/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
-/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
-///
-/// The physical address map for the log buffer is stored in the buffer
-/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
-/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
-/// then pp points to index into the buffer where the next logging entry will
-/// be written. Therefore, the logging data is valid if:
-///   1 <= pp < sizeof(buffer)/sizeof(u64)
-struct LogBuffer<'a>(Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
-
-impl<'a> LogBuffer<'a> {
-    /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
-        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
-
-        let start_addr = obj.0.dma_address();
-
-        let pte_view = io_project!(
-            obj.0,
-            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
-        )
-        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
-        PteArray::init(pte_view, start_addr)?;
-
-        Ok(obj)
-    }
-}
-
-struct LogBuffers<'a> {
-    /// Init log buffer.
-    loginit: LogBuffer<'a>,
-    /// Interrupts log buffer.
-    logintr: LogBuffer<'a>,
-    /// RM log buffer.
-    logrm: LogBuffer<'a>,
-}
-
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp<'gsp> {
@@ -165,9 +118,7 @@ pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self,
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
+            let log_buffers = LogBuffers::new(dev)?;
 
             // Initialise the logging structures. The OpenRM equivalents are in:
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
@@ -182,36 +133,23 @@ pub(crate) fn new(pdev: &'gsp pci::Device<device::Bound>) -> impl PinInit<Self,
                         GFP_KERNEL,
                     )?;
 
-                    libos.init_at(0, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0))?;
-                    libos.init_at(1, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0))?;
-                    libos.init_at(2, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
+                    libos.init_at(
+                        0,
+                        LibosMemoryRegionInitArgument::new("LOGINIT", &log_buffers.loginit.0),
+                    )?;
+                    libos.init_at(
+                        1,
+                        LibosMemoryRegionInitArgument::new("LOGINTR", &log_buffers.logintr.0),
+                    )?;
+                    libos.init_at(
+                        2,
+                        LibosMemoryRegionInitArgument::new("LOGRM", &log_buffers.logrm.0),
+                    )?;
                     libos.init_at(3, LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
 
                     libos.into()
                 },
-                logs <- {
-                    let log_buffers = LogBuffers {
-                        loginit,
-                        logintr,
-                        logrm,
-                    };
-
-                    #[allow(static_mut_refs)]
-                    // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
-                    // after driver unregistration, so no probe() can race with its modification.
-                    //
-                    // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
-                    // registration and cleared after driver unregistration, so it is always
-                    // `Some` for the entire lifetime that probe() can be called.
-                    let log_parent: &debugfs::Dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }
-                        .expect("DEBUGFS_ROOT not initialized");
-
-                    log_parent.scope(log_buffers, dev.name(), |logs, dir| {
-                        dir.read_binary_file(c"loginit", &logs.loginit.0);
-                        dir.read_binary_file(c"logintr", &logs.logintr.0);
-                        dir.read_binary_file(c"logrm", &logs.logrm.0);
-                    })
-                },
+                logs <- log_buffers.scope(),
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/logbuffer.rs b/drivers/gpu/nova-core/gsp/logbuffer.rs
new file mode 100644
index 000000000000..22c47f199169
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP-RM log buffers, and the debugfs entries exposing them.
+
+use core::convert::Infallible;
+
+use kernel::{
+    debugfs,
+    device,
+    dma::Coherent,
+    io::{
+        io_project,
+        Io, //
+    },
+    prelude::*,
+    sync::{
+        aref::ARef,
+        barrier::{
+            dma_mb,
+            Read, //
+        }, //
+    }, //
+};
+
+use crate::gsp::{
+    PteArray,
+    GSP_PAGE_SIZE, //
+};
+
+/// Number of GSP pages to use in a RM log buffer.
+const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
+const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
+
+/// The logging buffers are byte queues that contain encoded printf-like
+/// messages from GSP-RM.  They need to be decoded by a special application
+/// that can parse the buffers.
+///
+/// The 'loginit' buffer contains logs from early GSP-RM init and
+/// exception dumps.  The 'logrm' buffer contains the subsequent logs. Both are
+/// written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
+///
+/// The physical address map for the log buffer is stored in the buffer
+/// itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+/// Initially, pp is equal to 0. If the buffer has valid logging data in it,
+/// then pp points to index into the buffer where the next logging entry will
+/// be written. Therefore, the logging data is valid if:
+///   1 <= pp < sizeof(buffer)/sizeof(u64)
+pub(super) struct LogBuffer<'a>(pub(super) Coherent<'a, [u8; LOG_BUFFER_SIZE]>);
+
+impl<'a> LogBuffer<'a> {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
+
+        let start_addr = obj.0.dma_address();
+
+        let pte_view = io_project!(
+            obj.0,
+            [build: size_of::<u64>()..][build: ..RM_LOG_BUFFER_NUM_PAGES * size_of::<u64>()]
+        )
+        .try_cast::<PteArray<RM_LOG_BUFFER_NUM_PAGES>>()?;
+        PteArray::init(pte_view, start_addr)?;
+
+        Ok(obj)
+    }
+
+    /// Copies the contents of this buffer into memory that does not belong to the device.
+    ///
+    /// A buffer the GSP never wrote to yields an empty vector, as it holds nothing worth keeping.
+    fn snapshot(&self) -> Result<VVec<u8>> {
+        // Offset 0 holds the "put" pointer, which the GSP advances as it appends entries. It is
+        // still zero if nothing was ever logged, which is all that is tested here: a buffer that
+        // was written to is copied whole, and making sense of "put" is left to the decoder.
+        let put = io_project!(self.0, [build: ..size_of::<u64>()]).try_cast::<u64>()?;
+        if put.read_val() == 0 {
+            return Ok(VVec::new());
+        }
+
+        // ORDERING: LOAD->LOAD ordering needed to order the "put" read before the data read. The
+        // GSP has normally been stopped by the time this runs, but a boot that timed out can leave
+        // it still appending.
+        dma_mb(Read);
+
+        let mut snapshot = VVec::zeroed(LOG_BUFFER_SIZE, GFP_KERNEL)?;
+        io_project!(self.0, [build: ..]).copy_to_slice(&mut snapshot);
+
+        Ok(snapshot)
+    }
+}
+
+/// The log buffers of a GPU, for as long as it is bound to the driver.
+pub(super) struct LogBuffers<'a> {
+    /// Device the buffers belong to. Also names their debugfs directory.
+    dev: &'a device::Device<device::Bound>,
+    /// Init log buffer.
+    pub(super) loginit: LogBuffer<'a>,
+    /// Interrupts log buffer.
+    pub(super) logintr: LogBuffer<'a>,
+    /// RM log buffer.
+    pub(super) logrm: LogBuffer<'a>,
+}
+
+impl<'a> LogBuffers<'a> {
+    /// Allocates the three log buffers of `dev`.
+    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        Ok(Self {
+            dev,
+            loginit: LogBuffer::new(dev)?,
+            logintr: LogBuffer::new(dev)?,
+            logrm: LogBuffer::new(dev)?,
+        })
+    }
+
+    /// Creates an initializer exposing these buffers under a directory named after their device.
+    pub(super) fn scope(self) -> impl PinInit<debugfs::Scope<Self>, Infallible> + 'a {
+        let dev = self.dev;
+
+        #[allow(static_mut_refs)]
+        // SAFETY: `DEBUGFS_ROOT` is created before driver registration and cleared
+        // after driver unregistration, so no probe() can race with its modification.
+        //
+        // PANIC: `DEBUGFS_ROOT` cannot be `None` here.  It is set before driver
+        // registration and cleared after driver unregistration, so it is always
+        // `Some` for the entire lifetime that probe() can be called.
+        let log_parent: &debugfs::Dir =
+            unsafe { crate::DEBUGFS_ROOT.as_ref() }.expect("DEBUGFS_ROOT not initialized");
+
+        log_parent.scope(self, dev.name(), |logs, dir| {
+            dir.read_binary_file(c"loginit", &logs.loginit.0);
+            dir.read_binary_file(c"logintr", &logs.logintr.0);
+            dir.read_binary_file(c"logrm", &logs.logrm.0);
+        })
+    }
+
+    /// Preserves whatever the GSP logged, so it can still be read once the GPU is gone.
+    ///
+    /// The buffers are DMA allocations of the device and cannot outlive it, so their contents are
+    /// copied into memory owned by the module and exposed through fresh debugfs entries. Those
+    /// live until the module is unloaded.
+    ///
+    /// Does nothing if `gsp_keep_logs` was not set when the module was loaded, as there is then
+    /// no directory to put the copies in.
+    fn retain(&self) -> Result {
+        // Copying is only worth it if there is somewhere to put the result, but the lock is
+        // dropped right away: what follows allocates 64 KiB three times, and no other device
+        // should have to wait for that.
+        if !crate::RETAINED_LOGS.lock().is_enabled() {
+            return Ok(());
+        }
+
+        let logs = RetainedLogBuffers {
+            dev: self.dev.into(),
+            loginit: self.loginit.snapshot()?,
+            logintr: self.logintr.snapshot()?,
+            logrm: self.logrm.snapshot()?,
+        };
+
+        // Nothing was ever logged, so there is nothing to keep. A copy from an earlier run of
+        // this device is deliberately left alone: logs from a run that failed are worth more
+        // than the silence of one that did not.
+        if logs.loginit.is_empty() && logs.logintr.is_empty() && logs.logrm.is_empty() {
+            return Ok(());
+        }
+
+        // Take every allocation that can fail before the previous copy of this device is
+        // dropped, so that running out of memory here cannot leave it with no logs at all.
+        let scope = KBox::<debugfs::Scope<RetainedLogBuffers>>::new_uninit(GFP_KERNEL)?;
+
+        let mut retained = crate::RETAINED_LOGS.lock();
+
+        // The module may have been unloaded out from under us while the copies were taken.
+        let Some(dir) = retained.dir.clone() else {
+            return Ok(());
+        };
+
+        retained.gpus.reserve(1, GFP_KERNEL)?;
+
+        // An earlier run of the same device may have left a copy behind, and its directory
+        // carries the name about to be used again, so it has to go first. Nothing below can
+        // fail, so the replacement is guaranteed to take its place.
+        retained
+            .gpus
+            .retain(|gpu| gpu.dev.name() != self.dev.name());
+
+        let scope = scope.write_pin_init(dir.scope(logs, self.dev.name(), |logs, dir| {
+            if !logs.loginit.is_empty() {
+                dir.read_binary_file(c"loginit", &logs.loginit);
+            }
+            if !logs.logintr.is_empty() {
+                dir.read_binary_file(c"logintr", &logs.logintr);
+            }
+            if !logs.logrm.is_empty() {
+                dir.read_binary_file(c"logrm", &logs.logrm);
+            }
+        }))?;
+
+        retained.gpus.push(scope, GFP_KERNEL)?;
+
+        dev_dbg!(self.dev, "GSP-RM log buffers retained\n");
+
+        Ok(())
+    }
+}
+
+impl Drop for LogBuffers<'_> {
+    fn drop(&mut self) {
+        if let Err(e) = self.retain() {
+            dev_warn!(self.dev, "failed to retain GSP-RM log buffers: {:?}\n", e);
+        }
+    }
+}
+
+/// Copies of the log buffers of a GPU that is no longer around.
+struct RetainedLogBuffers {
+    /// Device the buffers came from.
+    dev: ARef<device::Device>,
+    /// Contents of the init log buffer, empty if it was never written to.
+    loginit: VVec<u8>,
+    /// Contents of the interrupts log buffer, empty if it was never written to.
+    logintr: VVec<u8>,
+    /// Contents of the RM log buffer, empty if it was never written to.
+    logrm: VVec<u8>,
+}
+
+/// Log buffers of GPUs that are gone, and the debugfs entries exposing them.
+///
+/// The copies live under a `retained` directory of their own instead of next to the entries of
+/// the GPUs that are actually bound, so that a device coming back does not find its name taken.
+pub(crate) struct RetainedLogs {
+    /// Parent directory of all copies. `None` unless retaining was asked for.
+    dir: Option<debugfs::Dir>,
+    /// One entry per GPU.
+    gpus: KVec<Pin<KBox<debugfs::Scope<RetainedLogBuffers>>>>,
+}
+
+impl RetainedLogs {
+    /// Creates an empty set of retained log buffers, retaining disabled.
+    pub(crate) const fn new() -> Self {
+        Self {
+            dir: None,
+            gpus: KVec::new(),
+        }
+    }
+
+    /// Creates the directory the copies will live in, enabling retaining.
+    ///
+    /// Does nothing without `CONFIG_DEBUG_FS`, where a [`debugfs::Dir`] is a zero-sized type and
+    /// the copies could never be read back.
+    pub(crate) fn enable(&mut self, parent: &debugfs::Dir) {
+        if !cfg!(CONFIG_DEBUG_FS) {
+            return;
+        }
+
+        self.dir = Some(parent.subdir(c"retained"));
+    }
+
+    /// Returns whether copies are being kept.
+    pub(crate) fn is_enabled(&self) -> bool {
+        self.dir.is_some()
+    }
+
+    /// Releases every copy and the directory holding them.
+    pub(crate) fn clear(&mut self) {
+        self.gpus.clear();
+        self.dir = None;
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 11fe1d2858a9..557cc611f3fc 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -33,11 +33,21 @@
 // TODO: Move this into per-module data once that exists.
 static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;
 
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
+        RETAINED_LOGS.lock().clear();
+
         // SAFETY: This guard is dropped after `_driver` (due to field order),
         // so the driver is unregistered and no probe() can be running.
         unsafe { DEBUGFS_ROOT = None };
@@ -58,15 +68,25 @@ impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         let dir = debugfs::Dir::new(c"nova-core");
 
+        // SAFETY: Module initialization runs exactly once, and before the driver is registered,
+        // so no probe can have touched `RETAINED_LOGS` yet.
+        unsafe { RETAINED_LOGS.init() };
+
+        // Creating the directory up front is what makes retaining possible without reaching for
+        // `DEBUGFS_ROOT` later, from the teardown path of a device.
+        if module_parameters::gsp_keep_logs.value() {
+            RETAINED_LOGS.lock().enable(&dir);
+        }
+
         // SAFETY: We are the only driver code running during init, so there
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
 
         // Fields are initialized in the order written here, and an initializer that fails drops
         // what it has already built, so the guard goes first: should registration fail, its drop
-        // still takes `DEBUGFS_ROOT` down with it. Nothing would otherwise, as statics are never
-        // dropped and the module is unloaded right away, leaving a directory behind that the
-        // next load cannot create again.
+        // still takes `DEBUGFS_ROOT` and the retained copies down with it. Nothing would
+        // otherwise, as statics are never dropped and the module is unloaded right away, leaving
+        // directories behind that the next load cannot create again.
         try_pin_init!(Self {
             _debugfs_guard: DebugfsRootGuard,
             _driver <- Registration::new(MODULE_NAME, module),
@@ -81,6 +101,12 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    params: {
+        gsp_keep_logs: bool {
+            default: false,
+            description: "Keep the GSP-RM log buffers in debugfs after their GPU is gone",
+        },
+    },
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.55.0

