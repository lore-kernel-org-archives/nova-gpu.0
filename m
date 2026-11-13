Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556427;
	b=E70UgcPBEFeSCF9Ofmi60E/qQyksfPkTYjXmsumUrghFX2Cjt14O3KabEtMO0arvrARu
	 V6bP1nHywsEDbWzLe3rVMYcen0jdRtfJXGO+i88dYEKLlc/GigfXu/RTxPrbTvYqQHNz2
	 MSbfoHS1+3D5qZ/k66brw9Apk71TGtz5EJGq1WRVcSX9IlZRnbPOkJhubzwkrojt11WHM
	 RutRlJL28GAO2lVyuYMZ8NRfjHrGzWmjMaR7wDlJfceyYMhI6n0+NofZpfMVDFTRBf/Up
	 4lOziWKRAD9x2117xvM2zLmErRD+GqURO/1SVFgU527gXsIs8VQnyDijHztlYe7lTdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
	b=NB7MfQ5KXFGswlDsVFjzjQFrhW5zbn5K30lWd6so0p/6/zEGefJUtfxCPAY/Pg/joOYC
	 nLoZkYMTpaLY+LVjMzm07MXBP4EeQTW1pkL5B4VHqzSnp17/PYHM3jCE7A68HZHDNPU23
	 sze2or5tjnLRLUZdOdEPpOXROEA9xLKMyzyVmAoXRXP6mFDc7CWqTSg+hVXkUNOsM4qVo
	 vpw+vRPRHvvssKLG0ayfCr1LqLZ27w9wlDs+YksBO+6bG72+OhnpdnR8IYufg5EWL2vjz
	 KUyz0Lkol+GV0OxIa9MgYNSrvjCPL72SnScrF7l/VMtyIGzX+SEVcSyw36c1L1gR3lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWITGz8S;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C03C606A33E
	for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 07:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C03C606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TWITGz8S
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so691623a91.0
        for <nova-gpu@lists.linux.dev>; Thu, 12 Nov 2026 23:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794556426; x=1795161226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
        b=TWITGz8S4tDmoKL5dvUEDIgLa+ImVotThF5nSY2k+WlJQjoa09FmInNdTXzRr+xG/m
         eaDKTnFHwyP4DwLaqgKzNrvX8UnLRVtbGa0YkPWg7OCpU+VoJk62v/J5jeHmYmWhmPVS
         Z/Ue97ClhFmA/lzHMBhzkCc+JIUIlzXKdTtTDH6UlWJekopAhkQufz+bvyupEcfFU/Z4
         RoGnWspNRpSrFfleIaCcJiv1SJgBaC3PYlRSa33KAavvr50+Nm7ENc77miCDc+Pywdyk
         si9TJyXD8pTNOCPjvgWvcJO/fosznInzeD2SFbNH8GAFnTbZUAj5bYxSfjnGoEPf5AZF
         RqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556426; x=1795161226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJx2VhkDwAThYqH3qA0MncZOWZgXmJc1U/NyauJfUPQ=;
        b=Gps1mmVOPPCHAb78c6sRQ4DZJWx4lpkmO3jltXs6T1J9cPjOCSbPoRd5teeZknDNwp
         V0Ag8gjvWI35DX398OHYpwnKXGDIU9fvns2GdIuBJ8Axcxpj4b/HFi95+RyqFn/+m9PG
         cF4tV7ltYlpxMqYeRWmBnrrpz3JqhZmI2x0YHH86aPvWQ4CQyzNlmRrpkA2tCi5KYo8S
         mTFboKWxyCAtKpyquGIJsjby5rHiMYT1Mltf1lLOscIaOVwJA8NYSVPkhCGr4892i9DH
         jEkOED+AfMhWES6rJeWmHGqruGnedG4gSVYVihWzytdR/5/xrtLp3m1lx2/fFkLaMqj9
         Cj/g==
X-Forwarded-Encrypted: i=1; AL+hErExfZz3bbihxkNk08ne8MyX0h3hQ6TorVG/swhiOCP34OA6NkRZ/nyCImF7J7Fr6Euo+9rolBdiXw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8TqXtk61xEg1h0jtNmvj5s6dDbYDFAkxNyN79E+uaxQvT8eg/V
	haWHHoePa9HdgcZVIGQFDfwNZDGhw4euq7+uQIJUq71jY2jmuPA21q5g
