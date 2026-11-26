Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729030;
	b=0Pxqp+EfaThN0gzDDZwVZXiVsF2CbobGyTy7CUdMED4GAEyFntRcV4g4xrTg6QiFQsXw
	 Er3/5tEsdHFt+IXz2MV626IIjqkN0s6K7WuFC8lp+4waDqXAK0hV6fiY3hxhTDth7Kcau
	 2omUEE9hheZsSrReq6mHtVVxx3S6/YryhpsuI29T5Q19twlPKQulEM9QjD1IafIFiL8SY
	 x5BXgqQlmoD1LuW4rgTt4Yh7Ai4Ki8LFadvOzA2YSe87pnC2YjZVHPFoc1F7oJrJR/siy
	 WTsbx1fbKvekd5RVwwOk1yI24Pa6tttd7R4yCNmkL6F3vbw60cZGkE8v/hs1KkBrrwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729030;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=08UknIj2H8XWGwN1HnLhO6QQEtyNW4lOtE/RfCqlWbs=;
	b=OzEuk0mec+sit8PLpf9U9/cJNlgO6mFcOsrmXY+GPWp538lIJvKz6Dmm/a2GkNdro6ce
	 H2uABMwljUjV/LeRbE2CdTb4x0SQ83kd8oMjCFZlyRLKD45iRiGymOfsQaiVaXOx0ylkq
	 ASM5buMY4iZ+FfreNpy9SaGmftHEX32/OPI7nwI/PV4QvSHMZw559/DI15T/3k8MWsjWn
	 B/Jq5kbM08rwlCRWf56cCeqC40U9qwz5h3sV3FhSu8Rw/UpUu0JRiTOs8OeqGbGNGzit8
	 +7EXFyoaqClGBuHu1M+Oq5eGYfdRIO49uD622BDxNSC5lwb3+nxUHor/qnW/xrmEa0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1lMsQZ2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEEE606A31C;
	Thu, 26 Nov 2026 21:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a1lMsQZ2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477E21F0089A;
	Thu, 26 Nov 2026 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729029;
	bh=08UknIj2H8XWGwN1HnLhO6QQEtyNW4lOtE/RfCqlWbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a1lMsQZ21RbIGbZzYOKqI8Q1wwQ+WFF+EcaH1QhxHEbg5f22Pjb8VHlbFRRSYmNn+
	 y+Q23d36rydgr3I99u4Gqf0bYYxBSFUncvTrXu4Vrf1JL19yoBYLRWcZpTm2PP27kU
	 i0kTmyHHhaKaefbaCUr7+HREwja1QzyGRItenJYO+qpQH1MdoAuNOQxddl+pyBkv+R
	 utp5iegaJzwZxmwcWZSrzCE5KSSOFnhTQhKrnGMV8C2V/eET4yRa9cy6Ih5E3xSU57
	 382wdINqNZV91l1kHifzrJp5XU0YS0a8LcBxhnXsw9NY4BcmDbO1BqX5Z/D38wIbEV
	 BMk4J8NFuD5nQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net,
	ecourtney@nvidia.com,
	jhubbard@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] gpu: nova-core: mm: remove SharedPramin
Date: Thu, 26 Nov 2026 22:36:05 +0100
Message-ID: <20261126213652.3716162-5-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126213652.3716162-1-dakr@kernel.org>
References: <20261126213652.3716162-1-dakr@kernel.org>
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

SharedPramin was introduced as a temporary wrapper so its mutex could be
pin-initialized separately while GpuMm remained movable. This allowed
PRAMIN locking to remove the need for mutable GpuMm references before
converting GpuMm itself to pin initialization.

Now that GpuMm is pin-initialized, it can embed Mutex<Pramin> directly
and hide the mutex's invariant resource lifetime itself. Remove the
temporary wrapper.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/mm.rs        | 19 +++++++++++------
 drivers/gpu/nova-core/mm/pramin.rs | 34 ------------------------------
 2 files changed, 13 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 94c6f425c867..7aa8906d2cb2 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -44,13 +44,15 @@ macro_rules! impl_pfn_bounded {
         GpuBuddy,
         GpuBuddyParams, //
     },
