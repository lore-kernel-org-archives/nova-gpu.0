Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794630949;
	b=Uv6MqPn3sjNOYjvSpV5fAl377neuJuG4oPsLQU5QhLdn+vApHfNkaLtsGG1SEQItnMlh
	 YNRTf2qj0F8JMfo6+jBkBRoTPVJsOdiPIbsz5d7AyE9Isl8ONFZaO9EBjnTmQsUfWGh0d
	 qKEGS0W4gFQkxumckFpK3hh580vHBPiMc9njgkJVXj+kLBhQdNjPF1TqW/CFj7ZjZgdIX
	 17qam8Nh2RUvyf1Q7sBvmbJot1dneL/PQ39VHROMG08BDyAmrK8GFUIYK0BkRFMu1avsH
	 OSQscKgea5EZEBdcfQA7VHfzCfuJSBNqB/98KXSIeneszNbYNasNxRbdfMFj+oJIKJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794630949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
	b=1WF2iy4++s8WpwmpooGHQC4Cs8ekNClTN/N1tDTNkO48daZHRpzJVM8JnapMHdzAk01L
	 9oR2V3QowZKOvdGSadYtYc/0FwD7vyKB0hlptABb93UluZVYycAF/GWHLT/9HWVyHWfRR
	 RLxLTLnKuKtSPR4I0gq7B8XGcPtwFR/1+1amqGu9SDBYBjXG1rLxBqn4FslNpApF3qlv0
	 OwXylntiauowyUjA21MAz2tuD9U85NeQV0MiEyt47nNxodaf1OwvY3cGPdr1VbjQQRt8I
	 /BWZsN3djKrw+bB8SMyCkuZ9HDV7JdbT22SPySZdJR3g9VxNc2coJ3hNeP5Uf3m8Kdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPUFCBpH;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05020606A323
	for <nova-gpu@lists.linux.dev>; Sat, 14 Nov 2026 04:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05020606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPUFCBpH
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so881579a91.1
        for <nova-gpu@lists.linux.dev>; Fri, 13 Nov 2026 20:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794630947; x=1795235747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
        b=TPUFCBpHrU4NmPX/kjCnQSvUqjQrNd5nzv/niW9KIa69gsSe28NE21ZqDZyixiiCD5
         MeoU3RKOv2gqSweVwKSoPY1RgLt9Lx8sfY/VBZE2BKMVj5B7UjP7ihct5ALI7QpX3k0x
         TZdJPjFWMxJ25rxha0oADk/E7dkQ3AvHVLPRRJ2+Mu6aJZ/VV0mQqivWl7dxeO/EN/vR
         4KyqDEZ2fFQP9v4UaPq0G8ucedklaEG8uihuIxAmNIcEowykk7vwRXen/Tx/twkZi/v8
         RNFqgNhlz1BM9ztWl8rK4pW1cdJGlOov0QWFbOlHUgS4XvmIc5m9dnxtCgnsX0hOG11g
         XJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794630947; x=1795235747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxV2i3CwJwPvn+mwJ4cbWtgTLXqgAkSjs2t6czxawYk=;
        b=1l1pBFTQbVxQtxoAEWpky+5wjdvLydGusjEDzag+ngUOS0fxoslTmWhzmlzFuYxNAC
         LkwknUr5GSfv2kzb6dWSSpJNzJKtsOSBDzWkSDlG6u1tgasaA31UFkSSdt0/SHwWZm82
         r/xVjnO0uL3U+r1FeATPHrXPl0sQd0um5GHM7vdJEPHa4k04cTfBt7+9uCKOnWaf8bXw
         hN6IbF9/IKs8BglyfFfHvHQpEj2CEaAGYrCBJz6Xa73oppApQEWJ9P4RSS/WQ8jUxU0F
         92KsfCaSgrMIhH7urDkjzV0bru0gZL79j6sMI5bmh+5m2bWSkywmm43oIA5rQ9aMSdoC
         Cn4w==
X-Forwarded-Encrypted: i=1; AL+hErF8aI+NpZhoC9LYGf+LIXxuTZbNwUkTf/AWHS7tdedX3Y0bT589dKBdTCMOC+l08XJYATUrLpKHqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z86P+KDpI2/5uMe2v3gBltIzFuDkd0fAWtY294AaiOn+cxsFnU9
	gQgwLe5WbFN9L5D1Mvtohdxbd2XWYcTORSGaqpUUylvrxHKjRsscIVdG
