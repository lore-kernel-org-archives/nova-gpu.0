Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556435;
	b=ZY6Ymwu+e7wzKdL1Pnfi1C9vh43lqa1puvT5rr37MqGX8QLQSJrcZ8/kiSFS+LLaSQiM
	 B9mjodZN7ba6H+kzw/TO4vGWKjuJIyKYYFC1rKwtPNpgOYz4pEDZAJfH16/dCWGGc/Zi3
	 GQKQ2vzH2uzIvVtZtuw1TZkyVpvdLquo07gRjLJBIQ52OdzhgI1maKlkqBGW8SN0lYkg9
	 kImmNP5/5nd9x9EaVutwo1jGRc3cS9CTWHo9+/K4/xwOoWfLXBH28MQ2Xb31cDCSxQl89
	 n6SyZPDXQ0IbKczluLxBW9xNeu4UCEKVC+1gk8OaLqYMu7y7Zlndc3ei8JxQvF22Vlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X+Bvqu0rC8t8WcE45Nw2eyzcpwuTeKWohLoDmF9rmcE=;
	b=DRaC/ZFFXkl4g6nJ5hqHgwkEp7oArVqvWAY2z7NYo3th+f1zpjICnBp2cC3CQZA+wOQ0
	 oL4886Gjp3RTx+OjPJHMN7X/MXBKtUj+H/xi/YLziP8jTsh3r+t/cMI3vrjlHYwYQTFok
	 +dim8vlLbRkvAf+sbQVRXM0M4Qd5cM9OZN/s/rlDe4lmkmsFJggny76rNDXks1/6TUgxW
	 wFsDpUnsbOo6HDkDkrtvWTHRQ/usYE9sFU3bwPV/IYmdWVRkgnIPG2mPur/rvrCeeIC6O
	 eZW8Z2BmpRbXR/MKNlq3YWcQFepDTyQUnIc7LHIjYI5lbJY12fO16ufnTpZ2Fk9sY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lReJYSbX;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B87606A880
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B87606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lReJYSbX
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1184203a91.3
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556434; x=1795161234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X+Bvqu0rC8t8WcE45Nw2eyzcpwuTeKWohLoDmF9rmcE=;
        b=lReJYSbXnSRdPBAJjb+C1fhOeBuofjXfUqhNMYsHt2dCG50KpIkjZ55qga8V3Eahz1
         ctgGxh6m0JTyRdg1/AhMm3GbshADlQv5Nw88vjx9YIjp6Yrgo0R3o+rK+4LGoINNkX9a
         d2pwcMOIkT63WNHGaifnjQ5Byc79NJZ4nNtOll6SOYEvpePNZEVS1GuyN4rjcVpkbqs4
         c2pRMw6pMMSibVQc/JiTrKFlYf96MGk0AIXWAtJSLJYNw+34kUikQQtcXFRdQoPNP6oc
         xcye0e/Dbd+rsmGXFoyGIFZk6DUv4dGY3ZBn3RzLTL3Cb1YhHyKgR0H/n4ozGc4c1Q2D
         8C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556434; x=1795161234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+Bvqu0rC8t8WcE45Nw2eyzcpwuTeKWohLoDmF9rmcE=;
        b=FvBS/oQeAAEaSG8yaSzikSTj0J5XUNU9US+++HWM2k/DIYrz9u+lBDU9v3z74H8jNt
         SltN1SIqdZRIJa6ntjrVrb0tl1Czy45C4fTVynjqkBY7D5YYLLAfjyt2t1TxYP0Y43uZ
         4fpJbJ+G0wuj8Oc+8a9IvmEy0ZZ7lhV9vR1bLsBGsveFR7aFsGAQpqp5xRsfG/9awE7O
         D/5+APxWaROYIeOvJ4OhlNfmV9SFekKKkDdNvV21vIpFxIYMr4GK5d0AwP7xDvxsch4J
         siK8lCNKPMdSmX7uijYVNN48FOwkYGibYK4fZOQfPWDnKy+CXijX4gO6RXFRYCaZ6K5d
         kN+g==
