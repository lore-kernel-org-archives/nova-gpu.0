Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC73515C0;
	Mon,  3 Aug 2026 22:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796484; cv=none; b=j8KcTlUyNqzCeeIUTDaYGjjpkhyXiSaqKymtg5u0M+YqYzmPFzW9gqK4SlrcQaGgS8mWxRQMlLpZJKgSpBVriH+/VMzYDNX93K6Gn4uW1unSkS84Zb960jBTZCE9XsLPlw4b8XdoyA+HOFH2PpNQDv1aMGTqo9G6hX2RWauajwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796484; c=relaxed/simple;
	bh=H0kgME+59pbHu35ntL0gtmYTh0nf/TN1AHSGkneMNN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W7twWvd/PCtVS0sh/oGc32V3gCDIzckvFLPlNE0e/RBuU8TfQIMGjgHFP/ZoN5tZ4VNaFjhEOHPykC7ezdNpiLRFG6me9EstXsFVJuyg4oH2o3oRCbsSushRSwrM0q/LnuQzBx+Qnm3uaYGPTT4iYkqQUWwrsSE68vchxBe8e38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GZn976nu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GZn976nu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFA42C2BCB9;
	Mon,  3 Aug 2026 22:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785796483;
	bh=H0kgME+59pbHu35ntL0gtmYTh0nf/TN1AHSGkneMNN0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=GZn976nu7ac66csSDx/t/xCCLxr9V8+wOZWVcIn2Z7mcwp6DHpULWWJjE5Dx4+VXo
	 pB9VyWm9M+5RDMkHnb9w0hpnxfDARq5r7ILtuqbGOiqpfFlCduK/r67LYDXjQvpfdB
	 P3aV1i4c79MdGlfJzmRhZy6uqQmb4z+QKFkD7hbKh/ZNU5jYTfAxl5bB/8UOU4f6IK
	 t/oQ1H+2DxUcnWy7fOrt2fFIlso/oTq+zQdppMSPpiiyGU1y667+aXKeSevTbZ6jyO
	 3o4iBydaxZgAK36o1I98hjGC/yGNyiHs7wazzGTT89POUC3cvDFHc+mUGWPXXpGnuS
	 LWz/FWAw4rTAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF92C55184;
	Mon,  3 Aug 2026 22:34:43 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Tue, 04 Aug 2026 00:34:42 +0200
Subject: [PATCH] gpu: nova-core: Extract PMC registers definitions
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-b4-extract-pmc-registers-to-gpu-mod-v1-1-86c0895b6072@nanonej.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQqDMBBA0avIrDuQRqm2VykuYhzjFDRhJhZBv
 HvTdvk2/x+gJEwKj+oAoTcrx7XgeqnAz24NhDwWgzX2ZjrT4NAg7Vmcz5gWj0KBNZMo5oghbbj
 EEdt7TWRN2zlbQykloYn33+XZ/63b8CKfv2k4zw8RDL7fhwAAAA==
X-Change-ID: 20260804-b4-extract-pmc-registers-to-gpu-mod-793ee2078a23
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8896; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=BCiN9iC9b9zOA3uAT+vAUZnIyLFnI7OUNMD8vE7JRrA=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqcReCVlHmmicZXeWzfmHTNzI0UfUGh5pf+O+Fe
 6OIbvpJf8KJAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCanEXggAKCRBmh/EjChUV
 /RTEEACLoF/XsFg3JHHeMZuzwLclYhd1nw5U1hJcugCezfZMHCdA6KLfMpjJq6fMMQBmX3VNrPf
 hFH4cMN2mS1Rp6USpd30IuEW3MFQZJTfI17gHcwYo7wzQ1Hy1wdTP2IrCnsZ28skvBHeBSHz6UD
 4hmtKBUGm4/njJmeLeNHiTmZoXDDydtdAyVG3vUtk50Sycfp4Mv8BBA5JqOMLdO41RpGaYdpQMa
 xmM1QJ1/jgsCFCB+mMN110Q8phguwnCna/hr6rO9R6rLEPE22WJnrhP0i7MG0U1Quw8Q9LrUi+y
 +s+p5nRoyH60xnini3z5fHNcY0M6GUPbU/V/ARfPjR3hWcnbvCPVxlz+08nrsLYqseSAf57NWwr
 yB9quXEutJ/yzcWIJ81B01JviiwNyD71zxbM0uxK+LB638ExO6yAzzYkiChOBfsnlM2dnfQguRq
 lDYZ07TM1ECtTZ/pm7/ZkXPUkp0hQ2rxJb8ASBgi0S4QpJkOFVcSO/+ze1SLCAxwNqyhAXd0z3w
 2MddZh85NgTM0npQThIRevP6sSrUrSx5tdWeVexAPf8Z/oePjRoNNZ3VF0/IHK+rl9Q+mg4kGG/
 np2cDSjg8xDEkpqvBzFwgaXNNOQ21D1ui507LOkGPWlZGKxlxooUh0tskerYoT7MMHQ5OSU+zr/
 2zocB7JAc1trjxw==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Move PMC register definitions (NV_PMC_BOOT_0, NV_PMC_BOOT_42) and
