Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E3125A2A2
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727929; cv=none; b=KyllE6OimumWJVq2aVKCmiviGh+7rG4k5Zyib4mTTzQw5c5lmfmU6ejJiAxO9zZhDH2Q6Pkn6blU1dUoibWwZlIAIbxwvdnBEyr27QhpqHHE7q6n3m95PCRBiZiME71YwR5cMSFPxcP2UWWacPOL8WNt9+EsSjUS80pcDAHhImE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727929; c=relaxed/simple;
	bh=f1D15wSqFBYkQHJgtyxnyqldLk75hiGuzcMQZVbkcvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIlgiMbFH2SqQlJRjFFEVUGASlt371R8wYux2lVf7Bo6gpicIyYutx0Jz/8O2hAiYxrgqPGiT/vOXJahhqICqGdT0xqA52s7LuZsrMoJ1twaa/9+jxGBqDX2Pp6z4pl5yUTftxCny4F9HXEdHeo40uNiXZL98gyL4EudpyEhR0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IFYrI8iC; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IFYrI8iC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Zy
	rndAwZtjIghoRREJA4C7wieAor8uhXcfhNZas9o8w=; b=IFYrI8iCtdWNZUEjBr
	0CrknMxNoaycb9606nV9BtuvWdwL+0ln9XeFXnuANl/Pbzw2amn5apNh3tWwELQb
	L2sDn+pNThvjBSlvuFQ93cqmljkRsAJN7aV1y8PkNHlKPOUYqEPEeNVE5qDVsAS3
	5+1UTdsHp4Lp9dYmE7CRZsUyQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S4;
	Wed, 30 Sep 2026 08:24:44 +0800 (CST)
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
Subject: [PATCH v7 02/11] rust: macros: add derive macro for `TryFrom`
Date: Wed, 30 Sep 2026 08:24:27 +0800
Message-ID: <20260930002436.21395-3-chaoji_xinren@163.com>
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
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3XrW5JrW3CrW5Xr48ZFW3GFg_yoWDJF4xpF
	4jg3yFga97tayfGa17Kay7WrW7KFyfJ3WfWrW7Jw1avFW5WFZ3ur47KryfXr90kr1UArya
	gFWqkryUGF1Uta7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziQJ5rUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC4g2SDmq8Vs2DNgAA3L

From: Jesung Yang <y.j3ms.n@gmail.com>

Introduce a procedural macro `TryFrom` to automatically implement the
`TryFrom` trait for unit-only enums.

This reduces boilerplate in cases where numeric values need to be
interpreted as relevant enum variants. This situation often arises when
working with low-level data sources. A typical example is the `Chipset`
enum in nova-core, where the value read from a GPU register should be
mapped to a corresponding variant.

The macro not only supports primitive types such as `bool` or `i8`, but
also `Bounded`, a wrapper around integer types limiting the number of
bits usable for value representation. This accommodates the shift toward
more restrictive register field representations in nova-core where
values are constrained to specific bit ranges.

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs |  58 ++++++++++++++
 rust/macros/lib.rs     | 177 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 235 insertions(+)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 6702c2e48c1f..c64e35447859 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -34,6 +34,10 @@ pub(crate) fn derive_into(input: DeriveInput) -> syn::Result<TokenStream> {
     derive(DeriveTarget::Into, input)
 }
 
+pub(crate) fn derive_try_from(input: DeriveInput) -> syn::Result<TokenStream> {
+    derive(DeriveTarget::TryFrom, input)
+}
+
 fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream> {
     let data_enum = match input.data {
         Data::Enum(data) => data,
@@ -129,18 +133,21 @@ fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream>
 #[derive(Clone, Copy, Debug)]
 enum DeriveTarget {
     Into,
+    TryFrom,
 }
 
 impl DeriveTarget {
     fn get_trait_name(&self) -> &'static str {
         match self {
             Self::Into => "Into",
+            Self::TryFrom => "TryFrom",
         }
     }
 
     fn get_helper_name(&self) -> &'static str {
         match self {
             Self::Into => "into",
+            Self::TryFrom => "try_from",
         }
     }
 }
