Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7CB34252B;
	Fri, 14 Aug 2026 23:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786748981; cv=none; b=VA1NWLX3J37eNvm2kC6nOEfGDlWYXMBn1S/zpvmYc6XhCKIcZt44pFTHAgtzs+HsT3zd7J5qHRNuWr+799ZIyeHBFiR7RO1mPJ7SPEzNLgbjco/fwOD+YsBHx3k/Afu8FGJfkHId7HVe2R+zx+r1PtjZVpAZdty+stOOM/8wFSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786748981; c=relaxed/simple;
	bh=G/1K1XMVr5yKDUV9iauQ7JNQt7DvZnhVUGWQIKfu9YI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNhcFP4WQenGZV68kQGh0WLzAcR6LCIL2DO7DYQH/CqwB1+E9unWEjLbfrsKJsDXq3X/EwGWiJGr1RUXNnE52eyRvpMT5ZdNZeWMPa+qHVgzKAUkOiFshTvmPKzovAtN/OyptERnl99qvXq47f/7dVwuE3TcdyuziGfCyMDCJVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f25gp82M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f25gp82M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB8D01F00A3D;
	Fri, 14 Aug 2026 23:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748980;
	bh=sSKhhle7EcwGqQ4E8Sm0jDW4kZ+Q2qKC0uMRA8YVy+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f25gp82M8K21LocoUm752Joix3iCnsavD6WDN+D9Ll7CTeAOL1aTTXNaJM7W+PYwP
	 +2frfr1gC9oRe+tAkPppYQiwqgp72ZGN7AeW3bCzsEIlV/NJ1bc0PnvB20VbST+6XM
	 DwAcUwGcDGjZKOaDyE/mi4l0OTBNaagsj0v+50bFrP5HYTlFvjoxlDg9DFZukkGyyU
	 8ObKe+ZdvsoydxwN2myzb4nRGXMjY9aCg/oBQrKWLblo5NTGjTYKHWkBlGIJ47BmHW
	 LWoRcIkSIPoc57ksW6R6fGMD7FI0LcxWUgM9f1WbATTnLjZkx3cF+z3QAJw8tM9RVf
	 REb7T99DaGeuw==
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
Subject: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
Date: Sat, 15 Aug 2026 01:09:00 +0200
Message-ID: <20260814230923.1292966-3-dakr@kernel.org>
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

Wrap the GEM object open and close callbacks with a RegistrationGuard
(drm_dev_enter / drm_dev_exit) to ensure the driver callbacks only run
while the parent bus device is bound.

If the device has been unbound, open returns -ENODEV and close silently
returns. This prevents driver code from accessing device resources after
unbind and is a prerequisite for making drm::Driver::File
lifetime-parameterized, since GEM callbacks receive a &drm::File that
could otherwise be used to access invalidated file private data.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 80d8f524f9d5..560403ca8e38 100644
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
2.55.0

