Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA19125A0
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727932; cv=none; b=t0CfU+tHnMX5A0NNbcE+5K1wIu4UgyavonfQ4egU3E2w32KX1DG0+YLP7bRVpKzXWAniH1aG5EkZyku38QcQMtrVVzR8ZGoQLtGvoKhuqXSJPeuRBuQQAiCRlxq6vXdr4T8SJdAz9Sink/3z0qIJB5beTuP4x5PllYBFSTWsbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727932; c=relaxed/simple;
	bh=RKChD4B6Oe+HUsoUz0tam54PYPqsINXNCyEULmBfqJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EJPoPaNoHdGRp7lTiN/AYPAIp7a6OnnqlAikLpu0Xf7oSILgZfmqr51YGvMhKRsYnVlRAfMFd+G6UYtbjRqCBCsdoROcNDCF+ya2wWjKSV7PBy2PVvh2xlrplDbEvE/IJ05/oekq//PxLtRa2f5jKkUnxbsX0lhAEJICaOE9Y9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=VObfXnLs; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="VObfXnLs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Xm
	IjwWkfyV3nQktprLLb1SMxMbkUSrDRoe2LC20Hng4=; b=VObfXnLslOGVcRXhqy
	9hmg3ikodnB20JzkG+TzEK6lB412Vu/StTpEPbQx1ePzmJgMw8NYCsS4ZW6E1opR
	v8D310CBuh0YShbnWbbgaOB5VGY8Bz+rCHYcKmvuERG532eQr1rt/VAfS9V99Dmf
	h3DINdqVKTsy/Ki7g433AuBUQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S8;
	Wed, 30 Sep 2026 08:24:53 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: Jesung Yang <y.j3ms.n@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	work@onurozkan.dev,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Charalampos Mitrodimas <charmitro@posteo.net>,
	shivamklr@cock.li,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v7 06/11] rust: macros: exercise the intended conversion doctest failures
Date: Wed, 30 Sep 2026 08:24:31 +0800
Message-ID: <20260930002436.21395-7-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260930002436.21395-1-chaoji_xinren@163.com>
References: <20260930002436.21395-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF48Kw48XF13Ar17Cr1DGFg_yoW5WFykpa
	yqyayxK3yxGas3Gw4IkFyjqw429ryfWa98XrW8JwnF9w43GF4fur45Kr45GrnYkF18ZF13
	Ka4jyr1DAFn2va7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEVc_sUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-hWUEGq8VtWD7QAA3U

Use unit-only enums in the repr(C) compile-fail examples so they
exercise the representation check rather than rejecting a struct. Fix
the missing semicolon incidentally hidden by the TryFrom negative test,
and correct the convert helper documentation.

Give the negative Bounded<u32, 32> examples a signed enum representation
so that -1 is a valid discriminant and the conversion overflow assertion
is what rejects it.

Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>

Link: https://lore.kernel.org/rust-for-linux/m2qzr81jrd.fsf@ip-192-168-1-196.ap-southeast-1.compute.internal/
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs |  4 ++--
 rust/macros/lib.rs     | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index c07870914242..78efbc7b99d7 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -893,7 +893,7 @@ mod overflow_assert_works_on_signed_bounded {}
     ///
     /// #[derive(Into)]
     /// #[into(Bounded<u32, 32>)]
-    /// #[repr(u64)]
+    /// #[repr(i64)]
     /// enum Foo {
     ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
     ///     A = -1,
@@ -1459,7 +1459,7 @@ mod overflow_assert_works_on_signed_bounded {}
     ///
     /// #[derive(TryFrom)]
     /// #[try_from(Bounded<u32, 32>)]
-    /// #[repr(u64)]
+    /// #[repr(i64)]
     /// enum Foo {
     ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
     ///     A = -1,
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index cc6a96516c93..4d420d34ed6b 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -656,7 +656,7 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 ///
 /// ## With `#[convert(...)]`
 ///
-/// The macro implements `From<Foo>` for each `T` specified in `#[into(...)]`,
+/// The macro implements `From<Foo>` for each `T` specified in `#[convert(...)]`,
 /// which always overrides `#[repr(...)]`. `#[convert(...)]` is useful when the same type
 /// needs to be specified in both `#[into(...)]` and `#[try_from(...)]`:
 ///
@@ -734,7 +734,10 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// // `repr(C)` enums are not allowed.
 /// #[derive(Into)]
 /// #[repr(C)]
-/// struct Foo(u8);
+/// enum Foo {
+///     A,
+///     B,
+/// }
 /// ```
 #[proc_macro_derive(Into, attributes(into, convert))]
 pub fn derive_into(input: TokenStream) -> TokenStream {
@@ -947,7 +950,10 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// // `repr(C)` enums are not allowed.
 /// #[derive(TryFrom)]
 /// #[repr(C)]
-/// struct Foo(u8)
+/// enum Foo {
+///     A,
+///     B,
+/// }
 /// ```
 #[proc_macro_derive(TryFrom, attributes(try_from, convert))]
 pub fn derive_try_from(input: TokenStream) -> TokenStream {
-- 
2.50.1 (Apple Git-155)

