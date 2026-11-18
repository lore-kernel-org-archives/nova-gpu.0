Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019563;
	b=k4NxXbY2noBmTEhve68FcNVRQQ2spcrdxswxd8tVdMm/IK1WKYd4Dlh2T/2VkWgXbUUV
	 8lS3kZNFO07VDFu08mMZWBaS5TDhm+o3K1qs25cXAADKCvvSb5uE/hCaa5Gw2E2I7gZ6W
	 ar2Y+uXUerCHoUNji6/JkkYsU4en2g+deHZ0z1EdM0J28RsAWN48oQ5RZno01MRfi7Bo6
	 hdWbUL30BLowI141flC0QYU21DNFJfDVaaeCp7ssSuYbtCaa3Zjp2QKXfPuQ1WVaKH2hp
	 q9gMEWf8oNG4bfe0M2tvA5kCLZ6r9aULxyuNR6AVVApBLyT2VE4pXOGmSpxW6K73nWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019563;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=O1IHTQpJQuYz1+Yvl5a17VKC21Xq0MGPdfoDSLGCxN8=;
	b=TrA1+q9bUOSaHipSTYjuuEy4/QRRhROQQhLiBIzsnLH06jCLrx+AQdfJM1HwFs+QNuoQ
	 T5jpMuZNI3NX1TQhTHcqKVPqHTarnzG4qNvlB27Z0MOoQEvxhjU24wR3BUfSsHWIAS/y9
	 RJraQwF5W4NqDQ1yURC8N4JJaRBWTxlR5e16v33ted+QFmE7GV0jvwWYLufeSttZmY0Q1
	 Jfy5qM4bZflSsWjaGyWYEu1zheKI1vjSHUjj0YdUri51MhKZv2ZYMcbixfRX//GfZxVow
	 DLIFy1Saw//heEYIxQeFqshDdzMzjWM5tM5TY8RNgj1ANWkdkPJIsy8LQPjppedZuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLpp6rGg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C80606A7C3;
	Wed, 18 Nov 2026 16:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dLpp6rGg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0861F000CE;
	Wed, 18 Nov 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019563;
	bh=O1IHTQpJQuYz1+Yvl5a17VKC21Xq0MGPdfoDSLGCxN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dLpp6rGgN/g0lqQaT2SCcE5cRyJYbPpmpajAa+UfoBZdUvtLAn0PTerjWsY16uo9o
	 edtM1ayx1x6M95dSZP3qENvEnWZpv/R0mA12YgaLbQk4w72u3aMSXrqU/2shjxIjHI
	 IpvjNxKYFAQYPibRz8XzP/seP0pBdsYx4upW1Kjr6wGLQFQWybLFD5AVgebcKLhA5L
	 tIcwivjHbddDY4cwS74xEbDo3r0mXan1GuI7Cpxf7z/s9P55vmGyABGMDXMwcjqrpV
	 mtpVOJw4BHsuDQthTnGc7Y4N+OowluXqB2xMoGSuWTqSQwmWb9um/z1UE9pC9w34GY
	 aMILh4C+TSd6g==
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
Subject: [PATCH v3 6/7] rust: drm: return impl PinInit from DriverFile::open()
Date: Wed, 18 Nov 2026 17:29:47 +0100
Message-ID: <20261118163203.2483856-7-dakr@kernel.org>
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

Change DriverFile::open() to return impl PinInit<Self, Error> instead of
Result<Pin<KBox<Self>>>, consistent with how bus device private data
works.

Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
return an initializer and the subsystem takes care of the allocation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 5 ++---
 drivers/gpu/drm/tyr/file.rs  | 4 ++--
 rust/kernel/drm/file.rs      | 5 +++--
 rust/kernel/drm/gem/shmem.rs | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index a05264917a0b..13642f83289d 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -7,7 +7,6 @@
 };
 use crate::gem::NovaObject;
 use kernel::{
-    alloc::flags::*,
     drm::{
         self,
         gem::BaseObject,
@@ -103,8 +102,8 @@ fn write_info<T: AsBytes>(info: &mut uapi::drm_nova_info, value: T) -> Result {
 impl drm::file::DriverFile for File {
     type Driver = NovaDriver;
 
-    fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>> {
-        Ok(KBox::new(Self, GFP_KERNEL)?.into())
+    fn open(_dev: &NovaDevice) -> impl PinInit<Self, Error> {
+        Ok(Self)
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 9f60a90d4948..6850708cfcdd 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -25,8 +25,8 @@ pub(crate) struct TyrDrmFileData {}
 impl drm::file::DriverFile for TyrDrmFileData {
     type Driver = TyrDrmDriver;
 
-    fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
-        KBox::try_pin_init(try_pin_init!(Self {}), GFP_KERNEL)
+    fn open(_dev: &drm::Device<Self::Driver>) -> impl PinInit<Self, Error> {
+        Ok(Self {})
     }
 }
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 10160601ce5a..bd5e4ca2977f 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -18,7 +18,7 @@ pub trait DriverFile {
     type Driver: drm::Driver;
 
     /// Open a new file (called when a client opens the DRM device).
-    fn open(device: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>>;
+    fn open(device: &drm::Device<Self::Driver>) -> impl PinInit<Self, Error>;
 }
 
 /// An open DRM File.
@@ -70,7 +70,8 @@ pub(crate) extern "C" fn open_callback(
         // SAFETY: `raw_file` is a valid pointer to a `struct drm_file`.
         let file = unsafe { File::<T>::from_raw(raw_file) };
 
-        let inner = match T::open(drm) {
+        let init = T::open(drm);
+        let inner = match KBox::try_pin_init(init, GFP_KERNEL) {
             Err(e) => {
                 return e.to_errno();
             }
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 24cb5343e0db..1a4f81e3b5b5 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -604,8 +604,8 @@ struct KunitObject {}
     impl drm::file::DriverFile for KunitFile {
         type Driver = KunitDriver;
 
-        fn open(_dev: &drm::Device<KunitDriver>) -> Result<Pin<KBox<Self>>> {
-            Ok(KBox::new(Self, GFP_KERNEL)?.into())
+        fn open(_dev: &drm::Device<KunitDriver>) -> impl PinInit<Self, Error> {
+            Ok(Self)
         }
     }
 
-- 
2.56.1

