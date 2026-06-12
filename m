Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7943385A7;
	Fri, 12 Jun 2026 12:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781267666; cv=none; b=Sc7O8hFMMJlUCgH8t8qohs4JwWOJ1q8qj+4j9eXklS5bFqMQkt7EjsohLJizZoVL/2LOnd/zf0O/rUFkR/vQsRAlbHCD/5B9jxkaZ5N2rCrtm9jCrMHVTtQo6dOjGMwDOvEOblPsOi9rTvoGhAa/9FNcaVsKC7RxVghZIG8VV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781267666; c=relaxed/simple;
	bh=LA7dsnE10b6U+f+nNl7ZWaoh4ntUgp/mu2Yi/tndTDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U2JmSCxBPB18WKdxMLn/Pp4fkMkaiVVaytc0InbtVaTVU4w4x0YrU4443XBYRSB4vAIZkKBdB2g55VcSl6TND13JfZHLJ2MoAlLgrA1y5s3CH/6G4+yVMtD2/3+HvjuIPyN6HyISil5/OCvXDi5xZpp6xLcVsB6rk8Guj4AvJZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWBBLlbt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWBBLlbt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00B01F000E9;
	Fri, 12 Jun 2026 12:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781267664;
	bh=Y54MncDyC20nn430l0lNofQfX53i/RP2TTU+Lej2ES4=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=aWBBLlbt7aUtx1s0B0hQ0hCj46Uj8qAVVsaIP+B9s54oK4L7NChXQ7+FsoeBkL4zV
	 av49Uc6R/iCc18vM0Un+LOjCKJwHaS89AVFJaljJ+71LuCQe4AFWHHl0t+TMZsrIzC
	 wo9SokJI2su3/iG7q/SxJ5qeFHkDZiHUGXdgBTBXmy8Tgi0MtYIzLKHiImgBIeQSbE
	 He68LoEimGL3ZSdpPg1VWJuBhqcGYMe/gAa5sXoNDIrr6gDhITQgtVPPaWSyJvD9UJ
	 GYtbJ7DFrvCVFrv3C9Kp78eJ0jw7zmE+Yq/Ds6bnBRvNF9Ve6w7HDwMd2BcgW8xc8D
	 bGyFWxnQE47VA==
From: Gary Guo <gary@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] gpu: nova-core: remove `#[allow(non_snake_case)]`
Date: Fri, 12 Jun 2026 13:34:00 +0100
Message-ID: <20260612123401.2684025-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Since commit 5423ef9d4db8 ("rust: pin-init: internal: suppress
`non_snake_case` lint in `[pin_]init!`"), mere use of the non-snake-case
identifiers would not cause the warning to be generated. Thus remove these
allows.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
This should be applied after the merge window when v7.2-rc1 is backmerged
to drm-rust-next tree, so the pin-init changes are picked up.
---
 drivers/gpu/nova-core/gsp/fw.rs          | 8 --------
 drivers/gpu/nova-core/gsp/fw/commands.rs | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4db0cfa4dc4d..d96ea0b216b4 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -219,7 +219,6 @@ pub(crate) fn new<'a>(
         gsp_firmware: &'a GspFirmware,
         fb_layout: &'a FbLayout,
     ) -> impl Init<Self> + 'a {
-        #[allow(non_snake_case)]
         let init_inner = init!(bindings::GspFwWprMeta {
             // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
             magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
@@ -674,7 +673,6 @@ fn id8(name: &str) -> u64 {
             u64::from_ne_bytes(bytes)
         }
 
-        #[allow(non_snake_case)]
         let init_inner = init!(bindings::LibosMemoryRegionInitArgument {
             id8: id8(name),
             pa: obj.dma_handle(),
@@ -793,7 +791,6 @@ impl GspMsgElement {
     /// * `sequence` - Sequence number of the message.
     /// * `cmd_size` - Size of the command (not including the message element), in bytes.
     /// * `function` - Function of the message.
-    #[allow(non_snake_case)]
     pub(crate) fn init(
         sequence: u32,
         cmd_size: usize,
@@ -876,7 +873,6 @@ pub(crate) struct GspArgumentsCached {
 impl GspArgumentsCached {
     /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
     pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
-        #[allow(non_snake_case)]
         let init_inner = init!(bindings::GSP_ARGUMENTS_CACHED {
             messageQueueInitArguments <- MessageQueueInitArguments::new(cmdq),
             bDmemStack: 1,
@@ -923,7 +919,6 @@ unsafe impl FromBytes for GspArgumentsPadded {}
 
 impl MessageQueueInitArguments {
     /// Creates a new init arguments structure for `cmdq`.
-    #[allow(non_snake_case)]
     fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
         init!(MessageQueueInitArguments {
             sharedMemPhysAddr: cmdq.dma_handle,
@@ -947,7 +942,6 @@ pub(crate) enum GspDmaTarget {
 
 impl GspAcrBootGspRmParams {
     fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
-        #[allow(non_snake_case)]
         let params = init!(Self {
             target: target as u32,
             gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMeta>() }>(),
@@ -966,7 +960,6 @@ fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
 
 impl GspRmParams {
     fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
-        #[allow(non_snake_case)]
         let params = init!(Self {
             target: target as u32,
             bootArgsOffset: libos_addr,
@@ -986,7 +979,6 @@ unsafe impl FromBytes for GspFmcBootParams {}
 
 impl GspFmcBootParams {
     pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
-        #[allow(non_snake_case)]
         let init = init!(Self {
             // Blackwell FSP obtains WPR info from other sources, so
             // wprCarveoutOffset and wprCarveoutSize are left zero.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 7bcc41fc7fa0..6c31d825b746 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -27,7 +27,6 @@ pub(crate) struct GspSetSystemInfo {
 
 impl GspSetSystemInfo {
     /// Returns an in-place initializer for the `GspSetSystemInfo` command.
-    #[allow(non_snake_case)]
     pub(crate) fn init<'a>(
         dev: &'a pci::Device<device::Bound>,
         chipset: Chipset,
@@ -99,7 +98,6 @@ pub(crate) struct PackedRegistryTable {
 }
 
 impl PackedRegistryTable {
-    #[allow(non_snake_case)]
     pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
         type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
         let init_inner = init!(InnerPackedRegistryTable {

base-commit: 614f7220e548a8df6262887c0140d9267841dbc1
-- 
2.54.0

