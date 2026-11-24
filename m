Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520292;
	b=xWxhSSNasK2UKydI6UwudiO8gHwxx5wbUTIHZoffzPLyJb/9RDHK7+zpKxly+JsKL1Km
	 bGizjNfQUDJQmmsjw1/6ZGspgDBnomja4NKpdEqCt+8YmH6v/SudKo8L+6Ea2LGEp921X
	 1nqXyD77CaAcpVoD04srjJkhQUQnz/H8W/gmphNmMwVnHpNCAWdWvI+LLnzieF1POi/55
	 qoYGDZoDrymdkf8F4tym+8/SCanMpbCRAF864dmPm49fjaBj9iiTAAoIOsQQMsc1O1R7d
	 7Yaa3VSUCXEaGWPVUvqHuushIDBhWmtyH7bvVMS46BaKVy0nVckht2QK1pzXqyYwwXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520292;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ybu7CTru2ctjT/JQX1kDFX6/n2K0u2C0IQl9ZlAzK1k=;
	b=Mz4DpAyIpspxgtoMG4fdrDm6D5d4G6y/ZrtsO0bYC3BOuvcD8Q9ENuarcaKNsb27O5v6
	 c5TKut4MEbJOZf/gbBZeYzdtgPUPDSWOWPdNQ3iN2qVOPKgISDbtlJcYOLLfBTSHyUg6e
	 kJCo7Tip9sZ4rqb1x7NK/GvbBlaG4psd9v0LgD7Rqzcw9SgaVoNRlsEywTN64W/mXnOho
	 yhGIASW+IgZiMkxTKWfAxbZQfE8ufUYoXqYIuiU8uOk+ktVjp2gIVba41KwiLA9H0yE2c
	 x1NVQSOIc8gnnJO/uk+tGRyTQmwSIk4IEzyVwgb+HQUuVVTo59f1Y0orUXh9P6y1SBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=pFlGBaFj;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=V3WPB4JV;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE124606A326
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 11:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE124606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=pFlGBaFj;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=V3WPB4JV
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id BEB4DEC0D1D
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:38:10 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 06:38:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795520290;
	 x=1795606690; bh=ybu7CTru2ctjT/JQX1kDFX6/n2K0u2C0IQl9ZlAzK1k=; b=
	pFlGBaFjjMfgWx7NYENgz6KbcL1eKUO7f6VFotw6KHhFdpMJb0WO9iJBxoPhC/bv
	peywMyOylLbuRTxIPoBIZbcNsa7vn2PK2y5WdWyKrRedGTJ7MafhjXdBQQrLTMFx
	h0PdjmFIBnZO1ddfEAA8TtrLTMOLHHdEepxxC73gmojw379IikSmYQQ9cGj3lAoJ
	3QwBnlu1TDbbCx2GmWytwqMNiR2A+Tt2PaP+baoJqflVaMgEUAtFYlENm3m5Tc1e
	qigxU7WUTLLTLkuc25MlCzmcT8Rl1ewm7YRZViKChlNd7JARJvoANf0MNkJJ0EaG
	o5R46+47KsvdMMHEkXE1OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795520290; x=
	1795606690; bh=ybu7CTru2ctjT/JQX1kDFX6/n2K0u2C0IQl9ZlAzK1k=; b=V
	3WPB4JVHfWZ5KRKyN63Ag+6tqqOG2Cwsqr1/TOqL+eDvCtaXUzVIM0tDJ8q40+Uh
	FcuINwl7oH2lMkLr6S1pumU+LQdE2Gvgnob9OwWrePaEpeubCQtBD5CZhkGie09z
	ZkZnGYQ5/W1mqjok0iwrtZildKRVqOz2bo7RH1EvNKU9P8FyiMpoNl+HWnR9mon6
	TKwrIyZufmVhigO9+YBaUATs9M4Ilbym1KzIKmIdWtPRzEmBjGpOYx4DOG2afE+J
	nZkyhzI98YHR8rK1z7J2dWDissZcPTiaje6Gx1O4yubdgQ/CGWn0DhoyGt9SecWE
	+zBipwxusSIUbvitu4XjQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795520290; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:Ca/lSOdgg77LhRRRnWit77GaRFzjOWYRiG/gLhlifwBfeih
	aFwEAWx/iIEOU7LZ21BEOh12mDNG5teh7+Vwl4sUXUSGCz/pHkiP4xFTjtpIAE9+
	UhVkfah0fLkjGsTWKWfVCaZWzqlOVCoD1Pczqocg0+qndYCA5RQ5+EL0nl+E3c4E
	ed2kanGmUQSkJliWI1dnOaBYAgGhkCV328RlC95h5b1x76mxD/Leq9LxLGVoEJW1
	pPJEIbhioQuX8+02/SuYpZ7ToiptS+sV4hPkunApSzPvQ6PLVQZP+RoJIT5LoTit
	F/1SUNjU3zIPru2GB16oJxOelnybB/ZafS0pO6g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1utBDAcSPFFKUnfpNtV+etgCjSoPXuAhD5CGEyRW14g=:J4eG0YFJGMPBrsUDeC+LNHOXEqB/qfrXm/9mvHUIjWQ=;
