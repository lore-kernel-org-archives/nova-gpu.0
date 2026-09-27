Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81770239068
	for <nova-gpu@lists.linux.dev>; Sun, 27 Sep 2026 14:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519004; cv=none; b=k/oefOFy2573zBCTj47nlSRZE691QQ0DXTsl+OAdrgg364wWmoumi6n7REPxcxaAAEEQAvfTtBJDZJ6ccLBVRHIzqXKhGDHcHFpRs1sUlDKv6DFuw6R/YDRLlOBbj++LnaenB2zsXx2LhYcO3m7mqMoynC/n+D09oN4pWSg+NUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519004; c=relaxed/simple;
	bh=3wlC3LBkKiXplN+UTYmZiW+L6nCAnvnw7PvgQR7rm2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bHaztDJkmanv3lPGzgSO34ARe9YtZfZ/jiZikD2LWdruxYT7ZiAIFdPaattYrGJdW1wewUzlIRUvo4EOV+ItsiR+WrI0OrNiO28EJEMHBIeIIacdJsLTetvv34PczAuIO97rqra3HHdvu7Ooz46cAdB3G1UNMfkt4uxFv8YEZ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FQ9GniEA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FQ9GniEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD311F000FF;
	Sun, 27 Sep 2026 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790519003;
	bh=Yd/XxOA7LZMuOoRFgz97YQfKIrI/mvt3irVNMPPsDj8=;
	h=From:To:Cc:Subject:Date;
	b=FQ9GniEADkCncyuEFlaZSdcfalvNSJgKbAMgWE1+yuv2d3PniY7+nlogJeRxtj9rI
	 lmcEiPvZ/ceiWP99Xc86rg9i8TGwC4nzp81PPHr0+zeMlRG4gFxJEWQSQJs9O8QsTc
	 xdwEWfyX51Dlw7s3Gqn2++qDYcCcZDcz/zmyfNBqBcQ2kc2Bgovj4Em9XIXoJozcIq
	 g7GLOWD59HxLUPZCXxqfT6JsGFyj0R4j0lcjKNtRISxo5THvhpYbcL1dPTMnXEoUXL
	 lrq41hDq/lfqBrzU/aEZg3zikQ6UqF2BGvzc4Mr+8qMzFSBPa7Cp8UPyCc7Yy+wx+S
	 BLg69ZkUx+rAA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	airlied@gmail.com,
	gary@garyguo.net,
	acourbot@nvidia.com,
	apopple@nvidia.com,
	jhubbard@nvidia.com,
	ecourtney@nvidia.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: nova: Move VRAM BAR size query to GPU info
Date: Sun, 27 Sep 2026 16:22:09 +0200
Message-ID: <20260927142258.1260711-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nova exposes static information via its DRM_IOCTL_NOVA_INFO ioctl, thus
add vram_bar_size to struct drm_nova_info_gpu and remove
DRM_IOCTL_NOVA_GETPARAM and its uAPI definitions.

This breaks the uAPI, which is still fine at this point. It requires the
corresponding drm-test change in [1].

Link: https://gitlab.freedesktop.org/dakr/drm-test/-/merge_requests/2 [1]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/driver.rs |  3 +--
 drivers/gpu/drm/nova/file.rs   | 18 +----------------
 include/uapi/drm/nova_drm.h    | 36 ++++++++--------------------------
 3 files changed, 10 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index 46e13fe795eb..851d50b4dd15 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -95,9 +95,8 @@ impl drm::Driver for NovaDriver {
     const FEAT_RENDER: bool = true;
 
     kernel::declare_drm_ioctls! {
-        (NOVA_GETPARAM, drm_nova_getparam, ioctl::RENDER_ALLOW, File::get_param),
+        (NOVA_INFO, drm_nova_info, ioctl::RENDER_ALLOW, File::info),
         (NOVA_GEM_CREATE, drm_nova_gem_create, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_create),
         (NOVA_GEM_INFO, drm_nova_gem_info, ioctl::AUTH | ioctl::RENDER_ALLOW, File::gem_info),
-        (NOVA_INFO, drm_nova_info, ioctl::RENDER_ALLOW, File::info),
     }
 }
diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 766a6ddb7e10..a05264917a0b 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -60,6 +60,7 @@ fn new(reg_data: &DrmRegData<'_>) -> Result<Self> {
             architecture: spec.chipset.arch().into(),
             chipid: spec.chipset.into(),
             vram_size: gsp_static_info.vram_size(),
+            vram_bar_size: reg_data.api.with(|api| api.bar1_size())?,
             gpu_gid: gsp_static_info.gpu_gid,
             ..pin_init::zeroed()
         };
@@ -108,23 +109,6 @@ fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>> {
 }
 
 impl File {
-    /// IOCTL: get_param: Query GPU / driver metadata.
-    pub(crate) fn get_param(
-        _dev: &NovaDevice<Registered>,
-        reg_data: &DrmRegData<'_>,
-        getparam: &mut uapi::drm_nova_getparam,
-        _file: &drm::File<File>,
-    ) -> Result<u32> {
-        let value = match getparam.param.try_into()? {
-            uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => reg_data.api.with(|api| api.bar1_size())?,
-            _ => return Err(EINVAL),
-        };
-
-        getparam.value = Into::<u64>::into(value);
-
-        Ok(0)
-    }
-
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice<Registered>,
diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
index a74daba6ea94..d7017ed17143 100644
--- a/include/uapi/drm/nova_drm.h
+++ b/include/uapi/drm/nova_drm.h
@@ -18,13 +18,6 @@
 extern "C" {
 #endif
 
-/*
- * NOVA_GETPARAM_VRAM_BAR_SIZE
- *
- * Query the VRAM BAR size in bytes.
- */
-#define NOVA_GETPARAM_VRAM_BAR_SIZE	0x1
-
 /**
  * enum drm_nova_architecture - GPU architecture identifier
  */
@@ -77,21 +70,6 @@ enum drm_nova_chipid {
 	NOVA_DRM_CHIPID_GB207			= 0x1b7,
 };
 
-/**
- * struct drm_nova_getparam - query GPU and driver metadata
- */
-struct drm_nova_getparam {
-	/**
-	 * @param: The identifier of the parameter to query.
-	 */
-	__u64 param;
-
-	/**
-	 * @value: The value for the specified parameter.
-	 */
-	__u64 value;
-};
-
 /**
  * struct drm_nova_gem_create - create a new DRM GEM object
  */
@@ -189,6 +167,11 @@ struct drm_nova_info_gpu {
 	 */
 	__u64 vram_size;
 
+	/**
+	 * @vram_bar_size: Size of the PCI BAR aperture used to access VRAM, in bytes.
+	 */
+	__u64 vram_bar_size;
+
 	/**
 	 * @gpu_name: NUL-terminated full GPU name.
 	 */
@@ -205,21 +188,18 @@ struct drm_nova_info_gpu {
 	__u8 gpu_gid[16];
 };
 
-#define DRM_NOVA_GETPARAM		0x00
+#define DRM_NOVA_INFO			0x00
 #define DRM_NOVA_GEM_CREATE		0x01
 #define DRM_NOVA_GEM_INFO		0x02
-#define DRM_NOVA_INFO			0x03
 
 /* Note: this is an enum so that it can be resolved by Rust bindgen. */
 enum {
-	DRM_IOCTL_NOVA_GETPARAM		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GETPARAM,
-						   struct drm_nova_getparam),
+	DRM_IOCTL_NOVA_INFO		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_INFO,
+						   struct drm_nova_info),
 	DRM_IOCTL_NOVA_GEM_CREATE	= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_CREATE,
 						   struct drm_nova_gem_create),
 	DRM_IOCTL_NOVA_GEM_INFO		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_GEM_INFO,
 						   struct drm_nova_gem_info),
-	DRM_IOCTL_NOVA_INFO		= DRM_IOWR(DRM_COMMAND_BASE + DRM_NOVA_INFO,
-						   struct drm_nova_info),
 };
 
 #if defined(__cplusplus)

base-commit: 10a6623a24a85708650efad7be15182289403cd7
-- 
2.55.0

