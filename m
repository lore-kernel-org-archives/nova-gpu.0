Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413984;
	b=F3is7FheqbktPeG8/6IcR8CWTmsENAdx2rF8uz7lpGeK+oWqcP7ScFcKTbDHiP9Gh/wG
	 ysT3EKL14kq7bEGt4IlYcc4jyZlGLTrKeQD2IFc0OIg5462CR7fxEWi/YE6PTxYH/y6BO
	 jqRJB8zdppjA/8kRG3QRpPs3N38fIBX4SLTQl7nTMALuYsQ4bIrqJuNuTtbeFRBulpLsn
	 cuD8lVB6rvw9PMo27/s6v274JYjoHCcEOQDecFbZzxOWMFiof+DMUeYgnfUPJU7c+0bMH
	 pbDqIjtwQKlLnYOpaYNB5q+ZU9Y/hYwF49kEhorSRzlcJZQdR+vA+XOmiDsKAYLyFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413984;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tUXnQ0VtngXNz0hq1xaN2LIYyta6JLHGqT1ySJb9N44=;
	b=WNDVRMU7g7aZeU2b/XOGZ1nu8z/kgHxKCvRve9gBvAfJQc8rIbqF4xjskO+kwA/APQtI
	 ROgUcj18JplFg9xn/gCtdDkEuxdH0EPcpFWwKL40Fcs9Z+RvQiixxdnbn2GsZ0FfgnxCT
	 5leV/0HAMNFAZ4GJ5z71BtCTu7haVj0b6jKszWgT0drQSPhy67kxGcCmlsO1HhwJTxT6m
	 xreF185tpmx34Rs7qkkSYS31KRKhc5hqKtTWQ4BAoYJ3g+XuPMu35uk9i0x4TxJmEsvRI
	 5b1tL01qXmYWZOeE3iDES/7kzJShUNDJfTuCIZ8ZGujSfH1CwaE5yAdU5G4rt/CtGNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHEjUqtG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F23606A32D;
	Wed, 11 Nov 2026 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aHEjUqtG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B261F00A06;
	Wed, 11 Nov 2026 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413983;
	bh=tUXnQ0VtngXNz0hq1xaN2LIYyta6JLHGqT1ySJb9N44=;
	h=From:To:Cc:Subject:Date;
	b=aHEjUqtGFvXysk/iQGnM6oZ1C8yniiiiH3ZD0wHilkCZL9tdXjWsdg6pL9rHp8Ek8
	 nH/25lKwbbu/hlGR6d8h6k6IRgdUoDzFeNsaFOR5hZVdJkdwGDdkTajhVtgESn2sUT
	 FTeTy0gQre6vV9aPOSyEI3THYv6/B0oDcxFYoyViELd0Y3ssW/A5CffLhD13UzMbMV
	 OMI1UJofJWv+LbBGnhGUWifDOuVv/LddlbDmM0ngXAvKvjHHwbMSEejuurgPGOXkRQ
	 YL1pyVuopnlmfBTAaeP5zDy0VwmRfqO3aFd5NGHejc+TxZbw7b7xsI+ZKlDgeRc1XZ
	 BmtFCz9SAnPEQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	lossin@kernel.org,
	gary@garyguo.net
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpu: nova-core: minor NovaCoreApi cleanup
Date: Wed, 11 Nov 2026 17:19:02 +0100
Message-ID: <20261111161935.750047-1-dakr@kernel.org>
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

Add a constructor for NovaCoreApi and use it when registering the
auxiliary device, allowing the gpu and pdev fields to become private.

While at it, rename the lifetime from 'bound to 'api to reflect the API
handle's scope; 'bound should only be used by a driver's bus device
private data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Changes in v2: new in this revision
---
 drivers/gpu/nova-core/api.rs    | 13 +++++++++----
 drivers/gpu/nova-core/driver.rs |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
index eec69aace3b2..dc877ddebe8c 100644
--- a/drivers/gpu/nova-core/api.rs
+++ b/drivers/gpu/nova-core/api.rs
@@ -22,12 +22,17 @@
 };
 
 /// API handle for the auxiliary bus child drivers to interact with nova-core.
-pub struct NovaCoreApi<'bound> {
-    pub(crate) gpu: Pin<&'bound Gpu<'bound>>,
-    pub(crate) pdev: &'bound pci::Device<Bound>,
+pub struct NovaCoreApi<'api> {
+    gpu: Pin<&'api Gpu<'api>>,
+    pdev: &'api pci::Device<Bound>,
 }
 
-impl NovaCoreApi<'_> {
+impl<'api> NovaCoreApi<'api> {
+    /// Creates an API handle.
+    pub(crate) fn new(pdev: &'api pci::Device<Bound>, gpu: Pin<&'api Gpu<'api>>) -> Self {
+        Self { gpu, pdev }
+    }
+
     /// Obtain a [`NovaCoreApi`] handle from an auxiliary device registered
     /// by nova-core.
     pub fn of(adev: &auxiliary::Device<Bound>) -> Result<NovaCoreApiHandle<'_>> {
diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 560a70c4f5a7..2376d960eb6b 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -164,7 +164,7 @@ fn probe<'bound>(
                         // never recycles IDs.
                         AUXILIARY_ID_COUNTER.fetch_add(1, Relaxed),
                         crate::MODULE_NAME,
-                        NovaCoreApi { gpu, pdev },
+                        NovaCoreApi::new(pdev, gpu),
                     )?
                 }
             },

base-commit: 6e557330b874b0e1fdd03e8fe4c438f36c93eefa
-- 
2.56.0

