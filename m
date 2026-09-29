Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA0D52CCFD
	for <nova-gpu@lists.linux.dev>; Tue, 29 Sep 2026 13:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690386; cv=none; b=cWtosrgKwR+vkIpku0eBEOcVGvYhcqi6jvtbnpt6dIEE80l1/d+YA4OHgmp16NVtjyXlbyt1M4KQxSrsk1JqUfYh0C2nRsnsr32WpkC3pgYQ+DKhiYKsP72NhKbsE2Gfs8rc0aq6V+ASTb7imssLv91jchU+7NyC47Vin7Rxp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690386; c=relaxed/simple;
	bh=4l7txIGHx9kjfgnhOILIcb6mmCZbeG4MAdf+84zKGGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wz/czA4GkBwCtVajDm+eHKCaKPfQSrh0gAadDx1dzUrZC1uDnTQzGSrAIcq8ZetTGLE4TFVy2Cn2yUPCI/zySNMz2TJYcb4ngHRhznA82zDkPE2BIcy+ag6/nnSvgoIdM/YGDW/QCGQGnc31YcdWkLWA1baSOkmvFsNSpXL3jv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=eQDKgKYs; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="eQDKgKYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+J
	0emnX8GPjR8WsdZ68vYZJDAhtbGn8vDsdIdB4rXtg=; b=eQDKgKYsHfpQJqbCIp
	QAYKIeKz26GhtluT3RxqAtij1Pm+ZDYXBiHrkFna44BR1LPpdgVN2LW504u78any
	W3nMOVV9HT7xLUQ/FsXCrHYfzGkIuQQRhSgkiDSM0asDV4j3JBNPXGoBiAO6bk1w
	sAbmDqSwgpJkkEtfZhBUkWx9A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3rr08xLtqmCNYBg--.46271S4;
	Tue, 29 Sep 2026 21:59:33 +0800 (CST)
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
Subject: [PATCH v6 07/10] rust: macros: derive From for exhaustive enum conversions
Date: Tue, 29 Sep 2026 21:58:52 +0800
Message-ID: <20260929135855.36775-8-chaoji_xinren@163.com>
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
X-CM-TRANSID:_____wD3rr08xLtqmCNYBg--.46271S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3GrW8AFyfKFWxKw4rCryDWrg_yoWDJF4DpF
	Z0g39Yg3y7JrZ7GrsrKa47XryxKFyfG3y3XFWxtw17Za15XF9a9r17Kr15JryFyw1qvFy3
	KayjkrWUGF1jvFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMv38rUUUUU=
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-gbLR2q7xEawBQAA3S

Nova register fields need From<Bounded<T, N>> when every possible field
value names an enum variant. Add From and its from helper alongside Into
and TryFrom, with the shared convert helper for round trips.

Reuse the existing discriminant range assertions. Rust already rejects
duplicate discriminants, so checking that the number of variants matches
the input range proves exhaustive coverage at compile time. Compare
range spans in u128 with wrapping subtraction to handle signed minima
and full-width ranges without overflowing a cardinality.

After testing all but the final variant, return that variant directly.
Missing values and out-of-range discriminants are compilation errors,
including when no conversion is called; the generated implementation
needs neither unsafe code nor a panic branch. Document the blanket
TryFrom implementation and its conflict with an explicit derive for the
same source.

Suggested-by: Alexandre Courbot <acourbot@nvidia.com>

Link: https://lore.kernel.org/rust-for-linux/DHHK2OJ6O83V.2MZNHRQYK21EU@nvidia.com/
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 105 ++++++++++++++++++++++++++++++++++-------
 rust/macros/lib.rs     |  95 +++++++++++++++++++++++++++++++++++++
 2 files changed, 182 insertions(+), 18 deletions(-)

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
index 78efbc7b99d7..7fa8a22dc913 100644
--- a/rust/macros/convert.rs
+++ b/rust/macros/convert.rs
@@ -38,6 +38,10 @@ pub(crate) fn derive_try_from(input: DeriveInput) -> syn::Result<TokenStream> {
     derive(DeriveTarget::TryFrom, input)
 }
 
