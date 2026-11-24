Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520289;
	b=WQ8r6YeczFj/eFUvHYBVDr4daVGHevy5czCB1JYOjnTQAsz9Gkf6F/YIFqeqIafAJ+ej
	 y7k+RDI1QsHIawd08QU/EzBfJvgaGeoyHqfdD+4rPwQt+sZxvCRvar8VoyZi3rSh2gs5l
	 FPK3avQ97InF0y0V+w8Oenw1KemyvUoFDNNewgvJQZcFbrTs2t3FeN0Facdu041/vF7Qn
	 IhgguUhxKNyrdOLJCbv03zlna674CWpCMQ6kDN7A4G51O0TwzxEPVaVf8gnM1UXbnsDj8
	 AjGpJQQ06xQPml9j0Jd4vZpWgs/mTaeI0c1RJz2vB+AKHc/rly1IHEYVm1DiKSFeqyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520289;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=sGwe8e8FUxQr8uw+vUtq+/rsVMC9Qm2EK47N6JEbGds=;
	b=4+iTxlISJxI6eajUnDV2igcTbKgBff6MqlDGlx6lqOaOgswB59PthmRROIlQjLb9MU6t
	 J8AUXy6+hH8CC/0LmvfwgnUCgCq1rwQgKdyNisj19JEOvRS9c3O1cEOWqsiH6jRw0Ffwa
	 w0MW8i2nHlo9XxmDVWnPElhMwglr1DgeJIT5VrftvKebnyZCUYLDkzxOzPXMJyuYLqYVF
	 8kQYSRhHvggoJT9Sl/F8M6V0qsfmAdxJivFewJll8HSkyjNOUMmbiufJULbiZ+MKEsAp9
	 fOVrlO+0XN+5DS0JNJx0oveeVXS2m45IQGWz48Muws1Z1KRyvehnpP44syHMBH+HoTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=lKy5sriI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3C0AFBTU;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E70606A336
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 11:38:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E70606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=lKy5sriI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3C0AFBTU
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 59F76EC0D10
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:38:08 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 06:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795520288;
	 x=1795606688; bh=sGwe8e8FUxQr8uw+vUtq+/rsVMC9Qm2EK47N6JEbGds=; b=
	lKy5sriIN8ugM9hfWyLThvU90RIKoyM9YuI8cizA/5piK1cCZ0McawrCDhYXq4xm
	nQB1sl3pkQfkRAqb8KdlOBa/g8xRFWmBa2ZZ+Fq1Hrd37/BDiFdnO/RByP5Ywusb
	u4lfkdBwP2KGStlEpSWJn0XWBtq27PWKt0HYLKrNTogsQ9IvOXmyTeqs2+bYrG21
	V8rxABXLWZJC5to1KpJSJWe0jdciQ86leojqwCwGJB6AK5U6QGVFwMOTYXndIk2q
	/Tu1YRyofceUNm0A6sBlYAPll285N0Djd0UVV8cuY0ED/JfZZWhmg2ZfxWylf70I
	0NOWumobAVf/Rde8LEOI6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795520288; x=
	1795606688; bh=sGwe8e8FUxQr8uw+vUtq+/rsVMC9Qm2EK47N6JEbGds=; b=3
	C0AFBTUKt7Ierdk3ykDK8BBOpqbBNN8uHO4Avvd8nLJ2suOEhJU6QcrpTCTA9/QY
	Vazw/tjMUzjZNt+XzomTEvZ59ttDfr0pp0eRRymoAG6IuS01/5nIWoVbH2OjfTmB
	323eQksWJh/6uJ2FSJN/DkEJ8ft5JIcI9tqMoRDeHWw5DvY24sfvJPF1s7nvaUTj
	41rfnd9bBESiUd+IrRGwpK8H7uUXOCy51jXBc840yPMb4jx6eqGbxtdJklC1cCHF
	H2icHKyTUmkOIQfMUS3G/53dwmqRLEJLeKQVavOsVtwFt9RCr+7z/TKJlGBB+/OH
	EkFC5HOgUHvmLnjGAu2zA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795520288; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:jSJbXuZx3GgwBYE4ufTzFQMEcY2VZkxzJvt+0n1JJ2FcLoW
	T5TunhnmHmWIKOSqw0o0HHGKCUa99jIJYJGKvSHdkkfn3kWN55ja87rae1V9MANd
	jZbTrSF+QEK4tu4Zl5IhX+YremxffbRmmf7JbGs5kmhHk91UpuhpmQoR/gZbK+N4
	NnyM68jkNKJbQbLvmhh9SEiSf9W0CLJARzZcTo/I0WR8zz3h88eIi7HHrfel7C8Q
	fApVo8oc7hIFvndsgpU66ZHs8gfhTlPU9PNuUCb2pX63o/0V1Dd96DleXXN01C5E
	0gj8fVah1QW6zPokZiWGKUi7qs8lXfpXSEUWhPA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:/NsjSQMo97KgSUoZkmO8Ff6/jeGWot1Qv8joY0J1+Rs=:iyKFpGIguoKWqw2/FsAhpYq4Ed/eOVrdCvrfk2ffGw8=;
