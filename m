Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018035;
	b=YQ+FA8Q0halPYyID3gHcQ2z+HfcedBeXIz4W9Y2iCRE+18h/3fWy9n3X748/8VM0HlU/
	 n7x6LaoN8279EikDBefEWsbHdLRxXDovdm3D7ZS/V4xEOzp2zO4Y0zUNMRSO334Yf0C01
	 lhaDtRXsie3E+UvXNsLh2CIiqDL/9gjR30zZRuIROcCKMUGF7+FgK3Xxv5/pxn0el+g3f
	 lYvVX51ToAZk3te0/otWk97G1SSm72H1i6wP+29e3MAQlC6sBAPjsg4PXWIWzoVtcoYAD
	 6GEzxVbSzksyJJZeGMlGP6bvyEcE7hAF12/8s7+2iZRll2Fqw43v68kEc9PtDa/fISg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018035;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eqYdLZKOeztfuJHWzQOoytct6WOwi61ZtheTgCfAdyE=;
	b=05UJb/IPGGO5BKzU9ZVnZV0+9pYZI4r//hVAeJXsLHFUsFlXWWVgVLYHTtNnvjAi5GpM
	 OIYErk2IqVARm0SxfX9AIQ1DsD3H7sp97cQD938ZfsmeXkK9mjNlPsoa7SwuHIIL3rd7S
	 bWLTq3HWaNTbfZDHGbiyGF1qn1/eSU3c/kMbUgWtNpBngQCOg3RgeJ2hjTYShY91q+vQl
	 +hIsh+S9KY5DAgBx6lGnw896lMdHF3X+73pf0c62GdvANGsdRnBCObtWXqnTSftLLOapj
	 gNTpGu+qCNahEry/UAUX4iNIOshWjS0+mADpc/LRXFb8NbFQFxE5YRFXuhL1chAvb1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cn44YoVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A6B606A32E;
	Sat,  7 Nov 2026 02:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cn44YoVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28531F0089F;
	Sat,  7 Nov 2026 02:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018034;
	bh=eqYdLZKOeztfuJHWzQOoytct6WOwi61ZtheTgCfAdyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cn44YoVrUzJUGx61lu47DqUq6M1Sc2JzO9dZ57QLbr0D4+x2fTsRqbgIuFsLA+rqR
	 SWbVlfTW4lq8WsAr1bHClI0dPPCmvVLnLcH6VoAwJ9ZvclaoWuvFbtgir/MqEH/6TI
	 DcKJV1VXAeiMHGSEeiTXzGY6eXE8yv5dVKATEecWJZvcPU9wLupTqy1yv8W3X4XX/D
	 1PLbDdAkQa+LquobyDMPVNeJOkPnk3+8nGT2aO7eB8p750w++2z5f50sDqwQtjtXeG
	 5J2Ty25QaOmaV0z11BRnXgH6fUyXh/czOHaS4vOu4ycnYzkQ29m26Pd2EGirDrLC/F
	 XiUjJRYWhj1lg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	acourbot@nvidia.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	work@onurozkan.dev,
	brauner@kernel.org,
	lyude@redhat.com,
	j@jananu.net,
	alvin.sun@linux.dev,
	deborah.brouwer@collabora.com,
	laura.nao@collabora.com,
	beata.michalska@arm.com
Cc: nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] rust: drm: move file_operations from gem to device
Date: Sat,  7 Nov 2026 03:03:21 +0100
Message-ID: <20261107021427.2105374-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107021427.2105374-1-dakr@kernel.org>
References: <20261107021427.2105374-1-dakr@kernel.org>
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

Move the file_operations definition from drm::gem::create_fops() into
UnregisteredDevice in drm::device. This is the file_operations of the
DRM minor device, set through the drm_driver struct. It is not specific
to GEM.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs  | 23 ++++++++++++++++++++---
 rust/kernel/drm/gem/mod.rs | 20 --------------------
 2 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index dd1c83fef323..3340fa0dc46b 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -195,11 +195,28 @@ const fn compute_features() -> u32 {
         driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
-        fops: &Self::GEM_FOPS,
+        fops: &Self::FOPS,
     };
 
-    const GEM_FOPS: bindings::file_operations =
-        drm::gem::create_fops(crate::module::this_module::<T::OwnerModule>().as_ptr());
+    const FOPS: bindings::file_operations = {
+        let mut fops: bindings::file_operations = pin_init::zeroed();
+
+        fops.owner = crate::module::this_module::<T::OwnerModule>().as_ptr();
+        fops.open = Some(bindings::drm_open);
+        fops.release = Some(bindings::drm_release);
+        fops.unlocked_ioctl = Some(bindings::drm_ioctl);
+        #[cfg(CONFIG_COMPAT)]
+        {
+            fops.compat_ioctl = Some(bindings::drm_compat_ioctl);
+        }
+        fops.poll = Some(bindings::drm_poll);
+        fops.read = Some(bindings::drm_read);
+        fops.llseek = Some(bindings::noop_llseek);
+        fops.mmap = Some(bindings::drm_gem_mmap);
+        fops.fop_flags = bindings::FOP_UNSIGNED_OFFSET;
+
+        fops
+    };
 
     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
     ///
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 94355081edab..260f36817f96 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -388,23 +388,3 @@ impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T, Ctx> {
         dumb_map_offset: None,
     };
 }
-
-pub(super) const fn create_fops(owner: *mut bindings::module) -> bindings::file_operations {
-    let mut fops: bindings::file_operations = pin_init::zeroed();
-
-    fops.owner = owner;
-    fops.open = Some(bindings::drm_open);
-    fops.release = Some(bindings::drm_release);
-    fops.unlocked_ioctl = Some(bindings::drm_ioctl);
-    #[cfg(CONFIG_COMPAT)]
-    {
-        fops.compat_ioctl = Some(bindings::drm_compat_ioctl);
-    }
-    fops.poll = Some(bindings::drm_poll);
-    fops.read = Some(bindings::drm_read);
-    fops.llseek = Some(bindings::noop_llseek);
-    fops.mmap = Some(bindings::drm_gem_mmap);
-    fops.fop_flags = bindings::FOP_UNSIGNED_OFFSET;
-
-    fops
-}
-- 
2.56.0