+pub(crate) fn derive_from(input: DeriveInput) -> syn::Result<TokenStream> {
+    derive(DeriveTarget::From, input)
+}
+
 fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream> {
     let data_enum = match input.data {
         Data::Enum(data) => data,
@@ -109,6 +113,13 @@ fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream>
         return Err(errors);
     }
 
+    if matches!(target, DeriveTarget::From) && data_enum.variants.is_empty() {
+        return Err(syn::Error::new(
+            input.ident.span(),
+            "`#[derive(From)]` requires a nonempty enum",
+        ));
+    }
+
     let variants: Vec<_> = data_enum
         .variants
         .into_iter()
@@ -134,6 +145,7 @@ fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream>
 enum DeriveTarget {
     Into,
     TryFrom,
+    From,
 }
 
 impl DeriveTarget {
@@ -141,6 +153,7 @@ fn get_trait_name(&self) -> &'static str {
         match self {
             Self::Into => "Into",
             Self::TryFrom => "TryFrom",
+            Self::From => "From",
         }
     }
 
@@ -148,6 +161,7 @@ fn get_helper_name(&self) -> &'static str {
         match self {
             Self::Into => "into",
             Self::TryFrom => "try_from",
+            Self::From => "from",
         }
     }
 
@@ -199,6 +213,7 @@ fn derive_for_enum(
     let impl_fn = match target {
         DeriveTarget::Into => impl_into,
         DeriveTarget::TryFrom => impl_try_from,
+        DeriveTarget::From => impl_from,
     };
 
     let qualified_repr_ty: syn::Path = parse_quote! { ::core::primitive::#repr_ty };
@@ -267,25 +282,8 @@ fn impl_try_from(
         let param = Ident::new("value", Span::call_site());
 
         let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
-        let emit_cast = |variant| {
-            let qualified_variant = ::quote::quote! { #enum_ident::#variant };
-            match input_ty {
-                ValidTy::Bounded(inner) => {
-                    let base_ty = inner.emit_qualified_base_ty();
-                    let expr = parse_quote! { #qualified_variant as #base_ty };
-                    inner.emit_new(&expr)
-                }
-                ValidTy::Primitive(ident) if ident == "bool" => {
-                    ::quote::quote! { ((#qualified_variant as #repr_ty) == 1) }
-                }
-                qualified @ ValidTy::Primitive(_) => {
-                    ::quote::quote! { #qualified_variant as #qualified }
-                }
-            }
-        };
-
         let clauses = variants.iter().map(|variant| {
-            let cast = emit_cast(variant);
+            let cast = emit_variant_cast(enum_ident, variant, repr_ty, input_ty);
             ::quote::quote! {
                 if #param == #cast {
                     ::core::result::Result::Ok(#enum_ident::#variant)
@@ -308,6 +306,77 @@ fn try_from(#param: #input_ty) -> Result<#enum_ident, Self::Error> {
         }
     }
 
+    fn impl_from(
+        enum_ident: &Ident,
+        variants: &[Ident],
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let param = Ident::new("value", Span::call_site());
+        let (last, rest) = variants.split_last().expect("nonempty enum checked above");
+        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
+        let input_min = input_ty.emit_min();
+        let input_max = input_ty.emit_max();
+        let span = rest.len() as u128;
+        let msg = format!("enum `{enum_ident}` does not cover every value of `{input_ty}`");
+
+        let clauses = rest.iter().map(|variant| {
+            let cast = emit_variant_cast(enum_ident, variant, repr_ty, input_ty);
+            ::quote::quote! {
+                if #param == #cast {
+                    #enum_ident::#variant
+                } else
+            }
+        });
+
+        ::quote::quote! {
+            #[automatically_derived]
+            impl ::core::convert::From<#input_ty> for #enum_ident {
+                fn from(#param: #input_ty) -> Self {
+                    #overflow_assertion
+
+                    const _: () = {
+                        // Rust rejects duplicate discriminants, and the overflow assertion
+                        // places every discriminant in the input range. Equal cardinality
+                        // therefore proves that every possible input has a variant.
+                        let min = (#input_min) as ::core::primitive::u128;
+                        let max = (#input_max) as ::core::primitive::u128;
+                        // Wrapping subtraction also handles negative minima. Compare spans
+                        // rather than lengths to avoid overflowing for a full 128-bit range.
+                        ::core::assert!(max.wrapping_sub(min) == #span, #msg);
+                    };
+
+                    // Exhaustiveness guarantees the final variant when no other one matches.
+                    #(#clauses)* {
+                        #enum_ident::#last
+                    }
+                }
+            }
+        }
+    }
+
+    fn emit_variant_cast(
+        enum_ident: &Ident,
+        variant: &Ident,
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let qualified_variant = ::quote::quote! { #enum_ident::#variant };
+        match input_ty {
+            ValidTy::Bounded(inner) => {
+                let base_ty = inner.emit_qualified_base_ty();
+                let expr = parse_quote! { #qualified_variant as #base_ty };
+                inner.emit_new(&expr)
+            }
+            ValidTy::Primitive(ident) if ident == "bool" => {
+                ::quote::quote! { ((#qualified_variant as #repr_ty) == 1) }
+            }
+            qualified @ ValidTy::Primitive(_) => {
+                ::quote::quote! { #qualified_variant as #qualified }
+            }
+        }
+    }
+
     fn emit_overflow_assert(
         enum_ident: &Ident,
         variants: &[Ident],
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 4d420d34ed6b..f45f80dbf8cb 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -962,3 +962,98 @@ pub fn derive_try_from(input: TokenStream) -> TokenStream {
         .unwrap_or_else(syn::Error::into_compile_error)
         .into()
 }
+
+/// Derives [`core::convert::From`] for a unit-only enum covering every input value.
+///
+/// Supported inputs and representation rules are the same as for [`macro@TryFrom`]:
+/// `bool`, primitive integers, and [`Bounded`]. `#[from(...)]` or `#[convert(...)]`
+/// selects the input types, overriding the default derived from `#[repr(...)]`
+/// (or `isize` when no representation is specified).
+///
+/// Every discriminant must fit each input type, and every input value must have
+/// a corresponding variant. Both conditions are checked at compile time, even
+/// when the conversion is never called. Duplicate discriminants are rejected by
+/// Rust itself. Empty enums and the layouts rejected by [`macro@TryFrom`] are
+/// not supported.
+///
+/// The generated conversion is infallible and contains no panic path. It also
+/// provides `TryFrom` with [`core::convert::Infallible`] through the standard
+/// blanket implementation. Do not additionally derive [`macro@TryFrom`] for
+/// the same input type; use it for inputs the enum does not fully cover.
+///
+/// [`Bounded`]: ../kernel/num/bounded/struct.Bounded.html
+///
+/// # Examples
+///
+/// ```
+/// use kernel::macros::From;
+///
+/// #[derive(Debug, PartialEq, From)]
+/// #[from(bool)]
+/// enum Switch {
+///     Off = 0,
+///     On = 1,
+/// }
+///
+/// assert_eq!(Switch::from(false), Switch::Off);
+/// assert_eq!(Switch::from(true), Switch::On);
+/// ```
+///
+/// Use `#[convert(...)]` with `Into` to derive both directions:
+///
+/// ```
+/// use kernel::{macros::{From, Into}, num::Bounded};
+///
+/// #[derive(Debug, PartialEq, From, Into)]
+/// #[convert(Bounded<u8, 2>)]
+/// enum Mode {
+///     A = 0,
+///     B = 1,
+///     C = 2,
+///     D = 3,
+/// }
+///
+/// for value in 0..=3 {
+///     let bounded = Bounded::<u8, 2>::try_new(value).unwrap();
+///     let mode = Mode::from(bounded);
+///     let round_trip: Bounded<u8, 2> = mode.into();
+///     assert_eq!(round_trip, bounded);
+/// }
+/// ```
+///
+/// Missing values are rejected at compile time:
+///
+/// ```compile_fail,E0080
+/// use kernel::macros::From;
+///
+/// #[derive(From)]
+/// #[from(Bounded<u8, 2>)]
+/// enum Incomplete {
+///     A = 0,
+///     B = 1,
+///     C = 2,
+///     // No variant represents 3.
+/// }
+/// ```
+///
+/// Having the right number of variants does not allow out-of-range values:
+///
+/// ```compile_fail,E0080
+/// use kernel::macros::From;
+///
+/// #[derive(From)]
+/// #[from(Bounded<u8, 2>)]
+/// enum OutOfRange {
+///     A = 0,
+///     B = 1,
+///     C = 2,
+///     D = 4,
+/// }
+/// ```
+#[proc_macro_derive(From, attributes(from, convert))]
+pub fn derive_from(input: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(input as DeriveInput);
+    convert::derive_from(input)
+        .unwrap_or_else(syn::Error::into_compile_error)
+        .into()
+}

