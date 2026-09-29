Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8052ED3B
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 14:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690426; cv=none; b=Eu/7PZ4ShB5LHy+k1XUAyqI0AUCY5XXLvu4eXud4art+lmXEWo0ZhibHYwkzrb1WwDVqpKQvXUZVmdIFMA9W0J3g9AfSmAzluroY0rfcZd2vg3hNLh5tdqbrkjNUI3yHrFoR2qbcZjJJTbPXdy4wuER4v0fn3sc0vaAqXHDabxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690426; c=relaxed/simple;
	bh=kMTfXmN76tXHjg7lMHDG8E9G2SXwV63lnKr/zCIsIT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYSSjlu6dNXGOi+hYeFW+AT+SPq2au+7uFIlhk78d8qZHJGbN3Iq4mYgBwzBWGAs9vxcMFnMmCqyoIS0QelKeSkU6mILQ3XWZU24vos6PiBzMSm86duaBrSRpFZslIO4ADWn57Ow1dQrDD7OOtvdoEesuVbPd1Q1YBOMLGKj/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TkbjctR2; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TkbjctR2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vj
	bTBB8DwF7g9ji0l50jBGPJhPvM44ev2BgqTyu3dIY=; b=TkbjctR20LRlfwvrAB
	KVBHS85+oqhRKGYSn1vgukFqgOhXrRCMw8Js2AzqwfwK8DgudcQbh2UZehvEH9iE
	adHzmP5zg8OcuqWTOC6nnFrQbCMTz1M5VvCvHz/9kDzu2yifaE8WLFWUwn/tAu4L
	RNepQx1NAcFFefcG2OhGy9/bk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB3SLFPxLtqLmV_Bw--.47547S2;
	Tue, 29 Sep 2026 21:59:48 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 10/10] gpu: nova-core: use conversion derives for two register enums
Date: Tue, 29 Sep 2026 21:58:55 +0800
Message-ID: <20260929135855.36775-11-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929135855.36775-1-chaoji_xinren@163.com>
References: <20260929135855.36775-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB3SLFPxLtqLmV_Bw--.47547S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF48Wr13Xw47Wr47AFy5urg_yoW5Aw1rpF
	45KrZ2kr17Zwn3Xa4xA3WUZFW3Cas3GFZ8uF47Jw1DursFyF10k3ykXrWFq34DG34IkrW2
	gryvk345ua4UK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piXTm-UUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4hXPS2q7xFWmOAAA3t

Replace bounded_enum! for Architecture with TryFrom and Into using the
shared convert helper. Keep the six discriminants, Bounded<u32, 6> input
and output, and Error/EINVAL on invalid inputs.

Use From and Into for FalconCoreRevSubversion, which covers every value
of Bounded<u32, 2>. Its existing infallible conversion and blanket
TryFrom error type remain unchanged. Leave other register enums and
Chipset conversion behavior in place.

This exercises both fallible and exhaustive conversions in actual
register field users without changing register accesses or GPU
initialization logic.

Link: https://lore.kernel.org/rust-for-linux/DHHJCEG8BC47.2VC6GLDRRZH1B@nvidia.com/
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 drivers/gpu/nova-core/falcon.rs | 19 +++++++++----------
 drivers/gpu/nova-core/gpu.rs    | 22 ++++++++++------------
 2 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 65cb12d26e2b..15bbbda7df28 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -59,16 +59,15 @@ pub(crate) enum FalconCoreRev with TryFrom<Bounded<u32, 4>> {
     }
 }
 
-bounded_enum! {
-    /// Revision subversion number of a falcon core, used in the
-    /// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
-    #[derive(Debug, Copy, Clone)]
-    pub(crate) enum FalconCoreRevSubversion with From<Bounded<u32, 2>> {
-        Subversion0 = 0,
-        Subversion1 = 1,
-        Subversion2 = 2,
-        Subversion3 = 3,
-    }
+/// Revision subversion number of a falcon core, used in the
+/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
+#[derive(Debug, Copy, Clone, kernel::macros::From, kernel::macros::Into)]
+#[convert(Bounded<u32, 2>)]
+pub(crate) enum FalconCoreRevSubversion {
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
 }
 
 bounded_enum! {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index fd1414004dd0..66249bb5b369 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -14,7 +14,6 @@
 };
 
 use crate::{
-    bounded_enum,
     driver::Bar0,
     falcon::{
         gsp::Gsp as GspFalcon,
@@ -155,17 +154,16 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     }
 }
 
-bounded_enum! {
-    /// Enum representation of the GPU generation.
-    #[derive(fmt::Debug, Copy, Clone)]
-    pub(crate) enum Architecture with TryFrom<Bounded<u32, 6>> {
-        Turing = 0x16,
-        Ampere = 0x17,
-        Hopper = 0x18,
-        Ada = 0x19,
-        BlackwellGB10x = 0x1a,
-        BlackwellGB20x = 0x1b,
-    }
+/// Enum representation of the GPU generation.
+#[derive(fmt::Debug, Copy, Clone, kernel::macros::TryFrom, kernel::macros::Into)]
+#[convert(Bounded<u32, 6>)]
+pub(crate) enum Architecture {
+    Turing = 0x16,
+    Ampere = 0x17,
+    Hopper = 0x18,
+    Ada = 0x19,
+    BlackwellGB10x = 0x1a,
+    BlackwellGB20x = 0x1b,
 }
 
 #[derive(Clone, Copy)]

