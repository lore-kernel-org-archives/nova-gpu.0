Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41C4547060
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727951; cv=none; b=VD0AW9I/GhKCGFhAiwSszd/MSZnJcbsIsWvwSvIj04JzZTuZwZ9NxVN8vWEGgRRA2BwnGCaq6mVglEdoJcZ4P54qayzFt48CjNC4jSBdQ6zmzPCi3A6/I/qwTrFXO49to//y9T57bLqKlTioL5dWPO8BwtCxhenWu1VaS94krbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727951; c=relaxed/simple;
	bh=5Z+cKfWOg27vc3pF+xn1VjIF0FxWfn67qnvqpPUzs7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7teQKPOy6xr2kXzzHbyfvNoTYWHFt+Dm0nLpiuXx+qLf8OWi1gF5JjX7GyA2WBZuTVwLM9Hfu5Nn0BQxl9SjYvnjpSaRaxjaKFsR7w4bK5OgXYZ+xXAsWz1lvw0BEv9HVcb5xphiJPXilYCwPUEUhtOkTB2AcqppnVy1bLyXJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PGbKaftc; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PGbKaftc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8v
	5Xx2ZMVIzrvFF6pbH9IxbzeBKyU5BiLFa43slIhYo=; b=PGbKaftc8dXu16O8Ui
	RaPwNHbljcSzRgOCmamt/HYTQCmh8LpXxdECqJcJ1caTH3YstXqd73nyLg782Id3
	BqaKQUQHUQABUZYPqMhGXuWkj2pbVw+TKLqFdi8xdedCBsQWy5o/zZdYgkBTAEDp
	0TZWgbS4CPQI4ZU4dQRtyE5FI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S7;
	Wed, 30 Sep 2026 08:24:51 +0800 (CST)
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
Subject: [PATCH v7 05/11] rust: macros: add private doctests for `TryFrom` derive macro
Date: Wed, 30 Sep 2026 08:24:30 +0800
Message-ID: <20260930002436.21395-6-chaoji_xinren@163.com>
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
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S7
X-Coremail-Antispam: 1Uf129KBjvAXoW3Zr4DAFW7urWDCw15JrW8WFg_yoW8WF4kWo
	W8Ja1rG3s8AFnY9FnrJrnYyrZ5A3yS9r9IqryfXr1kCa43J3ySvFW8Jr1UCr1Yqa17JF13
	J3yfJF4jyrs8Jwn8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RIAp0DUUUU
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4hOTD2q8VtODiQAA30

From: Jesung Yang <y.j3ms.n@gmail.com>

Add internal doctests to verify the `TryFrom` derive macro's logic. This
ensures comprehensive testing while keeping the public-facing
documentation compact and readable.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 578 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 578 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 31cdf84082e7..c07870914242 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -1024,3 +1024,581 @@ mod overflow_assert_works_on_unsigned_int {}
     /// ```
     mod any_into_target_overflow_is_rejected {}
 }
