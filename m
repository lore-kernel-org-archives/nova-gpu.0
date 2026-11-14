Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631413;
	b=3bQ86qrBAm4znAgCR8mV6oNmN9U4WtcvHon0PViNFmF4vO35jKWdPUdvOlvfPpJ5d/hl
	 3KNihgm2zUxA0cHe3XykqAvPXgTYMIHPQtJJT5CadWi+hH6p9SVbcvExkLAL9RqoADroF
	 QOU3++AcVfOYrt2lidaGdHgCsvhimJErwgZuzA6bKZbFXWSTzUDH8o55QzpjBWXizoRh0
	 ucu7y8LHXV8vzyFMNXoN1eSoqWNekD3bRFQ4d6/8HCWuRMH7cPXymmlCDuZlmNqFE89ua
	 53zPkHa8d35NYgjemV/4pkRNp4PYbZPQFmRZWh+Qh+UIzcsnnykMIoolT8pzWkllYMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
	b=qB6TaZ0JWfXYmy2gt/N/PMEEfnup39FjQfVijL0LQukKDOgYzdoxUKZDENtX/maJhC9J
	 2GKUMaNYPCbDh9PTfxg175n3VC7doSkdYYt7jshgEpF58IQ5XGpxrgYW1DxnuGsgn6pYG
	 kMnaKqbRfuuO3OEExKB0uAMo+yBIYyGgDq09Kdy41BYYkuxvInEEhAvMRK74osK/atFhx
	 J4cas8oMtxGzvpvW7tvAsi+gh2WCTc3Qv57DV2NgX3qxCpQU8hG9H2+tBBpMjl/t1q7G4
	 B5QZj/blqOs7Ooec7XelxJGoS8axOKYCCoQO5HeUZgiStot3LrEPH812VSkAg/+E4aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfGetnAG;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6096606A330
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6096606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfGetnAG
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ed0e2015aaso9141195ad.3
        for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 20:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631412; x=1795236212; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
        b=xfGetnAGDpcWaEItx2v3Cm7ocWH1amPxWKKqDYQ7HFzTkKvNjv3eWSv+3mRDfxOQ2v
         ypJZbGJP1Jz0YaKaQ8g25tk098CmO3iAKlj5eFHPx32CR1BqMWvShlwXbS3FCloxxQwt
         vOF2kUla/VkyuB67uQfOVD2GvW3dB92bpo/yIQZuLONp6zYqq/Wj90Y5xM0DiR7v+jnZ
         IrGWZJPdKSv2SydgOwtkZ3VuZ7TH32xf/zMQsBp0Zb9/UjzDG3obh+o6D+PmjZiixKyH
         /UJlsme33hxo5oillV/ly3YXIb+ZAxBFl9V8HxPG/xRIkf8JbgA/dbERbqTsznJewQWj
         rb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631412; x=1795236212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJEL2qZCX/w3GeXJL8sn0/654lUPemWjqgGuxwwRjck=;
        b=oDJoZULr6xFUhVAo9uB28p8oPFXsn/u8/8MuAc/+bqw9nzBjIEOuxdk6KoSKnTpvBX
         kl3lmfmyzEJJUNFYgyRfboXWKI6ZdQM6nrKWoRwUPAJh0no+CfvGKrnFtByfo5hJnzxw
         9NS8SI7eesiZ3L+MuDrjuA6HC5b/sZ6jI1wQ9m5mP2Wr/kqMIakvgggFyiIF9FP3n3UI
         UML7J4sijMjc2Wv8/Ko7EgMJl0to70eTKbRNBYTpCJjKayPX/23rgwwj3lK0A+xTtr+g
         4bVkGBUUqRV419vuyifeafHk8R2cShQ8ACXp48VafMSyw0LAj6vNjUk91e6z7VcWHcMZ
         5EfA==
X-Forwarded-Encrypted: i=1; AL+hErHLYHslkMgVarx9KtUJAMO6QGsvkAjPhHKvSC2E1rn4Oe28D6NrSkhTV7dCxdxy2hZJX+cVccPQNw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ISq2qhBWlNJ+xSN1R5uRfSbSlCyZfpI/ljwgZpsCkVEHQ1GHx
	yGhkmGCGCEgFJFsPjXVniZFi74/jGdMoPGryfpJi1CkAMJyYVCiQUADK
X-Gm-Gg: AYBFou10QD0LCc/jfL1gSCgWFIiwHXvNE45Sp1SAFv+D9YjnmyCI6KRrZ6eTDftoq4a
	aA09quwXUttkEjtQfBT7HGDJw7XQu7lNC/IB1WnokKx1Tgm+oeMijnmlrHwe+VD8Xa8tFuAaAJE
	ku4BDSzuu6XaNn9VgbN1DYS4HF3WijUwO8qMOOM44shA1ue9pATrIhdL1p0EOQfH1R3L1+PTipL
	r2yxxh2tR9fP7rOwC2g/i0KwQawYhQABSCA9jnLyCdT0VTuEfQpU76cVu+g2nYG0uExEMRRGwLv
	r1tQj8pNYZSWgOl1wzvZVTh66RCdOsUD7VIv+VQZpokw4vx8vJpP9wdyWLHIvKCVEKdgXnJF8bN
	o7SuQmxw2iauxnCvP5Jh1aetC7ETeYTXYwUJ4z8ntXxZ0HrdxUIwa0Ac3t7FnYlCInktXbxku1d
	s9ENeYM2dBSEMMca3T4uVvx4x9OhBjrw+PAt2S1NeEEgk9SN/9ALA/rB+xJhFPJDGFrY1b372RJ
	7DORvxnfEQY92Lj0yL62PXMZY5ktaJoQT07GsDlEf3owmAz1vFeTTLTc6GS2n6b3Jw+Y29ZnmMQ
	Zrqq2P0KKE43GlAhnmfJqrnllOwniqSvolvP
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr4243189a91.34.1794631411951;
        Fri, 13 Nov 2026 20:43:31 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:31 -0800 (PST)
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
Subject: [PATCH v8 2/4] gpu: nova-core: gsp: move the log buffers into their own file
Date: Sat, 14 Nov 2026 11:43:02 +0700
Message-ID: <20261114044304.245684-3-vladazaharova2018@gmail.com>
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

Move the GSP-RM log buffer code from gsp.rs into gsp/logbuffer.rs, ahead
of extending it. No functional change.

Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
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

