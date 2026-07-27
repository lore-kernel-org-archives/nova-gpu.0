Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92C3B71A1;
	Mon, 27 Jul 2026 15:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785167514; cv=none; b=BZ6k7oh4473hAiEiNClJuApEZCEobGjV8rsbg9/NmBynGI4C/vzz4t6SXyZh4YnI2LjVr4mnJ4yyxsp+ynBxtkNQ+8tBeSpgimhMxNI0PeoXFC9b9J5zsvF5gj4/fvUI7wvA2RkyG4JsIAkAGgB1hmyhO0Zdgk0lB/lgJlN/O60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785167514; c=relaxed/simple;
	bh=VyfPIXDvScrtMc7exUuLCZcbY2lJ8lQecsOnN8icPhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNYyURL9rqsRXhkNn/SOStAWXlITtvwGwBfpkO0mT5CUjrmT7CAGbnDeNf0ow9lYeC34S9x4nBZSe+ou+Nk3wC1jC8QYJWGTHujWVh1DIhFYzrF0VmErU5wO5jJi132liJ8hmxUBpeykalcQXlmt3QEcG7NgqR9LOIRO4eALYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwi8VXEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwi8VXEq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DACF7C19425;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785167513;
	bh=VyfPIXDvScrtMc7exUuLCZcbY2lJ8lQecsOnN8icPhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mwi8VXEqI+tfMY0XDJg0X2JJDyT5LfeZ85/AuaB96ugNSCrWKN+wYz5I2kwiTipkt
	 hXnejut1r+JQJyalZPxwLguWcV/noKBGXp3QuqjS+nrV9emrBPZRZkMtpPMC930yQg
	 lNtZm9ldqWi1igFxatiIVpwq9JOwA+/WQRY32m87zJb5l9EcpVKGT4v7Qa83hNWHVw
	 Ow/c794KmIPSK+p41HybK35y8TZHZraafMoibscAzvlE/icVDQ/aF/RMomA4+EE2ES
	 /d95XaCQ82ikewu0tM6ttMFbLKkhIgydB2OtoRjgzQZQDNsNWtXpnq7roA/Bvdp8n6
	 MFQEOb0Oynq0g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6FFC53209;
	Mon, 27 Jul 2026 15:51:53 +0000 (UTC)
From: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>
Date: Mon, 27 Jul 2026 17:51:51 +0200
Subject: [PATCH v2 1/3] gpu: nova-core: Add function to query WPR2 range
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-nova-core-regs-split-v2-1-21b5e6e32ea5@nanonej.com>
References: <20260727-nova-core-regs-split-v2-0-21b5e6e32ea5@nanonej.com>
In-Reply-To: <20260727-nova-core-regs-split-v2-0-21b5e6e32ea5@nanonej.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, daniel.almeida@collabora.com, 
 Antonin Malzieu Ridolfi <dev@nanonej.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4879; i=dev@nanonej.com;
 h=from:subject:message-id;
 bh=8bETYkuuIHsCTAujHK5w+nTqj633Zqrj3sEiuYUcjpc=;
 b=owEBbQKS/ZANAwAKAWaH8SMKFRX9AcsmYgBqZ36Y27cWmggZIYQ15ZCqIKq4EnbovdX8n3AiQ
 f/kDIsgfI+JAjMEAAEKAB0WIQSDtk+wfJEhL1KFIn1mh/EjChUV/QUCamd+mAAKCRBmh/EjChUV
 /VfMD/9RWRTpTe8sjILZPrbr5vuU5OBJG65IbMPDeyozXm9TtmyoUtMVuq+g4MMENVzBdrXwr9x
 9HW+mRIan3nIi6NjP/H4cqDUGqeHVDusx5ZMT4zkj6JXKQfRMN2+DkaRZNpgSUBb6Nsszt/69/X
 VnRC71wJvE//siw4VwVC25vq+FLB6goLsXZSxD4gjPQbd0v8XlakXWthFKpjF5uAh62ppW8PD8+
 hLpMt1UuivNscZvIRQXKwg7HmgUU8mvSc1qZWvx5Yi+ZZqQlKMBUCmrQ77P0RPFRfrVLXfbmAnB
 D1M/ZekSL4yzjgEUJIkp4JVgtAHWcvyDXG/DGWkVG03JSzq9ZmLnivqPYnTbZEpvX/XVvhD37xW
 rrrVn4rbdNqVamzVuxyqqhaF8mLPOhu2Dqg1yB3sojC9uhOIjPq/yubHxSkhLBmMAmRrQFa71ja
 ACalKNYZH7mm9irYyPHCsJfatZEg6Z6wbQuMCuxL5Fi6GiuBVY89UWp+YU7esB2mycdTyLExPng
 rjIExNqESsOt2YXeYRUfYeXAVKaMhv5AUnt8Yw2ItOpo27+rbCe/qOsRwIAzr0VIq9j3iUQK3Rb
 EaGm5rhUwXowqKGMbr5v/8PPmCa5i3ZtZGmL8DD6DLJzQSV/8LJY9/7PIrKLzFMdE1PwfY35EPW
 qoV25bOc+l8kDow==