X-ME-Sender: <xms:IncFayT4d-ANNTeFduBVddjjO6VIkXhZEvMULjxPs1j5zAgMMmQYug>
    <xme:IncFa4225TxBwUpE8CDSNJe7ISKK_mtk-Yaepcbm8SYMgHeXjDmi6nTvav1UnyrSh
    Xxa-ynJFzuzTE_O_HoeqoIzQ5cfhn462xqhPB0eExXyvdzyVL3tEnlR>
X-ME-Received: <xmr:IncFayw9VRZ2IKydTMC0zaCL8Ja5cRNB576ux4EyPLlclAPpFhu0rC4w7halrrI56qtqzKLKEwwctTEq3tKB9PNJUNAaUGi1BWr8-Q>
X-ME-Proxy-Cause: dmFkZTE4vxInfYmBo+DFuOnFNxIOwA/i+HRG7PnCQhgicOZ8+eXnXh1Y8uJq4lXnNn4SWf
    uv6CYwPxZghEL1bQuLFAw0IZKtRafqXmpl/rtl3xX2jk1ALGwdraX7Va1ds74fmCAGsjJ7
    dqvUWxJKdyGMHWZtFGF0f0Wh4vs3LFYlTdsQTY0JkqcTAQh+ZZJOGt5b15gow0JpDoh2ey
    HEP1UoPSC356pLXwWlcuk9luDeKJ7S0O5CwPSCXcwsIoZw9lI8trtAK7PN+CA9VIJcoAF0
    a/FqWZ2KvElgyApOE5YEtpuyqvjylx1u934Iwc/JZbYtM+YpdnJX8CMMWeAONS0t25DBDM
    n9GOv4bQIBbmO9/JlvG1UqBDJx0NXHIHqkHLtt7palFtQLqWNDALOwPY9L6jOATmNnBmW3
    aJpBIwe1v/5Em7j4LqBlYwm/c0tRYIoHnYZRpikse9o4IfAJqJllcWwWtf+tdvsD/0exLb
    VsPqByso92ap/vmSlYnPYSbeaEm8nqvp/nd0lbVdhnW+NOUiygTAeWvknusKkZW8WFR71g
    PVgFOommZ3MIMFtNpqk9AwJ9NJKT+njpJUWbQTbj+J1K76PYs0GLDub3KkHNb4h4ogZp5w
    E42GYWhoJXUR/AT2swvQOfl35eECOEilZa0ZCbEdABxkvuxP1f0NYeTmz++Q
X-ME-Proxy: <xmx:IncFa7vZqvYuWUmSOFTP-3Bl3Yx-eg5BRlYhPnE9HolvtsgCi9AYBQ>
    <xmx:IncFa0RyEYeyVQidkAIEav-ZqcKzeumB-Jh1OOwOqJKxzzT3PMxyFw>
    <xmx:IncFa6JXC-hNmFcN8mpJFGBFKLmASSxIyumerrVNYpGbQ01OQGTNyg>
    <xmx:IncFa0A0rG24cMcnnAvWW3SgSYnaCK3ytZEMfxARjAcFEcG8EH1-kA>
    <xmx:IncFa6xmHXq-61TVqh6GknrwOfbuMfhGAy78g6bWDrKCP2_x6-hlRozP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 06:38:09 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Tue, 24 Nov 2026 12:37:45 +0100
