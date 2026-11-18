Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019541;
	b=IxbUD6qaS3V49+lM+GrKGAmSsqnhwKQSOzmILACfQdZMhHlabpnpYFM1nU7rDEcbaQ5G
	 cMcXRpVCZ8Cm7EzVAQhBe4+f9UTgM7X1+IohJ2xmDlMlG/Qh9DrlzQNF0JUYvfatou14Q
	 K87+1LzXMvDrqdNZHrbVoUCb8vnTZYvEQHh+yPhfjpyksovJQcJU4zIoOc9LacJO23nZA
	 CfMX3pt1ZVeOsMPTh7CRpAyIcAfGpKA6rC0eJSBpoYiZX/E07MDp9G2zYS+xhVt6vkFD+
	 kR6tGMH/k9BC+Hm/ueDOHWJu4xOYa0Fwisvnpi5tGPMy+Ghlza92ruL/qfle1ZmsFcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019541;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OOna5QYnDXiX/mKSFI3oMp+tVKpJtzeZSErziwfKJyI=;
	b=l7BQ629qOB2TXS+Kgfm4ktYMY6nfNdIeN2+3RFH8lB2uedMJoLhq+r0qHI+eLP8RmWie
	 T3xJlBWBGRC+HoGW0o/Cb+rklw4I0Wag8jBAVhAMjstseh3cKeZ13lyAFqt2laEZxKYz0
	 9+w6RrEEWM0fZUfQ07xX7UkbzlA6LgodBwkqLtLsRmezi24g1988ZvQKp8nU9oq04WmGt
	 kj2fJ+6LVh7URZYyw9ZBskg/VRpskAWnUU/JLUmqkApk8kQR9CpiGxu6KilkOtf4uZK3y
	 UKFm8uG6ZzaZpdKNax2eetw1LO334dbecIshHQ78Qo2UcbRMeD3o/t4/G0ivMcOn8cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeykyGtg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9BA606A337;
	Wed, 18 Nov 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aeykyGtg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C308F1F000C4;
	Wed, 18 Nov 2026 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019541;
	bh=OOna5QYnDXiX/mKSFI3oMp+tVKpJtzeZSErziwfKJyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aeykyGtg3mkwJ5pIl3nfB6Vu1U7+AbYMuB1OWwtlqiihoayGzq06A5aLEokFDrGql
	 zE2FcUC+HUhYoou6jz90IB3SxyL5/ioi5Z3hLBaSkGiQ/4+8kcpG9tSkexckNob5W7
	 F5nEiSCAbaWi8ngFfiT2Y1XN3Tyj0fKMOeegsgEne/kCBIiTArKPYTvYzV+rTEjykv
	 KZmMlU+9Yw1z2+ecok1QNj1ByXcebs9xmPPXucgTCyj1tvQ3NNRICu98/GT9ovLA9p
	 pBl9t8eqZYInDntRC6Ka9FcCb8v9cDZ9jTt5DUZAgSiJjolrveny8oM8Ny/EM0cWtX
	 4uNEm78M0AvZg==
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
Subject: [PATCH v3 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
Date: Wed, 18 Nov 2026 17:29:43 +0100
Message-ID: <20261118163203.2483856-3-dakr@kernel.org>
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

Wrap the GEM object open and close callbacks with a RegistrationGuard
(drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
while the parent bus device is bound.

If the device has been unbound, open returns -ENODEV and close silently
returns. This prevents driver code from accessing device resources after
unbind and is a prerequisite for making drm::Driver::File
lifetime-parameterized, since GEM callbacks receive a &drm::File that
could otherwise be used to access invalidated file private data.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 85657a39e146..94355081edab 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -128,6 +128,14 @@ extern "C" fn open_callback<T: DriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
 ) -> core::ffi::c_int {
+    // SAFETY: `raw_obj` is a valid pointer to a `struct drm_gem_object` with a valid `dev`.
+    let dev: &drm::Device<T::Driver, drm::Userspace> =
+        unsafe { drm::Device::from_raw((*raw_obj).dev) };
+
+    let Some(_guard) = dev.registration_guard() else {
+        return ENODEV.to_errno();
+    };
+
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe { DriverFile::<T>::from_raw(raw_file) };
 
@@ -148,6 +156,14 @@ extern "C" fn close_callback<T: DriverObject>(
     raw_obj: *mut bindings::drm_gem_object,
     raw_file: *mut bindings::drm_file,
 ) {
+    // SAFETY: `raw_obj` is a valid pointer to a `struct drm_gem_object` with a valid `dev`.
+    let dev: &drm::Device<T::Driver, drm::Userspace> =
+        unsafe { drm::Device::from_raw((*raw_obj).dev) };
+
+    let Some(_guard) = dev.registration_guard() else {
+        return;
+    };
+
     // SAFETY: `open_callback` is only ever called with a valid pointer to a `struct drm_file`.
     let file = unsafe { DriverFile::<T>::from_raw(raw_file) };
 
-- 
2.56.1

