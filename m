Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657143E06A
	for <nova-gpu@lists.linux.dev>; Sat, 26 Sep 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426655; cv=none; b=YRgVziylqduVarmd98r+miIuU6kR0247IXow9361atrx+7KwtTgxJSloWV4qNAq5yMCmFVrl7FuRnh383+EG9ZRNeCzidFz+gA7hLWGD9gDWajV3+bVAE+XpdBsJOjkPZr6Bk0Wf4Zf4vm1FqX6la0/iDV/NzS6OldpgOsL/9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426655; c=relaxed/simple;
	bh=YEg4NSZnYeLuQvosXXxkzXjz584tPOPAz+I7YnjeC7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NAM90ATBN2YUyujOY0TzCLntEIrl09Sf5cSfZ8Cx6u6U8PeDMX+UCD9rnbddIUowUCwRhF26M1q5kF2jyWhEDwioFNXM3E/4Q0KduFDVk/ReO1J3boJJ3UCsQ23jEO9x3T7eAEHMGqQ2P+0GwGUHLzv8j1aB08nxh0c62U7U6jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUay6oS0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUay6oS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378C41F00898;
	Sat, 26 Sep 2026 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426652;
	bh=5L3CompX72sG2GpOS8TBtf9PZeipBZKMDVitrEtGYjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BUay6oS0iuRwNw7XSCRUHQK6Sk6sl5+8hPuHgZ3Tuiix4si4gGIVa6m4dqGA09FZF
	 gnJ4mIuXT+UIE9DK9fof+3G2fFtuKgeftsrvK4f2d/vOsMDL9AD7Zt98keHEkng3V5
	 iD5d0TfrLM4JuRS7aueFhL5iuFqQca6fA4BwwRCzynP0zXnDkifrNTultbarOMKAkp
	 DOG0m44EiB7W4xq0vNkgNbChGujgN864v08lzGpZXo1TWZnScqNYQoEsjoML4JReLX
	 PzNb/FwzI9duvbhIyRfqEcKyJmXX8PLd3QY7nZoMiDdcJmcpZitAP3qinqXQrXMGBA
	 LdX2i0EFRTokA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] gpu: nova-core: remove unnecessary Arc around BarUser
Date: Sat, 26 Sep 2026 14:43:25 +0200
Message-ID: <20260926124405.604707-3-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926124405.604707-1-dakr@kernel.org>
References: <20260926124405.604707-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary Arc around BarUser and get rid of
Result<impl PinInit<T>> in favor of impl PinInit<T, Error>.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gpu.rs         | 24 +++++++++++-------------
 drivers/gpu/nova-core/mm.rs          |  5 ++---
 drivers/gpu/nova-core/mm/bar_user.rs | 16 +++++++++-------
 3 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 1ae287c9e776..123e605fa2c2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -16,7 +16,6 @@
         SizeConstants,
         SZ_4K, //
     },
-    sync::Arc,
 };
 
 use crate::{
@@ -309,7 +308,8 @@ pub(crate) struct Gpu<'gpu> {
     /// the GSP is still operational.
     mm: GpuMm<'gpu>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
-    bar_user: Arc<BarUser<'gpu>>,
+    #[pin]
+    bar_user: BarUser<'gpu>,
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
@@ -465,19 +465,17 @@ pub(crate) fn new<'a>(
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
-            bar_user: {
+            bar_user <- {
                 let pdb_addr = VramAddress::from_raw(gsp_static_info.bar1_pde_base);
                 let bar1_idx = crate::driver::bar1_resource_index(pdev)?;
                 let bar1_size = pdev.resource_len(bar1_idx)?;
-                Arc::pin_init(
-                    BarUser::new(
-                        pdb_addr,
-                        gsp_resources.spec.chipset,
-                        bar1_size,
-                        bar1,
-                    )?,
-                    GFP_KERNEL,
-                )?
+
+                BarUser::new(
+                    pdb_addr,
+                    gsp_resources.spec.chipset,
+                    bar1_size,
+                    bar1,
+                )
             },
         })
     }
@@ -493,7 +491,7 @@ pub(crate) fn run_selftests(self: Pin<&mut Self>, pdev: &pci::Device<device::Bou
             dev,
             this.mm,
             regions,
-            this.bar_user,
+            &this.bar_user,
             this.gsp_static_info.bar1_pde_base,
             this.spec.chipset,
         ) {
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a5bc4042577b..8a934c55169f 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -298,8 +298,7 @@ pub(crate) mod selftest {
 
     use kernel::{
         device,
-        sizes::SizeConstants,
-        sync::Arc, //
+        sizes::SizeConstants, //
     };
 
     use super::*;
@@ -309,7 +308,7 @@ pub(crate) fn run(
         dev: &device::Device<device::Bound>,
         mm: &mut GpuMm<'_>,
         usable_fb_regions: &[Range<u64>],
-        bar_user: &Arc<bar_user::BarUser<'_>>,
+        bar_user: &bar_user::BarUser<'_>,
         bar1_pdb: u64,
         chipset: Chipset,
     ) -> Result {
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 86b5d302188e..6c8fa06d9f4b 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -51,12 +51,14 @@ pub(crate) fn new(
         chipset: Chipset,
         va_size: u64,
         bar1: Bar1<'gpu>,
-    ) -> Result<impl PinInit<Self> + 'gpu> {
-        let vmm = Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?;
-        Ok(pin_init!(Self {
-            vmm <- new_mutex!(vmm, "bar_user_vmm"),
+    ) -> impl PinInit<Self, Error> + 'gpu {
+        try_pin_init!(Self {
+            vmm <- new_mutex!(
+                Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?,
+                "bar_user_vmm",
+            ),
             bar1,
-        }))
+        })
     }
 
     /// Map physical pages to a contiguous BAR1 virtual range.
@@ -183,7 +185,7 @@ fn drop(&mut self) {
 pub(crate) fn run_self_test(
     dev: &device::Device<device::Bound>,
     mm: &mut GpuMm<'_>,
-    bar_user: &Arc<BarUser<'_>>,
+    bar_user: &BarUser<'_>,
     bar1_pdb: u64,
     chipset: Chipset,
 ) -> Result {
@@ -389,7 +391,7 @@ pub(crate) fn run_self_test(
 
     // Test 4: Exercise `BarUser::map()` end-to-end.
     let bar_user = Arc::pin_init(
-        BarUser::new(pdb_addr, chipset, SZ_64K.into_safe_cast(), bar1)?,
+        BarUser::new(pdb_addr, chipset, SZ_64K.into_safe_cast(), bar1),
         GFP_KERNEL,
     )?;
     let access = bar_user.map(mm, &[test_pfn], true)?;
-- 
2.55.0

