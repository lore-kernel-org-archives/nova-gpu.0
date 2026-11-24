Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795520294;
	b=4FjQYWamLtClz0z+i0X3qWEs+O9WjuW0yFz5NzcU6U6UKRBMmbP/x/c4EBfLQpUh9PZG
	 2Rf3oXNK2mvFobbj6ZG9zdHGRiKwbAA92Rbl76xmG5euFFKxN9nXAXI7Kz1KSktK2i9j1
	 zyu0Nud4kdKYuLu3ChWAohnU/Y8LmtO5adkStmjhn+W8JjlPT/twNmn8OEUQX1j8kWAoe
	 1hdCje4OFUylXVqL5W5H/J+/QaMj3GWLE8f93N4H7l+DHR1fTMPN8ETn4qw2eXsL0+Ezd
	 sTrJNDfPCMYai6Kc1ICfIoI0rx2OwiynT/4xqEIrQXMQR3ZyfG8ouzgsk+CFdqwLq/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795520294;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=+lL4d61D6shP41S9lLd9QJ1OHaKc501D6r5BoxG5e2A=;
	b=qq1du6T8f1V4CyXkNU/aUVK45Y0enwtu7SaKku7dXuTZQ/V5lOHWAx+RNpRvHSlwbTim
	 QkHegpI0sVGLhRXa0GnLKnQrPV5rc/7VZ6zoLeq4M+VxzmwXIhDRiOLuMhAvsGOI9bLB/
	 gticvV9UuO/AAiHk+JdGUuAdcvPzbfoOwyIcG9j4wMwuR0K04J1VU99X4VpdpDISdWwrC
	 ICCLL8haKeXzO2u5vLOJwJsi/qZsCWJihnNT+gHcY2kPHuHoIEGE6Mmlk8RaL/VIMW+/x
	 KkeYUMDNqLDvE8DZRSJUYSTmYqot4hY134uG5Fz/wgq4uKPkTlFFbW/FOt7yH59R9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=2JJxnCHc;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E2RYvX85;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2997606A330
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 11:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2997606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=2JJxnCHc;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=E2RYvX85
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 038C014002B2
	for <nova-gpu@lists.linux.dev>; Tue, 24 Nov 2026 06:38:13 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 06:38:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795520292;
	 x=1795606692; bh=+lL4d61D6shP41S9lLd9QJ1OHaKc501D6r5BoxG5e2A=; b=
	2JJxnCHc2yglb6Jx+9eQd7K5Z5ZS3oqY9gqknNZHKMSoK4Hju7dQnZtXz4ebHB0P
	vWoPQTH3Cs0tEAxNxBaap1uDfP6z+VQWBIphRBT753De/GcizzCdHT3mgpzCsv0U
	eNNpGe0s2dXr6ObnJhoFP6taSk968lXDE6IunlBYXbgItFh1a9Faq3oEkcmbcLQ5
	X3waZNJ5JbUwbCD7xxofiOovvasbWAH1e+RygGSo6eBVr1hot3niLSGK1WuVxQjd
	sx0GdHW9c/Wnd7x5QUugeKZ2uwWZU4+LCBfyiyF8QTcRsLmTK8b32OE5/7QdIgXj
	KfnzHo2mwqp0GyuNYSgr8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795520292; x=
	1795606692; bh=+lL4d61D6shP41S9lLd9QJ1OHaKc501D6r5BoxG5e2A=; b=E
	2RYvX85ZypQDpeDvoj46OxZoiZdKF5b4rBx1e35L0jg45xgXqrIjs5MAynT0fhZS
	HoaORtGUgI2fpKJwm015ZUPrzJbldq/qSut1DwI5ynCAYOZcGAJZN5TmttukVxcy
	mqK80RPurqjWAE1mxypgBn5g4hBGnqZzyZO0InICDwFrOVfaKnl5Ycqjc2u2kVuy
	4+KwMfjJT1SE+fO6Ozn9jr10wbCAUfJ0FB37g0ubvYfFkw7WLXym00lJabNECQbQ
	G9LogMI0lEatyviCGNrYUIvG2FieEsCj+soBsiHePgWHGiu06P/PejdzM/Tjfnwe
	7ru+fJXnhWQYnHKixzn/w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795520292; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:X5OfsTwPhKhZRRBm3EaYS0xMAYfyODkYyX0rNQwRmleJKr3
	yS1s0BKa3cHHgQxJI5BLeJCOt5BFyut+eSE1VJHO1KxHGpNdZNBT5D/XEqp+3nis
	8j9Xy6+DyKrsgj4L65RyyUkDW585ghKzzuNxWmeLZl1jfgrCoXIxjhBfeXHNCZEY
	lD61CbuthGK1FhTjtxpZHgooE07yuJBYieBzHiTYZCrXgQSZhlLZ8+i+daK7M7bv
	uZ+C1ki/Topsg91r+8P3GU4AdA740I/BvqZUUH72KXOoCAui4zXgprU8rnb9jLyC
	ravFbXusqb6EWBI/bipS2kMrwp1DnKWJVoxiiRA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8WwSJPZxIQeJHA2XzOcJrogyCf68U48D7rOQWKRu7nE=:5U5Tnsw3liHMJ0zrTfjY0W8H/iQ6ERtIVCtuxA3DvTE=;
X-ME-Sender: <xms:JHcFa-XWasy86-0g62BfxEMARAGUmBqb1By80Mr9RtWVemBl8gAVUg>
    <xme:JHcFa8TYB0tqCnhPaLEBAb1K-XZDK74eEUM75z6SGkHuOjmj5WMdT4tDhYN2w1tHQ
    NNYuYuoTn2bIae-HlyxeR1ZPAV_LJBLlF2uSd1WCLw8s9IJvqgtK4U>
