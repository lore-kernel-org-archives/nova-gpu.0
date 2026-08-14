Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CF73DEACE;
	Fri, 14 Aug 2026 23:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749007; cv=none; b=rri1HHAtUfJKWNbjm2xrxSj2qSkRrgYu40s/Ia/vSbDs4sJeuDU0UjGe5uduuvoUw/HbLblFBJbz9ObaC/Ygkt7yeakfjXb4ATLKB1MXEsJD0ShTnoHFHJ0aP79Abh1kLJ6fnj6rvTO+3/G61h3iDhyJnpYRHkc8krLSE9RxBxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749007; c=relaxed/simple;
	bh=23qqp3tV/Af4FpxnD6uOnEfexkKPNPXn9Eqvow8dJeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lILNL+OCCLXobRcIUpJUaGcWEsvEkKYD8/DbbHD7HonQMaOzjnAcEkHRUFHW2GP0MSTXvOfSyfISQQp61P2Z2fVyXCWJ4gxySMdYRfkOgP18zT0ew6g155Ps41ECzNe9ce8DnxMKNCyzCSHfHs5s81+9Nho8sU6sCux2OSWMOPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PW9O/W4y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PW9O/W4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9C21F00ACA;
	Fri, 14 Aug 2026 23:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786749005;
	bh=ezGmrhqJWxcPMTxdp1bMwe75jVYSM3ZOzLYKZoXyWOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PW9O/W4yJhdsuTGeeFrVntyLiEUfVRIfxdxa3ss7tY3ZmpcvOoiUzICi2jsoV/79K
	 nm6hh7GBwQD1dyThq0+EMTGTEfInkdnkXQ0h4H8eRRJ4mOog/ypKnN6TBBPSYwNzb0
	 dB2/xyeFsXEPNHtqnQplOaAfWTWm297Jp5r1wOHgO4twftphDNc8hdEhwHzmgd1a48
	 qnz8TBlSDO1FsRSM7JE53ZutKSstl70fcdCXUiM6NGoiiNd1ki9bZgivclqTBjOimV
	 AWSGSeoPVd05vENQdM8vhiNAgQrH6y9kRLkQk47dza+Yfy0SED4Pj9gseav4LVvzEm
	 hOooO9ZoSRaXw==
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
Subject: [PATCH 7/7] rust: drm: return impl PinInit from DriverFile::open()
Date: Sat, 15 Aug 2026 01:09:05 +0200
Message-ID: <20260814230923.1292966-8-dakr@kernel.org>
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

Change DriverFile::open() to return impl PinInit<Self, Error> instead of
Result<Pin<KBox<Self>>>, consistent with how bus device private data
works.

Drivers no longer need to allocate a Pin<KBox<_>> themselves; they just
return an initializer and the subsystem takes care of the allocation.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 4 ++--
 drivers/gpu/drm/tyr/file.rs  | 4 ++--
 rust/kernel/drm/file.rs      | 7 ++++---
 rust/kernel/drm/gem/shmem.rs | 4 ++--
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 1f94201af92b..30bbabe6ee78 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -20,8 +20,8 @@
 impl drm::file::DriverFile<'_> for File {
     type Driver = NovaDriver;
 
-    fn open(_device: &NovaDevice<Registered>, _reg_data: &()) -> Result<Pin<KBox<Self>>> {
-        Ok(KBox::new(Self, GFP_KERNEL)?.into())
+    fn open(_device: &NovaDevice<Registered>, _reg_data: &()) -> impl PinInit<Self, Error> {
+        Ok(Self)
     }
 }
 
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 0e0878090de6..933a365cb016 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -28,8 +28,8 @@ impl drm::file::DriverFile<'_> for TyrDrmFileData {
     fn open(
         _device: &TyrDrmDevice<Registered>,
         _reg_data: &TyrDrmRegistrationData<'_>,
-    ) -> Result<Pin<KBox<Self>>> {
-        KBox::try_pin_init(try_pin_init!(Self {}), GFP_KERNEL)
+    ) -> impl PinInit<Self, Error> {
+        Ok(Self {})
     }
 }
 
diff --git a/rust/kernel/drm/file.rs b/rust/kernel/drm/file.rs
index 6491ec5707a0..31fc318eb535 100644
--- a/rust/kernel/drm/file.rs
+++ b/rust/kernel/drm/file.rs
@@ -30,12 +30,12 @@ pub trait DriverFile<'a>: Sized {
 
     /// Open a new DRM file, creating the per-file driver data.
     ///
-    /// Called when a client opens the DRM device. The returned file data may borrow from
+    /// Called when a client opens the DRM device. The returned initializer may borrow from
     /// `reg_data` with lifetime `'a`.
     fn open(
         device: &drm::Device<Self::Driver, drm::Registered>,
         reg_data: &'a <Self::Driver as drm::Driver>::RegistrationData<'a>,
-    ) -> Result<Pin<KBox<Self>>>;
+    ) -> impl PinInit<Self, Error>;
 }
 
 /// An open DRM File.
@@ -107,7 +107,8 @@ pub(crate) extern "C" fn open_callback(
             unsafe { drm::device::Device::from_raw(raw_dev) };
 
         dev.registration_data_with(|reg_data| {
-            let inner = match <<D::File as ForLt>::Of<'_> as DriverFile<'_>>::open(dev, reg_data) {
+            let init = <<D::File as ForLt>::Of<'_> as DriverFile<'_>>::open(dev, reg_data);
+            let inner = match KBox::try_pin_init(init, GFP_KERNEL) {
                 Err(e) => return e.to_errno(),
                 Ok(i) => i,
             };
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 793b4883de3a..d882b505fe0f 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -611,8 +611,8 @@ impl drm::file::DriverFile<'_> for KunitFile {
         fn open(
             _device: &drm::Device<KunitDriver, drm::Registered>,
             _reg_data: &(),
-        ) -> Result<Pin<KBox<Self>>> {
-            Ok(KBox::new(Self, GFP_KERNEL)?.into())
+        ) -> impl PinInit<Self, Error> {
+            Ok(Self)
         }
     }
 
-- 
2.55.0

