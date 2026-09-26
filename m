Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A373B7B70
	for <nova-gpu@lists.linux.dev>; Sat, 26 Sep 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426652; cv=none; b=cpsc6wkVA2a0aNx2RDDFEBpFXiQSqYXYZiXzWUuNs90gQbvAsuVLGA8Kf82rQ0ZXFIA7l+Oh5T1x8U5X6xZw1qCnEbNKbJKdn71oVbSrOmqjtWpkPmMjAuiW2qgBdfP5murRrxtLx0VgFQT1KtO6sNkmyc1YBHRyA44ZR//rEAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426652; c=relaxed/simple;
	bh=lAFIi8MVuX3LyKIG5IXIuH1c0t9P8otQ/94BJSfgEqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9oRauE30CruQQs9pQ/QQtAzKKUzP0yBfIPMfvCs3zXfF/xH/tAkkjeawH9vNsPpM9tF7MRmxNeZxJND2slkT0yuaE4Ld64XzHvEsM7QW1jhVYHMdKerapH5ueMWq2CHDIxhcEBsLDT6UO4cg6sWv2BgtpIPOynV/bmL+VLs9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fw11takW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fw11takW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECE41F00893;
	Sat, 26 Sep 2026 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426650;
	bh=thI5rujReTOvMtZXByG4+6AbvxaRUUyqcbEduWbPu6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fw11takWc2Suz5wORLhFnq3+N/lB/njjH52bE5Hc7lBbzMsQvw8iKH1L9UhC6zyxA
	 4ezcs3zuNsjAcedh68Sy0ilcPxDo7O75wWwF+AcgKpQyAaLjXgU1r/FMSPu2lizFv2
	 LXmcaiK1rE7f6FeMBUW2S8omcRn/NgRePlEaDobiKBqDaNtMnVEubFMG7zoBvtU9HP
	 aOL7W+ORofvfkmgAIIl2/9Fm6ESu3nIAUgV/cQ7UallxGBUKvglj2eB082imFjDwcT
	 ZhqP/Doc8WTcEtByF61UhoA0a88x9EfXgDnuOXl86zeGJO8WJxK6PGIHv3iBnqOB5K
	 W/bflXnTkzcnA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] gpu: nova-core: align Bar1 alias with Bar0
Date: Sat, 26 Sep 2026 14:43:24 +0200
Message-ID: <20260926124405.604707-2-dakr@kernel.org>
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

Make Bar1 an alias for a borrowed pci::Bar in order to match the Bar0
type alias.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/driver.rs      | 4 ++--
 drivers/gpu/nova-core/gpu.rs         | 2 +-
 drivers/gpu/nova-core/mm/bar_user.rs | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 0672a0707a71..9ce70703b2ce 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -32,7 +32,7 @@ pub(crate) struct NovaCore<'bound> {
     #[pin]
     pub(crate) gpu: Gpu<'bound>,
     bar: pci::Bar<'bound, BAR0_SIZE>,
-    bar1: Bar1<'bound>,
+    bar1: pci::Bar<'bound>,
     #[allow(clippy::type_complexity)]
     _reg: auxiliary::Registration<'bound, CovariantForLt!(())>,
 }
@@ -43,7 +43,7 @@ pub(crate) struct NovaCore<'bound> {
 
 pub(crate) type Bar0<'a> = &'a pci::Bar<'a, BAR0_SIZE>;
 pub(crate) type NovaRegisters = kernel::io::Region<BAR0_SIZE>;
-pub(crate) type Bar1<'a> = pci::Bar<'a>;
+pub(crate) type Bar1<'a> = &'a pci::Bar<'a>;
 
 /// Returns the Linux PCI resource index that holds BAR1 for an NVIDIA GPU.
 ///
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 8f30186f10ba..1ae287c9e776 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -353,7 +353,7 @@ impl<'gpu> Gpu<'gpu> {
     pub(crate) fn new<'a>(
         pdev: &'gpu pci::Device<device::Core<'a>>,
         bar: Bar0<'gpu>,
-        bar1: &'gpu Bar1<'gpu>,
+        bar1: Bar1<'gpu>,
     ) -> impl PinInit<Self, Error> + use<'gpu, 'a> {
         let dev = pdev.as_ref();
 
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 8f4a27c1fd14..86b5d302188e 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -41,7 +41,7 @@
 pub(crate) struct BarUser<'gpu> {
     #[pin]
     vmm: Mutex<Vmm>,
-    bar1: &'gpu Bar1<'gpu>,
+    bar1: Bar1<'gpu>,
 }
 
 impl<'gpu> BarUser<'gpu> {
@@ -50,7 +50,7 @@ pub(crate) fn new(
         pdb_addr: VramAddress,
         chipset: Chipset,
         va_size: u64,
-        bar1: &'gpu Bar1<'gpu>,
+        bar1: Bar1<'gpu>,
     ) -> Result<impl PinInit<Self> + 'gpu> {
         let vmm = Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?;
         Ok(pin_init!(Self {
-- 
2.55.0

