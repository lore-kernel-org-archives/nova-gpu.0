Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850C05293F7
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690375; cv=none; b=P9Dr7k7cXuvlEJCAEZ8H2BxobqP5bPS6SKa6HrJbE+UHl9uAtgnPa/CGWwGbUuHnpjI8IlbI9LDsqsCia5G4MWpOUCNdGH/MbRTn+ICNynGNDfl13xd9APWfKNzca54i69zH/p/F650+UQKQ7E73FCDEfR2M3KPC0z4kBw1eO80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690375; c=relaxed/simple;
	bh=2famN4vTw9O356qIDyodkI/2LTm4aZacd8FXSyXRj94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFAQVu7mqRdINd//pdofIKpFo6hZxrOHySZHEMHbb+VRx8Keo5SN6T0ZrPYZXv3ZcRjvju3vF9C9Kfjyiboww/ngMTzO52LKdDxycIEDoGaci8xsAVPiCu3giT4mEkiWnrF36XBZzbhBV2YgwDRZNXJKzKfXwEZU4V9iB7YZUrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Hj3ypOiI; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Hj3ypOiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=B/
	y0bZdDk4/i0/ETvkJS0z7BAXPByKlRi0BoFS3ozbA=; b=Hj3ypOiIV+q39Ers5U
	D3GAX4GeqMj9dtV7IGzQDH0dto0h4Q3qwTM+HYrAszIbrLkciZM4hVeuPtP2OiDE
	oVmFzzvH44KV2T8ETzYkT5bBCda0m4AcSSiQVaohbIHzFZ7iiVsxfaPjlKHbtmKj
	gGyjeadpb0BLG1TWoZy8lmKCk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDX8L8hxLtqbwr+Bg--.43938S5;
	Tue, 29 Sep 2026 21:59:15 +0800 (CST)
From: Kaiqi Guo <chaoji_xinren@163.com>
To: rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Jesung Yang <y.j3ms.n@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kaiqi Guo <chaoji_xinren@163.com>
Subject: [PATCH v6 03/10] rust: macros: add `convert` helper attribute
Date: Tue, 29 Sep 2026 21:58:48 +0800
Message-ID: <20260929135855.36775-4-chaoji_xinren@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260929135855.36775-1-chaoji_xinren@163.com>
References: <20260929135855.36775-1-chaoji_xinren@163.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDX8L8hxLtqbwr+Bg--.43938S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw18uF47tr47Wr4DWr4xCrg_yoW3JF1rpF
	WUK3y0g343tas3Wan2kay2qw42kF1fJa15XrWrXwn2vFW5JrWS9r4UKw48tr98Cr1rJry3
	KFWjkr1UWFy7Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMjg4UUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-hPGQmq7xDOvFgAA32

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

