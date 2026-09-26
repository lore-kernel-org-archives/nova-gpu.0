Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F748547057
	for <nova-gpu@lists.linux.dev>; Sat, 26 Sep 2026 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426656; cv=none; b=R+Mha/wPeJlJyeeyE31P7RqDevFOxchMMF673cRqd3vFqS14jxzuRD9Yh0i2c+lGdhUbHI1Z/gpflcbSAJYIXALLnHBW1uHJEVHbSCdH4JdJgCMFv6G+2C5bbHhs/IMCJ8q+yvL0BI0XqlIFr1aWPzziyvkehqIt5rg+QuiMo0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426656; c=relaxed/simple;
	bh=y19ld61R7P31QKeUnz+w5SIc1zlyKkaJnV3Lzv8ge8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjlzhz0K38Xm1mPJ+t32X4jqrNtfZavr8CID629z5eCSCVedv6PTaTAapbDyUJ3PzEiTvnrRpt9N1oOcOjqtdVrNoOHeoXQ1nwVPHL5Vs4PUDUoVaHUSrPdMC2ShS30iHyb/8RnnQN3XVV4WOutdJ/OjIkDCWwSsD+rrizD7ack=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkMm3UP2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkMm3UP2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D02F1F00899;
	Sat, 26 Sep 2026 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426655;
	bh=RXjOx3Yo0VabsQshmzOiJUEXnOwSJ51eecom/f/ueKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FkMm3UP2PR2kOT8MnReVQiyvoSfGKoIUFDml5vRRVYkqN/aNo4HMA87GUXXrHWpi+
	 rnlT/RPF+4MvHP3fuDoiXiEokb6yUGEUGvHKOk1ujzhy05JOE6y4N4sseecj+tI5yy
	 9Svc5TvBZlWdKyX9yEa+MO77xOfQpH+KnKrTDfOAEr8qULyKhnKgKzNCBy2e0nesyu
	 GK0xn5iXaJF/yOn0T4Sksu/wbM9VIg333FXs3jt9CInvF8xjtCFJnEQGEYHiun5+Bf
	 NbrSEcT6aWxFac/Fq9ezcjksmebvCuBPwavWqsJgEX0IDVo7fHs/axjVDfaF+aFBxQ
	 AYQ1i62oZQQrw==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] gpu: nova-core: mm: fix lifetime name in BarUser
Date: Sat, 26 Sep 2026 14:43:27 +0200
Message-ID: <20260926124405.604707-5-dakr@kernel.org>
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

BarUser should not use 'gpu as a name for its lifetime; stick to a
generic 'a until we need pin-init selfref for this struct.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/mm/bar_user.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
index 855244f06983..dbf6445fa9ce 100644
--- a/drivers/gpu/nova-core/mm/bar_user.rs
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -35,20 +35,20 @@
 ///
 /// Owns the [`Vmm`] for the BAR1 address space.
 #[pin_data]
-pub(crate) struct BarUser<'gpu> {
+pub(crate) struct BarUser<'a> {
     #[pin]
     vmm: Mutex<Vmm>,
-    bar1: Bar1<'gpu>,
+    bar1: Bar1<'a>,
 }
 
-impl<'gpu> BarUser<'gpu> {
+impl<'a> BarUser<'a> {
     /// Create a pin-initializer for [`BarUser`].
     pub(crate) fn new(
         pdb_addr: VramAddress,
         chipset: Chipset,
         va_size: u64,
-        bar1: Bar1<'gpu>,
-    ) -> impl PinInit<Self, Error> + 'gpu {
+        bar1: Bar1<'a>,
+    ) -> impl PinInit<Self, Error> + 'a {
         try_pin_init!(Self {
             vmm <- new_mutex!(
                 Vmm::new(pdb_addr, chipset.mmu_version(), va_size)?,
-- 
2.55.0

