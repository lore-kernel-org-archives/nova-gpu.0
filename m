Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92A25A2A2
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727937; cv=none; b=lRhlnZjA/QLaL/SoTG1qahT9AfI5myVqfyL3Hb8oKUGYHkAbPULWc9nbgQLowCp4kpu3grBK+uE1Atwi/cwivDVQ145PZ6AvKlymtKeZyrTaGDShsqrEDhuwfPnfr3IxYKGQb4LleMFemnnetetFhg1MsczKFYRVJh8jtBnRkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727937; c=relaxed/simple;
	bh=3uoIgh2En07nqN0i6D3H1u4+7AAoxLXhuT5oVN6vq88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+TpT70OL9NPVh8JMIf6cT+IGrnsOwoN9FY+h+JkdTY/h8pS8O0iktl2i7D1/QZXIwjk/7ZZDWK2PMVs0usJrFjNpE+p0C6xfDy+Tlng0asNdVlwKffhmeYv14IEm0hCIUSuCCvrbwL2k7HgJ2P5ladEzSamQrd9G6PDD2uCvAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qMN9sE8l; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qMN9sE8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=KA
	sfemKeW7i7EcTkjjYkPjtumUhWyZhhxM8VCV1S998=; b=qMN9sE8ldjY1lmCxvb
	4z/aJ4DKGhHrfNNfN49tiERHlrPSxNRz2HBq4jxQwqxBZWpPiA8KFmlc8h2bmMCc
	imyMJWnUPUnFOkZcyaZOXlmaDBIh8HHPn1M1HPZBskE2gxyYUYcotqrABVJVIL3X
	haanmbzUHCEOmeLKO5fEAmuuk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S5;
	Wed, 30 Sep 2026 08:24:47 +0800 (CST)
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
Subject: [PATCH v7 03/11] rust: macros: add `convert` helper attribute
Date: Wed, 30 Sep 2026 08:24:28 +0800
Message-ID: <20260930002436.21395-4-chaoji_xinren@163.com>
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
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw18uF47tr47Wr4DWr4xCrg_yoW3JFyxpF
	WUK3y0g343tas3Gan2yay2qw4j9F1fJa15XrWrXwn2vFW5JrWS9r4UKr48tr98Cr1rJry3
	KFWjkr1UWFy7Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zil1vxUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4Q+SDmq8Vs+lqQAA3x

From: Jesung Yang <y.j3ms.n@gmail.com>

Introduce `#[convert(...)]`, a common helper attribute for the `Into`
and `TryFrom` derive macros. This helps avoid repeating the same types
in `#[into(...)]` and `#[try_from(...)]` when deriving both traits for
the same enum.

For example:

    #[derive(Into, TryFrom)]
    #[try_from(u8)]
    #[into(u8)]
    enum Enum {
        A,
        B,
    }

The above snippet can be shortened to:

    #[derive(Into, TryFrom)]
    #[convert(u8)]
    enum Enum {
        A,
        B,
    }

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs |  7 +++-
 rust/macros/lib.rs     | 78 +++++++++++++++++++++++++++++++++++++++---
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index c64e35447859..21d79bca16a0 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -150,6 +150,10 @@ fn get_helper_name(&self) -> &'static str {
             Self::TryFrom => "try_from",
         }
     }
+
+    fn get_common_helper_name(&self) -> &'static str {
+        "convert"
+    }
 }
 
 fn parse_attrs(
@@ -157,6 +161,7 @@ fn parse_attrs(
     attrs: &[Attribute],
 ) -> syn::Result<(Vec<Type>, bool, Option<Ident>)> {
     let helper = target.get_helper_name();
+    let common_helper = target.get_common_helper_name();
 
     let mut is_repr_c = false;
     let mut repr_ty = None;
@@ -175,7 +180,7 @@ fn parse_attrs(
                 // Delegate `repr` attribute validation to rustc.
                 Ok(())
             })?;
-        } else if attr.path().is_ident(helper) {
+        } else if attr.path().is_ident(helper) || attr.path().is_ident(common_helper) {
             let args = attr.parse_args_with(Punctuated::<Type, Token![,]>::parse_terminated)?;
             helper_tys.extend(args);
         }
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 8b4f3e9dc860..cc6a96516c93 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -557,6 +557,10 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// - The macro uses the `into` custom attribute or `repr` attribute to generate [`From`]
 ///   implementations. `into` always takes precedence over `repr`.
 ///