X-Gm-Gg: AYBFou2O3iCKzSdfyrVnT/cUs46G3yDtW9bInrymIPxbUH/UXJbQ+oD7kZD6CNf8kk/
	gCZo6/Y9gO7/M7YQVSF0aYM8V+eh7ni9jKinb9uGBBexn+biPAEmnj2M9cp5ZBOmPLwEUJlzVHy
	cWBSicMiZpMgZBbDML+d5e5a2yKJhu628XkZ0RCSAZ7vlDVGncRth/g1c1Jxd5y/OArAbViB2I8
	Ksv/JvP6CMQRlFgTWvNyiTawOkWqKHl4JAlXxcLuKZnVY+DG2yFwsrC3PvkMYfo5uLF5hpe7rMc
	gXw3J4cOaFaO7PWehBqD7PTZTLsxFaNi9Nd0rDVnd8j8d2WDTCqngUatcSXZeed/0Hb4ygAZKwF
	Wkf/DTqQ0p8YNyFJwgytwmrZ64i1DkI1fNC59mO4QGfamt0rjt0tQK/gkyh2eoX/xH4bDuiZFon
	5CYZzJMOoYiD+Y48Tgm8ni3UCORBX8OfE6i02R4X5dPeTqG46J3EvN2l7KNuxTcVFM9FWiRLEoi
	OgDUiflVtCy8F0PrMgA1loObFJBjIE6D+918JGthQAZskA3NSdu7mUpNXBpfPOu47HmM0sXc+tV
	+7nFoqQRI8i18tj62uHtQPGHIoAHFgJtRoY=
X-Received: by 2002:a17:90a:c88b:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b1b0ba890emr4682230a91.59.1794630947279;
        Fri, 13 Nov 2026 20:35:47 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d32ea0sm12089020a91.15.2026.11.13.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:35:46 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	joelagnelf@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ecourtney@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v2] gpu: nova-core: mm: reserve room for every prepared page table page
Date: Sat, 14 Nov 2026 11:35:35 +0700
Message-ID: <20261114043535.158583-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

install_mappings() moves every page in pt_pages into page_table_allocs
with push_within_capacity(), but prepare_map() reserves room only for an
estimate of the pages of the mapping it prepares. The estimate is too
low for a range that crosses a page table boundary, and it leaves out
pages that earlier calls put in pt_pages. Preparing several mappings
before executing them is then enough to make the push fail. The page is
freed although its PDE has been written, and pages still in pt_pages
can have their PDEs installed into it later.

Reserve room for each page when it is added to pt_pages, and drop the
estimate. Also move a page into page_table_allocs before writing its
PDE, so that a failing PDE write does not free it either.

The problem was found by an LLM-assisted code review.

Fixes: 4e4182282d4e ("gpu: nova-core: mm: Add multi-page mapping API to VMM")
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
v2: reserve room for each page as it is added to pt_pages, so that pages
left by earlier or failed calls are covered too. The Sashiko review
pointed out that v1 alone still lets a failing push free a parent page
while its children stay in pt_pages.

Tested on a GB203 with a temporary self-test that prepares eight
single-page mappings 1 TiB apart in a fresh Vmm and then executes them:
without this patch every execute_map() fails with -ENOMEM, with it they
all succeed. The MM self-tests still pass.

v1: https://lore.kernel.org/nova-gpu/20261113075422.943779-1-vladazaharova2018@gmail.com/

 drivers/gpu/nova-core/mm/pagetable.rs     | 24 ---------------
 drivers/gpu/nova-core/mm/pagetable/map.rs | 37 ++++++++++++++---------
 2 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 63a7e1855caa..03a132406a15 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -248,30 +248,6 @@ fn entry_size(level: PageTableLevel) -> usize {
             8 // 64-bit PDE/PTE
         }
     }
-
-    /// Compute upper bound on page table pages needed for `num_virt_pages`.
-    ///
-    /// Walks from PTE level up through PDE levels, accumulating the tree.
-    fn pt_pages_upper_bound(num_virt_pages: usize) -> usize {
-        let mut total = 0;
-
-        // PTE pages at the leaf level.
-        let pte_epp = Self::entries_per_page(Self::PTE_LEVEL);
-        let mut pages_at_level = num_virt_pages.div_ceil(pte_epp);
-        total += pages_at_level;
-
-        // Walk PDE levels bottom-up (reverse of PDE_LEVELS).
-        for &level in Self::PDE_LEVELS.iter().rev() {
-            let epp = Self::entries_per_page(level);
-
-            // How many pages at this level do we need to point to
-            // the previous pages_at_level?
-            pages_at_level = pages_at_level.div_ceil(epp);
-            total += pages_at_level;
-        }
-
-        total
-    }
 }
 
 /// Marker struct for MMU v2 (Turing/Ampere/Ada).
