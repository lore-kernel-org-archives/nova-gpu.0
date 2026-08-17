Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280FE3E8C64;
	Mon, 17 Aug 2026 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786997123; cv=none; b=Zl3hKrxvoT6XFYgegzHa16b0jlToKVDUFMdBft5Y38UKxN3KGeMUnW0Zi4iaVBkhynRB+wh2ccJHLNXhJHJ74bUXXqPu1KDUHmgn0isD81h6bVCKYOaGKDx/Ji88RYzqR58tV8/a73Pawz5P07guS8S5iO+4Ft9zkYioRGPP+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786997123; c=relaxed/simple;
	bh=i1mPXR0qSjylTx+iZz4VjsALSsmL38b5KB99VC7pfE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h4lV2OW4WTYs5dPnLPtwzvTXmI8AdwkVFH7S+vA3Od7Y9Iay86FuFIYG8aRrEaeNDWCZcrEdjVqB+q8Ia2QBxDW+CnbMOh0GXSxIczDC5jRXttNIPNVxKWZk0VNT6kRlOio6tQNT3xit/XZobi8c/QrPrHutz1ESnUnER0gs6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DvyaA1+7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DvyaA1+7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3D47C2BCB3;
	Mon, 17 Aug 2026 20:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786997122;
	bh=i1mPXR0qSjylTx+iZz4VjsALSsmL38b5KB99VC7pfE0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=DvyaA1+7J7x3bj+fYjS+DzqYfSAnV0T0iAzvWjWDWmJs9Cm7ed1duQlgf+10/cCbJ
	 rGLASRAxlj0sM3KszZDYOGdgWbjHAGYmK/rkyX/icsEWQc5NJrVM/EBdQQ0QqHDk5p
	 TGA3cBxjv3T3Lk541YhJhYhUF/SgtvkB94N4v3KPvFE1Ooh5SINc4hvmHOzcj/4kHx
	 bJXzugm+G4OF8ah467p3ce8DF29QNCCKNc2I6qkmqzBSIF4a//tQznrrenbmRE7z5J
	 IU0Mn3aiFRaN7Aa8uJSaz+vVLcytJ2lHkKXyQ2JUq0mI5AlDHSoNw9A11egHe9572g
	 CTzUfQS8sn2zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A63C5DF66;
	Mon, 17 Aug 2026 20:05:22 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Mon, 17 Aug 2026 22:04:47 +0200
Subject: [PATCH] gpu: nova-core: Extract FUSE registers definitions
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-b4-extract-fuse-registers-to-gpu-mod-v1-1-c4924070bbb0@nanonej.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NSwqDMBSF4a1Ixr2QhzTqVoqDmFxtCj56kxRB3
 HvTWmgHHf5wON/GApLHwJpiY4QPH/w85RCngtmrmQYE73IzyeWZV0JDVwKukYyN0KeAQDj4EJE
 CxBmGJcE4OxBOcSf62ijNWb5aCHu/vplLe3RI3Q1tfH1/FoT3lP14zL58Uxw4L3/xZbT/bV0rR
 Ml1ZaRi7b4/AaB8s4vjAAAA
X-Change-ID: 20260817-b4-extract-fuse-registers-to-gpu-mod-1d30d1f9a370
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6957; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=TEU3cGdfr+0GsbAb4FDIovW/u3AWeIqXEMHGfNEojoU=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqg2lf1ctcM1fOoXqnXns/xyOEyIi9J+nyLlPLR
 Cn+mqLhPKOJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCaoNpXwAKCRBmh/EjChUV
 /eE2D/0eLW6yf5bwty+dotJUzHYlwaA7/HPEFsBGLyEhw08Tn0WSAnaUAgGYirdItO25j5Ihowg
 tOfe9zBnHXLNQMQERfBsO+PuSCFOyFoXO6N4TqOnmz9SV4wxH4OqiZpNwszQmdj0rhtB5Xo4vtc
 oZi5B25PhDItCqlPPLbW98bcdAJzYTi5WIWhNF5N3zg9TJ6WkIMWPcROZvtUrdhwqiynU+T9N6U
 PD1lVxiJ0QYAJMLxcpIN4X3rzFzBSzyrSPyt7GFJZGXOWjp+gxmk4kQfK1Hx40le/diaR8wHG53
 PXBXKobDFp93UFecq5pGJ5//7mpUajPKS2s1lRG4AmL4p/yAw9m1EhkcqVibPzZ6jpaa4klrwH5
 5fFzpgZP7lodtnxDld3Bo2oBdegLK7OUIUmRE94tmRqEkKv0sPxHWv6Z22KOtD0Ntspt9GToveh
 rvcsQIero237HsT5w5bctHf157QY+9MLY/dscCf3DWOuSPKtY1EYnqAPwddjqM7ROezg1PaaIvi
 nnQtIc8YoVSx01FfMAJ1kLz5pDmO2qj1lw9HHohMBaONtXdnUcZAUwj/NkekBG/4RUT1ES98vHG
 PvB9YwPKk/w/azFWnlgXYVA0+Z1K3q5h5M0Lv+845ljb4E0zaTx1fzYqXx4LtQxUnzGkGsy4WD/
 kFqM+BXxR24ejPg==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Move FUSE register definitions from the root regs.rs file into the
gpu module that own them, in the existing gpu/regs.rs file.