X-ME-Received: <xmr:JHcFa10Uxsh7qD7qPDEC1JC9D0Qx1MW3Vdv3TgCilHYK-KLhoLiibBPLfuWDSABhnR1ls2BMi7rBi9acuZLoJWRxTP6arZD8907JSg>
X-ME-Proxy-Cause: dmFkZTGdkq8vWbiToMo12qqRjjdYnFnxP/a2h9GMBTD2JIa2wOlyCEauAPfo/pp0WCLHGc
    3DwiEEcACyeaGzWKy6PF4b0OdKvR4z7u9EtMaZWFINXalxQx8p6kWrUs7paR1/0TX79wEY
    9A75VS2j8B46+44fHZz2qW2jJ3/POd7QYsT27xz9zR/+1cZIL8nEnwWrSEFX1OObiWZVFi
    mUbylfGl1ihH8q+eLNAMDeuRJSAU9hiP1tmxgqcAbgzpIJww6eaDUfGEQ4JJOTgWRgGWmP
    0654JQo2pQ0TNrTjumwhvU2jLKiwUFfDD1qLZ43kwsau3jZAo7YAzOljTqSiltjpoXLSaj
    1ELzycfz0Jj2u4NX7zBvDZlFxMVj9XxtWoKyVXyIYCOyQE4AvATt+Q5sLYjVIdPbKZ4oid
    7edzYQhVRXKcC0CKUmTuwlIJB4ztegbwozpOdKQNf43+xsAI5X7LfZ9JkaeMukQmS3Ze18
    QvOQiQUIzjl0p+K3bS5BiU2sQ39qgFkRyg9Yk5FbPfa6L0K4iUMf2upMR7fHi8TbVE01/1
    h45abVDrhr29gKPdSyjyXqQQ1XmAPrxuNMEyfGBms4mifb/mxO2jkAc+LNao+8uBJqucgk
    VPK8MKZyT+Dnb3Oc7C1fwqqp1qQS/pfSMAVL7QcpgA0c6KUliK6H/TqZ+/lw
X-ME-Proxy: <xmx:JHcFa1IvzTdihg0XJCSL_6xNjPnwIm6E7mpkjsLMvoNHfcAcuF9CJQ>
    <xmx:JHcFa-8u5dp4vbBM1uXliHN-vdEXrgEh6YK0gNtU_HJRA46BOzJt8w>
    <xmx:JHcFa-k09sLgV7GjRQGCJ-J8o7p6H3LrfRGGbTCauUwReMZ1rIHxzg>
    <xmx:JHcFaxXkAWLILFIkCWHSzJdVVfEMVfyVbIiQwC7yJBgyBCVP2_L7Zw>
    <xmx:JHcFa9TYNC_ueasHVXDua-hKYr-kXpESaau1RilIAg6vozxrX-iCsWT3>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 06:38:12 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Tue, 24 Nov 2026 12:37:46 +0100
Subject: [PATCH v2 4/5] rust: drm: gem: add an is_imported() accessor
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
Message-Id: <20261124-rust-drm-gem-shmem-imported-sgt-v2-4-000f7a9ccb8d@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1760; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=icPPHFbNhFOERS5bIQtZXE/Px9et/H5don05Ya3MrEU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmzWcvG+/ekyK2Un9pvuat8rurb6zE5GqwiezU/1g96ez
 OA3cavuKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJEn1xkZnpRPnbLo09/5r46U
 6DTcal6/gfOcbNjL/MRCz9zsggAlPYb/dUmVnapbHi6ZpJ24WSVQz2/C74eSxg9ij/RHnWJzqfr
 BCwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Sami Tolvanen <samitolvanen@google.com>

Drivers need to check whether a GEM object is PRIME-imported.

Add BaseObject::is_imported(), wrapping drm_gem_is_imported() through a
C helper shim.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 rust/helpers/drm.c         | 6 ++++++
 rust/kernel/drm/gem/mod.rs | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/rust/helpers/drm.c b/rust/helpers/drm.c
index 65f3f22b0e1d..8cf3ca7aeeb2 100644
--- a/rust/helpers/drm.c
+++ b/rust/helpers/drm.c
@@ -16,6 +16,12 @@ __rust_helper void rust_helper_drm_gem_object_put(struct drm_gem_object *obj)
 	drm_gem_object_put(obj);
 }
 
+__rust_helper bool
+rust_helper_drm_gem_is_imported(const struct drm_gem_object *obj)
+{
+	return drm_gem_is_imported(obj);
+}
+
 __rust_helper __u64
 rust_helper_drm_vma_node_offset_addr(struct drm_vma_offset_node *node)
 {
diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index e01b8311dd89..8cedfabe712b 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -187,6 +187,14 @@ fn size(&self) -> usize {
         unsafe { (*self.as_raw()).size }
     }
 
+    /// Returns whether the object's backing buffer is imported from another
+    /// driver.
+    #[inline]
+    fn is_imported(&self) -> bool {
+        // SAFETY: `self.as_raw()` is guaranteed to be a pointer to a valid `struct drm_gem_object`.
+        unsafe { bindings::drm_gem_is_imported(self.as_raw()) }
+    }
+
     /// Creates a new handle for the object associated with a given `File`
     /// (or returns an existing one).
     fn create_handle<D, F>(&self, file: &drm::File<F>) -> Result<u32>

-- 
2.56.1