Subject: [PATCH v2 3/5] rust: drm: gem: shmem: Implement
 prime_import_sg_table callback
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-rust-drm-gem-shmem-imported-sgt-v2-3-000f7a9ccb8d@jannau.net>
References: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
In-Reply-To: <20261124-rust-drm-gem-shmem-imported-sgt-v2-0-000f7a9ccb8d@jannau.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sami Tolvanen <samitolvanen@google.com>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
 Janne Grunau <j@jannau.net>, stable+noautosel@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8021; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=J4eG0YFJGMPBrsUDeC+LNHOXEqB/qfrXm/9mvHUIjWQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmzWcnHOIPbdyTwJH5Su7Fui8OL+fcuP1boK22Q39uVef
 JiQ+9umo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwES+T2Bk2NeQn5oxPXV6wVw5
 xwOzSgW3L7Rb21j9v+PW5RQxdVabnYwMszxeygkdm5Z9REqsI13b5efN+/aJfkYsDyM/75gquPM
 XEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The C drm_gem_shmem_prime_import_sg_table() helper function uses
`__drm_gem_shmem_create()` to create shmem objects. In the absence of a
`gem_create_object` callback this allocates just a `struct
drm_gem_shmem_object` resulting in buffer overflows when using it as
Rust `Object<t>`.
Implementing the `gem_create_object` callback for RUST DRM drivers is
not sufficient as `__drm_gem_shmem_create()` uses `kfree(obj)` in error
paths. This is unsound if the DriverObject contains fields with
non-trivial `Drop` implementations as noted in [1].

Imported BOs have no userspace creation arguments, so extend
`DriverObject` with a `create_imported(dev, size)` constructor and
implement it for Tyr's `BoData`, Nova, and the in-tree KUnit driver.

Tested with the asahi downstream driver.

Link: https://lore.kernel.org/rust-for-linux/20261118114102.490384-1-aliceryhl@google.com/ [1]
Fixes: 80df573af9ef ("rust: drm: gem: shmem: Add DRM shmem helper abstraction")
Cc: <stable+noautosel@kernel.org> # no in tree users
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Co-developed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/nova/gem.rs  |  4 +++
 drivers/gpu/drm/tyr/gem.rs   |  4 +++
 rust/kernel/drm/gem/mod.rs   |  9 ++++++
 rust/kernel/drm/gem/shmem.rs | 71 +++++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
