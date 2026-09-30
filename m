Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88672EEC3
	for <nova-gpu@lists.linux.dev>; Wed, 30 Sep 2026 00:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727930; cv=none; b=ivZsZeb6yDaASyCEfLMQEjiU5tnSWO9WTRVZ8m9AKqlcFfxsrQ9PiwqyEVxUjmPtJJDyIwA8TMqeAjztQq1DOwv8EWD449RkWX1RVjn1flK7lFbeMvIkawQdTVI1k4dRlBct7mNIhqqQmBngrnQT1sTok8ss73XqcTO0TuasCew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727930; c=relaxed/simple;
	bh=oUX2x0GQHbyYQJIMt/WJyfR1YD12bD+vpgbRHM1/xFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKQZsDATuzKAMuRVZwnLOWgCz/um4BBZ7RqaLLtPrAuc7LT+/TaiNd2ogrpYsRe+UtrU/zfQEyYYfurQq7fqss8tCIB96x2y0BxC4nonxvFs3pU+36QzmBP358/1PDfUm3GvcHnI94GEB3RDoPqDRojZ1f+F+fdCwCq/wC7u1go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=CK77wQJT; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="CK77wQJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+q
	Wxm4nH7+ksTiNV1GsOvNZif8dvl4arpPWzSQu5BLE=; b=CK77wQJTIMUNUp1R68
	xv8WrgIJUBcIQDp1OzoF6UYknzLoOO/YSX7NaxrRs4p2JcFOf5p6hBjfKupSs3hT
	01YxTDs8QYR4DQ7565nGb4PonAxLPxdSg8KxAbexyrsp58awSrs0YA9DM0ReNAyw
	Z1l7RV1FAVnJWane8Tjbl+kAg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBXnq7EVrxq2GTBBw--.56601S3;
	Wed, 30 Sep 2026 08:24:42 +0800 (CST)
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
Subject: [PATCH v7 01/11] rust: macros: add derive macro for `Into`
Date: Wed, 30 Sep 2026 08:24:26 +0800
Message-ID: <20260930002436.21395-2-chaoji_xinren@163.com>
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
X-CM-TRANSID:PSgvCgBXnq7EVrxq2GTBBw--.56601S3
X-Coremail-Antispam: 1Uf129KBjvAXoWfXr4ftFWUKFWUtw4Uuw15urg_yoW8uryrZo
	WxG39Yg398Ar10krsavwsxAa47Cw4fGrZ3Zr4F9rnIva48X34S9ay8Cw4UZw43W3WUtry5
	Zw1rX3yrJFWDJrn8n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RcBMKUUUUU
X-CM-SenderInfo: pfkd0yplb0x0xuhqqiywtou0bp/xtbC-guRDWq8VsuDQgAA3j

From: Jesung Yang <y.j3ms.n@gmail.com>

Introduce a procedural macro `Into` to automatically implement the
`Into` trait for unit-only enums.

This reduces boilerplate in cases where enum variants need to be
interpreted as relevant numeric values. A concrete example can be
found in nova-core, where the `register!()` macro requires enum types
used within it to be convertible via `u32::from()` [1].

The macro not only supports primitive types such as `bool` or `i8`, but
also `Bounded`, a wrapper around integer types limiting the number of
bits usable for value representation. This accommodates the shift toward
more restrictive register field representations in nova-core where
values are constrained to specific bit ranges.

Note that the macro actually generates `From<E> for T` implementations,
where `E` is an enum identifier and `T` is an arbitrary integer type.
This automatically provides the corresponding `Into<T> for E`
implementations through the blanket implementation.

