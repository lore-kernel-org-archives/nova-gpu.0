Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445159;
	b=bpAyYhcgldwdYFcpO37bhUhnN5d/Nd76zsHRUGuqMECPHPx04TNBa4H/qTmoBJY9to1s
	 nSqGKcGGKMg0hWatMGYo2lCdNVXOMW7x//0xpNZ/NiN8wk+dFvBVaxizVICEUJ/NPfyq5
	 HK/TPen7dTKjjIn9QXMjwoJNoPhNkYCKV+1DthamTLs5Td3BB4tYYPLHGaLN1jKKjMvQw
	 EWd2L5sEEznLjYYbyTAqqiX1dx/bj5NtKKEkpFCxLf2OQuTVPQhhwPuX0qvmMurp9vraw
	 FTHpEz1aEc8cKkvmBpBv6f/jQdxBpVqiqjEgt7yFqm+KmDg95lfc9Vp5p0Rksi1KdZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445159;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3aisROB166Q3kx4N6SPd461R/3NhpDE3Kj+7GC5Cgcc=;
	b=saF3V+ylEvzm+IZ+woS5411PAF79lzzm8KqaW3+r3XkWsXsovcEib6jVJSFzHOswOKPY
	 HuV/DeS1UCeqWY496aQ7MVZiy9vFlp2sboW1QV9cTr9M1W9eF1J/1RnhKwSpU928pZswd
	 f/8ovLI5mWVsWQVn1kYpyhAxiRK7eyec43kk3Cy9iAqxg4c6tyeBQNNZNqUvK4uYvgS9C
	 B8wf0GfHXsf1E+p845xl684/kzshCdOffeGe6ldCVEZqHrPMVaojmb+1RhiUKWn+tR3f+
	 rv1ajNZSyzGnLQTPHfFZi2jXzcnAXDG8FsxDK2rvdMetJ1j6/hBQxAgvBCHrWqkiYaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+cnRP2X;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068A606A31A;
	Mon, 19 Oct 2026 21:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g+cnRP2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6141F000C4;
	Mon, 19 Oct 2026 21:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445158;
	bh=3aisROB166Q3kx4N6SPd461R/3NhpDE3Kj+7GC5Cgcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=g+cnRP2X/ie/vfX70lP7L9ZBLLKU6Rob8cpg60l7XnS3ZcaOCqQUN8A8cC4RV5mh+
	 uCzWn9Pspvk8V36STY9I2su3JmHE39TIbILicseeJfsM6Dr2SoIj9302R30ANYcMFN
	 Lgp1NbgCL1JCvr6ehMW6lBlZKK+IpORQ2K4ldK+qdC+Ll/W8qYHsS5RabdOjOWx41i
	 V/GMulZ3p/iO5aQhk3BymS5dV2kKjjwBpBWD3puNccSnuY5ezedNf0gYs0q9spaoh7
	 bNDfULjSFnrIf6vHr11L31HAWycBMMN8H1Y9iX3Q0eeA6mpCcCvHtBQBWdLSKHNmd/
	 cZ1hDJkNkdQPQ==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com,
	apopple@nvidia.com,
	ecourtney@nvidia.com,
	lyude@redhat.com,
	kherbst@redhat.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 3/3] drm/nova: require explicit opt-in to unstable uAPI
Date: Mon, 19 Oct 2026 23:24:47 +0200
Message-ID: <20261019212535.88390-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019212535.88390-1-dakr@kernel.org>
References: <20261019212535.88390-1-dakr@kernel.org>
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

Nova and its uAPI are under active upstream development. Require users
to acknowledge that the uAPI is not yet stable and may change
incompatibly before enabling the driver.

Refuse to load unless acknowledge_unstable_uapi=1 is set, and taint the
kernel when enabled. This keeps use of the unstable interfaces an
explicit opt-in while they are developed upstream.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/Kconfig | 11 +++++++-
 drivers/gpu/drm/nova/nova.rs | 55 ++++++++++++++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index ba16c74401f8..2cb62517b2f9 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -12,6 +12,15 @@ config DRM_NOVA
 	  Choose this if you want to build the Nova DRM driver for Nvidia
 	  GSP-based GPUs.
 
-	  This driver is work in progress and may not be functional.
+	  This driver is under active upstream development and may not be
+	  functional. Its uAPI is intended to be developed upstream alongside
+	  the driver and is not yet stable. It may change incompatibly during
+	  development.
+
+	  Loading requires the acknowledge_unstable_uapi=1 module parameter, or
+	  nova-drm.acknowledge_unstable_uapi=1 on the kernel command line when
+	  built in.
+
+	  Enabling the driver taints the kernel.
 
 	  If M is selected, the module will be called nova-drm.
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 1fd454c7e0df..ad68f6e1a613 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -2,16 +2,67 @@
 
 //! Nova DRM Driver
 
+use kernel::{
+    auxiliary,
+    driver::Registration,
+    panic::{
+        self,
+        Lockdep,
+        Taint, //
+    },
+    prelude::*,
+    InPlaceModule, //
+};
+
 mod driver;
 mod file;
 mod gem;
 
 use crate::driver::NovaDriver;
 
-kernel::module_auxiliary_driver! {
-    type: NovaDriver,
+module! {
+    type: NovaModule,
     name: "nova-drm",
     authors: ["Danilo Krummrich"],
     description: "Nova GPU driver",
     license: "GPL v2",
+    params: {
+        acknowledge_unstable_uapi: bool {
+            default: false,
+            description: "Acknowledge that Nova and its uAPI are under active upstream development \
+                          and the uAPI may change incompatibly; enable the driver (taints kernel)",
+        },
+    },
+}
+
+#[pin_data]
+struct NovaModule {
+    #[pin]
+    _driver: Registration<auxiliary::Adapter<NovaDriver>>,
+}
+
+impl NovaModule {
+    fn check_unstable_uapi() -> Result {
+        pr_warn!("Nova and its uAPI are under active upstream development\n");
+
+        if !module_parameters::acknowledge_unstable_uapi.value() {
+            pr_err!("Driver disabled: Nova's uAPI is unstable and may change incompatibly\n");
+            pr_info!("Set nova-drm.acknowledge_unstable_uapi=1 to enable (taints kernel)\n");
+            return Err(EPERM);
+        }
+
+        pr_warn!("Unstable uAPI enabled; userspace compatibility is not guaranteed\n");
+        panic::add_taint(Taint::User, Lockdep::StillOk);
+
+        Ok(())
+    }
+}
+
+impl InPlaceModule for NovaModule {
+    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self {
+            _: { Self::check_unstable_uapi()? },
+            _driver <- Registration::new(<Self as kernel::ModuleMetadata>::NAME, module),
+        })
+    }
 }
-- 
2.56.0