X-Forwarded-Encrypted: i=1; AL+hErFdbenoyPE5aV0Afw8ZG9gwE3FcI0CFHa5gkygtvgfcLKN/gv9UhTxU37QNi04pYj+fY0RoVpGLnw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8+sNpDsJvc2u7x4cRTlPKbRzpPxddwXtdw9AFoQkyu+adUlxR5
	5HmGW+jFHiO0o/vfvR+ivq1kVy9NMBdVeUiqpLfwZKHyQjaNTuHQ/qDG
X-Gm-Gg: AYBFou0ctGnAmUij3GXQ3KA9HAlZUsvCa2u+34T1lP8WA5Q8xqp9jJ0kcLFA+EgF74h
	AX0blvchvplbC+Mky4HCuc/JZ0Sp8ARrwUtU+ueOrYg9WkFnSK503cX0lmxWXxV7hgjwWTdkwgw
	lsqWa0BEX8e3ro2hxCP/5NxQUo9lRtiwa+cSA2IPABWcodlVzNN1CugiRERfhntcUZVTR0KQ/o0
	5qXG9e1keazJjehaFw+RHR2pF2juZsENDbdsY4Bq6dlKWXzyYfUKvzZ8p3qr1gW4+fxHTINRZvP
	UALl17GxH8I9CfdRR1Cm0LBIpuKRt7xHFRrOXAmHm9xAU2yMFQL9a18lFPCKPqHMosyjnflIw/B
	2gg68Yf0MR1Tx/14kPuyLpe71aj7EWn9TxRN2OnOqYPFe64uI4ijEtyEtl/3VBbbLdGHQcHGUsW
	qZHO/8mvFqVn+lk/nEYiejTuds9am3/CX5iy4zVz5auUVc7Pg9semegSpFNQsusohgX8dVty9U6
	w9HdPMNdNgTMTcyUfWlkU0nZ0v02g/GpNmYwus1b2mwVT6opGWoL485HC5O0kQeFk3Ncj2mvkVL
	EgxEFiEyNywR+6S8e4bbwROXb1fDoNo9rR0=
X-Received: by 2002:a17:90a:f947:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b1b0b55384mr1522453a91.20.1794556434053;
        Thu, 12 Nov 2026 23:53:54 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:53 -0800 (PST)
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
Subject: [PATCH v7 3/4] gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
Date: Fri, 13 Nov 2026 14:53:16 +0700
Message-ID: <20261113075317.934264-4-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are DMA allocations of the device, so their
debugfs files go away when the GPU is unbound, including when probe()
fails. That is when the logs are most needed.

Add a gsp_keep_logs module parameter. When it is set, the buffers are
copied into module memory when they are dropped, and the copies are
exposed in the same files until the GPU is bound again or the module is
unloaded.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/debugfs.rs       |  17 ++-
 drivers/gpu/nova-core/gsp.rs           |  42 +++----
 drivers/gpu/nova-core/gsp/logbuffer.rs | 149 ++++++++++++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs     |   6 +
 4 files changed, 182 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/debugfs.rs b/drivers/gpu/nova-core/debugfs.rs
index 6c6ed129f0da..5ba5d42a8a7b 100644
--- a/drivers/gpu/nova-core/debugfs.rs
+++ b/drivers/gpu/nova-core/debugfs.rs
@@ -4,12 +4,21 @@
 
 use kernel::{
     debugfs,
-    prelude::*, //
+    new_mutex,
+    prelude::*,
+    sync::Mutex, //
 };
 
+use crate::gsp::RetainedLogs;
+
 /// Debugfs data the module shares with every GPU it drives.
 #[pin_data]
 pub(crate) struct DebugfsData {
+    /// Copies of the GSP-RM log buffers of GPUs that are no longer bound.
+    ///
+    /// Declared before `root`, as the copies live below it.
+    #[pin]
+    retained_logs: Mutex<RetainedLogs>,
     /// Root directory of the driver in debugfs.
     root: debugfs::Dir,
 }
