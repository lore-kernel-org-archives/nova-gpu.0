Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019547;
	b=pQCvQzAdQ1eyrcdijbvp5hOixUItBtzPj9MKQKvlNrkFWGusO3Qf5LNvoN2o27phfBTd
	 UzfNCTj1NEtcJ8n49i3n87YnIkeZeplXsu2lfWM+bq8H1MIuRc4W3Gvf36qlJZXZjzScN
	 h7+7VE2Az6IK3zNsSe6+yZXG5g0PmlABKvra78Qpto5f1BW9JKPqOYp/g19cO5gbrJpDS
	 XGc/+c0vmGlZMXkMPqWyWagbxl3CqWH+0RDwJZnd69i5+zwbv2vnHhDCnSEO1C7879aM5
	 1QcS0vKC56VWA52x3ZkLNHRkQffpAwJJ3C6DOESHpnXJ3AiY8bGHH3eXZO0qkbkwqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019547;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xk+TZUF1TRmt+f+C/QPA3J720VtA09DDpLZ7FCFd5EA=;
	b=wzbbEN9iMiJDaqEKtc9TQlsvpDKjmVROBtyGpWuoWoC1IvqYmmlYwt+6pXdxAFx5YJGV
	 MK9ekI96Z4c25qeXjFotQo7lfGrvrdnUHqdnSxgu3SB92V5vjuJKD4YaDgkALMIxeaMZ1
	 qc6sP21rvTDhzTQzubaKR/ot+9SJ9vOUFtQXSfJ2uXMK54vd2AAzN1Ukx02Xch4yQ+K40
	 045KxrnGhBaFHzpqu00Aufu+96r+IULOe6oEJJnCW8oyJRj1Uc2E1wVZwMOfFIjaiGPTW
	 BOUaG6JXbS6oNkVcIFd0nW2ZRWi6Q57f/+peRdwKFV+PCa0bwZdBPEkrfBMtOuifoxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMFUCMwp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E140606A7C2;
	Wed, 18 Nov 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AMFUCMwp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E50D1F000C7;
	Wed, 18 Nov 2026 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019547;
	bh=xk+TZUF1TRmt+f+C/QPA3J720VtA09DDpLZ7FCFd5EA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AMFUCMwpmKeo7mfnNhAhB2/2s/eeAPSqbqk4ahoJ6gTtmxUVl90WdOhZcdmKstqeU
	 vA8MmamLudMvT7lAq+NAyfUJlc0MySY07sioXKSKjKg7gTnswNb4HSpRymOfuC0scK
	 59BIjgz8bFhgjB0XxETRkajVRK1hVWVGg4bdaGYrMdZP4Ly9GyjweU2pDLv/KXwfsb
	 7DTItFEiNPvTpfAhy5hUOUDkZBVnHqKjQbIe90vxWrvVKK1+eeX8/mDv+YM8d23ymi
	 HIx0uKaqAolvVjkC/dy72Nmgrp0qobjah01Zhk0H7v9qbAydxL+S6ZAvcJ22F8r1uv
	 SQG6Wcv2R0fCw==
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
Subject: [PATCH v3 3/7] rust: drm: move file_operations from gem to device
Date: Wed, 18 Nov 2026 17:29:44 +0100
Message-ID: <20261118163203.2483856-4-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118163203.2483856-1-dakr@kernel.org>
References: <20261118163203.2483856-1-dakr@kernel.org>
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
Reviewed-by: Gary Guo <gary@garyguo.net>
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
2.56.1