X-ME-Sender: <xms:H3cFa_bGjIvXkqxHmn5S_yw7x2d9RLyVtf2H2uyeLrGvhBd6JWpFOg>
    <xme:H3cFawFW1jcsXubqOlsZFE_uhdOlklom0p-HKufXyCaYkwnkKmRkMiQDccv7PNmgE
    1zJLYyyZ0ckG9of-zeLDNET08n5EhhzIrVKm3UnKSHz1WMkkXsLM9fM>
X-ME-Received: <xmr:H3cFa1Y1cnvf_l_epmSvPKAypf_lfVtlirCjuypwL6kufVHtu5nk3WujhYVFz2rjBMfV-tx3bGobvJlGGqKC4Ss_6c_hIMg6qIqODg>
X-ME-Proxy-Cause: dmFkZTGctf3gzU+lBKfRkh/vM8zWzYYmVuBj/UZNpCMWKh18Yzo83EtKThELA8xj3+/5gc
    KAFRKQbRi/spGa7x/x0PtFvR3s3MeOG8abGe1SVXb4GI7H54VaWNe1QTDaYqsS9cBjQ7kx
    TnKm6qFXuLQqQdRga6xrpodmOuP5vVDS0pvGm7BkmoQcXqPO/whf6Qbi9f58lfjkJ0+7sK
    etTJI8ScvW1sH+i2tBI9z/QT1r0I6mRth2tCsO3GHEz0Q/jV/f26Xp94UNBPB5NZuXm/S+
    kUcJN1Kpnisp2nWwnhA32Dk/0P1T5D2Qo7CgL8JQK4vRlyApf6L1eMjSsxaCQKJ2k1O3RH
    T/1/1m04lWuDmYlvpoBrffxw4Vnj9bYUeg92Ys6LoL8tgfCZmNi7zCADLQ3qgkW5OYAoKV
    gomNZ7x4uA5GCqq9VptqzP+jatC2ndp+HBXMjaYLlIMkKSA55zx7eRWdQbFywfM4zguFT5
    fdg8fobZ1Q5aSKoad1yOnzXotQEC/LEPwWXE53/ZWK8jxiV47I94Elh4fUtmdEYIaPcOhx
    QWOboHScr7Wh45+KbpPU9jXY1FY2qvXnDPinTt8QNa9Zvw8QkPMIfjvyudDg4ziynDIh5j
    lV52BlIjbLNML3WV6irkA7ae0w0SUZOEykuJQLf/WvcxUQajn2REAtATKtzw
X-ME-Proxy: <xmx:H3cFa1fvQkR64r154cDMRI3l280x1jgYLev-KNgvTESG8zmnc--F2Q>
    <xmx:H3cFaxBvKE6JimGJ6RKkboi3Fp9Gla0kpxSC1WaFu6y_IUoqoRPy-A>
    <xmx:H3cFa_Yoov6Rpx2gPaH7hHHe09ErX5Uvzu-GMtSvtWwWA2LyDBMnbA>
    <xmx:H3cFa557eImkTIvY6Nm1rXCc_rIa2-7CnABAAlNSQhMMQ5ykEaA0Pw>
    <xmx:IHcFaxIS3erLvYjcakulMcXposTA36r_zEA2b7_OW0ZmGzwG5gJyuTeo>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 06:38:06 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Tue, 24 Nov 2026 12:37:44 +0100