@@ -186,6 +193,7 @@ fn derive_for_enum(
 ) -> TokenStream {
     let impl_fn = match target {
         DeriveTarget::Into => impl_into,
+        DeriveTarget::TryFrom => impl_try_from,
     };
 
     let qualified_repr_ty: syn::Path = parse_quote! { ::core::primitive::#repr_ty };
@@ -245,6 +253,56 @@ fn from(#param: #enum_ident) -> #input_ty {
         }
     }
 
+    fn impl_try_from(
+        enum_ident: &Ident,
+        variants: &[Ident],
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let param = Ident::new("value", Span::call_site());
+
+        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
+        let emit_cast = |variant| {
+            let qualified_variant = ::quote::quote! { #enum_ident::#variant };
+            match input_ty {
+                ValidTy::Bounded(inner) => {
+                    let base_ty = inner.emit_qualified_base_ty();
+                    let expr = parse_quote! { #qualified_variant as #base_ty };
+                    inner.emit_new(&expr)
+                }
+                ValidTy::Primitive(ident) if ident == "bool" => {
+                    ::quote::quote! { ((#qualified_variant as #repr_ty) == 1) }
+                }
+                qualified @ ValidTy::Primitive(_) => {
+                    ::quote::quote! { #qualified_variant as #qualified }
+                }
+            }
+        };
+
+        let clauses = variants.iter().map(|variant| {
+            let cast = emit_cast(variant);
+            ::quote::quote! {
+                if #param == #cast {
+                    ::core::result::Result::Ok(#enum_ident::#variant)
+                } else
+            }
+        });
+
+        ::quote::quote! {
+            #[automatically_derived]
+            impl ::core::convert::TryFrom<#input_ty> for #enum_ident {
+                type Error = ::kernel::prelude::Error;
+                fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
+                    #overflow_assertion
+
+                    #(#clauses)* {
+                        ::core::result::Result::Err(::kernel::prelude::EINVAL)
+                    }
+                }
+            }
+        }
+    }
+
     fn emit_overflow_assert(
         enum_ident: &Ident,
         variants: &[Ident],
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 1faeebc0de4b..8b4f3e9dc860 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -709,3 +709,180 @@ pub fn derive_into(input: TokenStream) -> TokenStream {
         .unwrap_or_else(syn::Error::into_compile_error)
         .into()
 }
+
+/// A derive macro for generating an implementation of the [`TryFrom`] trait.
+///
+/// This macro automatically derives the [`TryFrom`] trait for a given enum. Currently,
+/// it only supports [unit-only enum]s.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// - The macro generates [`TryFrom`] implementations that:
+///   - Return `Ok(VARIANT)` when the input corresponds to a variant.
+///   - Return `Err(EINVAL)` when the input does not correspond to any variant.
+///     (where `EINVAL` is from [`kernel::error::code`]).
+///
+/// - The macro uses the `try_from` custom attribute or `repr` attribute to generate
+///   [`TryFrom`] implementations. `try_from` always takes precedence over `repr`.
+///
+/// - Currently, the macro does not support `repr(C)` fieldless enums since the actual
+///   representation of discriminants is defined by rustc internally, and documentation
+///   around it is not yet settled. See [Rust issue #124403] and [Rust PR #147017]
+///   for more information.
+///
+/// - The macro generates a compile-time assertion for every variant to ensure its
+///   discriminant value fits within the type being converted from.
+///
+/// [`kernel::error::code`]: ../kernel/error/code/index.html
+/// [Rust issue #124403]: https://github.com/rust-lang/rust/issues/124403
+/// [Rust PR #147017]: https://github.com/rust-lang/rust/pull/147017
+///
+/// # Supported types in `#[try_from(...)]`
+///
+/// - [`bool`]
+/// - Primitive integer types (e.g., [`i8`], [`u8`])
+/// - [`Bounded`]
+///
+/// [`Bounded`]: ../kernel/num/bounded/struct.Bounded.html
+///
+/// # Examples
+///
+/// ## Without Attributes
+///
+/// Since [the default `Rust` representation uses `isize` for the discriminant type][repr-rust],
+/// the macro implements `TryFrom<isize>`:
+///
+/// [repr-rust]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::macros::TryFrom;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(Err(EINVAL), Foo::try_from(-1_isize));
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_isize));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(0x7_isize));
+/// assert_eq!(Err(EINVAL), Foo::try_from(0x8_isize));
+/// ```
+///
+/// ## With `#[repr(T)]`
+///
+/// The macro implements `TryFrom<T>`:
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::macros::TryFrom;
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_u8));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(0x7_u8));
+/// assert_eq!(Err(EINVAL), Foo::try_from(0x8_u8));
+/// ```
+///
+/// ## With `#[try_from(...)]`
+///
+/// The macro implements `TryFrom<T>` for each `T` specified in `#[try_from(...)]`,
+/// which always overrides `#[repr(...)]`:
+///
+/// ```rust
+/// # use kernel::prelude::*;
+/// use kernel::{
+///     macros::TryFrom,
+///     num::Bounded, //
+/// };
+///
+/// #[derive(Debug, Default, PartialEq, TryFrom)]
+/// #[try_from(bool, i16, Bounded<u8, 4>)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B,
+/// }
+///
+/// assert_eq!(Err(EINVAL), Foo::try_from(-1_i16));
+/// assert_eq!(Ok(Foo::A), Foo::try_from(0_i16));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(1_i16));
+/// assert_eq!(Err(EINVAL), Foo::try_from(2_i16));
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(false));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(true));
+///
+/// assert_eq!(Ok(Foo::A), Foo::try_from(Bounded::<u8, 4>::new::<0>()));
+/// assert_eq!(Ok(Foo::B), Foo::try_from(Bounded::<u8, 4>::new::<1>()));
+/// ```
+///
+/// ## Compile-time Overflow Assertion
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// #[derive(TryFrom)]
+/// #[try_from(u8)]
+/// enum Foo {
+///     // `256` is larger than `u8::MAX`.
+///     A = 256,
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// #[derive(TryFrom)]
+/// #[try_from(u8)]
+/// enum Foo {
+///     // `-1` cannot be represented with `u8`.
+///     A = -1,
+/// }
+/// ```
+///
+/// ## Unsupported Cases
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(TryFrom)]
+/// enum Foo {
+///     A(u8),
+///     B { inner: u8 },
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // Structs are not allowed.
+/// #[derive(TryFrom)]
+/// struct Foo(u8);
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::TryFrom;
+/// // `repr(C)` enums are not allowed.
+/// #[derive(TryFrom)]
+/// #[repr(C)]
+/// struct Foo(u8)
+/// ```
+#[proc_macro_derive(TryFrom, attributes(try_from))]
+pub fn derive_try_from(input: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(input as DeriveInput);
+    convert::derive_try_from(input)
+        .unwrap_or_else(syn::Error::into_compile_error)
+        .into()
+}
-- 
2.50.1 (Apple Git-155)