+/// - In addition to `into`, the `convert` custom attribute is supported. The purpose of
+///   this attribute is to avoid repetition when deriving both [`Into`] and [`TryFrom`]
+///   for the same enum. See ["With `#[convert(...)]`"](#with-convert) for an example.
+///
 /// - Currently, the macro does not support `repr(C)` fieldless enums since the actual
 ///   representation of discriminants is defined by rustc internally, and documentation
 ///   around it is not yet settled. See [Rust issue #124403] and [Rust PR #147017]
@@ -568,7 +572,7 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// [Rust issue #124403]: https://github.com/rust-lang/rust/issues/124403
 /// [Rust PR #147017]: https://github.com/rust-lang/rust/pull/147017
 ///
-/// # Supported types in `#[into(...)]`
+/// # Supported types in `#[into(...)]` and `#[convert(...)]`
 ///
 /// - [`bool`]
 /// - Primitive integer types (e.g., [`i8`], [`u8`])
@@ -650,6 +654,36 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// assert_eq!(Bounded::<u8, 4>::new::<1>(), foo_b);
 /// ```
 ///
+/// ## With `#[convert(...)]`
+///
+/// The macro implements `From<Foo>` for each `T` specified in `#[into(...)]`,
+/// which always overrides `#[repr(...)]`. `#[convert(...)]` is useful when the same type
+/// needs to be specified in both `#[into(...)]` and `#[try_from(...)]`:
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::{
+///     macros::Into,
+///     macros::TryFrom,
+///     num::Bounded, //
+/// };
+///
+/// #[derive(Debug, Default, Into, PartialEq, TryFrom)]
+/// #[convert(bool)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B,
+/// }
+///
+/// assert_eq!(false, Foo::A.into());
+/// assert_eq!(true, Foo::B.into());
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+/// ```
+///
 /// ## Compile-time Overflow Assertion
 ///
 /// The following examples do not compile:
@@ -702,7 +736,7 @@ pub fn CovariantForLt(input: TokenStream) -> TokenStream {
 /// #[repr(C)]
 /// struct Foo(u8);
 /// ```
-#[proc_macro_derive(Into, attributes(into))]
+#[proc_macro_derive(Into, attributes(into, convert))]
 pub fn derive_into(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input as DeriveInput);
     convert::derive_into(input)
@@ -727,6 +761,11 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// - The macro uses the `try_from` custom attribute or `repr` attribute to generate
 ///   [`TryFrom`] implementations. `try_from` always takes precedence over `repr`.
 ///
+/// - In addition to `try_from`, the `convert` custom attribute is supported. The purpose
+///   of this attribute is to avoid repetition when deriving both [`Into`] and
+///   [`TryFrom`] for the same enum. See ["With `#[convert(...)]`"](#with-convert) for an
+///   example.
+///
 /// - Currently, the macro does not support `repr(C)` fieldless enums since the actual
 ///   representation of discriminants is defined by rustc internally, and documentation
 ///   around it is not yet settled. See [Rust issue #124403] and [Rust PR #147017]
@@ -739,7 +778,7 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// [Rust issue #124403]: https://github.com/rust-lang/rust/issues/124403
 /// [Rust PR #147017]: https://github.com/rust-lang/rust/pull/147017
 ///
-/// # Supported types in `#[try_from(...)]`
+/// # Supported types in `#[try_from(...)]` and `#[convert(...)]`
 ///
 /// - [`bool`]
 /// - Primitive integer types (e.g., [`i8`], [`u8`])
@@ -827,6 +866,37 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 4>::new::<1>()));
 /// ```
 ///
+/// ## With `#[convert(...)]`
+///
+/// The macro implements `TryFrom<T>` for each `T` specified in `#[convert(...)]`,
+/// which always overrides `#[repr(...)]`. `#[convert(...)]` is useful when the same type
+/// needs to be specified in both `#[into(...)]` and `#[try_from(...)]`:
+///
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::{
+///     macros::Into,
+///     macros::TryFrom,
+///     num::Bounded, //
+/// };
+///
+/// #[derive(Debug, Default, Into, PartialEq, TryFrom)]
+/// #[convert(bool)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B,
+/// }
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+///
+/// assert_eq!(false, Foo::A.into());
+/// assert_eq!(true, Foo::B.into());
+/// ```
+///
 /// ## Compile-time Overflow Assertion
 ///
 /// The following examples do not compile:
@@ -879,7 +949,7 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
 /// #[repr(C)]
 /// struct Foo(u8)
 /// ```
-#[proc_macro_derive(TryFrom, attributes(try_from))]
+#[proc_macro_derive(TryFrom, attributes(try_from, convert))]
 pub fn derive_try_from(input: TokenStream) -> TokenStream {
     let input = parse_macro_input!(input as DeriveInput);
     convert::derive_try_from(input)
-- 
2.50.1 (Apple Git-155)

