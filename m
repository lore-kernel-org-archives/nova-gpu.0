Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2AD2EBBAF
	for <nova-gpu@lists.linux.dev>; Sat, 15 Aug 2026 05:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786770515; cv=none; b=dKLqya8nkUetp3GaIZmxb/L8uuIkLCxfNuZGBspe4RBdkLOH9UP+w55G3vIKZd6ZJ5q2+qkCky423dfQZhI2ZKF1KyLLsxFjSQK2oH5pI0pej4f9dIJxAJ4D9nVccJA9UsK/EUnrZ9m5D5oT9JiiqVDq8JeywSDyn8LGwV4RbrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786770515; c=relaxed/simple;
	bh=x/hwKM8ZjjTyX8V3Z5jrI8tGMrC3skshKBk+D9MC3fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5JiAW3UZZJ5EKI0o6qx1ikcE5TWcIQBX2feOFG0dUnC7mTeaZnXmAWwDSpbKHryE68Hz6ASifUm+Ydvq4kGc43TRXJyhTD4LTJxjn8rHxkI6rwikMkipot3aloHxcEidBePflQYwI3qAIqPTXKhbH7aWabHKHWaiKKT3VRZb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvmX0ShJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvmX0ShJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso717935e87.2
        for <nova-gpu@lists.linux.dev>; Fri, 14 Aug 2026 22:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786770511; x=1787375311; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rh9k5ls4P7h2XTEAea6XCmlOeGaVyD2hBG03bRb/WIs=;
        b=IvmX0ShJek8ozIl+6thnswY0EqDK9wNJrhO7dROBv/UI7ySmZy6TnO9HNSVthfik4z
         peceVMcE/CVhSfRUhLUL0kspe60+jyxNXu2Y99656BP4CRnC7g6EprAXzr26mshv/dT0
         /Cn8qnBDFzVTfzhk1qQSHL5ADSIX9vwgQR3KKb6SwE155B+LPPTk/4yM7hCcDeUt70Os
         +Omlu50fa4boZcO9K2KPy26ctJuYW2u1HOH3W1rO41iVYhXMydg35zLkWeVwHz4RNbr6
         ySLAQTeOj31Axf5ScW4Ov6xtMLAgpO+z2meL13SjMfmqYIm/mlq4sB62jznpFwkj75DX
         xDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786770511; x=1787375311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rh9k5ls4P7h2XTEAea6XCmlOeGaVyD2hBG03bRb/WIs=;
        b=jee7JWzFVrP3m45PQM7+N4yBxmYXGxFSF7yju3ThBj6vAbnY6d8lVA+TIr6nWiG2tq
         TINYPp95/dp6cn8cGoj/eIh3MTawSCdPdZolHEyifZaaFqnbtuQI/iHJDrk4kfgF9LcM
         NR/Q61XNI84XrCRglLAoKziPEeh98C6eZJm/4RnojqljQ1qeilt2Er8tPaixstMuyDZf
         DQsywsaOxhRGPqQWYvwjWBkL+VR4FtHgdtwg18ys8o0mOEernzG1jcxvhC+cooSy4kJW
         zgn0XldhShWYIdtjEjINKODX6mlzJrW5+0cqBoQjjXNdZdeyN8o6udzdWsKR5tY+ptzN
         OJ/A==
X-Forwarded-Encrypted: i=1; AHgh+Rqs+0mXwC3Ja1nyOANDUpQatPWhzg4Fo+Zdv0HEwjaFzZVcbV1B+Z+BHQKjKPo+eFonayE/2UhAMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLWjU2mmhaWpknhPF4Z+Gbfc02w+3x1GvZKzEWYiYC5IniiNZQ
	RHGa789awzXCQlOXI4MlnUWGMROLHpUfaGxnIYJlaPvUkN2wGd4BLUyF
X-Gm-Gg: AR+sD12wP/+eaD/Ddr712mR/+dFJ15+mEcSQe2ig+FpEB6emKpJKOJubcX/zP11kBiN
	iBAUWrk5Dy61IiazTQQIq/WPnxpAUc9kQQuMYDR1wmF+uBnysDSrFhYf6xUmaVaxMQ8qG2V3TV6
	2e/AxouLCTpTlrnBx33jt1EWDGSP9cI5h5z80L+DDGMHcQSCv38DOOMGJfaRm+a8QXeJq2g5V/O
	zbackQvUCqvTQGkW/WWFQg603pAudnVZ9W3X4iH53NvPS9neAnnEg8HMBvmNNW5gvgEdmQhXVvx
	2lDRthxcXxYlKetp/I1csB9kmQsrA+EwQY6/SlYqoERNv6GGBHy7+tdLUTi1AEwOXAGBsmYfbbU
	3D29V3YHYVUgB8VpfTH4jRZMg86afQa0PFK2fy6FHQSDKwM/mKAKddiUtHigcTHo/2hZCHvKbwb
	X0ZqWKMSWF99QycrX1pYGT+iEam11TVpqi7dsZmd2hduIpTvdAlfd17oGOGqA32v1jddY=