their associated implementations from the root regs.rs file into the
gpu module that own them, in the new gpu/regs.rs file.

This follows the same pattern established by previous commits for
GSP, PDISP, PFB, and PBUS registers: register definitions move to
the module that owns them, visibility changes to pub(super), and
cross-module access is provided via pub(crate) helper functions.

Since falcon.rs (outside the gpu module) also reads NV_PMC_BOOT_0 for
its raw value, a pub(crate) helper function boot_0_raw() is added in
gpu.rs to provide that access without exposing the register type
directly.

Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
Move PMC register definitions (NV_PMC_BOOT_0, NV_PMC_BOOT_42) and
their associated implementations from the root regs.rs file into the
gpu module that own them, in the new gpu/regs.rs file.

This follows the same pattern established by previous commits for
GSP, PDISP, PFB, and PBUS registers: register definitions move to
the module that owns them, visibility changes to pub(super), and
cross-module access is provided via pub(crate) helper functions.

Since falcon.rs (outside the gpu module) also reads NV_PMC_BOOT_0 for
its raw value, a pub(crate) helper function boot_0_raw() is added in
gpu.rs to provide that access without exposing the register type
directly.
---
 drivers/gpu/nova-core/falcon.rs   |  2 +-
 drivers/gpu/nova-core/gpu.rs      |  7 +++-
 drivers/gpu/nova-core/gpu/regs.rs | 82 +++++++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs     | 75 -----------------------------------
 4 files changed, 89 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index a91cbdd5d636..5bc03cc0d33f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -394,7 +394,7 @@ pub(crate) fn reset(&self) -> Result {
 
         self.bar.write(
             WithBase::of::<E>(),
-            regs::NV_PFALCON_FALCON_RM::from(self.bar.read(regs::NV_PMC_BOOT_0).into_raw()),
+            regs::NV_PFALCON_FALCON_RM::from(crate::gpu::boot_0_raw(self.bar)),
         );
 
         Ok(())
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 42a4cd7971fa..9e4232645a7e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -29,11 +29,11 @@
         Gsp,
         GspBootContext, //
     },
-    regs,
     vgpu::VgpuManager, //
 };
 
 mod hal;
+mod regs;
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
@@ -414,3 +414,8 @@ pub(crate) fn new(
         })
     }
 }
