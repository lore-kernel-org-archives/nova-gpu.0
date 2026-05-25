Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4541426D4E5;
	Mon, 25 May 2026 22:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779749944; cv=none; b=UAGKOBmT5PTZhTbAitT3fLNMyFTl/yc99yvyz8zhc/H6DTw6X7TdiF26QhhN61qAsfQPf8c7NkvMFbmqYq3oyMB4dGNaDmSra1E5FDw+UUZtX3FWCg1zRukpBh7nHbrvhsGflFg2HXVWCGI6LvQxSeUTsJpbaM/0SuAAWmYx4jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779749944; c=relaxed/simple;
	bh=aUBveTqK7O48R8Pxg06vbwpL9SjPW5m8amaULZILZxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7NEq0ZBFCfnT37dTtkkG6zrg6DfaQFFUs4Tdb7W2C7DokT/58mfFAaCUpcSs6A2gZ1cLxK3R1evyNK9LvyUl2YYaKQ8lFBWBkbHaZC976seBjL6DD+x432A9w3TAubR4YqIgfTYmTkAcsi3ChzXCGdEtjHNUaR8geNbyENHoEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVH78Et/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVH78Et/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE47D1F00A3A;
	Mon, 25 May 2026 22:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779749942;
	bh=4LMYyGKD1lW6nYBiVpCrQLfZbktFHmCLyCx9p2MQ55Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CVH78Et/rja9Js9TZIJMF1xuhqhupWesgqi6wvoXLY6wmOzZhIH/mw/dthKFmwDV1
	 BrduvM5mmpqHg7DaAFzflVwk6Z4Gb26B4j0XXFMZp4DdINcvMEcvk4sTtzhVTQCywD
	 Y1e9F/lsP0kyJM7+FulAG+vWSFmNC/XESF4CI4mAPb7Wn9wnTTyicNbmQGsV4mH/gl
	 oySsp4Kz4h44EaOmypWWPEyinqZxQUGH3RkGj3WMa/ez2Hp1lHW7DDzRhAXjzzHJ9p
	 ARkQy97AiuoZjJvfrjG+ZGwooWt8WT9nezvSIhHmuHgR+wfHSxlGrjhDv9Kyck3/rI
	 2dPVDCa8wuX6g==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com,
	ttabi@nvidia.com,
	joelagnelf@nvidia.com,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 3/5] gpu: nova-core: replace ARef<Device> with &'bound Device in SysmemFlush
Date: Tue, 26 May 2026 00:58:31 +0200
Message-ID: <20260525225838.276108-4-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525225838.276108-1-dakr@kernel.org>
References: <20260525225838.276108-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that SysmemFlush is lifetime-parameterized, the ARef<Device> is
unnecessary -- a plain &'bound Device reference suffices.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/fb.rs | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 3b3271790cc9..1fb65d4eb290 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -15,8 +15,7 @@
         Alignable,
         Alignment, //
     },
-    sizes::*,
-    sync::aref::ARef, //
+    sizes::*, //
 };
 
 use crate::{
@@ -46,7 +45,7 @@
 pub(crate) struct SysmemFlush<'sys> {
     /// Chipset we are operating on.
     chipset: Chipset,
-    device: ARef<device::Device>,
+    device: &'sys device::Device,
     bar: &'sys Bar0,
     /// Keep the page alive as long as we need it.
     page: CoherentHandle,
@@ -55,7 +54,7 @@ pub(crate) struct SysmemFlush<'sys> {
 impl<'sys> SysmemFlush<'sys> {
     /// Allocate a memory page and register it as the sysmem flush page.
     pub(crate) fn register(
-        dev: &device::Device<device::Bound>,
+        dev: &'sys device::Device<device::Bound>,
         bar: &'sys Bar0,
         chipset: Chipset,
     ) -> Result<Self> {
@@ -65,7 +64,7 @@ pub(crate) fn register(
 
         Ok(Self {
             chipset,
-            device: dev.into(),
+            device: dev,
             bar,
             page,
         })
-- 
2.54.0