X-Received: by 2002:a05:6512:1151:b0:5b0:1df9:2ae5 with SMTP id 2adb3069b0e04-5b45910e5aamr1653610e87.14.1786770510343;
        Fri, 14 Aug 2026 22:08:30 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9a7sm932354e87.13.2026.08.14.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:08:30 -0700 (PDT)
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
Subject: [PATCH v2 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Sat, 15 Aug 2026 12:08:25 +0700
Message-ID: <20260815050826.306717-2-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815050826.306717-1-vladazaharova2018@gmail.com>
References: <20260815050826.306717-1-vladazaharova2018@gmail.com>
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

The copies live in a "retained" directory, created during module init
rather than on first use, which keeps the teardown path from having to
reach for DEBUGFS_ROOT. Keeping them out of the directory used by bound
GPUs also means a device coming back does not find its debugfs name
taken by its own history; nouveau, which recreates the entries under the
name of the GPU that just went away, has that problem.

The parameter is a u8 taking 0 or 1 rather than a bool, as the module
parameter abstraction has no bool in this tree yet.

While at it, move the log buffer code out of gsp.rs into gsp/logbuffer.rs.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs           | 100 ++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 235 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  28 +++
 3 files changed, 282 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 13f361406a6c..1e697c859a2f 100644
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
-struct LogBuffer(Coherent<[u8; LOG_BUFFER_SIZE]>);
-
-impl LogBuffer {
-    /// Creates a new `LogBuffer` mapped on `dev`.
-    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
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
-struct LogBuffers {
-    /// Init log buffer.
-    loginit: LogBuffer,
-    /// Interrupts log buffer.
-    logintr: LogBuffer,
-    /// RM log buffer.
-    logrm: LogBuffer,
-}
-
 /// GSP runtime data.
 #[pin_data]
 pub(crate) struct Gsp {
@@ -165,9 +118,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
+            let log_buffers = LogBuffers::new(dev)?;
 
             // Initialise the logging structures. The OpenRM equivalents are in:
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
@@ -182,36 +133,23 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
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
+                logs <- log_buffers.scope(dev),
             }))
         })
     }
diff --git a/drivers/gpu/nova-core/gsp/logbuffer.rs b/drivers/gpu/nova-core/gsp/logbuffer.rs
new file mode 100644
index 000000000000..a6639f0f75c8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -0,0 +1,235 @@
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
+    sync::aref::ARef, //
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
+pub(super) struct LogBuffer(pub(super) Coherent<[u8; LOG_BUFFER_SIZE]>);
+
+impl LogBuffer {
+    /// Creates a new `LogBuffer` mapped on `dev`.
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
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
+        // still zero if nothing was ever logged.
+        let put = io_project!(self.0, [build: ..size_of::<u64>()]).try_cast::<u64>()?;
+        if put.read_val() == 0 {
+            return Ok(VVec::new());
+        }
+
+        let mut snapshot = VVec::zeroed(LOG_BUFFER_SIZE, GFP_KERNEL)?;
+        io_project!(self.0, [build: ..]).copy_to_slice(&mut snapshot);
+
+        Ok(snapshot)
+    }
+}
+
+/// The log buffers of a GPU, for as long as it is bound to the driver.
+pub(super) struct LogBuffers {
+    /// Device the buffers belong to. Also names their debugfs directory.
+    dev: ARef<device::Device>,
+    /// Init log buffer.
+    pub(super) loginit: LogBuffer,
+    /// Interrupts log buffer.
+    pub(super) logintr: LogBuffer,
+    /// RM log buffer.
+    pub(super) logrm: LogBuffer,
+}
+
+impl LogBuffers {
+    /// Allocates the three log buffers of `dev`.
+    pub(super) fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        Ok(Self {
+            dev: dev.into(),
+            loginit: LogBuffer::new(dev)?,
+            logintr: LogBuffer::new(dev)?,
+            logrm: LogBuffer::new(dev)?,
+        })
+    }
+
+    /// Creates an initializer exposing these buffers under a directory named after `dev`.
+    pub(super) fn scope<'a>(
+        self,
+        dev: &'a device::Device<device::Bound>,
+    ) -> impl PinInit<debugfs::Scope<Self>, Infallible> + 'a {
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
+        let mut retained = crate::RETAINED_LOGS.lock();
+
+        let Some(dir) = retained.dir.clone() else {
+            return Ok(());
+        };
+
+        let logs = RetainedLogBuffers {
+            dev: self.dev.clone(),
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
+impl Drop for LogBuffers {
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
+    pub(crate) fn enable(&mut self, parent: &debugfs::Dir) {
+        self.dir = Some(parent.subdir(c"retained"));
+    }
+
+    /// Releases every copy and the directory holding them.
+    pub(crate) fn clear(&mut self) {
+        self.gpus.clear();
+        self.dir = None;
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 35a8b1214b0e..fedb9f0f5275 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -30,11 +30,21 @@
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
@@ -54,6 +64,16 @@ impl InPlaceModule for NovaCoreModule {
     fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
         let dir = debugfs::Dir::new(c"nova-core");
 
+        // SAFETY: Module initialization runs exactly once, and before the driver is registered,
+        // so no probe can have touched `RETAINED_LOGS` yet.
+        unsafe { RETAINED_LOGS.init() };
+
+        // Creating the directory up front is what makes retaining possible without reaching for
+        // `DEBUGFS_ROOT` later, from the teardown path of a device.
+        if *module_parameters::gsp_keep_logs.value() != 0 {
+            RETAINED_LOGS.lock().enable(&dir);
+        }
+
         // SAFETY: We are the only driver code running during init, so there
         // cannot be any concurrent access to `DEBUGFS_ROOT`.
         unsafe { DEBUGFS_ROOT = Some(dir) };
@@ -72,6 +92,14 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    params: {
+        // TODO: Use `bool` once the module parameter abstraction supports it; until then this
+        // takes 0 or 1.
+        gsp_keep_logs: u8 {
+            default: 0,
+            description: "Keep the GSP-RM log buffers in debugfs after their GPU is gone (0|1)",
+        },
+    },
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.55.0