+
+/// Reads the boot0 register and returns its raw value.
+pub(crate) fn boot_0_raw(bar: Bar0<'_>) -> u32 {
+    bar.read(regs::NV_PMC_BOOT_0).into_raw()
+}
diff --git a/drivers/gpu/nova-core/gpu/regs.rs b/drivers/gpu/nova-core/gpu/regs.rs
new file mode 100644
index 000000000000..1c4db9625250
--- /dev/null
+++ b/drivers/gpu/nova-core/gpu/regs.rs
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::{
+    io::register,
+    prelude::*, //
+};
+
+use super::{
+    Architecture,
+    Chipset, //
+};
+
+// PMC
+
+register! {
+    /// Basic revision information about the GPU.
+    pub(super) NV_PMC_BOOT_0(u32) @ 0x00000000 {
+        /// Lower bits of the architecture.
+        28:24   architecture_0;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// MSB of the architecture.
+        8:8     architecture_1;
+        /// Major revision of the chip.
+        7:4     major_revision;
+        /// Minor revision of the chip.
+        3:0     minor_revision;
+    }
+
+    /// Extended architecture information.
+    pub(super) NV_PMC_BOOT_42(u32) @ 0x00000a00 {
+        /// Architecture value.
+        29:24   architecture ?=> Architecture;
+        /// Implementation version of the architecture.
+        23:20   implementation;
+        /// Major revision of the chip.
+        19:16   major_revision;
+        /// Minor revision of the chip.
+        15:12   minor_revision;
+    }
+}
+
+impl NV_PMC_BOOT_0 {
+    pub(super) fn is_older_than_fermi(self) -> bool {
+        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
+        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
+
+        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
+        // GF100, means "older than Fermi".
+        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
+    }
+}
+
+impl NV_PMC_BOOT_42 {
+    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
+    pub(super) fn chipset(self) -> Result<Chipset> {
+        self.architecture()
+            .map(|arch| {
+                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
+                    | u32::from(self.implementation())
+            })
+            .and_then(Chipset::try_from)
+    }
+
+    /// Returns the raw architecture value from the register.
+    fn architecture_raw(self) -> u8 {
+        ((self.into_raw() >> Self::ARCHITECTURE_RANGE.start())
+            & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1)) as u8
+    }
+}
+
+impl kernel::fmt::Display for NV_PMC_BOOT_42 {
+    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
+        write!(
+            f,
+            "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
+            self.inner,
+            self.architecture_raw(),
+            self.implementation()
+        )
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index caeef4d85874..7ebb62e504b4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -28,83 +28,8 @@
         PFalconBase,
         PeregrineCoreSelect, //
     },
-    gpu::{
-        Architecture,
-        Chipset, //
-    },
 };
 
-// PMC
-
-register! {
-    /// Basic revision information about the GPU.
-    pub(crate) NV_PMC_BOOT_0(u32) @ 0x00000000 {
-        /// Lower bits of the architecture.
-        28:24   architecture_0;
-        /// Implementation version of the architecture.
-        23:20   implementation;
-        /// MSB of the architecture.
-        8:8     architecture_1;
-        /// Major revision of the chip.
-        7:4     major_revision;
-        /// Minor revision of the chip.
-        3:0     minor_revision;
-    }
-
-    /// Extended architecture information.
-    pub(crate) NV_PMC_BOOT_42(u32) @ 0x00000a00 {
-        /// Architecture value.
-        29:24   architecture ?=> Architecture;
-        /// Implementation version of the architecture.
-        23:20   implementation;
-        /// Major revision of the chip.
-        19:16   major_revision;
-        /// Minor revision of the chip.
-        15:12   minor_revision;
-    }
-}
-
-impl NV_PMC_BOOT_0 {
-    pub(crate) fn is_older_than_fermi(self) -> bool {
-        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manuals :
-        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u32 = 0xc;
-
-        // Older chips left arch1 zeroed out. That, combined with an arch0 value that is less than
-        // GF100, means "older than Fermi".
-        self.architecture_1() == 0 && self.architecture_0() < NV_PMC_BOOT_0_ARCHITECTURE_GF100
-    }
-}
-
-impl NV_PMC_BOOT_42 {
-    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
-    pub(crate) fn chipset(self) -> Result<Chipset> {
-        self.architecture()
-            .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
-                    | u32::from(self.implementation())
-            })
-            .and_then(Chipset::try_from)
-    }
-
-    /// Returns the raw architecture value from the register.
-    fn architecture_raw(self) -> u8 {
-        ((self.into_raw() >> Self::ARCHITECTURE_RANGE.start())
-            & ((1 << Self::ARCHITECTURE_RANGE.len()) - 1)) as u8
-    }
-}
-
-impl kernel::fmt::Display for NV_PMC_BOOT_42 {
-    fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
-        write!(
-            f,
-            "boot42 = 0x{:08x} (architecture 0x{:x}, implementation 0x{:x})",
-            self.inner,
-            self.architecture_raw(),
-            self.implementation()
-        )
-    }
-}
-
 // PBUS
 
 register! {

---
base-commit: 44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c
change-id: 20260804-b4-extract-pmc-registers-to-gpu-mod-793ee2078a23

Best regards,
--  
Antonin Malzieu Ridolfi <dev@nanonej.com>