Link: https://lore.kernel.org/rust-for-linux/20250624132337.2242-1-dakr@kernel.org/ [1]
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Kaiqi Guo <chaoji_xinren@163.com>
---
 rust/macros/convert.rs | 527 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     | 174 +++++++++++++-
 2 files changed, 700 insertions(+), 1 deletion(-)
 create mode 100644 rust/macros/convert.rs

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
new file mode 100644
index 000000000000..6702c2e48c1f
--- /dev/null
+++ b/rust/macros/convert.rs
@@ -0,0 +1,527 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro2::{
+    Span,
+    TokenStream, //
+};
+
+use std::fmt;
+
+use syn::{
+    parse_quote,
+    parse_str,
+    punctuated::Punctuated,
+    spanned::Spanned,
+    AngleBracketedGenericArguments,
+    Attribute,
+    Data,
+    DeriveInput,
+    Expr,
+    ExprLit,
+    Fields,
+    GenericArgument,
+    Ident,
+    Lit,
+    LitInt,
+    PathArguments,
+    PathSegment,
+    Token,
+    Type,
+    TypePath, //
+};
+
+pub(crate) fn derive_into(input: DeriveInput) -> syn::Result<TokenStream> {
+    derive(DeriveTarget::Into, input)
+}
+
+fn derive(target: DeriveTarget, input: DeriveInput) -> syn::Result<TokenStream> {
+    let data_enum = match input.data {
+        Data::Enum(data) => data,
+        Data::Struct(data) => {
+            let msg = format!(
+                "expected `enum`, found `struct`; \
+                `#[derive({})]` can only be applied to a unit-only enum",
+                target.get_trait_name(),
+            );
+            return Err(syn::Error::new(data.struct_token.span(), msg));
+        }
+        Data::Union(data) => {
+            let msg = format!(
+                "expected `enum`, found `union`; \
+                `#[derive({})]` can only be applied to a unit-only enum",
+                target.get_trait_name(),
+            );
+            return Err(syn::Error::new(data.union_token.span(), msg));
+        }
+    };
+
+    let mut errors: Option<syn::Error> = None;
+    let mut combine_error = |err| match errors.as_mut() {
+        Some(errors) => errors.combine(err),
+        None => errors = Some(err),
+    };
+
+    let (helper_tys, is_repr_c, repr_ty) = parse_attrs(target, &input.attrs)?;
+
+    let mut valid_helper_tys = Vec::with_capacity(helper_tys.len());
+    for ty in helper_tys {
+        match validate_type(&ty) {
+            Ok(valid_ty) => valid_helper_tys.push(valid_ty),
+            Err(err) => combine_error(err),
+        }
+    }
+
+    let mut is_unit_only = true;
+    for variant in &data_enum.variants {
+        match &variant.fields {
+            Fields::Unit => continue,
+            Fields::Named(_) => {
+                let msg = format!(
+                    "expected unit-like variant, found struct-like variant; \
+                    `#[derive({})]` can only be applied to a unit-only enum",
+                    target.get_trait_name(),
+                );
+                combine_error(syn::Error::new_spanned(variant, msg));
+            }
+            Fields::Unnamed(_) => {
+                let msg = format!(
+                    "expected unit-like variant, found tuple-like variant; \
+                    `#[derive({})]` can only be applied to a unit-only enum",
+                    target.get_trait_name(),
+                );
+                combine_error(syn::Error::new_spanned(variant, msg));
+            }
+        }
+
+        is_unit_only = false;
+    }
+
+    if is_repr_c && is_unit_only && repr_ty.is_none() {
+        let msg = "`#[repr(C)]` fieldless enums are not supported";
+        return Err(syn::Error::new(input.ident.span(), msg));
+    }
+
+    if let Some(errors) = errors {
+        return Err(errors);
+    }
+
+    let variants: Vec<_> = data_enum
+        .variants
+        .into_iter()
+        .map(|variant| variant.ident)
+        .collect();
+
+    // Extract the representation passed by `#[repr(...)]` if present. If nothing is
+    // specified, the default is `Rust` representation, which uses `isize` for its
+    // discriminant type.
+    // See: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+    let repr_ty = repr_ty.unwrap_or_else(|| Ident::new("isize", Span::call_site()));
+
+    Ok(derive_for_enum(
+        target,
+        &input.ident,
+        &variants,
+        repr_ty,
+        valid_helper_tys,
+    ))
+}
+
+#[derive(Clone, Copy, Debug)]
+enum DeriveTarget {
+    Into,
+}
+
+impl DeriveTarget {
+    fn get_trait_name(&self) -> &'static str {
+        match self {
+            Self::Into => "Into",
+        }
+    }
+
+    fn get_helper_name(&self) -> &'static str {
+        match self {
+            Self::Into => "into",
+        }
+    }
+}
+
+fn parse_attrs(
+    target: DeriveTarget,
+    attrs: &[Attribute],
+) -> syn::Result<(Vec<Type>, bool, Option<Ident>)> {
+    let helper = target.get_helper_name();
+
+    let mut is_repr_c = false;
+    let mut repr_ty = None;
+    let mut helper_tys = Vec::new();
+    for attr in attrs {
+        if attr.path().is_ident("repr") {
+            attr.parse_nested_meta(|meta| {
+                let ident = meta.path.get_ident();
+                if let Some(i) = ident {
+                    if is_valid_primitive(i) {
+                        repr_ty = ident.cloned();
+                    } else if i == "C" {
+                        is_repr_c = true;
+                    }
+                }
+                // Delegate `repr` attribute validation to rustc.
+                Ok(())
+            })?;
+        } else if attr.path().is_ident(helper) {
+            let args = attr.parse_args_with(Punctuated::<Type, Token![,]>::parse_terminated)?;
+            helper_tys.extend(args);
+        }
+    }
+
+    Ok((helper_tys, is_repr_c, repr_ty))
+}
+
+fn derive_for_enum(
+    target: DeriveTarget,
+    enum_ident: &Ident,
+    variants: &[Ident],
+    repr_ty: Ident,
+    helper_tys: Vec<ValidTy>,
+) -> TokenStream {
+    let impl_fn = match target {
+        DeriveTarget::Into => impl_into,
+    };
+
+    let qualified_repr_ty: syn::Path = parse_quote! { ::core::primitive::#repr_ty };
+
+    return if helper_tys.is_empty() {
+        let ty = ValidTy::Primitive(repr_ty);
+        let implementation = impl_fn(enum_ident, variants, &qualified_repr_ty, &ty);
+        ::quote::quote! { #implementation }
+    } else {
+        let impls = helper_tys
+            .into_iter()
+            .map(|ty| impl_fn(enum_ident, variants, &qualified_repr_ty, &ty));
+        ::quote::quote! { #(#impls)* }
+    };
+
+    fn impl_into(
+        enum_ident: &Ident,
+        variants: &[Ident],
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let param = Ident::new("value", Span::call_site());
+
+        let overflow_assertion = emit_overflow_assert(enum_ident, variants, repr_ty, input_ty);
+        let cast = match input_ty {
+            ValidTy::Bounded(inner) => {
+                let base_ty = inner.emit_qualified_base_ty();
+                let match_arms = variants.iter().map(|variant| {
+                    let qualified_variant = ::quote::quote! { #enum_ident::#variant };
+                    let expr = parse_quote! { #qualified_variant as #base_ty };
+                    let bounded_new = inner.emit_new(&expr);
+                    ::quote::quote! {
+                        #qualified_variant => #bounded_new,
+                    }
+                });
+                ::quote::quote! {
+                    match #param {
+                        #(#match_arms)*
+                    }
+                }
+            }
+            ValidTy::Primitive(ident) if ident == "bool" => {
+                ::quote::quote! { (#param as #repr_ty) == 1 }
+            }
+            qualified @ ValidTy::Primitive(_) => ::quote::quote! { #param as #qualified },
+        };
+
+        ::quote::quote! {
+            #[automatically_derived]
+            impl ::core::convert::From<#enum_ident> for #input_ty {
+                fn from(#param: #enum_ident) -> #input_ty {
+                    #overflow_assertion
+
+                    #cast
+                }
+            }
+        }
+    }
+
+    fn emit_overflow_assert(
+        enum_ident: &Ident,
+        variants: &[Ident],
+        repr_ty: &syn::Path,
+        input_ty: &ValidTy,
+    ) -> TokenStream {
+        let qualified_i128: syn::Path = parse_quote! { ::core::primitive::i128 };
+        let qualified_u128: syn::Path = parse_quote! { ::core::primitive::u128 };
+
+        let input_min = input_ty.emit_min();
+        let input_max = input_ty.emit_max();
+
+        let variant_fits = variants.iter().map(|variant| {
+            let msg = format!(
+                "enum discriminant overflow: \
+                `{enum_ident}::{variant}` does not fit in `{input_ty}`",
+            );
+            ::quote::quote! {
+                ::core::assert!(fits(#enum_ident::#variant as #repr_ty), #msg);
+            }
+        });
+
+        ::quote::quote! {
+            const _: () = {
+                const fn fits(d: #repr_ty) -> ::core::primitive::bool {
+                    // For every integer type, its minimum value always fits in `i128`.
+                    let dst_min = #input_min;
+                    // For every integer type, its maximum value always fits in `u128`.
+                    let dst_max = #input_max;
+
+                    #[allow(unused_comparisons)]
+                    let is_src_signed = #repr_ty::MIN < 0;
+                    #[allow(unused_comparisons)]
+                    let is_dst_signed = dst_min < 0;
+
+                    if is_src_signed && is_dst_signed {
+                        // Casting from a signed value to `i128` does not overflow since
+                        // `i128` is the largest signed primitive integer type.
+                        (d as #qualified_i128) >= (dst_min as #qualified_i128)
+                            && (d as #qualified_i128) <= (dst_max as #qualified_i128)
+                    } else if is_src_signed && !is_dst_signed {
+                        // Casting from a signed value greater than 0 to `u128` does not
+                        // overflow since `u128::MAX` is greater than `i128::MAX`.
+                        d >= 0 && (d as #qualified_u128) <= (dst_max as #qualified_u128)
+                    } else {
+                        // Casting from an unsigned value to `u128` does not overflow since
+                        // `u128` is the largest unsigned primitive integer type.
+                        (d as #qualified_u128) <= (dst_max as #qualified_u128)
+                    }
+                }
+
+                #(#variant_fits)*
+            };
+        }
+    }
+}
+
+enum ValidTy {
+    Bounded(Bounded),
+    Primitive(Ident),
+}
+
+impl ValidTy {
+    fn emit_min(&self) -> TokenStream {
+        match self {
+            Self::Bounded(inner) => inner.emit_min(),
+            Self::Primitive(ident) if ident == "bool" => {
+                ::quote::quote! { 0 }
+            }
+            qualified @ Self::Primitive(_) => ::quote::quote! { #qualified::MIN },
+        }
+    }
+
+    fn emit_max(&self) -> TokenStream {
+        match self {
+            Self::Bounded(inner) => inner.emit_max(),
+            Self::Primitive(ident) if ident == "bool" => {
+                ::quote::quote! { 1 }
+            }
+            qualified @ Self::Primitive(_) => ::quote::quote! { #qualified::MAX },
+        }
+    }
+}
+
+impl ::quote::ToTokens for ValidTy {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        match self {
+            Self::Bounded(inner) => inner.to_tokens(tokens),
+            Self::Primitive(ident) => {
+                let qualified_name: syn::Path = parse_quote! { ::core::primitive::#ident };
+                qualified_name.to_tokens(tokens)
+            }
+        }
+    }
+}
+
+impl fmt::Display for ValidTy {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            Self::Bounded(inner) => inner.fmt(f),
+            Self::Primitive(ident) => ident.fmt(f),
+        }
+    }
+}
+
+struct Bounded {
+    base_ty: Ident,
+    bits: LitInt,
+}
+
+impl Bounded {
+    const NAME: &'static str = "Bounded";
+    const QUALIFIED_NAME: &'static str = "::kernel::num::Bounded";
+
+    fn emit_new(&self, expr: &Expr) -> TokenStream {
+        let Self { base_ty, bits, .. } = self;
+        let qualified_name: syn::Path = parse_str(Self::QUALIFIED_NAME).expect("valid path");
+        ::quote::quote! {
+            #qualified_name::<#base_ty, #bits>::new::<{ #expr }>()
+        }
+    }
+
+    fn emit_qualified_base_ty(&self) -> TokenStream {
+        let base_ty = &self.base_ty;
+        ::quote::quote! { ::core::primitive::#base_ty }
+    }
+
+    fn emit_min(&self) -> TokenStream {
+        let bits = &self.bits;
+        let base_ty = self.emit_qualified_base_ty();
+        ::quote::quote! { #base_ty::MIN >> (#base_ty::BITS - #bits) }
+    }
+
+    fn emit_max(&self) -> TokenStream {
+        let bits = &self.bits;
+        let base_ty = self.emit_qualified_base_ty();
+        ::quote::quote! { #base_ty::MAX >> (#base_ty::BITS - #bits) }
+    }
+}
+
+impl ::quote::ToTokens for Bounded {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        let bits = &self.bits;
+        let base_ty = self.emit_qualified_base_ty();
+        let qualified_name: syn::Path = parse_str(Self::QUALIFIED_NAME).expect("valid path");
+
+        tokens.extend(::quote::quote! {
+            #qualified_name<#base_ty, #bits>
+        });
+    }
+}
+
+impl fmt::Display for Bounded {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        write!(f, "{}<{}, {}>", Self::NAME, self.base_ty, self.bits)
+    }
+}
+
+fn validate_type(ty: &Type) -> syn::Result<ValidTy> {
+    let Type::Path(type_path) = ty else {
+        return Err(make_err(ty));
+    };
+
+    let TypePath { qself, path } = type_path;
+    if qself.is_some() {
+        return Err(make_err(ty));
+    }
+
+    let syn::Path {
+        leading_colon,
+        segments,
+    } = path;
+    if leading_colon.is_some() || segments.len() != 1 {
+        return Err(make_err(ty));
+    }
+
+    let segment = &path.segments[0];
+    if segment.ident == Bounded::NAME {
+        return validate_bounded(segment);
+    } else {
+        return validate_primitive(&segment.ident);
+    }
+
+    fn make_err(ty: &Type) -> syn::Error {
+        let msg = format!(
+            "expected unqualified form of `bool`, primitive integer type, or `{}<T, N>`",
+            Bounded::NAME,
+        );
+        syn::Error::new_spanned(ty, msg)
+    }
+}
+
+fn validate_bounded(path_segment: &PathSegment) -> syn::Result<ValidTy> {
+    let PathSegment { ident, arguments } = path_segment;
+    return match arguments {
+        PathArguments::AngleBracketed(inner) if ident == Bounded::NAME => {
+            let AngleBracketedGenericArguments {
+                colon2_token, args, ..
+            } = inner;
+
+            if colon2_token.is_some() {
+                return Err(make_outer_err(path_segment));
+            }
+
+            if args.len() != 2 {
+                return Err(make_outer_err(path_segment));
+            }
+
+            let (base_ty, bits) = (&args[0], &args[1]);
+            let GenericArgument::Type(Type::Path(base_ty_lowered)) = base_ty else {
+                return Err(make_base_ty_err(base_ty));
+            };
+
+            if base_ty_lowered.qself.is_some() {
+                return Err(make_base_ty_err(base_ty));
+            }
+
+            let Some(base_ty_ident) = base_ty_lowered.path.get_ident() else {
+                return Err(make_base_ty_err(base_ty));
+            };
+
+            if !is_valid_primitive(base_ty_ident) {
+                return Err(make_base_ty_err(base_ty));
+            }
+
+            let GenericArgument::Const(Expr::Lit(ExprLit {
+                lit: Lit::Int(bits),
+                ..
+            })) = bits
+            else {
+                return Err(syn::Error::new_spanned(bits, "expected integer literal"));
+            };
+
+            let bounded = Bounded {
+                base_ty: base_ty_ident.clone(),
+                bits: bits.clone(),
+            };
+            Ok(ValidTy::Bounded(bounded))
+        }
+        _ => Err(make_outer_err(path_segment)),
+    };
+
+    fn make_outer_err(path_segment: &PathSegment) -> syn::Error {
+        let msg = format!("expected `{0}<T, N>` (e.g., {0}<u8, 4>)", Bounded::NAME);
+        syn::Error::new_spanned(path_segment, msg)
+    }
+
+    fn make_base_ty_err(base_ty: &GenericArgument) -> syn::Error {
+        let msg = "expected unqualified form of primitive integer type";
+        syn::Error::new_spanned(base_ty, msg)
+    }
+}
+
+fn validate_primitive(ident: &Ident) -> syn::Result<ValidTy> {
+    if is_valid_primitive(ident) {
+        return Ok(ValidTy::Primitive(ident.clone()));
+    }
+    let msg =
+        format!("expected `bool` or primitive integer type (e.g., `u8`, `i8`), found {ident}");
+    Err(syn::Error::new(ident.span(), msg))
+}
+
+fn is_valid_primitive(ident: &Ident) -> bool {
+    matches!(
+        ident.to_string().as_str(),
+        "bool"
+            | "u8"
+            | "u16"
+            | "u32"
+            | "u64"
+            | "u128"
+            | "usize"
+            | "i8"
+            | "i16"
+            | "i32"
+            | "i64"
+            | "i128"
+            | "isize"
+    )
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 24f96feaeb34..1faeebc0de4b 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -15,6 +15,7 @@
 #![cfg_attr(not(CONFIG_RUSTC_HAS_SPAN_FILE), feature(proc_macro_span))]
 
 mod concat_idents;
+mod convert;
 mod export;
 mod fmt;
 mod for_lt;
@@ -26,7 +27,10 @@
 
 use proc_macro::TokenStream;
 
-use syn::parse_macro_input;
+use syn::{
+    parse_macro_input,
+    DeriveInput, //
+};
 
 /// Declares a kernel module.
 ///
@@ -537,3 +541,171 @@ pub fn ForLt(input: TokenStream) -> TokenStream {
 pub fn CovariantForLt(input: TokenStream) -> TokenStream {
     for_lt::covariant_for_lt(parse_macro_input!(input)).into()
 }
+
+/// A derive macro for providing an implementation of the [`Into`] trait.
+///
+/// This macro automatically derives the [`Into`] trait for a given enum by generating
+/// the relevant [`From`] implementation. Currently, it only supports [unit-only enum]s.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// - Unlike its name suggests, the macro actually generates [`From`] implementations
+///   which automatically provide corresponding [`Into`] implementations.
+///
+/// - The macro uses the `into` custom attribute or `repr` attribute to generate [`From`]
+///   implementations. `into` always takes precedence over `repr`.
+///
+/// - Currently, the macro does not support `repr(C)` fieldless enums since the actual
+///   representation of discriminants is defined by rustc internally, and documentation
+///   around it is not yet settled. See [Rust issue #124403] and [Rust PR #147017]
+///   for more information.
+///
+/// - The macro generates a compile-time assertion for every variant to ensure its
+///   discriminant value fits within the type being converted into.
+///
+/// [Rust issue #124403]: https://github.com/rust-lang/rust/issues/124403
+/// [Rust PR #147017]: https://github.com/rust-lang/rust/pull/147017
+///
+/// # Supported types in `#[into(...)]`
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
+/// the macro implements `From<Foo>` for `isize`:
+///
+/// [repr-rust]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+///
+/// ```
+/// use kernel::macros::Into;
+///
+/// #[derive(Debug, Default, Into)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(0_isize, Foo::A.into());
+/// assert_eq!(0x7_isize, Foo::B.into());
+/// ```
+///
+/// ## With `#[repr(T)]`
+///
+/// The macro implements `From<Foo>` for `T`:
+///
+/// ```
+/// use kernel::macros::Into;
+///
+/// #[derive(Debug, Default, Into)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x7,
+/// }
+///
+/// assert_eq!(0_u8, Foo::A.into());
+/// assert_eq!(0x7_u8, Foo::B.into());
+/// ```
+///
+/// ## With `#[into(...)]`
+///
+/// The macro implements `From<Foo>` for each `T` specified in `#[into(...)]`,
+/// which always overrides `#[repr(...)]`:
+///
+/// ```
+/// use kernel::{
+///     macros::Into,
+///     num::Bounded, //
+/// };
+///
+/// #[derive(Debug, Default, Into)]
+/// #[into(bool, i16, Bounded<u8, 4>)]
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
+/// assert_eq!(0_i16, Foo::A.into());
+/// assert_eq!(1_i16, Foo::B.into());
+///
+/// let foo_a: Bounded<u8, 4> = Foo::A.into();
+/// let foo_b: Bounded<u8, 4> = Foo::B.into();
+/// assert_eq!(Bounded::<u8, 4>::new::<0>(), foo_a);
+/// assert_eq!(Bounded::<u8, 4>::new::<1>(), foo_b);
+/// ```
+///
+/// ## Compile-time Overflow Assertion
+///
+/// The following examples do not compile:
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// #[derive(Into)]
+/// #[into(u8)]
+/// enum Foo {
+///     // `256` is larger than `u8::MAX`.
+///     A = 256,
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// #[derive(Into)]
+/// #[into(u8)]
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
+/// # use kernel::macros::Into;
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(Into)]
+/// enum Foo {
+///     A(u8),
+///     B { inner: u8 },
+/// }
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// // Structs are not allowed.
+/// #[derive(Into)]
+/// struct Foo(u8);
+/// ```
+///
+/// ```compile_fail
+/// # use kernel::macros::Into;
+/// // `repr(C)` enums are not allowed.
+/// #[derive(Into)]
+/// #[repr(C)]
+/// struct Foo(u8);
+/// ```
+#[proc_macro_derive(Into, attributes(into))]
+pub fn derive_into(input: TokenStream) -> TokenStream {
+    let input = parse_macro_input!(input as DeriveInput);
+    convert::derive_into(input)
+        .unwrap_or_else(syn::Error::into_compile_error)
+        .into()
+}
-- 
2.50.1 (Apple Git-155)