+    new_mutex,
     num::Bounded,
     prelude::*,
     ptr::{
         Alignable,
         Alignment, //
     },
-    sizes::SZ_4K, //
+    sizes::SZ_4K,
+    sync::Mutex, //
 };
 
 use crate::{
@@ -72,13 +74,18 @@ macro_rules! impl_pfn_bounded {
 ///
 /// Provides centralized ownership of memory management resources:
 /// - [`GpuBuddy`] allocator for VRAM page table allocation.
-/// - [`pramin::SharedPramin`] for direct VRAM access.
+/// - [`pramin::Pramin`] for direct VRAM access.
 /// - [`Tlb`] manager for translation buffer flush operations.
 #[pin_data]
-pub(crate) struct GpuMm<'gpu> {
+pub(crate) struct GpuMm<'gpu>
+where
+    // Hide the mutex's invariant resource lifetime so `GpuMm` remains covariant.
+    exists<'res>: 'gpu,
+{
     buddy: GpuBuddy,
     #[pin]
-    pramin: pramin::SharedPramin<'gpu>,
+    #[uses('res: invariant)]
+    pramin: Mutex<pramin::Pramin<'res>>,
     #[pin]
     tlb: Tlb<'gpu>,
 }
@@ -97,7 +104,7 @@ pub(crate) fn new(
 
         try_pin_init!(Self {
             buddy: GpuBuddy::new(buddy_params)?,
-            pramin <- pramin::SharedPramin::new(bar, chipset, vram_region),
+            pramin <- new_mutex!(pramin::Pramin::new(bar, chipset, vram_region)?, "pramin"),
             tlb <- Tlb::new(bar),
         })
     }
@@ -111,7 +118,7 @@ pub(crate) fn buddy(&self) -> &GpuBuddy {
     ///
     /// Do not perform reclaimable allocations in `f`.
     fn with_pramin_locked<R>(&self, f: impl FnOnce(&mut pramin::Pramin<'_>) -> R) -> R {
-        self.pramin.with_locked(f)
+        self.with_pramin(|pramin| f(&mut pramin.lock()))
     }
 
     /// Access the [`Tlb`] manager.
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
index 841289d7bccc..c83b1681d241 100644
--- a/drivers/gpu/nova-core/mm/pramin.rs
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -13,7 +13,6 @@
         Io,
         Mmio, //
     },
-    new_mutex,
     prelude::*,
     ptr::{
         Alignable,
@@ -23,7 +22,6 @@
         SizeConstants,
         SZ_1M, //
     },
-    sync::Mutex, //
 };
 
 use crate::{
@@ -56,38 +54,6 @@
     PRAMIN: PraminWindow @ 0x700000;
 }
 
-/// A [`Pramin`] shared between users, serialized by a mutex.
-#[pin_data]
-pub(super) struct SharedPramin<'gpu>
-where
-    // Hide the mutex's invariant resource lifetime so `SharedPramin` remains covariant.
-    exists<'res>: 'gpu,
-{
-    #[pin]
-    #[uses('res: invariant)]
-    inner: Mutex<Pramin<'res>>,
-}
-
-impl<'gpu> SharedPramin<'gpu> {
-    /// Creates the shared window manager for the given VRAM region.
-    pub(super) fn new(
-        bar: Bar0<'gpu>,
-        chipset: Chipset,
-        vram_range: Range<VramAddress>,
-    ) -> impl PinInit<Self, Error> {
-        try_pin_init!(Self {
-            inner <- new_mutex!(Pramin::new(bar, chipset, vram_range)?, "pramin"),
-        })
-    }
-
-    /// Runs `f` with exclusive access to the PRAMIN window.
-    ///
-    /// Do not perform reclaimable allocations in `f`.
-    pub(super) fn with_locked<R>(&self, f: impl FnOnce(&mut Pramin<'_>) -> R) -> R {
-        self.with_inner(|inner| f(&mut inner.lock()))
-    }
-}
-
 /// Owner of the PRAMIN window state.
 ///
 /// [`Pramin::window_at()`] repositions the window as needed and returns a typed MMIO view into
-- 
2.56.1