This follows the same pattern established by previous commits for
GSP, PDISP, PFB, PBUS and PMC registers: register definitions move to
the module that owns them, visibility changes to pub(super), and
cross-module access is provided via pub(crate) helper functions.

Since gal102.rs (outside the gpu module) also reads fuse registers to
infer fuse version, a pub(crate) helper function fuse_ucode_version()
is added in gpu.rs to provide that information without exposing the
register type directly.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
I got several doubts regarding this patch:
- I didn't touch the comment in falcon/hal/ga102.rs:71 cause I didn't
  know if this information should stay there
- I'm not sure if the re-export of NV_FUSE_OPT_FPF_SIZE in gpu.rs is the
  right way to keep the read in gal102.rs or if I should also make an
helper to get its value
- Then, as I'm not quite sure to understand the exact purpose of the
code I'm not sure of the `fuse_ucode_version` naming and the comment
explaining what it do
---
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 17 ++++-------------
 drivers/gpu/nova-core/gpu.rs              | 31 ++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gpu/regs.rs         | 18 ++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             | 18 ------------------
 4 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 7600ee07ca2e..590e30218527 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -7,7 +7,6 @@
     io::{
         poll::read_poll_timeout,
         register::{
-            Array,
             WithBase, //
         },
         Io, //
@@ -26,7 +25,8 @@
         FalconModSelAlgo,
         PeregrineCoreSelect, //
     },
-    regs,
+    gpu,
+    regs, //
 };
 
 use super::FalconHal;
@@ -59,7 +59,7 @@ fn signature_reg_fuse_version_ga102(
 ) -> Result<u32> {
     // Each engine has 16 ucode version registers numbered from 1 to 16.
     let ucode_idx = match usize::from(ucode_id) {
-        ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
+        ucode_id @ 1..=gpu::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
         _ => {
             dev_err!(dev, "invalid ucode id {:#x}\n", ucode_id);
             return Err(EINVAL);
@@ -68,16 +68,7 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
-        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_idx))
-            .data()
-    } else if engine_id_mask & 0x0004 != 0 {
-        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode_idx))
-            .data()
-    } else if engine_id_mask & 0x0400 != 0 {
-        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_idx))
-            .data()
-    } else {
+    let Some(reg_fuse_version) = gpu::fuse_ucode_version(bar, engine_id_mask, ucode_idx) else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
         return Err(EINVAL);
     };
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9e4232645a7e..746a7dec8906 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,7 +6,10 @@
     device,
     dma::Device,
     fmt,
-    io::Io,
+    io::{
+        register::Array,
+        Io, //
+    },
     num::Bounded,
     pci,
     prelude::*,
@@ -35,6 +38,8 @@
 mod hal;
 mod regs;
 
+pub(crate) use regs::NV_FUSE_OPT_FPF_SIZE;
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -419,3 +424,27 @@ pub(crate) fn new(
 pub(crate) fn boot_0_raw(bar: Bar0<'_>) -> u32 {
     bar.read(regs::NV_PMC_BOOT_0).into_raw()
 }
+
+/// Returns the fuse version matching `engine_id_mask`,
+/// at the given `ucode_idx`.
+/// Returns `None` if no engine matches `engine_id_mask`.
+pub(crate) fn fuse_ucode_version(
+    bar: Bar0<'_>,
+    engine_id_mask: u16,
+    ucode_idx: usize,
+) -> Option<u16> {
+    let version = if engine_id_mask & 0x0001 != 0 {
+        bar.read(regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::at(ucode_idx))
+            .data()
+    } else if engine_id_mask & 0x0004 != 0 {
+        bar.read(regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::at(ucode_idx))
+            .data()
+    } else if engine_id_mask & 0x0400 != 0 {
+        bar.read(regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::at(ucode_idx))
+            .data()
+    } else {
+        return None;
+    };
+
+    Some(version)
+}
diff --git a/drivers/gpu/nova-core/gpu/regs.rs b/drivers/gpu/nova-core/gpu/regs.rs
index 1c4db9625250..a6ce4ff44cd1 100644
--- a/drivers/gpu/nova-core/gpu/regs.rs
+++ b/drivers/gpu/nova-core/gpu/regs.rs
@@ -80,3 +80,21 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
         )
     }
 }
+
+// FUSE
+
+pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
+
+register! {
+    pub(super) NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
+        15:0    data => u16;
+    }
+
+    pub(super) NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
+        15:0    data => u16;
+    }
+
+    pub(super) NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
+        15:0    data => u16;
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3422b49df7a7..562499ff6e08 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -94,24 +94,6 @@ pub(crate) fn usable_fb_size(self) -> u64 {
     }
 }
 
-// FUSE
-
-pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
-
-register! {
-    pub(crate) NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824100 {
-        15:0    data => u16;
-    }
-
-    pub(crate) NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x00824140 {
-        15:0    data => u16;
-    }
-
-    pub(crate) NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION(u32)[NV_FUSE_OPT_FPF_SIZE] @ 0x008241c0 {
-        15:0    data => u16;
-    }
-}
-
 // PFALCON
 
 register! {

---
base-commit: 60b5976d1367cd50314e867bc1169e759ab309b9
change-id: 20260817-b4-extract-fuse-registers-to-gpu-mod-1d30d1f9a370
prerequisite-change-id: 20260804-b4-extract-pmc-registers-to-gpu-mod-793ee2078a23

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