@@ -18,6 +27,7 @@ impl DebugfsData {
     /// Creates the debugfs data of the module.
     pub(crate) fn new() -> impl PinInit<Self> {
         pin_init!(Self {
+            retained_logs <- new_mutex!(RetainedLogs::new()),
             root: debugfs::Dir::new(c"nova-core"),
         })
     }
@@ -26,4 +36,9 @@ pub(crate) fn new() -> impl PinInit<Self> {
     pub(crate) fn root(&self) -> &debugfs::Dir {
         &self.root
     }
+
+    /// Returns the copies of the GSP-RM log buffers of GPUs that are no longer bound.
+    pub(crate) fn retained_logs(&self) -> &Mutex<RetainedLogs> {
+        &self.retained_logs
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 43df95406d35..43945f5c09c9 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,10 +25,8 @@
 mod regs;
 mod sequencer;
 
-use logbuffer::{
-    LogBuffer,
-    LogBuffers, //
-};
+use logbuffer::LogBuffers;
+pub(crate) use logbuffer::RetainedLogs;
 
 pub(crate) use fw::{
     GspFmcBootParams,
@@ -124,9 +122,7 @@ pub(crate) fn new(
         pin_init::pin_init_scope(move || {
             let dev = pdev.as_ref();
 
-            let loginit = LogBuffer::new(dev)?;
-            let logintr = LogBuffer::new(dev)?;
-            let logrm = LogBuffer::new(dev)?;
+            let log_buffers = LogBuffers::new(dev)?;
 
             // Initialise the logging structures. The OpenRM equivalents are in:
             // _kgspInitLibosLoggingStructures (allocates memory for buffers)
@@ -141,29 +137,23 @@ pub(crate) fn new(
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
-                    let log_parent: &debugfs::Dir =
-                        crate::NovaCoreModule::debugfs_data(dev).root();
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
index 1fb411ce6d01..e1a613faace5 100644
--- a/drivers/gpu/nova-core/gsp/logbuffer.rs
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -2,19 +2,30 @@
 
 //! GSP-RM log buffers.
 
+use core::convert::Infallible;
+
 use kernel::{
+    debugfs,
     device,
     dma::Coherent,
     io::{
         io_project,
         Io, //
     },
-    prelude::*, //
+    prelude::*,
+    str::CString,
+    sync::barrier::{
+        dma_mb,
+        Read, //
+    }, //
 };
 
-use crate::gsp::{
-    PteArray,
-    GSP_PAGE_SIZE, //
+use crate::{
+    gsp::{
+        PteArray,
+        GSP_PAGE_SIZE, //
+    },
+    NovaCoreModule, //
 };
 
 /// Number of GSP pages to use in a RM log buffer.
@@ -39,7 +50,7 @@
 
 impl<'a> LogBuffer<'a> {
     /// Creates a new `LogBuffer` mapped on `dev`.
-    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
         let obj = Self(Coherent::zeroed(dev, GFP_KERNEL)?);
 
         let start_addr = obj.0.dma_address();
@@ -53,9 +64,33 @@ pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
 
         Ok(obj)
     }
+
+    /// Copies the buffer, or returns an empty vector if the GSP never wrote to it.
+    fn snapshot(&self) -> Result<VVec<u8>> {
+        let put = io_project!(self.0, [build: ..size_of::<u64>()])
+            .try_cast::<u64>()?
+            .read_val();
+        if put == 0 {
+            return Ok(VVec::new());
+        }
+
+        // ORDERING: LOAD->LOAD ordering needed to order the "put" read before the data read, as a
+        // GSP that failed to boot may still be writing.
+        dma_mb(Read);
+
+        let mut snapshot = VVec::zeroed(LOG_BUFFER_SIZE, GFP_KERNEL)?;
+        io_project!(self.0, [build: ..]).copy_to_slice(&mut snapshot);
+
+        // The copy reads "put" again, unordered against the data, so keep the value read above.
+        snapshot[..size_of::<u64>()].copy_from_slice(&put.to_ne_bytes());
+
+        Ok(snapshot)
+    }
 }
 
 pub(super) struct LogBuffers<'a> {
+    /// Device the buffers belong to.
+    dev: &'a device::Device<device::Bound>,
     /// Init log buffer.
     pub(super) loginit: LogBuffer<'a>,
     /// Interrupts log buffer.
@@ -63,3 +98,107 @@ pub(super) struct LogBuffers<'a> {
     /// RM log buffer.
     pub(super) logrm: LogBuffer<'a>,
 }
+
+impl<'a> LogBuffers<'a> {
+    /// Allocates the log buffers of `dev`.
+    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
+        Ok(Self {
+            dev,
+            loginit: LogBuffer::new(dev)?,
+            logintr: LogBuffer::new(dev)?,
+            logrm: LogBuffer::new(dev)?,
+        })
+    }
+
+    /// Exposes the buffers in debugfs, in a directory named after their device.
+    pub(super) fn scope(self) -> impl PinInit<debugfs::Scope<Self>, Infallible> + 'a {
+        let dev = self.dev;
+        let data = NovaCoreModule::debugfs_data(dev);
+
+        // Retained copies of an earlier run use the same directory.
+        data.retained_logs().lock().remove(dev.name());
+
+        data.root().scope(self, dev.name(), |logs, dir| {
+            dir.read_binary_file(c"loginit", &logs.loginit.0);
+            dir.read_binary_file(c"logintr", &logs.logintr.0);
+            dir.read_binary_file(c"logrm", &logs.logrm.0);
+        })
+    }
+
+    /// Exposes copies of the buffers in their place, if `gsp_keep_logs` is set.
+    fn retain(&self) -> Result {
+        if !crate::module_parameters::gsp_keep_logs.value() || !cfg!(CONFIG_DEBUG_FS) {
+            return Ok(());
+        }
+
+        let logs = RetainedLogBuffers {
+            name: CString::try_from_fmt(fmt!("{}", self.dev.name()))?,
+            loginit: self.loginit.snapshot()?,
+            logintr: self.logintr.snapshot()?,
+            logrm: self.logrm.snapshot()?,
+        };
+
+        if logs.loginit.is_empty() && logs.logintr.is_empty() && logs.logrm.is_empty() {
+            return Ok(());
+        }
+
+        // Allocate before an earlier copy is dropped, so that a failure leaves that copy in place.
+        let scope = KBox::<debugfs::Scope<RetainedLogBuffers>>::new_uninit(GFP_KERNEL)?;
+        let data = NovaCoreModule::debugfs_data(self.dev);
+        let root = data.root();
+        let mut retained = data.retained_logs().lock();
+        retained.0.reserve(1, GFP_KERNEL)?;
+
+        retained.remove(self.dev.name());
+
+        let scope = scope.write_pin_init(root.scope(logs, self.dev.name(), |logs, dir| {
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
+        retained.0.push(scope, GFP_KERNEL)?;
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
+/// Copies of the log buffers of a GPU that is no longer bound.
+struct RetainedLogBuffers {
+    /// Name of the device, which also names the debugfs directory.
+    name: CString,
+    /// Init log buffer, empty if never written to.
+    loginit: VVec<u8>,
+    /// Interrupts log buffer, empty if never written to.
+    logintr: VVec<u8>,
+    /// RM log buffer, empty if never written to.
+    logrm: VVec<u8>,
+}
+
+/// Copies of the log buffers of all GPUs that are no longer bound.
+pub(crate) struct RetainedLogs(KVec<Pin<KBox<debugfs::Scope<RetainedLogBuffers>>>>);
+
+impl RetainedLogs {
+    pub(crate) const fn new() -> Self {
+        Self(KVec::new())
+    }
+
+    /// Drops the copies of the device named `name`, if any.
+    fn remove(&mut self, name: &CStr) {
+        self.0.retain(|gpu| *gpu.name != *name);
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index f5d08de8a212..1671e260dfb4 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -91,6 +91,12 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
     description: "Nova Core GPU driver",
     license: "GPL v2",
     firmware: [],
+    params: {
+        gsp_keep_logs: bool {
+            default: false,
+            description: "Keep the GSP-RM log buffers in debugfs after their GPU is unbound",
+        },
+    },
 }
 
 kernel::module_firmware!(firmware::ModInfoBuilder);
-- 
2.56.0

