Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701926D4E5;
	Mon, 25 May 2026 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749946; cv=none; b=SqYviyDnlrfe0GCdz4Sqq34USJg74/nU78yFcC3Z+wB7bdWyRPOnplFlx+Sh5YtK/fMXASRkRcrwzCjbU5i3g0jqxx005rpoyCGkzvCu7C3XqunMQ/VGBVZc4HIiRHuYF4MxcAd9lQfkn4lMJ/kbErXC0rebybuSKduGMEtB5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749946; c=relaxed/simple;
	bh=uDca8nfiSB49kkMkHHG3RVcw7CPdPOckjEeYtGnCa3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TV6X4+3uTM+DGPn5+X3eBPL38UinsePEMA889gCPUa2hGwwTouz4OoqwkH79ph5w+zfOdaSxipgJuUtgNMl4E/GCmmWiE9ot4Vf+hGgW4QIBdnom6T3wtHpF+Y9NtNWyLY+4MGyTGBpi7Zt9MqChMGEq518egQ/d/v3Zjes9V4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVqtI4gB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVqtI4gB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE801F000E9;
	Mon, 25 May 2026 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779749944;
	bh=L1d7UULgaosIXxBW7/PeEq+ReoPxcxwGmVZLUt9dhbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BVqtI4gBPRr6mv32/kNFuM2DUAbhzRXeWaF6NtE4X8QdxKwBBuLz3IaofBFUm5fNM
	 fx8rJ2s1atFucDwPruiOoEezrTF+iZ9j/MXm77TRPCyzyx8z2qmAVXJcCp0TB2FiTJ
	 ua2nKliZLQotm+9v2LSj0+mHQo2MVE2DLwF1Y+vLkFAhnfOhBCXafG3abmDLJrZiE0
	 pH7Irjnd4MGYsz9W9MbvEueV40uOdJefWo+AErffF10VQp1D+1GNp0YaDARzYO4Qtb
	 p2UY9SDEWqDieyt099zhNhSyfUNEu1XFr3hriZRCGbMLTkQLbK0/1CyR9Mk7DHArXn
	 wOLmjPBCTVqXw==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	ttabi@nvidia.com,
	joelagnelf@nvidia.com,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 4/5] gpu: nova-core: gsp: replace ARef<Device> with &'a Device in sequencer
Date: Tue, 26 May 2026 00:58:32 +0200
Message-ID: <20260525225838.276108-5-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525225838.276108-1-dakr@kernel.org>
References: <20260525225838.276108-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GspSequencer, GspSeqIter, and GspSequencerParams are already
lifetime-parameterized; the ARef<Device> is unnecessary -- a plain
&'a Device reference suffices.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gsp/boot.rs      |  2 +-
 drivers/gpu/nova-core/gsp/sequencer.rs | 11 +++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index df105ef4b371..3e8f9611d2b3 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -234,7 +234,7 @@ pub(crate) fn boot(
             libos_dma_handle: libos_handle,
             gsp_falcon,
             sec2_falcon,
-            dev: pdev.as_ref().into(),
+            dev,
             bar,
         };
         GspSequencer::run(&self.cmdq, seq_params)?;
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 474e4c8021db..b3015483ed17 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -11,7 +11,6 @@
         Io, //
     },
     prelude::*,
-    sync::aref::ARef,
     time::{
         delay::fsleep,
         Delta, //
@@ -142,7 +141,7 @@ pub(crate) struct GspSequencer<'a> {
     /// Bootloader application version.
     bootloader_app_version: u32,
     /// Device for logging.
-    dev: ARef<device::Device>,
+    dev: &'a device::Device,
 }
 
 impl fw::RegWritePayload {
@@ -281,7 +280,7 @@ pub(crate) struct GspSeqIter<'a> {
     /// Number of commands processed so far.
     cmds_processed: u32,
     /// Device for logging.
-    dev: ARef<device::Device>,
+    dev: &'a device::Device,
 }
 
 impl<'a> Iterator for GspSeqIter<'a> {
@@ -309,7 +308,7 @@ fn next(&mut self) -> Option<Self::Item> {
             self.cmd_data.len() - offset
         };
         buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset + copy_len]);
-        let cmd_result = GspSeqCmd::new(&buffer, &self.dev);
+        let cmd_result = GspSeqCmd::new(&buffer, self.dev);
 
         cmd_result.map_or_else(
             |_err| {
@@ -334,7 +333,7 @@ fn iter(&self) -> GspSeqIter<'_> {
             current_offset: 0,
             total_cmds: self.seq_info.cmd_index,
             cmds_processed: 0,
-            dev: self.dev.clone(),
+            dev: self.dev,
         }
     }
 }
@@ -350,7 +349,7 @@ pub(crate) struct GspSequencerParams<'a> {
     /// SEC2 falcon for core operations.
     pub(crate) sec2_falcon: &'a Falcon<Sec2>,
     /// Device for logging.
-    pub(crate) dev: ARef<device::Device>,
+    pub(crate) dev: &'a device::Device,
     /// BAR0 for register access.
     pub(crate) bar: &'a Bar0,
 }
-- 
2.54.0

