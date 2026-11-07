Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018051;
	b=XhSbyTq+NMxQLooDJAVYG/y0JBtsXwLSOPyJLFc4vNJ3zv65HWYbNqjH+jiM2ja0jTFO
	 TDN9Hln5QAwntgo1v/bfcLi2F2ZJiVxNfvE1JtIva7J7TGOuFt3J4jxDLA4UZqg5r1RjK
	 4MRsh5AxAn9ER+UMG7sNAc9BdmURVCX6lgeaYJZFHw+F+wo9TzB2FrP1eaA7ypQ8N0So2
	 NKyahf6e7aw2oATOZsKdQivoxIr9dsls0z1KwLgkDPeJGUx0H5LPTzZBqO0BaEye67AlS
	 sAql0mNW6jzzPpk2HT/knLCdByjeeSILV9AxRbfh4Wtm/fPCBHkZlGl+vBSaIKAQMuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018051;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FKeMRXeqHw6CdH7k75CLvsUizGdPnnCl4iNshA3tHH0=;
	b=Ewr1jIK9PBeCUgZfJWN2GctrfYTpGmRs2NmLnGQi1y2GTdxjs4KJcRHXvgZcGdQwv7qs
	 rdpQyPxaH3V17QSpU2J//3ogaqiHHgIvjvjhHcc1A4KpZULAYF+oyE37/CDM7s9gT7gTT
	 etauPz2kSNwxqJfl7N7WlcPqRngdNMfSSb431IoSt4X3umJCTozSjoYRgVSsflczbwy8R
	 LJSsspTO9DR3/Ay77bkYqJU8iD9XYWt6DDbnbgtvHsKeB3ujrxvybalHZ15WEtDYKqBlp
	 pjLvTT3CylRC47ehRgwQSfAIE4yyKgRZqkXc8LSYBODZ+Y5OCHM24RuGiXCTrNdoflw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtsN0cY7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C790606A32F;
	Sat,  7 Nov 2026 02:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtsN0cY7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FA21F008A3;
	Sat,  7 Nov 2026 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794018051;
	bh=FKeMRXeqHw6CdH7k75CLvsUizGdPnnCl4iNshA3tHH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RtsN0cY7bHAvaczRNPCZfJAkt8MZHF09YwkjVzOen9aeI8o/n3ybHVaO49VqXiASH
	 SkNVb3b1BKWIEOvh690Xzh5uBfHzSg/BzExaNJydaxBbxKvP9Wx4k0TJ/hJjpsJ66E
	 IBTfWaU86lqY6bm/KuoYtF/yz6orCcx6QYo+E6mvavBp01h2vghiaRi8Urs8bTCr8m
	 LsHk/mvVA+6FW4xUl71onyf5WPMNtdiL9zDjXzwUGyQncPoLUjHzEVr3YiqeF/h3L7
	 OowfSGLnMmJpXFOTm/lAo9Gb5PmKjbgbWRLkhJeSbcJUGi6Uw5NoWfAHTORCXlKkiL
	 orrj38PDf+99A==
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
Subject: [PATCH v2 6/7] rust: drm: return impl PinInit from DriverFile::open()
Date: Sat,  7 Nov 2026 03:03:24 +0100
Message-ID: <20261107021427.2105374-7-dakr@kernel.org>
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

Change DriverFile::open() to return impl PinInit<Self, Error> instead of
Result<Pin<KBox<Self>>>, consistent with how bus device private data
works.

Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
return an initializer and the subsystem takes care of the allocation.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
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
2.56.0