Subject: [PATCH v2 2/5] drm/gem/shmem: Initialize private objects via
 drm_gem_shmem_init() too
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
Message-Id: <20261124-rust-drm-gem-shmem-imported-sgt-v2-2-000f7a9ccb8d@jannau.net>
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
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4309; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=iyKFpGIguoKWqw2/FsAhpYq4Ed/eOVrdCvrfk2ffGw8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmzWcjG5fTHtVYVzl7LeKhTrkj7I6ZqpntnKyLV25ewsw
 +COr/s6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATER9ISPD8VkZrtotynO/V35c
 3Hpw+oI5h/Peux1qe+TSLsG8PjZ9GyPDep1m03O9v78L1AZbl0xbpj4hecdBDkWWL+tFtG5vYRN
 gBAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Rust drivers need to initialize private gem objects when importing
DMA-bufs. As with regular objects the ideal way is to allocate the
object in Rust and initialize it via the DRM gem shmem helper. Expose
the `private` to the exported drm_gem_shmem_init() function.

Link: https://lore.kernel.org/rust-for-linux/20261118114102.490384-1-aliceryhl@google.com/ [1]
Suggested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 34 +++++++++++++++-------------------
 include/drm/drm_gem_shmem_helper.h     |  3 ++-
 rust/kernel/drm/gem/shmem.rs           |  4 +++-
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a30de..7042d59ef86d 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -51,8 +51,20 @@ static const struct drm_gem_object_funcs drm_gem_shmem_funcs = {
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
-static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem,
-				size_t size, bool private)
+/**
+ * drm_gem_shmem_init - Initialize an allocated object.
+ * @dev: DRM device
+ * @shmem: shmem GEM object to initialize
+ * @size: Buffer size in bytes
+ * @private: Object w/o GEM backing store if true, for example dma-buf
+ *
+ * This function initializes an allocated shmem GEM object.
+ *
+ * Returns:
+ * 0 on success, or a negative error code on failure.
+ */
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem,
+		       size_t size, bool private)
 {
 	struct drm_gem_object *obj = &shmem->base;
 	int ret = 0;
@@ -94,22 +106,6 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
 	drm_gem_object_release(obj);
 	return ret;
 }
-
-/**
- * drm_gem_shmem_init - Initialize an allocated object.
- * @dev: DRM device
- * @shmem: shmem GEM object to initialize
- * @size: Buffer size in bytes
- *
- * This function initializes an allocated shmem GEM object.
- *
- * Returns:
- * 0 on success, or a negative error code on failure.
- */
-int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size)
-{
-	return __drm_gem_shmem_init(dev, shmem, size, false);
-}
 EXPORT_SYMBOL_GPL(drm_gem_shmem_init);
 
 static struct drm_gem_shmem_object *
@@ -133,7 +129,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 		obj = &shmem->base;
 	}
 
-	ret = __drm_gem_shmem_init(dev, shmem, size, private);
+	ret = drm_gem_shmem_init(dev, shmem, size, private);
 	if (ret) {
 		kfree(obj);
 		return ERR_PTR(ret);
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index bcbb92f3fe9b..60a09a3289a7 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -107,7 +107,8 @@ struct drm_gem_shmem_object {
 #define to_drm_gem_shmem_obj(obj) \
 	container_of(obj, struct drm_gem_shmem_object, base)
 
-int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem, size_t size);
+int drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_object *shmem,
+		       size_t size, bool private);
 struct drm_gem_shmem_object *drm_gem_shmem_create(struct drm_device *dev, size_t size);
 void drm_gem_shmem_release(struct drm_gem_shmem_object *shmem);
 void drm_gem_shmem_free(struct drm_gem_shmem_object *shmem);
diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 78a152f0f30c..264ab188f77d 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -320,7 +320,9 @@ pub fn new(
         unsafe { (*new.as_raw()).funcs = &Self::VTABLE };
 
         // SAFETY: The arguments are all valid via the type invariants.
-        to_result(unsafe { bindings::drm_gem_shmem_init(dev.as_raw(), new.as_raw_shmem(), size) })?;
+        to_result(unsafe {
+            bindings::drm_gem_shmem_init(dev.as_raw(), new.as_raw_shmem(), size, false)
+        })?;
 
         // SAFETY: We never move out of `self`.
         let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });

-- 
2.56.1

