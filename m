Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018029;
	b=gVkpShadBmjG3Pb7SM5ihQgCqjwr856oaZN2Hkw8lnzL4bu0ZNYo5QXVxKmaxVmTxkiP
	 ALGsdaCgNnbXYP3jlOSBNBN0ZD0hqEscGIXKRfHhbnKMyaU+NXjpOM8lDzkZlT8amM5rK
	 f8lIX4dhmTVEzNpUIqqsS03s7AH7da0MTi62kNNNw2A/HKw/LTwdopE2aNrpjJn9Y1M+w
	 p6jJrEVTKMepeSrTu4vprXI661YxuNFjWsfgJsYo56Nsge4dldc7L4M9YN8Z+qUAhHKFa
	 HjL3u9W5KewMkefyFf8ULs12XlEMnbKE3Z4JH4V3/CcgEKei67CKwN3rGekdaDh83AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018029;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GQNExV2IBW/VIXiP+QKPq05xQXuih8H7xGZygNB42ds=;
	b=RVf9ExtUVFV4JRnTiMjyRKeUi5ezzwagiqO6CJ+qBwdNlW13cXuwcnrgqKt2UbItUyn0
	 ZS2M7y01qwUXCEP6IuUhxysuQHet23m3lLbl7TXvAxa5EvpjHuoNQhejzOh0Om8GcFU02
	 gZzJmaxDeaOXtVx6G0sxtL3YWnxxoIGHlURJZUMV8efA+v45FqT3K/zc/nLRFJIBChXiq
	 aLNe96B+nn2BvmTPjVLzuv5vUEb6OhJIC5TCfAb1C0iXqnPCiJAz6pZ+Z11rcj7fF8Ct6
	 4DBSX9O67KgE6FvEhPApiPttVxnYwZDruUxxpohNjQFEVrmGEzRe3FN5EWNcy0qnspg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZG1LcMF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93100606A326;
	Sat,  7 Nov 2026 02:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VZG1LcMF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4DD1F008A3;
	Sat,  7 Nov 2026 02:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018029;
	bh=GQNExV2IBW/VIXiP+QKPq05xQXuih8H7xGZygNB42ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VZG1LcMFLK+j+r6SEp67HSNoHe81odWNIkDi9DME3e9tBooSE5IWxcPaslSi8HqUH
	 C84gS9G+hliw3eWpKdf25eor+MavBp1HQsBs38+02DpLYRyIDiszJSRMJcS5sFB+oq
	 7frnYU+TUngxm6yrZeRftEYxlfd17zIKUH2fO1U5EeEn3xQ6YddOC4s/6ruoddjOz/
	 QcDCSJczb1iUmHrKi95X1Pn3Kd4s4KkkXJO2V1hUkG4jHskRhrOGJTatlFUtNTpTMH
	 iJv2SfkEsVXTSMr9TcfVoYEOLslAzIafhFltAhfZ2O4oAaSsvTmr014KeFh+Dp3ii+
	 m8M39LkGSGnnA==
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
Subject: [PATCH v2 2/7] rust: drm: gem: gate open/close callbacks with RegistrationGuard
Date: Sat,  7 Nov 2026 03:03:20 +0100
Message-ID: <20261107021427.2105374-3-dakr@kernel.org>
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
2.56.0

