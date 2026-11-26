Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729026;
	b=jCnu14cpudLz7j5ezkSeDccL2YpcLo0pgCCorNFRVd+rzxo2gXegs1yoWMeTiFWHdQtq
	 OM7mqLeOPHdNAFS3CR8p+bX4LQKPBYMzqS1mNlOJj9iZDO7mvvErHuhZkQ1MXlAMLEvlw
	 GiusiaPy0XkUvpw3k5YTytOtYh8RqZ4oDhMiBoIFlNxKCcGGa6+eicXcE/PcD73j6hSQE
	 kbk4CuhnCzYv7k63yksel4S/ZnCIEm4Xcjw5XbQuwQQSRjPT3g/pEHqQuJ9ld19s5FDOH
	 X5/lkf2ncPwvvxhz4ylLBzYBDGZA3UpX9i1WPgq0lapM8DhsoFGRJX0JFy21YuCCkhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729026;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=rwOYEx5SMPYe+yxYxJh2Q26j0qxVbpiATxANscWXb7w=;
	b=1+nYdob94tfcyHaFbkR5MaUjpqhkNKCsNAOcdE3ABVflcocEdXclSggIyq870DrQE5Vs
	 HfXsv8BIdexDrelurbExHUk60rqF532ZR+qUiz96REesSG5mKWdqAbhwlt+jsIm9ySR0w
	 fPnBkm1zkzi7ZFA++9TQtCVscMi4gDZB2Z8Zf5G6ZJ6HTqvc4LJDXF63t/9uevPo+xT2F
	 Uf6u2MOlpkSlg0UvuKMoRETx0kD7NIMy3jsE1koERlfczsTLdxhw65e9WWQOEPX17HUKb
	 BqsR+/70evox6IWeLu21k5hvQdmZt9YT4GwHf1BH70lIsX51AdaN3J0fyE+JZ5gm4+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uj5TMHqs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3536606A323;
	Thu, 26 Nov 2026 21:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uj5TMHqs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA541F0089A;
	Thu, 26 Nov 2026 21:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795729026;
	bh=rwOYEx5SMPYe+yxYxJh2Q26j0qxVbpiATxANscWXb7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uj5TMHqs/3sD1DLEEP87oOfnOQNhvX62NoXvDTL32G0RD4gvMc86xmUD0GivkTk2S
	 HiiL/QBnmxt/cyGSuvRY5AOW+UUmxJTuxC8Pp2AdSUSwTO97wcBFd6bYknUFBqqzJC
	 i5vrngrZopDlyN74WY6QO1IRfFQUjaYmR3kfdjECiKklnSj9RXJ69sE5J2MKpE1m0r
	 nFjFSiQ88qc9/jop1AfN1P5J95jYR7dvnL5X8X1MxQgxoMGvjZ7MhEpMzDOLhemOsl
	 9e2rcyF9K5C0P0g5bEv1S5wR/MeLeVtsHdjQleCcbTNcKeYm6jo2X3WNinX7PyEwzj
	 gX5W8pSkA4gEA==
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
Subject: [PATCH 3/4] gpu: nova-core: mm: initialize GpuMm in place
Date: Thu, 26 Nov 2026 22:36:04 +0100
Message-ID: <20261126213652.3716162-4-dakr@kernel.org>
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

The PRAMIN and TLB managers require stable addresses for their mutexes.

Pin-initialize GpuMm so they can be embedded directly instead of
allocating each separately.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/gpu.rs |  5 +++--
 drivers/gpu/nova-core/mm.rs  | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 39e57e724a71..2f0399100885 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -399,6 +399,7 @@ pub(crate) struct Gpu<'gpu> {
     ///
     /// Must be kept declared *before* `gsp_resources`, so that its components are dropped while
     /// the GSP is still operational.
+    #[pin]
     mm: GpuMm<'gpu>,
     /// BAR1 user interface for CPU access to GPU virtual memory.
     #[pin]
@@ -562,7 +563,7 @@ pub(crate) fn new<'a>(
             },
 
             // Create GPU memory manager owning memory management resources.
-            mm: {
+            mm <- {
                 let usable_vram = gsp_static_info.usable_fb_regions.first().ok_or(ENODEV)?;
                 let buddy_params = GpuBuddyParams {
                     base_offset: usable_vram.start,
@@ -575,7 +576,7 @@ pub(crate) fn new<'a>(
                     gsp_resources.spec.chipset,
                     buddy_params,
                     VramAddress::from_raw(gsp_static_info.total_fb_end),
-                )?
+                )
             },
 
             // Create BAR1 user interface for CPU access to GPU virtual memory.
diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 30a394424e12..94c6f425c867 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -74,10 +74,13 @@ macro_rules! impl_pfn_bounded {
 /// - [`GpuBuddy`] allocator for VRAM page table allocation.
 /// - [`pramin::SharedPramin`] for direct VRAM access.
 /// - [`Tlb`] manager for translation buffer flush operations.
+#[pin_data]
 pub(crate) struct GpuMm<'gpu> {
     buddy: GpuBuddy,
-    pramin: Pin<KBox<pramin::SharedPramin<'gpu>>>,
-    tlb: Pin<KBox<Tlb<'gpu>>>,
+    #[pin]
+    pramin: pramin::SharedPramin<'gpu>,
+    #[pin]
+    tlb: Tlb<'gpu>,
 }
 
 impl<'gpu> GpuMm<'gpu> {
@@ -87,18 +90,15 @@ pub(crate) fn new(
         chipset: Chipset,
         buddy_params: GpuBuddyParams,
         total_fb_end: VramAddress,
-    ) -> Result<Self> {
+    ) -> impl PinInit<Self, Error> {
         // PRAMIN covers all physical VRAM (including GSP-reserved areas
         // above the usable region, e.g. the BAR1 page directory).
         let vram_region = VramAddress::ZERO..total_fb_end;
 
-        Ok(Self {
+        try_pin_init!(Self {
             buddy: GpuBuddy::new(buddy_params)?,
-            pramin: KBox::pin_init(
-                pramin::SharedPramin::new(bar, chipset, vram_region),
-                GFP_KERNEL,
-            )?,
-            tlb: KBox::pin_init(Tlb::new(bar), GFP_KERNEL)?,
+            pramin <- pramin::SharedPramin::new(bar, chipset, vram_region),
+            tlb <- Tlb::new(bar),
         })
     }
 
@@ -116,7 +116,7 @@ fn with_pramin_locked<R>(&self, f: impl FnOnce(&mut pramin::Pramin<'_>) -> R) ->
 
     /// Access the [`Tlb`] manager.
     pub(crate) fn tlb(&self) -> &Tlb<'gpu> {
-        self.tlb.as_ref().get_ref()
+        &self.tlb
     }
 }
 
-- 
2.56.1