X-Gm-Gg: AYBFou11Ol8apqJPgV2GckiBZ0oZ2RM08uqJKmBFa72UIO5nEaZ/QeMALgZwHKs2OVV
	Wm1LQwLV4Qp/nyNavpQ4utoRyUwzz3IQlkOTS6/oFqvysmXx22Pm91bE8Cjc4vDKXM2Ajy5VBmf
	GvV57EnE3xTLjSGvPPKMzEb1gsgGV2orRpaS74Eo+cCXGNmhkttxXmn97gZzD28ID2iR/T0fuMz
	bIKWHlH5ejkPFgmd4Jw5iBdS/dGim92LKBW0AGKQYIa5ZHClx7wimbBUF4mDFJNqaclmsZuDA5C
	Gh8TFrqQtMKg4uP7HH13xgP+Z5Nm/9K/CEG4hspzWFUtI4bxs6ARn+2nEWWUDLmqLkhqLiKJiF3
	BfvFzx3I0yxemsHMcSKdjDpL8XkvJdoe7bKhP4o9gi3rvF77nKhyC6UmWO1PbBJq92XZAKnQoQK
	YnZRzQl/QxeTi/g2F514ehvLd935RKyWXFu+IM75DDoDSuodlkNNOyeuz73X7+bJmYYyEF3vpOx
	hx9d7yShlndblTDeBk1KEmHCvylE0j2kkqSfU7zi9EWKZbjG3hwYg2jstqo7f80Dzeg3ryFED5l
	QjCp0SqsCaFDuxYh5PNigoHHthzxiqSG9rM=
X-Received: by 2002:a17:90b:1dc4:b0:3ab:b39f:41cd with SMTP id 98e67ed59e1d1-3b1b0b5e500mr1447942a91.60.1794556426358;
        Thu, 12 Nov 2026 23:53:46 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b708adsm993234a91.4.2026.11.12.23.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:53:45 -0800 (PST)
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
Subject: [PATCH v7 2/4] gpu: nova-core: gsp: move the log buffers into their own file
Date: Fri, 13 Nov 2026 14:53:15 +0700
Message-ID: <20261113075317.934264-3-vladazaharova2018@gmail.com>
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

Move the GSP-RM log buffer code from gsp.rs into gsp/logbuffer.rs, ahead
of extending it. No functional change.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 drivers/gpu/nova-core/gsp.rs           | 59 +++--------------------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 65 ++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 52 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 79ee74a0a16f..43df95406d35 100644
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
@@ -24,10 +20,16 @@
 pub(crate) mod cmdq;
 pub(crate) mod commands;
 mod fw;
+mod logbuffer;
 mod nvkv;
 mod regs;
 mod sequencer;
 
+use logbuffer::{
+    LogBuffer,
+    LogBuffers, //
+};
+
 pub(crate) use fw::{
     GspFmcBootParams,
     GspFwWprMeta,
@@ -78,10 +80,6 @@ pub(crate) fn dev(&self) -> &'gpu device::Device<device::Bound> {
     }
 }
 
-/// Number of GSP pages to use in a RM log buffer.
-const RM_LOG_BUFFER_NUM_PAGES: usize = 0x10;
-const LOG_BUFFER_SIZE: usize = RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE;
-
 /// Array of page table entries, as understood by the GSP bootloader.
 #[repr(C)]
 #[derive(FromBytes, IntoBytes)]
@@ -102,49 +100,6 @@ fn init(view: CoherentView<'_, Self>, start: DmaAddress) -> Result<()> {
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
diff --git a/drivers/gpu/nova-core/gsp/logbuffer.rs b/drivers/gpu/nova-core/gsp/logbuffer.rs
new file mode 100644
index 000000000000..1fb411ce6d01
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/logbuffer.rs
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GSP-RM log buffers.
+
+use kernel::{
+    device,
+    dma::Coherent,
+    io::{
+        io_project,
+        Io, //
+    },
+    prelude::*, //
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
+    pub(super) fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
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
+}
+
+pub(super) struct LogBuffers<'a> {
+    /// Init log buffer.
+    pub(super) loginit: LogBuffer<'a>,
+    /// Interrupts log buffer.
+    pub(super) logintr: LogBuffer<'a>,
+    /// RM log buffer.
+    pub(super) logrm: LogBuffer<'a>,
+}
-- 
2.56.0