index 2b6fe9dc0bfa..2e17422e76f5 100644
--- a/drivers/gpu/drm/nova/gem.rs
+++ b/drivers/gpu/drm/nova/gem.rs
@@ -27,6 +27,10 @@ impl gem::DriverObject for NovaObject {
     fn new(_dev: &NovaDevice, _size: usize, _args: Self::Args) -> impl PinInit<Self, Error> {
         try_pin_init!(NovaObject {})
     }
+
+    fn create_imported(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
+        try_pin_init!(NovaObject {})
+    }
 }
 
 impl NovaObject {
diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
index 3bf3787f5c3f..4b61bb04c845 100644
--- a/drivers/gpu/drm/tyr/gem.rs
+++ b/drivers/gpu/drm/tyr/gem.rs
@@ -48,6 +48,10 @@ impl gem::DriverObject for BoData {
     fn new(_dev: &TyrDrmDevice, _size: usize, args: BoCreateArgs) -> impl PinInit<Self, Error> {
         try_pin_init!(Self { flags: args.flags })
     }
+
+    fn create_imported(_dev: &TyrDrmDevice, _size: usize) -> impl PinInit<Self, Error> {
+        try_pin_init!(Self { flags: 0 })
+    }
 }
 
 /// Type alias for Tyr GEM buffer objects.
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e1ebad77ebe2..e01b8311dd89 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -98,6 +98,15 @@ fn new(
         args: Self::Args,
     ) -> impl PinInit<Self, Error>;
 
+    /// Create a new driver data object for a GEM object that is being imported
+    /// from another driver (e.g. via dma-buf).
+    ///
+    /// Imported objects are allocated by the importing helper, which only
+    /// provides the device and size. There is no driver-supplied
+    /// [`DriverObject::Args`], so drivers must initialize the per-object
+    /// state without those arguments.
+    fn create_imported(dev: &drm::Device<Self::Driver>, size: usize) -> impl PinInit<Self, Error>;
+
     /// Open a new handle to an existing object, associated with a File.
     fn open(_obj: &DriverAllocImpl<Self>, _file: &DriverFile<Self>) -> Result {
         Ok(())
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 264ab188f77d..d6977673e21a 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -32,6 +32,7 @@
         SysMem,
         SysMemBackend, //
     },
+    page::page_align,
     prelude::*,
     scatterlist,
     sync::{
@@ -345,6 +346,67 @@ pub fn new(
         Ok(obj)
     }
 
+    /// Create a new shmem GEM object from another driver's scatter/gather table of pinned pages.
+    ///
+    /// This is a Rust re-implemetation of `drm_gem_shmem_prime_import_sg_table()` to avoid
+    /// creating and destroying `Self` in C code.
+    /// This function imports a scatter/gather table exported via DMA-BUF by another driver.
+    /// It should be only called via the &drm_driver.gem_prime_import_sg_table callback.
+    extern "C" fn prime_import_sg_table_callback(
+        raw_dev: *mut bindings::drm_device,
+        raw_attach: *mut bindings::dma_buf_attachment,
+        raw_sgt: *mut bindings::sg_table,
+    ) -> *mut bindings::drm_gem_object {
+        // SAFETY: raw_attach is a valid pointer to `bindings::dma_buf_attachment` created
+        // by `dma_buf_attach` in `drm_gem_prime_import_dev` the only caller of this
+        // callback.
+        let size = match page_align(unsafe { (*(*raw_attach).dmabuf).size }) {
+            Some(size) => size,
+            None => return EINVAL.to_ptr(),
+        };
+
+        // SAFETY: The DRM shmem helper only invokes this callback for a registered DRM device of
+        // type `T::Driver`, which is `Self`'s driver per the `AllocImpl` impl below.
+        let dev: &Device<T::Driver> = unsafe { Device::from_raw(raw_dev) };
+
+        let new: Pin<KBox<Self>> = match KBox::try_pin_init(
+            try_pin_init!(Self {
+                obj <- Opaque::init_zeroed(),
+                parent_resv_obj: None,
+                sgt_res: ManuallyDrop::new(SetOnce::new()),
+                sgt_lock <- new_mutex!(()),
+                inner <- T::create_imported(dev, size),
+            }),
+            GFP_KERNEL,
+        ) {
+            Ok(new) => new,
+            Err(e) => return e.to_ptr(),
+        };
+
+        // SAFETY: `new.as_raw()` is guaranteed to be valid by the initialization above.
+        unsafe { (*new.as_raw()).funcs = &Self::VTABLE };
+
+        // SAFETY: The arguments are all valid via the type invariants.
+        if let Err(e) = to_result(unsafe {
+            bindings::drm_gem_shmem_init(dev.as_raw(), new.as_raw_shmem(), size, true)
+        }) {
+            return e.to_ptr();
+        };
+
+        // SAFETY: `new` is an initialized `Self` never moved outside of this function so it is
+        // safe to initialized `drm_gem_shmem_object::sgt` with `raw_sgt` as expected by the caller
+        // of this function.
+        unsafe { (*new.as_raw_shmem()).sgt = raw_sgt };
+
+        // SAFETY: We never move out of `self`. Ownership of the allocation is transferred to the
+        // C side.
+        let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
+
+        // SAFETY: `new` was just produced by `KBox::into_raw` and so is a valid pointer to an
+        // initialized `Self`. `obj.base` is the embedded `drm_gem_object` the caller expects.
+        unsafe { &raw mut (*(*new).obj.get()).base }
+    }
+
     /// Creates and returns an owned reference to a virtual kernel memory mapping for this object.
     #[inline]
     pub fn owned_vmap<const SIZE: usize>(&self) -> Result<VMapOwned<T, SIZE>> {
@@ -395,7 +457,7 @@ impl<T: DriverObject> driver::AllocImpl for Object<T> {
         prime_handle_to_fd: None,
         prime_fd_to_handle: None,
         gem_prime_import: None,
-        gem_prime_import_sg_table: Some(bindings::drm_gem_shmem_prime_import_sg_table),
+        gem_prime_import_sg_table: Some(Object::<T>::prime_import_sg_table_callback),
         dumb_create: None,
         dumb_map_offset: None,
     };
@@ -625,6 +687,13 @@ fn new(
         ) -> impl PinInit<Self, Error> {
             try_pin_init!(KunitObject {})
         }
+
+        fn create_imported(
+            _dev: &drm::Device<KunitDriver>,
+            _size: usize,
+        ) -> impl PinInit<Self, Error> {
+            try_pin_init!(KunitObject {})
+        }
     }
 
     #[vtable]

-- 
2.56.1