X-Developer-Key: i=dev@nanonej.com; a=openpgp;
 fpr=83B64FB07C91212F5285227D6687F1230A1515FD
X-Endpoint-Received: by B4 Relay for dev@nanonej.com/default with
 auth_id=825
X-Original-From: Antonin Malzieu Ridolfi <dev@nanonej.com>
Reply-To: dev@nanonej.com

From: Antonin Malzieu Ridolfi <dev@nanonej.com>

Create new function abstracting WPR2 region range query.
Refactor gsp hal tu102 to query the WPR2 region range using this new
function.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Antonin Malzieu Ridolfi <dev@nanonej.com>
---
 drivers/gpu/nova-core/fb.rs            | 14 +++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs | 54 +++++++++++++++-------------------
 2 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 365db7abf7db..8934efc5f436 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -289,3 +289,17 @@ pub(crate) fn new(
         })
     }
 }
+
+/// Reads the WPR2 memory region registers and returns the range if set.
+/// Returns `None` if the WPR2 region is not set.
+pub(crate) fn wpr2_range(bar: Bar0<'_>) -> Option<Range<u64>> {
+    let wpr2_hi = bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI);
+
+    if !wpr2_hi.is_wpr2_set() {
+        return None;
+    }
+
+    let wpr2_lo = bar.read(crate::regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO);
+
+    Some(wpr2_lo.lower_bound()..wpr2_hi.higher_bound())
+}
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 648657e248da..03861add8e20 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -17,7 +17,10 @@
         sec2::Sec2,
         Falcon, //
     },
-    fb::FbLayout,
+    fb::{
+        wpr2_range,
+        FbLayout, //
+    },
     firmware::{
         booter::{
             BooterFirmware,
@@ -90,9 +93,8 @@ fn run(&self, ctx: &mut GspBootContext<'_, '_>) -> Result {
             .inspect_err(|e| dev_err!(dev, "FWSEC-SB failed to run: {:?}\n", e));
 
         // Remove WPR2 region if set.
-        let wpr2_hi = bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI);
         let booter_unloader_res = (|| {
-            if !wpr2_hi.is_wpr2_set() {
+            if wpr2_range(bar).is_none() {
                 return Ok(());
             }
 
@@ -110,8 +112,7 @@ fn run(&self, ctx: &mut GspBootContext<'_, '_>) -> Result {
             }
 
             // Confirm that the WPR2 region has been removed.
-            let wpr2_hi = bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI);
-            if wpr2_hi.is_wpr2_set() {
+            if wpr2_range(bar).is_some() {
                 dev_err!(
                     dev,
                     "WPR2 region still set after Booter Unloader returned\n"
@@ -146,7 +147,7 @@ fn run_fwsec_frts(
     ) -> Result {
         // Check that the WPR2 region does not already exist - if it does, we cannot run
         // FWSEC-FRTS until the GPU is reset.
-        if bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI).higher_bound() != 0 {
+        if wpr2_range(bar).is_some() {
             dev_err!(
                 dev,
                 "WPR2 region already exists - GPU needs to be reset to proceed\n"
@@ -189,34 +190,27 @@ fn run_fwsec_frts(
         }
 
         // Check that the WPR2 region has been created as we requested.
-        let (wpr2_lo, wpr2_hi) = (
-            bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO).lower_bound(),
-            bar.read(regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI).higher_bound(),
-        );
-
-        match (wpr2_lo, wpr2_hi) {
-            (_, 0) => {
-                dev_err!(dev, "WPR2 region not created after running FWSEC-FRTS\n");
+        let Some(wpr2_range) = wpr2_range(bar) else {
+            dev_err!(dev, "WPR2 region not created after running FWSEC-FRTS\n");
 
-                Err(EIO)
-            }
-            (wpr2_lo, _) if wpr2_lo != fb_layout.frts.start => {
-                dev_err!(
-                    dev,
-                    "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
-                    wpr2_lo,
-                    fb_layout.frts.start,
-                );
+            return Err(EIO);
+        };
 
-                Err(EIO)
-            }
-            (wpr2_lo, wpr2_hi) => {
-                dev_dbg!(dev, "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
-                dev_dbg!(dev, "GPU instance built\n");
+        if wpr2_range.start != fb_layout.frts.start {
+            dev_err!(
+                dev,
+                "WPR2 region created at unexpected address {:#x}; expected {:#x}\n",
+                wpr2_range.start,
+                fb_layout.frts.start,
+            );
 
-                Ok(())
-            }
+            return Err(EIO);
         }
+
+        dev_dbg!(dev, "WPR2: {:#x}-{:#x}\n", wpr2_range.start, wpr2_range.end);
+        dev_dbg!(dev, "GPU instance built\n");
+
+        Ok(())
     }
 
     /// Load and prepare the resources required to properly reset the GSP after it has been stopped.

-- 
2.55.0


