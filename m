Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1A63B8120;
	Fri, 14 Aug 2026 23:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748986; cv=none; b=ZP1HjskJT8bjoWZwncB1lH/0R2Ie4GkKExL49Ge8QwhSKD5Mgeu1ir4TdBBkh5tWQYesyaUYKrNnVxGapyDxVDMgbt/UjTmGaVIF27q4HKrmGH2vmKxK1Lt94wogPhZZAk0Hx3LlfbrgF20/n7iv06XDQ6NSV4t+oYxs2sFPMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748986; c=relaxed/simple;
	bh=1t4zyBQenZPN/8uKpRxmMUMeynk1L33DrO2kaz3Yqp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awAK0OJlowJj4Re/wMNUkN1DynHn4rAdTxKIyRB+iFYxcuvqvIXeHl581dHOCer3PnpNDYms5/RCll95DucEQEzFYnn+jTh9JV9plt13BQmWnrS6jPBXlgAKjhWPnSEbrlW3RRwYn2OcaHT7SSijhG2hiyIvfbnlesyfvyrEZ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEA4iLnM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEA4iLnM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD47C1F000E9;
	Fri, 14 Aug 2026 23:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748985;
	bh=YPEpqexwPWF2SDDlO5NIsqZNVaXDThMuN9H2rr7FxkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MEA4iLnMmJze1K0C80G9/JwNG6PTldNvVze91r7Y8Kkon6p6cTMBLi3mOkc5KVwR/
	 tMoJkawUo/VRooauoqxTJfUzTEx1afUWJzNLkqnLx9q5A5ct8CgBdpNCFV6+mxNwnv
	 lGBw7hcoNe6mumL6jEhdoEQpenyBgmxvBDLjAdjNBZABZMie1cuQSVH/JWye8YLINB
	 41JDyyBsI77TcS52+Es/J8ut+e6vYJMF1uqikmzdtnhPigmlu3Lv4nVJGK3E9zxGji
	 trMf4yd8l1UGdA1rnOzoatDrYQfFRfkcRv3mFTfMmk4dKctAeX/snxrOJOiG23Ce0Y
	 QYquYjl2qgYIA==
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
Subject: [PATCH 3/7] rust: drm: move file_operations from gem to device
Date: Sat, 15 Aug 2026 01:09:01 +0200
Message-ID: <20260814230923.1292966-4-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814230923.1292966-1-dakr@kernel.org>
References: <20260814230923.1292966-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the file_operations definition from drm::gem::create_fops() into
UnregisteredDevice in drm::device. This is the file_operations of the
DRM minor device, set through the drm_driver struct. It is not specific
to GEM.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs  | 22 ++++++++++++++++++++--
 rust/kernel/drm/gem/mod.rs | 20 --------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index be83287fe161..a2940e172073 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -195,10 +195,28 @@ const fn compute_features() -> u32 {
         driver_features: Self::compute_features(),
         ioctls: T::IOCTLS.as_ptr(),
         num_ioctls: T::IOCTLS.len() as i32,
-        fops: &Self::GEM_FOPS,
+        fops: &Self::FOPS,
     };
 
-    const GEM_FOPS: bindings::file_operations = drm::gem::create_fops();
+    const FOPS: bindings::file_operations = {
+        let mut fops: bindings::file_operations = pin_init::zeroed();
+
+        fops.owner = core::ptr::null_mut();
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
index 560403ca8e38..ee048febfbdc 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -399,23 +399,3 @@ impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T, Ctx> {
         dumb_map_offset: None,
     };
 }
-
-pub(super) const fn create_fops() -> bindings::file_operations {
-    let mut fops: bindings::file_operations = pin_init::zeroed();
-
-    fops.owner = core::ptr::null_mut();
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
2.55.0