diff --git a/drivers/gpu/nova-core/mm/pagetable/map.rs b/drivers/gpu/nova-core/mm/pagetable/map.rs
index f7774b9cc972..2517fdcc5217 100644
--- a/drivers/gpu/nova-core/mm/pagetable/map.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/map.rs
@@ -116,6 +116,7 @@ fn ensure_single_pte_path(
         &self,
         mm: &mut GpuMm<'_>,
         vfn: Vfn,
+        page_table_allocs: &mut KVec<Pin<KBox<AllocatedBlocks>>>,
         pt_pages: &mut RBTree<VramAddress, PreparedPtPage>,
     ) -> Result {
         let max_iter = 2 * M::PDE_LEVELS.len();
@@ -140,6 +141,10 @@ fn ensure_single_pte_path(
                     install_addr,
                     level,
                 } => {
+                    // Reserve so install_mappings() can use push_within_capacity (no alloc in
+                    // fence signalling critical path). It installs every page in `pt_pages`,
+                    // including pages left by earlier calls, so keep room for all of them.
+                    page_table_allocs.reserve(pt_pages.iter().count() + 1, GFP_KERNEL)?;
                     let page = Self::alloc_and_zero_page(mm, level)?;
                     let node = RBTreeNode::new(install_addr, page, GFP_KERNEL)?;
                     let old = pt_pages.insert(node);
@@ -163,8 +168,8 @@ fn ensure_single_pte_path(
 
     /// Prepare page table resources for mapping `num_pages` pages starting at `vfn_start`.
     ///
-    /// Reserves capacity in `page_table_allocs`, then walks the hierarchy
-    /// per-VFN to prepare pages for all missing PDEs.
+    /// Walks the hierarchy per-VFN to prepare pages for all missing PDEs, and
+    /// reserves capacity in `page_table_allocs` for them.
     pub(super) fn prepare_map(
         &self,
         mm: &mut GpuMm<'_>,
@@ -173,16 +178,11 @@ pub(super) fn prepare_map(
         page_table_allocs: &mut KVec<Pin<KBox<AllocatedBlocks>>>,
         pt_pages: &mut RBTree<VramAddress, PreparedPtPage>,
     ) -> Result {
-        // Pre-reserve so install_mappings() can use push_within_capacity (no alloc
-        // in fence signalling critical path).
-        let pt_upper_bound = M::pt_pages_upper_bound(num_pages);
-        page_table_allocs.reserve(pt_upper_bound, GFP_KERNEL)?;
-
         // Walk the hierarchy per-VFN to prepare pages for all missing PDEs.
         for i in 0..num_pages {
             let i_u64: u64 = i.into_safe_cast();
             let vfn = Vfn::new(vfn_start.raw() + i_u64);
-            self.ensure_single_pte_path(mm, vfn, pt_pages)?;
+            self.ensure_single_pte_path(mm, vfn, page_table_allocs, pt_pages)?;
         }
         Ok(())
     }
@@ -207,10 +207,21 @@ pub(super) fn install_mappings(
             while let Some(c) = cursor {
                 let (next, node) = c.remove_current();
                 let (install_addr, page) = node.to_key_value();
-                let page_vram =
-                    VramAddress::from_raw(page.alloc.iter().next().ok_or(ENOMEM)?.offset());
+                let page_vram = page
+                    .alloc
+                    .iter()
+                    .next()
+                    .map(|b| VramAddress::from_raw(b.offset()));
+                let level = page.level;
+
+                // Keep the page before pointing a PDE at it, so that no failure below can free a
+                // page that a PDE points at. ensure_single_pte_path() reserved room for it.
+                page_table_allocs
+                    .push_within_capacity(page.alloc)
+                    .map_err(|_| ENOMEM)?;
+                let page_vram = page_vram.ok_or(ENOMEM)?;
 
-                if page.level == M::DUAL_PDE_LEVEL {
+                if level == M::DUAL_PDE_LEVEL {
                     let new_dpde = M::DualPde::new_small(Pfn::from(page_vram));
                     new_dpde.write(pramin, install_addr)?;
                 } else {
@@ -218,10 +229,6 @@ pub(super) fn install_mappings(
                     new_pde.write(pramin, install_addr)?;
                 }
 
-                page_table_allocs
-                    .push_within_capacity(page.alloc)
-                    .map_err(|_| ENOMEM)?;
-
                 cursor = next;
             }
 

base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

