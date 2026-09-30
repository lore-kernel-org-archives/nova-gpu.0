Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C4EEC3
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727948; cv=none; b=RCfQ4ZPrISyC5nmqJcg63PRBKEY64IiCNTZRRDU5qvYIRaZ4NP+Frw3hVJRo/FHQt6N4VYsSxIj+lP5MZjlbKCVKkPY0SclE/C95o7dXt6FhIFpS6U8fw3uXj1Fh6zORvh7+DLMWE0CAzeT0mGmSeXzPXaBaqmZQS2DfFHUp/nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727948; c=relaxed/simple;
	bh=AjG8qdrWQKhuV8X1ud75VpYoyxcVO+vwXVUlFMVhmoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bMblkatht0dqclAqLpY2Uf4bKwXyagwX/9TR8Xz076QoIpD+tXQA3793+DFC4DT8MErIUk5E3T/IBkBKoHcFLBDgbNELfZkx2gaxpwCUCXEMc9pR6iXapWMhR7qjJWbmraC/u4tTSX7HRb0ZNdMtpQYS0uYQIcSDB55gTjS7zvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kpI67R2m; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kpI67R2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LX
	uktk+kS7IPDoasdu5i3EjBpI/lpCRd4opk2hlcrzw=; b=kpI67R2mpC3/42e62l
	5mjGoLiDIXkn16IHWuYNTiE0umQW2NyUzbKSzod7pPwZDeLHwOrWrkNtFwImCUPn
	/hEhjlyCkys9Wrpr5J3gqZId/N7jGbxY5f40yEKb1kFJ8jQggrS9Fx5JiiurgWV6
	69Hk+p2wUGfQyI+pEVrjDvn6k=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S6;
	Wed, 30 Sep 2026 08:24:49 +0800 (CST)
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
Subject: [PATCH v7 04/11] rust: macros: add private doctests for `Into` derive macro
Date: Wed, 30 Sep 2026 08:24:29 +0800
Message-ID: <20260930002436.21395-5-chaoji_xinren@163.com>
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
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S6
X-Coremail-Antispam: 1Uf129KBjvJXoW3uw4UGFW5JF17uFWfGF18uFg_yoWDAr13pr
	4j93yIq348JrZ3Aa4UG39rWw12gFs3Xas8ZFZrJw1IyFy2qFZruw4UWry7JFyFyr1UZry2
	qFWjyryDW340y37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zE3xhQUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4RGTD2q8VtGlyQAA3R

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `Into` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 436 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 436 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 21d79bca16a0..31cdf84082e7 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -588,3 +588,439 @@ fn is_valid_primitive(ident: &Ident) -> bool {
             | "isize"
     )
 }
+
+mod derive_into_tests {
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u8)]
+    /// enum Foo {
+    ///     // Works with const expressions.
+    ///     A = add(0, 0),
+    ///     B = 2_isize.pow(1) - 1,
+    /// }
+    ///
+    /// const fn add(a: isize, b: isize) -> isize {
+    ///     a + b
+    /// }
+    ///
+    /// assert_eq!(0_u8, Foo::A.into());
+    /// assert_eq!(1_u8, Foo::B.into());
+    /// ```
+    mod works_with_const_expr {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(false, Foo::A.into());
+    /// assert_eq!(true, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `bool`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(bool)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `bool`.
+    ///     A = 2,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_bool {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     A = -1 << 6,      // The minimum value of `Bounded<i8, 7>`.
+    ///     B = (1 << 6) - 1, // The maximum value of `Bounded<i8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ -1_i8 << 6 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 6` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = 1 << 6,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `(-1 << 6) - 1` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = (-1 << 6) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    ///     B,      // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<i8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ -1_i8 }>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 1>::new::<{ 0_i8 } >(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `1` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `-2` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = -2,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = i32::MIN as i64,
+    ///     B = i32::MAX as i64,
+    /// }
+    ///
+    /// let foo_a: Bounded<i32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<i32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<i32, 32>::new::<{ i32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `1 << 31` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = 1 << 31,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `(-1 << 31) - 1` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = (-1 << 31) - 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_bounded {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     A,                // The minimum value of `Bounded<u8, 7>`.
+    ///     B = (1 << 7) - 1, // The maximum value of `Bounded<u8, 7>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 7` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = 1 << 7,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    ///     B, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// let foo_a: Bounded<u8, 1> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 1> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 0 }>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 1>::new::<{ 1 }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = 2,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::Into,
+    ///     num::Bounded, //
+    /// };
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     A = u32::MIN as u64,
+    ///     B = u32::MAX as u64,
+    /// }
+    ///
+    /// let foo_a: Bounded<u32, 32> = Foo::A.into();
+    /// let foo_b: Bounded<u32, 32> = Foo::B.into();
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MIN }>(), foo_a);
+    /// assert_eq!(Bounded::<u32, 32>::new::<{ u32::MAX }>(), foo_b);
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `1 << 32` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = 1 << 32,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_bounded {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = isize::MIN,
+    ///     B = isize::MAX,
+    /// }
+    ///
+    /// assert_eq!(isize::MIN, Foo::A.into());
+    /// assert_eq!(isize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(isize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = (isize::MAX as usize) + 1
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_int {}
+
+    /// ```
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = usize::MIN,
+    ///     B = usize::MAX,
+    /// }
+    ///
+    /// assert_eq!(usize::MIN, Foo::A.into());
+    /// assert_eq!(usize::MAX, Foo::B.into());
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(usize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_int {}
+
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(Bounded<i8, 7>, i8, i16, i32, i64)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::Into;
+    ///
+    /// #[derive(Into)]
+    /// #[into(i8, i16, i32, i64, Bounded<i8, 7>)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    mod any_into_target_overflow_is_rejected {}
+}
-- 
2.50.1 (Apple Git-155)