+
+mod derive_try_from_tests {
+    /// ```
+    /// use kernel::{
+    ///     macros::{
+    ///         Into,
+    ///         TryFrom, //
+    ///     },
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, Into, PartialEq, TryFrom)]
+    /// #[convert(bool, Bounded<i8, 7>, Bounded<u8, 7>, i8, i16, i32, i64, i128, isize, u8, u16, u32, u64, u128, usize)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(false, Foo::A.into());
+    /// assert_eq!(true, Foo::B.into());
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+    ///
+    /// let foo_a: Bounded<i8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<i8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<i8, 7>::new::<0>(), foo_a);
+    /// assert_eq!(Bounded::<i8, 7>::new::<1>(), foo_b);
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 7>::new::<0>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 7>::new::<1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<-1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<2>()));
+    ///
+    /// let foo_a: Bounded<u8, 7> = Foo::A.into();
+    /// let foo_b: Bounded<u8, 7> = Foo::B.into();
+    /// assert_eq!(Bounded::<u8, 7>::new::<0>(), foo_a);
+    /// assert_eq!(Bounded::<u8, 7>::new::<1>(), foo_b);
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 7>::new::<0>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 7>::new::<1>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<2>()));
+    ///
+    /// macro_rules! gen_signed_tests {
+    ///     ($($type:ty),*) => {
+    ///         $(
+    ///             assert_eq!(0 as $type, Foo::A.into());
+    ///             assert_eq!(1 as $type, Foo::B.into());
+    ///             assert_eq!(Ok(Foo::A), Foo::try_from(0 as $type));
+    ///             assert_eq!(Ok(Foo::B), Foo::try_from(1 as $type));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((0 as $type) - 1));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((1 as $type) + 1));
+    ///         )*
+    ///     };
+    /// }
+    /// macro_rules! gen_unsigned_tests {
+    ///     ($($type:ty),*) => {
+    ///         $(
+    ///             assert_eq!(0 as $type, Foo::A.into());
+    ///             assert_eq!(1 as $type, Foo::B.into());
+    ///             assert_eq!(Ok(Foo::A), Foo::try_from(0 as $type));
+    ///             assert_eq!(Ok(Foo::B), Foo::try_from(1 as $type));
+    ///             assert_eq!(Err(EINVAL), Foo::try_from((1 as $type) + 1));
+    ///         )*
+    ///     };
+    /// }
+    /// gen_signed_tests!(i8, i16, i32, i64, i128, isize);
+    /// gen_unsigned_tests!(u8, u16, u32, u64, u128, usize);
+    /// ```
+    mod works_with_derive_into {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(u8)]
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
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(0_u8));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(1_u8));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(2_u8));
+    /// ```
+    mod works_with_const_expr {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     A,
+    ///     B,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Bar {
+    ///     A,
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(false));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(true));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Baz {
+    ///     A = 1,
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(false));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(true));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `bool`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(bool)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `bool`.
+    ///     A = 2,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_bool {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     A = -1 << 6,      // The minimum value of `Bounded<i8, 7>`.
+    ///     B = (1 << 6) - 1, // The maximum value of `Bounded<i8, 7>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 7>::new::<{ -1_i8 << 6 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<{ (-1_i8 << 6) + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i8, 7>::new::<{ (1_i8 << 6) - 2 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 6` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = 1 << 6,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>)]
+    /// enum Foo {
+    ///     // `(-1 << 6) - 1` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = (-1 << 6) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    ///     B,      // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Bar {
+    ///     A = -1, // The minimum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Baz {
+    ///     A, // The maximum value of `Bounded<i8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(Bounded::<i8, 1>::new::<{ -1_i8 }>()));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(Bounded::<i8, 1>::new::<{ 0_i8 } >()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `1` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 1>)]
+    /// enum Foo {
+    ///     // `-2` cannot be represented with `Bounded<i8, 1>`.
+    ///     A = -2,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = i32::MIN as i64,
+    ///     B = i32::MAX as i64,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MIN }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MAX }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MIN + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<i32, 32>::new::<{ i32::MAX - 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     // `1 << 31` cannot be represented with `Bounded<i32, 32>`.
+    ///     A = 1 << 31,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i32, 32>)]
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
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     A,                // The minimum value of `Bounded<u8, 7>`.
+    ///     B = (1 << 7) - 1, // The maximum value of `Bounded<u8, 7>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 7>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<{ 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u8, 7>::new::<{ (1_u8 << 7) - 2 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `1 << 7` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = 1 << 7,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 7>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 7>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    ///     B, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Bar {
+    ///     A, // The minimum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Ok(Bar::A), Bar::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Err(EINVAL), Bar::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Baz {
+    ///     A = 1, // The maximum value of `Bounded<u8, 1>`.
+    /// }
+    ///
+    /// assert_eq!(Err(EINVAL), Baz::try_from(Bounded::<u8, 1>::new::<{ 0 }>()));
+    /// assert_eq!(Ok(Baz::A), Baz::try_from(Bounded::<u8, 1>::new::<{ 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `2` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = 2,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u8, 1>)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u8, 1>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     A = u32::MIN as u64,
+    ///     B = u32::MAX as u64,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MIN }>()));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MAX }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MIN + 1 }>()));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(Bounded::<u32, 32>::new::<{ u32::MAX - 1 }>()));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `1 << 32` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = 1 << 32,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<u32, 32>)]
+    /// #[repr(u64)]
+    /// enum Foo {
+    ///     // `-1` cannot be represented with `Bounded<u32, 32>`.
+    ///     A = -1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_bounded {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(isize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = isize::MIN,
+    ///     B = isize::MAX,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(isize::MIN));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(isize::MAX));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(isize::MIN + 1));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(isize::MAX - 1));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(isize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = (isize::MAX as usize) + 1
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (i32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_signed_int {}
+
+    /// ```
+    /// use kernel::{
+    ///     macros::TryFrom,
+    ///     num::Bounded,
+    ///     prelude::*, //
+    /// };
+    ///
+    /// #[derive(Debug, PartialEq, TryFrom)]
+    /// #[try_from(usize)]
+    /// #[repr(usize)]
+    /// enum Foo {
+    ///     A = usize::MIN,
+    ///     B = usize::MAX,
+    /// }
+    ///
+    /// assert_eq!(Ok(Foo::A), Foo::try_from(usize::MIN));
+    /// assert_eq!(Ok(Foo::B), Foo::try_from(usize::MAX));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(usize::MIN + 1));
+    /// assert_eq!(Err(EINVAL), Foo::try_from(usize::MAX - 1));
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(usize)]
+    /// #[repr(isize)]
+    /// enum Foo {
+    ///     A = -1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MIN as i64) - 1,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(u32)]
+    /// #[repr(i64)]
+    /// enum Foo {
+    ///     A = (u32::MAX as i64) + 1,
+    /// }
+    /// ```
+    mod overflow_assert_works_on_unsigned_int {}
+
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(Bounded<i8, 7>, i8, i16, i32, i64)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    ///
+    /// ```compile_fail
+    /// use kernel::macros::TryFrom;
+    ///
+    /// #[derive(TryFrom)]
+    /// #[try_from(i8, i16, i32, i64, Bounded<i8, 7>)]
+    /// #[repr(i8)]
+    /// enum Foo {
+    ///     // `i8::MAX` cannot be represented with `Bounded<i8, 7>`.
+    ///     A = i8::MAX,
+    /// }
+    /// ```
+    mod any_try_from_target_overflow_is_rejected {}
+}
-- 
2.50.1 (Apple Git-155)

